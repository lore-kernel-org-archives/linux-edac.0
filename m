Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011035.outbound.protection.outlook.com [52.101.57.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10BE3DDDA8;
	Thu, 11 Jun 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187114; cv=fail; b=iv0f8O4PZCJJOGmvJx/wvil2Vnu+m9ti07DYNGyH8lDAJRhzRs+sZqX/ahDDrhWa3h5jaaJih0iQCU0wmHZ69zyBCqB7H46UmYdo0cutGSGcUPJrnvH8WxX7xB4X89K/CBxA3yd5senEfXq7Z7kq4j6K/nXo82Ay3OOLVUPhqzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187114; c=relaxed/simple;
	bh=K0JwKF5tBx/pRyQJBCalpnlfhhhKA5LMgxobJnosPGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NU/qCGmKX5f+15MuPpwBqt+KciQH6nOR0HnuSxvVnkbzw0g3bG7W44jjOqPMVlTy2U01MbO0CyKzjOLYbXIYGtvHm8UgF4R2E/wEyDeyUVAvQPOz2PkvIv/ojIq+GzpGB5TduVzfmhH9L7LYCIv1p362yVY4uVTp6sdhm8f6rNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=axGFc0Pe; arc=fail smtp.client-ip=52.101.57.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="axGFc0Pe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6nQL8XfES9JMq86/ADCb5fVLFm5Z66gc3m/1ndPEXHsnuX5NAzxxJ7OAXyzdFqORJP5FoPvnCPdjmROnZQq7vFDJmJjDubrVc0F066TshHBslVMMt6Orc9uN0uvSw2GTm6abOqGiIHAIumUJFfri2fJekmuwBFsrGgDS0ohzriHcGsbslNUhl8VQGzv8YsfCImejTbc0Uys8XTDOen8xAkVcw9yl2/XNkj+Qj4DXsL98+lpEC+y7TnYvTexkpzUajCo9GIog9ORhimDE7ZCpwg7svFo20pWqbJoIX6jN6yQqjZhr//q+5jFPKsLf17LSoYG+HzExTC54X72sfiRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECriM+ySbAqDBNFaSRXN9fygOQtPEVyY042ONEgV5mw=;
 b=wun78Xjyg9X1Znx7XZYGW0jhrfcnG3G8PWlx6qT9JtyeWc4XoqfqSzGBE1nYaTig7Q323liED9gttvyzPGb7T3SBdSZj1oqjDkbjNY2VR0w5m3vx4KOp2XkodQhRvTgKXVVfD5fr+guM6+I6VKv/3jYvMix0pBkiv/dpF3Zh4DL0ENMzSRH9vT5NcbMvErTxgrwPojBE5AfpVwUPdy/XyvUGLTPT3bIZR2g45LVtVYcWL/YjUlxsfKOEqIfCWQjezvQ+yGPEdsX6UrnfiWJE1PjU3FH61GCiogsBdZ676o8TiqeamYqdKP0UbRWjJR4FuhBT3VrTMAKv2GXrPPOycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECriM+ySbAqDBNFaSRXN9fygOQtPEVyY042ONEgV5mw=;
 b=axGFc0PenRWswzhMWk5KiDKDsSMv8gCggUEgi1OFDHy484BBBENW11bN+Nj7LFI3Vcf7U3qTsNJ25dQ2OwX23T9IEPCo/vZS0Zp0fMG85sO5FOEZz+KG+9jmwTqCi2+5SpxEjq1iPSFoQ9RoNO/f4WveK7ndyrvleplHaX5DRpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA1PR12MB6458.namprd12.prod.outlook.com (2603:10b6:208:3aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 14:11:47 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:11:47 +0000
Date: Thu, 11 Jun 2026 10:11:38 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260611141138.GA978852@yaz-khff2.amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
 <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
 <20260610211541.GA831811@yaz-khff2.amd.com>
 <20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local>
X-ClientProxiedBy: SA1P222CA0192.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::13) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA1PR12MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b9e742-ee22-42ae-8c0e-08dec7c35f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	E8ys5QHV5yDnSVAt5EGeI3OxUlRxnni6o1zrHythuOJ+fIYfOEy21Ki0b+Dkg0j2ESpNDLgn9NAD/sDfNR3CDrkWogAdvdh4/BjbIxGzHJ7boyBPH+EOj1R8TMQ3CyTqO+W3GXV1JtQZm5yRF1GjleWsNZChy/L9C5CDZLMRKIrOn0FkEGeXPvdjVntGL2Q+gh63WqOGy2DBGFqu+4TV5Wrm5Q7Blqz+E6RBBCJVhiHf4jiM8/qJo6zNPKJF3TTQcjTJrEhbMI4Q1k6YFYpzrvlhFRllmaVsANvF8WHqBKsUYoSo9lzv2JiqVm/wTxzDALH9ZoTfrKXLB/bBPYAJX6og8YFJXy1Et3/pJyoOWbyCY4EHrt28gbCOsKg3nvbcbF5eaF0IHqU5adNkPYrJTc1CVnFOB4Gl/mgUgTi23bJ//U1Tss/NQpiWc32pW4UHhfFfi1DaF8vHDueWa5gpqarBo6svGaksZvpwz/KV0np2pSgGD1XfPY2w42fK5me+0WanyoQZfxVgcg51k4jvH7FOiKYPGzVu6AQqOhP6Q4pFkkqD+tBSWNC0wXtBAsok+8paiuBeBMLuxzmI5o3NJb7TIs9JqBe1zbE1SCqb8HXX5noBvXC2m4c0N6bo+C915muf9qql+NfVuxAWkEZndg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SOpegGavvcprMo6kw/4wjgjvVsZron+ylgNngHTwBLjAo/JqwStRc3f1kksU?=
 =?us-ascii?Q?YyZUSofuYeMVUWPeQKFkRt10aJ15CiEfZPjZ0QzDqlwlLL7CL06rTUd5b59N?=
 =?us-ascii?Q?2VuBLdUapKhq6FTwT+B7TxD4avBIEdq+cuJ2pea1oa+FMmQ1gNiH8/fPiZrF?=
 =?us-ascii?Q?agHfPFWAGW2rBfXP4kXTdRU3zPQ5y22npMJLhtHs819Wpga85cv5Ae3f01Yo?=
 =?us-ascii?Q?KAHSZ1AqJJul6B5bWqxnvSoZIEKgQppt0ctfe34Q5ef3rTadBEVzIgCfB+Nv?=
 =?us-ascii?Q?owKXCjDU+Q/yXv2RPXnH3HhMyp4k5jo+4b5XChr+yLksGN2R/agj2T6+jzzf?=
 =?us-ascii?Q?Z4qbcWW+mvDJcNKuUcA9rjQyYt+n1sRPJlI6yUxIrmCJuxYOxD6cKdgZmxwb?=
 =?us-ascii?Q?/LDBQbQqnqr0VVk9Sx6rpYpax626GqSa6zU46+5bVNy1nfB90bX75uDZnZ3j?=
 =?us-ascii?Q?CT8LN+Qyxq7Eug0mj79AIpy5zUEzQBg+GAvSS8fab0BCc0l6Ik+Y5T2kT6MK?=
 =?us-ascii?Q?QPD9zvhZ/GXEayHzUyvignvwbS5vDJgLrKLao7dhWM7WPVsE/7grk8rhLpmD?=
 =?us-ascii?Q?RKsbz6ghODYRMzzNgR1U68K/+YMTCZnmyFcT0okns+eblSNHisVgisTJcoHP?=
 =?us-ascii?Q?dbpVDzxoITnaBoP+0+gt6J+FZRfsdWv9T/kEWKkZy2a7wqc6dGSZfljWxQsg?=
 =?us-ascii?Q?idLIVIMo4DO5W+UdSTwMSMZx4v7eRMkTAw8SQiy067+2pOFuF1dCduqRowAQ?=
 =?us-ascii?Q?lDVNkZXAJ1pR7NRsstfDHagqmebN30tRY91fwA6+r3/D/rcIap9rHXK+dvgl?=
 =?us-ascii?Q?klGgjH4u/OsbWVILymafSXbZAOTJs3xuMLrS3fnwGNUcr+R72ivwf+TUYCi2?=
 =?us-ascii?Q?dJ1mdehdOSL07szifyED/rdq8V2zslMF4jwol7ewQMplJp6YuFHDWA5xwwYM?=
 =?us-ascii?Q?d5+OHwnpeNx4vyocHD8bTqKvWzOL1q6AUSXZJXnLjzB7o5qCVWgz8ro48UAS?=
 =?us-ascii?Q?UtOfV8tEz38ZP0yhl+YIbO27kP5FJmXDAqiLkiOn6unycH05dhXV6+UcF2ck?=
 =?us-ascii?Q?9JrN1406gRYOGiFhUmw1U46Yfj8iN8milqJP2FjYbkC38Cd/TK+gqa2n09ox?=
 =?us-ascii?Q?fqxA3oHJmGX01KJTuk808nxZL/fXCU0fh18mUgJInO/bNNLVotQCVcUU1ezr?=
 =?us-ascii?Q?mXIduLTjGMfNJ7g97iKpDzdlaRiPPjTKOyNNlfAt5sd/kwY4p9K3t4vwLJmB?=
 =?us-ascii?Q?zoVc6iKYJrbd/qTF6S8dcWNXilCEFRHVSLUWsfRqEM00G0nvqIYSXxniQFfy?=
 =?us-ascii?Q?3yGcAFcteSfHJh3Z2fRa6Hwt54h06XVgPMgi4IVhazOufMfAJPzetEZD4q/D?=
 =?us-ascii?Q?PqJJrtN0Hj2khzXc61SezgKoxVVeLSBnNpu2N/DvFO6o84TyCzbde5Azsl6T?=
 =?us-ascii?Q?EucucBJI/K81IjcmytxeKFavAl5Krqel2G3DQQU0ryJg5ZP24SqUVJxO8Z+O?=
 =?us-ascii?Q?4yBvYKeQuS5QXXcqtDMaMbKcUDHiugIO3h098OiD57Bue18aHkZDpwktJMtW?=
 =?us-ascii?Q?cA7xqarWoaUek5NWGxi2vDBQp/8P1gPPI0r2sfWEd3++CkX3S9p0AV7+Ys6V?=
 =?us-ascii?Q?XYQ1F7aYIwofitc04G1PmnIJe5Nht+N61tqhQpSZDniYvKuKG7Kh3+HbkofC?=
 =?us-ascii?Q?rfvhe5HcOj3sPipGZLCHT3ABm3Tr0TBzMjKd/+t/X9zlqIXR+WmVk+LAhsDH?=
 =?us-ascii?Q?vXx9OmxSFg=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b9e742-ee22-42ae-8c0e-08dec7c35f9c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:11:47.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEq8txtD4UyIn5SIgdu5wJIu7b3XfoZ0UxmGtlNg2GFibzFUIA5/kdKe4cmZ2mTxhJ3kIGE7Dg+PS0x3GBcdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6458

On Wed, Jun 10, 2026 at 06:23:36PM -0700, Borislav Petkov wrote:
> + Mauro.
> 
> On Wed, Jun 10, 2026 at 05:15:41PM -0400, Yazen Ghannam wrote:
> > On Tue, Jun 09, 2026 at 05:35:16PM -0700, Borislav Petkov wrote:
> > > On Thu, Jun 04, 2026 at 11:48:56AM -0400, Yazen Ghannam wrote:
> > > > I think the issue is having concurrent updates to mci->error_desc. EDAC
> > > > assumes a single owner for the MCIs. The fake_inject interface basically
> > > > acts as a second module/owner.
> > > 
> > > Ok, something like this. Ugly but it should show the intent. It probably needs
> > > more auditing whether we have copied all the fields we need down the
> > > edac_mc_handle_error() path...
> > > 
> > > diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
> > > index 8195fc9c9354..034b9b3f9cf5 100644
> > > --- a/drivers/edac/debugfs.c
> > > +++ b/drivers/edac/debugfs.c
> > > @@ -14,28 +14,38 @@ static ssize_t edac_fake_inject_write(struct file *file,
> > >  	struct mem_ctl_info *mci = to_mci(dev);
> > >  	static enum hw_event_mc_err_type type;
> > >  	u16 errcount = mci->fake_inject_count;
> > > +	struct mem_ctl_info *imci;
> > > +
> > > +	imci = kmalloc(sizeof(struct mem_ctl_info), GFP_KERNEL);
> > > +	if (!imci)
> > > +		return -ENOMEM;
> > > +
> > > +	/* use a local copy and copy the struct */
> > > +	*imci = *mci;
> > >  
> > >  	if (!errcount)
> > >  		errcount = 1;
> > >  
> > > -	type = mci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
> > > -				   : HW_EVENT_ERR_CORRECTED;
> > > +	type = imci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
> > > +				    : HW_EVENT_ERR_CORRECTED;
> > >  
> > >  	printk(KERN_DEBUG
> > >  	       "Generating %d %s fake error%s to %d.%d.%d to test core handling. NOTE: this won't test the driver-specific decoding logic.\n",
> > >  		errcount,
> > >  		(type == HW_EVENT_ERR_UNCORRECTED) ? "UE" : "CE",
> > >  		str_plural(errcount),
> > > -		mci->fake_inject_layer[0],
> > > -		mci->fake_inject_layer[1],
> > > -		mci->fake_inject_layer[2]
> > > +		imci->fake_inject_layer[0],
> > > +		imci->fake_inject_layer[1],
> > > +		imci->fake_inject_layer[2]
> > >  	       );
> > > -	edac_mc_handle_error(type, mci, errcount, 0, 0, 0,
> > > -			     mci->fake_inject_layer[0],
> > > -			     mci->fake_inject_layer[1],
> > > -			     mci->fake_inject_layer[2],
> > > +	edac_mc_handle_error(type, imci, errcount, 0, 0, 0,
> > > +			     imci->fake_inject_layer[0],
> > > +			     imci->fake_inject_layer[1],
> > > +			     imci->fake_inject_layer[2],
> > >  			     "FAKE ERROR", "for EDAC testing only");
> > >  
> > > +	kfree(imci);
> > > +
> > >  	return count;
> > >  }
> > >  
> > > 
> > > 
> > 
> > Right, this fixes the race, and printk/trace would be okay. But the
> > normal EDAC interface won't get updated. I think that breaks the fake
> > inject use case.
> 
> You have the fake_inject fields, see edac_create_debugfs_nodes(). Those are
> the fake_inject counters which should get incremented and I think we can make
> it work by making the imci thing global and always hand it in to those
> functions...
> 

The fake_inject fields are targets.

Ex. under '/sys/debug/kernel/edac/mc0'
fake_inject_count=3
fake_inject_channel=1
fake_inject_csrow=2

...means inject 3 correctable errors to mc0/channel1/csrow2.

This would be reflected in
'/sys/devices/system/edac/mc/mc0/rankX/dimm_ce_count'

rankX = whatever rank the channel/csrow map to.

OFC, the layers are generic. They're based on whatever the EDAC module
uses.

> > Ex.
> > 1) Use fake inject to target layer/severity.
> > 2) Check EDAC interface to see layer/severity counters increase.
> > 
> > I don't use the fake inject interface, so I may be mistaken about its
> > use.
> 
> ... and neither do I. And I haven't heard of anyone doing so. And that's
> perhaps the case because the thing is behind CONFIG_EDAC_DEBUG and only we
> enable that.
> 
> So I'm thinking fake_inject has reached its retiring age. And 
> 
> 452a6bf955ee ("edac: Add debufs nodes to allow doing fake error inject")
> 
> should simply be reverted.
> 
> Mauro's on Cc so that he can get a chance to chime in but lemme paste for him
> the issue that Sashiko caught and that, AFAICT, has always been there:

