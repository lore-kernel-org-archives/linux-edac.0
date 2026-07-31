Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011070.outbound.protection.outlook.com [40.107.130.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72203AE1BC;
	Fri, 31 Jul 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510742; cv=fail; b=LNY1IqqgRAKQMMA1ikbQUcO6iIHZ7CUp6ZaTpH+x4a2EQ5ZWojgIGa9SSqsIFItjS5SojWJijMPlnwQMq+LelSn+QCH1D5klP6QUKZJy8/fa89H6nDRBpN5Wx+nt3LUnsCH5M/I33T18t6JXO5F6lsnq6Xo4uNA5+zLpwZFbsX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510742; c=relaxed/simple;
	bh=8v8PFhKvjUvoQxB34g/+v+Rj/wXIk4OXzvVqKHQBeSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhyugI5Yo4mp8j9AFcm2fITx88EFrlIymQxjt2TajmbLuhak7yuGcp+w+UVTyihdTNd5jLRKFVk98Bf4k8P7GQbY4pKH5Xv/HB/lGtBPKZ1PvSmD29sGUIK3ZSMxVII0/P1KeJx8XgXROzSxNV21OQCuzA4yuZ5LOu4K4FtohrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ikzS5wXr; arc=fail smtp.client-ip=40.107.130.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ikzS5wXr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=he9hg8RiPFXqSSSt+o1h76oV+is8i2JU9oblk3y2i+JjGfR3Ed2osZdH/53nf1u9OAjw0HKuzitMw6ad6dry7XGzZXg8J6n8s82lR8sqqLrrttgpQAjHsoscGEs4okb5I3KFgT5YDL9EzKdpY40jD2PBckYNQbXKQfaDE/Fpawr4lE170LjDEO3mYNw+0GKLIg/ucXc+leBg8pSDmiG4qmjXSYvR0yHAT6R0Ql9Rw0QOdRYT00yjk6SR41aUE5BIo4bT2m1IQurntcap3THYNBYnLCcqAfXPPBrXXvzv+XZGvFhwyBX72mIMxITU/aYHxkY/QN3/YqcVC6d0ohBlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvGnixgXKJeLJVdUd6UFbSNmKpcAR1SBvItVtN+2KdU=;
 b=cdnkL+8uy2FQh6Vx+kC1R6JkETr7pHYbP2wOpmKtoQHsS+cFuRn/1LcTmgM4zy3wKL5t3NQlCczef53MEcT1AuhHrH38P/AUl5r8bDZfxMwn+7awxtCtmPmlkQoS3pNLLDn4SwPBeCI8a06h17mvw7f+RVi2tvXPX4pwiuTg1aC8TZmxaCQ/x9UnjGciDvWoELNW8O7sLgvUKSZj6aTpuUsxFfZ1E0PQVmJ/O6T3kZWpNjQji1ABe4xHK525VpGAmaU6F77ze0y8bQiKINkiPgznhKy3H5MaKafxrEjjpua0FWrATaHASl3rydH8M/w9XkJ2YSOXukrb5+mt+pOrKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvGnixgXKJeLJVdUd6UFbSNmKpcAR1SBvItVtN+2KdU=;
 b=ikzS5wXrfxz0jtoisjm5RUyYf716d8bZZa8JmGOfAc39s2okxYDxBb0IHhhbV3Rzm/gGPl8LTiODNy54+nEF0FGCOz3VFUmH+GW644mq6tlUiFK2F3VGFVRAvkJeEwL/HlU3Od0baZW8l9fbnJLpOnpQBI5YhzHtfIpfjcjReIZJZpG9yfLKdfkO578pPhLGcfm6r4WYa121NtrgGGlIrxta7isp+/pEjL8XXBGcdvys4x9EDTATlQThafN/EtddzO3yI45U2ThT8zRpFge8bmUvtg/HbB0Hs0T6JdqthPdBETmmeY80RiiyGTQ/Tj2eV9dq1HISweOKgWKWRr2C+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 15:12:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 15:12:15 +0000
Date: Fri, 31 Jul 2026 10:12:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Message-ID: <amy7R6W5aJ58t6fy@SMW015318>
References: <20260729012320.616174-1-rosenp@gmail.com>
 <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
 <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local>
 <CAKxU2N-GnnSqTPPSYwpXiNRNdP+qdJWf+ueaNQQWNKvXWag3wQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-GnnSqTPPSYwpXiNRNdP+qdJWf+ueaNQQWNKvXWag3wQ@mail.gmail.com>
X-ClientProxiedBy: SA9PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:806:22::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a4640d-ed9c-4f99-4811-08deef161aea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	S/vqZP5wV7UoKElrUgO/Omukzxryq6reLfEet/KV4IZfNJQvWeSkLE0enUFF+I4MU2d6MUAsHaF6E03pJaMdemdAKRybqBDYxm4tV/7kcmu0HAyamccvzA2pzT60qaFVtivN2aCkmvyFY8T1serlpdDp0t1LyRdmXMvEOIxtJ3LfpzUsDfqiFQVWXpeYbjxOhjCWPvS3YbJHdTf+0RR1dUGSABvyI3mInW9eMLUJezxkyCdnC8cBPj50tES95bTw7b1reC9zKtEqtz1sqGTfvP+CBJ5qOiyiT5AavKGvEPggg/bu5f4JVSB/uZEn5CxiUhhvlpjf+LzJLU7JRFzOB2FIe0rg/teDMZfh6Elx9rNijx+piXE5ZTB6IO0MXbDdBSSWlCuFlOjDFrictQdSy51E5SyxOQTiQW851QuERy2aJO7J0ybAR77arFyLLJxK07A9QkdvbDjDgXOXQ2iQcf6MtxPPTw9U5mi2JcssAJPnpzyOvxPCIUSoS8sEva9IWMz0U0RjuERyX0tw7tczEmb1yzU3TsPhK8nLTNI3dCEIALh0Im2tzCONeqCos5FkKsCuMsvA01P9l3gkeh3W9jZXcN0R0W8Rn6zp9lTGDzFls0QqIoU8dIF/lt8aK6FPa/Kaa4StLsBp7kZ06/SSw2iGJHeYw5KBwq+If/foJh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNmMllGdXh3Q3ZSNGRLeU5ibk9jMm9WVEcyYjUxU0dUMUNnMDFZSEM2MTVC?=
 =?utf-8?B?aTlpeEhrTU5PbGpnWXpMc3RxMzJhZWZJVkJQeWdxRXJFQXJBL3FobWpLcG51?=
 =?utf-8?B?K3NKVHA2V2VWZTB2bEZScFljLzdtVGVKdzVFQ1A3Vm1UbzF2ZGt0clVuSWZh?=
 =?utf-8?B?N2lyN1NzU3U1aUw4NmFmeElXTitQb2lVSTAvN0M0c3Z5SkQ3Y1M3TnFlMnVp?=
 =?utf-8?B?Rlp4dEo2QmlKaGZqK1NSWlArSmN2dGZHNjdWK1BrcldFVXppZHk4c0ZYUVI1?=
 =?utf-8?B?aUVETkh0Q29hVkMrRjdQUFJRRGNVK0o4MWJzVjZ0NHQvaXE1VVFYV2MrOGs5?=
 =?utf-8?B?Uk81YkRlUUhoNnBNYlN3WGxCSmhFM3NRRzVpaS9tNzFFMVg3WWYycVluWito?=
 =?utf-8?B?TzVaeGMrWGNxZ0ZMblNuK0R1NWVwWnNtL1RwcGFVNXR1VlcrQkY5d0lhRTFy?=
 =?utf-8?B?SWZrWHlFeC9RTXVPeWhYZE5tTWNleGJKeWdvQnQ4U0JpZHNOQUVaRTBlUkl1?=
 =?utf-8?B?MUo0YkNGVGFaLzl2bnFRR3NEZ2hkZVdieWtEREhkcVZLS2FJN0NEZlVEZUlk?=
 =?utf-8?B?Ky8vayt0ZG9iV21sTFdxZG5aY0lWSmxwTXpCZzFwVVh3ZDQyb1JZMmRqTnJI?=
 =?utf-8?B?U2tDSTJWR2YwTXRBbGVIVUtRbk1VWng4UldoRk4yMDVXVlhUMStKWENGaWdW?=
 =?utf-8?B?czh6Tk1VY09RWWRVTkpDUkFpejFWYjVPU2pNR3RYNzBudGJCSnFJT04rTlZW?=
 =?utf-8?B?Vkw4RldvU3Z0OFlNWGJ3RDF1TWRjcTBPUEMwbUNGaWJuSUozYnMyY1F4RE1r?=
 =?utf-8?B?UXNQNVBhb21DbWhWaE1tamRDNFU2RTlFdXZGL1U5V1htT1BUYTdVYnI1RXps?=
 =?utf-8?B?MklZQ0ZnampZSTlpdm9obldmUTNuMEtzTzhpTHphZTUrMFVVSEpYdy9BSERM?=
 =?utf-8?B?TzVJSjBVZnpHWUxIWXg0TzFFaE5RcXpZVjBMSkphV3llclp0bTZBRlFDS09j?=
 =?utf-8?B?amxiWkFPVDdSaUNvYkRPajNYM2tWTXV5SkdNZHhYZVVSNjJVZVFSeERsRkdr?=
 =?utf-8?B?aUhjaWcwRlZ4NlhIMXdLN0VtaE4zaGxYeW9PbXRKYkx5SzhGditERlg4M2hG?=
 =?utf-8?B?cjA3cWhGYWhNVUM2bmdtUHRZM0NvNWtsU1BLUzYyWm8ramlIZk92RmxWdjRM?=
 =?utf-8?B?T2dreXN6QmJMNURHb1c4Z0NXWlk4Q1RGdUdsTTk2MGNBUUZpUTBoZEhFMGEr?=
 =?utf-8?B?NkFVY1FUc29ab3EzRC8wYjZkbFNnK2d6MEowbWFVN1lCa1BtTVAxa0pZbjJE?=
 =?utf-8?B?emNwK3NwaGx2bkNCTHdvYzVoRUJiVy91MWdwcGp4Zjhwb1ZzVjZidVFXc2pY?=
 =?utf-8?B?dGwxaGtaNXNVbzMyU3VpanZydDNCZW5sd3NEeDFCMVN4U2l2MVhqTWNSejl1?=
 =?utf-8?B?akp4LzhTb2VtWjJpZTlUTk1MZE1JNEw1TFFja0tEWEJ4N0tENkIzWXRtNzls?=
 =?utf-8?B?U3haalViL3hxQ2VycmtTdnQ2WHg2V2FyQ1dGd2c2NXZFRnpETGdMRVRoQ0Uy?=
 =?utf-8?B?djNraTJDU25OcGpCRnFneDVkUzFZR1dvb1FnSUxYM0tpMGdoSUJ1ZWdKZWxL?=
 =?utf-8?B?eFdSV2x0VmRpNTVTMHFBSGJqbDNsSm5WWFRIMi9NQis5eXhMZkY2cnpIT0VY?=
 =?utf-8?B?WlR2ZThIMkpNTHFVNGwwTHUyQllTcDRrWElOVk5WYndMNDdWUW1sZitHdGFH?=
 =?utf-8?B?QURhRDZEZDdqQjBhNVp0M3Q2ZlczN2ZORkFWMzc5RXZuRFY2Tjl6bkEreEND?=
 =?utf-8?B?b3RTQTBXYktMaExPK2JIbkRCT2FMdlZSVGRRU0RUS0ZQOHJIUFFCZ1VQYnps?=
 =?utf-8?B?YzBDallSY29qcjV2VEJkNnBFejYrYXFrR1NSUEExNGhmZGdjSi9OTzFwdU1F?=
 =?utf-8?B?S0F3N01QSFZRcVpMbTNSbmttVUdkMndEMExrblY4ejNqeGN2S0lpRmFwTGFG?=
 =?utf-8?B?Mm5VRGMwZkgxeithcFp4K3hNVFR0eFJaSW5oUElEU2g4V2xQb0tiWVREcEwx?=
 =?utf-8?B?WmFFODVlWjl3c0RPellJVTBqVmtBL2FlYUd6Mko5ekkxZTN3cXg1eUZyQ2wx?=
 =?utf-8?B?aGVFTEZacUJLSmdKMThrRm0yZExZb2lFUE1vSzhFajR4cWRQak1XNkVCK2RB?=
 =?utf-8?B?cEJYdTlicDJ6cDkwNGhJSEY3ME53MmdRYnB5dW9FQ3dnOGg4cTFON1ZvVVh4?=
 =?utf-8?B?ZnllaEhqTVByMDUyL3NJaFZBRWdteUJ4elk0eVRWRktVK0k1K2laYlp1aTJJ?=
 =?utf-8?B?ZTYwZTcrVUZZU0l6U3p1Y2Z6bmg1SWpFbVNhVUI3S0J6WHc0N3Z5V1hBd2NG?=
 =?utf-8?Q?YoCY8AbXFLctPRrEwhibSJwB4mDxN4fakSr3x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a4640d-ed9c-4f99-4811-08deef161aea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 15:12:15.6558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCede+M5H1vjqur8/6mk6htNvRmTfjO9tseP1LhnVdsvqRDkVnZo5FS/E0uy6CpGTnnXHGjXORW3dhpU2yuayVaIXBC/OuoqvchXthRPGOf4jCzf10uag1d+/y5QdI54
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942

On Thu, Jul 30, 2026 at 05:44:34PM -0700, Rosen Penev wrote:
> On Thu, Jul 30, 2026 at 5:37 PM Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > > here already disable hardware irq. Just call
> > > > synchronize_irq() to make sure pending irq handled.
> > > AI disagrees with this suggestion:
> >
> > How about you try to parse what AI says and verify it yourself?
> Makes sense to me.
>
> The alternative is to use devm_add_action_or_reset for edac_mc_free.
> I'd rather not do that.

This one should work, of add devm_edac_add*() version to simplufy probe and
beanfit other EDAC driver.

Frank

> >
> > --
> > Regards/Gruss,
> >     Boris.
> >
> > https://people.kernel.org/tglx/notes-about-netiquette
