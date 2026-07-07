Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C1A412282;
	Tue,  7 Jul 2026 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432690; cv=fail; b=lYkvjvf8eUhZHheWIJeIMkdj4/XABrXwFyo4l8e37JqNq7aGExixqNrfnqM4KdcL7DAQWY/Aopsk4zg4PJ/XOGbTPsmr5LfH8FMd67ktvIOG5RPUuiMqqwAiF8MphoXQ3Wke8Wq/dzJsXaLUrqfIvApw+GIfdf7Kecb4/1kqBWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432690; c=relaxed/simple;
	bh=dbQBo+kNaVC1UwEFeHkrsYs83LVMWcwxhEPTsPryXPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bNsjjocWzFk7OX6EnEROum7vcFYKDesveKZEOEDMLguKlqzc7SuxgrD15TNhN+kBrMaPBFvRg0Edbvf58v5ug1YMKWQk6/MHTESmfPKxDhfoivHruFpXMFyRvQGX4AUhrVsLCQUqjTDDqmezeiS8kXQspDa4EfYDMBdsqa6OReo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=fail (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tNnKCwTa reason="signature verification failed"; arc=fail smtp.client-ip=40.93.195.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tNnKCwTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQOeSb1hoGlZOykmMbSCS2I0Orfhk9Rm5oehknZVeGmQLeSV3ccAwS8kg3pq8p+hzdo3N6Cp+D0aEfL0uq3lLQSLLORnktOOyLDpzrmZs14hTT8zjdMMfQr6DeKUZqLZsGHRqg1OQr6+v1MdWJBorRxeCaUuEm46evHuv4XpcnewcfDjN3adG8TYeffpGU+rhNe+UGCFXqmhs6/UI9+lXc0DoaENtkfCq129jFftXnE5lxbcEdQ4sluvmYwgxtYUKwU5nPfOiZ9Xr/g2dIOfZ/+LnSJ5IDepa6lwfGvD4PjqL6udj5rbMqPCtyAKUMXZbDUklw2714nZe6JiSkevFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZbBLd2LI4oeP7xeDYSsw0eG4bxMVg5UDUWSXhoSX9w=;
 b=Es3uTM48lVY8fTD8H4giXuzaeiK/ROiufXuANl0ZPSt1UCiQJNvRTapW/+5+Dn8Sf6v3b2OQtu4mR5FKPYnqY+qTPHX2jKCKNEpns4UIeS3aUSiD/jk6mtN2EjnEEp0yz6WRyhiMxTe6x3Ap937B5aRFcoQ3/eQLaT3NmnN7bghTmo1EX4cFZU3q1eXV494n5oMY85SfWDJn4ihlmGGunEsBzIbgnJJJmeVq0w50TtUtcQBHUC2zoY7RgAEbXbU6dacgue29UKRVl9dfoUuBaD4Vx4FMgQH0FFSlbGL+Wd/lqPT7jLYLFD8REcibeDlnLC6mROCJUIm752IecgVt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZbBLd2LI4oeP7xeDYSsw0eG4bxMVg5UDUWSXhoSX9w=;
 b=tNnKCwTaXGZdisWH+jzphgW+b2R9ugH9fz/cfjQGylBJ5up8WXsFdJcU3INFCpi/AQrJIXfwytruoDGdZoOiFM9zQH0jeDgYE7Llf7DM6ftUOLyIEoaKS1kDF27SH91lYHxTV3EUhSPhtJ+KLXnIkJfZnXb5tUoDqQwqqNoYo0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 MN0PR12MB6032.namprd12.prod.outlook.com (2603:10b6:208:3cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 13:58:04 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 13:58:04 +0000
Date: Tue, 7 Jul 2026 09:57:56 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v7 2/3] RAS/AMD/ATL: Translate UMC normalized address to
 DRAM address using PRM
Message-ID: <20260707135756.GA1382082@yaz-khff2.amd.com>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
 <20260630210640.680758-3-yazen.ghannam@amd.com>
 <20260707003204.GAakxJBJWtxD2fM6Th@fat_crate.local>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707003204.GAakxJBJWtxD2fM6Th@fat_crate.local>
X-ClientProxiedBy: CH5PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::22) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|MN0PR12MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d0ddcc-01f5-42fa-2b7a-08dedc2fc3f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|4143699003|6133799003|5023799004|11063799006|56012099006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nsq4tsQ/1j6idj+5foaChY4aBpv8fzdZ19A0d1bXDUScqpiDqonpctJgU7SLYGrOYWFTW6NPn7oKrReSmboStj4SikAQP/VFgcP2JcxQcd1iUsOCwH8cSMbY3sDa4bBNW60y6NVs6wU8vTKLgvmcdD3y4yopO9XBIMb99xY3gI8SSTaNJvG6yD/ofa7Zgn4xZztOSb+RWdQIm9y7hYyIHlbX4pLww/7BX+LIspI2fg3TTGTmcO8i0wcJvTWeHd8Os4LfMlFXE3J2+3BLJDUkFv5O2Uj65UFAekmigsit43ucA+AruABbEALrmdnSITcsfNjkIAWREjtx4BXjsVr4f0ZBshETmkx0shIB3//FRFkYI57fSQ2T0NyjTEeSGH5lK4qFuCCac9SjSljwOETMBLfnaK6WB6bv7O0ftwh6VfjDGVpuOQhWLHanvD+wAlvqw9mX89CsfT7btPzJsK/tP32grh/+jNEpry+x/KLdbdtLVRVw1n1LqETga7tJBrfC2phhFlro13HOc5UCfBHQAvfdGdiYQMnkXNqpg1TK1BHt5p95ifToQ5LZ05fn4buEEdgPp+XcwtK/FnfqKSHx3rXoCLrrEs1BWWg77SFnwNcElpSETZjOHKUtZHyZhkiG+F8/c4khrL7D3hdytuKFM7I7YYkIQbO1qBxItRDLZ/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(4143699003)(6133799003)(5023799004)(11063799006)(56012099006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3IP7CVO4b9NB1buVnaVlESqN25YbXVyuxvr92FjJfvyAsM496QbbMZgwFm?=
 =?iso-8859-1?Q?WbWadlncPcJDucOhr2+UMzA6MDLS4KD6ymgJCT3WqBmUQOJf1EBCiLAvZn?=
 =?iso-8859-1?Q?I3IkRifH6CJP5kj3RrjCkNHBUF+HKPWyhYeJu+MhuSGEp+dshrSOiulwvO?=
 =?iso-8859-1?Q?OsuuLniwKjPYPV4KZr/xY7wK4+mOEqaombe+r9+d57Uq3COAwDItXV7s5+?=
 =?iso-8859-1?Q?XokcwKCCBbbpQWxwA2QhNqZ/K5UNo+JjlGWM9OstuxCmxXaV41+X6E8kLM?=
 =?iso-8859-1?Q?BcOGqQZDyBY60DBr8P2AOoLMRvBJUVJdTDfWjkd7D5lNF6IcWRAvgeki/D?=
 =?iso-8859-1?Q?i76m3lc7sj61cKNVEm1gU6ACo6uYshFrDzi+BBTNQ+H2B0zT+EHBxvsOT4?=
 =?iso-8859-1?Q?FllZt0I5aYkSJLiHPWZTSlCXSN/hIQtzY/u2TwxVLIjjZcOEC6ejlUQ87X?=
 =?iso-8859-1?Q?p+KucKhCbq4VNuxAYYR6JaGY+y/DJWMEC8mNyvgWvbADUgrR3AsJEu/rg4?=
 =?iso-8859-1?Q?8x07cbWk+OqlPD2KRY74Ib9Ld/yyiCsqOPlRyZ/MFExskAFzoM4XrvR9Iz?=
 =?iso-8859-1?Q?5iKE1PketwgeVlHd4C96VAR80wViKJuFxUq+CV8EpOzW8LxBVGuU/aq+4X?=
 =?iso-8859-1?Q?+o2Vb4t4KINZce2M1EkKOHS2qvH4l/W9DXUNy1jrv3viGpvtruzIo3G11P?=
 =?iso-8859-1?Q?0TXQjJFz/SqFIuAXvKnJRFt8ATqSaJz+YVUStD9+H4jZt2i8L6JOKtDVTo?=
 =?iso-8859-1?Q?jmXAx0W9MZLXFbISTBPcHvbHSm3dNQbqntyyv/m+llQpXclZCpljlvyHYd?=
 =?iso-8859-1?Q?VlLrOVLiZvx8di8rUBzBkfq137bxlTLyFy0aEG4PJd41CkbdUf1T8zBrHE?=
 =?iso-8859-1?Q?n1Q7FTsOoECpHQkocEpnhz5SoRV8DIBMFi6m3jsJzKREC+Eg1nthyKlg5/?=
 =?iso-8859-1?Q?+E2qnm9hJNY4IVNGRL681LBt35FANypuQg1UiFs7ghuRrzXvHWMQB8QIIr?=
 =?iso-8859-1?Q?D+yIxsTGkObx/TAmUn4isQ373Ts2j8Czc2+mNZMQHxjxGR+lfDLkXK+iNK?=
 =?iso-8859-1?Q?t7PB2hihDWdFPBoB+eKfDBkxWBTWzTnXsanEDAnfdp4HLPANsSYDPKp6Gt?=
 =?iso-8859-1?Q?iO/mwjTHdIk7Qj5zpJeZrqlZE77hDlufPDzARbXYmSekEOKk5/FYayJJZd?=
 =?iso-8859-1?Q?rr3JUlkxoHgOQ2U2ajXTbj/gVMQxCkCBjKjK8bPOCpqPkxTwYtf+p/b8pm?=
 =?iso-8859-1?Q?Ttq4bP176Iu3r4jBJ9pFY1vicvKnCmSAd69QmtqcAW1jyFxfXoLNCef50j?=
 =?iso-8859-1?Q?li4WAQPnUPlcD/+1DgFPnkJpDHcL3mHmoiYBIPIJZNhF4c/ykC+wh9LTnL?=
 =?iso-8859-1?Q?lAdge1/7+EnQArSUj59KyfLXV+xZlN99IVIVdB9liT8mD2d+mYeBUJ7wCn?=
 =?iso-8859-1?Q?mejrgVAcsUv3sk2PZhQIv4feH6r4wZQ/jUO/Nwvn8GcCI3O+MZfeL/i2rV?=
 =?iso-8859-1?Q?UkV/QodOWiZHmzlumXJxn5NdUqt0DTQxUBEyWArVIaxhgqg2maA7NQHUF5?=
 =?iso-8859-1?Q?N5+ehGqUS/c5oKV2l8qSvEn/T1ZFji8baVTc9JFRq0PQFm/spmJaUz3KYo?=
 =?iso-8859-1?Q?O/l9lodjDZmJa0KMoNnHa3FKBivfX7tfX0faSTPLUga8WHDXkHOtddBM7x?=
 =?iso-8859-1?Q?QWPClfm92f2y0offRuFW28toH3PLrU1mJoGFZ9BKWrsXMJ8QhPanknZ6RW?=
 =?iso-8859-1?Q?Dmjb8g6vetfkae5MwdK6XYswia56HtSzzMVtv3wAfFLTDC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d0ddcc-01f5-42fa-2b7a-08dedc2fc3f8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:58:04.5481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmE3M2CEtkat6rOwmlxVjqb8k97EmHRlX25xQJ1Tk9nmWR3UsjtJp562x+EQ3ZABVmTyKSqSETsVMKH/BKuFdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6032

