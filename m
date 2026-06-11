Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA73E1231;
	Thu, 11 Jun 2026 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781197282; cv=fail; b=o7eeb2AvxK5kUMynVbfRv7t4AUdebP3nZBEX8Xyp28TWdnY2XV4IVgqjDuEAY7LvqmIXj1SuaIuGS91tbJr6fmF8mykmuddw9800g0/rGA0nEJZHnPsNAVs1hPQfrgtCs9BPa1wvgnvL37QrcBcdjsamCSqp+eyOO0pBiLu0tFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781197282; c=relaxed/simple;
	bh=6O1KEM5FUBUHRKQ+HAsv7HAJRQa9QpDpT2Aszvl+zUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IHTWLi1fk0d7/3gjd8JF7gDmwDKqeGO1nG1LrnbwWfAZVhNVrN9dVjMmZ6kheNdl8ztmtC/QKI4Mo2oESLGHNW+DYb8NOEeQcZQcG/lqy92okooyR0RzFgZ1QEMwhem1nYCh0ZFa/6AjrRw+YRfD1EGt40TnzL4YRa3EryLOmWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JCesVstQ; arc=fail smtp.client-ip=52.101.57.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JCesVstQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfNiHqeBFlDuRabWmV8a+hTbyo3zwV1/iOAg58uVm2xCjkrg7sxqZ7M8ygkf8ikPDDF50pa5plNYpEBJ92NXKaegp+yL5cFeXDjAWmOq23cC1zUHAxvBaenzMslTOTLLzfNBLHwT3TWpp1BkGyJGftabyC3SJsPF+cZOU44iuaA2BD8NWjt366WvX0CuhujXadt+VGhazVZ0OwzOImT20lnLnQNBMt/UkI6UyZqZVVX3WETEJrT65UcWaj7oOKfZTHtDT7pk6h7jThnAal7rRhqacrMxgEJyNTWLerucoqEyVV16/DfsskmQXsioP5gaMG5n571nepxJwdX0lAN5Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCnkAW4TQwfIHvGDITy/Cfg9ebcZxXftOfdGJ3D7K8k=;
 b=ctSIfQVbIy9KUbIocIzHD6N4//GK6y5ZCMKJUJDGVhT+yuXLWZjAbEdeinlS3dkUU+T9yvZ6sYipaIAPEoJNibiOzDS+jfHAjx2I8kIUkdLKaN9LF88fYgB+2nWwXI1BqIkc7Sh8hKeb7DRXTVuQOHFVb1PvCKZfigTrlGzPPeJJgi6IlwDt9HVW2Pw6f2QM/t6G1uQLk38vTNF6/iM9ri9H/xpOtfP7Mc+wfJeNgValcXZP8w/PBYiqOmBCOhtj3iFC9LyWfnrVUUXrZWtmM/07KiF/SBfNfUxSON3cjh33S7us8XwTLHVFoj7NaepWoSyo2S3v+MCWa2uh2n4KYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCnkAW4TQwfIHvGDITy/Cfg9ebcZxXftOfdGJ3D7K8k=;
 b=JCesVstQzbNOYi6Sw+uolG5FMB1dJ1WN0ZQk96z5sQd9iNhe2L557hiALxXAlchmBcRWT64f3Zw4f5Q87AwGgdRRsbv7soIBQp97FeZoeMu5okie+RVnw5QRYVVX+7ZrWNmp0LlkvpJqRhN7J6jKdWd9FYzuR3elDSxpIc8edOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.13; Thu, 11 Jun 2026 17:01:16 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 17:01:15 +0000
Date: Thu, 11 Jun 2026 13:01:07 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260611165458.GA1105@yaz-khff2.amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
 <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
 <20260610211541.GA831811@yaz-khff2.amd.com>
 <20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local>
 <20260611141138.GA978852@yaz-khff2.amd.com>
 <20260611161611.GBairfS4UTuG-cwKjO@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611161611.GBairfS4UTuG-cwKjO@fat_crate.local>
