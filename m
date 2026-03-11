Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C83E51E3;
	Wed, 11 Mar 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773255437; cv=fail; b=fnD+A49qxBvONyKKqnI6K86Arlvlxg8ng4TUHb2shVAmdJYVtcd3DbOYwfC9dq+fFOcoJdR7aJbNHWo/Boghjh8bbVnXgpZtm+nXWIZT0A+BOCr/do8QQIclKLR/OtwHZtvZhzujxH2Giq58N8c9t6nSPiHOq9Ilo21c/l1BqwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773255437; c=relaxed/simple;
	bh=FNpyGqvZAq4ugcxlTquLNmrkttRoU1DNm5QBE4icBZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ManULTCG/8k/NHoE/xkwxMe8/vGFjsAqyK5JT0WdyiW+oJ/H+qRIGTlrkRBKMY3OMvmoNWxAwTIV1LCnvSJ6ngqZGjzHwadu8ZHoTMugwLZMgU+EHtmzepzikCCAnIg3n1gYXfEoGRoyeT5MZRyCNI/hIFuAmrVSl+xpTQYDBkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FFhB1jl5; arc=fail smtp.client-ip=40.93.194.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FFhB1jl5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdfB6eylq3Ln6hDLZ6AwzPyyQe900oT3eMd6MDYvMschCvjruSQQpxwDxprgPuDdm0c8Zn1NReMl1SoQA8c7QJkfC1vzNIANAiirgbXxPP21/QigO3W40OkRTpIN67pqP4f6j3H9lSvEPVxV0KvmYAFIzmO0c4481tE5zH72kQeHAn/0nygQ76sVRvTuTyqAsndvIPtKoJ7t1L+lw0Iwrra0O9Y09ppBcdWfU7BrvZp2rBhWW2yjDF57znHydbUiew7Pf+MXRlyVxqucMsTuSvSHdyjGU8PTlfOawuY/oSgOlEtHqhWwKbEczbDpwf/6twy1Tma0nMdWyU554hPk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h92V2tdpkGaPEXNEanI22rApLgESGIrjsW46Utcko5U=;
 b=Y0wBNn+qtCbKFPr2AAZIAiPgaPeQkFZ/0UJYAGkqW/8+WzeSvQJNbFFhz7PoiURAEjtL7Z0sIGp2vJ1dzjgUBebdlc3wJpjDNRbRuHr3m/1KanV2rpdxU8nKm6zSF0LdFg428o09dfl9nXTSKCloLIXwKQi8KF6jx1Vb0j3Al1vQI/vLVPdGkR/tfqjmVjEsn2hopde81QhaOfX4wr2p/oAVVRM9OqYfgJV1N8yNa614alajSIc9/UczltapkDNEI0DmLmnVJ11qKuN7sX2CrS7g8EB0WBJgnmEkk4vnkTEOzAdJva+uh6XvRkMytL9opNQa0WKc4dkG3cMwQMrFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h92V2tdpkGaPEXNEanI22rApLgESGIrjsW46Utcko5U=;
 b=FFhB1jl5OJrkAshNweFwL4N+RRr50RBuSe+j7tH2ZAXe4dSR1AOG23mLeuIapZ1l7fb973ismeHkfA3mP068AtdL+YG5/Pwj1exik05utScCYxBh3CndTmXpUtRXzstiXvbCzUY0BH/Nhw67kkDshNBgJUa9S7eEGlsQ+cWnMLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Wed, 11 Mar 2026 18:57:12 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:57:11 +0000
Date: Wed, 11 Mar 2026 14:57:01 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v2 0/3]  New SMCA bank types
Message-ID: <20260311185701.GA1836340@yaz-khff2.amd.com>
References: <20260307163316.345923-1-yazen.ghannam@amd.com>
 <20260311131938.GRabFr6kIjckASLap4@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311131938.GRabFr6kIjckASLap4@fat_crate.local>
