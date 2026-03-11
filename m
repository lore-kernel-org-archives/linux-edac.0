Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FBF31327A
	for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236313; cv=fail; b=RaryDkbFjSa4rXRbyExMBNh3Zel6TR2/wn5vJaVUovFSr0Y+yBjIaq4SZ6CcrkjvvQVNc8lxF7BHVLpOdqCg6Ee8u0e2hFgFyqs2+9dfoifJM2n/har3YnI5TH356gHItEcw8EM13Ebdnf2xd4OyP0TNVMQ6MNQ5vS3Xm801zSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236313; c=relaxed/simple;
	bh=4KCzjEql6Tln3+WNhOXfA4FA9lW/8yvNBKfD2ahafcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ScvM/sdMZhrAHvDZvEB0lWn/Hm0LA64cyXDvtNHKZjpCxcjq3d2rpbnv7fsj9iUWIk6OZD67bcLNN/AIUDb7WcSbhHgYLf+WMqnY67SCLsm/qc+BTa1Cw2pGon0fyvd+ElW8AVae5ziku3u7x/YRwxQck7q+i83GC8c+Ba+ZeTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xe9xrXrl; arc=fail smtp.client-ip=52.101.61.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xe9xrXrl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yW0h6qFNjnfjjQVCWMLfIx+xT+zbZngSXxPojgfg4lbwqUOJD/ZSQBLmf5e0MZoFtsEwxuiY5FnW1mce3jdTiNrNemyBgmQil6mKSOQU2K2LLHs7vPdmcRxwdXxUgK7AuDXeQHWfZurJj6xKle53PteX0itqY1gJ4XygzJ4TT2y2giRkVMtRM/KDBe4DPM9+gYUk5r10MQtwoyqyX5jFf8ESA/isIpL4D3nqhuZBDF+G/T/Fp2AB4m+I2TvFZPfHbe1Eo/1j1sAsn/B5tmsj8oQDrgtSFG7Gw7JgNzXQJOYNrVB4SDCyufHf+OMhctl6tMbtx5CvxFOv9ARAjpsv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37DNG9m5xKnasu5gva4KXhuIuRz6cjjGks1AdHErBAg=;
 b=SciDnxfWvs02xkS7fKRlkfkQ0kK2Z+YgwmzKMbbDp2idalGGTh+hKC9tCm16RiQqFg4/mBuiYeewvUdYRawV3ws2yQL2KAoK8vB2hceQR9a8MkyKet1BDzrH3CAtFvjPtzGyuoTtB9Lka6zXQm1Y+HaY9xGYiseBTgftfCHadqBEIoq0b2jMD++3VO8KAhAmW/ygGqSPWOZlCEZUeLdD3elkMWLkXCGUsYR8oERLTtYcyxTUaF1A/rM1PjWdupxz8zOV+FLQiGZxKyBR4BYe+o60VEahikhTTfMXFh5bostAw1BUSiLz0QJd3pOB7xGPDEK/N1M/fRcGExgYfpt8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37DNG9m5xKnasu5gva4KXhuIuRz6cjjGks1AdHErBAg=;
 b=xe9xrXrlWyA9UhEYPKNtLJjwvpLm3R2rtG2knIZllwzG9NyozHeYtASUZa2bji6cXJBaIFFoMg6yGEqjdReK0zlmpvabHJGzQjGnBZH6Ul4ODjtZER0JmxLLwDANRJX+NuIkU8acXfSOWvdfWo5hhByReMHrb8bcp7/FKtafpX0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.12; Wed, 11 Mar 2026 13:38:29 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 13:38:29 +0000
Date: Wed, 11 Mar 2026 09:38:21 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	superm1@kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
Message-ID: <20260311133821.GA1495223@yaz-khff2.amd.com>
References: <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
 <20260310125422.GB890303@yaz-khff2.amd.com>
 <e6fa4686-5bff-43f2-acdf-b4442452d4dd@amd.com>
 <20260310165225.GA1166706@yaz-khff2.amd.com>
 <943824a1-d5e7-4801-a0a9-c4e875ad286c@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <943824a1-d5e7-4801-a0a9-c4e875ad286c@amd.com>
