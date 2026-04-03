Received: from out28-112.mail.aliyun.com (out28-112.mail.aliyun.com [115.124.28.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE9D38837A;
	Fri,  3 Apr 2026 11:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775214263; cv=none; b=BClAQjg7TIpKd7/AFwnkX/CAY1ZkSQCS4C0zGmNd7bC42TuvZq/HpUn17+W2TcBlebFyLXwpVxlLaiY/fpWiBPE6s+nf3tfv6aucATNPyajG25g1mqQDxFe2Yf5mrpg8IZNUt/Z4B6aYiUO6QZQ1/wxR7ihkJWa4+Ix+zZYn4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775214263; c=relaxed/simple;
	bh=E6Y9H5TY61Dpvvtfw9KcdVpP+hn2qdNrNPx6jK5A3CE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJCyduPOrx0AO06nNtzW3MstSSXW8BBZIdt5bjs5FfcwolRJBZhZxvP3GPo0hlHpjJkZW8kaKNND1aj/jxcMrgj6wX10n54JIkeLrQeSv9Rfn1FcfoER6OTi4ESpVlIOCuwE7PbqXodkRK6sRB+l6aWXh6ftcMc4E7S+baLSxME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07437016|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_alarm|0.00255781-0.000254814-0.997187;FP=13694441896984677563|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068016216;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.h4TkLum_1775213925;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.h4TkLum_1775213925 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 03 Apr 2026 18:58:51 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com
Cc: tglx@linutronix.de,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH 06/10] ras/amd/atl: Add Hygon UMC MCA to system address conversion support
Date: Fri,  3 Apr 2026 18:57:30 +0800
Message-ID: <c9fb6003ed90496dd32666b452eb62de45b731e1.1775213147.git.shiaichun@open-hieco.net>
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

Prepare hygon_convert_umc_mca_addr_to_sys_addr() to be registered by
amd_atl_register_decoder() in amd_atl_init() later.

- Add hygon/umc.c for Hygon-specific implementation similar to umc.c for
  AMD.
- Add hygon_convert_umc_mca_addr_to_sys_addr() to call
  hygon_norm_to_sys_addr() to do the address translation process.
- Build hygon/umc.c from the Makefile as an amd_atl object.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/Makefile    |  1 +
 drivers/ras/amd/atl/hygon/umc.c | 46 +++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
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
index 000000000000..e2339db3f575
--- /dev/null
+++ b/drivers/ras/amd/atl/hygon/umc.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD Address Translation Library
+ *
+ * umc.c : Unified Memory Controller (UMC) topology helpers for Hygon
+ *
+ * Author: AichunShi <shiaichun@open-hieco.net>
+ */
+
+#include "../internal.h"
+
+static u8 hygon_get_die_id(struct atl_err *err)
+{
+	/*
+	 * For Hygon CPUs, amd_node_id can be non-contiguous, so get the Die
+	 * ID from the logical Die ID.
+	 */
+	return topology_logical_die_id(err->cpu);
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
+	u8 die_id = hygon_get_die_id(err);
+
+	pr_debug("socket_id=0x%x die_id=0x%x coh_st_inst_id=0x%x addr=0x%016llx",
+		 socket_id, die_id, coh_st_inst_id, err->addr);
+
+	u8 sub_channel = hygon_get_ipid_sub_channel(err);
+
+	return hygon_norm_to_sys_addr(socket_id, die_id, coh_st_inst_id,
+				      sub_channel, err->addr);
+}
-- 
2.47.3

