Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721363E3D91;
	Fri, 13 Mar 2026 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773433595; cv=fail; b=JjPn6Yp7y+ZfKaB5rrj14AGt1QQn2QNxQA4vzarkQhQaLnmdA+az7AbyGSmN+2R8QnKxaLGtXFZGety0+GESs+wUZWQ2XDW2CkV9I/VtPOoqvfX379Tmd2bK4pidvCnsNEslzE/WvE4GsjdX3Nx6Mcs4ZUd2aj+9Bg2rvrrGDAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773433595; c=relaxed/simple;
	bh=qDI9YNP/aRmZm5fRESncOOX0Agw9ZRI2p4WuH8VT3J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MevGTf7FkSJDUYwn8HhofI6MOUXnBvGCap0BcmUKtDSPKrKY+FFb8SI+FqBlddSR/2NHsl+B82vznuPDoZXMLdy/YtMDS9YkA1ckqAjh2UXrYo6fB4+l+2bz0Rana3JU9lJGmZzwkb3KXtvO4NddbmwNfdKKGsQahSTr+Gjanh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vQ1FS77y; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vQ1FS77y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOz3bTOt1ew3OzXir5o8OoZtFZnruuPvcJswp1X7NL3w8ZxT+gIYR3pFI0Ed2zFZwegNBj3t8rtjQ5r5xEpRjGsTJHIllfGqpLf6VPUSiSAyWB9LYeSmJO2y8YX9UXfLJHl8f5ipjfwOFYfaLdTmUoagZX4oe4s8A9MQ4RLRkRaUyRulHPN5wuzMeb3DUzw3v2jqNTX7Z7QHMOBA9eZHOpAxXt+5kgNB6dUpniaFMhNYr4aVcWjkLU79KO71V5XIkBJggf/tNUDjh39n9kUB7fo9R0Yv5ek0z/eHON2EADtNwa7HOXzivANPATdP66oV4NwDxKbO55hJU0n3HCDAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7Hc32l5RvVTK8pjxDGeVUhr0vkeNuqjS5CZs5KwjGk=;
 b=S4CuDYjiXOP5IAVVT3JkFhBcJWF2a1WKoKxO5+fB+EL1FsKPk0GR6g5T1ktKdCv539XUps9+Krxk+57GF3GXXUerQ/wMkBTfN8+oyAf5mz6ltMTdK/uxAfFonWevR+z+POgrQK+grMXg6cRtVTwkEkk9DCWUbd21gdtr6Cyc9upzSQ0LHQBaZ1fW0mF4vYN8Uz/FeKjFhQ6QNytqrPvqFr2UTHZLlS1E88/Scc4Hf2bXNYcNHOzohZzOlY2F4oClGUIC9yIfYf88Nk2fAZje2IOLvFiqQHm8S++NX06E4c6LhAkbJKISxZTwJiqgBMBcM7YBSgpExTC4U8axm5OMDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7Hc32l5RvVTK8pjxDGeVUhr0vkeNuqjS5CZs5KwjGk=;
 b=vQ1FS77ykhK+lm+55oNyZQiDqTRhCMjCJodjkG5EGU/fGJcMdq4B/l2Cf6DcTmUAEiFI3FhWC3RSR/iHFceZULF1pi+LJvFwdCvkqH5uF25kiwWUnlCi6ImO9FyB9dkT4WSvAfQ+AKjtOo89uS07efjw6E9rAx+X1N15scAZOCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 20:26:31 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 20:26:30 +0000
Date: Fri, 13 Mar 2026 16:26:19 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: William Roche <william.roche@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
Message-ID: <20260313202618.GA221731@yaz-khff2.amd.com>
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
 <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
 <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