X-ClientProxiedBy: CH0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:610:119::14) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e6da74-b1db-4ab8-48b5-08dec7db0c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|22082099003|4143699003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	45ZRugfeeQyTyMyJCrMFAVcffykSo8i5+aOXqltk2xogaG2L8FmYC/7mrYBVlhoaYaswzn5VKcG2uTTCYDhVPvJh/GlNA4oGgCGPssFXxbhd6W6jy88zQnWUgF+XMVn5l+JFnf/DWox2tBaU1Hs443ASOvEXdvallDN74syw0F4GkXM9dF8B/SHYIYIqrZn9z1GulbC0ZjOQEHx0Mqk85F3CH7Zl0NMIi7DM1qBTYgyFcVAa26dxHDCP84z5u3VYB5aTjIihOVz/f9qh4KLVQnrL4iFzFwTRY5ukTUJwzhBhXIlEvX7Z7zMXjO2qv4WdQyBsRx4eBWkQ9GUpiI4sLROKqRrLJl8g8wTF5zm5FHACjetQjzcMGJlLJm4YNxUr8EVMYCcOXxogVt5FBztK5z2yp5vcflR0MTU1JL4ovp/pV7CvnnNJ342/VSwvTESeH89pSPB19NoCz5x76HXfGOXkzkEixRY/tjltNvUTak15/QELwXG4fiSeTEjjjR2YY6P9LWVa37LlbLI954ueP5qc7t5wRiD0+y1zoR7jWOkslaH92/gE18qOAS6+bKzy2f8eCj1ZgBrFi1gN2GI/cI7igzMzv06lBA0pI6kH0gnrGz/U9SsQH+mvxBl7RYbwQP/plYALdHNGHXLS6ezdbMsLFaWZ/zPznOc39m4EWCH3as+0WRmJDWaRDCi561/W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?20NNhvMUufxDEmlcd1z8lrPOsDbzq+VKFKaKQtdqCW7aUUEsb3DRpsPYKNy7?=
 =?us-ascii?Q?lUPKpS5U35ZZro17XDwMgBPNZxeMuLXc5rYZiKL+cHYhKvZxkUDqFI13vPPb?=
 =?us-ascii?Q?5Yz0fFZJtKLjI0kIp0OdBfFvxMR+KHe8ZyP8GKTY+se8I/WHDC49VENap6eO?=
 =?us-ascii?Q?CdCM2qW/paNZKbYhVZRpINiT+Y9ma002ppzS7aeI7Zudw+02VfrhlzCwgDeI?=
 =?us-ascii?Q?pP5daTmYbBsn/V/AAvFs6E15Ang81rjYIwV6j/m3+laHE39+COr6lu6YzFEN?=
 =?us-ascii?Q?QfFgnFrgeS2golvBJWXH/d8ns4qMvUJsiURB3FZATRXemegM5kRTzEOpn58x?=
 =?us-ascii?Q?RY0/EvgrnDs2bE1CGCEtpxQzGcGRt0bOTkmOABufDgoNZN1/JEzFmNQPcSmP?=
 =?us-ascii?Q?wX2M04ArWQWxWmwGSHzakoxt9UjZGrphILIe2I3F3kZyfIWVKnyODrmCce/O?=
 =?us-ascii?Q?Q7gJiUw4Px8Z/M6TU711qoZYGfuQ3UYg+BxIWJWer6zU833+zWNY75A3iYci?=
 =?us-ascii?Q?YVQ0HmKnBo4rlXwI2TaDZUgbhUfcSBKqA0eAtXlMpWjvxG3tVQJHtavXoDDf?=
 =?us-ascii?Q?Mc+uOM5UVZMayGtFPG7Hdq06Vr7lAvR0OK8vCiw5bksYbO0pCthT1yegPl5j?=
 =?us-ascii?Q?zxp4RxIOO86u+thrx1Sem9VgE8yfjrNcXAjAeHEZV3UdMZEZa/fRjzKtzuWU?=
 =?us-ascii?Q?fAZaCZufEJaQoFcy4OOhN8pt9LZ9V8kc8+FfGeiF7HBdQ+PB1LLCWRjsKXJa?=
 =?us-ascii?Q?7CPSo1RdAVfqFBT/a+iSAhays9NwJQzwP4vqAH/C7kU5d3QYPiftTxJclNNW?=
 =?us-ascii?Q?rv9CgE7H90pZTsvDHNL/rFTKFqxvtVjRDWDwWtOP2qAaAZ3etV1Wz1eEuNrX?=
 =?us-ascii?Q?mYCi+XZhYeQ7x6aRM1MFkbedebfouJyn1Ba/WPzEbUx/8daPu2/XO3H/cSKM?=
 =?us-ascii?Q?Z61x0Px0qphLSeUW0ghaiTl1TRKihiIDSyagcUqB+iocXXTtrzIl6tp0o6WV?=
 =?us-ascii?Q?Dy458Hg3TgmGoHJxTiTqffciBvfcpNawem84PFRqizaz09TDFq/yiRLhGcsP?=
 =?us-ascii?Q?xCptt0hESsyKjFpAoK470vA/RU3RoSnLx+pkxC6LwmqDaSzz0DFYojflugr/?=
 =?us-ascii?Q?D2T5t0RpwByRqQR97/iByD+JOqzl9fdAZyANFbbe05TqcHdaECFNkLRIyQqb?=
 =?us-ascii?Q?igaxWcl1+JqZhUN7pUyD75Zx51ESG21u8reBFQwVbQOPfm3bfzcRHVIdb5g9?=
 =?us-ascii?Q?FW2aMzdbe267+YxP8hBmEf67xD//09DzfHumbl0n0Qted0Bg2s2Ex7p7O9BS?=
 =?us-ascii?Q?b7XiBKrs/k0rYbquVIOhxabVceFezwX7lQ0PHOs8Pz0yPZw8dis2t5+/C+Vi?=
 =?us-ascii?Q?Ce3M+dqLGPnd4zRemaA2ZEytmdyMBjfRI+3hI5/5l0O0GcwjW/3shBaV8rhi?=
 =?us-ascii?Q?RHp0MYEomw9WBa5n/VqEWmXhwWnT8NO04nbPuJpiBe+nOfahWiELdJqA/Zis?=
 =?us-ascii?Q?m15QGhcDPTgxLryJ5DknSHR4dytuDPwG3M1Y0UsqdFZXlo40dzrdEdI6vCz9?=
 =?us-ascii?Q?AOVcz8hOpO9cLPMDt5fbA+1yH9zvBGU4usjuT0jXa5pmwCPwxP1fxQ5DAmt6?=
 =?us-ascii?Q?ymYHDo/Ofe41svtuCsb8xOwCYt4w6RkDQn1wU1u4asBgbOkbnXILhTwSAmQw?=
 =?us-ascii?Q?pTyBVhOB4/7KDn9HK5xoJLp0BaoOkutPlBhJq1+UnZEkwoUElR4mBF/GfmO/?=
 =?us-ascii?Q?9FqOoUAYQw=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e6da74-b1db-4ab8-48b5-08dec7db0c81
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 17:01:15.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZFSzYXi+jfQEmkFKQJrEv4UVRrixPbO6QJREVlBgUiLKu+Y+jfkrn26eYjWhQQguW5V4mXoPUeHfViXMY4srw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885

On Thu, Jun 11, 2026 at 09:16:11AM -0700, Borislav Petkov wrote:
> On Thu, Jun 11, 2026 at 10:11:38AM -0400, Yazen Ghannam wrote:
> > The fake_inject fields are targets.
> 
> Uff, true story, I got confused, sorry.
> 
> /facepalm.
> 
> > Just curious, why not leave it? Do you think the bots will keep bringing
> > it up?
> 
> Ok, someone tells you about a bug in the software. You do nothing?
> 
> When do you fix it if you intend to do so?
> 

IMO, consider the risk and the outcome.

In this case, the conditions to hit the issue are rare.

Real DRAM ECC occurs and logged through EDAC: rare
EDAC_DEBUG config option enabled: almost never
User is doing a fake_inject: practically 0% chance

If the issue occurs, what is the outcome?

The "other_detail" string gets messed up for one of the error logs.

Of course, if no one is using fake_inject, then removing it closes this
small risk. I guess that's the point, right?

Thanks,
Yazen
