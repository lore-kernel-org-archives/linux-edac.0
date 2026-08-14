Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013064.outbound.protection.outlook.com [40.93.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B263D33998;
	Fri, 14 Aug 2026 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715001; cv=fail; b=GsUzUXLVA6Ia0Ekn2ZBCrxM/m2uh+5vs0HIGVc2WUSTfoNP6EQw010lX5Larbr6fA7STZCoOHtUc8+oda4m+oqB5nYhcRu0leUgrkUe7oqKT1SF988ln/OjxiOe9UZZei92JZZRUZ+x1Whcws2OPMa9cdZ63SqCx8GmBlNqC0kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715001; c=relaxed/simple;
	bh=VQwh2sEo8K75c4ykpqjRHAib//WrfvVavFDGtqpD9+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pZFI1QRBz0AvEjliFW/5RjRAWvYtsqcb5JsfB9RPC6/Ha9bYDWkH+PVeUp6IDmsj7ZbE3cK8CaqKONVYW3AzdkzIYgKZDZjidKCuh8ovZ7cE8ILvWwegnnEq0YNOevy/AtnasLa8ULtPKmzv3I4KqJyFe+J+29nkmy1yQuafHBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zRRF+2f8; arc=fail smtp.client-ip=40.93.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zRRF+2f8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2Z36cr8Uo/sr9wZkBYJdBeI1t1C4uur6wF8a7lJCPoRiHEUqwWR83EZlj46+rTjeoTfbw+Rsscp2v/PIo5dgX1oQRFr1kPHbcDhSdLi3WmJynQFYt6mqzsjPvFSQmAtSGav+FpZMwxDJd9errDaUSap5pouygsuZvl/I35NBYhNRrIgS0uUvhpw5BDuvbvX+mRTmstGForpSP7d5DyQNVZF8WX4cZ33BSoxAmkGsuY6bHmNwCIdDai3d5V+1LYDCsOO8cfUEZqfPr3QWYb9BDlLWVhcIbP2gaPi9qD/7fbOpqcGXRq7NSxgyOWlbL8Q7oFHVFslyelCwjNUM4dlqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JRUXlemqQt6nY35ef/s6FdpYhB0nsGj3wBfEQ15YjI=;
 b=lAzOGLSaQ04ggtFmnUdKHrpTdRXRE4LjD0fOFjPtkrxeGMF0+xH3gVMq5y7NFmKuDSCi2EGf5ZhzdDSTEyRgcXMlUwDTeMnQmfQJwMLXdDHgIRGI4uDzO7twkTx7mhBZWgCYJPrnuhMC64NUekGxlbt1rnRT7pHmkPnVWl2WTcuXOAaApejN5kdBvcCdygeZaVw0aqAGGYDhNf0caaxwYKkqJsVMjutDd5dpulZ1GZTz9bxCuPLZL0mLJO7vn2Rnrm6ZdrDOX1dc6W5zsb6wZ+cUPo4dKHM+mvIVulhNhJdXAXkB6Ap7bcYRZEV+RyOr6CIHOQfcELdS4XiAN3YVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JRUXlemqQt6nY35ef/s6FdpYhB0nsGj3wBfEQ15YjI=;
 b=zRRF+2f8/47d8L9G4phsLS/YXJUvPl+BXniOkh6ZQykEE5+9Yv3xZamMux85iLah0O53NXbB5A8/yNjwkyjBnNvYVQ3IvkaqVSoOlCYEmuU1PzruOWk/ca2+c4TtfkcuuSDNwf1sXII6K+G+P9Pbv3hKFj4mXgs3dpvXhqTPYWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CH3PR12MB8904.namprd12.prod.outlook.com (2603:10b6:610:167::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.16; Fri, 14 Aug 2026 13:43:15 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 13:43:15 +0000
Date: Fri, 14 Aug 2026 09:43:07 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
	Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260814134307.GA1650@yaz-khff2.amd.com>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
 <alYPZGTBJUDR936n@csail.mit.edu>
 <20260714130455.GB364094@yaz-khff2.amd.com>
 <20260812235839.GDan0Ir1Cx8KEu-0TM@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812235839.GDan0Ir1Cx8KEu-0TM@fat_crate.local>
X-ClientProxiedBy: DS1P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:8:453::10) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CH3PR12MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: f82ae95d-b856-4c91-79cf-08defa09fd6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10063799003|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Z0wWNW8WNUfN7CFIwSvsyg4gzwQFilSfWOFzK4OlSu4FziLBuXqjc3mBJv1YjHPGq8RglMpALAaNCUeBXXIz0W44xGdj1ltqe3X+tXI9+QAXKmrp9K53C9wesi7C1HxQpfxS8aY/O1VqJ3NjI4nBM+GMywK5ptnZlR3uOMByFakoS6OBuNgVr2v3flbbeBAoO6rJ8dXNW3tnarcZEA0352iu0WSxqNtv3qTwrWkcgh/2qcSPH6wicGk5N/g9Jkh2o7KIrPqBRtGZP3sCnbkuru6Yz9cXJxE70o6I21JRxrzl3SAQZNJkO5DIyc3hGLoxRUyJANP6+mxcUOOw9eAxHK6UuMQ2A+tyIXnYcY2UVM29q1FqPRioBU0oW0Msz/3xpDMIBlWWCzgxCVZBqAagFA7Cajn9O6L4yP/roPc1datQzPgxOW6qCtdWZIfcskxM+tNWruOrLo6Zh1h/H/ou/4aT3GDMkuiOjFc+P6ompH+LVoOdPQqsT0H2Zj+rLCieNOZomKHbx6wdlie/xjp5+2gJJvKQrKqVzjsURCRP3EJ+f1yh0XW9RC0LtlmjJL1DWnGBkOHYlXWcQUxuDJ2yoU7nJwBGJUj+UHauPrOq0J4BefrKkP7aeNtRHf77CKuxnoEC06rIAHmDoUHyhnQYY78Y5nfU9dplfYW1xw8SFY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10063799003)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rmqYjtkrkjbFPfNkV3cuvHKsLxzrNckttK6G1Ps66iN2CNIQQWbfm8TrNCka?=
 =?us-ascii?Q?aOz/HMl8tlivgEyzBdwMx1TYU7Sw5UwVnaj+moLVAQkpubp3jzm0NvWjBMpo?=
 =?us-ascii?Q?z6LnbKlW4mv/Kb+HxQJOYpnhKs+or8fGCdfphHupBeDYJbOTPPBVqtCJ1epc?=
 =?us-ascii?Q?kVshatz1Ygik1iLPmezQ3TwDZp1DoaeGKgylRgYy1CyCH0CxRzi69ReZxbbB?=
 =?us-ascii?Q?r94c97VFSK8q1yx2bgMsZnEwAJOTjF0Ox8tfcOT0PHAwymqC8xDZDu96hqLc?=
 =?us-ascii?Q?w7Ingo1owucqfUwuwD4fkAbGYASouNc8C8WiQRMylSOckXN/rFH5d4uxIf/n?=
 =?us-ascii?Q?99k+RwbrinI/0LrDB+aadloGU45SHtbLVrsf01/u/srNSzWwXs7SV/1y3iWK?=
 =?us-ascii?Q?Ua5grHCS0NrQm/EqY1Zg1qM/OpUTSZKWtLNPEAKiuCHZ3pscIcxMOridpBTT?=
 =?us-ascii?Q?7HVsHuuYH1GMqqZtSpbH6oZM1BOHIp7CvS8gOqkt6+sWiKIfuC1km6ZDO3hs?=
 =?us-ascii?Q?3gTYF0Vwb1tmTsgxdDPhtgTng+IDwZkrNyIhOUCA9uCLkg3635XMS4X8YsQZ?=
 =?us-ascii?Q?s74sTROocLwnYcDnB7FgCDG3EywfA+pwKEODbE88xXc2/94mJYmiLIvOuU+7?=
 =?us-ascii?Q?vYt77wltnwjAhtWkMYujplCJQ7+E/KMQSHccvxvCK5j+RJ+HWQ4fDjs1N5te?=
 =?us-ascii?Q?e0lyMuyupLoaMY56fsl0kSsrDavgcSx2dmBZv+vekNM9rlXRCgIwil1HK1YU?=
 =?us-ascii?Q?t5LxcR1K8uHel+lIyBNFWcHJAVzNtf5ZLaTetJUcQemnABM4zIVY+QvzqBk2?=
 =?us-ascii?Q?LEIaOjDURHCn96983ACWSpFCldkA1kIgZBPz6V9YqWrWFiQCG3LqcY6QBfe1?=
 =?us-ascii?Q?A5a2kqad+2Iu5JnNiAP2Gs7IzZM8SqT2lUX1RdkpUDhLzCc/BiA8te1Dkp6P?=
 =?us-ascii?Q?T/meESRtK7MixfX9ZLUpZ2KCrmVaMLe/9iEQECG8/prhl7Jg9r+TxP5ZjpIV?=
 =?us-ascii?Q?IzGsljh24sg1WSucTfl3mUtkANzxsDg3AnP+FOjfkf+sCC25jOZCH8smtEAJ?=
 =?us-ascii?Q?SsEx5QN+sXHO6qFSue9jSxtNVCr9wvWNN7Tn1bOY77NdMqU6/NYPrqF6+D7W?=
 =?us-ascii?Q?ke9O1uEiRYx0UMCLCPCHO2fFTG20YemzyA4FodoQ3COkwxKitq9S96fN9nGx?=
 =?us-ascii?Q?8II4lG/gAiUdyooDDFmeLxgOkC8f+4gEJJFCVSoolvhe1uNo9u7XhDKfRpc4?=
 =?us-ascii?Q?75J5xLByOi8yhCIAA6IcCrs94TPfreahcDA+ET9q8AVbwYTzAGx+j4+7t/em?=
 =?us-ascii?Q?uj9eciaf9ojvc7Wd2piIkV+LPxqU69+DzK5CiCqp7TOG7mee+r2tgZKHncLm?=
 =?us-ascii?Q?57Ug/6kUxGMyFWSNA61olaqoc+jiLWAv4rB0faJkdMS6vuuXc2wgSIJ1UG/R?=
 =?us-ascii?Q?NJIXZQOu9FhEJNmq3ieogPrtaSJqs+oGLu1UXi7fMmvYqLUKD5yH9+cYInNr?=
 =?us-ascii?Q?ekcfcT4nes1Us3cQYt0eLkwPLnmyjLJrX57HwiQb3+CqmmmymjnSnRQTO6Of?=
 =?us-ascii?Q?SerqAGNvpb+AHGwBR/rhh/lIktvFUxZTbS8CSZcjCFh3IDlkokZ8ytnLXuuT?=
 =?us-ascii?Q?aJ3WkzRMLOwgHd9jUMzjXTQZkwIiJyWdw3CnKbyBJ+J3Zyjs4NV/maD6QUpy?=
 =?us-ascii?Q?/pp8AVGLlh9KRitlJWYBs8ac47zPb7+DYjybnsqQUKsGRn7zDoUtzNhcIh9K?=
 =?us-ascii?Q?lumdVQbqEg=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f82ae95d-b856-4c91-79cf-08defa09fd6d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:43:15.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7z0uwfUaIKTz8OBdRm+czaanu7czzJviBUDcoT+Pq4OdeXc0HNlC5mx/J2YBdoqRFxR46J16ukwjnEVsZ4Um0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8904