X-ClientProxiedBy: DM6PR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:5:14c::19) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b0d016-179d-4a91-3ca0-08de813ecf15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uK+mwOX1aWrNvcUIJZUAMy/HPb3CS1RXDe97k1t5dEQcZDy6mbi1Aj1r0aw65UsdmzWJ3P7EA8oISsC1N0dluCdAz4jPW6ozq42Jrj3Y4Uhaub+++bDWUKaOjy9PukZ5cdCk8XtGMHNN11XQBkAxqEgRpO7l/slXiNNMCkiiAmPuuitsR8wkdTN7+sV0kG+lKf/5out3HFNYdZZCxERIv8OjR8O7bYtCq7WqG6rlsrs31dr/tBn8UKEgFShLEtf0TfjAUqawXZ7AwIAIgqOznGx7oUI3X2LJUvwLUS6pF6wIL232MUzTabTFi9igFKczOJOq4BLGkVfQPwf5myTLuP5p7UtxfZ7isCZ8WFTbIdYvn5Kr+M+tIhSnSpMw9sGTJEhhlpuIN9XQsAgg6z3CF3F+Pk+Zbf5TVCoqXHnAmQXrii06ET4DM4878glI+8GvUSzY+/G9FmjypMLJ/FsrWQaNkv8a3RL/9YW+NXjETVt69S36MCGqxZZ+UEwxFQ1FmRQfdESaENk7KrzGP4h5f3Go7S4p54QQuV/phmG+8T/P+TbFw0gCErCGUohR0V4QyktP1EOFbxTgz4ThXqEjn/JapKBEcWewuo2e0uqEEyotK138Az/LnogdhbqzuFzNZqXT7NNT++nezUBdKk7kfxDl9Pv31M643jCH3X7crust+NJHRoP3Lwsqr9Quo5hQ0LH3y57O5VsETliPpAmOYjNt3MOL9LCzWwaFKKtwz1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qIR7nWUS3nMOoyV3Y3a+OVdZM92vHFUEijz9bkWyaEhSw7lfr85LPoM4EFaU?=
 =?us-ascii?Q?miJCI7FI5qtGac92IHqDNdp51l4LQAHPp9j1FqdrWsnj2IayqfJs1m4zC2p0?=
 =?us-ascii?Q?DuoY89LI/k7ced2O+KPsCnrbkoiOc5RHGEdEbftdmsvQVXND1yDDME2nR1wG?=
 =?us-ascii?Q?1ak3lNZoWhFTUMPCA+XuHZr/4HSHqw4w9CsF0LQA8DK+OZKyhR5VlLZ38pXF?=
 =?us-ascii?Q?CI+bUrce5uO2/tAiEIUaeJ7kWFECDxJhPfJ/N6SY1KzXF6vpPiFMfhZ+z2vo?=
 =?us-ascii?Q?jpjWBTtu0ddzgHgvdyhXFAtvfoZYpjdwSclI1M+Q120BucUepN2k1LRFYLHw?=
 =?us-ascii?Q?DvmHBnMTvAQzoICDktUfHVkqDi7iepFlbMOHMX0CjlnhIAUFdlnR6I1CnbxX?=
 =?us-ascii?Q?8W5XDyml9O70K6OJOOshaR4rQ+3Gc44ONm4izsy2z1Dvag0cSI0hs95xJBLv?=
 =?us-ascii?Q?oIpWMVTyf+Ld+s5yHczso/5KU+oWncqBufUP6UwOyhHgi73Kx4P/cf1I5TBH?=
 =?us-ascii?Q?fKryl2N+VX5kujzW+FcHeVKQ+Ilx5fsxFxS7V5Z4YHYiJM1PZV0RwL5j9W0P?=
 =?us-ascii?Q?yvxzo6TNe1YsWM/h+LKaxQCa3Z8JgAbRJN6fsEjjbvQ2yrSMpVsgY4Ea8HLI?=
 =?us-ascii?Q?kJ84/iNE7wvRvGQ3frrlBrhoikKQvSSBtnr0Jgi1BCbiRZU0krJMHnbsTgt2?=
 =?us-ascii?Q?5+sx143ZuZ5stZIlEKKclqmLoi4cTnxst/ObG22V+Y9uVn5yoGPePM8VJrtZ?=
 =?us-ascii?Q?1BdWovVCSLaRGOmRLt1YWVOjN4yDh6FXfEXC0pYkrshPYPwRJgyfDnZt+nE1?=
 =?us-ascii?Q?hgpows0yVkzgvVh6D7Bxlftv5H3mhNA0AjYkJFErV4XwTOdLwYqWivj38uJr?=
 =?us-ascii?Q?TLUNdIpDAKaK4zbVbxFwuzNApA9IStY7AJ7OwP0cQL1M0BYnQWr0VgEL1SEK?=
 =?us-ascii?Q?HvunHwNcUCnEmLG9xrPtSBSmA+95CTtKygXSK9nwZgLl92jzXLp6jC7Pi5nv?=
 =?us-ascii?Q?OZ7V96wvSrRlC37HsY3/7zfDyWWVfGdFc4vCUtFN+FHDjKrRHWBtq2aZQ6r7?=
 =?us-ascii?Q?8UIM1KRhpm10Ng+xg2Z8KEDaMUElKpK82oOlDbpT/6JGnOJXGn65eG/lQkkl?=
 =?us-ascii?Q?e+N+Zn1JyhgZ57tMAIEhTrF6C5Ervu/2tkNqzHhCbm8A5F2/HzOqLk0nm2II?=
 =?us-ascii?Q?BwUGQv4T5pLfxprYopksjPusZpyf+UHSvGj/8OAKZ+7/ounbhfIWJzdxH65F?=
 =?us-ascii?Q?5Z4/mm0Lholdr8pzxtaYho/CpSvY/eG/PLOGzcSGo93wYVBSEvIdEw6IIgjZ?=
 =?us-ascii?Q?SnSd9Od7G1ssUbUbU/jCZsytlqwPirIaJgQ1wHHdgQhcF8/5bPzKqgFwpjGi?=
 =?us-ascii?Q?QGQHDfxWJjm8D3zaOl/nZwDw8sWxF3xQzmbbAqD9mHiYvtG0PiNHi4tdQx9p?=
 =?us-ascii?Q?5i+F7Z7RJp3SdV4TpHvB7ZL2k4BoW1IrUcznlpAW2UYJExf55y96DFIJWZjh?=
 =?us-ascii?Q?KYJD/kM/DD+VhQsE3971z1uwowFapgL8GolaHLQqwzPUg0o67JKPdeCsGP+R?=
 =?us-ascii?Q?QL2VuZLZz4fXag5vil/C8pjzPncjkpdN1dmD6EoOe+BwwCgdkuT1yT5vw3sH?=
 =?us-ascii?Q?Og3t+2n+QH8oePeaf3AY2Tqt1ppYyNTACnG/WIWQFqJ/yMb06SqRNSCCcMN4?=
 =?us-ascii?Q?xxZBaV+PK9KzRPwFpFG9HZr9yZ1JZPipkB77MHc+eYoJ5UVr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b0d016-179d-4a91-3ca0-08de813ecf15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:26:30.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wG2YUDEknyJXd7v5k7jgejnYsie3YYfu8vcKIlbd11WEzl8cPLI7o82ix8P04xYViFaiRwI2OqSML0iWj/WIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148

