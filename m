Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6026472F90;
	Wed,  5 Aug 2026 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937981; cv=fail; b=hsrWsJIAEA0YAJSHjHEH2Uy/9HMQnffFWEHTVxdmv02W8iNejkd9mBUSKuYmLao4DSlLM2FQfVFnkRYQF0UdXMM9Qnj1NRxnx5fWp1zTI2puD8B/VxGBj1eODpVV/tnLB7T9xcIxwujSfF/vR9vKioxw1nmN13Lml0fsl8NlpO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937981; c=relaxed/simple;
	bh=IUxPUCmfSGX9TKYp7dG3M4EKjxh8n1lhPR/H3icZkoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=luO5nTB6sKg3WwjMaJsbAm23M9dtDBVZYE0SDCjF6Iw/jdoU0ycEDrZPyNyCVUWBv9O/6mS3d9BkaUAE6mjuMhR8M5J6o3Yqkrk6JrEgIZ5PMfo2sm479oj0bF97sbobY7V6bF4riDBc0tgiaxi3tTbLXYwkSVgOPfcKY1R8mVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=utW+RCBe; arc=fail smtp.client-ip=52.101.56.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="utW+RCBe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoWLoc6IsahYTltqUFHJ+X0PD84EEB0TSfYqt6776lBhgOfuOCGYQOR3w9HKkYQufjYUD+VobahGCzxIY1lrF4ebd+oB6bclKUmpyakK9xxWCT/JJwjrMJOSBFF70DrJ9CEFyALq2wblhGibgFGIpUeIXECaQeEGw9/cQdlPG7RQxBb2kpuTRY9HouWIIXqZJP6h/m0vzRLZ+d+/lNLJKzFaMij0DbvcnpxoX4I5hb+Ax82H6KgI7PEQR6niTCVktUawxddVD+nFnf8N/dkWg8DAxZP6DEOYA+8YnWkFBhYtznm2Ig0QqsPr+7FJYGaTsC5J9iixiONmqkonzVdqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5yN3Le1Artwz4rvjFLePQrv+k7uA5aHIj6EdN61CPM=;
 b=l295EjjRTtuXkaelpVZo0hxmBdUBBVdOCv9c2zq9b+cDVrweCX/p9Y57E0U05ZupmU2IPa1+y3N28oO3o/Jb9rWJECGSVXAcv5og9lVluYB6TTABAQv3bZOfAqTrs8NvWfBrYAaGuPDbTpRC06Psm+kyCFrjV0vIphPPI+el4B1xmuhQqbR0V2a7abFyLFpJe5s9Mc8xOklIW8I4UIOu65+aLv9XR6haGI7EHhN7tgR7hm10fAbqdS1XijDApUXYMxizB0pywp4QlRF0Jpy0XDWHPOWaBJpO7iEG5Qmt4mylK+qrsegZjLt/a1IncldhjlnKs4m6mmNZPftdGeXQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5yN3Le1Artwz4rvjFLePQrv+k7uA5aHIj6EdN61CPM=;
 b=utW+RCBez24hJuiiEtQeKt5fmA/BrdXZrq7b/1FxOx/SJ2AMzmnadYPHeMzYBBrBEls2bDRMAOcLGyJ0odDXj2TC7z0UYvekUWk/aET2bDl3rEcCZXItTLiBL9WyRHatwWPLudrqOcEinCzVSfRqzf4zHX9PgbDvjhZMQY7axw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.19; Wed, 5 Aug 2026 13:52:53 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 13:52:53 +0000
Date: Wed, 5 Aug 2026 09:52:45 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v9 2/7] RAS/AMD/ATL: Refactor PRM address translation
 into a common helper
Message-ID: <20260805135245.GA13467@yaz-khff2.amd.com>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
 <20260730194834.3203601-3-yazen.ghannam@amd.com>
 <20260805051917.GEanLH1c_I3ayfTccC@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805051917.GEanLH1c_I3ayfTccC@fat_crate.local>
