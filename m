Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92F372062;
	Tue,  9 Jun 2026 16:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021267; cv=fail; b=RQ2Boy8dkVNvxTyPvH8ykHqt1nMVkGbg6yT9no9a6wLNToVl7w/2SE9KXltT0kUZqrFJS6QDzYlbTXNhqu4/otAGyKhiXJxxnhuvXcKbsc90k7TEmShNjFW16d0GY3kCsmWkI9g5t+091JUkAOGekegMrHUI1xY4oy9qsDzPEf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021267; c=relaxed/simple;
	bh=dQdlr+sE6mUgD3lAeYeJdlSG94gdZoih/j1mMppidqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k5qXpnNMbcFVTgnbSV6bwfnOYb3eO05S6uPySh6WFfrGPY/naUxnRcxP9SOMrGM9moJesXpEIa3Af3zN+rQOiHdJ8p0AwzMMjEAzbz6N52qK53tWBIomLZsw6Lu1FD+68feVO/5UxQL6xuoZE4bd7EIlsz4I/mqRqTVd7qwsvBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4VlFQIUd; arc=fail smtp.client-ip=52.101.201.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4VlFQIUd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEBOFaZ0ubHkgXqdy2rlWMkW/XO3o2+stHMzmUMSOdlAVYieIouBv7YuRdpEKNoYeZzDaaL20D1JZDGOIrDfveD/kamGe7O6xa3eawmg1ocian2bPkuq6QhTRswRHof2GBaOR/7VjIghcnx3xwxiJ+2HbEB9zbZ1IpPfqZXlBVAUJtLrqps8lN6P0ErvEw6wFWwyfv6u9+P0GajGbZvOS8MBe4LZSyA2y0/wS9g1Ivj0IEDksJJZnUm7O07YEazDKkhgbKtqnCEPDa05YS1i0+TgqgNI9qNz0oIVj7/J9tRvBlTsbij0EiLBEq7Q1/rLbx+0umaU764ceJTh9ZlJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iE7R7A25fyhUfVvT6Gl1YxHgIuU47TPiVfpAMBHb3Q=;
 b=Gm74cP9Z656GDXb62uQJU2t5zIhgKaGkGS1fgbXSuEn12MevWF9tS2V9pdWTl912JkCR45JA4khy+810amXhProUeWv54cJPbTCiJI3AAnMV6pNKv3MA5fcU5Fe5sAaP3g9PUZZWWDe9H/qNKT9PsOVv+1ya0F2P27d+AoqJmCm75NLuEuHnVsnluuf5AUMeFKZlOp1xod2NQWn3gH5CmSyYciRkDDbFu89ho5CvKMjG7woMpIttBRxTv9q8+I6vCHQhxtKdLmhR6vDEdP+Su34kcpHn5kuocj4S0ISuONsmXlhV3krmV2tE9PrskjQ031f55bN4FkbhecJ+Ln0MuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iE7R7A25fyhUfVvT6Gl1YxHgIuU47TPiVfpAMBHb3Q=;
 b=4VlFQIUdsBtUjeCYFSxaePCqE6pMuicCJ81+cGASj1MOZ5GHFSXT9JMGD0xkyx29MH+oorkm4U0r+PDegM4OOcbT+OSsEU0QRpZxm3uC0FEU5ALzkMVGCfRYppiL98zCP27H/FrbNKaBQv/VqjzPTMoUTfmp4QSAipF6eMQrgUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 9 Jun 2026
 16:07:41 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 16:07:41 +0000
Date: Tue, 9 Jun 2026 12:07:32 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Phineas Su <pohaosu@google.com>
Cc: bp@alien8.de, tony.luck@intel.com, muralidhara.mk@amd.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/amd64: Fix incorrect Node ID mapping on CPU-only
 Zen4+ systems
