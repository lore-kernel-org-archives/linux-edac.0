Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011816;
	b=tYiGD+3eGmXwf8QZfSf1s20bIy+nl8ciPMfRPF0Kt2eD/7cV5AtRsqwbYINF+QNvtcab
	 0KoNHglz1y0mMJlyZUdZmwPq+rfR/ixc1vLw+p8yYEibYZXVjkQJNxutyNUtvx45aMrnm
	 zEuEzWfqPDmTJig3xJyZ9/QL5XGsDWTUdEzE0uYHe/vL1wa6n/SOoW1CfHGwoIXhq1li+
	 FdsVJ/h/RiNmKiLk6mhGhMTXxdiZXv5pQpqPChsoNb1dzdCtwk7BJn1AW7SO2gTn1rYM9
	 KovDY9WiTBd2+Q0w1mT6fa26ZupUgNHyvVftGh+bD0UgZuqX+ajhKi30YZ2p878e+Rg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011816;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=FOvTEfXRrHPugYKHxvd4HvSrSMAxcIMVW6Am5/H72nM=;
	b=2EyMg+D2XrApIOo4qno3uZ/+ZiE0jYdf+B4xq3h2zdfjuz3gBw/kJNdirXunbQbYk5Rj
	 Z9N9Kw7AG9v3O54LRBJ4l28pecxWHVgKDUJUNT53Ijxj07TErjB6l20kD92QQO76vAujR
	 oo2DyIa8nnrU6TmWNELPUX28ahIB6LVXcPB+wqNJETEchQRqPWBU/LpkoA0t0VAzJ+sI7
	 Tjb4eGM9qlJ5LW3ctWT/VLPvUIs13dV0YKLrB/MsQ50rRjqBcR2QffS7mEZyZNwxYqYeI
	 6mm6vBGJPOZQXYJU5jRBvKf9WG2xgnpG6pHK7rJiFRigq7VhsLePT7V6Z6Zfc8z3Smw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Gbi8GAHv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.9
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD19606A333;
	Wed, 18 Nov 2026 14:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD19606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Gbi8GAHv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+5ZmMfBSWaGdNst9rVeGya8QKnHF1F3wvyc0Xka57wodyzoGTWxSJS8Se5pds+eV5tuiCyNRMxizEYm51zQfKxy2648baa3ucc3eBsh4mr95DSc89VLZiQ/1+wR37QqRyeLNwg5gFXNI69gfKr2PRwFBAbb1q+K4D0fHHfkACxbaBnH7Pdl6VFWVPQlvS3R4x/F5g8CCw+wyZdOfN4tDua7CuS6XEoMFPiEwFiilY8PdT1/xV6hWERbwgQh1PgduAfLaLKMB9y/knewOouz7yzM7EhfdMak9Zw5TSFONb+yIHey7Rn9Cz2DO5fDW1KuuyP5X8P+cPqax3vF1iTdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOvTEfXRrHPugYKHxvd4HvSrSMAxcIMVW6Am5/H72nM=;
 b=MpT/PisSFttbJKb6M0Ux2YHFbLQqfnzX2yWy6hYGW8dsXKXUuqMcuNS80by17pQiao4hP0WjI37Jko/bwfFCDdUHW3ucZns8hNZ4OHUaLrVvDWl0aGv5xuOQM81OtLzKHiig07+B9fv5ZzSk6czAd0kU9L1qo1Mytq71Q9nnEFr4cbbGLyOxupymZPt8093jAtc1YRA/f9mAGkD6qLjzooQIiEXjkSlkjyem2jslUV4noTADJ5U+bTPRsu4+o5esJfivEf3pD04Knqi8yqCFjEVQmtigj6N0zhPbnApyzPb7cvgh1qznqE30/riSLtEMtY4TLR32B6sxGBSx8RhVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOvTEfXRrHPugYKHxvd4HvSrSMAxcIMVW6Am5/H72nM=;
 b=Gbi8GAHveIWrb00wcLJPLE3entl/nT0dfrbmuZ0TNRNyknpzZkskzUwjbfPzkCoSCCq/dB9lTzmAlZsM+KC2fyjh1iaUZ39GDBczWGu0spIxkJdnwII4KBe2hhJHcKnMVS1Y43oiacgXZrZYf9Y1Gza3obqyUNYxSzdAXV6xk18=
