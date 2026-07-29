Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010002.outbound.protection.outlook.com [52.101.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF734390CB9;
	Wed, 29 Jul 2026 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785354764; cv=fail; b=Duz5GEOLc79wh9lq/Uh9LkrBpqtr+65s5aybiRRXDH/kIOV9CvqHDt7qLd/vRPDJlqVVa5jV/jT+qW4sx2/OMHK9fG2P4XETTDEtD0uNCg7c+rIMyc/3gZSr+bR8DPhF33KwKlZdxfgBRPP09q3QcKvKa9zKa8ftXIhOFBR+yes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785354764; c=relaxed/simple;
	bh=41yRTHlkf3th1d5lh1Q9cmXOUsTk7mPr8568dCgXJOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hLUTu44WS0FauANsiMj06QQ1mM8y77Lu2lOb7rq/B0YmbtMAlUD+zEEWwTgNjxzn71Pwq7cuqdHA+efvKzibeLQtzIMQgIrmtqKETI5nRKibjCOuGrUq5ZaYbweo17VF18FvqLjPUv8W62ilFT5iPgYym0dCcX4vO+vvM/PsDR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=R8UvjWI+; arc=fail smtp.client-ip=52.101.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="R8UvjWI+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCuejE3U4ETHw7eQxEXsVNMGYj9uR8szc3I5+p67HdzkRjoxSho51HcDPI/XUZigd+vC3FqW5NfkwwbK2S2h8eLaaGN1K3Re3PHuQzNG540lUnxQZ2N1aQ23bmzymNCN5KthfATcQQYPMowqB2X7duEhqSFIVyfRn3FCoLLlSFW24op/ppLwnnMpZ+GLVf02NVP1Q/9CtnmeGhqlvkRi1p6eWiEI4YtFQ4LzS1YxkRjFdIO4REQTn77IdsDI8fLVGEhgmI2gop7XIpZO4IUW8thHP9Lql5rUPql+jLKR8cRcSDpBHI5i5GpK5U12AtzednaE4SnPtEsifLrevbBBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xAFrYV3RR+iZXowboKwkFgsJ5WyKzsreYd2czRWfvo=;
 b=RLYqrMJXQCc4XnbWQEEdba2F1O+kpwhQVBGhUTDty06if3bvmFhpx0mLvPb+QDa+Rqtbl10jPQqTFAu74KKmG0nFAfNxO0A8c4gI0I+yNMuxtQm7STyrjiaWHmeVAvr4BAx5mkaCCWbCl31qAdAZNi3e/A/oINrnZnXysACJVRd90hnBZvzC7jI2aGhJKnvx77hHHtVWrzyxumSgjFO5kvqpa4OLkAq9clisuNhl3Cul4b7LDCCkViIgi8lpxbuxoSmBMxPu3Nc/EqeLe0Ryh1ZYsO+Puo/KP4SwSTbsaYeSjY/WmrwfaJoqwXCITAsPkDmnu2U8OVj5Wndqcs3/vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xAFrYV3RR+iZXowboKwkFgsJ5WyKzsreYd2czRWfvo=;
 b=R8UvjWI+ZjltFeTtlQ5ppPHmDM3xFUTooub6pH6ZIfg7gNKVS23DBI8sFKqsdJrDR/D8hzgGSXWbtVPVyAdtyi+wSQfT5p+TcK57nzsk2Z2kwZD96Oq7+cwH+tk7Vm/giY19HKs1z3kCUi1qlZ9KpGbTsVBmCtZpWxmJJWi7I50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 LV5PR12MB9755.namprd12.prod.outlook.com (2603:10b6:408:307::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 19:52:35 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 19:52:35 +0000
Date: Wed, 29 Jul 2026 15:52:27 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Cc: Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260729195227.GC1977085@yaz-khff2.amd.com>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
 <alYPZGTBJUDR936n@csail.mit.edu>
 <20260714130455.GB364094@yaz-khff2.amd.com>
 <al2uZnOfkGxXv1q3@csail.mit.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al2uZnOfkGxXv1q3@csail.mit.edu>
X-ClientProxiedBy: SN7PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:806:f2::24) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|LV5PR12MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: d34f0846-f8b1-43df-6627-08deedaaef63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	LnzcQgOdVuVXLb2OOvFyOXOvvDMDAAfvkXL7W3857DLLQ5Q5ue7nyQgC3MfRh8qhuvXn+jYRNTWNxqu0FPpIS18+LYzd7FbfUBI01W7EpPhs2T8HfwwJfBbfvoFar02YipUuRRQPO+WT8OkUs1gtzPQ0QCOWju4U8kklqtwpGbXRTLmc0LaQD/FCx1bKC/0ZFiwmCcNJEz33ChFTU2qZjPKGTU4LhmtJcgZUsc/Cj8qjfGrbHNMLVd79qGoi4JROEbA6uULhHOEW2wBaFYCUfqajlO8l2TKBOoUaurenL4H4zk03vuZVlOwFhmNUTvj4pdjr5kHkhLFI5OjF5kYTjrx7AXiiV5GLpWIaAur6VIWPifAfubJk4UzsTQ5a9GkaaaPjHsSirSezyLtFW2QV6UhZuC+ms/ezZkswoG9i4zhXpZUaBMqwd0KUmsSNAf87PluOA3g8d3YDb8e1OBNeWK9850Hdj2oCJ+6jTJjvc8JFt14K/nfqtwFCvfv+iEVkxujbDHioVJU4s/ZRBKuLDwqBJC0WLRU7XERQGhsZ4YGUr9C+pkjBNTIVWpKNw3ZBhkZGIrj0TyVvaRxoNA43ZdjG8NpC4nfvHxtrT8DBytM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fnTCcHm35Jx2vY90q92wdufCRWq0KiFMH6RZGIg0vg5MdFGqjcoURN+utvOm?=
 =?us-ascii?Q?HIiQKahMbMqinsUzpmsz6vsvNJMfmv4g1LCPZJ4IT5UsTG5ZPu6RLasA2GF9?=
 =?us-ascii?Q?xn8ZcIJ9unaDvZgDwnm1m+taFshWul87uPLLNNOADJX/Q1/X5O67v9oFboL2?=
 =?us-ascii?Q?VwO+qXOttsr71g/JVgtcf0T5UaB8YPx5ipQREogxwEgWsojebA8LvUJTYC64?=
 =?us-ascii?Q?GbZUA3oIXKEHEqJM3toa+5Exdq6MmpiQIQ5rVCQiPwgIw6q6/T9y9kXb3xed?=
 =?us-ascii?Q?vOsEvk68jEDrRDtuOfo03j1sYDRcOCXvKZA5tk0cRyStJYLbeXh2B/fRl7Ri?=
 =?us-ascii?Q?1X48aIZzHZEcfxH69097h2iDiNbPrsQvr7qTi8AUjtHvoKH065tuu+5TCMHZ?=
 =?us-ascii?Q?nKrKjwzYwTtuRqPHAJ5Rn5XowdLmR/CXwg9Jts6twW5WXbD+SL4dlIvvpXn0?=
 =?us-ascii?Q?l3fxuM2mzK+ctouynWW6oGW4PlgWYjAfdO9vAZIHMGrKSnR3xovTO6D0CFWo?=
 =?us-ascii?Q?adBqAbjSbyxHqFPxhQl1b6xxVtHKG9wwNe6UQOXI/bvrw1AoM0xQ85qGmWXJ?=
 =?us-ascii?Q?RvhixY07eK7lcT6LKjs+tpAjW3pwtHaXRMIuBT6A5TgQGnxeCYtyY5bf6Ko3?=
 =?us-ascii?Q?TyvgVuf5gE/4oDxvEoJ9JUao3S0FOkITuG/EcuNi6EP30UG08Nuh3K/68Gjw?=
 =?us-ascii?Q?XK2p26wl3D83//VMI/C2+ZPckCufV/8gYIs7ubVGgn9uHmDg4KZwISu7EDWJ?=
 =?us-ascii?Q?I5AO/1RLhKDFkPino+UNmeivdUnQe50QHYNzIEcv1jQRtJjA/RRLvR1LD8MJ?=
 =?us-ascii?Q?FvabZpt2KiGZ7I8587CFE6LyqVsH0xsESsRJdCmwZweCcdoIA6WPZWem8qML?=
 =?us-ascii?Q?gqirX8AaGMsQKREu0PVwqn8WZYWSPTCjF1Gp5P9G0ZUrgkLtGhYm+6jT6iAQ?=
 =?us-ascii?Q?Rfaq+vLSKGveIUPxhFHQepburHdOZETod8DWUNYy8/+Taitzj33sDsbZl7s7?=
 =?us-ascii?Q?jDRdLHKa0U5lWr9XE8N9MLHGPVnrmRwMSW2eW6kf3dPXmEcW1kPbfo1e4h0C?=
 =?us-ascii?Q?Ap8vrQshiEuqpsoWDvaVc7l7xInr1Bd0rcodrNOzibhS2XOKEa7DMHk684lm?=
 =?us-ascii?Q?TyB9ngkxRywvW/IgTWC/I0bPnG5eWswrwtQHye81azVeg+CXTCgKxqbw4x7Q?=
 =?us-ascii?Q?DdfhvHKAsyoSEDpZ6nEJkeWCTUp2Jy+pSagS5JZt7zziiec6vscxqVc/Bd9m?=
 =?us-ascii?Q?J7c8imypaPHg1NBCZij27NpLHs6j5F/KgbB4zBz4sg3CEebqQHR3BFwKXwWi?=
 =?us-ascii?Q?ZlFP8rK+rstOSEnHWxZmpH+A5QUseGLugpMS+UwMzWFqHqy61/f6hAopeVmq?=
 =?us-ascii?Q?/SxK5d5piqKeoBoKdDs4xVw4BOz1188FSUztW/2VzAK279LE8HbRgjC2d7Ev?=
 =?us-ascii?Q?GH0zM+IlQd2ZGCxavGOIuTzg7wnxuq+H9yFv0aP6FE5BbvRtW1Mf6Xp2tI1l?=
 =?us-ascii?Q?zJ86ZMHZuBhl4eb/eOTaFAWU5M9r7NjTfi4jxUo1CDMwGt8Hwqg+fgGtRqMv?=
 =?us-ascii?Q?Ut75IOxJ4aYXq/WpxUaKiMg3JuBlRS4vxI6s+rrBLKXQqTc0vqTm8jepZkkH?=
 =?us-ascii?Q?57XG8dCE1wCYDasWVw7DjODxKcOXcplY17Q7Lq6Qtd4yIanKQl/MvGLEIDKM?=
 =?us-ascii?Q?6c8WwzPxHBEgpgRheFimN2N1laIxtbxypuXf4ogEzA4HXe/E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34f0846-f8b1-43df-6627-08deedaaef63
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:52:35.2243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db8qYUr5BROydGAgijvdAqe32WG36LloFvjpMrj2H6UqdBPhaPj6hRcCsPk/OOTMfCM0D6HbJcNxYi0lQufIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9755

On Mon, Jul 20, 2026 at 10:43:10AM +0530, Srivatsa S. Bhat wrote:

[...]

> > > > 
> > > > Yeah, Sashiko has a point:
> > > > 
> > > > https://sashiko.dev/#/patchset/20260712031648.486110-1-bp%40kernel.org
> > > > 
> > > > So we want the error records to be compact and fit in a block so that you can
> > > > recognize them easier and thus not print each thing with a newline.
> > > > 
> > > > But those things are not unconditional so you cannot always know.
> > > > 
> > > > I need to think of a slick scheme what to do here.
> > > >
> > > 
> > > Do you mean something other than moving the newline print into an else
> > > block like this?
> > > 
> > > ---
> > >  drivers/edac/mce_amd.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
> > > index bd252cb3c38e..60d1a62e1a95 100644
> > > --- a/drivers/edac/mce_amd.c
> > > +++ b/drivers/edac/mce_amd.c
> > > @@ -870,12 +870,16 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
> > >  				memcpy(&frutext[0], &err->vendor.amd.synd1, 8);
> > >  				memcpy(&frutext[8], &err->vendor.amd.synd2, 8);
> > >  
> > > -				pr_emerg(HW_ERR "FRU Text: %s", frutext);
> > > +				pr_emerg(HW_ERR "FRU Text: %s\n", frutext);
> > >  			}
> > > +		} else {
> > > +			/*
> > > +			 * Explicit line termination to handle nested
> > > +			 * conditional prints correctly.
> > > +			 */
> > > +			pr_cont("\n");
> > >  		}
> > >  
> > > -		pr_cont("\n");
> > > -
> > >  		decode_smca_error(m);
> > >  		goto err_code;
> > >  	}
> > > -- 
> > 
> > Another option could be to build up each newline string and print it
> > once. The gist is to get rid of pr_cont() usage.
> >
> 
> I don't think getting rid of pr_cont() was the intention behind the
> original patch by Boris; he was trying to address a user-visible
> stray newline in the logs, if I understood correctly.

