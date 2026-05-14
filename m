Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012062.outbound.protection.outlook.com [52.101.48.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123C43A5451;
	Thu, 14 May 2026 03:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730015; cv=fail; b=r+DFrcoAVfVL+43o44NqEiM+idD16N/cPT5xHpDrtNNEScqAo0Pxl3bpmcMd6urKOABYP62Vz8LQzrzbnNfNNmdN81hMhIMLjGTjwOBYVVZjoYMNxWaXsFJBL4P4KXUR8f3L4rRMgWn7y+12AZ2h2bVe8qrMqeYkrkC1BVP3WNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730015; c=relaxed/simple;
	bh=w5vtGsXWkSs8hFibT2YjPe+hjolSBvLy+Uhendi4u6M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WGwJOA3DKLupF6y3rXGGuOPy0eiSwLRSO8APnaYxcXf9IbUn6r3fM9N3xq7gx+MnZRE2fgHQxpjQoH1tyfetm43u4ZsJuLrzaTZmjPMjxg4MqMeVQ+smTsUE8QWsBFd8VXtyrLKfB2m+qL1Tc87VkVkH0yfFC6skr0rVFnDL74M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=mt5lrB9E; arc=fail smtp.client-ip=52.101.48.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="mt5lrB9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbwcF0CFiFzK5JNP/VDuCFDVIXdbficLWcBwLP7/ZBOKm7PATI8DzYEO9LcqzeVZUblAKqww+IGq5yI8MnNc8ULxP6BJJ6sL4UVA4VKJiV3i/swZOVqGEynXsBzxZ26m13LPy86T0hGPfhnM9h7sPE5WeL0OSGwmzPW8uk71HRu/29sKD7nWf3n7bsMBTODPLPlDd5b7saDnVxIAS/Up2EoVCBnNMxJqNJr+JDTg/PUikYpx/1XnXXWIlIiw3QLciAaQLfRl9F8sbHok6yJAChg2V5kuB62EiyeEwY385+sj+kOJnfYiPJcTXjWVPrToZwnaGLNzgt45+0fslwphbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uh7aBpWK4hzp3Z6nneUyP5sGFxPO9VrMAyJSmRwsao=;
 b=eBHnZ2Z0o9vEF0mADPN+Hby9zl5EPgO5gzm3AxtxTE/mZw6p9OKvfaVfRFS7GwvVA50mIeebmjXSZLnt3vmNhx1ZkJ8sJMI/FEPFRMLNJ9EKC9TZenbsvKO0Vy0iZ7HiHSFmYrXAQtn2g1cJmdB/V7Pz6icRCtNzYtaPgQtHSTS12iOXd0VKYL8OVTFuC28c783y4KxBW6iqlBuMpQ3wYrcXlxBLZKjiTK+48an5JSWTwms7yLtY28VRD6+BewH/YUZliEs3amrwubzGc1TRn+JrapMzfBtqF8rFzQJy+tkPWGPILAb0QL6n6wAAV0ECAfCHT9MGPP3ZxnTdAo1g4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uh7aBpWK4hzp3Z6nneUyP5sGFxPO9VrMAyJSmRwsao=;
 b=mt5lrB9Eg77NjoU3P6ndvYGzBphzRph+ccq8SsgjTdaP60i5BL8jvG7yx9muTgJdHPvvAcLEKz9FJjclhls+pPSqbNorZhw5pzjPzoNGyC0FHOwHKXpSaHPKY7JsXKv09ULeMqVL5Qly0Ij7/yc+81A6y3QOmIc1rOVEDD42wbiLkqslVkGZaUxGtjMbRPWkZvdrkUuJ9HSCszeYnYfB2wZBeEfJXsqkAvrCwurCKBZ/DL8a0bdcB31ZPRddxi7QY0cJ9KeUVOQ18W3B3A5M81dDCIxxoOtpL3NA6bvMZLO67pNRdaEeSFL/OwED54rTCS6h61C6Z8yzsJyKGrWrxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MW5PR03MB7007.namprd03.prod.outlook.com (2603:10b6:303:1aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 03:40:09 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 03:40:09 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for Arria10 only
Date: Wed, 13 May 2026 20:40:07 -0700
Message-ID: <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::31) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MW5PR03MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c4ec0d-56db-410e-11dc-08deb16a7f61
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|55112099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KwhVcETGts/xu52ZAwZnH7XHtzB1Tbb12EC9Svjr6mmuAyLoA2oF+KyqOPBl0scn2cyR4Mk0OhkiCuob3j0i0bKRJk23qXuCW8VvcU99/8/39yvk9lWruPsx9CKVCXVedSPMiZ466m25bOrskdSy4xhp4yqOVVBFrZXFPZc7xQ0iSBV2suY0NmbT8Rp1v/Npa3jRBZQRS/Zjzq2XlpN+MYaEDHiZb/aartsVFjRW92rTOwikG/qRm3KJrsTMDHKIgwHxRUC6S9mv1DlsxD1LWHK/R9fvJcBQRJfsAg9q1q+0agNtg8i+R3x3BRWe0hpD6sOAi6rsIf3Oxh8nuxxWDIBENj3rGAhW9rzEFmPUsvlGCnLoDBHXx7bA5ZeIyxNvfe5JMdXkdXnx99pDnSz1zp9UG8sagMdYga3KXPmEDQRPPHCn+diMbnwK4JWfgo3YRdVKnJ1VlPeM54H+snPJXoC1T8k49whONrY2V1w40M5+q0iBE8HEm7JFM/rcY09mc3r7o5cHEHYno9oh5J9Vh3esvKm+OWGALouao6ZpS7t1l/SqQWQgG1lBBOfnjyOoFa/IuAJyEAI25gO2szhYMdy2/fsRqBKuF9iQ3XtzpL/lzYOXzuf6YiykEo2xSs3J/SxjPURxyor0JIL4/AV79D7fRJD8pWziIb+gVcXRP5IeLWouLTs4zHp/ltwxFiQb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(55112099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gnenblrl/0wQ3qyb2+RlNBckap2FC7k7IyTswewK+KaKwnDO9at2xYMi/jDo?=
 =?us-ascii?Q?GM5iuNlPhZYRNjn9mm+TQgv48cCi0XKne9tEd/3b6zGhmX6UYTVv5eYSWKrn?=
 =?us-ascii?Q?0EDfO9sq8FuFFLo9CW8Bym8AbpJ0/YJj8lfVkM9M2J/MaupqBWX3O5LIrJio?=
 =?us-ascii?Q?h49sEKNMwu28/5kcAebwuPSlzzvG7eP8n5Cd0a6jiHEIDTrnFFmtEhU6+PTF?=
 =?us-ascii?Q?bv0Nsnpcofl9eGRt+AJDoYN/wydmKDo4hsWk0+UTE/0EnBo/W64X+yxUI2qb?=
 =?us-ascii?Q?0xL7ucKCHhfrBxhqO5q2M9ifyXhtrPRAOn20uygspaq/gUdmUnk1waqRMS9i?=
 =?us-ascii?Q?uulRJFN+BfkribRdXlydrYhj5LhkWlVYmIPJnDEa3NOrznqKE3v1bixA9sVL?=
 =?us-ascii?Q?pn72DiJpjSh26/ZZntouYUO2lczJxEaqt6eRuJMgEmbHTAqlZNY7x+JW7QQh?=
 =?us-ascii?Q?OUW/ozMsDnxac+y+db8IN2vjyeRzPefFhNPlbPK1FeaHX/b02b1JOvsPaxHu?=
 =?us-ascii?Q?BDVNdwG+19gRzb8ILxi3/6pUqg97r1PtJNEpxiau8JLBAZ+ZWJnjoGlMrIv2?=
 =?us-ascii?Q?Oa5vj6lSbMKPsxmGwT99BsBT+L84lhnpR7RT1RIgmp+CP0oj0vu9lqhv145Q?=
 =?us-ascii?Q?/+PsJx0g1NNvBxZ/EYE3z4nXNS/51UbR66nlC0TunP82rTrCDiKxgYVjg2er?=
 =?us-ascii?Q?l2NMdlya6Fv4v6Nzresi6YS0szyxHvXveiTqMAYLdNCP35Yihrrn2KvxVumv?=
 =?us-ascii?Q?xSQ8eXyE9waA81USNm7hrdTV3FZL3E7QX6EKQ6eY9tGtvNV5xW2Fnh3eGkx9?=
 =?us-ascii?Q?n31omSDD2Ru25jPORRB+OmA/uGLK9y0FFNSjNaJJsCecpXw5IzKYu2bs2Sh/?=
 =?us-ascii?Q?7jZjvHJg4Nugz1YcB88Po+IE1RvW6fX0R7z5iNEksXcS46dwDefA0569E+f5?=
 =?us-ascii?Q?DFdzeruwZEreJrYQGIDrOdAzv4va2T7YBZGBC2swe0d1sHx/060Yu2SgJkAy?=
 =?us-ascii?Q?5PcfvmoM1A8M2D5xu15JztQEwrjHfoHKahCILF52Roz+DWvUlTLVZksatytz?=
 =?us-ascii?Q?Pj5q+kKFlXRN6D73q3el07P8oF8URoz26js3wk/rrkOnbgwDjNS19dOlQJr8?=
 =?us-ascii?Q?qX5Ro+Xq/ocb+05S2OlksVF5Gc5BgUHlF9wUYj9gy7Ebc3qMDvG98aWfkfXB?=
 =?us-ascii?Q?EiqQVGQggIAIWk31Ao49Hh1zMplZkn47WfGUg6UyDXVWInomwpY2YOTiQ+bC?=
 =?us-ascii?Q?MPkrDEfufRXP59kCoYuyY2HPMlKajkUIHYsdYYHduepO+sRCzzk03DV6eie2?=
 =?us-ascii?Q?sWT4/yHf4WUi+oEsoMq5lVxmB8Ac88A/bF/r6oplXoy4yheKEodvUp77wCel?=
 =?us-ascii?Q?LAmAejGrhNkV0nu04jADxtQT1IdpYAbcSqlIQcUHh83IdJANgpDYLlxDMhZ2?=
 =?us-ascii?Q?ev+79J8FB/B0GQgwdGgkG9kDEmAA5oTq1HuKROC6WfRA5WPAfVFD63niUSvP?=
 =?us-ascii?Q?txhhg7ocwiJ+s89X7bdAHNvNKtcZhEseOTu24tdWyN9uoiZH+0XAhdTLYHu6?=
 =?us-ascii?Q?3cR2EHPaDm2u6K5FiA22U1ssFTjNYY/8qkKLbyZD7p2FcP7sgmuvf9KYYMJ4?=
 =?us-ascii?Q?YkOLhy7wVMfdfyw33OZSlNia+9BuVqF6QjBjdmv85nAkVmb1FZI2XLIlQEG5?=
 =?us-ascii?Q?NB5Idvy5+CsY5XZjNEPqnhA0goiaFCRv/HWMBZkTSwsexCxfNjrXseNTvOVr?=
 =?us-ascii?Q?DIEpVbXZSyE4g8vb7SXhtxt8C/xC/9ToSoJK9fCoLqRVboaQg9HIQ2HML80q?=
X-MS-Exchange-AntiSpam-MessageData-1: fcnaz1+jL6my9Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c4ec0d-56db-410e-11dc-08deb16a7f61
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 03:40:09.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U1K3a4YHx0zA9I9CbL28furmyWqfOi5xbU+f7kIXe+bQT59N/sa0Kp20KcqL4J4LG/q4CvN1xmW/LIhK4jmyklADBqU3VTenGPXJjE2FNRCbmBXDNi+uZLpC0o5t22JFjv5J7IewavbXcSegnG6wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB7007

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Guard the irq2 retrieval with an of_machine_is_compatible() check so
that platform_get_irq(pdev, 1) is only called on Arria10 platforms.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
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

