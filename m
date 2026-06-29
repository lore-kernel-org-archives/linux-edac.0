Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013050.outbound.protection.outlook.com [40.93.196.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E74425CEE;
	Mon, 29 Jun 2026 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745672; cv=fail; b=mM00UcURAyl0PdcjxpWWiUHXNzk8F7lAUcSmxphKsaNRKH16qRL/AJv6VFQgLKhBRNVh8Q+J8YH4jdhL0FYC/VAfdV/lNrsSpksbLUXF9uRMZ/iuTy7p+Dd24PPi4qTTXGdqK7FDlhP6qELLR5AwToE8WcTinKR/7+y9wUj1Bgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745672; c=relaxed/simple;
	bh=2h5JK8Gwnmxdnts073JkuZlwG7hKCV3WdTAund43Kyk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQ6oJ193HLMYicBccU5hocpEOenui+4qOXMNsYYzC53/R4MRkCyvH1ez/35kAhEfiLyuh0czB1hnDpHtAZRslRjdtfaWdkT3GwFtskPAXTRV+Xz4lgBaZqVUnLYWo1MmSVphcTPA48Uc1IWzxbT+YEcP1CAoEriW220jmFl0OR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RgNES+tL; arc=fail smtp.client-ip=40.93.196.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RgNES+tL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Or9loVd9j6pKYuOlKcmDavrljy3UseZdfirQenGyEZ4IWK9BaRw21IzC3SR/n1T/TkZTmpza/MfQFvWjm8vfHkxfxdCMhgack7NJePxVRFWEC8O0Ox2D5IhCRs2qvCqoZZxoWEFbSlDdmDXXmBE9cGv7KNgMRbfJMC6yurvl3nysRc1W/Cpg00Z+ylXEO1BAKfpKDRaEH7y1bQ9lyew9YPN6SyFNWJFumYsgZnLnKcBBWdY+zNrB7i0NePOeD3maLD8AqinQt+pxBpBtN8/rcDDe3bS5PIX5tCQi3YkgvfeFfZV20aZW3oLr2i8aMFUZo+Py7IHgQBWOD30K5xrzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMSI8jv8a27sTC92NnItDNxSCHLdTFDtanH3KFBt2x8=;
 b=oEu+0mnB+TF79qEPit09PIlTaSqFn1ZXqrkeBwiRlxZz5GHhdX2sjRYlpI2CeYhIRVUyfYdZuxMa4R9/MEKk+cgBnOO16nLnWj5Q71qMTN+lDLcnasYyz8ZSi+9i5DYbP+IyTQ3mqG137cjQcSb/wxZhydCaEw6nR1MUI8eMfofXQizsI+ZnU8hr4kzUZPLH+uIjzz7Zd8CXxvBQxx1akOq+DrUHR8GegtacRchtamvHgQJ1Cx7oQkUXVgokw5HjJjF8nweaLpBZGK3u2o9MgikyED0bt/SzC8z4fZH1+cT7lPjmCGzMeG1ieEOM17H9Oqu1S4m9ghSRObBEpV1S2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMSI8jv8a27sTC92NnItDNxSCHLdTFDtanH3KFBt2x8=;
 b=RgNES+tLv5JeGvo31CjGvEjO6QjcLpm1qCx/eTeGxowIoN9DT/ffL0VPbsAO4CP2ZXUYS46/RqImEaq4T6dB0hs9wd+jyE50KlCLElUdZ0lbklT3PnAl+p2badnJkmubHibQbUK7rxl20m8XcXesw99WTPgWZOo7N6C4CqWA7oo=
Received: from DS1PR02CA0024.namprd02.prod.outlook.com (2603:10b6:8:44a::10)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:07:46 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:44a:cafe::49) by DS1PR02CA0024.outlook.office365.com
 (2603:10b6:8:44a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 15:07:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 15:07:44 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 10:07:43 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>, "Yazen
 Ghannam" <yazen.ghannam@amd.com>
Subject: [PATCH v6 1/3] EDAC: Remove fake_inject debugfs interface
Date: Mon, 29 Jun 2026 11:07:29 -0400
Message-ID: <20260629150731.1009605-2-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629150731.1009605-1-yazen.ghannam@amd.com>
References: <20260629150731.1009605-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bb8a6f-494e-4db5-f545-08ded5f02c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TRjKxPQfBYyaEM9Yc0IPzEXH3gJ9v+5IWk87ACccaWYFW2JMpMhaYQh622ggyk1zfsRfpZMubjbnwt5Crk3/JbCtNhtna58/qPkv1npLNoJsBkiHQmrC95v0WjV30N3wqyuD5v4kK5Zf+YZ2+vWoABoJtJx3SLPBIq7lU12ufthYGOHlIhcXDGeoho9vAmAHNRQny16gnK0Sjk13FCEdjSwQZagSitqzIdyJiaZ3Kz64MLUuIhLNOwIx5y2GqPSUWGp1d13mWqkjxFYVoznA2r4zxC1FPJtlmJFTMpPbnT4j0JLuavGfNHv9FMRS0wYK80PgjHtzHZ9DFfXVq68CR1QLe6mQf00vhRgJncGflj8tti3F1jU4pJmC9i8ar5+nc5vFcipYJdY0nFR743xkUdX/GIbAa8YlDKhpRJrqmhAjy8CtAwJapVPfXVbXoz0vsF9CxY8xWJ3++WIi8gX8sFxf0KAn48sAkVbghjxRz4FAtZ213EnYVJIEAj2MDdz9CuuMbP6Kq1etvXM+mOOde9Z5AddT9Mn2VSLMwQ6gez91ALG9J+uBy2mBpk7zxEtdoHQDBRUddtlExlXBFJMGWM20Vt3brRTm1SYXnPkyI7uBttuXA6Sw2xHAUmAHn7It1JqHsmt6UhRH4jG+shZxhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G6bvaSTX7Y+L+cHfDtk/XRovv1B8Pba6WW21G42sRDzBfXlqAOJ/HUMuv4+nSREHOBEy/DBqocCf77SP30A5Cu+LTXUO0D3dYOxg365VEutYsnQk1tt0mDprxZx+v8qJ/GERVtov8BaeI+A4C3Dyd/PgEcgy6gWKP1wUy3AOpIyXEDUzqztE1cHbda9FfTeFTJ3Dk6B9492qXXdLDoYsfcXE7mb9eeEHKrNaJub3HoRd5cBGR30FevAgSVIAErjcx4B8f/LWlU7Tj8xxwdvzCSe3juJnMR/W3r+0cHRkjXaqZ6LcvjgA4GoKwvGqdXvNgIDTvYrzpki2pT+Z5nMmstWTCNQcyXveega5ftk4O5Fqlg0nz5dtWNX4JNI6DJ9saxMMlOpu4WoycKRu/PJco3GrbJv9BVj5cAUBEDMhukoxCv/oWzg84h+Wb/xq2zrc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:07:44.9029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bb8a6f-494e-4db5-f545-08ded5f02c8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224

The interface has a potential race condition between a real and fake
error when updating the memory controller's error descriptor.

There doesn't seem to be an active user base for this interface, so
remove it.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260518160716.171578-1-yazen.ghannam%40amd.com
Suggested-by: Borislav Petkov <bp@alien8.de>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Link: https://lore.kernel.org/linux-edac/20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local/
---
 drivers/edac/debugfs.c | 65 +-----------------------------------------
 include/linux/edac.h   |  3 --
 2 files changed, 1 insertion(+), 67 deletions(-)

diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
index 8195fc9c9354..447d0c620082 100644
--- a/drivers/edac/debugfs.c
+++ b/drivers/edac/debugfs.c
@@ -1,50 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-#include <linux/string_choices.h>
-
 #include "edac_module.h"
 
 static struct dentry *edac_debugfs;
 
-static ssize_t edac_fake_inject_write(struct file *file,
-				      const char __user *data,
-				      size_t count, loff_t *ppos)
-{
-	struct device *dev = file->private_data;
-	struct mem_ctl_info *mci = to_mci(dev);
-	static enum hw_event_mc_err_type type;
-	u16 errcount = mci->fake_inject_count;
-
-	if (!errcount)
-		errcount = 1;
-
-	type = mci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
-				   : HW_EVENT_ERR_CORRECTED;
-
-	printk(KERN_DEBUG
-	       "Generating %d %s fake error%s to %d.%d.%d to test core handling. NOTE: this won't test the driver-specific decoding logic.\n",
-		errcount,
-		(type == HW_EVENT_ERR_UNCORRECTED) ? "UE" : "CE",
-		str_plural(errcount),
-		mci->fake_inject_layer[0],
-		mci->fake_inject_layer[1],
-		mci->fake_inject_layer[2]
-	       );
-	edac_mc_handle_error(type, mci, errcount, 0, 0, 0,
-			     mci->fake_inject_layer[0],
-			     mci->fake_inject_layer[1],
-			     mci->fake_inject_layer[2],
-			     "FAKE ERROR", "for EDAC testing only");
-
-	return count;
-}
-
-static const struct file_operations debug_fake_inject_fops = {
-	.open = simple_open,
-	.write = edac_fake_inject_write,
-	.llseek = generic_file_llseek,
-};
-
 void __init edac_debugfs_init(void)
 {
 	edac_debugfs = debugfs_create_dir("edac", NULL);
@@ -57,29 +16,7 @@ void edac_debugfs_exit(void)
 
 void edac_create_debugfs_nodes(struct mem_ctl_info *mci)
 {
-	struct dentry *parent;
-	char name[80];
-	int i;
-
-	parent = debugfs_create_dir(mci->dev.kobj.name, edac_debugfs);
-
-	for (i = 0; i < mci->n_layers; i++) {
-		sprintf(name, "fake_inject_%s",
-			     edac_layer_name[mci->layers[i].type]);
-		debugfs_create_u8(name, S_IRUGO | S_IWUSR, parent,
-				  &mci->fake_inject_layer[i]);
-	}
-
-	debugfs_create_bool("fake_inject_ue", S_IRUGO | S_IWUSR, parent,
-			    &mci->fake_inject_ue);
-
-	debugfs_create_u16("fake_inject_count", S_IRUGO | S_IWUSR, parent,
-			   &mci->fake_inject_count);
-
-	debugfs_create_file("fake_inject", S_IWUSR, parent, &mci->dev,
-			    &debug_fake_inject_fops);
-
-	mci->debugfs = parent;
+	mci->debugfs = debugfs_create_dir(mci->dev.kobj.name, edac_debugfs);
 }
 
 /* Create a toplevel dir under EDAC's debugfs hierarchy */
diff --git a/include/linux/edac.h b/include/linux/edac.h
index e6b4e51130e5..f7a8218f9cc0 100644
--- a/include/linux/edac.h
+++ b/include/linux/edac.h
@@ -598,9 +598,6 @@ struct mem_ctl_info {
 	int op_state;
 
 	struct dentry *debugfs;
-	u8 fake_inject_layer[EDAC_MAX_LAYERS];
-	bool fake_inject_ue;
-	u16 fake_inject_count;
 
 	/*
 	 * Memory Controller hierarchy
-- 
2.53.0

