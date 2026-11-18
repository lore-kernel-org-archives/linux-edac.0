Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795011761;
	b=taeBohn++6i5RSI7NbOsn8BJ6JkcKI/BgtwtnYoVE8Q/n08zk5vEVZzwKMRl2DYMBzK8
	 caq8DHbQPs/pu/n6mY08UVezG2s9Q/wRe65yLAaqzHedt3scG460b0uLYFgjbRGHodrgo
	 n0TXY84OdtYyOyaydNHx1l7qSiqPv4wb3CUO7+2imtKn92dqufWkpnnjuNHjVMOVDEGnM
	 Ljpo9drQrXYFh31CbcrRGVpP8HPep0/zFZ/pR2a8XTWRX0op0HplAYj/NeUoo0sOB8W/d
	 DGga3ruw+2D5NKYAbieJjc3j+EWiM7pFBwOJF1Fn+EIoXt0JV1xENnhr6tFJTHrJ/2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011761;
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
	bh=CuyVp8JgqchGqdAL9oQua2/lo4IegEvCjUIyINWlWiU=;
	b=U6UJku7GJooyVrFZqtAi58kerD5mPVMGHr+39mRSYmSGDkWzKAra9zgyMSkwRHoOvAyC
	 /7ME5A2yeN+HLRYtAlFbk/MJQheMgg9q+pF7oTrcOeUrajHbfGOTBDCjhizDWUOUwBPv0
	 20tlqk3Xfw6o1z5j8rWWBuf/VN4sAhs7hLESOo7F5vRnJFQ4BcKLHpa6ZgkjsgVfOo44b
	 /ro25SU7iqmWGZAXtGHx6NJhOwDbvUPy8987b1r3bItju8JiwyeOvF4PuAO9Iqi0ij65N
	 6kSa3Y0BTbnj5yoOQcYOEbrTUv9qtDkB0A8Uwj+hM9pQgOV++t0SzpbCDjSrSJ6QS1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="V9fnjHZ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.27
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96163606A32A;
	Wed, 18 Nov 2026 14:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96163606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=V9fnjHZ/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKIM/a1sI1StOFzBvR00DImz3r+7nzdnv6ZtcsSW5ljYk6eLSWVgctycmQvSSCwW/+vVhrl30TvzGLZCsBbx8I3epFAlvhv+IjZH5xNU+IJVmV7u9U+V3uH6eKkQxegdFPY72q+ckpywVUOUXp0aIm6dxsdRNQljomXl98QznspW+OUyAatQc/n9UulzsLJeXt/S3WpoIFts8Gtu24GOFQlaHZ5pnd3PQoePv6fXJUUTnDiZ0oz8SNJxTZ9vTDWE5fPICgCw3+O6lcPaF5IN5WZc/GKTyDvJgp+DIPG5QzuMY6s1P94gO1kkfuN+FGJfv8pzqxJeSugSZy53pabsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuyVp8JgqchGqdAL9oQua2/lo4IegEvCjUIyINWlWiU=;
 b=IRdtVafek53rfSDHBxmGj54BCFbLc20QtcYaRNn78f+utvYyFrOjiQm1pfaQAI0E7Swqsb2ZIyZviidh953Wtunkt7EuUAI1rt7CqB//bgLd3JYf9xF/+uf1Asn6RqmghJ6kx1ISZl4wRDbBUelgzh5DYqEeJ4La6/CtSlW2so+6qwp50DF08kIOM+l/3UXpqIYCaCaRQa1l5zUwRA7dRwZ+q/9RFan3piMySpbvB8drGqDG/ZyU9Twn41WvFzmyGnTFG+1Yc0z+K79klwkc/FOslVqtpY8HVLmD79oJWK7YnZVIDoS361ozTExRH0ttGRFdtV7HdQoXDj6s14f98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuyVp8JgqchGqdAL9oQua2/lo4IegEvCjUIyINWlWiU=;
 b=V9fnjHZ/DvX8VDt7Zi2UTEopxZ2J+FAUA50F0hgw6eruknnH+rTdLLoK3D49Yir9LD2w5p1otrBIZc4UoIjchSNuzeDBar1l/NKxhD5nizetpKC9qEH0iFv8f6TYynKypH1boz4MV6A8KV6dS+T9cPRv1nsR82xO7IJgOqKaaUc=
