Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9214AD20;
	Tue,  7 Jul 2026 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432942; cv=fail; b=o8KwypsaRXvQxycyVtzoV/3AyRMKzfZ6mCjtDto7OahJnkBkunwnrNGYqSJcAJEAFmt9gaePdBJq9N9GaN6v7tjeW/XJdYQE4DtwnFTqP4PcAhAVuHaUxjZINwlGbbuP2g/ei6the1mdrGnr5XayqroPLi0FHeP3FHqT9ghfD7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432942; c=relaxed/simple;
	bh=ZvBtRQtSDZSw02wXtojFd0rITRVdHAC8Gah0T7W1Nm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RhJdPst/CdhMD1mGABcxPWrCg4Yq86sLq+59k+IGziu8RlsExWgkOLVnlHnaBpUKn/06rXbGP5FaErxxitXiAFjNiiIUk/VrGXAKruGmui+eIp6gHnerSyosHnHv8n43+YgbWXMqXDv0TpCQ3tvV4EcERC0ogvXHnI75RExXeYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dkthykZj; arc=fail smtp.client-ip=40.107.200.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dkthykZj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OoRPWkQly9FY478jJM8vhsOXMTepe67mrda36d18/i5pI8orcrYkVA10TWxc2p0K+exqEekBuQeZc4UyXC0nyCbaNbMY4cri7DGpd2rFWnu6277a6mmUsitkWXtHYpsDzFGZQEYGl4rVBGmJPejjY9Vt/mrxqnkMzWNskyHjLCE0TQ7TTchyD/+u+vUaYiBM0BW8SU6Nb71C95i49lnV20haDJIKswQn79OdzI+pD6C5WNyE4gcSvq80+QEY3+HgtXlZJ95n/vhoYR8+rUeLThx+jdfyyGpXtpp0/+O2JcB7C6J3pbwhHVCUTnNXybcDDd9tpMZsEnXHXXqFx+tm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSxco0QXtvKGa6Ac5TdG4aarTFWNOnGn0RYTQKUziaI=;
 b=I7sbOaP5dxlmE19nXR8MynC0eEdmzkt9RdXpUjr2FyzNjqfoheydPj7LjaQQa3SOmlcUJVAx4QAkU0tgN2LhE9a+Lszg7DZpE8fK6laXUTCb0HZuexX1v7oTRsFPYY+O0uSp8W5sm30434rbbglHZ7wDNhO3Bz9RkDEvUW9YLlTZxZFCnH6StyuDNtGwCWflLzdjt36dbzhMmpCILO9HhlyHa4p7k9v217yvFB4VyewydFcWvO4xs7N7bhcYiGHneZSRXuxYPkFgwlOCQii9EfiqValR1uAGVkxURk4V7/yhluHO3o1AH+My3JGRt/ssd1ZHKN4IH6UzPUJ0yE0DGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSxco0QXtvKGa6Ac5TdG4aarTFWNOnGn0RYTQKUziaI=;
 b=dkthykZjq9DwLiiiOQmbsc5qXX5qlYaR7nH7w/HSPD3skDvJSyHpYdDAj1hKAIKgnq9d7VrDiU/Yrz6g19/WT30WR61AJiahCYJ7dRQgLwnGG5e1+q6xi83YmtrdVGqs7oJUtiVT/rMzMYxc7O6fnqwY3rHeZWtg4fL2zSYix2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA1PR12MB8555.namprd12.prod.outlook.com (2603:10b6:208:44f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 14:02:12 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 14:02:12 +0000
Date: Tue, 7 Jul 2026 10:02:08 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v7 3/3] EDAC/amd64: Include DRAM address in output
Message-ID: <20260707140208.GB1382082@yaz-khff2.amd.com>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
 <20260630210640.680758-4-yazen.ghannam@amd.com>
 <20260707003735.GBakxKT4r7efMzoszz@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707003735.GBakxKT4r7efMzoszz@fat_crate.local>
