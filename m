Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03E194AE6;
	Thu, 19 Mar 2026 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773937718; cv=fail; b=UlqoA6rpQr9XvwP/5NYVtksw7M/zkWpkL/K+fPWK1zHOekh+dcui4FIhN3IjRLV+rxRbkvgCzzPKDCopC2RJ+hcMGKnKk0kaH4QdK4fZSfG7CNnr9pOYPmDeWW8mcMR4aBt7nFExls5Kcsq9x6ye9QU2fhsmrsn4w5cZY2kdsGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773937718; c=relaxed/simple;
	bh=69opZlHzKEw8Jrl7SLSSwhN1OXnsZWv9J88h+HZWP3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rfIQbr1Qz7mFbGZzo+M4kY3MhEj/MnF1Bymt/6QniOtFlMIWG13xHp2TdnkLhCeY5uh1XFWuwcjX5TE0pu1XzWBHZ02x7QsuJL3C86MLKRasevZvyAiO5DVktbWMv3gwYv/d+i2z8tylXYqlIwDT3B0CyKnbPHvxolvQhMYH6AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=c2teNZaC; arc=fail smtp.client-ip=52.101.61.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="c2teNZaC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCTJ6vNcwToHTIXs7vraggVT/3aBowTfL1dWhgm8YHbK+e9tESHpUmHY8Jgxlrg+UaU5QDGicz1UaaEREqtYQ86sb5t/oESR4NA6dVf9K5PrBmWIRJYyHT/ZUTDsFRjukfluH/hiILd51NK5DOMsOUbUMqsLp++NCS0ppsA/xae1owq1ofoMYmudtF5vzmsnWl2VbPct7ascBGt/P11YGC7kOZu6K7CVvcuOfZ9wgEZNuUT+26ALIM3uRjDWQhnDNBfmpl5vy6gpSJpR/OMdzv41LPnyT57qEoQWsTLYH2iFlA2ktSa0WXRsgnuavJog6SD7eACpzcjwYQBiOYhEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/X8pVEeJ6HXlFnct7mba175XmCAoiVcIwJETJx7UW8=;
 b=hOakAX+ducdyDqMFfzdWkFl3e6hWOfmwNZGTSwWKww/d1AsJmsCNnn7J2RjJN7JGiI0IWbPVrFsqhTa+nGfi/LSsKRhsENiI9/LW8z0ohHS1GI9KT/BsRQu4OuCL4xurgo/AYQhdATRG2wOKhy84447HXzc3qRLLsk67XmBwGTjYrgyG5iy8X9tAQCv7GQO1aq6Kk2IjmMQ9PnZV8A8dAsbs0OqipWAzMgzF6WtVp/luDDOeO6uzp3boF+1QbvlTt/zA4ivuWe9FLB3XhS0scRkPgQlRlyDUjFuuJ9lqPZr+jRaPL17crZLm+6nLMR6p4ArOUuHYwd9MWxoJT9+66Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/X8pVEeJ6HXlFnct7mba175XmCAoiVcIwJETJx7UW8=;
 b=c2teNZaCsUZ+U4MHD9S0GfJCr4ixX7+Bq0Dnf9IAgO5OHQZnL7nTuKY1ebepiEKZ0T5HzIeVHAm6S7KeOTjCZDScBHroWxyQSxIXH7mxe9XDi2Xf7bV+p4LlV2pTiR4faEyFx3h3bK29FfVZwCNp0fa01ylPqU6cnNYWkOX3q7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 LV5PR12MB9825.namprd12.prod.outlook.com (2603:10b6:408:2ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 16:28:26 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 16:28:26 +0000
Date: Thu, 19 Mar 2026 12:28:18 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] RAS/AMD/FMPM: use struct_size_t
Message-ID: <20260319162818.GC1666212@yaz-khff2.amd.com>
References: <20260317031650.93712-1-rosenp@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317031650.93712-1-rosenp@gmail.com>
X-ClientProxiedBy: SA9P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::8) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|LV5PR12MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0420b2b3-ebdf-4f54-7b98-08de85d48be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	Mh3/BYT1VUfEMNVT3XZ2+HiOGeyWbkoGSj3/MAkHGmytn9k/EZhnP+63d5rec15A349hcP/wZypoqsndAHmcNwqPwMSiXP+NTNbZ2cMkoNXPUDu/ZaBfV9lenWJLFWtuJOHCIdg9lW0KiwWoWxw8pp0yZOOlaHbd/9FBsfpOfq+q4uccRya21i544VGtrH5GnLa92bLVSmYsgDwr37cCLqbwvuwg1EdUw+N9LJ9qKuq35qhKPcqA1h2S/ehGk2qHOlPoz4GewrfOTw+wztEF6eEpzH6eNVHMZbG/chekWoKiqczGFr5mqdOTQaknhLpdAnlgyHfpd+qCzGyYOpsdoo8j5jkR+4nHUpQK11Phkjffz+WR8pFvTdbrul0hQW5vt7k2LB4o6Kyi6HxQfUYvygnEqoxa9cOVS+AynEECQHw0tOIWTWqb9avKN2nKI5WorDO7pCiRGLL0mrSN0q0BxKAOIPgoaJYykwkTfYWaVE41A3tSndK/MmFGaWOeoqyYnlkGr1+N7cg8v8ydO2+dFUexJr6HScn5b8m/DIziOxMJKt6PIAzOTRDSqqAQT0Vyy6bLebIwRML6o/cKUCtK4jQGbtt4EkakZO0nwGT96zAE1ZtTcAxwfbQiVEOdQvx3x0pO33AIUUsV4cTLQVfgtA0KULlV2cHnMq85wTzCZbDnncVbGHGhFqnDLPWk/GSDTx9TuJZrJTZjlA3qYfM6NfOYOwLSMXHqGu1uqGDPaYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b4ye5gk1mVWa28Ejxw95JlJ0p7UiNu+mggAsOVygqSoNa53fvAcAgtxo1iVh?=
 =?us-ascii?Q?S4d5RaF2WP0NjnC/4XCvHnQvmLfvV9+dinskDGBGFmkoee+dcMlSlhAw6cNh?=
 =?us-ascii?Q?94EVdOfr7ZivSU2w66v2ceX2yODZHsW3K7N3kgkUr8p+CtuDMjaTqqd2w85g?=
 =?us-ascii?Q?TlUfJRRQM8oFxbI/xHGplYBTU0Qv7kG8S138vRVlLgVqS5B1uh2rTa8cYH56?=
 =?us-ascii?Q?8gXuqxLXb+mAm+WEWDvN0lByT0m6/s/WMiVCpf8zLACH5chApdSP64+DCPSJ?=
 =?us-ascii?Q?p48FSaoZAv88FGkpDByxmApmZ+m5r9LfXyYTotwG4oX8LBhrT6ykv2PPjT9C?=
 =?us-ascii?Q?/tCxy0aqdOZLk2IpHiUwVnQgE4bc0X8GBxcDqi4RtmQ8IM7WCniFLWaWJulZ?=
 =?us-ascii?Q?uzbEKDtAvBNA9sWik851QA9u0DPsA7xlWLfWCCXEqGmfwh8z5sxRVrh9cQUx?=
 =?us-ascii?Q?Ty6yXU93MSwvylPAkVEOj09C4YKcxYLMopVWqyyoS14WHt8BVTVpQOP97oMf?=
 =?us-ascii?Q?zt8VkGVmQcVJyBhgIKqwae0lWgBVyxj/lfyZHYU9/Ea722ODPLc6L2ifNzIl?=
 =?us-ascii?Q?KvdPHrU/hFK7NwfidtWcS9g7sMPpZrI5a1fPJMcAtUqMx09gjcnPaxlhw/o4?=
 =?us-ascii?Q?3af6zG/XirtkM2G2yH1QkX4xnmsGxuXA6YGjyJQ8AklgE7Ev58+bvlhSdPHt?=
 =?us-ascii?Q?YZBL6wYpAT6yyOh7+64vMKsN4ocgD7zmwdWSfXCzpkrw3yLnCKEvRDKN6L0g?=
 =?us-ascii?Q?TYYQFwxmavssiIXAvSe0YryzhGBgwqWtZIXThFmlfBhIl32/2ONy1c70PNTq?=
 =?us-ascii?Q?rF4Snlfd08fono3icT3n13KTH4ST2Qc8XfQCwCVmkohLbuwh4m+l54DNu+zw?=
 =?us-ascii?Q?zMsLmQ9iEYGPj3eHAb9XGkeaqk0U/kCo31tD2zIvUAq3RJbdsso/zFPmO1co?=
 =?us-ascii?Q?YiJUNVPFMP9Vdbx9mJ9Le5Ofxq09XyljOG9+TgoIR92pOg96S+qO9f/aqqLc?=
 =?us-ascii?Q?dzp3BD9EeUpe52xNADqP1aqkJYn3d1FxsEACWV2aJnZVigCuDKEVho8Fy7Eu?=
 =?us-ascii?Q?0bYks44RfkajIFLsodyWHx+4i+xBMuzc1tUTlyIquvEF7pQOA37LSwS88OV+?=
 =?us-ascii?Q?FhiLd2VxQHev7RHFrYNBv+U9l77PlXiRjIjvRtb+FY+917+TynOaSWm//7eQ?=
 =?us-ascii?Q?VeuPy2r/FdF+Kz5R1mmRuWJCYBVikeRl8ugJ45zoPW5v8kEOm8y7N8fryxAv?=
 =?us-ascii?Q?+zEc9nPNu4B6qdC81A5pdQzyN+tlXGIXqVsPBuM0Yoe7tvaEXAhNn3vhRPO0?=
 =?us-ascii?Q?D02c9W+zYfOpOkDpsDElIdUubUmZOZn75gfoK5aq8Ml5tdG4iEydd4GTN/2N?=
 =?us-ascii?Q?aU/k0xMdgbg38Qlof3yC93KGGHMpRSoti0kSSvk6mHRQbN7k8wZcyFmvFmj4?=
 =?us-ascii?Q?VhzsWgi42cgGsbUf0SFPGF6oWgvNB+3WVQuRA6ShxbjXCytddbkqelxh7US5?=
 =?us-ascii?Q?HRUsJvRE9BUwcifXWJroiZPa4OWMdZvPionCwmHaCjfmoHMP2pHnQEbClg5F?=
 =?us-ascii?Q?x+QhQSa3RpKJ1TEjFEUkxgwQR/v8aPwD3U3FmlyaGWwT7J9tnnWiQ6OKg15h?=
 =?us-ascii?Q?stZWkgCkMQgt8R+GbZUhbYdwFE+yEufjQXi9EM/BNIRPPKiByvmZ+oN45jjw?=
 =?us-ascii?Q?2aBgZgvz2j4FZisHJbeIVt55Swe9m4j5VkR8puAwr2hLc9P8+u7sLYvSbWWV?=
 =?us-ascii?Q?zE7GtE4fCQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0420b2b3-ebdf-4f54-7b98-08de85d48be9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 16:28:26.1939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVYMo97+ih7AcFMH8CMhUwx0dZJy8+V4YGEfmDolAUXOvdlity1ZVvL3h2mK9K0bYZEZQRtcEaQdmNLF7AFHig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9825

On Mon, Mar 16, 2026 at 08:16:50PM -0700, Rosen Penev wrote:
> Avoids manual size calculation with the proper helper.
> 
> Also use kzalloc_flex for the same reason.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