Received: from CH5PR05CA0006.namprd05.prod.outlook.com (2603:10b6:610:1f0::11)
 by IA0PR12MB8976.namprd12.prod.outlook.com (2603:10b6:208:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:22:33 +0000
Received: from DSM2EPF00000011.namprd02.prod.outlook.com
 (2603:10b6:610:1f0:cafe::39) by CH5PR05CA0006.outlook.office365.com
 (2603:10b6:610:1f0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Wed,
 18 Nov 2026 14:22:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DSM2EPF00000011.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:22:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:30 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 08:22:29 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 08:22:25 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Radhey Shyam Pandey
	<radhey.shyam.pandey@amd.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Borislav
 Petkov" <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 03/12] EDAC/versalnet: Fix use-after-free in remove_one_mc()
Date: Wed, 18 Nov 2026 19:50:27 +0530
Message-ID: <20261118142213.100581-4-shubhrajyoti.datta@amd.com>
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
X-MS-TrafficTypeDiagnostic: DSM2EPF00000011:EE_|IA0PR12MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: fd81e872-530a-4c0d-f240-08df457f62f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|261021121427099003|5023799004|11063799006|10067099003|261026121527099003|261102123227099003|261021123027099003|261009223027099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qriQ7CLdXxxrHkd9E4Ete8t+l/iFpsKSEsMAQUhSky6N5FbPO4cdHWo98XiopD9Cul7h/0NDnvJyIcfWNu1GWYxIuu8sju2JignAEt6Bt9r+mFDoiOqNpLTowvYTOAASa4xBq5Moe4HDEVnKaGRRit/TGx1Z2p/iSJhnix2ttbGNwWVden0PVY6+joPU25m4JqH3Gt+VUapL6hIsJ4ixs+3R9lywKgYAS+e+UpT3tncw/hLDeaS2iyC+C6gHwP0Y5rwP+v/RZ/TMThoyFzXfDAUhk5sesFkis1oBx5I+BFjh0NI1JV0rsxyZHG5Wieodv8rOdS+rKQTVyJuQVx49Xny5W2bnvBgpRoQcxR0cThQSpi1EKHnn/xnkahzjJv7VYdr3pCSR43LV8cH/rhFXJ8+eDBkVyplaKke78BjOwElKh3Et4zuMCY5s19ZHPaErZfaMeGdg1d9+cYqksZwf2J7Z5If0qD/ZbSJ1weQ+MzCsRup5TpGwS1vSq75es1UjN9zGDJHxKGPFf+2c2e7AtgBWlYbowrzRSHsFzn7whY8ls0flRiBj0s43cmHx6Nlfn7109KDZLYRIbMGWHq8XbFQbn1dgDxsOM/KddHF6ac/H9C9TvAyt8f9WawGaWYfe3BDsNdjGCRMGH8LtsBu2Jqa4P7lj0/ZSoywg58pHodF+fI2X3tZTMrrLDTh1qkTltdMkBsZuaue+0OscAQn09A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(261021121427099003)(5023799004)(11063799006)(10067099003)(261026121527099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hl6z1zkQbgLvFBjGZjeHBfSCTaRVCpwzShHe4SuWZIu0eM0oHJQbVLwZu77+pF19xyu2gbBLu7emzyYTEBYdrfVFNuJPLdUZacCMkYjY76/o6as15YA9S2QiJsNQPF8W+96BTpdKd8/17kJnWUtghWPneXwYRD+hq0BNqHP9BZEoSbJ1raf5+QZD67Rv6DJkYc3J3cobXS7GdEKrtfgkxv6u17A1bvxGPM2WDkrTd+dfy70Zz5LwZSIbfmmjSRt2NkEWwJTzqKG6hlyrBsKeSJHVJg79mjXLwm53obMiTirjn4GPIzpFDcJpl0zkmML8k8Cgd5+h6Kb70HBhWmgKLFkmEYvEwXaCBw0WxThxESFLPH+DK+WVEGAZnu/SbTT1+wgOPytcYcPYXrw1Blh2Z5it9QtkUl3/3oSZZFH0NYjYJDGLRvWg679D0mHVqL7Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:22:33.2221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd81e872-530a-4c0d-f240-08df457f62f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DSM2EPF00000011.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8976

device_unregister() drops the last reference on the device and invokes
versal_edac_release() which calls kfree(dev). The subsequent call to
edac_mc_del_mc(mci->pdev) then dereferences the freed pointer.

Fix by saving the device pointer, calling edac_mc_del_mc() and
edac_mc_free() first, then device_unregister() last so the device
is freed only after all users are done with it.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---

Changes in v2:
Add reviewed by tag

 drivers/edac/versalnet_edac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index de97b2ac45aa..2d1417135e42 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -765,11 +765,13 @@ static void versal_edac_release(struct device *dev)
 static void remove_one_mc(struct mc_priv *priv, int i)
 {
 	struct mem_ctl_info *mci;
+	struct device *dev;
 
 	mci = priv->mci[i];
-	device_unregister(mci->pdev);
-	edac_mc_del_mc(mci->pdev);
+	dev = mci->pdev;
+	edac_mc_del_mc(dev);
 	edac_mc_free(mci);
+	device_unregister(dev);
 }
 
 static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
-- 
2.44.4

