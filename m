Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD213B27EC;
	Tue, 25 Aug 2026 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689329; cv=fail; b=bkSN1kz2/F/UC3hOZVhJkci6IO/6FKch8I9F+N5TaOmfyKdMjotW6eW1aZsZT0+SXbhlibilPVTJhe79QXz5beDsI6+aM9KN4cWO3ROEukKZ5rLSdDXG+RObR7sobsHcygfp9Zj+wBYAzTGG867Tb5ACZFbnXIN+LfZfe+9GaMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689329; c=relaxed/simple;
	bh=+6+l1wcfMUoGwOxZvTCnj4Cri0J9Vseeukx8DVwqY3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uCsS8WGW4n1ILFwTaNGWMEZO1ePYjQmlXc4PdOkAx/JTNdInu7T8PfzGlQceaYSF9MJdJrWs/x6Tl5yZ5RrKd7qO3gvwL4lU1X04vIO3/kIpDC9C8bGSAw5yxvXJQTTljj3hkjSYCUwXVRdMvs7tjuZ9GmNScev13bDh+mO7n3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qv0vxNKG; arc=fail smtp.client-ip=52.101.53.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qv0vxNKG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmUV0ukYEZpHLC7xzXYTG/HFnWbIhl2xq4CVHq9CkFaTBRl1CnEdiI8ixfJ+9LvNFZ1i3rMMGRRnc2jElu20Sl9wbWAlchGejs46PkN3fke3uiVjo5sHQCk7tPU76rAfHJsqkwgUBlwOUHS6u9wb16QgwrhQfbSvASZwXGKQCsudOL9DyyDTVfBHZEMZJoFrbj3vtQQ+EPIy2ROMyHGHDFLbEVsS/9zXeUl+cAMnyhfBpWsOYmwVCIGknR0mrfY1+xiSmdGLqbz2HLRaIVwC3dOdoYs5OF/rCbBn7H1JQHntBI0Iixku2Kcq/Qb9qSrG+gucMW//q/ZmDX1d8EgQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPfs+mqEPKLnvwNfaOl3UQdo+4+2lIjV1NPkKfZTVpI=;
 b=iCDfHBMqrWn9Ka2MF2vwMtKfOQtACVz8RSb9xSMvV4PyJZMv5XOaWuPutgsSP/X2jL+OdIhi1IhzTNYgFa9xcugj4G8071E8V1d36aH9O35T0FAIvlnZwMcq6kqaZ9BZETmMDIRH5vJyJF70CpvQ9199S4sREVLuC27Igm9UQgqbFXdmCKahzitEJKX1BkIcY0pyCXGtXRp+HvEkKqEE9+8eBX9x78y7L0gfwfW3oZXlU7XW8RVaMVy5zJCqLHAgk3PMPplG/oUot6e/4HxM3QEDl03G4arUMQXCNIKkY0UIm26/vUHH1edJQLHJOJj0FkNLVUaYFLU8k/n6e5JJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPfs+mqEPKLnvwNfaOl3UQdo+4+2lIjV1NPkKfZTVpI=;
 b=qv0vxNKGQQGTF7gZD1BebJaM7s6vgZS8wbo3j4E8aWjhsKskmnSl6/gFRN0KcgWSn7b3blKDTPVKas7y4hkvWTw4LaHZTLjy27MJlWpTheIG7C5bfXojI0RYTOBkC7G9cb3ZjIVJE6G+sZ4KGtg7yhwJa37/s8dgltHICwFiW2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 20:21:56 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 20:21:56 +0000
Date: Tue, 25 Aug 2026 16:21:49 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] RAS/amd/fmpm: Fix spurious BUG when ERST record
 enumeration fails
