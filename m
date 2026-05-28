Received: from out198-27.us.a.mail.aliyun.com (out198-27.us.a.mail.aliyun.com [47.90.198.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DC0306B37;
	Thu, 28 May 2026 03:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940437; cv=none; b=EEJUu0XYezIrmQRFwSE9+zXbFfURjDz1GALXPMy/deYD+YWTzmb2hKg8kvWvreY8YTlCBJ4uNm4daBpmzPjlfR3Fbz5RfX495EuF2xTf6SmB83/0kFbZrYtAuFZjyhgtl9vIs02FC2/X5PQuBizsr/qOZuvgMi6MKa+LobQJ8mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940437; c=relaxed/simple;
	bh=PIQTNLHxXCN1tndkapHFgbMOn794d2O9245/lmy28bM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYEjQcqa9IhTBWae1IWCoL9BhE0bbm6A9r6zeP85bobgk1komjDeN1k7cOVlScwGdFCqS23J8twCzdJUoJun2bY/9eLFgbnbhaH2992NsgzXko11iRPrPR1cOtLnbDvxs2bjsRCXJSa3HO1XQanmniFwwth3QXQ2p2wB5ZIaiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436652|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00302477-0.000264186-0.996711;FP=13694441621964164283|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033032023038;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeBxX_1779940414;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeBxX_1779940414 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:37 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 06/11] ras/amd/atl: Add Hygon UMC MCA to system address conversion support
Date: Thu, 28 May 2026 11:52:40 +0800
Message-ID: <20260528035246.526012-7-shiaichun@open-hieco.net>
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

Prepare hygon_convert_umc_mca_addr_to_sys_addr() to be registered by
amd_atl_register_decoder() in amd_atl_init() later.

- Add hygon/umc.c for Hygon-specific implementation similar to umc.c for
  AMD.
- Add hygon_convert_umc_mca_addr_to_sys_addr() to call
  hygon_norm_to_sys_addr() to do the address translation process.
- Use hygon_cpu_to_df_node() to map the CPU to a contiguous DF node
  index; propagate -errno on failure.
- Build hygon/umc.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile    |  1 +
 drivers/ras/amd/atl/hygon/umc.c | 44 +++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/ras/amd/atl/hygon/umc.c

diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
index 0a42f2cbabc4..9d65e215b87a 100644
--- a/drivers/ras/amd/atl/Makefile
+++ b/drivers/ras/amd/atl/Makefile
@@ -20,6 +20,7 @@ amd_atl-y		+= hygon/dehash.o
 amd_atl-y		+= hygon/denormalize.o
 amd_atl-y		+= hygon/map.o
 amd_atl-y		+= hygon/system.o
+amd_atl-y		+= hygon/umc.o
 
 amd_atl-$(CONFIG_AMD_ATL_PRM) += prm.o
 
diff --git a/drivers/ras/amd/atl/hygon/umc.c b/drivers/ras/amd/atl/hygon/umc.c
new file mode 100644
index 000000000000..0f064dd22bcc
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/umc.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library (for hygon)
+ *
+ * umc.c : Unified Memory Controller (UMC) topology helpers for Hygon
+ *
+ * Author: Aichun Shi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+static int hygon_get_die_id(struct atl_err *err)
+{
+	return hygon_cpu_to_df_node(err->cpu);
+}
+
+#define HYGON_IPID_SUB_CHANNEL_MASK	BIT(13)
+static u8 hygon_get_ipid_sub_channel(struct atl_err *err)
+{
+	return FIELD_GET(HYGON_IPID_SUB_CHANNEL_MASK, err->ipid);
+}
+
+#define HYGON_UMC_CHANNEL_NUM	GENMASK(23, 20)
+static u8 hygon_get_coh_st_inst_id(struct atl_err *err)
+{
+	return FIELD_GET(HYGON_UMC_CHANNEL_NUM, err->ipid);
+}
+
+unsigned long hygon_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
+{
+	u8 socket_id = topology_physical_package_id(err->cpu);
+	u8 coh_st_inst_id = hygon_get_coh_st_inst_id(err);
+	int die_id = hygon_get_die_id(err);
+	u8 sub_channel = hygon_get_ipid_sub_channel(err);
+
+	if (die_id < 0)
+		return die_id;
+
+	pr_debug("socket_id=0x%x die_id=0x%x coh_st_inst_id=0x%x addr=0x%016llx",
+		 socket_id, die_id, coh_st_inst_id, err->addr);
+
+	return hygon_norm_to_sys_addr(socket_id, die_id, coh_st_inst_id,
+				      sub_channel, err->addr);
+}
-- 
2.47.3