Message-ID: <20260609160732.GA19967@yaz-khff2.amd.com>
References: <20260608072607.1819873-1-pohaosu@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608072607.1819873-1-pohaosu@google.com>
X-ClientProxiedBy: CH2PR18CA0049.namprd18.prod.outlook.com
 (2603:10b6:610:55::29) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 285d237c-0704-4134-94b3-08dec6413b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	qz4iqfWyf6C8KBlgS/dEgidhg33xxvcJREccX9qdIydkMqOgKSlfEnSl/owVC26FI41iWEA1U0sESIRO2rgmnbdoBsqNQR+B82tJ6hEbr4oY3EmzdMZoaFeI0TPSCMXYAJj3N2TZyENnHsvbTiiUm3JbZ/1zTzANwTr1DgSKxqpt7qmRJReKc4VTyiXM0+xkKdr/PQfS4ECbgPMZ0kg0WQiTgnRoSjU9v9bX5104ynZfX+qOidtOhgNJqfYH9vpP5TIiCst+X/v6HVtTyRznhIwb0l20e4S1SR2Yb23uvGs8OicsHLUEko3hF3AD6XWx7sdDhHff12W45AuisVzZMhzLVjUQMF1vlN8UtflWgKhJcnpAXSE+7MYVTbYISHJ0AZ6VHwkSMF+naEtvQ7avdJsdKmWIUv5L8At4bUb3mp06GTBNx9BjSJiZdh/0xlIlPIoe1uQz3VZrC0jvyIdSsYgoHFVASqIeuv3jFVm6+y4nYnWdpEU5+br1cKzO7yGtO9ft7uS0SB1K7rI2awpgZZdmabKX0afQDhjjOGULozCJP/XERENKcB6IIk19/WWkJsRSgHSbDrUbw3cx3RZn3RplxxTNmOGHQmvHNf4M0TC20UWEN0Vr6w0TgA5yYGuWDrikZZx/MEILnc43sq1M8NknVLGguH1XZYJer59eLGueu4eVk7+nME9Xv4HQAGpa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zgZ+9Q8LLVrcKitPiAIX7uQas57UiBSBSPK/C46rmTcjvIPZe1hZPvPnbQXo?=
 =?us-ascii?Q?qw29PhyzVnyBXqzRATNrL0wneu4AYqgtWWqBLAdcSwb1WNaCmvzIOmOIpwAt?=
 =?us-ascii?Q?1r2/FWbrtvaXP+3eHuFx8od6EuOsP3yxSULcZm5vu3zoaSo0FpqkI77LBzsf?=
 =?us-ascii?Q?5z4k81SP7ly2BeTbs55avW9NftnMri39RuUqLCTYelKwm834SzEujNu5SRKj?=
 =?us-ascii?Q?qJee6MaNy5z7rdNeHeg4n4uhZf8O5pe0L1d8/9Bja5wDMgRifJvBJTU7ug1p?=
 =?us-ascii?Q?v4APVzZ830YXu7iMDFAprGybri26bBMu9+g2e7FhU5OT/tRDXL8qHNd2G/ZU?=
 =?us-ascii?Q?gClTIphkm1MZD8aHXwbe1UfIxA0wh2jjMtkSs45dNYBJ5qgHEz78+rX+U2p8?=
 =?us-ascii?Q?gq+5ktLKOrGNpiuernM1KtqS0bBvbuJkBzM7kmwKGE8LlTlQf2IIOcZdZ3xW?=
 =?us-ascii?Q?CDtkA00kRcMYIShPrzdPlFJuOw24Fhiyzl+0ZmjufK08MOWHdDHsBu9Dl0oD?=
 =?us-ascii?Q?j34cdySGjI5vfc+HmEO/d3weh8MMIPActM3P0lvCwBlyZdERWRDh3Z3EZQKy?=
 =?us-ascii?Q?EF6eaciKqT6SHyIBb98DtZiE0Y7Nrio9eEMp1/ZUyci2wHs7VeIGxAlSJil9?=
 =?us-ascii?Q?acdDvc2a8galR8MvCxkaL+bXjrRmd7fL/QDV1AEhwdBLB/D0Wlm0f6fmvCTf?=
 =?us-ascii?Q?2ypLYzYXhqfUP1pxGbxU7LzjQFU+VOx/BVQEHftnCRDO6ZNGw9cK2AY5HcVC?=
 =?us-ascii?Q?de9Z5jEzW98rJ/7Ul76omYX4cTbaTyi4vRhUcxFGYpDn6bbD+z86Z0gbPnnE?=
 =?us-ascii?Q?WS+/3usKEOzucaCeKntePz9JZ9hTaUzQgdwZbCuIYIxoPJGUQE5uA9su3RzR?=
 =?us-ascii?Q?Hrt01XcxZZpQH6BQKbBm3296LaLwsckQUqRjXSNarUue5MAOmf2mnJNzG9/L?=
 =?us-ascii?Q?me+Q/FcF58IiCTf/CT1IFdkFDDX48/1wCgosyGW1anCnFug4FwRODUYuqSzD?=
 =?us-ascii?Q?AkEgpFC0aJx2d3uOZiQuPEJrSMohEJsNEPyakGdcOyx1imy3i63COk+aOmQI?=
 =?us-ascii?Q?YISPn2C3uKv0midBlHoUY4Wy3KwpktNiclMPxE1qnFrYdK9G6RO2DFmTV1LZ?=
 =?us-ascii?Q?yqTl+btTB2fgRJDEcZk7HXJX5on/OQbZeucbDRpiJ6z2ratItPPii80KxP/6?=
 =?us-ascii?Q?qKuPdbGNjo/WHVCMC/FoWQIjgCADGOG+mtjtDlDnyAbDKz4doijXxTd1eTqv?=
 =?us-ascii?Q?FhNplqw9lvYlJpvd/1+MvWWTXgDzZCIGQjBl4s7MfEC7VutffIcDG22ZKLCt?=
 =?us-ascii?Q?oIoa8HotVfBlTCJFq5ViCAXfuzYcEP383g2aFCCNsUuhcl/UAqqJ5k0Aqcjs?=
 =?us-ascii?Q?C8DeUIju0o4SxwrIVP2ETnE06n60AymxPX0N+zDN2slt9m/RQN8velVPkcH2?=
 =?us-ascii?Q?pLJsLoSaJIKQn1RtT392/3ypyYc29o5GQj6p2zH4r/Dm2HNAIBThXePNeurA?=
 =?us-ascii?Q?ZQmsQ0xUiJKmK/153nw+USVP1/R2oaN68dVuRCoUNq/HnL/7LFbvtnN67Irl?=
 =?us-ascii?Q?bN+aQ8Oh8DcDJIm+/PFU2tvBX2YA7fZx/V57kP2JKlmxqyDm0bNeKr01XqWs?=
 =?us-ascii?Q?JYyFD6HNNjYP0Xsv9/WwTSd8Zjkq7vD3cZpdRCcwlsAvc+82m5QELS4ee1Fo?=
 =?us-ascii?Q?2gGvU6EsfJ8EnuGwwdzG6+WVGeeO/GRoJLNDM3j1lSEg8lHVktZCYO9bZ6eI?=
 =?us-ascii?Q?hftHgFtdoA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 285d237c-0704-4134-94b3-08dec6413b8c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 16:07:41.0368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+r7Zj5QUird/aZDs5V1YdNbQyQqukBN+g80QWgUStAY8JOmVCEs8XHprXIYDI/60K62HLn281hpZSs0gHkKSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840

On Mon, Jun 08, 2026 at 07:26:07AM +0000, Phineas Su wrote:
> On CPU-only systems using AMD Zen4 (Genoa) and newer processors, memory
> ECC errors can be reported with an incorrect Node ID (incremented by 1).
> This happens because these CPUs use SMCA_UMC_V2 banks, which triggers
> the GPU node ID fixup logic in fixup_node_id().
> 

Can you please share the MCA_IPID register value for these banks?

The statement 'Zen4 and newer processors...use SMCA_UMC_V2 banks' isn't
generally true.

This system may be a special case. Or there may be a hardware issue. Or
there may be a bug in the kernel enumeration code.

Thanks,
Yazen
