Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6889447276E;
	Tue, 14 Jul 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034316; cv=fail; b=chwhK9HcfMlCJnIDux4gtVRD7ADzpyA3dOqKFRw4rUiPZytdqQbgzzl+Qee0tG9f2eiyrNLtjQUI8hVF/2gjJMrwTL0/AuPtvlpqaLrWaJsD1VEOJ7pN49Y/I3JJEFuLJRLRQdswtmM02wIlNYhESL+dUTJ7Irh56KJNYtPwtdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034316; c=relaxed/simple;
	bh=nWD7zzsCTjOKs7MDwjSLeU1Hv7w6nGavYixKRH1OnTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n7Nxdas+iAcRcrBzFCT2Ck2bmqw04YERkNdpM2jLbDqwTmklVSJIh2hXl/tlnv3pC+pLUsPOo3HG0aR3LOKfpEaEiIqdYUX/MR3+bPQIc3zMIiKID4w0x9JdQgXw2dpO/M6bMuJVEL/v0svycgY46+fGZNepxEBTwGVvD9tKMvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QchRMCan; arc=fail smtp.client-ip=52.101.53.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QchRMCan"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEBlkd2k65EgbTaC+coFPZ+qkcXzNXr+UmdYu1TANHFnFRzY24OK//tSWW8fihQJ5K6OduGYpoQgiEAljUDZBnTW6tkOj3KjJNVSsfz8SsB8lZCSptc9/1Vrz/56WSTzKGjrROsDRV7PpEy3gStqhmsJ+efNWn8Ql+k0lyYHhl5DTRvRDNFMS6IUjafEGNs1+1oTG7OUicn0AwFbgutcm2GPEf2f+zVn7fAqFJ7ig5Ykp6PwNXzUKul5cxirppNVkg11vrP7pfHHY1pAH/yiHh3bEyM2++Q8OQ58L8kmVUG8lVlWYINpS674c4UWVSUds0VzATgqz16FvcRq1QHkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOPZ8ZZfOUCV2y5c9JOrIgBLwu5TyKP6Ny+wq74gBqg=;
 b=wJKLrRzVgw51gR7Mpas76pYwaLBZidw8y8q+5wb3Nj/m+JGCZXbnnjamkWR6tONSy6hqq5pQ+eHp9xN4Acz2HgjHSpkwRN15HjpExIFKCc7q9vnmHBqes6tec1VnjEs+pFD3wzpsD9IqT/MabYmaEHzzvf+NqzJ3ZgdWTVRdXdDMY2xH9Qkh07vk+Rfu8KMG7oSzIrSDCyTeN+vDCqB0b3Z0otrNHRFOxcVwCNKIMIpOWllxCYCKmM5YSAApAc+r9k7W12xq4mwb6y7QKJ++WhEhAaVeFLYviImVdrJzr24shuw4EPvTFiXrZO0oHVB97HxA271AOMCOsu0Zp2pBww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOPZ8ZZfOUCV2y5c9JOrIgBLwu5TyKP6Ny+wq74gBqg=;
 b=QchRMCanWxRF/gaR8LmvRdqgJCrX0biHr2OeRlQ5pXKhhCLZS0GkDH8sRH4iayvxjALdTsZXir8pm6QaNJV7XCr28itXFg3pED1yoGeq/8eX+0LwbD99P9VIyXfHpteASsb7pYBR7NlQ+flJG4+bQQUE8jGlcRMHELTL3Q/JHKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS2PR12MB9591.namprd12.prod.outlook.com (2603:10b6:8:27c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.18; Tue, 14 Jul 2026 13:05:05 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 13:05:05 +0000
Date: Tue, 14 Jul 2026 09:04:55 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260714130455.GB364094@yaz-khff2.amd.com>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
 <alYPZGTBJUDR936n@csail.mit.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alYPZGTBJUDR936n@csail.mit.edu>
X-ClientProxiedBy: CH0PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:610:cd::28) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS2PR12MB9591:EE_
X-MS-Office365-Filtering-Correlation-Id: 020d5bc1-6143-4389-496b-08dee1a88629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	06wYIJawwsK9pRLQ/1iTYoXztRutJgp+KDebZX3jSaX3jAQIuAgddxUlKiLwblf79d8wl0qx10fTvs4xTHPwgtAo9lnYwbhdGRcGjq7XUQ+CJ6hEWZnq4lrI1J4gRG6fDWYurK/oKVKRPGH0H+9Qve6r+rGV0Lqtl6OUVkx8xE4YDOC4JHoGwIiO9Fd0xiyV0YQdzsDDMs3Uc51Ix0xESFTj51CI5RvcyRX/BbNvQT0Fo0R5rd5SOmP8IdLP4lWOR8Z5b5HSDQAZJpllkW3Z8IJ+Rh1SLFqkt2uenil5lgUvf15kOMbgO+0B2zczcHumQiaZRky6WyxDcssTe59OqxsDPw/1gGt3Nm8aTyqtVcB7s+Mx2DB4zLfxyvvUV63WX/pef6uFAbk2v8+wHGSRAmD6D4jdNuD3qVjss/G1OUzDady4rIRtJEord61czYgUQUfl82cgfKoIq7OCLutNfoWQRKEjt0Ase1+yu/hAjGtaWHqA0ctGbsWR/e++sgkqKF+aIX44teEBWZPbYSDM0knvAkim8EBXD8nSTkzCzs+cBh/rXjGvLWMtZ9zybN6zcdilPYi8SS+c1bBGr/TQEvX/UqVGVcjdstaFCNCM1lU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3/3V+kAV1f6pbisnUnWlDlrRn9GTbGceoinTocsZA3vXCdTItD+NPyPdFyh?=
 =?us-ascii?Q?oUiO4Bi9tptqOEnQD+N33nvve2EzDtSnfI0JXVF/5Ebndz6R/10xbSG5bM7Y?=
 =?us-ascii?Q?35g8XLzVoAePV3ncdWhb8T7BpGZfRlfGQQEFyzQjGzIbL+QO6bJnO+HB9MUR?=
 =?us-ascii?Q?ztlfCIEd99p9ioVkaF11LC89Ny3gYovxP2uZZaz0vghD/lrrwQL7lC78R4CF?=
 =?us-ascii?Q?j47mKw8kc+wcrcS7ilH7fmtz+Hr0wsLjZNfFoZN7572LV0BFfYOTiZZ8eHC8?=
 =?us-ascii?Q?NTOWCRnUtEkd4K8k6mSO/vvJjZOgbW+1tT/7g8KtCKhNBfbt+w4zIbk75T8C?=
 =?us-ascii?Q?yZLmTrSpuU/xvNYqfbVny3bTyVHO58Et9lKdOqrAf4qa/y5Nd5qJ1EXMIdu2?=
 =?us-ascii?Q?USLrGpbwRiu36Azd4bxEhTf/BSnY3XXCplKkhHW5a9FiutoXxCFu32I+sbap?=
 =?us-ascii?Q?1eAXR9k/41Vrw8mdCqK+cMQ4zr4xjjQ0UoxApEZvyboZmCXL9p28bHc76ltl?=
 =?us-ascii?Q?AY0xTu8AfR5dhe+dlZ82fwbnbBs48NiEbE7xRDp1Pnt/+C06ptHAn+mJ5hI/?=
 =?us-ascii?Q?N+07WYVF+oByVFq7FJih5njoRMMej7leg7T+PmC/htKWkDj8wOp5nEr76+Vs?=
 =?us-ascii?Q?utE4PPNfF51Whq1b87Kghwp0DJthZvi8e7k/vYopkBzksBUr8agVKlm/P1LU?=
 =?us-ascii?Q?LX6EjodlMcQD8oyzAN+rKo7I1gxsuxBJhY13yKXWk45WWIku6D/XY4eb1Joj?=
 =?us-ascii?Q?AHMlCFwzxw6+a7uMGsBtg2epsMPHOGSRpcg0QegbdsrcUTQnCzxtN0/GBBSU?=
 =?us-ascii?Q?Kft7mRW+VDLxaWzXBADVYiZBmM+88XK0MgbCyTWIslIo51eCz4QC53t8L265?=
 =?us-ascii?Q?w047CEJjn6kmC1j43B+pD4lRJAl9eUcCEourdoJKzF1N5pcsiUMR6zvn2aN+?=
 =?us-ascii?Q?bJh/D8vUazsWmYGHZCfl2PedIqnETKxKjvdNexBROxoR8X2ujedgXbNMTuNc?=
 =?us-ascii?Q?FsjHBL1xM9339oToW6NJb62E4l5EfG8dr3aRvrjUqIW/VSlzEsNhTyDfds5t?=
 =?us-ascii?Q?7Zgj6KAeZiokO7slSvoqpB1WxewI/aUzD2dpfycDVM/+RtbAB+RMvNauqkH5?=
 =?us-ascii?Q?nb3qFDTNYU+SUnXFCypDn0l8n0yqSJLUQS44pjp/+v5yL+SNieqys0DHnoqj?=
 =?us-ascii?Q?YS4tY6SCtv21aqSzMod24CtJoHgAW5bBxx3uGcG5Z/qtLllTXVSbieGsNWPO?=
 =?us-ascii?Q?rgFPtPmoU/FsmmMiExhYMpqFdRxgk2siEqcs+OLEU8PwyIQ49F+T6TWH6HSJ?=
 =?us-ascii?Q?LxUP5DjRkhabdQ5ZdLsxJm6q26cdeFAETnhy5BINO5naN9sg3/VRPcQG5xKJ?=
 =?us-ascii?Q?GjyJThYJphE86TlpAo7hiJ3hbrQc3EOz5hfAfwUBTQSxfQeWHlxbfB0bvZHS?=
 =?us-ascii?Q?Cr75bluXjUcokscVx3VBSB9e/GUmIUHT1Z0eCukm9PjGB+9wE2vfUZFekZbC?=
 =?us-ascii?Q?siob+O07Nd/47zfo3zJYOboMt5tmyiLSMlS68L+B5fNWGfgunvsZVjOgUj6H?=
 =?us-ascii?Q?oLp2orJZ+WD5p6k6vpObvb2hodVY3LA/D+2wfod75dujHdkGN5yI3+VVh5RW?=
 =?us-ascii?Q?t2B/373fAP1BU2QJFaW7c/ckZTV7TVbdF2DVqwHQ/ZwEoXivoy0kb0hgNV9i?=
 =?us-ascii?Q?nqgbNQXxLF7kAf5zWnTTDFFob5Tr0t/1JP67lJsByE6GtCRu8lyTuBGv4udX?=
 =?us-ascii?Q?6h89/5Movw=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020d5bc1-6143-4389-496b-08dee1a88629
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:05:05.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lduznt0JWOBWIBxt/YMYYVYa0doP1EjNTRi+sbRUqph0GPOvkNdS9GOOjvnXL6J64UtoIEawV8Nh0YVViAMNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9591