Correct. Though the issue may be resolved with other rework.

> 
> > I've attached an old patch for that. Would this work?
> > 
> 
> The approach to build up each string fully before printing it that you
> demonstrated below does look like a nice improvement in general, but
> I'm afraid it may not be a good fit for this particular subsystem
> though, for the following reasons:
> 
> 1. Given the EDAC subsystem's role in handling/reporting hardware
>    errors, I think the logging preference for this subsystem would be
>    to get the error message out as soon as possible, as the machine is
>    already likely to be in trouble if we are printing out kernel logs at
>    the criticality level of "emergency". So, delaying these prints to
>    construct the full string may not be desirable, as doing so can
>    potentially cripple the ability to get even the error indicators
>    known upto that point printed out (in case of further occurrence of
>    hardware errors).

These EDAC messages are a convenience to the user and are not indicative
of the severity.

In fact, this is another low priority item I think should be addressed.

The "printk" log level could be linked to the error severity. For
example, "info" for corrected errors and "warning" for uncorrected
errors. It is not rational to treat all decoded errors with "emergency"
log level.

The x86 EDAC modules listen on the MCE notifier chain. If there is time
for EDAC to decode, then the event is not an emergency.

> 
> 2. The static buffer sizing for the character string (256) is
>    potentially prone to buffer overflows in the future as and when these
>    print statements evolve (without taking the buffer size into
>    careful consideration for every change to the string).

Yes, that's the goal of patch review.

> 
> 3. This is a much larger (cleanup) change than what Boris had posted
>    earlier (which was ~2 lines).
> 

Yes, sometimes simple issues lead to larger cleanup.

Thanks,
Yazen
