Received: from out198-22.us.a.mail.aliyun.com (out198-22.us.a.mail.aliyun.com [47.90.198.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5CB3126D0;
	Thu, 28 May 2026 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940450; cv=none; b=Z8/dycBYavD6OBmnlJl73Tk8FPzwug8QB1Ofmn2EpC3QO4Ho9grcpqFX931ufQSLRr//3VV313VNjnTh9lrIppdbJfKzOBPpU/O2nFcsN89lDBMA3yDTprgzDWq98mmv7bPFl15z/tBu1I6g0slQl4QhRUuMbfO4Rd5QEKjU+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940450; c=relaxed/simple;
	bh=stguw2RtEW5fKiw22OpkQyFhblUjUm8mZDxUGSHT/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiIKFdao2LepOIWObOydI3dq8+zhNTa6CrlA3jVoymXk18brfpKSB+Rs2M/kG0UsISzIdhExv0yCCx3IsCfNNjYn3/JFTL+gsv1dtFsl26c9WY7+XecTWo6CW2UjynwgG9L7FuEF1u70YsTyQcNc3k/Oi8gp/1pt9hJ7FkqYHKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1322343|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00720156-6.86753e-05-0.99273;FP=6361688190859692242|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeCFG_1779940432;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeCFG_1779940432 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:55 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 11/11] EDAC/amd64: Harden Hygon Family 0x18 UMC SMN base against bad DFID
Date: Thu, 28 May 2026 11:52:45 +0800
Message-ID: <20260528035246.526012-12-shiaichun@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528035246.526012-1-shiaichun@open-hieco.net>
References: <20260528035246.526012-1-shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hygon_get_umc_base() uses hygon_get_dfid() to place the UMC register
block on compute dies (DFID >= 4).  On read failure the DFID was left
uninitialized, and DFID < 4 (I/O die) would underflow (df_id - 4) and
produce a bogus SMN window.

Validate NB misc, check hygon_get_dfid() return, and reject DFID < 4
with a warning; fall back to the default UMC base without the Hygon
offset. Use unsigned arithmetic to avoid signed integer overflow when
computing the base offset for DFID values >= 12.

- Define HYGON_CDD_DFID_BASE in hygon_edac.c with a TODO noting it will
  move to <asm/hygon/node.h> in Hygon Node RFC next version.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/edac/hygon_edac.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/hygon_edac.c b/drivers/edac/hygon_edac.c
index 92504edac1f9..f4d25841fecd 100644
--- a/drivers/edac/hygon_edac.c
+++ b/drivers/edac/hygon_edac.c
@@ -11,29 +11,55 @@
  */
 
 #include <linux/pci.h>
-#include <asm/amd/nb.h>
 #include <asm/hygon/node.h>
 
 #include "amd64_edac.h"
 #include "hygon_edac.h"
 
+/*
+ * TODO: Will move to <asm/hygon/node.h> in Hygon Node RFC next version.
+ */
+/* Hygon compute dies (CDD) start at DFID 4; IO dies occupy DFIDs 0-3. */
+#define HYGON_CDD_DFID_BASE	4
+
 /*
  * Hygon Family 0x18 models 0x4-0x8: UMC config is behind an SMN window derived
  * from the compute-die DFID.
  */
 u32 hygon_get_umc_base(struct amd64_pvt *pvt, u8 channel)
 {
-	struct amd_northbridge *nb = node_to_amd_nb(pvt->mc_node_id);
+	u8 df_id = 0;
+	int ret;
 	u32 base = get_umc_base(channel);
-	u8 df_id;
 
 	if (!hygon_f18h_model_in_range(0x4, 0x8))
 		return base;
 
-	if (hygon_get_dfid(nb->misc, &df_id))
+	if (!pvt->F3) {
+		amd64_warn("Hygon: no DF misc for MC node %u, using default UMC base\n",
+			   pvt->mc_node_id);
+		return base;
+	}
+
+	ret = hygon_get_dfid(pvt->F3, &df_id);
+	if (ret) {
+		amd64_warn("Hygon: hygon_get_dfid failed for %s (node %u): %d, using default UMC base\n",
+			   pci_name(pvt->F3), pvt->mc_node_id, ret);
 		return base;
+	}
+
+	/*
+	 * UMCs exist only on compute dies (CDD), DFID >= HYGON_CDD_DFID_BASE.
+	 * I/O dies use DFID < HYGON_CDD_DFID_BASE; the UMC base offset
+	 * calculation must not run on I/O dies.
+	 */
+	if (df_id < HYGON_CDD_DFID_BASE) {
+		amd64_warn("Hygon: DFID %u on %s (node %u) is not a compute die, using default UMC base\n",
+			   df_id, pci_name(pvt->F3), pvt->mc_node_id);
+		return base;
+	}
 
-	return base + (0x80000000U + (0x10000000U * (df_id - 4)));
+	return base + (0x80000000U + (0x10000000U * (df_id - HYGON_CDD_DFID_BASE)));
 }
 
 /*
-- 
2.47.3