On Tue, Jul 14, 2026 at 03:58:52PM +0530, Srivatsa S. Bhat wrote:
> On Mon, Jul 13, 2026 at 04:22:19PM -0700, Borislav Petkov wrote:
> > On Mon, Jul 13, 2026 at 02:44:02PM -0400, Yazen Ghannam wrote:
> > > On Sat, Jul 11, 2026 at 08:16:48PM -0700, Borislav Petkov wrote:
> > > > From: "Borislav Petkov (AMD)" <bp@alien8.de>
> > > > 
> > > > With error records which don't have FRU text, an empty newline is
> > > > printed like this:
> > > > 
> > > >   [28014.094610] mce: [Hardware Error]: Machine check events logged
> > > >   [28014.094674] [Hardware Error]: Corrected error, no action required.
> > > >   [28014.094687] [Hardware Error]: CPU:11 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
> > > >   [28014.094724] [Hardware Error]: Error Addr: 0x000000019ba9a974
> > > >   [28014.094732] [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000081a1f2505
> > > > 
> > > >   [28014.094744] [Hardware Error]: Load Store Unit Ext. Error Code: 1
> > > >   [28014.094748] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
> > > > 
> > > > Move the \n into the last printk() call where it belongs.
> > > > 
> > > > Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> > > 
> > > Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > 
> > Yeah, Sashiko has a point:
> > 
> > https://sashiko.dev/#/patchset/20260712031648.486110-1-bp%40kernel.org
> > 
> > So we want the error records to be compact and fit in a block so that you can
> > recognize them easier and thus not print each thing with a newline.
> > 
> > But those things are not unconditional so you cannot always know.
> > 
> > I need to think of a slick scheme what to do here.
> >
> 
> Do you mean something other than moving the newline print into an else
> block like this?
> 
> ---
>  drivers/edac/mce_amd.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
> index bd252cb3c38e..60d1a62e1a95 100644
> --- a/drivers/edac/mce_amd.c
> +++ b/drivers/edac/mce_amd.c
> @@ -870,12 +870,16 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
>  				memcpy(&frutext[0], &err->vendor.amd.synd1, 8);
>  				memcpy(&frutext[8], &err->vendor.amd.synd2, 8);
>  
> -				pr_emerg(HW_ERR "FRU Text: %s", frutext);
> +				pr_emerg(HW_ERR "FRU Text: %s\n", frutext);
>  			}
> +		} else {
> +			/*
> +			 * Explicit line termination to handle nested
> +			 * conditional prints correctly.
> +			 */
> +			pr_cont("\n");
>  		}
>  
> -		pr_cont("\n");
> -
>  		decode_smca_error(m);
>  		goto err_code;
>  	}
> -- 