Right, this isn't new behavior. That's why I don't think it's a real
issue. It's a corner case for a specific testing environment.

> 
> ---
> > @@ -2748,7 +2768,7 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
> >  	edac_mc_handle_error(err_type, mci, 1,
> >  			     err->page, err->offset, err->syndrome,
> >  			     err->csrow, err->channel, -1,
> > -			     string, "");
> > +			     string, s);
> Could passing a stack-allocated buffer to edac_mc_handle_error() risk a
> use-after-free of stack memory?
> Looking at edac_mc_handle_error(), it directly assigns the other_detail
> pointer to the globally shared error_desc structure without holding locks:
> drivers/edac/edac_mc.c:edac_mc_handle_error() {
>     ...
>     e->other_detail = other_detail ?: "";
>     ...
> }
> While normal hardware MCE decoding is serialized by the mce_work workqueue,
> the EDAC fake_inject debugfs interface can execute concurrently.
> Could a user writing to fake_inject race to modify mci->error_desc?
> Thread 1 (mce_work):
> __log_ecc_error()
>     char s[MSG_SIZE];
>     edac_mc_handle_error(..., s)
>         e->other_detail = s;
> If __log_ecc_error() returns and its stack frame is popped, and Thread 2
> (fake_inject) is concurrently executing edac_raw_mc_handle_error(), could
> it read the dangling pointer from e->other_detail?
> ---
> 
> (from https://sashiko.dev/#/patchset/20260518160716.171578-1-yazen.ghannam%40amd.com)
> 
> If this were to be done right, then that passing in of a string buffer
> allocated in the mci would mean that all those functions working on it down
> the callpath cannot ever be called concurrently.
> 
> Or if they have to, a separate mci would have to be handed in. Either way,
> that would need hairy rework and right now, the simplest thing to do is simply
> zap that fake_inject stuff which is not used anyway.
> 

Just curious, why not leave it? Do you think the bots will keep bringing
it up?

Thanks,
Yazen
