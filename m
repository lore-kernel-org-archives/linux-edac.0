Received: from out28-91.mail.aliyun.com (out28-91.mail.aliyun.com [115.124.28.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF71386438;
	Fri,  3 Apr 2026 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213953; cv=none; b=nYNqpGalJJRUIP7JNahGB0TjUSOwVrSMBqVTEMerSiwH/kpe0pSHIr7B4BHcrrBqfJSrogJt7tdEI6u/RgY95zlhaxOZppzk9lTMYIRVbjomVYKrqqa377j05oZwVk7GI/3kjTscxd8hfFNLmQfib+A7GHTWmVfBeJlynQsVjaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213953; c=relaxed/simple;
	bh=gEhL5KulDygzndxRO9gtRXHU1BzW0yqupQvoTGGx/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mW6yfFY81PyANTY2Mms8qya6kOpbFVVYelhOLI/SsNfIQc9NLE6poyTnThczqOTusoHhmj6jI/fhUq3LUgmNS7QTYmb/0ZhETYCBHJ8mckv0vA3t2PKrdDx0f//5/zdYwEj+rO06KDfH6G94diF6vbmYOrJRpxVvffL3/sRD/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07447811|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_alarm|0.00179982-0.000323617-0.997877;FP=8082075515846643263|2|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkM.c_1775213932;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkM.c_1775213932 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:58 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 07/10] ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
Date: Fri,  3 Apr 2026 18:57:31 +0800
Message-ID: <f3a4f4c3af118dbe34b3713d8ee46678b6dc8e89.1775213147.git.shiaichun@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775213147.git.shiaichun@open-hieco.net>
References: <cover.1775213147.git.shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node number bounds, Data Fabric discovery and UMC MCA to system
address decoder for Hygon while keeping the AMD path unchanged.
Address translation function is exported by
amd_convert_umc_mca_addr_to_sys_addr() and used by users such as EDAC.

- Add Hygon node number support in amd_atl_init(),
  amd_atl_exit() and __df_indirect_read().
- Call hygon_get_df_system_info() to get Hygon-specific Data Fabric
  system information.
- Register hygon_convert_umc_mca_addr_to_sys_addr() as the address
  translation decoder for Hygon.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/access.c |  9 ++++++++-
 drivers/ras/amd/atl/core.c   | 21 ++++++++++++++++++---
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/amd/atl/access.c b/drivers/ras/amd/atl/access.c
index c2334f8f9add..6d75bcb930d4 100644
--- a/drivers/ras/amd/atl/access.c
+++ b/drivers/ras/amd/atl/access.c
@@ -68,9 +68,16 @@ static int __df_indirect_read(u16 node, u8 func, u16 reg, u8 instance_id, u32 *l
 	struct pci_dev *F4;
 	int err = -ENODEV;
 	u32 ficaa = 0;
+	u16 num_nodes;
+	bool is_hygon = boot_cpu_data.x86_vendor == X86_VENDOR_HYGON;
 
 	node = get_accessible_node(node);
-	if (node >= amd_nb_num()) {
+	if (is_hygon)
+		num_nodes = amd_num_nodes();
+	else
+		num_nodes = amd_nb_num();
+
+	if (node >= num_nodes) {
 		pr_debug("Node %u is out of bounds\n", node);
 		goto out;
 	}
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index b7083588b46e..bbbbff4d43a3 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -195,22 +195,37 @@ MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
 static int __init amd_atl_init(void)
 {
 	int ret;
+	u16 num_nodes;
+	bool is_hygon = boot_cpu_data.x86_vendor == X86_VENDOR_HYGON;
 
 	if (!x86_match_cpu(amd_atl_cpuids))
 		return -ENODEV;
 
-	if (!amd_nb_num())
+	if (is_hygon)
+		num_nodes = amd_num_nodes();
+	else
+		num_nodes = amd_nb_num();
+
+	if (!num_nodes)
 		return -ENODEV;
 
 	check_for_legacy_df_access();
 
-	ret = get_df_system_info();
+	if (is_hygon)
+		ret = hygon_get_df_system_info();
+	else
+		ret = get_df_system_info();
+
 	if (ret)
 		return ret;
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
+
+	if (is_hygon)
+		amd_atl_register_decoder(hygon_convert_umc_mca_addr_to_sys_addr);
+	else
+		amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
-- 
2.47.3