On Mon, Jul 06, 2026 at 05:32:04PM -0700, Borislav Petkov wrote:
> On Tue, Jun 30, 2026 at 05:06:39PM -0400, Yazen Ghannam wrote:
> > From: Avadhut Naik <avadhut.naik@amd.com>
> > 
> > Modern AMD SOCs provide UEFI PRM module that implements various address
> > translation PRM handlers.[1] These handlers can be invoked by the OS or
> > hypervisor at runtime to perform address translations.
> > 
> > On AMD's Zen-based SOCs, Unified Memory Controller (UMC) relative
> > "normalized" address is reported through MCA_ADDR of UMC SMCA bank type
> > on occurrence of a DRAM ECC error. This address must be converted into
> > system physical address and DRAM address to export additional information
> > about the error.
> > 
> > Add support to convert normalized address into DRAM address through the
> > appropriate PRM handler. Instead of logging the translated DRAM address
> > locally, export the translating function when the Address Translation
> > library is initialized. Modules like amd64_edac can then invoke the PRM
> > handler to add the DRAM address to their error records. Additionally, it
> > can also be exported through the RAS tracepont.
> 
> Use this commit message for this patch:
> 
>     Modern AMD SOCs provide an UEFI PRM module that implements various address
>     translation PRM handlers¹. These handlers can be invoked by the OS or
>     the hypervisor at runtime to perform address translations.
>     
>     On AMD's Zen-based SOCs, a Unified Memory Controller (UMC) relative
>     "normalized" address is reported through the MCA_ADDR of UMC SMCA banks
>     on occurrence of a DRAM ECC error. This address must be converted into
>     a system physical address and DRAM address in order to decode additional
>     information about the error.
>     
>     Add support to convert a normalized address into a DRAM address using
>     such PRM handler.
>     
>     ¹https://bugzilla.kernel.org/show_bug.cgi?id=220577
> 
> or run it through AI because I'm tired of adding pronouns left and right and
> removing text which regurgitates the code in the patch.
> 