X-ClientProxiedBy: CH5P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:1f2::22) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 12609fea-2e2f-434e-504e-08de7f737aa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vIMpjcLiGeVOwwEPTGj9MwzSOfmjDbyB4ovEqCxfn33zVW2qqSW7OLe95KorP6SaFR+hZaPjJw5FOJK7c5ij3DrCD38u4iYJEG3yvQGbjeDqXTq4SM1yf1vqf4dsfEs8pfMisIGC77Rgsl2K4943gSS2/a1UduCf2WuCzApmBfgtRFgkT6ShXpeZu+3mri+c5dfcDOni6CJrtUyhdTa8aK0b0PTGyFimmIAeQwDCcbMQ4BbY4mjNS60w+l6yTUSCcCzoH1SSI1Ox0B5MmstlPARqKrSuLJZEKZ6QLbRK+HxN6Rq1UJmkPd+3F8hjqfCTuLTJgJFUV4N0Jo5gLj3qB20XZYxvINlOm8AwnHKNaksfZvcFGaZEhi/rLEqBD7yZcCAZEEq2V1u70EP28g7o5ZO+wVlSo6ryZgd7JfQULrgMSFf/Q7SLX06y3VBTkxwn21xSoSV2vm2+CJ/b0l5YhoZbzoJLEran4y2lU475vF6UcWficYVaC6ZsPV0oT4Kbny4GCvUl2pudiqH/BJwvtnAtytzbc5Aoxp1yjTLXvcMJ7Dzrdwr3Lc2UvMpRJ+epd149oSDnnZdD94iLYmBYCVmSLH2WSy4zpHNXOP3+AwcJBSMuHzAWqf0GBPbRbOO5dTPHqjIfKdLukaZeO8zvhR+QCrrJBhr8MD4fcNiyfGe+D/nuXX/wo+v29qOj6e/UM5z8aAVXc6bR0TtVnfg6OuMO0WPig9e3qLc8udHFV38=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAzi+IREVPNkEQ5VJz5sXMgE57yDBL7NJloojLe/2p40zBHaQmw/TgF0QqU+?=
 =?us-ascii?Q?2HPLov/k1EeupqB1YWehJvH4Yz8f+tUURV/gjOvj9x0ZLjISs/oNrKJ8tEZ+?=
 =?us-ascii?Q?9twM0Xm5QKbMzZDe0oGXjsPKr16IAK/s9ohbrYG4P0lDMYTWt0UGB8eontG/?=
 =?us-ascii?Q?+t2TfAW5B+ud+1w/2cnp42tWBX4F1aA2bbdsEnT2BlpGtnnxuz6BFsZIpgzn?=
 =?us-ascii?Q?Q6cbrjiujENiG8SNjZcY0PU4noGNgbA4lTDUU68G0dRbQYktOja/O2fPgSWc?=
 =?us-ascii?Q?wDaYfDaClDfk/Oggw5ETb+K0PGq1eJCdmNkKKieKs09SwXcnjbJnhKcLkn1B?=
 =?us-ascii?Q?Ta88JDJfCQnkYPxaeyLWXYRpAMIq79H/IopNlSjXdE/sAVA6DlK6uUFjQVlm?=
 =?us-ascii?Q?66VZpDXHcdYLjdPdF8YjXoE77ZBYWtT+/zyxKp/y3qIdplhOfb4M7WYr0g+I?=
 =?us-ascii?Q?lu1Qwjj4JoXAtEPEe86Tr0CbY8MC2J7iAkA32a6QBJGiRtfNKr1jEuwoTXXi?=
 =?us-ascii?Q?141/tZbvpSF3K7pFnjwrlgFiWe+frAiSu0nX1BZUVD1iYJeNVThfU0xlAjEc?=
 =?us-ascii?Q?FxIghnwOXncy/kKUoMY1f8gEEYcBoKZWE37VKCOyGqsvkmiYm1lr9VsS6fUS?=
 =?us-ascii?Q?hCPkYBx2rUaTgWS7XbcZ5Rej6RBub1+L2f5RYZXuxkJx3DDm0pCMU5cMqT0Z?=
 =?us-ascii?Q?WvSht0Pj2c2kZCP+HDeDBMHhFuyX82lHKe8JVHdlBlkTmyym/wV74gAv3yYt?=
 =?us-ascii?Q?/cdJYv5uNF4lyZSbLXFM4GyYEaeVQ4uJn0wjadNR9MgOLGM2qzlfcHYGnNP2?=
 =?us-ascii?Q?tYXAcJXwJFzprN3uu9eiNUVVl4c5hkJO1hksq9axbgQldAKmdbWCP+xHDBTL?=
 =?us-ascii?Q?iGGhsF19kq3hSKKvaafTQZVOyAgbQRPc0wsArPMOR71HpyyEnY6liDzeSykB?=
 =?us-ascii?Q?hdbHwTYX58+4CWXSSE9jHiZw1+h3774tPvNib17e40KEe0p2qrXPlrKAn9D0?=
 =?us-ascii?Q?nMFkyO7ADnvSAPLhvoE37jEfSd4b/pjdREh1kKQirbt46nJ2BmNg0M9aImnS?=
 =?us-ascii?Q?Qtgm1f0oA69qo4rX90j7YZNOgWsCE8QDbxhuJLZMhIea04cMcXyaL3yVbkwr?=
 =?us-ascii?Q?/EbZduRjZ+cDCjy4xfgwbGOmGEbsbj6jD6WAKGZ9UtzY16Ss0ZnnGuDqkkUo?=
 =?us-ascii?Q?z6/jrR8wswpUT41k3JFfUTwuC+d6WN7cyLzk1cIdatzmoNaOm7c3P65Rt7rQ?=
 =?us-ascii?Q?g0vcD3ZMepHAfr7x/KPvGtYnx/EC0CPn4B+XXScOUgztYlvu0QbfKHR2XOaZ?=
 =?us-ascii?Q?wwnx+jz8mE/aD4dIEoQlo1befD9NSM/tIiIxTHtFqh8G2YQSOCiYPGbPCPGA?=
 =?us-ascii?Q?0HWUMmstTfFvIgWYEKvSvBaD26nwu6Cut23ArQ24xlVW9R86XUffPPE/9oOI?=
 =?us-ascii?Q?/CZOi7bWN/zT2t9SR7Hl6FSdIdthQ9tMUehSCFQSEhz4vV7HgIAp9NE4Jkdl?=
 =?us-ascii?Q?Q3747jtgr8uJdQ9JpNjkT09bDecbhhIxlQMxHG8xPanhF259kujBHCTaVJq2?=
 =?us-ascii?Q?ZZQQ1gT/kV+o/YkRubPky6c5axS9xTvMhuNAaKC+H96AMh4fRax9CU6QEvo/?=
 =?us-ascii?Q?mcjfuoWdkZITpTHP+/yQDWvi9VmefaPMSqn5CGbEQ/jx+5HOly48FAQbCrJF?=
 =?us-ascii?Q?QAI/ZH2mMdgmbr2AYqoARk6uPMif6lO1JwJKCSFZrN310c3holeN0IxfYcLj?=
 =?us-ascii?Q?GdVxkLwskQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12609fea-2e2f-434e-504e-08de7f737aa6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 13:38:29.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXCKtVIXfw9/m1ayp/H/UGFD7i4QBH8s0la4x6FJFS1aD7Oh/LZHiDGdwpxgEyNMyaO7+USFa3SsIevT3FZHBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095

On Tue, Mar 10, 2026 at 12:47:39PM -0500, Mario Limonciello wrote:
[...]
> 
> I don't think the assertion that amd-atl won't load by default on most
> systems without ECC is correct.  It has a modalias that looks for features
> (X86_FEATURE_ZEN specifically).
> 
> alias:          cpu:type:x86,ven*fam*mod*:feature:*00FC*
> alias:          cpu:type:x86,ven*fam*mod*:feature:*0223*
>

Is this with the patch I attached?

>
> 
> If you look at this all in a vacuum - is turning down the messaging to debug
> for amd-atl so bad?
> 

That works for me.

Thanks,
Yazen