X-ClientProxiedBy: CH0PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:610:cc::21) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 745e0d79-b666-4908-e5cc-08de7f9ffffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+QYYHU0INoEhIeQCglgJxuvXpLi+WKq+BEqGXh2qZwFpuYEQs3LkpqW8R2wsdwxphgwH0ZSwavr2Xej8xsf0pja9zC9dDBsh8/Yct0F4T4GlBjj7BdAsY+/ETxqkn7pXUmbk5lXNuNsCYredcVskQp3foh8gyNI7wDlr613sqw3Km5ZwUmenzRaY/4ajr70kVhD2rg89ZTZDY46G7+hQNNILumt48LA4WlrPCWm1OyxkYTXPVPXK5WyxyphDTdo5Nlg1OErpA5jCjt56EeFtVkjslnhC53ZzOwnnp+qilJ5Ab354rHvZBCyDW84CcNCDiwiTFofYgDaz10dBLWy2zCMOjJDy9X453Fv1fsnNa016WaJP3rK7IwG1z256DOWrIyiwcpR6gYrkIRly8cG5CpT7+9mezKMlhakCDn97XVjBbrF7UmKjdCUOG+4528qbNtkPaCjJFlEldw2HuEUY9OWvi+/d6j2z6xJ8WzNt1C1vKILoEyIlVy9HBTHOF1FyYDmLKgMg5zruwqyIbZbRZxfXgG+yrNMeyqvRgH4n8LhnbBxyFjIIyaql8iLuKSid507qS5l9se/yrcz81r3K0jaVzSZVswHrTod/f2sWVkG+R2rHDOFyBupuzk3cyzx4jX43vvwBZIyafmBs9AoTHB7azVRyrSEiOZDR+fArv8kjfhf8Ocx/j7VK5kGXO7nbw/QBFtInHmTDaz03VjFajw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FZFENBuB9dvP4u0Q0amVtRfUjUlB+FtSU81PyufsY8OsnCnWUAJGpSanxc6o?=
 =?us-ascii?Q?RcVfwADEwGWpVCzZv5CHybpAn28+YyoYlQz6PQgcaOoXY6hRSfn1YWKXzEuf?=
 =?us-ascii?Q?r6KQ5PBpY69cXkTDdU3fPmsvx717HZVrXrf0mTFUIZ0TsbQO128mpOPDLFiW?=
 =?us-ascii?Q?VcifKPy6iLV4ioE4rwi7xsgErUc2HMSopD0qnDA2+3/9t5eKIhAhveQCEEMN?=
 =?us-ascii?Q?YtPVW5IIY9s0sVHiRJf0s8TQ/WtSHze0SMKtxGTGrz/2CrEd3LC3wNLD3Cf7?=
 =?us-ascii?Q?pLCaCnRA8rW0bwFfBQ/uMmivGiGQX3hAQGu02ydHiPxnic397OVOp5g5g0K6?=
 =?us-ascii?Q?MNGE6Zq+TseqtgxeBUOJstxXCuVnFhgnsxMtecVBQBwgCi2nz8BEfP7qnqOF?=
 =?us-ascii?Q?NnVWuCH1gQKUQ7VRJlTqSikpjc6K/fuTJwupIF9qfFFXmEhSyDX8qYao0hlK?=
 =?us-ascii?Q?WV8j4j/xGKV0gRkIYwOpayN1yYLz94Y8U0TnJzOunkL40fJF9RGOwISiW86o?=
 =?us-ascii?Q?jebrp30QzVomiwXPRuRyovM29+INe6frCHZhwfo2F0eDgMPIbrPklvsSMKOF?=
 =?us-ascii?Q?EVsJ21UEJ9JSUoy0HUV27K0f41qDHoUoC/TllEeJ6dc63G4S0i906olAaPhI?=
 =?us-ascii?Q?MND1zApOMy1flRYWtf9Fvy5b47TDTwhcYfmS9D1tIBlc0uL7vbfLDlE0Wbj+?=
 =?us-ascii?Q?+pnPnA73n0izCDNwwO0WJIxhoss/Q+suyDXCK4+bCmsHs8gD3Eva0oDpsH6y?=
 =?us-ascii?Q?u0lC56tX2h2bZ88l4aMLnODMhQtda8dfQlAt/KbWnwPTHzWIq+5IY1NCEb09?=
 =?us-ascii?Q?E6zrvMx5Womo1PIbIaPH7/tOaXnwaYC8g5QttQImxwDx+bSG0PpNFCKhImEe?=
 =?us-ascii?Q?9CL4T1mDvZ/Wyj/3LhvK3Kt1d3/DXFoeJD3lGnd0//D9w0Be4hq6Xv48H+uB?=
 =?us-ascii?Q?QpkXnBb67Lgrgi0TPB/tA3YT/sVrs9Mgu7szdKemuXptMAEqFbZpe88I5GGu?=
 =?us-ascii?Q?99aL7yvcarDAzaTFjaxzZsCtkg+pHnfozF4RFWgOxLIuZj93ZxzQa0gBeskG?=
 =?us-ascii?Q?XGuELE48YwiidDIZ0V1phQnQEF9T36pI7+9Eo7NAX1xWMXHnYhmyxZ7A6oui?=
 =?us-ascii?Q?gP76vUR5qphtjpySr4bsXKuDNbIeIDhdOFW6NOZafaJUWojd2JfEIWPfRHtz?=
 =?us-ascii?Q?/eWv2GboOIFRRvJemYIl0iPKyg8hsIZoQ24sr7X+WMdyyrGJA/B40G9JWj3S?=
 =?us-ascii?Q?ZtfMlfL7bv8pWo+J+W2WNIgk1SZsV6Bz8VUOJGD6fpvf+EKpy4cgjse6Cuvw?=
 =?us-ascii?Q?0IrnCa9pZkhJe1pkZXcEmznB7QYxkT9CyDs1PQvR9h/VP41bi5A8MAiQif7e?=
 =?us-ascii?Q?iJOzuAShyIBghWai8yf2mf2zy9pjhqMEtnif68SSRz9abSDs1LPJf8HAcNMN?=
 =?us-ascii?Q?nvcCOH6FKBxDAxahCgy1Fp8zEx1drNsqUpbHSDNt7SZSrk4NKgBhdKokhs1X?=
 =?us-ascii?Q?EdB/nAYwOj8/wiTwrK4Gfa6XOS6t18IHBY6IwSS0aOK9ebhWWD2wSGUplxKK?=
 =?us-ascii?Q?9PEzY27itovOcTe2iqmk+gqdDClYc2GRy2KFoOkWrlmKBExplnBJRpgkW1Fp?=
 =?us-ascii?Q?lrOMM9/lOJLoMZ3htl1am2uyuozD72UEErTMfy/fgvoetSO9NVk8i13hbr/Y?=
 =?us-ascii?Q?Wee70PcQpkbbXHbF1ZM4q0LhUXsSpe0RdyS+LXNyFcSH8koCPzaG5HZPMyxd?=
 =?us-ascii?Q?X3Xo8kB+BA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745e0d79-b666-4908-e5cc-08de7f9ffffa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:57:10.8721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPNhzWlWzXVZBdUMZ5xqBYaPXs9JLt/t8O7n3JaJI2ItPJLcZE0qFgK9/Ct8mpct73eRFscAUc1GKBdDNCn73Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

