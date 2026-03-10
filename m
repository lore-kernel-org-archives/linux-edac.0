Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C539937E
	for <linux-edac@vger.kernel.org>; Tue, 10 Mar 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147269; cv=fail; b=UGtTHzfjGI/7DIMiQh43JktgDPQRkaP/ld1Ilt8lMwFqmyu9BFcwwkAogavM+J+S/KrkSh07NwqP6R6eQ8P7jAxnO+XjSsvdN3eQGLaVMgWruwYbucbHIJ+RUuqPUcoBwYXbvI79q7SfPkdYmn8XKaj6bmeZxrHQC52DGQi1ro4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147269; c=relaxed/simple;
	bh=ewcjS4Rnb/+ukN8RPwnWiyJqW/Dz6GljWbulKQiwqac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hPom0YnolH5uz4uIblqio1zBjndoqvYx0oz4lYIiO9clSnpsLrIrCMdYyCB5rZTpHAZmHnGdVhck1uePpMi9jseX0s1b9p7bfpLgxsMxnZwatuXan4MCRkYLRPrdYefjuR/uud2V7/rvJCMd3BXYwmAEJlPaQtTlzqAhwMFUZvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g0EF0QSS; arc=fail smtp.client-ip=40.107.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g0EF0QSS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taKJvocbgzY+BZQnY/MmlKvgmXL4IFs+O5x9Kw1PZSOSdgYnNJMpaYXwvCRNlgmmwio2HOyoS5MRGy4U4ZWeROEtp/oHnq/m6t7RSq719cK+EDdPT9hVnMRHoLeSw1htNk1kltMWouGRCqjKzXyUBZJYHXetJ1umlAptwFjx2nh7Av6HqOnVv9RMO0RO5G3/qH06PG9JvBuo1Qj9h3gAkH9IO35cAaqMWZ8w33jeVdCCkgjQw6Mugt/0QEUdB/psmge/iCKrc1HzzaWsXdvcEIhFAc7MnfZy8K3cjOLc4/cKDqPt/YSndFMfVJeszY7PtKVJ0kD8WA1f5L02PWGIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac+dGqgQM+eiFxMWc8RIStRLMnYnPQQjkWtE+btyJLQ=;
 b=RFPJ/QWnMamb20bcKiyyeLajgWK7EikUs8w0f4+rSYEwKCmSnFuena4tK6X7dIcmjXfGtc6FAciMJYGiN2X1CSTmjAHtzfZdVT6rqAZ6agNrvXmrRVYCF0lUcH5WTh1NOlNysAzwXeJLYcnH31jAJMN5PbKMS2kJ4njj57maZMiSuC1EMUMyZZd/qwMmT7wA59AMH0S06v/om2GmXOsPS68wPDnVcDUm/64aicyT/xX3j1PFUH6TJyMxb8VIJpuG7VlICk5qG5qdxyYVLlYbMpCmqABFOO8eRm1xjsp2JGLp8LESM66MUO15ayLipLEPwIbsr8NbpT9nOYf1xTN0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac+dGqgQM+eiFxMWc8RIStRLMnYnPQQjkWtE+btyJLQ=;
 b=g0EF0QSSrMg5URdgX3g3AZ89TCno6/nuD6L/mAGHYnWZGdWn63bLYVX6nriGOu+jNJGaDjIGqC6bnEQjFjsXF9T4kPlEaaux1yIrOrP3tYPl3L/AdgHdyPcx7+boVIObUa0wAKqcu74pOxdwXaYj6NrT7eFVmqf+HO+Bou5D43g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SJ1PR12MB6243.namprd12.prod.outlook.com (2603:10b6:a03:456::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:54:26 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:54:26 +0000
Date: Tue, 10 Mar 2026 08:54:22 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Tony Luck <tony.luck@intel.com>, superm1@kernel.org,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
Message-ID: <20260310125422.GB890303@yaz-khff2.amd.com>
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
X-ClientProxiedBy: CH5PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:610:1f0::24) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SJ1PR12MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: 919f456d-c592-4359-12e8-08de7ea428c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|22082099002;
X-Microsoft-Antispam-Message-Info:
	YEYsHEOj3+UA8glsCLf3mIcCK2r4808ZqSb91+REI/2WOtjWFLwVNufxvSzh5fLaFkC13IH/J7J9XPKDKu5MFA5m7g3yCewNTtBXZhiwSQxEdOYO5wJNld0QRiKCxwy4nwaVa+pf2jwAoCJ0nZjhJPa9ytryd6Obgh2hKIk4mMLNI8oSYHB5NiaF7xcK8sBuyDmS/QVQQ+zH3HwZ4PZrcbnPaTCWAUZaA5gCBNP4scAgwSamEaenxduPM3x+cJnvnHzAret2plmh8qdbFo9hBU6GT7zQ6dHhCudzQ526bcZp4vBMtwUxKEmZayhOOUjX/tg/VUAFD+fHDNOhSsrIBS35SNG6uXSvzyp1ykyJCnnyivMsqI1qDEYVsd1iABPInbWkIz3Gn4PYzsWgmR/puZa4qkJFgFCENme4N7VHfZPfzNCm0O5rLz/C3s6SLNWHWkB7Ai8CBtsAwn6QcpLhvTt9eL3MJiH6h43MdoAFa6eUDnXzo4bzyGcNxs+H5RN4llqzvAs5QDRGontSvJ5RSxPk4W0Jd6vxIEdhOEtEAVuw4PfMAR+JXcDuqkNSXE1wo/5vC/MohZDHwiy/MSS4kyafb2gCXo1QXFD493osSzc+ozxuOfi+p4tTg7vPfQcJiSd1P/NRMy8pDMBixJF34y4cQU2JJJjQ9WmvIoON0NJ53/tMWlJ3qaKdgWC7aErMnWx0bHyYfl0hwghzunijH5iCwW60+oJMarqfPHIUq9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JvGpeLKQHCgd3gA+rsrrSqiaHp2Waeex4qP7+d6m5XCUo2IFiXDjxlGCtqGJ?=
 =?us-ascii?Q?gXi6Vdc6WegMEVetoNfcqHasCc2alwePMvjG1cL0wTDozDa3LZMEzKPk3SUb?=
 =?us-ascii?Q?IRADefNF+POkDAZ0REj7gyAbSnhvsLhZBlqTG5YUMuRD6wEdEseJ22pmaIPq?=
 =?us-ascii?Q?actIxerFiIP8gq/CaubrFpIbpdJgCXXZDJsi3sajI6fUpoDUntaIpxuLrpzf?=
 =?us-ascii?Q?ReWoMxFw2xjed/2kNCOzi0CklNjLIfEVNC2f2ARovSNjnaClWdd0JxkfXTZL?=
 =?us-ascii?Q?7GfnIjbIM0EL0tiMtt7K0Gms+eN+jULQnfhWobSOF3WtUEcsrysZNMAG1Ngy?=
 =?us-ascii?Q?5Z5gFutLOblvPvXs6jHFwy45xo1D0Bsqnxcz6q/QBsVAQI27CD7kU1o8dZsH?=
 =?us-ascii?Q?Gk4z8bQbVA4jXIaQm5tIuzBCQCbVtGBFOdi8Z7ChNiDaqzqGryobcyUBKDQz?=
 =?us-ascii?Q?AqFeekRpgX73bc8HYNkclQhM4rwz8ILHbqpZzFi789NpDMbygqj5dih1DVlL?=
 =?us-ascii?Q?7rVx7xMBloplFcnoBt3sMt+gO0czthUDSh9lr1i5vI2RPreUa1TEFfGVE4vM?=
 =?us-ascii?Q?GM8WL1Hk1biYMCcTl0AQ+ZDYwKRgAwZTPvz01DE/jnzCNmHwN/GEGuZjik+Q?=
 =?us-ascii?Q?nRYgZ6Pp51eIJjfCmjhzfyhGboQBnHGkOi5vdyM3b7A4Mjczd8PSlV2zztTU?=
 =?us-ascii?Q?z2/HOPmvFxTAHhSaC18ZjWg4aVyl5EEYkJ8AJeGXav7DluOufZzAdLB21CeZ?=
 =?us-ascii?Q?O/aQxSdnwDkW3Ou8DgK9UNd6jnygMKhFXEQtVr77gWjKqv6CAnnPdxGN4PrY?=
 =?us-ascii?Q?eAkM3SXGO/7xwYifmmP1Smn4fLJ1i84s0O0GaQo2SfoSU0rUI5aOJ+Yytbuc?=
 =?us-ascii?Q?PQeZGXMwNr6YsmjQlEvqhdpxHvqdEDV0q+SKx0/c3LA4cartczZLPtGKlQj7?=
 =?us-ascii?Q?YPVLLsVrbDahtqHw78KdGP5zx5iVlA4pTPynmu5hXYAYt7In89E6AndX+c3I?=
 =?us-ascii?Q?I6PNxzTckjjkimfClxgEYx0OBUH0dQFuC2ThxjcOTOv17E+JJo2hv587XWKk?=
 =?us-ascii?Q?URRd0MY+nyyJBCWl2MNYak1w2VLwJ7809djTFj6J5ep5BYSlsadV3ItCOrj0?=
 =?us-ascii?Q?xbpuUr2pz5WXjzrujoGNXAGDSytr7dLnVZ8njdBZnZQ9Ylb81iQ7ldSBi+AR?=
 =?us-ascii?Q?BCttcF39GySOYAvLcVp/nmrQMwP18HeU6owZECDQixiMkJiguUdi2uhJtycS?=
 =?us-ascii?Q?vUK+yFWGRlTl3DiUCO+J0mol3UDdPs8l/dNvWPdTkpCTbQ4fi+1GOT8SxBGu?=
 =?us-ascii?Q?Lc1vFIq9TdESB37uH5dG+OZi6jvKflnBlV0kb+JEUuhba7Ky7WUlC583eIZD?=
 =?us-ascii?Q?45QJaqsWmvJPrHTFNDq8ce82dONwfnFD9DUMWK2KSBFzaeZqaN4rsJAVY13Z?=
 =?us-ascii?Q?ebeRptzMsmg8ZywieWCWPHypVgUd4dckA2aR/0olAdfLXcTrfF/iqLguZLP3?=
 =?us-ascii?Q?iheZ8Cv0hcJh6mMgln0iMShLBXllG45jJ2LaW8Vz1r4WUFIALOYvLmuNhkX9?=
 =?us-ascii?Q?k24YT6002d+bfX5Jiou1SZ40iRqg7xEm4y9q7hc2KnwzqV4X7Y7IUdFS/Yav?=
 =?us-ascii?Q?7Q8KQ6Zmr8fYjxY0UVJuTXH2qvppIhdy7t6HlJ6nY+h+pO0JPIdDEdJuSp0w?=
 =?us-ascii?Q?0f7p5JSKl7ZQG+rVecDNaABSOjb+OT3Tdc66q3Icn9w2Y+3vqbnPq9FbIAJw?=
 =?us-ascii?Q?u3uHCrSPrQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919f456d-c592-4359-12e8-08de7ea428c6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 12:54:25.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMHYrT4sZKSJ4dh4Z5+lIbTA/lPBlSB4WU2PCayiEw2iRtZ4+is9MndCL/+UKFmrSldYnqxBoz6x3kzQodZsbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6243

