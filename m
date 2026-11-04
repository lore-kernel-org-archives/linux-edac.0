Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806105;
	b=o7LsdxTAk6PXWGfCgEKYe/BEb8vdJnxH/RJHkh0oh/b4S5yffw05g5t65JPXUKQUXotQ
	 q9vPL1spXGZMDcDW7pYzM7sLCHYMjd2PtPHXl/GWXsH+dZ/1wXtZET4njLps6Sjz4Er4Z
	 W0K+de6u7eVt2Wi49rUtYZ2TarMmLFdLPgNY5Znd1MTbgSOIF3wEdXMtKRjB2nfOHgWAR
	 sa0U1sguZmiHLxAekpkVYZwr7Z2LjVVpLc87qK4X0b0Baa58Yb3yD2gbCl+P/gnmT7s3e
	 VeoMT/lmVR5Fc4fYx18aCivAV8hMxAEzsvOn+0Q5MfRFmIXekk9YfN9k4EHRPWBEd9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806105;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QqnBtJz/QIn04wBBsj9/cfq5KTGPzUgYNsBG0WrLtXQ=;
	b=elMAIUc+7lqYOwjvBNE5LbM6dT0dqB1WnnPvsNyesfzT81LPjdl15QwFOJygcABZZ748
	 NKUawKCrD1IAybLZzX4mZKcN99tJDsM4r7nICLVNpCysDUq8YMRSXYary0SKbN3sQLznE
	 Br4m4nSc/BVldI19/2CPiZmvkk3JNHsv5jDnXng6UXFuM7Xgw/er65AO1XVNyyWUoO5le
	 BPXiePZ0zQj9Wnn2SLo7eTwNk8lZSTuxy33y1Vk68dKOlStgMRv7VTxbcYWBsc2nenH4q
	 soeFxlxMbL3hXTVqbPlYuWAQypY52TM0E3gJv5F5MKoNBCCkuuniX3v6TVNZzsmBYPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="Jjf7ywZ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.37
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AE606A326
	for <linux-edac@vger.kernel.org>; Wed,  4 Nov 2026 15:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E2AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Jjf7ywZ/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDYDUVCe69rh/oSVqNvBAq4fdjDSQ/bwibg7udKR7Dae7DzjKE0tYPCEcPDvlyzTre2IW3WKmcAk6zbObRpAGhhs3Ot6Hd7bUbvJUdNvcv3cgcYkz57Qnm2wiIV0Zi2KjYa9qKtg6fFEH/hcL+hvwp+9PIO/yi4N7hwtoV5/ng8lkwLkvz8zQlrElZ+sQqrDxlEm8QdjUZAR265o8qhPSPakzAYUwKxSAnyYiePwnzL9xiLMPte2KHZTCNdxmTXZp6DdwiClcgSZsRueMoNtCPm0xdTlOgP5aNioX/Ji2ZT754daxUaI71lAa/j7E54ZRqQw4QDlKAOOSHy6mEz0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqnBtJz/QIn04wBBsj9/cfq5KTGPzUgYNsBG0WrLtXQ=;
 b=AIuczz3lqoonV7uWcbCMet/b4YyDOIW69bLpUn0EWyTA+ouT36jlcSHvHtEMybOJJWW1UxL1cuy5GA/tssybHHpi1xs00nqt6FBTAMF2usO2CRumrjlq/UCPrYro0+Gkh1MHhidbMA90Uky4LJ96OiGLQkUGPPixvlBYWzK/SAgEAb0Uydte43xnRZalVW8wx8Q1CZEXskjz4GMNiZzVV+jh2m2+Mwwcy+CAiFmv7vhYEqZFppPDHfqZIbCvtM1wbPYgy99EGtHAf2/Qp9VYG1RnWL3UK3sHad8wHT8eM4cEtSScuP90M63mjnt2a4In3kZL3egckMUoEWhuVo3+Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqnBtJz/QIn04wBBsj9/cfq5KTGPzUgYNsBG0WrLtXQ=;
 b=Jjf7ywZ/C0kAq29ToLDPDVbKWSFJ0JBcq2zNi8y9gG2APKYNrsikKMLMfLxXu8BOyXMc7kWxvUNAsVZsybhtnTRrAKhFwFohf75FzH1PJjuPgay6xZPFdpucETyARHhJD2AO2osDEKB9H8Ct2hYPZpvXmlL28K2T3BOwa6A4B28=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH6PR12MB345224.namprd12.prod.outlook.com (2603:10b6:510:3da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 15:28:23 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 15:28:23 +0000
Date: Wed, 4 Nov 2026 10:28:19 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Alan Jones <j.alan.jones@pm.me>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: Bogus MCE on Zen3 Vermeer, not covered by 0422b07bc4c2
Message-ID: <20261104152819.GB716491@yaz-khff2.amd.com>
References: <4vk15GIz6oBJnyGsim0U8ySl1mcHUZ5saNoaY-AjrXFLeBxPiWhvZPHr7YXCU6g5bQKo2X2opfnCwAtifQiKjSf0SKuGrcxYmvgr6ZLWla0=@pm.me>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4vk15GIz6oBJnyGsim0U8ySl1mcHUZ5saNoaY-AjrXFLeBxPiWhvZPHr7YXCU6g5bQKo2X2opfnCwAtifQiKjSf0SKuGrcxYmvgr6ZLWla0=@pm.me>
X-ClientProxiedBy: LV3P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::28) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH6PR12MB345224:EE_
X-MS-Office365-Filtering-Correlation-Id: d17ba8aa-c0bc-433d-8f4a-08df3a884341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CQUhJbJVoA5q6WPVjyBTOJeSBf2NM0DFzKtcpu7/tm4pg1IDuMkLSlDzt8sFCFwF8mny8ZbjKk3SS60wfzkCiKUKqL44IEH+S3j6MRVm+fJomDwALPXzrZAnJQoBg/8Qt40K0jtllaFUwiJrHuKfPgHZinzaCZkvmJW/SZagJP93YNoSZtUPOwg/dUdpsNf40FKeYllO+RbIi3Ekl2cu4Ze0Jimg3Hf2raNfC183HYDLp31lscYKgQNFqZTnLvzDONu1eNHm11iZANXZzfE+el4664rbRxmyRlvMcCpFtnCXqn8hTHteok6OmmUKo1eQWwT5jY0qVdaFhvDeo0Ct3igb7cNk1fQE2ul6Z9qD+2KIfrSpwoF7FyKCEoN1uTAtdtdOkqj/Rw+ekDar6Zx1SRRlvboP5EDueDv1RcznMC3KwfkI2PH0R1IolCpnL70I1hjbOSnT7fU1cAiCtf61v4t7O3b1XF0sCk6+MaWsQZTdJ9FjOSdHKAV/iv91uWmj+odG2g3WqFBfxfLh+HGcj2P3i2bYtq5US7wTHBzDBefak/H08x0PBYiDpOWy602JTTRL+rXcgf9LujSoh2SU6lmK+9wwk+/F/m9uHtf5jWxh7mteyaQtzu8k8lhvqBIXHPdVfCLEQk73P8b3bwbzycNCO1sCENau7ZEAWXH2pjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Y8U+8HJ3cR/B2s/UAcHorGO7d1e/S8FChTkaPAvatVjIanLsBGrI9Iaeegz?=
 =?us-ascii?Q?T9WZi868CWT5IW3PonJMWKJnZpQ9UAh7zfiZ5FYe5YD2Ed+hyH/1647pJZMv?=
 =?us-ascii?Q?cA6UmKI2wq6HtqQVBNqTEBvpXwrwgPCL6Q1vKVyd/ddIPsWgyc/Fnaen6vMA?=
 =?us-ascii?Q?0AxMl2kKkQRFxnpplUbBTeO120yDo6OOm/SxLr5aCFrkFcWByGXISMezZ5O6?=
 =?us-ascii?Q?7V5A+ZLie/4g6/TsN/c6bMvNQwZtTrQ43osUuZQd4zH9RK/rexn1lpqmPofP?=
 =?us-ascii?Q?pC+KrXK+vmN0xQmrwpvt7JTfd0ffbhrU5SiQ7t0wQg3HwXx7/OSz+aet36n4?=
 =?us-ascii?Q?wNj5adTqV2KfdEtP+/eee6GGAff3RO3u5/a5J0DM0aDMMY9ddQlxdO6n1Wnv?=
 =?us-ascii?Q?iR+xo7avPuOjuXN+kaLS9/k2fo+sLfG3JHlEKKFpBwyY1P8NMK6+5YWceBs3?=
 =?us-ascii?Q?DDsMiXyJcLF5sDZ9WPLoCsmYUOYPP+ut/EMO1P7e+2f0MyrHoVM4j5TNzaWY?=
 =?us-ascii?Q?nQuvM9F14lSKYZxIE00DlozmFKM70WwntLyB5R4DaSji3bCk0rChGX/iwQRi?=
 =?us-ascii?Q?DbJ29YnahVHd/Y+0it4VRleM85pr5afgbe9SBruyN4slNC1sJz2PPOk2X3kB?=
 =?us-ascii?Q?t/Q604LjNDePWWBadLrqdxpYS2R1pitagoAUJuxihFMJwHu5IaRjX3Eewhkw?=
 =?us-ascii?Q?akoaErJiGcsQqeP5ppeDusi/Pu5kHBX5zjkVPZe3T9WaqJ0WgGFh+11YOfCj?=
 =?us-ascii?Q?DruJ+NeaoqgNHKI7a2R44wJjkMSlQrjpRrSAy7QoXnEhB17RItH6p31olIff?=
 =?us-ascii?Q?/uYBRCt/+f8HIwP/zcKe15XuGIHpQn1uWyIMvPIZBYV8QtWT6rnbBZFttAx6?=
 =?us-ascii?Q?rhp01uP4OIh8diI5PyDDjMHgHQNU4P0wSBvkmGqMqqAiv/i6VgOYOxzr4BwN?=
 =?us-ascii?Q?/KhuOjbnpgY2lOvIIs58LxHY9E3zdFRIlrw4kI9CH3D/PapCjv6lEn5QI/lx?=
 =?us-ascii?Q?bvDDUjtN93cGaPRUor2Y3LoBcaiU6SLAabdr86lHFqEIMdCl6fk59yXqtkg1?=
 =?us-ascii?Q?NNu6nG3yNfoMIN6PID5KwxM/NkWCr706YQSkU7160aoiJ4WGa/pqM3xsUXDK?=
 =?us-ascii?Q?F+5yRlfu71gbBRfVwqDFeQqSuW6sdWHYh3SZ/7ttdnt2uOgog0np9TsG4qah?=
 =?us-ascii?Q?c32ojqtv8mHdbF0DRA0H9pubrPFmHs396hQyVZIViAHFGFZYEwzU6142YQJF?=
 =?us-ascii?Q?2xmAGAbPRjy2Kxet3db3S0L3P8haA0/XQ8FXDh3McolDjwyMkrKekrDThIZO?=
 =?us-ascii?Q?eo4Sg0+O08dVba9j1KfwlQj/Ly/DKAanyrZDNAIDvacoUyy5cyDBSMZh2yFK?=
 =?us-ascii?Q?B5/KS8cMd07vGs5o+x6168FutJn+2cbfoX+0WicJTakbW/xMJ2uvty5sjlKV?=
 =?us-ascii?Q?8qcZse8m5h0Nw0bPROdnEY6EKZNOyByn+IL4+1bTD3ZIypOVwnm0lBpgftoM?=
 =?us-ascii?Q?Nog9cqwwYzOmv2f/ilHb5EbkcdpnqMkmhplV02RBSu5cd20GdjyW8VH8KLpw?=
 =?us-ascii?Q?svJsJNL4hyAJqa/GaQN4v4aEYVKtd24sresu3hPdSQeasb3QNqcJCapDW2eI?=
 =?us-ascii?Q?D3Dn7vmlHsaBfaox/kJWQJ3dXn0dY24IGYse1UxKTwlTDPt0DlaXf507LnPf?=
 =?us-ascii?Q?c4sK+bwxzH9enrjMYR80vZ3TflFto5y1DIwxrDWgPm+HUv2Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17ba8aa-c0bc-433d-8f4a-08df3a884341
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:28:22.9949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4PSr5tiJdFyyFeIIuFOCYcVoPms/CkHXOK2C1ORPApcj/yOiSw72FWgVvUBoQGiLawHjg9jWtokon4U6VJ32Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB345224