Okay.

> > [1] https://bugzilla.kernel.org/show_bug.cgi?id=220577
> > 
> > [Yazen: Remove 'handler available' check]
> > 
> > Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
> > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> >  drivers/ras/amd/atl/core.c     |  6 ++++++
> >  drivers/ras/amd/atl/internal.h | 11 ++++++++++-
> >  drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++++++++++++++++----
> >  drivers/ras/amd/atl/system.c   |  3 +++
> >  drivers/ras/amd/atl/umc.c      |  9 +++++++++
> >  include/linux/ras.h            | 14 ++++++++++++++
> >  6 files changed, 70 insertions(+), 5 deletions(-)
> 
> ...
> 
> > +static inline int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
> > +					    unsigned long addr, struct atl_dram_addr *dram_addr)
> 
> ... int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id, unsigned long addr,
> 				  struct atl_dram_addr *dram_addr)
> 
> > +{
> > +	return -ENODEV;
> > +}
> > +#endif
> >  /*
> >   * Make a gap in @data that is @num_bits long starting at @bit_num.
> >   * e.g. data		= 11111111'b
> > diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
> > index 0f9bfa96e16a..c69158f66639 100644
> > --- a/drivers/ras/amd/atl/prm.c
> > +++ b/drivers/ras/amd/atl/prm.c
> > @@ -19,10 +19,11 @@
> >  #include <linux/prmt.h>
> >  
> >  /*
> > - * PRM parameter buffer - normalized to system physical address, as described
> > - * in the "PRM Parameter Buffer" section of the AMD ACPI Porting Guide.
> > + * PRM parameter buffer - normalized to system physical address and normalized
> > + * to DRAM address, as described in the "PRM Parameter Buffer" section of the
> > + * AMD ACPI Porting Guide.
> >   */
> > -struct norm_to_sys_param_buf {
> > +struct prm_parameter_buffer {
> 
> struct param_buf {
> 
> This is not BIOS code.
> 

Okay.

> >  	u64 norm_addr;
> >  	u8 socket;
> >  	u64 bank_id;
> > @@ -31,7 +32,7 @@ struct norm_to_sys_param_buf {
> >  
> >  unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
> >  {
> > -	struct norm_to_sys_param_buf p_buf;
> > +	struct prm_parameter_buffer p_buf;
> >  	unsigned long ret_addr;
> >  	int ret;
> >  
> > @@ -51,3 +52,26 @@ unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long
> >  
> >  	return ret;
> >  }
> > +
> > +int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
> > +			      unsigned long addr, struct atl_dram_addr *dram_addr)
> 
> int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id, unsigned long addr,
> 			      struct atl_dram_addr *dram_addr)
> 
> > +{
> > +	struct prm_parameter_buffer p_buf;
> > +	int ret;
> > +
> > +	p_buf.norm_addr	= addr;
> > +	p_buf.socket	= socket_id;
> > +	p_buf.bank_id	= bank_id;
> > +	p_buf.out_buf	= dram_addr;
> > +
> > +	ret = acpi_call_prm_handler(norm_to_dram_guid, &p_buf);
> > +	if (!ret)
> > +		return ret;
> > +
> > +	if (ret == -ENODEV)
> > +		pr_debug("PRM module/handler not available.\n");
> > +	else
> > +		pr_notice_once("PRM DRAM Address Translation failed.\n");
> 
> Dump ret here.

What do you mean? Print it or remove it?

> 
> Also, this function is an almost identical copy to prm_umc_norm_to_sys_addr().
> Merge the two pls.
> 

Okay, will do.

Thanks,
Yazen