Message-ID: <20260825202149.GG1500179@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260821094748.145394-5-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821094748.145394-5-qirui.001@bytedance.com>
X-ClientProxiedBy: BN9PR03CA0901.namprd03.prod.outlook.com
 (2603:10b6:408:107::6) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a59e47-4c52-488b-9c0a-08df02e68233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	QvEz2VpIQLVCKwGF5MgOQMTKpFUtK+hp9BnaLemHdbiFUfQuMnzMUmK6HFuEQKOd9s6N3DLzymI/0fTan8CajsdHTy4bAZ28LhP070GuRXYurn5PtEIn19n8M8jZ2ZK7YhgEMKnP2WpwgEWd7lTyNRs9bbdtORwLxEUsSPEETWQm0KS/hBmcE7qJBQX8/2SqhiIqt6sfbbcXhKDoqgVeNSwyDm2AKenhf30X6JofJHL/+5erf5Y1xWJTboXW0y4GwqE2QMzOBQ1Y+CXUnI0TTGiDAsrHiOLrtMEcMsOCTdO2//4JeCGrmhRMxAJKJN2obVzTABpXBjHB6+0XmoeRtxIY/1XRQh/gqpyWeJ9NR4sDdEbA5d2bSqYoW50llRljHwdRjx9/Na+p+zVjY7MOIZexWH+NcE6F2WQju2lhDg8Ny2zHBYHToUuBIfSvNewMlp+cTCovHm7voDFqh0p3YIvnDMNoQzWVZbRc8UW5JNgexBECHnHTgjbdIi/sbt0/bPgk8Aj2A0hZbuGnod+f0zkY2ZMwBgDmAT7t5qarGRV3zC+EN8eVfZyJ5ybMTF3ZHmp6/Q1z2T181Aea63CVb55d2phuYX52D9uWcLpmr9Ek8LQO72lR6dOzwETApj64ypOpWFo2oLHZzmlxWf2m0+FrmiHhJ3zvqsjE8ozlrJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mx2qCSJqgVHKSlCin6LfVNtxHA/zWU9p1iJmf2PIjWsNnUYD4Iy4F5ObaZgw?=
 =?us-ascii?Q?tAzrulhvocOhEi0GyMDMDYI6EQ9FV7j2O5sZ9rYoDEfYfpQz2HnV/tlG/O41?=
 =?us-ascii?Q?Tcfbp6aAGglSHhv3u2Bc7ahFXAP51YxttnvK3UbC7PTN5cEzRTrKskmJYqgu?=
 =?us-ascii?Q?C3ie1mIAunEAklwfBhMI2kbGX4OUH5/jbmZFQlUvtI9K1HSvbynRJ+LFAnWX?=
 =?us-ascii?Q?lmPMBPQuzjhRLEH4oviDCbNpas0ZwUxlqmCc5+fE54q6V5so0Ug180xHQ3O+?=
 =?us-ascii?Q?xJsDpHHjKAar32ETPaO62Alak4imxkgqmc/cGsSiwMc5SiY19+Nc4mg3GibN?=
 =?us-ascii?Q?VaqW7PMntqvehqD/droBIAjz4rUcUqDGQLe+LwHaIvliUef1IPTWw9JCsPJQ?=
 =?us-ascii?Q?HAlxOegBggDnJalbziK+8aMynRaAUhUF9+Q72QTvMH+Sia3t4pMmA5zsG6dk?=
 =?us-ascii?Q?Eyu4jHORgnlTlInfzkFBxZorrqu/hVO3G2/FnUR92oFdNZ5TGTmoUAK8YKIA?=
 =?us-ascii?Q?jOnF/Qabv2NHptdYOER6X+P4VYhZmxEhceVDWh5BZzfJ/gt5o8qiYu9oU1Pz?=
 =?us-ascii?Q?vJccftin5rTNZZxyfBDDwAkMgu1oloYViXBimvFZ/4NNQeH3ogBL5LSD01Y4?=
 =?us-ascii?Q?yjgFH8gdPefbSQVoDDXyVT6xXa0OBarXWUPyjwyZRGYPHL+WDgxEnz/HkGcG?=
 =?us-ascii?Q?HteJL23bzxrdqTbfuCq0POFLU2/VK8JnBupF4c9ge2uNiZDzs3CyE/cZzkjN?=
 =?us-ascii?Q?0pf7ctkOdZjraIzfJCHqAUNcs0p0s00wrP2jlVinHS4DKhfu0lMK1HUs0gwH?=
 =?us-ascii?Q?ZerziH2pujjqVLImVOyl5wWyEnlnYIQAAsHOxcQhhgLathQzokXblpfsxdof?=
 =?us-ascii?Q?Pvzy3yRFNBUnIEJWsKijjwOCSjzOa6iYilrapmlM5sphPgwghr0CpZ6FDtDw?=
 =?us-ascii?Q?NrDmk1B0XLx79mLDAUqiUZCKISigwikhj+BE2NqymlTexp9AFN6+QPw/QpME?=
 =?us-ascii?Q?S8ZfS308OKyh4Uoy6d7g6Wfgrf8Z3fbCPgjSwSxDjmuozBAz4tUp/MNpDNRl?=
 =?us-ascii?Q?3KTzXEexlCLxgnMO5xPq2PwsHCwco008ady5Rwo1VmP4KnhKh8svP5RQiu36?=
 =?us-ascii?Q?VV2/+7k2DOj/8keJhzywHXC9p1PWRZJi9eVmtL0CW4g8iFilbOFnZeUrPfv1?=
 =?us-ascii?Q?DLb1F5JoF+LPVZVTtrqEkzfZQr59QJiFT+b1Qtylgs6OHHUBrm4dEvq9oXu3?=
 =?us-ascii?Q?O2s1apR9QfZjvzVtKybqr9q2rISbWh6dF4x1JI89xCGqWM/59TZVw94rGBxD?=
 =?us-ascii?Q?TGTkdB3R51OjdDCKVjqQ+8Joki11UJRbroHB/HoviyczpmeoroHslBVxJV0J?=
 =?us-ascii?Q?qMba1EKlTEt2/B8jOys1lCY8laVbcKIJYRzIqnuj+9dGR7tdLmirARxYN+6U?=
 =?us-ascii?Q?87JCq7iBpRD629FCDznJ2ZiqF39UMe8kVkrp8ti/kbNUDdBahdIfto6LQW5L?=
 =?us-ascii?Q?KUeKlRs3aRc6ZoUj7qgmryRO+QKjZC4DD4/lQcIxQ4iLToROwXulj7f2q2VL?=
 =?us-ascii?Q?bE9ktoN+VuLrHrFj1EoCiepyn5S/Z1MAriFzCcbb0oy+QOguqjVxLsDCIsNH?=
 =?us-ascii?Q?Wmzq1aqMrsE37v64Zp6DC4wyhFLLH+Ji+xKetFwiNgweyLWJSdU9wZbRrIWu?=
 =?us-ascii?Q?NyG4BG0XzRAdFrg3lp7KiBl/AJ436LFjbncEvfUAmQfSlVON?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a59e47-4c52-488b-9c0a-08df02e68233
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 20:21:56.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //vJhUBZDuAIW50jI3+X/rkwc6ONwZHmQ0NAsjx3JnJ+Bxn52bTzzhy5rnxD5k2fCl8co2dfsnnruyr0JmF9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151