X-ClientProxiedBy: CH3P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::7) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA1PR12MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: fbac484e-b536-444c-5eb1-08dedc3057b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ktnfG7g5f94akZpvbfMNQXU3FvySJ5UbuQTRqc67O1rXNpL4yoNlSXUSxJ7RPrWi8QJfD+rcaFodzuiHyD01OGC+7nN+jx2SNE16eBH3iaVe74VppEoN8U/yAWVt+eJnRBXAXRGKSGGiRg5xpciVOodHTGvWftj5jfYKzaNNRHDSouhXdWZ3sXCbLjzQZJKFEcnV0BMqFwsPxDIsxCJMhKbSx5ZRVCtWLYL/3+C6u3+0VsUZneMOs87MhvXyR2oO+iGHywioBM5yOdzfkBX22AlMo7V/bBewV6oVa2DfoELrkQ2wHjznOu0LlcpSVFo6vBQ0wQWtxcmnvPAFfGX+2cRxosfuv8KJCD1B6XKblUQkwdhe1KZafXYzPLY92ZQYaj3qFydk9tvjrqC1xfo3KjspG16pmLkKMhNUomlm9JGvQURZgAKLZmMVWfXWfGZTnsQA5vY6v9tNphfSD450i3j7MysyUADKmKN68fUgCWzsu5Iy9WQo8txAj8PyDvuX6lpUYgsVa4hkeaV6IEznPNfVehwZUqZGvA1SLOlkONrRda8jfiDg7xCtm7WMBJPr5XgO/s1Qnf85M8KcYyv5GmUaLhQkxHxZF31GBC6c9xM6oF3+5O2ceXyF0JDy2dNULQC6pXW0Nmaf9FrRE+GdmuWct4fiHfZZ9xKGWViiS6A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?74YHJU1ucn8nGD9fp37Yev0P9xqkB9wluH8hvAi3uP1vV/cg6dl/Y/QL7zqF?=
 =?us-ascii?Q?fgDS3Z7vIlF5zxBakObgwkjp86xAd62W0FxQ9deOeQyAeXjPvyc3MZromZqj?=
 =?us-ascii?Q?9AxXRksrZw1cfL7ffU3/AhtNTiMe1EVCNY+QbraeQ/v2UDQcmy00eA5Q3aa4?=
 =?us-ascii?Q?XRCSo7ByN9p5fp8KAKhf7n4R60fsvpVWUuwQPMWFRCiMvNYdh6Z+vFV8+gDP?=
 =?us-ascii?Q?EdTfLsWo18xCcVbpw+cAZ5j9mlQqfgrIs3pTmPpfRWQM0nTXLmUxYXrsiaZf?=
 =?us-ascii?Q?Ta1Cp7GpHfkluK3kcpJNLnHKcG4OzfuZkHxYwL4fWFr2IzkECYX0kDHTIFnp?=
 =?us-ascii?Q?OPQq7uB4XGZfYx+H3qMGvccW+43bPcJ+PkaaLmOkKofpHbpa7Ttdx+o1n86i?=
 =?us-ascii?Q?QKS76WMJdAvKe/uqHWAuaZLntaZn9IX7hBNuFLAELyHUdqIlDwXKr1b++0xF?=
 =?us-ascii?Q?QHtX2I3Gu/tqG6OcISnWVNYn4zPGJ/lZFAn9Wyb+oQzd1h5KR9FC+CrbjO8Y?=
 =?us-ascii?Q?ZQ6CtySfSIUJQ/E71ntIS2W8/ZSKAJ2yi47WofpnjKsjvJl3/fAMtbJty45x?=
 =?us-ascii?Q?Lzc43IamcUryV2EwMFpdUs9T5U3B29kB6lTpP+p8Y7kTWQY1S4Pi0BUr5WzD?=
 =?us-ascii?Q?XoA6Ol1nbGb7Gmq+6f17yENgD77N871EU+pYDtN+HI9dF7MXfeM12oQo6CAz?=
 =?us-ascii?Q?5nc/et+dTb96pvL8LAQO4/2Ya0hU3X12npF7YQTO/Liw38YauQK4OI+XUABQ?=
 =?us-ascii?Q?cMOMpTI+FEhg3cAe608n26kIfBwLgsBR+h0iNTOrDvrZZdMIfxKDkjP9uVtC?=
 =?us-ascii?Q?6QPd4za6nJwkvUDocZ6rzbCtEAVBxfp5OiP+5SKtb+1AGlt1J8jScp3DoU2U?=
 =?us-ascii?Q?dOcnGY2rWsyA/Ra52CKQ1zOEAO/nYNRcj4ycp7Z2tPDifGdUmeXeNqTha99S?=
 =?us-ascii?Q?xNFgUAJUneVVJP2MuGX0DWGJ4mRvNrJ1iGu9/a/y3iaAgz287Zl8v4Ri8Ynr?=
 =?us-ascii?Q?5WmWM81U8x7vQbhDEQ9AMtzoKbaSLIWlyQisj3JXOEyRzEW+zL7FhPN/frln?=
 =?us-ascii?Q?+jLucFbJTzFEMzOJ2ctwk2AHRXEfed0tnMUBSFZx79E4QO3W8EmHt3jCUNSd?=
 =?us-ascii?Q?vraskvoh9SneFunjGDXRbZayRHBeY/ryLyHmrbqDnOBE4fqs1tZR/Yutgfjh?=
 =?us-ascii?Q?M1QRkSfuBI/t53AI53fVT8tFga3g++QFAgwMaLEMojYdilRLmkaiUG4BKZt3?=
 =?us-ascii?Q?ePqpJendQyAX/xN9JeOxBf5W6NWkq6PpEnJpSqc8JzBbUZAVLQaptVyINCa7?=
 =?us-ascii?Q?ks38DyDHQS0YS/uICqypkAwz3OSoXJ+UmP4OlBwj8pCbE8EV0souWCdnt8Qr?=
 =?us-ascii?Q?EJl1nFCOaZFNailg3SrJgiTJIA2bzkkP6xPeVTgbio9W31+AINx+xJkcF6bz?=
 =?us-ascii?Q?978KfnaxEkVjH9MP4BuuxM5RIFNcbZD6a6jElGqzsxpqY8nd5JhXRF9JvSKM?=
 =?us-ascii?Q?fJeXiIk0bqh8f+tZ10ENTwdrqpMpnPHWFNUjFliUPO/FKFHbD4zo8+LNtQoV?=
 =?us-ascii?Q?KyhF+NsZeaLSPCSLrtoNwzP3hWaiFXpfbrb2lASD4n4EmHw+g2GUg5kjWdth?=
 =?us-ascii?Q?POHPDhf48HyIMwhqrccXAxyVs1X2k/NZRjy8gRp128i/1iHFzwizjyQIkU7l?=
 =?us-ascii?Q?S/YcbYoO7GTfk+sfGnlVopgL6NMpsRwNQ7PRzZ6fz+0Bq3LI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbac484e-b536-444c-5eb1-08dedc3057b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 14:02:12.3422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYRuCOhKWzS60km+7/lpBLxzYBcnMsFFtEBnHIXaM2gY6hvP7/4KD4C/Cc2XxHGAAsXOU0jju1tWeah9duBQlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8555