On Sat, Mar 07, 2026 at 04:12:31PM +0100, Borislav Petkov wrote:
> On Sat, Mar 07, 2026 at 09:49:10AM -0500, Yazen Ghannam wrote:
> > On Fri, Mar 06, 2026 at 04:49:47PM +0100, Borislav Petkov wrote:
> > > On Fri, Mar 06, 2026 at 09:40:06AM -0600, Mario Limonciello wrote:
> > > > But don't you need to use UMC to discover that?  Chicken and egg type of
> > > > issue.
> > > 
> > > Probably...
> > > 
> > > And we already do that in amd64_edac. So perhaps we could export an API or so.
> > > Yazen might have an idea...
> > > 
> > 
> > How about having EDAC load ATL when ready?
> 
> The thing is, AMD_ATL can also be built-in so then request_module doesn't make
> sense.
> 
> Which means, if we have to "tie" it to amd64_edac detection, we'd have to make
> it synchronize its Kconfig setting to the CONFIG_EDAC_AMD64 setting.
> 
> Or we could simply say that AMD_ATL is a module only because if anything needs
> it, then anything should request it. And that makes sense because the address
> translation should be present only when something else loads which is at all
> capable of presenting addresses which can be translated.
> 
> IOW, AMD_ATL should not be builtin at all because, well, it doesn't make any
> sense for it to be. IOW, its existence alone on the system makes a little
> sense if there's no address producer like amd64_edac or whatever else calls
> amd_convert_umc_mca_addr_to_sys_addr()...
> 
> Hmmm.
> 
> It sure sounds weird...
> 

So AMD_ATL *can* be built-in, but it is default 'N'. CONFIG_EDAC_AMD64
has 'imply AMD_ATL', so CONFIG_AMD_ATL=CONFIG_EDAC_AMD64.

If CONFIG_EDAC_AMD64=m, then CONFIG_AMD_ATL=m. I think this would be the
default for most users. EDAC will fail to load on systems without DRAM
ECC, so AMD_ATL won't load either.

If CONFIG_EDAC_AMD64=y, then CONFIG_AMD_ATL=y. I expect that a user that
wants EDAC built-in knows their system will use it.

Thanks,
Yazen