On Thu, Mar 12, 2026 at 11:44:04PM +0100, William Roche wrote:

[...]

> 
> Yazen may help us on this aspect: Could you please let us know if there is
> an AMD specification for accessing SMCA registers on non SMCA machines ?
> 
> 
> Now if we had a valid case of an existing non-SMCA AMD hardware that could
> crash on updating an SMCA register, the fix would be needed not only for the
> VM case.
> 
> Yazen, could you also please tell us if an existing non-SMCA AMD hardware
> could crash on updating an SMCA register ?
> 

All the systems I have access to are Zen systems, and all Zen systems
are SMCA systems. I'll try to find a older system to test (Bulldozer,
etc.).

[...]

> 
> I have a procedure to verify the behavior: It consists of running the
> upstream kernel in a VM (on an AMD platform) and injecting a memory error
> from the hardware platform to this VM to mimic a real hardware error being
> reported to the platform Kernel.
> 
> To do so:
> Run Qemu as root (to help with the address translation).
> The VM runs the upstream kernel.
> Run the small attached program in the VM as root, so that it gives a guest
> physical address of one of its mapped memory page.
> 
> [root@VM]# ./mce_process_react_x86
> Setting Early kill... Ok
> 
> Data pages at 0xXXXXXXX  physically 0xYYYYY000
> 
> -> DON'T Press enter !   (just leave the process wait here)
> 
> Ask the emulator (QEMU in this case) to give the host physical address of
> the guest physical page:
>  (qemu) gpa2hpa 0xYYYYY000
>  Host physical address for 0xYYYYY000 (pc.ram) is 0xPFN000
> 
> From the host physical address get the pfn value (removing the last 3 zeros
> of the address) to poison.
> 
> On the host, use hwpoison kernel module:
> [root@host]# modprobe hwpoison_inject
> 
> and inject an error to the targeted pfn:
> [root@host]# echo 0xPFN > /sys/kernel/debug/hwpoison/corrupt-pfn
> 
> Than wait until the Asynchronous error generated reaches the VM (it can take
> up to 5 minutes on AMD virtualization) to see the VM kernel deal with it.

...hint for below question.

> 
> Without this suggested fix, the VM kernel panics, with the stack trace I
> gave:
> 
> mce: MSR access error: WRMSR to 0xc0002098 (tried to write
> 0x0000000000000000)
> at rIP: 0xffffffff8229894d (mce_wrmsrq+0x1d/0x60)
> 
>    amd_clear_bank+0x6e/0x70
>    machine_check_poll+0x228/0x2e0
>    ? __pfx_mce_timer_fn+0x10/0x10
>    mce_timer_fn+0xb1/0x130
>    ? __pfx_mce_timer_fn+0x10/0x10
>    call_timer_fn+0x26/0x120
>    __run_timers+0x202/0x290
>    run_timer_softirq+0x49/0x100
>    handle_softirqs+0xeb/0x2c0
>    __irq_exit_rcu+0xda/0x100
>    sysvec_apic_timer_interrupt+0x71/0x90
> [...]
>   Kernel panic - not syncing: MCA architectural violation!

The code flow indicates that a Deferred error was found by MCA polling.

I thought QEMU injects a #MC into the guest?

William, do you encounter the issue if you disable MCA polling in the
guest?

To my knowledge, Deferred errors are reported starting with Zen/SMCA
systems, even though the concept is found in older documentation. This
is another reason for the implicit handling.

I see in QEMU we set the DEFERRED status bit for BUS_MCEERR_AO errors. I
don't recall why we did that. I'll need to review the old threads.

I feel like the intent was to select bits to produce the desired outcome
rather than faithfully replicate hardware behavior. Specifically, the
DEFERRED status bit would prevent CE filtering condition in
do_machine_check(). And it would trigger the AO flow in the guest rather
than the AR flow if we set the UC status bit.

Another example is we use the POISON status bit so the address is marked
as "usable". A real DEFERRED error would never have the POISON status
bit; they are mutually exclusive by definition.

But there may be another hidden issue: handling the error through
polling rather than #MC. I'm thinking this isn't intentional, and the
recent Linux changes exposed this behavior.

Thanks,
Yazen
