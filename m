Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795797553;
	b=BRah+K3z0nKYbGB2lu7Qr/XHgxqwsPng3valrZW8sD8AYBU9mMikn5oZ7mHbq6TZoSlr
	 cBGAWrLIZ9nY1ikW2DkAqz93rNwEN3ProzocbmdbAfnMmQRjvneMl6BKOh92d1zDH7+Dy
	 Q4trVIgx2OKk1/9p5mmCgUW3xuhI1KKVX1QBxwrOsHZ+wU8b15+dLmgEXFs8XSUGBUE/K
	 Zp7nXMCgnQLQcJfTiSsbM79Eyo/A9E/VQEQWhmHTyomiUEy6TtJ8q5pA/+YKyJqiU04ng
	 CFRxYy2J2DQoU6KuQFfYS52hSTra/QkdbuOIxF+cDqIm7eoaNEmzlWcmhXVarTFTzaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797553;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KMlzHqhd13YgyjAFr3WI6fQ2KkT0mfSqdXuXdvaYWr0=;
	b=1HN1Ilz3BqNpU8A+iPCZTWvz6ePi696EHT1im9hA3VQ2v6p+7+uS3JX5Ssq74Ue6wpNa
	 u4Ueuwvxl6xMcU4BVfykgMDhj5Z0AfhR37DHl98aJkwv9Z1+zEwRT2vCPJwuNOWaL9plK
	 PwXAENMtTEHKvkJgSPJ9MXcvCnu6XgOMjQ1Y0KTZCYr81selKw1cIL+VqdYalUUSmn8Eu
	 lGN9CxGA95C5UWRD2gWZ0xPhPnTYGF9wOrJGgwCljkTO7N5Zv5hCPtaO25+0uGeLN7d+m
	 +GVPCfNsVQEfOVdZtYs6ujHMnqcQXkh7ddPpruVE6eF0pqY7bHlCAwXncCFt6uAM3lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5B9iiphz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.31
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9319A606A68D;
	Fri, 27 Nov 2026 16:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9319A606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5B9iiphz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppfiGCH3Sbp9j1THWiBLk5l117y3FjWL2L+vAalaz3GG0ttwrgUutQCaSwtlE/SG1iwyIUJiKL4V+ffhYg/dELtzmYyNfDiJHH6ucWpmiwK0zrVHs3T4+//IHnH2/fwhFHd1VPDKUdxQXNC/9tQXYLmATLXSY2Oocl1Qk0kOJC77jg21Fvyw7KVk9BXQb3kDcGauzxJX0JZ2hzLZ633Fbu2yjlpJtrgPO5G2Y1mJJi5cvB1cgzkg2jzoaNIJz82GYhWPpFFt75tLQYGmxOa2dljK+Nf2VgL1ZiRExmhTlS+iVfxySzGJzWflJiemrDMJiyxOsT9sbvnf2YuaCbyE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMlzHqhd13YgyjAFr3WI6fQ2KkT0mfSqdXuXdvaYWr0=;
 b=Szr/1GtBVlrT3RrLwM2vy0JYfvgPVHNs0hq/h6i1aR/yiaVg82h88ylIIC9rGfsEqVEDE6nyx70jAmTmSzlK2UbYl0Lt34ze1L2qL24NpI4xTkwC/wDkQtqQN8VFU6dOBItxS12XjvnYelp2DBOh+UbbDmmi0tbH7iJhOg7BeHWaB9FJ/DzlaIc04TLREo2ULAkv1/axROaNbIkcYXs6dCBjvImoFRjuunwS9EG++0h4We4xOsjlzgMeDjFlngS3yz84jw1VeXqfoX5HpYo54w5ZTCeQmHSck5YNSqX/SdTgcs7zrM4c8eV0vrXeNuhvfP50Rq3QDdlxnr5OxvWpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMlzHqhd13YgyjAFr3WI6fQ2KkT0mfSqdXuXdvaYWr0=;
 b=5B9iiphzLREkTs3VGhHRL7D6Nmk1JAzXxxM6kd7nREw9YtPP8pIuUw2H42GM+yyS0eCzwRkK3P5AwdPsNKJdz0l44bAQEG7W4iUTGE36qQbeiCPFOZkFSXzzN7UxJu6EpYlRakj1oB3+RJzrz/8pBteL+o3WGchJ4GFd+qlJHhw=