X-ClientProxiedBy: CH2PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:610:52::29) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: 196d634b-d0e2-4db4-09d5-08def2f8d898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YxotiO65VcWQHuRqVCZXNUT09MSIfrhQqaTG0pqhqrV2MyxuWXMQun7ajckHNI1wxA8ZLRPwrU3+hG/LoKBvEmBlN7c2BP3ZhkaJO5ADvr1d0OAeGaDbbxROjWZoLTGEZFTUc5ESEl2vIPndqytbK/zvmV8YqNZjpEwbagKrgbAbwzKuIOp4BZz3nhqcscA5/sQm68u0X96a7ly/GFWG0RU+qRWNYSb9vUxLMJT6TTm+k9GUm6xxlyzmJLdH+6OwMrScU5LvV/RriiU8s4klP5QONQrt16OExGg49sZfu+ohva8ihOnroho3CwIuRCz7pAxmm/vXr6ng0gfNXNkrhwLPhR96jI5NKTWSuqSOsRGka1AVJNJR3KBuu+y/yKp4qUK/20bm6A17CJhKqVHIw57RNcjWCCDlVBWGnCjBoxRCg1sLsjyHqxTdCLl4D4Zcyna+Ztcv5XLDn5NX5ue95hGWDNqmG2om62heu5ucMk8i8akIJwvGK0B6cnHZQTiUuhkYUu/zducaCObc/cA0hx5/7jgAO4vpJ4kxhhy4kyesRloV52vj4AmOaSECHB8p/9zBuKJeLRZ+qS7nK59WGh46mK9lF5AAFk9xOJJBApEWyweOlqvNC5kiYsK2+bSPUxR85mqy0IFguuIhpp4O/BvItK2mMR8smnBf4Pev73c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CnqUGi4TBrPjJyRD9SMaNDkZFsM5KpurEvm1zAwY/wUp/YRvtacuF/KG0ZzZ?=
 =?us-ascii?Q?MQnDyyvObaLCeQ26IpYu3lYIVMXwxJf+xqa7GUOQQ1+JJJp+jrPeB2Z8Tz44?=
 =?us-ascii?Q?OdVrfuuBYH80ekyRnfQnx1d++Z1hsfJmK8zz5qyY0X33jAYI5DYSroy+KvDk?=
 =?us-ascii?Q?yzLZpBGUVChiWFRHc0pWMFT/VJsjzazhWAuse67WVREBdxPae+cK36QdUDse?=
 =?us-ascii?Q?vI159qwkBIMRTe7d8wv0e7S7V57JFVwJ/XSlfwt+ZlC+IgPXId+vzmSkfJup?=
 =?us-ascii?Q?/WDPIvm4+FCvgkGVY29tssUd5r0uoQ/NmxYgo3bRE2sgI1Y1c1dcgEaZr3+d?=
 =?us-ascii?Q?3XXIqTDZQLOlJ78Ctxtd79KpiBSiHpHOfkS1lYCF3UzO7H39HUBhXA45OZPD?=
 =?us-ascii?Q?4WdRs/ONdejdAxH0O40LOqppnS+Hjc/twf+BmYd/tX7Tcev+z6XTtDqrxcAS?=
 =?us-ascii?Q?qUlW1vEE7t7oEpiyPgG5wFVRQY3QhqTs0ULU2SOLdeIQUBjuy1mRRC6wLG1z?=
 =?us-ascii?Q?rbG9KxXlDVjFR9VzcG3S/BpdlWjXFJeQ5LR5JstUuXdsE5c2Uvig50PO3uj8?=
 =?us-ascii?Q?2DTvOKFFWxhndP1QPYMWWzR6ZTRmYaagDsu9TaI5ZgDnMcNljilrnj6Dyig/?=
 =?us-ascii?Q?SwYaLgBXJq3XNnxSnGW9/xrdIHSxz5FFsfZZCotgfdsK8kcQHVxFjQUogpPV?=
 =?us-ascii?Q?OO1gJX/jd6jGGhoHXwo+4F3QQzopkxZ6QZAuNtNpXXCENihZC1Rdha176jzU?=
 =?us-ascii?Q?yQN4OQP0tMh9tOERhq74lY7OkcuBAyd31uAZwdBZb5At4COKFVO1Eq/rS+K+?=
 =?us-ascii?Q?I+p55/dQnwYGECm5ClZBo+1Cdr3TJxY769vIPZlBFCsFbBBNTgqc+DZxtMjf?=
 =?us-ascii?Q?lJJ+Huf3L0MvTfkbGlZXUZDhurjVrmPRxFt/Nm/kQpc+ws72r8pZIunF2VWr?=
 =?us-ascii?Q?a6tSejwZzbQe52RGofbmt1LBk7PJaKVY/C+kw3gAHJJJ1xIklXxJDPQQo19Q?=
 =?us-ascii?Q?tP+BLY2N4LTBU5R1tEHgjfmxgfu6TAsjNnYR4vzGK+zPzYfY100eDDsaVpMy?=
 =?us-ascii?Q?aIBHhDhk5D3wso/d9i4WQT4TnlongdMBHDFF0fTLwB44ZyuHbpFcKijW6llE?=
 =?us-ascii?Q?cHVFVJDZ6VEyD0KfJsNX0/mCQM9lr5RjXlzTjyjko9QlXusAMEwYiS8KAKCz?=
 =?us-ascii?Q?FOErCEGNym7nCEQ9IRvN5WgiU9QfzFLqKG8MbH7G2VbKGSIPTvA5v0yOiIhv?=
 =?us-ascii?Q?r4XKSOIcvbvcEOD+eto6dtAwArB1cHwQe0SHwvgB+kAUHSd9ckW7BYJbHOzw?=
 =?us-ascii?Q?Db5lo6RyRncZD60UGaGB5NubDmfzWmpE80L/pmDcdh0Whyc6xfgKDMMexkw8?=
 =?us-ascii?Q?gQJv4x6p//5wnmZFi0B74TMVT/dioIgCes+SRA3xUs3y6ukaYQSeyRAUlk7d?=
 =?us-ascii?Q?dPTR4+kFZqcKas0qJXJVSf09vPpcCJxB3X3RpudYW2sPmZSGiY9o9XzRb3dw?=
 =?us-ascii?Q?oh6Nt9W+iFKA1YYTczatAu9DSZXu2yJQAMHn0OP47vlvTYK1wuqOab2HxP+3?=
 =?us-ascii?Q?tM857gMh5j50bAhFjLB/j2ltLHKlCdVDvAP80hmOMrZQGs5YpGsOQxl4GYi1?=
 =?us-ascii?Q?E3IgLRzDTnVPYiQnOiV0jlbKSEks0KU7i1s4L1PjbA/4Cs+DlFzIEX8KBPVd?=
 =?us-ascii?Q?fheOGBJi1FNb8jCC79OuXMbIHzVKOB2p8l3+KS8G2KOMztrh/6v7HURt+Ul3?=
 =?us-ascii?Q?P1qiBg8fjA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d634b-d0e2-4db4-09d5-08def2f8d898
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 13:52:53.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y18/FYmN2diIV2DgOcCp09Fy3oGi/MlUM56yRh4iJZrzGAypcurPOZ7WMal0abM/XH9f9bRAUKkVm1JJqV7sNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283

