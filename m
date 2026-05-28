Received: from out28-196.mail.aliyun.com (out28-196.mail.aliyun.com [115.124.28.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC131327D;
	Thu, 28 May 2026 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940750; cv=none; b=XUE/LgE+QgfMV4/4j4oiZWT9h4/Mn4G5cW6hCsjhOOOINnqb9eGYkvhfVzcEco8vVhYFNRoD9GdggVNHmHGqS/kPSZLCCRSadtSHk6h4BwOZLS2T5yzPFbMrfyt76iO+uKlPu0E4X7bebGgvTYmO1HHJko2gWijePiiUymVHfvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940750; c=relaxed/simple;
	bh=Ln/9CngqrVyl294T205TovUdUhW8j+gmNlh7b6KC0Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBWZ32YkYqNgLyFBm0qHRdLbETTwcITKAkIxuNQ3Uy2O4iWuj0PH/vMFfc55PNdGmBU21pOjZCYd/rbiQvQ1Yr8MLhzTRAfqQGHPMKjAqE8Dq7T2lDYglku+hdtUbIHBZtfkR9+abuZ9g0wX3Te8KBYfFnxfWDSBteWXW3uH0IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0745184|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0030461-0.000431533-0.996522;FP=6929155660541054527|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033068005250;MF=shiaichun@open-hieco.net;NM=1;PH=DS;RN=6;RT=6;SR=0;TI=SMTPD_---.hieeC.r_1779940417;
Received: from localhost.localdomain(mailfrom:shiaichun@open-hieco.net fp:SMTPD_---.hieeC.r_1779940417 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 11:53:41 +0800
From: Aichun Shi <shiaichun@open-hieco.net>
To: yazen.ghannam@amd.com,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shiaichun@open-hieco.net
Subject: [RFC PATCH v2 07/11] ras/amd/atl: Add Hygon DF discovery and MCA decode at initialization
Date: Thu, 28 May 2026 11:52:41 +0800
Message-ID: <20260528035246.526012-8-shiaichun@open-hieco.net>
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

Add node number bounds, Data Fabric discovery and UMC MCA to system
address decoder for Hygon while keeping the AMD path unchanged.
Address translation function is exported by
amd_convert_umc_mca_addr_to_sys_addr() and used by users such as EDAC.

- Use is_hygon_f18h() directly to guard Hygon-specific paths in
  amd_atl_init() and __df_indirect_read(); use hygon_cdd_num() as
  the Hygon node count.
- Call hygon_get_df_system_info() to get Hygon-specific Data Fabric
  system information.
- Register hygon_convert_umc_mca_addr_to_sys_addr() as the address
  translation decoder for Hygon.

Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
---
 drivers/ras/amd/atl/access.c |  8 +++++++-
 drivers/ras/amd/atl/core.c   | 20 +++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/amd/atl/access.c b/drivers/ras/amd/atl/access.c
index c2334f8f9add..32c97de35c20 100644
--- a/drivers/ras/amd/atl/access.c
+++ b/drivers/ras/amd/atl/access.c
@@ -68,9 +68,15 @@ static int __df_indirect_read(u16 node, u8 func, u16 reg, u8 instance_id, u32 *l
 	struct pci_dev *F4;
 	int err = -ENODEV;
 	u32 ficaa = 0;
+	u16 num_nodes;
 
 	node = get_accessible_node(node);
-	if (node >= amd_nb_num()) {
+	if (is_hygon_f18h())
+		num_nodes = hygon_cdd_num();
+	else
+		num_nodes = amd_nb_num();
+
+	if (node >= num_nodes) {
 		pr_debug("Node %u is out of bounds\n", node);
 		goto out;
 	}
diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index b7083588b46e..ab01813eda29 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -195,22 +195,36 @@ MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
 static int __init amd_atl_init(void)
 {
 	int ret;
+	u16 num_nodes;
 
 	if (!x86_match_cpu(amd_atl_cpuids))
 		return -ENODEV;
 
-	if (!amd_nb_num())
+	if (is_hygon_f18h())
+		num_nodes = hygon_cdd_num();
+	else
+		num_nodes = amd_nb_num();
+
+	if (!num_nodes)
 		return -ENODEV;
 
 	check_for_legacy_df_access();
 
-	ret = get_df_system_info();
+	if (is_hygon_f18h())
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
+	if (is_hygon_f18h())
+		amd_atl_register_decoder(hygon_convert_umc_mca_addr_to_sys_addr);
+	else
+		amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
-- 
2.47.3