Received: from BY3PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:254::32)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 16:39:08 +0000
Received: from PH1PEPF00062F2B.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::93) by BY3PR05CA0027.outlook.office365.com
 (2603:10b6:a03:254::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.688.5 via Frontend Transport; Fri, 27
 Nov 2026 16:39:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH1PEPF00062F2B.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 16:39:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:06 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 10:39:06 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Fri, 27 Nov 2026 10:39:03 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: [PATCH v3 3/7] EDAC/versalnet: Wait for RPMsg endpoint initialization
Date: Fri, 27 Nov 2026 21:59:12 +0530
Message-ID: <20261127163853.3563991-4-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
References: <20261127163853.3563991-1-shubhrajyoti.datta@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F2B:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d2e125-f3e9-43dd-512b-08df4ca4f4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261102123227099003|261028144727099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261026140227099003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	7FygIeiJeVMKDRVlloehg5Jdc/T6s5kFmFSNfW4P/I8K0h817i+J0lnBxUCaURCTJI3ujSadpivZ1czv8zKA3vHo3ebkUaULR+yBK+vRaA5+32GAQQN+Uf139axAetq0TcoBxvxVU2ntaK9PcYniT/rGMvZ1jmkB2Eqtn6GfFSeGulW+izThPXLxftPDIirFoGLD49XUDLe/OjcS7DTNEJVStggXlsfx/Ldat7Th94ZAj20ppucKtz2RJhXB/EpAEyC43JWSD7r4lKX+EOpOZChm2Ft5u7kubpm84KusQyCSuJRWbNSUWQDqwwoHx8K5fx3r+/jxvDEBDdEIZyFv+S3Vu2/dqhAg939VrS8m8r+RIH2MKmjwuqb1URUUovS2G5bOl0FK6Tb6W0wShAccHtS+nK8bKRKzW5WE8ZueJKCmeHy5E+HSpU1CWcW6D210gaVvARo4LJklsk+TBIJjN45ig3F5R/rdh0pJ0AaL2ZuCXeS4zt32asLRtjZHBg1JewEW1CgG6j9ryRanJzRn+mxWgdeQTjUMFYSlsbhTiQ82IvxbhKc9ZZ9qfwn9/4AqgFy2WLmdnhrG57hXzQpaL3IycwJan+3VCm4hf4wU/Rq2YfPnj8uMtyhdL7OykImUq3L07fKSLtnn2HZvc1FybYGGKbUZG77xlnqebZDnAPxR+lOaGYY41df8BQIoX4sa+72k6Pt4FGyX7lMmWB+iYw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261102123227099003)(261028144727099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261026140227099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/5pCJ+FP9gqPj2GRXXs0uqwUGnvap5h6STUqm/1RKo5BCkNSKCUFu+NcE88h1LgDTkeoWMTOfJMUod6HN31AmU/d5JjoGBQF0QHMmvSEQqteCnD9ay51gRwkhU+zKDeyesV7aotSBRNqjG9mHOy/TNpCWCjku+KGdS9Tcap7M7nAt+nwMsldHlSRMq3Qcgg4gQaDGQ0M7eJUsW2KUyS0MgvidIa5LCQHA865+Gy4avqzSl1lOIMzaqznNLTU/YCkSyxxZo6TzXdDUyUCD/QDyhWVLlG/hvqO8vG8WDrTQsbLsF64t8T7Je9Il9m6VIDXGJATAxURWw6VxEgLhVi/qsMBQqFGac7WsNUOohk4+AwJb4CgeWH5n32S6gF/NVdzgifEwbQRE2sYNw68zLTp83LIGl4a1t2V99d/aZW54y5rBdlHMYAJGKuet/CqDTuZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 16:39:07.5195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d2e125-f3e9-43dd-512b-08df4ca4f4dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F2B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701

From: Hayden Rinn <haydenrinn@microsoft.com>

The rpmsg endpoint can be used before rpmsg_probe() completes, and
can race with asynchronous rpmsg_remove() teardown (e.g. R5 crash
or shutdown), both leading to use of an uninitialized or freed
endpoint.

Add a completion so mc_probe() waits for the endpoint, and a
"ready" flag so rpmsg_cb() drops events until mci/adec are
set up. Add ept_lock to serialize priv->ept and priv->mcdi->ept
across mcdi_request(), rpmsg_probe(), and rpmsg_remove(), clearing
them on removal if the channel is down.

Split setup_mcdi() so that only MCDI allocation and initialization are
performed before RPMsg registration. Update the error paths to match
the new initialization order, ensuring resources are released in
reverse order of acquisition.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Hayden Rinn <haydenrinn@microsoft.com>
Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v3:
Update the kfree sequence
Squash the "EDAC/versalnet: Wait for RPMsg endpoint initialization"

Changes in v2:
Patch addition for the rpmsg endpoint race

 drivers/edac/versalnet_edac.c | 140 ++++++++++++++++++++++++++++------
 1 file changed, 115 insertions(+), 25 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 8decaba19048..c43104a5d9f0 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -5,8 +5,10 @@
  */
 
 #include <linux/cdx/edac_cdx_pcol.h>
+#include <linux/completion.h>
 #include <linux/edac.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/ras.h>
 #include <linux/remoteproc.h>
@@ -146,7 +148,15 @@ struct ecc_status {
  * @adec:		Address decode registers.
  * @mci:		Memory controller interface.
  * @ept:		rpmsg endpoint.
+ * @ept_lock:		Protects @ept and @mcdi->ept against concurrent teardown
+ *			by rpmsg_remove() (e.g. remote processor crash/shutdown)
+ *			while mcdi_request() is sending on them.
+ * @rpmsg_ready:	Completion signaled once rpmsg_probe() has run to
+ *			completion success. @ept is only valid to check
+ *			once this is signaled.
  * @mcdi:		The mcdi handle.
+ * @dev:		Platform device backing this driver instance.
+ * @ready:		Flag set once VersalNet edac is initialised.
  */
 struct mc_priv {
 	char message[256];
@@ -159,7 +169,11 @@ struct mc_priv {
 	u32 adec[ADEC_MAX];
 	struct mem_ctl_info *mci[NUM_CONTROLLERS];
 	struct rpmsg_endpoint *ept;
+	struct mutex ept_lock; /* Protects endpoint */
+	struct completion rpmsg_ready;
 	struct cdx_mcdi *mcdi;
+	struct device *dev;
+	bool ready;
 };
 
 /*
@@ -508,6 +522,12 @@ static void mc_init(struct mem_ctl_info *mci, struct device *dev,
 
 #define to_mci(k) container_of(k, struct mem_ctl_info, dev)
 
+static struct rpmsg_device_id amd_rpmsg_id_table[] = {
+	{ .name = RPMSG_CHAN_NAME },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
+
 static unsigned int mcdi_rpc_timeout(struct cdx_mcdi *cdx, unsigned int cmd)
 {
 	return MCDI_RPC_TIMEOUT;
@@ -517,9 +537,27 @@ static void mcdi_request(struct cdx_mcdi *cdx,
 			 const struct cdx_dword *hdr, size_t hdr_len,
 			 const struct cdx_dword *sdu, size_t sdu_len)
 {
+	struct mc_priv *mc_priv = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
 	void *send_buf;
 	int ret;
 
+	guard(mutex)(&mc_priv->ept_lock);
+
+	/*
+	 * The rpmsg channel can be torn down asynchronously (e.g. the R5
+	 * remote processor crashing or being shut down) by rpmsg_remove(),
+	 * which clears both @cdx->ept and @mc_priv->ept under this same
+	 * lock. Bail out instead of sending on a destroyed endpoint.
+	 *
+	 * @cdx->rpdev is cleared by rpmsg_remove() together with @cdx->ept,
+	 * so it cannot be used for logging here; use the stable platform
+	 * device instead.
+	 */
+	if (!cdx->ept) {
+		dev_err(mc_priv->dev, "Dropping rpmsg send, channel is down\n");
+		return;
+	}
+
 	send_buf = kzalloc(hdr_len + sdu_len, GFP_KERNEL);
 	if (!send_buf)
 		return;
@@ -559,7 +597,7 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
 static int setup_mcdi(struct mc_priv *mc_priv)
 {
 	struct cdx_mcdi *amd_mcdi;
-	int ret, i;
+	int ret;
 
 	amd_mcdi = kzalloc(sizeof(*amd_mcdi), GFP_KERNEL);
 	if (!amd_mcdi)
@@ -572,12 +610,8 @@ static int setup_mcdi(struct mc_priv *mc_priv)
 		return ret;
 	}
 
-	amd_mcdi->ept = mc_priv->ept;
 	mc_priv->mcdi = amd_mcdi;
 
-	for (i = 0; i < NUM_CONTROLLERS; i++)
-		get_ddr_config(i, &mc_priv->adec[ADEC_NUM * i], amd_mcdi);
-
 	return 0;
 }
 
@@ -601,6 +635,18 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 		cdx_mcdi_process_cmd(mc_priv->mcdi, (struct cdx_dword *)data, len);
 		return 0;
 	}
+	/*
+	 * The rpmsg channel (and thus this callback) can become live
+	 * before init_versalnet() has allocated priv->mci[] and
+	 * populated priv->adec[]. Drop reports that race ahead
+	 * of it instead of calling handle_error() against incomplete
+	 * state.
+	 */
+	if (!smp_load_acquire(&mc_priv->ready)) {
+		dev_warn_ratelimited(&rpdev->dev,
+				     "Dropping event, driver not ready yet\n");
+		return 0;
+	}
 
 	sec_sev = result[ERROR_LEVEL];
 	error_id = result[ERROR_ID];
@@ -730,12 +776,6 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	return 0;
 }
 