On Tue, Aug 04, 2026 at 10:19:17PM -0700, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 03:48:29PM -0400, Yazen Ghannam wrote:
> > Every PRM address translation follows the same pattern. Each fills a
> > parameter buffer, invokes the handler, and checks the result. Only the
> > handler GUID and the output buffer differ.
> > 
> > Factor the common sequence into prm_umc_norm_to_addr().
> 
> And here your commit message ends. The rest is describing the diff.
> 

Okay.

> > -unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
> > +int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
> > +			 unsigned long addr, void *out_buf)
> 
> So if you're going to have a param buffer structure, you might as well use it:
> 
> diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
> index 3d5a6f5ae0a9..726464f31e10 100644
> --- a/drivers/ras/amd/atl/prm.c
> +++ b/drivers/ras/amd/atl/prm.c
> @@ -26,18 +26,11 @@ struct param_buf {
>  	void *out_buf;
>  } __packed;
>  
> -int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
> -			 unsigned long addr, void *out_buf)
> +static int __prm_umc_norm_to_addr(guid_t guid, struct param_buf *p)
>  {
> -	struct param_buf p_buf;
>  	int ret;
>  
> -	p_buf.norm_addr = addr;
> -	p_buf.socket    = socket_id;
> -	p_buf.bank_id   = bank_id;
> -	p_buf.out_buf   = out_buf;
> -
> -	ret = acpi_call_prm_handler(guid, &p_buf);
> +	ret = acpi_call_prm_handler(guid, p);
>  	if (!ret)
>  		return 0;
>  
> @@ -52,9 +45,15 @@ int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
>  unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
>  {
>  	unsigned long sys_addr;
> +	struct param_buf p_buf = {
> +		.norm_addr = addr,
> +		.socket    = socket_id,
> +		.bank_id   = bank_id,
> +		.out_buf    = &sys_addr,
> +	};
>  	int ret;
>  
> -	ret = prm_umc_norm_to_addr(norm_to_sys_guid, socket_id, bank_id, addr, &sys_addr);
> +	ret = __prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf);
>  	if (ret)
>  		return ret;
>  
> -- 

Right, it gets mostly there in the later patches:
  int prm_umc_norm_to_addr(guid_t guid, struct atl_umc_addr *addr, void *out_buf);

I'll do another revision with your proposal.

Thanks,
Yazen