On Wed, Aug 12, 2026 at 04:58:39PM -0700, Borislav Petkov wrote:
> On Tue, Jul 14, 2026 at 09:04:55AM -0400, Yazen Ghannam wrote:
> > -	pr_emerg(HW_ERR "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
> > +	memset(buf, 0, sizeof(buf));
> > +	p = buf;
> > +	end = buf + sizeof(buf);
> > +
> > +	p += scnprintf(p, end - p, "%s Ext. Error Code: %d", smca_get_long_name(bank_type), xec);
> > +
> > +	pr_emerg(HW_ERR "%s", buf);
> 
> Yes, I think this is the right idea, albeit with a couple of improvements:
> 
> 1. We should define our own vararg log() function - static, used only in this
>    file, which gets a format string and params and vscnprintf()s into our
>    local, heap-allocated string array of 256 initially, we can grow it later
>    if needed
> 
> 2. Function will be a fire-and-forget and should not care about ptr
>    advancement, buffer size, yadda yadda - log() will do that
> 
> 3. When string buffer is full, log() will complain ofc.
> 
> 4. When logging is done, we will have log_print() which goes over the whole
>    string array and splits it into, say, 100-ish chars and breaks the lines
>    then, during printing. We would use a space " " so that we can mark where
>    we can break the string

The delimiter would need more thought. There are a few strings with
spaces like "Ext. Error Code", etc. Though maybe you mean we can use
extra spaces like double-space between strings?

> 
> 5. No locking yet - we can do that later, if really needed
> 
> This way we'll be able to handle all kinds of error record formats but still
> keep them compact enough so that they can go out in a couple of printk()
> calls.
> 
> The other advantage when having a buffer like that is, if you look at kdump
> memory image, you can find the buffer in memory and actually dump its contents
> - one more way to get to the error.
> 
> Thoughts?
> 
> Lemme know if you have cycles to do this. If not, I can take a stab at it
> myself.
> 

I like the idea but I'm not familiar with the concepts. It'll take me
some time to figure it out, so I don't have cycles to do it now.

Thanks,
Yazen