-static struct rpmsg_device_id amd_rpmsg_id_table[] = {
-	{ .name = RPMSG_CHAN_NAME },
-	{ },
-};
-MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
-
 static int rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_channel_info chinfo = {
@@ -743,25 +783,56 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
 		.dst	= rpdev->dst,
 		.name	= RPMSG_CHAN_NAME,
 	};
+	struct rpmsg_endpoint *ept;
 	struct mc_priv *pg;
 
 	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
 
-	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
-	if (!pg->ept)
-		return dev_err_probe(&rpdev->dev, -ENXIO, "Failed to create ept for channel %s\n",
-				     chinfo.name);
-
 	dev_set_drvdata(&rpdev->dev, pg);
 
+	ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
+	if (!ept) {
+		return dev_err_probe(&rpdev->dev, -ENXIO,
+				      "Failed to create ept for channel %s\n",
+				      chinfo.name);
+	}
+
+	/*
+	 * Link the new endpoint in under the lock. This also re-syncs
+	 * mcdi->ept on reconnection after the remote processor recovers
+	 * from a crash/shutdown, which previously only happened once,
+	 * during the initial mc_probe().
+	 */
+	scoped_guard(mutex, &pg->ept_lock) {
+		pg->ept = ept;
+		pg->mcdi->ept = ept;
+		pg->mcdi->rpdev = rpdev;
+	}
+
+	complete_all(&pg->rpmsg_ready);
+
 	return 0;
 }
 
 static void rpmsg_remove(struct rpmsg_device *rpdev)
 {
 	struct mc_priv *mc_priv = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_endpoint *ept;
 
-	rpmsg_destroy_ept(mc_priv->ept);
+	/*
+	 * Clear the shared endpoint pointers before destroying the
+	 * endpoint, so that mcdi_request() (serialised on the same lock)
+	 * cannot observe or send on a stale/freed endpoint if the remote
+	 * processor goes down concurrently.
+	 */
+	scoped_guard(mutex, &mc_priv->ept_lock) {
+		ept = mc_priv->ept;
+		mc_priv->ept = NULL;
+		mc_priv->mcdi->ept = NULL;
+		mc_priv->mcdi->rpdev = NULL;
+	}
+
+	rpmsg_destroy_ept(ept);
 	dev_set_drvdata(&rpdev->dev, NULL);
 }
 
