Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522C12931DE;
	Fri, 24 Jul 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913620; cv=fail; b=ki1aIgyOi8KnlCTnNI0s3E8TNlTb34XLjqDQmkIxSf2PufWfyCwqb1wRShY1O4YcYpmPhg1RpwW4Fjk5JI51VhiIkXq5i5vyMATgRUx6DgIcSHjbo9aLDAGFZagrHzLW3yG8vJdjfpnKkoOoehQPfv0o5CWMut73h++fLGcTo24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913620; c=relaxed/simple;
	bh=KmwzBRd/kgdJfC4SJ2enWYXoLOq6S9CRzPbQrB3hSl4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=obS/0jh4f8n3OefjuAol2DbGksC5vpX8snSjqsk2fi1zyqeVfOnVk88MIms6MegFf7JcSDpaeodDGkg6lTd9xhP7kk1eKAIYPClUnlQD+KjOFSoF9q3ZbCFWzVspY56+346X5H6D5KOpmk5b67Sy0B2dh5SZvqjbiSDSn4rSPVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cWb8ul5H; arc=fail smtp.client-ip=52.101.43.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cWb8ul5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0W9kSqmb8qZYFuyd1PFPjUkfFUHhuhXS3eRYREC8yPt2cE0LXXjf4390ch5adrVpGOignJrJgDHM+6FEG4OLncTfbdOMAeEAyb5EIEOaeARta5ASMtm9tUTPkl1KzXshr3VSbuLyzoGI52AEPQ2lQTnZae2ts+q/jcLw2z7qSeIrCo4GD/PsHa++rMHDBotQxlXO6egFqAdLhD9S9EUVPiQ+xfDZu4DzpD4F33JVdvzaH6FxJPD2LA6iytT3/SRGdADH+Stypa3ltUJevTNUhK3JMQsQgl0GlKzO9zVLbim6ioJh4P1HS3DQ2h29+Bg8rxP7g5Ks98P/jmgvkenYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Xh7SyUgrH8zS6gxQPPkuamEXaaQr+LH8n4Eu+2gOyA=;
 b=WEiiUb26i6Q97ncY0xFrj1P08fXAb6r+R3Vxd4oxnO7Sv0J4aOGnSBfEuXBmPBbxcC1AptCL4uTisb7nBJXh6H32GDaRs8CsHMn78VkghPTI3IkQkJpaPefV4F1/IkJQTQP6Q+kB2WmlxQAqvBqIBOSKNJz+uI9R4M+BaFSmSkEGCBfnpUWYfdaE3j33YYuPq+wuP84SoazIbyqlFxp2XyK6alIdXtTc6QTVM4LxwsDZQCqQVm3qydmrc6x5h9MNnUDXPy9tE4WeSMZBClJhtzCwYyIq5I/ie/GdE3NkFf6hAP8gMCQj1u6vNhjsiwDlBSZQQhBQ1aPtwrrQrQlhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xh7SyUgrH8zS6gxQPPkuamEXaaQr+LH8n4Eu+2gOyA=;
 b=cWb8ul5HKofazlz5zl5gdgovD81csWgTk2+deONJcVZYR+k8GN6OFCHkc3w2z+AsG7t2g0CtegC3GhZTDEpTlJTU/V+E7UKGgm+RDQPLqpEjvWG8UHLpiJViufUIDI2TdoT6vUJPsphur6fm0GA58nhJ1GbXU4UjDm1sf0E82YI=
Received: from PH7P220CA0045.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::17)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 17:20:10 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:510:32b:cafe::50) by PH7P220CA0045.outlook.office365.com
 (2603:10b6:510:32b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 17:20:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 17:20:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:06 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 12:20:05 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 12:20:03 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michal Simek
	<michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>, Tony Luck
	<tony.luck@intel.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 7/9] EDAC/versalnet: Add bounds validation in rpmsg_cb()
Date: Fri, 24 Jul 2026 22:49:43 +0530
Message-ID: <20260724171945.2812749-8-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a758b98-ac1d-47c9-e9c2-08dee9a7d0dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	raExrQxa2wca4ENaAAZnZi1eSC9uvt7nVyIPUcBJ1yeAwQ/OaqJ4uh716Lg5pYxs9sQMhJfS6Z0QSfL10sgNLZdqXhWeFr6Ta0CBCxJBpFN7Ss35sfP6W8QFkCHTnLO/LsABnNaHvjrkZYKZLJGTy+3uLBNMBroyRvAdGDa+3o72YDvXwA8SOpYgBCsWQu1IiM5OnIt+mRfSQ+h2HG2SOZauvACG0T9Qp2hKcMR/WpAlk8MFAXGN4VVbAf0VByMvQDvGlZN3HbnvIcidPSi0RO/CAuUH9jt6WwSHcHJ8VGK4/5S7uh2/blKNk43mZAeNL7zx5vNiE/5j9GPo0s2QpT0rtgdNTFcBHYjnVOfDAn5Z9AWm+iN8NtWhmkHyFWy40sVbniNG2tSvsSUPvPXyDHiiEnENSITrJbUTSt682OpbieVWZ21l47mpHpbHOssDH5o1dzec0wh7rS/JqS18I11FgWMDaWfinba4O36Pwiurhcsn6kngcIDGnXguFU8G1/aUW1L/AeHoIIV5j7osu2uotIwiFEFn+UNJDoMV+MlWGLfu6Hc3oSwq0uHG9+NTTMQBpSUOIi2lKeg/45ABRGHyFzOJcL3maqfwR+2rBGJdkwXcxu6XHKjQuYh/v5kOWlW2dv630/Tm+zIIj4E9ei48Tv7PdwVIvlSOFqK2J+mqt7Jcg4FlGUMDUYeQ4jK5pXAb2+GC3y5MmCym607zgQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iseg5xKuDZ9jaGjo6aJwKh8iktkOEb+XIo7oMwqwb0T9xZUu5d8d/pU1DclTS3rSgQ2geyO9ieb9n+4MrxOYL6JzmnRWnTwUwTq8QjNbOBsEuN8N6t8y7i18tICek37kNCMOn0Dw1myzbJAWlRLSGJXsPuUVwNdjZXC398s7Sp5ZHDoL8pleJBFmYrwwqx3rBDGiXzSfcqPK9YJso/bIaVZQRgtppvkdGTvnJSAdIeyOJl2GL+O27YoxvPREdhM8gN1x4VBaQ2RllDrxN94qgMujM+OwckjmXdAxjaEiJimDRUAPXs9FIruUBDndtlvH/VZcW9lsfMrO5zjYDGsbd5u/7yXHylEXBGUlgKU+kPkHDISUY5mDn5IYJueZROBUOTVZsD1XpzKdzZK2uZXdWcw+zo8gVUtSgtjC/VjxbwSmTostRa+jwN0Do2TlrujS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 17:20:10.5877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a758b98-ac1d-47c9-e9c2-08dee9a7d0dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326

The firmware-supplied offset and length values from the RPMsg payload
are used without validation to index into mc_priv->regs[] (REG_MAX=152
entries). A malformed or buggy firmware message could write past the end
of the array, corrupting adjacent structure members and the kernel heap.
Add check for the same.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 drivers/edac/versalnet_edac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index e9561242f292..baca90f44c58 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -602,6 +602,9 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 	length = result[MSG_ERR_LENGTH];
 	offset = result[MSG_ERR_OFFSET];
 
+	if (offset + length > REG_MAX)
+		return -EINVAL;
+
 	/*
 	 * The data can come in two stretches. Construct the regs from two
 	 * messages. The offset indicates the offset from which the data is to
-- 
2.34.1

