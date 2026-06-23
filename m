Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B8F2EEE78;
	Tue, 23 Jun 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229797; cv=fail; b=FeBzhFbyit3OBP+/oSmgw/AXtCnIPV2EQs4849TOpovW49a4BU5S2k5UdHvdgnppcDdPqyjTQ/tsjPJSDBdmrQtPJU9fthJTjYCUueDcWRuaWELnS95yVqEotBs1nlXCAet8gHF+f2NX2t3f1nIx6q3W1uDjelGNzmzyh8M0OA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229797; c=relaxed/simple;
	bh=/uvWzrysgFdAhEVsxOIa9GPL6pGiqHLJgetpYMgaVn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=shrySYTZKEt9GF+P2HI8n53Qc7+7sO1A1HjOkO54XmzVHHHsvANiwjHtx8zFIVPrtiobsiEjtDxC1TPnKhDe2lws6oZYUEArK4N9pRlXW6GLoqZxodc6EXznI/6FvWUeUIZCKRSTZvmE8yMa46u1bvIasQJbNPz2aXBvu8SVJ60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3+TSsH8+; arc=fail smtp.client-ip=52.101.46.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3+TSsH8+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVrnnfP37NqFSjA48l3+5t7yuiW+QiouCH+RyuwcGqrbDFPBcyBwVwI+IOB/2e8g2L2NTC/apj3Gb23pVHhBLT+ibNrf4xTAimaFWXGl/GpYrKWsANaobfQaLUfREhxPgSMI3jlr5Gb6/JiCc9TCy+RXw7k03rvP5O2XBc96Y+ObelB/kEVurXoQvEtGkU8/NZcxu+e0GdymkouhK1TYNqthEftYX+W/DbBDeA/8nGMsk7MMbfYzjZuQiFStugFmiBAg0yPSn8JQJEmY4ageSXmZ6JHADm/aA7sADmYbZzt2sJYrP9ecinJ+UBlRCvP3qhoJdgMJSd3Nj0JG1LZZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DduUfwXN0RKSHsEomgkHapmR4q5jV8BxB6nGGPnEClY=;
 b=x9Bxr2qNhW0GgMJxgD4iarTc9Ely1AEAHR9iubuzUhXjvz4sWHfdLFFSLB/7NJ9L6ItizCIXn6J9sdq5bFGiDSQ2Y4XAfGhdidnmzv6cFrZWwJ0Lx6MM1bIdTxhxn0bXtmXtt+E8nbriAYGJpGDJmpb1LD9G+mTo9Lk6m+Q5S/DeFT9T5ktcAmPtLQbttA+F2srmZuw/w3aoJvdQKanb9x7abWcbI8bjk8j61XCvZIHaISI3cC95rG942qHonlV90hcrbhVJVyfyUD9iKxlra/m/SgOEIUUaYDsWrTL1QIlQO2v0tDl13ael2A8AEf6y9S0qJBoh6/7hahT1+y4S0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DduUfwXN0RKSHsEomgkHapmR4q5jV8BxB6nGGPnEClY=;
 b=3+TSsH8+UdIkJ+Vd1lus1k2XTc2qDgORG/VZcwxEBAr3wTB8cATQh2JIKpiEI6iv6ZSpajY+XwdgE9ZsG/n/TwMAzjBrB1ufqW0HQ1hLW1DcT62n7Mbpddfnke5D7DoNmetvhyiXPXSL+iRNyX1+frFVJUnFqgHiPX6b8thHfH4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS5PPFD22966BE3.namprd12.prod.outlook.com (2603:10b6:f:fc00::662) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 15:49:51 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 15:49:50 +0000
Date: Tue, 23 Jun 2026 11:49:42 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Phineas Su <pohaosu@google.com>, tony.luck@intel.com,
	muralidhara.mk@amd.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/amd64: Only translate Node ID if GPU nodes are
 present
