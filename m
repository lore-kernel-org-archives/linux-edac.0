Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D678A30FF30;
	Sat, 14 Feb 2026 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771051703; cv=none; b=twtSjOXILVA49kkoPVayo4VbwnPIUvHLAnnQITVLM6M0PEYrKy4jeGIRoY3TGDJpArzhJYX6yAooZi74j7tUwE6hCe92npSQ9or9GzWcjQ5eCFnm9EnOwPJUbdAUiEucygv/TkLchjbP+LJY4by8rtB8eYwf9O5gOt43wBjn2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771051703; c=relaxed/simple;
	bh=FxZk7KIYWWr1J7nfsvlVvAmNjHbQQUjN8XBbwufUIig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GlXFlN2rX0eaPwYWq4lBUxeJgQwK8WAyTkO3UomWIX++bRxjvfqoYhqSef86rWnWzpO7oQ5Z/0bkSXsUFF2bD7mODYX+uUbjsAk582pip4ZVJlXhqgp7Y97uwl1KyX9papkRoVw30hhsEi3YQ8nUDGj0DNIgFv2SAcumxWJTqho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.gX9s-M2_1771051350 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 14 Feb 2026 14:42:49 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [PATCH] EDAC/mce_amd: Fix Hygon UMC ECC error decoding with logical_die_id
Date: Sat, 14 Feb 2026 14:42:03 +0800
Message-ID: <20260214064203.62488-1-shiaichun@open-hieco.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpuinfo_topology.amd_node_id is populated via CPUID or MSR, as introduced
by commit f7fb3b2dd92c ("x86/cpu: Provide an AMD/HYGON specific topology
parser") and commit 03fa6bea5a3e ("x86/cpu: Make topology_amd_node_id()
use the actual node info"). However, this value may be non-continuous for
Hygon processors while EDAC uses continuous node IDs, which leads to
incorrect UMC ECC error decoding.

In contract, cpuinfo_topology.logical_die_id always provides continuous
die (or node) IDs. Fix this by replacing topology_amd_node_id() with
topology_logical_die_id() when decoding UMC ECC errors for Hygon
processors.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/edac/mce_amd.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index af3c12284a1e..4a23c1d6488e 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -746,8 +746,13 @@ static void decode_smca_error(struct mce *m)
 	pr_emerg(HW_ERR "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
 
 	if ((bank_type == SMCA_UMC || bank_type == SMCA_UMC_V2) &&
-	    xec == 0 && decode_dram_ecc)
-		decode_dram_ecc(topology_amd_node_id(m->extcpu), m);
+	    xec == 0 && decode_dram_ecc) {
+		if (boot_cpu_data.x86_vendor == X86_VENDOR_HYGON &&
+		    boot_cpu_data.x86 == 0x18)
+			decode_dram_ecc(topology_logical_die_id(m->extcpu), m);
+		else
+			decode_dram_ecc(topology_amd_node_id(m->extcpu), m);
+	}
 }
 
 static inline void amd_decode_err_code(u16 ec)
-- 
2.47.3

