Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA939449ED6;
	Thu, 30 Jul 2026 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785437358; cv=fail; b=g9KubB6MWj1rZhkMnmnd7xfn/cgLYdAJClQ1jbhg7iutFulzRHY/LavVX40NDY1drM5MJwlNq09ycVcayto5bxaM6p3Uoe1fmxlrbgoE4GuqbyTRL+rci1UnQ3cuQLkloKXu9KA9ifTAUa6xYrenaE5VKui8uNDZpzdnOh9lRow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785437358; c=relaxed/simple;
	bh=RxK7U7g3ti3/QaOqj7nwFVzIdXXPs3xJw7VWMn0aaMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AHGg0nHXcN7lnZUT6itSPX4hwXPJ8EQvWKJcR7KSchZnL4gt7B46h4Wv5zvKaQro1RxZTC1qFyhqALZH7IRrhv1q314t4Vw+X+yC3Cn2arg9IEuWW5pKRvvqlrErKBzPHI8nqT0oQ98Ebn72LBrf+jxnFYoTC8pyG2BJ8GFVVaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=En0TQlWv; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="En0TQlWv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6Z8XSBV/tLXAt15KcvY6YiW8FFThQ7pn4AmnqCGwtZrYtC2COGg/gaz7Q1UiBeOixzgzHImIXPSbb1qqvLs2MhFcixNR7c+Quv3SQH2fsfRpSOK8NT3g2+iyz6mITbNxouEzRiI4ql3w9ZhlqfigXbstOkcfOatuZy0YlCvZMRdnOS1AN9zWcYh4NBxtg6tTQm9y9OG5kN3tq1YldDIvEGOHmpY9AsMJ/kqO5wc5pOgfnY5cx3GkAQtCELAEh5ZNrNkJYYX1A5wp+JdgKUxSiY9mUnQRxc9NcfKrC76cX0hkLm8b6GhFL06tGwu2LU2qtE2IsJ+Q5xY0iCsX7Jv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbX+o9mKjUdxvrebjUx4zwNsUNHDH+TqJWwSSFJnX7g=;
 b=jG+kDuouNJqsj139291xyAq1+0z8Jtz0GvXigU/vM222mCh98ack57O0j56SJSZFZOi4AQsrBLoUscLbiRwO95Qj8MaRk/AoEskkMCPEqtbAzaayG14D+TXX91Uj37JuhaDX4ZiOwoTyhrzFENa4qvMDCBT8AR9/Zj4PPyw2E1gAU4CNvCdVwjShcjzspGbAPVBVswVcxhpYwY5QJqeoPuolHa49pdwdnzguAHwY5hULQOd3+f1LacsqBsC1t7UH1ZgaPYayJ6YRLJNuSYG4XkxQM7H5Ko6idjplqZiDKg/vYAHA4tKTjenWkRqYyvC8wIQxm/1J1a85YWzEevuacQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbX+o9mKjUdxvrebjUx4zwNsUNHDH+TqJWwSSFJnX7g=;
 b=En0TQlWvV/5/8Pb1NmGd1y+IlrQ2ZF3R9de8DKGN0BqLu/yeK4lFPCwgKyDXEdwil3lfawZTl9FI3RBkBhzeYIj0ZTYjYg9EWiEmyfRDfQyascXbXegJn0QP6S+4Lhhli/PRPfAX0JD5SzTQLPybMZpRk4+rKb3zw+XJniO06rUG7pcBKdjaNfAGH6WnDvNx0bKMKVOhst57Y2Z/Go5yenezlP5/9UjgDY95m+8xdow8GIYh+hGzOmEpPfwpqauU5nz+IN4QvWbEmioDySPc7qZonAMB5naRuqaTsbeTfMgVvUqaEMfcF0WRz1nm0vHBujctow0/YqiXhHzlf8J4yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10961.eurprd04.prod.outlook.com (2603:10a6:102:492::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 18:49:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 18:49:12 +0000
Date: Thu, 30 Jul 2026 13:49:06 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Message-ID: <amucohB5GoaocIC4@SMW015318>
References: <20260729012320.616174-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729012320.616174-1-rosenp@gmail.com>
X-ClientProxiedBy: SA1P222CA0067.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::17) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10961:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dbed023-3786-4f2f-a656-08deee6b3ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	dJp2an1Ab4o2abhqkX2TnOlsjxj/YDtBV6k0sY0cYadsXstOxhcES+tbG4ygAuMhfpmBRJhTux/7nQAStKEAlii81xx1umOSttge6Ps9qwAuYNCq0FDjZZ2WXpxh7s8bl5UbmfTBsym51/x09Ej2URX3AM3LoIf1ToBLKEFOG7yJlrDA4VJa+MfQa0NCGQ9XhbJN9qnF9YDnOcUdjfls5B4KfNkEdC+frsSruU7pIrUKyTXa5KmK1Go4JWOMxPobloDY9gEz3EQ4zUajymD26b3D0gh7EEvG0GHhRz0v/tm+Typ/f49VdIhNbH9UVH5U7R1GFdif4YejTmj+fg9jW2wOhvUNhABASCUfSgwz3WgtvOnhfCEcgTJsaLuSzFopdiqKyYXpwrSMw1mmRPnvJtXarOXxH1X95PsRctujv4wr83J+CgZsLY4NFx02dN2b4HcGSM03l7w6uBq4WOE7T2rhc6oBCA2bXI8uk7QNFzIr4G8Ec9anxOWdGsXaVH6E9qJbvd4wtzj9QHsFt1Q9BpQo2Cr3KLaRyCuuP8yJFueQ/zDE41fHWQ3sJ8gF1WBx9/EQJuffwopvEDG5L+HWsqSGafkZ7hwSzcDc9YKsttSBOLZ3eZmSzU7MmDri4MVhK+AHfTgjvWtSz9LjTwFtlqno6aETmGt/P53q3i3+tN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tqIQw6rrHSvhUzUoca/6oavKFkYMHHxxqw7IJSqTif9YTJoaQ9rxRq1atz8R?=
 =?us-ascii?Q?A1v5b+Szer+hPu61b/ilCtdFF6vDevtxpW5RyDUu5GArxiTJ+ofxR5oCdxyq?=
 =?us-ascii?Q?4YELcNnghSfmK5ixC+uz51V5EQ1QW+7qmcKnymMmVXqkIRdGD+N9oG29ykly?=
 =?us-ascii?Q?/2vt2V8SP2RF0g5W1iZOTGueXzR/JlQ9gn51Uvrpqg82vMJ6IQAhjUlm61Ew?=
 =?us-ascii?Q?UNWF6FGvjhWKAk0PLvmWd2EFfRw01vDpbdKfCecLdqz+2eiPnogiBCXmVjyN?=
 =?us-ascii?Q?qE7Mvyc02Z8NTL/UnLz0pOrChYk6FvzFL/2m754+bbn5XZeLdIMWmJxezsSu?=
 =?us-ascii?Q?gyYiKPZMb4o7AOfdsgiK3JhfAqlAGJ1SiFP6XAJ0Of5ELhovyjRzcGTbHZFz?=
 =?us-ascii?Q?OHBUypgPDKXf8hJ8Fe/OqbEANO+Fy5CZwOrmeHz6nByg0D7a+nxcn8ZY5/9/?=
 =?us-ascii?Q?Xe+y4kknIMG3QKczP44odop9z6Yc8eyjVB4pAOevbPwTa1xQToZLf5RcEpT4?=
 =?us-ascii?Q?UMjFZJAm6AWS2b8+K/hbbBntBbrgt4p4I1CJ/tmC8NKLyvj6d2nnvVO9+Aiw?=
 =?us-ascii?Q?g/HK3tSwi5ABV8HOi2y7zDllwYHc/AsjbLOk/c/EdVN+l9Xca3ZDWRMevY/+?=
 =?us-ascii?Q?GX2i4cAhASjZSRqnD7NHQmfUo1BMp+dVOL5fxfA9ClXuL7R4sE71fblUG0Ke?=
 =?us-ascii?Q?WGn+kLoRrubOx97yC+R3bn2pZfnijO7VGg+77rLQ0Pp39ulMnrJ56nKodKMI?=
 =?us-ascii?Q?IAHXYMBm7j/s7YQ1lU3+Uha53Van3RQi78XjYk5GTWuFY/iIgJj/LmkXkV5P?=
 =?us-ascii?Q?GKyQrfa7nDABf47Vj7KsxsjCVXu+UGqKNmRXNGKce4bbcaVx6UAwroL18hN1?=
 =?us-ascii?Q?VqjGy2FFKdV1dY32e0ltLuvo/tg0YfhKJ3Z3ERRxgGxBGOlvhp7lYlzmCkDB?=
 =?us-ascii?Q?f2U9Dl3PPnbk/OtMtnMXrm5yYc8fx1OkQRik6jbHnaRS+94v7H8okxU1NFlf?=
 =?us-ascii?Q?oS7wSsH1zZCdjdF5VFW52dv5nF+kY1yVS3gIpMpDP/tfOn7JkWAJTZjgRlfU?=
 =?us-ascii?Q?qNyBWptC5Nv1JcIVjlqnUl2J77bMW4DwoViWj0Od47VBjw7oShaFuNVRTFdJ?=
 =?us-ascii?Q?k9ZYBS3mkttbMYSpiZO8dUK+UYUHn130Dqz9TIjaY0U0lFTA018/sVcssAjI?=
 =?us-ascii?Q?vPzPvpwXBX/m49fGgQUEzS65j8vtIHoJvoo1Jzf7H4ZWE09bzqw18bRS07Z3?=
 =?us-ascii?Q?Wtw7eN9snlG7OX3TaxIUlMHnrlm/u6VKEethl8D9hlk5d3C9LPjkanVxd+yH?=
 =?us-ascii?Q?xByyiQ12hpflSVQmQMq5Dxte0cqpJz9Wl3e4PlQW8PipblUJs/cr636/Muvg?=
 =?us-ascii?Q?H5NU5C6Q2MrrsdPNSNndhZ0F1Nh6roDXRkpjWEppp9LT9rH8zfLuhCqQYuc9?=
 =?us-ascii?Q?YSVCuy9oFgeeF0m5m1J9ZRiCJ+Afue2146S2pwW6ATOs1D0Y4nCIQjdjrQT+?=
 =?us-ascii?Q?x9m8bluVIHMCc97bf0DjHcDrTT3GbHqzFy8n5VVtvYa2lmhTAolJIsA7j4/S?=
 =?us-ascii?Q?2MR6nOcKCrViXyVG0unzaCFYvdxLumKo0BKADdHERLkjo54oVjOjb/nyu0fY?=
 =?us-ascii?Q?OWMnLJDWLUxrsWOVh6Az9d9fEKuk+C6TMt9HUB3otORVl3iziVdItIkX8h0l?=
 =?us-ascii?Q?+Dfds1HCM1T8XmHUWmBodvH8kg20O0yLCgEH27bEf0dHvHw/3R6Cqlubcjjc?=
 =?us-ascii?Q?AHmrTD1zEuRBTqohHDZirLCgjm8s9wEP+l8d2gFqBBxgB60tzRsK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dbed023-3786-4f2f-a656-08deee6b3ee8
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 18:49:12.6773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gn3Snr8baVCG5MONStBdxKWdL22+vC4LlRvgDm9sjZSIVYEX5a/DT8Y5OrmDYyOaDfUhFLIepdbaQ6kACHYSTwL6mS/Z3RMr5bLvXtWar+T5EDHakRv+/EEPsrf16uk9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10961

On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> We need to tear down the irq before edac_mc_free() to avoid a use after
> free on teardown as request_irq uses mci as dev_id.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/edac/fsl_ddr_edac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index f4cc89b26954..f1ddd1f47f2a 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
> @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
>
>  		/* register interrupts */
>  		pdata->irq = platform_get_irq(op, 0);
> -		res = devm_request_irq(&op->dev, pdata->irq,
> +		res = request_irq(pdata->irq,
>  				       fsl_mc_isr,
>  				       IRQF_SHARED,
>  				       "[EDAC] MC err", mci);
> @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
>
>  	if (edac_op_state == EDAC_OPSTATE_INT) {
>  		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> +		free_irq(pdata->irq, mci);

here already disable hardware irq. Just call
synchronize_irq() to make sure pending irq handled.

Frank

>  	}
>
>  	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> --
> 2.55.0
>
>