On Fri, Aug 21, 2026 at 05:47:48PM +0800, Rui Qi wrote:
> When erst_get_record_id_begin() returns an error, get_saved_records()
> jumps to the out_end label which unconditionally calls
> erst_get_record_id_end(). This is wrong because:
> 
> - If erst_disable is true, begin() returns -ENODEV without
>   incrementing the refcount. Then end() hits BUG_ON(erst_disable)
>   and panics.
> 
> - If mutex_lock_interruptible() is interrupted, begin() returns
>   -EINTR without incrementing the refcount. Then end() decrements
>   refcount below zero, hitting BUG_ON(refcount < 0).
> 
> The comment in erst_get_record_id_end() explicitly states that it
> should not be called when erst_get_record_id_begin() failed.

The comment doesn't say that exactly. It does say that *id_end() should
not be called if "erst_disable is true".

> 
> Fix by adding a separate out_free label that only does kfree(),
> skipping the erst_get_record_id_end() call when begin() failed.
> 

A new label isn't necessarily needed. Please see below.

> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index 14a103de9d62..22627f6278c0 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -675,7 +675,7 @@ static int get_saved_records(void)
>  
>  	ret = erst_get_record_id_begin(&pos);
>  	if (ret < 0)
> -		goto out_end;
> +		goto out_free;

Change this to "goto out;" ... 

>  
>  	while (!erst_get_record_id_next(&pos, &record_id)) {
>  		if (record_id == APEI_ERST_INVALID_RECORD_ID)
> @@ -716,6 +716,7 @@ static int get_saved_records(void)
>  
>  out_end:
>  	erst_get_record_id_end();
> +out_free:
>  	kfree(old);
>  out:

... and move "out:" above kfree(old);

>  	return ret;


It's safe to call kfree() on a NULL pointer. So the memory allocation
failure path is not affected.

Thanks,
Yazen