On Tue, Nov 03, 2026 at 05:33:18PM +0000, Alan Jones wrote:
> Greetings!
> 
> I've been watching my lab for MCE's on some AMD systems and recently noticed a weird back-to-back pair that matched the description of some bogus errors on Zen3 systems that appeared after a rework. AFAIK, there's too many flags here for the error to be real, and the system continued to run fine.
> 
> 
> Kernel: 7.2.12-200.fc44.x86_64
> Microcode: 0xa20102e
> CPU: Ryzen 9 5950X
> 
> 
> [131733.142309] mce: [Hardware Error]: Machine check events logged
> [131733.142328] [Hardware Error]: System Fatal error.
> [131733.142332] [Hardware Error]: CPU:1 (19:21:0) MC24_STATUS[Over|UE|MiscV|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffffb1799e50
> [131733.142343] [Hardware Error]: Error Addr: 0x0000000000000000
> [131733.142345] [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x0000000000000000
> 
> [131733.142350] [Hardware Error]: Bank 24 is reserved.
> [131733.142352] [Hardware Error]: cache level: RESV, tx: INSN
> [132519.581174] mce: [Hardware Error]: Machine check events logged
> [132519.581198] [Hardware Error]: System Fatal error.
> [132519.581202] [Hardware Error]: CPU:1 (19:21:0) MC20_STATUS[Over|UE|MiscV|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffffb1a16840
> [132519.581213] [Hardware Error]: Error Addr: 0x0000000000000000
> [132519.581215] [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x0000000000000000
> 
> [132519.581220] [Hardware Error]: Bank 20 is reserved.
> [132519.581221] [Hardware Error]: cache level: RESV, tx: INSN
> 
> 

Thanks for the report. Yeah, these are bogus.

I'll see if we can expand the filter or find a better method.

Thanks,
Yazen