On Wed, Mar 11, 2026 at 02:19:38PM +0100, Borislav Petkov wrote:
> On Sat, Mar 07, 2026 at 11:33:13AM -0500, Yazen Ghannam wrote:
> > Hi all,
> > 
> > This set does some minor refactoring before adding new SMCA bank types.
> > 
> > Thanks,
> > Yazen
> > 
> > Link:
> > https://lore.kernel.org/20260202172158.2455749-1-yazen.ghannam@amd.com
> > 
> > v1->v2:
> > * Rebase on v7.0-rc2.
> > * Add pre-patch to reorder the bank type enums.
> > * Add pre-patch to update "CS" bank type name.
> > 
> > Yazen Ghannam (3):
> >   x86/mce, EDAC/mce_amd: Reorder SMCA bank type enums
> >   x86/mce, EDAC/mce_amd: Update CS bank type naming
> >   x86/mce, EDAC/mce_amd: Add new SMCA bank types
> > 
> >  arch/x86/include/asm/mce.h    |  59 +++++++++------
> >  arch/x86/kernel/cpu/mce/amd.c | 134 ++++++++++++++++++++--------------
> >  drivers/edac/mce_amd.c        |  48 +++++++-----
> >  3 files changed, 147 insertions(+), 94 deletions(-)
> 
> Ok,
> 
> check here pls whether I've botched anything:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=tip-ras-core
> 

Looks good to me.

Thanks,
Yazen