Message-ID: <20260623154942.GA315375@yaz-khff2.amd.com>
References: <CAHGR-A+kTAcFpBE0wH5WYraUUq3=st+hXMjnF6Zcj8OGqOBJwQ@mail.gmail.com>
 <20260614150618.696249-1-pohaosu@google.com>
 <20260622170717.GA1571@yaz-khff2.amd.com>
 <20260623004959.GAajnYN-WCJ8GRWMHh@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623004959.GAajnYN-WCJ8GRWMHh@fat_crate.local>
X-ClientProxiedBy: CH5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:610:1f1::15) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS5PPFD22966BE3:EE_
X-MS-Office365-Filtering-Correlation-Id: 745bffd5-c5e8-4ad0-5365-08ded13f0f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	LXOw2/DOTwCuwFnr11sO/UmCVjPmJ44Z6Jtzx89V0A8YclYar64PbGOLQlOTRJbX9tyCioGxFTVloTbv8J/8TaZ/yNr3RWfRupLNhhw6Avx945PXP8hTozCVJ0dBcVt309z6Awnc+RVJFB0IxeVoC5PJ6Ky+FPZ+YbM4UZyoIzXAmmxlBOOVE74Q2Oww/Yn0aH5ipV7vXe9PTt1G5CFYaMZ7Ja6mQ24gGN0wq/kKY/m2MrRDK9XedOMxg9rOmA580GTCXGA2dKzd/7dSQDw5nXDO3Gdvgwl+lbaUS80TZqnbgnzezxdO9MSi5e999O2NLw+IgvRrulY5Ky7YV9vHVLFS888yn3VmHg14RXgCQF5xR6ncBFIEhuf4oaS7btgxH0G0y4tU4ZonWAyWgxNm5lhvtf7+q81ni1BtcQMETW51d9giKcW6BpszCObcr0Z/ePCb5qsR+9Da6jRz3s8H88xzXjEMTzAnIq5JQ3/MUWGljWKzOQslBZED9wsv+evN+nugG+3b4xvkpaFXEQTqSSF5UfZ+UOY1+GdPMFTIa+n+XVI1ueMv+mSAzpKLPJPqhIlj8uB43f+L11KxAFBWvvyae16wF00kO/qpiKi4qG3KRdrs48cRezYZH3JyZGkA3/bc+oZHVGGYRAO1EArpdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zwxToghrtmIIWSEXq19ye2am/91AFPAZkOyLwsPjstHuhnKrnufMJ5Kdn5qA?=
 =?us-ascii?Q?4tTGZIraimiuRsKMLMJH4Lx1UZ7H6WZi/ffuBlRqnG/O39CWBVnoCzSUWqnB?=
 =?us-ascii?Q?dATafJ0bM/ZuCehfVQfOp8DJMJzc6x3hAJEDVAmK+Fz2fj0A9lKrZp005tf/?=
 =?us-ascii?Q?krOaf1hO97IRqzJ2CpVIjKBbX+P/mcD+bNussvZMaNAiqERDMCFFdJnHEdIC?=
 =?us-ascii?Q?wSI/IHlrZF2UxwiLWjvliKqms9dKzxM35vjYmfcSa20yfEoADpgJcZFSJVRN?=
 =?us-ascii?Q?V7P8+sB7O05aNQgEKigFLq9jlG6thuHFrsb12L0OAw/T31Z1M0b7BCTC14JP?=
 =?us-ascii?Q?ffubogtPLNhNzPfQKHGVd8QMUAQ0ymG+MAI1VOwnSppM+P3DElMBnmjXTvlD?=
 =?us-ascii?Q?PQs4fFeTDaKXpCS3oLF3F741ia96NIZ7aqPOKQR7/vd1OPkaWEAk1F0ScKb8?=
 =?us-ascii?Q?lY/iR2mAQSQzTKSsoCA8lU51Qw9+53fkzh1QxcmHzV9SlkTBa4Lde978deyf?=
 =?us-ascii?Q?vHzy5f1bLKGkSQuLBF0xP3F8jar1aGcBv4pm7Y4SaUJdG26y+cWxPv6DhqRo?=
 =?us-ascii?Q?hy04/rL4MafhXPx+5S4uPsckyKiaOKOiIcuDVJ5hiIbZdE9RKf8gMJFdNnV1?=
 =?us-ascii?Q?0vBtyxHEcH8ty+RLXU36pu4W4At/25KUbGVnZdCFZsoRqLsHyJlTHNtuk9V3?=
 =?us-ascii?Q?2wp0kkabLHAKbP/8VSedFg0WN3th6sFNjc60fAwU8ksnQ3vNNX61zHDB/VFX?=
 =?us-ascii?Q?5aT3v67aZmTArT2xBePQHnwj5TxWdZ/1B6HvIcW6oYl3nZQmBvQQ+IFH8AyC?=
 =?us-ascii?Q?U1F/6M1HJ0c1ZLYur6oqVGTJerLKfWcarVfNkGWLua+uacnq7NCMlWCiuRVL?=
 =?us-ascii?Q?WgRhWT82SG7GUxR710o5j1qgiKdssbSCyZ9aE7ooMSXpKRAwDydFLkq4G4gX?=
 =?us-ascii?Q?52TPIzBOdQZBeo8st6p9k9N4YnoQ3jqBkMn1RJitDpfRZLWJX1If6FYLHun4?=
 =?us-ascii?Q?87AEZq+jFfJOI7zhr3cHZvKMdq00X3vbPyaNS3jdx2c6z6vg+X18SczGoccq?=
 =?us-ascii?Q?BigDdiqPWUIDAOAMDjuJ9P91PK9k303qGxhDFIMKRDHa0r08ClIwHbsts3pS?=
 =?us-ascii?Q?Eyhn9PAkeFhIdECAL1EySMT4JZXs6Cx/2tPQm8vJjG/nY/leZj+5vLKRn9B9?=
 =?us-ascii?Q?h034D6RkNsNCwA1FkibHobbB5FhfWfOjILRHIf8ONUoBMCQB/0n2uCo73Ejq?=
 =?us-ascii?Q?8SGsKrlNyd46okzVgNgo7S+/a9jCKvBq32KnthRsdNTxIPzn71n1ZmibiLZI?=
 =?us-ascii?Q?psPGxwI7cqsN63VXNif+F4wjviV9HG8fo/7XHFYbAFJUIV5LEtC0/ZqA4h1m?=
 =?us-ascii?Q?VsReWF91zLkp0lvhIRjTXmCG9E6Kn+4f5ly0zoqUb+NHH+UOsEcEefcfB7sX?=
 =?us-ascii?Q?Fdej3/GcDYqls2+NlmfcCu2/ysifY3CZ5bp4e4/NN/TSPvRUkMamtXmmqDUx?=
 =?us-ascii?Q?Xf1NX8HfQqTWHrUzViVuW82znFD+ZR/2AttAQcRuqtaUhB+7ev/MtYgyYhC8?=
 =?us-ascii?Q?sq76TAYp+04TgkQlmrCdS+NS31oQ2h9OOErugdkWNePnvXOA6efbTYaHeh/A?=
 =?us-ascii?Q?vqlbvVGD7DbLPBHick+ecU4ufKquAoqwwvvhsAgv/QYxjHe5G1M5Cl1ySy1d?=
 =?us-ascii?Q?4HdJ80aaWRHiaFEhc6QPrBAS+1CzX/MqUFOChcbrPQgVi1eYsu+NKhtdf9hU?=
 =?us-ascii?Q?7vmJMHjuxQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745bffd5-c5e8-4ad0-5365-08ded13f0f83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:49:50.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vBqdMlVysK9sKCtGPaAvKrfjO0PzuoeUEIbEzSlyK4zxBw+44zGOLWELQr5sxX+2D/kM8hKqieWlNVcQw56tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFD22966BE3

On Mon, Jun 22, 2026 at 05:49:59PM -0700, Borislav Petkov wrote:
> On Mon, Jun 22, 2026 at 01:07:17PM -0400, Yazen Ghannam wrote:
> > I do agree, in principle, about hardening against possible new
> > configurations.
> 
> Are those configurations going to happen?

Not that I'm aware.

> 
> If so, we can harden when that happens. We don't do hypothetical coding yet.
> 

Okay, no problem.

Thanks,
Yazen