@@ -906,7 +977,7 @@ static int mc_probe(struct platform_device *pdev)
 	struct device_node *r5_core_node;
 	struct mc_priv *priv;
 	struct rproc *rp;
-	int rc;
+	int rc, i;
 
 	r5_core_node = of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
 	if (!r5_core_node) {
@@ -930,33 +1001,52 @@ static int mc_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
+	priv->dev = &pdev->dev;
+	mutex_init(&priv->ept_lock);
+	init_completion(&priv->rpmsg_ready);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
 
+	rc = setup_mcdi(priv);
+	if (rc)
+		goto err_alloc;
+
 	rc = register_rpmsg_driver(&amd_rpmsg_driver);
 	if (rc) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed to register RPMsg driver: %d\n", rc);
-		goto err_alloc;
+		goto err_reg;
 	}
 
-	rc = setup_mcdi(priv);
-	if (rc)
-		goto err_unreg;
+	if (!wait_for_completion_timeout(&priv->rpmsg_ready, MCDI_RPC_TIMEOUT)) {
+		dev_err(&pdev->dev, "Timed out waiting for RPMsg endpoint\n");
+		rc = -ENODEV;
+		goto err_init;
+	}
 
 	priv->mcdi->r5_rproc = rp;
 
+	for (i = 0; i < NUM_CONTROLLERS; i++)
+		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
+
 	rc = init_versalnet(priv, pdev);
 	if (rc)
 		goto err_init;
 
+	/*
+	 * edac is initialised. Publish this with a release store so rpmsg_cb
+	 * running concurrently on the rpmsg worker thread, only calls
+	 * handle_error() once it observes @ready via a matching acquire load.
+	 */
+	smp_store_release(&priv->ready, true);
+
 	return 0;
 
 err_init:
+	unregister_rpmsg_driver(&amd_rpmsg_driver);
+
+err_reg:
 	cdx_mcdi_finish(priv->mcdi);
 	kfree(priv->mcdi);
 
-err_unreg:
-	unregister_rpmsg_driver(&amd_rpmsg_driver);
-
 err_alloc:
 	rproc_shutdown(rp);
 
-- 
2.34.1

