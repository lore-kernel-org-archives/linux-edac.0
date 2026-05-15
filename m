Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012068.outbound.protection.outlook.com [52.101.53.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9765344020;
	Fri, 15 May 2026 05:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821491; cv=fail; b=HaN4bPtcQPyRQnmJmt6qgpDAlKB4tHUT07c1olhkfOQRIvK2Y2HJVnETV0hlpqxix/0ZranTzY14UNSwoN3bdaMXveenH1xDaSWdzQCLqK/8qcvkrpuNtE7JNi0nQR8LuwItJQznQxBkzMdlE9UGMVXk4K14ZByQJX6ugurR3eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821491; c=relaxed/simple;
	bh=A/BfAdJ5KxAZNB/z1EYR56ipcj+9ZbTpZSqK9BDH+VA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UQKjqBRCivrOlG+7JIAgb6a6RQPsfBgInKKzj/BOUsge4WtpN3YghKPjCBABWD3c+xQ1b5EfeW8GfIv8EXWSwlfKAPPXuO5lwTgfecUiwI6+yDqxyShNZSXttz3AxfWyPPSZcLep10XuUBFVyWttKc/rkwI24IL61XB2T0brSZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hfNuYy9u; arc=fail smtp.client-ip=52.101.53.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hfNuYy9u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmFynEPV7BpjWMswDEIxcaC9k5pRXCEmbnwj/2BMzW1WfmSSqwjDOX9fqQBLfFzn9yKAsDW8s8jaU9nWbpe9jMAFq0FyN7WdFvjUkcf6lNWma0+pLlndLKUOu93EmTMvn/lbqqGFbg+Av6Boyq+pql1P6F9hSyKyyZHvQOjP0LGPfArVvb8Q+zU0dNg25shkAbN2fb0L1hlRzn5aTCkALx0Mh4drKurneApWimsdhYIAzkmz+5nRVdUOELezodrQTHzoGdUnK2FXAEwzox5oZa6qFKPYiVTPU91ktwvF7e5hWoAo+6hEqm4IKzWDwr6BC2eZs0Rnkdi6aOG2s/G6dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+GCJ/s/NoLwoOj/9HgeyhslBqOVUKKF+QLyiI9pf3g=;
 b=xywZm1EZNGFklin7jSgegk7tfiX52wkosfeKf5DR+QND13d6mvp9sO2tx5XVNuxnjK4mLr9Pi2ABdfxZxO9c5bT8Zd06UVhjR2chgsgO+SGuFRLkroCNoEBBIMEkn/voLEIrk5E2FxkODjY8ZEZQOD9tVha/2RVJv+vAEDryz0hHDeEwCFLtMEyaQB0qniIo66gIS1iB3Kf4gVMOqvxfhKKIg5jdQPJCOZ2JUN7TIrUlhFVjwNCqFjRyGSQFZzRhKZpJ5ezbDQrSIJx7oGjNM0eblAXWFCdf6fMtys0qN1vKSbHJMxTx2q30gqh/4aQpT2yA0tJ9EaB3G74bbIZXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+GCJ/s/NoLwoOj/9HgeyhslBqOVUKKF+QLyiI9pf3g=;
 b=hfNuYy9uhVC8bbOAdodpqjukqD5ZCK32/r1nyJVaf+VzUZiuxiWFb7vQfSkO8vODC0Fu3nyBw+ItRBWJW0Jy3foEC4TLQbkC9n6yoMUGSp+0vNqXIm5qsLz5awlFZ5x6PE811qvRwb3ZfaebAwJz2UWATfaZhktLiIbKe7YJHiIYoePGFnk3Febw3tsO9UBk2VW9fWmwh7fRM9b9uorGLYjQ67IH+ppSDurQAYTbSVCf4bCUb8Bokx++n5pfiU/HcKLE+gJc2P8sotW2ROQErVqeLv3vWvSsS4fXQm/7t6f2x5Z3EFvZlcE1dB4tGB6ETdVHoFNAnIoHXJ2Oa+UpqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CH4PR03MB7700.namprd03.prod.outlook.com (2603:10b6:610:236::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 05:04:46 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:04:46 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] EDAC/altera: Guard SDRAM irq2 retrieval for Arria10 only
Date: Thu, 14 May 2026 22:04:44 -0700
Message-ID: <20260515050444.10380-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::18) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|CH4PR03MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: a3739d6a-83c2-4150-3060-08deb23f7b84
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|55112099003|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	gMqy6vfyH3EhTdx/jBy233EDjldw3DAKRXRCOqPcwP8GEEpiJPPg7HwN0Xvxt/J98H95g4HGHsethoJjHLG0NZglArM5dJs14xE7mqijGsJCwVXYEjxIZx9G1QCMyh6BUpY5UbM9XgKHoUukQe++cJK+zFttajNCY0A/QvR/I30aLmVVhWXf8ouWnfanao6PyWaZfwA1++z2pqFEYDJGSJO2NwjUESIc6UmRXQ3dANbXSTzQwwoarSI0PcGTY9jExVLDEkWkhLv33EezfVnWQuKYymJFwpQUtCka6f244xLvxlZMhYi6NjQh2hd6zuAwSP3SXdG11TJzE0Q5kby+2q71i8pD/PNNB3eyhJ97RGj3JqJuOFTSkzHeFqLDcag+jn9n8U95CAO6dzw5JvQnomdf53caG29fB6sxlRIVweQTXk1ANAQTeSQyXhpsxRVng62UVMZf0SAYjsHQ/KTIpK3Ja1MHt8tQhg2E/9L2+fvetCFxwk4ak74/8cL0CagQUh8q0b3on/9+dWQv2MeYsL2ue6J6lxt6dV/rl2+7/DZKf+Rk9v1oUR/jWeq1ZJ4clS8aWihS7aNf5arJr7XI3coG0UK4c136nChnqb5dBl2BrVfLErHyHo0oWIfJUWNCeWo1peYy77GjPAosDtro+ok9aj3w8KLcIpXDAIYip5R6OoJInl0V7cmobUezftJ7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(55112099003)(56012099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ql0DlEX4mUzKRxqBI1jdNFh+7ZOdl1dIXkD+jJGF/tmi1WBJ4p9WeJoh3LO/?=
 =?us-ascii?Q?FguhC/yK/uSgnQXV35S+u8Q35nENqH4+9wPiM5W87AgL04ddDTqA5MZa3bY2?=
 =?us-ascii?Q?rTOZkTLBwB8kqrmT1TpedOfimNbmDOyrrlOOjsbFb7/bRUxu/EwfbKK8gaCU?=
 =?us-ascii?Q?D+7jZ4efgGwsgXCC5jB6AzyXuQiXhaBfRPszvopMnadmQ1h3k8iSaFmXlxUa?=
 =?us-ascii?Q?hF6hyhb7xvxKaEWiCVN3AjzGR0/xU8Bj5zlwM4l1ZAbdj8kDrNbKdOKrYYkx?=
 =?us-ascii?Q?TI0MICIWllOTLDo2xoS2X/HwCiSWOQ6yJQ+3e8XKYI3g20butCPhnZQyRk5M?=
 =?us-ascii?Q?6/LpAlD3JN20zyNi2iOT3JQBc7+AfQQQzirq44R3atWoN5gibdcRE7Dpa91z?=
 =?us-ascii?Q?KDZzy/Ukc2lwLvpEBXBDAfDsZN1OxpJDLcVdUG8Kq8ODB3g6R+n4xbtOm+Fu?=
 =?us-ascii?Q?eVL6Br8jiKRL5QhgSp73rIvmIlGSFNmj7re1FbpU0Wuew9kq27eVDWyxlgvJ?=
 =?us-ascii?Q?SRoQ0gGIZB14wJj0pshsqkq2CJifKPHXoL28fju/0yRL+DAsJiNuf7xbT08W?=
 =?us-ascii?Q?bP/cLe07NmTP1J6iczFHk3+J9aRsBN8UB4kBwqxCwWLK3qNXp2Yg/nmWBlaN?=
 =?us-ascii?Q?zpHqzokdxrWMvwLhz3YtJ4dX6tFLbuogdpQ4WFZpeo7rjCfeYCwjiubuQAcx?=
 =?us-ascii?Q?eZTvEnj4Q1EXWNpQaoPLwMVHLyL5GDjclU/SrhbOFbXUUmlk44z8RV3zkav7?=
 =?us-ascii?Q?C5tfiyBPg3NEnGQNzmNeAykcCNWdOjcFp/EkGxqFOAkTVJrnRQRlpei9eHVQ?=
 =?us-ascii?Q?ROhT6FRGyr7Z4SL4AJU97HlfwE1C3nSGgofzNxpkrANQbGAGVlh7vI+eV/BL?=
 =?us-ascii?Q?RM2Efr8ekz1F+GPKDJIY7m0ksImefgXnlpVZbUAsJs4mVHVM+zr10N1tM94z?=
 =?us-ascii?Q?51+cvLp14YC6iXNBBkxF9Gz1/NlNrFaEIfPrHlGs+KnVYxaqbIyPz9HjgnB+?=
 =?us-ascii?Q?YM2nfHlXfmfKlZlYt6sXIv6fddtVSNSmDp/VZL24ffbWf0VYX+qfvZtCBtQp?=
 =?us-ascii?Q?1mXCgLFdQaefqjMjgtUjGO4oysFpjBV6QnKTs/I7l02rxls00YgsKMY0MmdU?=
 =?us-ascii?Q?t3PRnbgng4gXRaZyiPFfP2taCF314k4yn9IW0qLCTGD7HuvHXMQ+YvoP5bOy?=
 =?us-ascii?Q?10X4AUAF4q1EoElz/qnnl4tVRW8/L8uwJ9ZSoxu5vDscTRygTmTye/5gkMEJ?=
 =?us-ascii?Q?k+6737lEq2BANaVukQ62xgM90N/pKNnmM+JGKfo5Fb1B0EA0grt3YfoH0QqC?=
 =?us-ascii?Q?uDchD83TVb4rBEVB2lMCC+GV2HHanbZKnCoBzN773fDFuIm+S3sQFQc/ychq?=
 =?us-ascii?Q?kjtkHvQ5hAsnW9DcMxRlnJGO6V3imbLJL3mYgTioczpi+vHRwn+DLXtuCeIz?=
 =?us-ascii?Q?ZJI8I7eVyfDRgIpUYoL7OYT3OxaPTuTolWn2h/yrpg6CvRFQ61S0DjxDCQZQ?=
 =?us-ascii?Q?FrBtaxIBvWgvXUa8OMLiAROQCfyBFYI/dxtktszg4sDCqsszuAfSbCPVixGA?=
 =?us-ascii?Q?Y4YnLxMOiHKc0lMEsv+Ss0S4Ei0Z+poUcsplAC0kNeiXg+2VgQSFVmmgmlso?=
 =?us-ascii?Q?r/IHaY+rNZCccAjSfJByggNhcyT/Sv087HCacWQ1sE0P4TMVaqxjYO9E2AKn?=
 =?us-ascii?Q?AeX8p2vDMmZhTQHmLTQ3QzPq2eAY3yOif8KlhpG9wMKl70PpXL5yUMKdlXMB?=
 =?us-ascii?Q?YSy7Prl3T9t8RxpgZpp5V6OqFdN0skg0BWz+17M4ycdYEYQn6TROdBszGH62?=
X-MS-Exchange-AntiSpam-MessageData-1: yfR4A85TN4g+0Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3739d6a-83c2-4150-3060-08deb23f7b84
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 05:04:46.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+Hqk9Bz0sehzv7fWUp98zSerLSMDGnvIV7th1QSNdhUT9cKxzKgl6zGuaX5EoCG9jwjBKL0G958gd9OUhjTk4iBixGbMat4E8EVVRe0H4KJozUlAqTuuG+EJF9q3VqbkYip1YbvaH2aLcepxrhIXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7700

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Guard the irq2 retrieval with an of_machine_is_compatible() check so
that platform_get_irq(pdev, 1) is only called on Arria10 platforms.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
v3: Fix commit header formatting to follow EDAC/altera: prefix
    convention as per maintainer feedback.
v2: Move irq2 = platform_get_irq(pdev, 1) inside the existing
    of_machine_is_compatible("altr,socfpga-arria10") block instead of
    adding a separate duplicate guard around it.
---
 drivers/edac/altera_edac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db..ee6ced033f2c 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -347,9 +347,6 @@ static int altr_sdram_probe(struct platform_device *pdev)
 		return irq;
 	}
 
-	/* Arria10 has a 2nd IRQ */
-	irq2 = platform_get_irq(pdev, 1);
-
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 1;
 	layers[0].is_virt_csrow = true;
@@ -395,6 +392,9 @@ static int altr_sdram_probe(struct platform_device *pdev)
 
 	/* Only the Arria10 has separate IRQs */
 	if (of_machine_is_compatible("altr,socfpga-arria10")) {
+		/* Arria10 has a 2nd IRQ */
+		irq2 = platform_get_irq(pdev, 1);
+
 		/* Arria10 specific initialization */
 		res = a10_init(mc_vbase);
 		if (res < 0)
-- 
2.43.7