On Mon, Jul 06, 2026 at 05:37:35PM -0700, Borislav Petkov wrote:
> On Tue, Jun 30, 2026 at 05:06:40PM -0400, Yazen Ghannam wrote:
> > From: Avadhut Naik <avadhut.naik@amd.com>
> > 
> > The DRAM address of an error is used by tooling to find failure
> > patterns. This information can be used for general analysis off system.
> > And it can be used on system to take action like offline a page affected
> > by a bad row.
> > 
> > Other EDAC modules (GHES and SKX) provide this information in their
> > output. The AMD64 EDAC module was not able to provide this information,
> > because system-specific translation is needed.
> > 
> > Recent AMD systems provide a PRM handler for DRAM address translation.
> > 
> > Use this PRM handler to get the DRAM address of an error. Include this
> > in the EDAC "other_detail" field.
> > 
> > Also include the Socket and IPID in the EDAC "other_detail" field. These
> > are needed by tooling to translate a DRAM address to a System Physical
> > Address.
> 
>     "Use the DRAM address translated by the PRM handler on AMD systems when
>     reporting an error and add it to the error information that is being
>     logged by EDAC. Also include the Socket and IPID which tooling needs to
>     translate the DRAM address into a SPA (System Physical Address)."
> 
> Plain and simple.
> 

Okay.

> > 
> > [Yazen: Reformat other_detail string]
> > 
> > Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
> > Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> >  drivers/edac/amd64_edac.c | 32 +++++++++++++++++++++++++++++++-
> >  drivers/edac/amd64_edac.h |  3 +++
> >  2 files changed, 34 insertions(+), 1 deletion(-)
> 
> ...
> 
> > @@ -2853,6 +2880,9 @@ static void decode_umc_error(int node_id, struct mce *m)
> >  		goto log_error;
> >  	}
> >  
> > +	if (!amd_convert_umc_addr_to_dram_addr(&a_err, &dram_addr))
> > +		err.dram_addr = &dram_addr;
> 
> I really hate the fact that we have to call PRM twice per error. Is there
> a PRM that can give us both addresses in one go?
> 

There is a one handler per operation. But we can wrap them however we
want. I'll add an AMD_ATL helper to do both translations in one call.

> >  	error_address_to_page_and_offset(sys_addr, &err);
> >  
> >  log_error:
> > diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
> > index 1757c1b99fc8..39c1b6471909 100644
> > --- a/drivers/edac/amd64_edac.h
> > +++ b/drivers/edac/amd64_edac.h
> > @@ -400,6 +400,9 @@ struct err_info {
> >  	u16 syndrome;
> >  	u32 page;
> >  	u32 offset;
> > +	struct atl_dram_addr *dram_addr;
> 
> If you embed it into the enclosing struct:
> 
> 	struct atl_dram_addr dram_addr;
> 
> you'll save yourself a bunch of lines in this patch of noodling through the
> error struct.
> 

Okay.

Thanks,
Yazen