Received: from PH5P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::12)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 14:22:43 +0000
Received: from BY1PEPF000264AF.namprd02.prod.outlook.com
 (2603:10b6:510:34a:cafe::17) by PH5P220CA0007.outlook.office365.com
 (2603:10b6:510:34a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 14:22:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264AF.mail.protection.outlook.com (10.167.242.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:42 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:40 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:37 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 06/12] EDAC/versalnet: Wait for RPMsg endpoint initialization
Date: Wed, 18 Nov 2026 19:50:30 +0530
Message-ID: <20261118142213.100581-7-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264AF:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ac964b5-7a49-4e83-12d9-08df457f6878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|18002099003|261009223027099003|22082099003|11063799006|56012099006|261102123227099003|10067099003|261022115727099003|261028144727099003|261021123027099003|261022105027099003|261021130227099003|261026135527099003|261022113327099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261026130827099003|261021133027099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	tWagN7lULZqtgaOMVWPfUr9DI7+yxYFF7QA/AbaPY5QSu1mrVwoBjBRzNBJRrJA3ZlfX9T4VW1LFiogqLJULtBFgSxZPLSoLUxnWlkN9tjH2ScX9SiMx5xtwj8M8kT7vOOjQq+zubCa0gn/MbTbpCD0xBxe50PJ6nONU75KYZgo0l3KtHrnqUNslnt/oew1p4kDgo6hkkxSurSWZzo7Cxa1JCTFl013AztsH7kv8YxKPCkaV8OQfQsJjOFeoYp1bEhekedg4MwCTx9mbHRmxpBaM7XHb9KQkCG4pK4UV5KI6lghbrHgONdrErh85jovoXQ6rchOnfIIVZYnk6jlnrEZxfHFR4FL58BseDSSeNrD/97lRi2M/ZA5QeL7sX5ovJfW+EqSTvRiQBq/4hv/4R5UeJMcwT2ksnIcl2RUYSezOcGr4enI/RTmRMn9miUOQUyhpQWCwB4buyycVtd7wICbI+Jvd7Khxg7zY0d0sEIQc8czFl0jFH4gII5Pr0zmmKvGzN4c27SZ43WVQN6p8stCPgmLwkawSssSfxfU779uwDRWxRNzNtNQIv5FHDBwhZaQG3U4WIg5YSpV/swjqnkSEQm4b8WTmh4iz2zvmV+zj6tMw2AxM71iaeMXAl23yVPiqmyd8TMOXGWId7vX9yog0Gqo2zS7aNZd1/msqkZk5pfnyJnfcwWI+Vv+D0Tc1A4ng+UymofDq1SRs3cotRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(18002099003)(261009223027099003)(22082099003)(11063799006)(56012099006)(261102123227099003)(10067099003)(261022115727099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021130227099003)(261026135527099003)(261022113327099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261026130827099003)(261021133027099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i1xq79/OI0wBfJybmkgJHI8oE8H5IyngPA/SHVDDwoZ7IjOPnW88Hem2h1cha/54eI9++pVbFwmk2WUgX0QaOQx7lrynfrV4vfpYovUrOuRSF7NO9d5WRxeIDfmltkRPhEttX8vMip5TCNNiCASCPNNUJ6k00FXRIFr11TWwrOZvwDRA39PZRBYA1OnmTQRwr4sqvh/7d/sP2+l3kL7+14HCfkswZkTbkOdKfIo1lO1c6SpRO3f2nzXX9ISHxFofAYsZTfQS5/k/XDEjR7PI2+WJZ9SQdIJwjfhnd51Vor4Lr0Vv3dc7up2q0uu4x4D4wTERGqZ9HsTUjKrbKOanskZkSllPNpIOzUfx+AZQUZR5Ewradjxzznhx6y/4F+76iICxdbvhjMM8Iyv4GamO2rcIzFbWH2LBnfNe677/Xtvzwp6scq+1labE8AwYhnOn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:42.4961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac964b5-7a49-4e83-12d9-08df457f6878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264AF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423

From: Hayden Rinn <haydenrinn@microsoft.com>

The rpmsg endpoint can be used before rpmsg_probe() completes, and
can race with asynchronous rpmsg_remove() teardown (e.g. R5 crash
or shutdown), both leading to use of an uninitialized or freed
endpoint.

Add a completion so mc_probe() waits for the endpoint, and a
"ready" flag so rpmsg_cb() drops events until mci/adec are
set up. Add ept_lock to serialize priv->ept and priv->mcdi->ept
across mcdi_request(), rpmsg_probe(), and rpmsg_remove(), clearing
them on removal and failing mcdi_request() if the channel is down.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Hayden Rinn <haydenrinn@microsoft.com>
Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
Patch addition for the rpmsg endpoint race

 drivers/edac/versalnet_edac.c | 123 ++++++++++++++++++++++++++++++----
 1 file changed, 111 insertions(+), 12 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index ea90d3ce3e70..90918293f76d 100644
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
@@ -146,7 +148,22 @@ struct ecc_status {
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
+ * @dev:		Platform device backing this driver instance. Stays
+ *			valid for as long as mcdi_request() can be called,
+ *			unlike @mcdi->rpdev, which is torn down and cleared
+ *			by rpmsg_remove(). Used for logging when there is no
+ *			live rpmsg channel to hang the message off of.
+ * @ready:		Set once edac priv data is initialised. Published with a
+ *			release store and read with an acquire load so that rpmsg_cb
+ *			never calls handle_error() against a @mci entry that hasn't
+ *			been allocated yet.
  */
 struct mc_priv {
 	char message[256];
@@ -159,7 +176,11 @@ struct mc_priv {
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
@@ -508,6 +529,12 @@ static void mc_init(struct mem_ctl_info *mci, struct device *dev,
 
 #define to_mci(k) container_of(k, struct mem_ctl_info, dev)
 
+static struct rpmsg_device_id amd_rpmsg_id_table[] = {
+	{ .name = EDAC_RPMSG_CHAN_NAME },
+	{ },
+};
+MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
+
 static unsigned int mcdi_rpc_timeout(struct cdx_mcdi *cdx, unsigned int cmd)
 {
 	return MCDI_RPC_TIMEOUT;
@@ -517,6 +544,7 @@ static void mcdi_request(struct cdx_mcdi *cdx,
 			 const struct cdx_dword *hdr, size_t hdr_len,
 			 const struct cdx_dword *sdu, size_t sdu_len)
 {
+	struct mc_priv *mc_priv = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
 	void *send_buf;
 	int ret;
 
@@ -527,6 +555,24 @@ static void mcdi_request(struct cdx_mcdi *cdx,
 	memcpy(send_buf, hdr, hdr_len);
 	memcpy(send_buf + hdr_len, sdu, sdu_len);
 
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
+		kfree(send_buf);
+		return;
+	}
+
 	ret = rpmsg_send(cdx->ept, send_buf, hdr_len + sdu_len);
 	if (ret)
 		dev_err(&cdx->rpdev->dev, "Failed to send rpmsg data: %d\n", ret);
@@ -601,6 +647,18 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
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
@@ -721,12 +779,6 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	return 0;
 }
 
-static struct rpmsg_device_id amd_rpmsg_id_table[] = {
-	{ .name = EDAC_RPMSG_CHAN_NAME },
-	{ },
-};
-MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
-
 static int rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_channel_info chinfo = {
@@ -734,25 +786,56 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
 		.dst = rpdev->dst,
 		.name = EDAC_RPMSG_CHAN_NAME,
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
+
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
 
-	rpmsg_destroy_ept(mc_priv->ept);
+	rpmsg_destroy_ept(ept);
 	dev_set_drvdata(&rpdev->dev, NULL);
 }
 
@@ -920,6 +1003,9 @@ static int mc_probe(struct platform_device *pdev)
 		goto err_alloc;
 	}
 
+	priv->dev = &pdev->dev;
+	mutex_init(&priv->ept_lock);
+	init_completion(&priv->rpmsg_ready);
 	amd_rpmsg_id_table[0].driver_data = (kernel_ulong_t)priv;
 
 	rc = register_rpmsg_driver(&amd_rpmsg_driver);
@@ -932,12 +1018,25 @@ static int mc_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_unreg;
 
+	if (!wait_for_completion_timeout(&priv->rpmsg_ready, MCDI_RPC_TIMEOUT)) {
+		dev_err(&pdev->dev, "Timed out waiting for RPMsg endpoint\n");
+		rc = -ENODEV;
+		goto err_init;
+	}
+
 	priv->mcdi->r5_rproc = rp;
 
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
-- 
2.44.4