Another option could be to build up each newline string and print it
once. The gist is to get rid of pr_cont() usage.

I've attached an old patch for that. Would this work?

Thanks,
Yazen


From 2035e5b829de2834aef8d84de24bafb5f4e5e03b Mon Sep 17 00:00:00 2001
From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Thu, 16 Dec 2021 19:06:14 +0000
Subject: [PATCH] [WIP] EDAC/mce_amd: Construct string before printing

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/mce_amd.c | 64 +++++++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 19 deletions(-)

diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index bd252cb3c38e..ea6dc7437cae 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -744,6 +744,8 @@ static void decode_smca_error(struct mce *m)
 {
 	enum smca_bank_types bank_type = smca_get_bank_type(m->extcpu, m->bank);
 	u8 xec = XEC(m->status, xec_mask);
+	char buf[256];
+	char *p, *end;
 
 	if (bank_type >= N_SMCA_BANK_TYPES)
 		return;
@@ -753,7 +755,13 @@ static void decode_smca_error(struct mce *m)
 		return;
 	}
 
-	pr_emerg(HW_ERR "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
+	memset(buf, 0, sizeof(buf));
+	p = buf;
+	end = buf + sizeof(buf);
+
+	p += scnprintf(p, end - p, "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
+
+	pr_emerg(HW_ERR "%s", buf);
 
 	if ((bank_type == SMCA_UMC || bank_type == SMCA_UMC_V2) &&
 	    xec == 0 && decode_dram_ecc)
@@ -762,26 +770,33 @@ static void decode_smca_error(struct mce *m)
 
 static inline void amd_decode_err_code(u16 ec)
 {
+	char buf[256];
+	char *p, *end;
+
 	if (INT_ERROR(ec)) {
 		pr_emerg(HW_ERR "internal: %s\n", UU_MSG(ec));
 		return;
 	}
 
-	pr_emerg(HW_ERR "cache level: %s", LL_MSG(ec));
+	memset(buf, 0, sizeof(buf));
+	p = buf;
+	end = buf + sizeof(buf);
+
+	p += scnprintf(p, end - p, "cache level: %s", LL_MSG(ec));
 
 	if (BUS_ERROR(ec))
-		pr_cont(", mem/io: %s", II_MSG(ec));
+		p += scnprintf(p, end - p, ", mem/io: %s", II_MSG(ec));
 	else
-		pr_cont(", tx: %s", TT_MSG(ec));
+		p += scnprintf(p, end - p, ", tx: %s", TT_MSG(ec));
 
 	if (MEM_ERROR(ec) || BUS_ERROR(ec)) {
-		pr_cont(", mem-tx: %s", R4_MSG(ec));
+		p += scnprintf(p, end - p, ", mem-tx: %s", R4_MSG(ec));
 
 		if (BUS_ERROR(ec))
-			pr_cont(", part-proc: %s (%s)", PP_MSG(ec), TO_MSG(ec));
+			p += scnprintf(p, end - p, ", part-proc: %s (%s)", PP_MSG(ec), TO_MSG(ec));
 	}
 
-	pr_cont("\n");
+	pr_emerg(HW_ERR "%s", buf);
 }
 
 static const char *decode_error_status(struct mce *m)
@@ -807,6 +822,8 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 	struct mce_hw_err *err = to_mce_hw_err(m);
 	unsigned int fam = x86_family(m->cpuid);
 	u32 mca_config_lo = 0, dummy;
+	char buf[256];
+	char *p, *end;
 	int ecc;
 
 	if (m->kflags & MCE_HANDLED_CEC)
@@ -814,7 +831,11 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 
 	pr_emerg(HW_ERR "%s\n", decode_error_status(m));
 
-	pr_emerg(HW_ERR "CPU:%d (%x:%x:%x) MC%d_STATUS[%s|%s|%s|%s|%s",
+	memset(buf, 0, sizeof(buf));
+	p = buf;
+	end = buf + sizeof(buf);
+
+	p += scnprintf(p, end - p, "CPU:%d (%x:%x:%x) MC%d_STATUS[%s|%s|%s|%s|%s",
 		m->extcpu,
 		fam, x86_model(m->cpuid), x86_stepping(m->cpuid),
 		m->bank,
@@ -829,28 +850,29 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 		rdmsr_safe(MSR_AMD64_SMCA_MCx_CONFIG(m->bank), &mca_config_lo, &dummy);
 
 		if (mca_config_lo & MCI_CONFIG_MCAX)
-			pr_cont("|%s", ((m->status & MCI_STATUS_TCC) ? "TCC" : "-"));
+			p += scnprintf(p, end - p, "|%s", ((m->status & MCI_STATUS_TCC) ? "TCC" : "-"));
 
-		pr_cont("|%s", ((m->status & MCI_STATUS_SYNDV) ? "SyndV" : "-"));
+		p += scnprintf(p, end - p, "|%s", ((m->status & MCI_STATUS_SYNDV) ? "SyndV" : "-"));
 	}
 
 	/* do the two bits[14:13] together */
 	ecc = (m->status >> 45) & 0x3;
 	if (ecc)
-		pr_cont("|%sECC", ((ecc == 2) ? "C" : "U"));
+		p += scnprintf(p, end - p, "|%sECC", ((ecc == 2) ? "C" : "U"));
 
 	if (fam >= 0x15) {
-		pr_cont("|%s", (m->status & MCI_STATUS_DEFERRED ? "Deferred" : "-"));
+		p += scnprintf(p, end - p, "|%s", (m->status & MCI_STATUS_DEFERRED ? "Deferred" : "-"));
 
 		/* F15h, bank4, bit 43 is part of McaStatSubCache. */
 		if (fam != 0x15 || m->bank != 4)
-			pr_cont("|%s", (m->status & MCI_STATUS_POISON ? "Poison" : "-"));
+			p += scnprintf(p, end - p, "|%s", (m->status & MCI_STATUS_POISON ? "Poison" : "-"));
 	}
 
 	if (fam >= 0x17)
-		pr_cont("|%s", (m->status & MCI_STATUS_SCRUB ? "Scrub" : "-"));
+		p += scnprintf(p, end - p, "|%s", (m->status & MCI_STATUS_SCRUB ? "Scrub" : "-"));
 
-	pr_cont("]: 0x%016llx\n", m->status);
+	p += scnprintf(p, end - p, "]: 0x%016llx\n", m->status);
+	pr_emerg(HW_ERR "%s", buf);
 
 	if (m->status & MCI_STATUS_ADDRV)
 		pr_emerg(HW_ERR "Error Addr: 0x%016llx\n", m->addr);
@@ -859,10 +881,14 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 		pr_emerg(HW_ERR "PPIN: 0x%016llx\n", m->ppin);
 
 	if (boot_cpu_has(X86_FEATURE_SMCA)) {
-		pr_emerg(HW_ERR "IPID: 0x%016llx", m->ipid);
+		memset(buf, 0, sizeof(buf));
+		p = buf;
+
+		p += scnprintf(p, end - p, "IPID: 0x%016llx", m->ipid);
 
 		if (m->status & MCI_STATUS_SYNDV) {
-			pr_cont(", Syndrome: 0x%016llx\n", m->synd);
+			p += scnprintf(p, end - p, ", Syndrome: 0x%016llx", m->synd);
+			pr_emerg(HW_ERR "%s", buf);
 			if (mca_config_lo & MCI_CONFIG_FRUTEXT) {
 				char frutext[17];
 
@@ -872,10 +898,10 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 
 				pr_emerg(HW_ERR "FRU Text: %s", frutext);
 			}
+		} else {
+			pr_emerg(HW_ERR "%s", buf);
 		}
 
-		pr_cont("\n");
-
 		decode_smca_error(m);
 		goto err_code;
 	}
-- 
2.54.0

