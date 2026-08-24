Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE459388881;
	Mon, 24 Aug 2026 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787604445; cv=fail; b=Gii31iIp5KD59DS5immcInhYqzFi/Qk/fugkjvgEgFwhlBSU0bKjLab74eZVFPHSY5EbQ7Hrz5TYjAsR0TEji8ox4UVBGmslQTfdUVR1fPUIJ/Qh3guXxC2S6j4eZSOCN94j3XxuPp7iQ92n/its1lz9iOCF2V6WcvS+89f0DPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787604445; c=relaxed/simple;
	bh=NiFEXIHVvDo4rCf0eY5IDNVYhdaOptRZ98nMNh00Hhg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rM32+7hAQr+rOda4pxh5ZPy8n5UHP34LUoFanQYFqllQmJBQrrHkK0hYq9obuqeL3iNZxE7lj24CoWVlh5ffvADNY3WtNffXz3S+nxKzpodO7iDpYg+LR9CvIIa7CspyrnsxNx66F7+IbbYTZHoeEuxTppzHcaTivoNbkET1QQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQy+xf+I; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQy+xf+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787604443; x=1819140443;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NiFEXIHVvDo4rCf0eY5IDNVYhdaOptRZ98nMNh00Hhg=;
  b=ZQy+xf+IqfhTF3XQOC603tGBRHbac8EGTd50WS0jFW1sV9aP0l0oJ61H
   oO/9Jw/UvET8M3p60ncA5Jdob+mZ7E3rlmYbi8tyHDOQfSVGpPFLEugdi
   1ZQ+javbcUclOXqI7udM0UqzdCe8fKHrR6bd03+TaF2fgF1bH+MloeT59
   p/iBfWD9XI02o0qczbsFGjJORN5L5y2zDbkVXefzS+/Do/SpJbHlsVKpd
   jT9R6R2ZZ7ZSHc3SW9XBFdP0vGBelxbkmAWVPbjrgBpV35zaht2WR2SbD
   qDdiW+VRbk5xfVkDk1oc3YiWXLb299XXtxgBXK8SZ0x+q75SLLpatINds
   A==;
X-CSE-ConnectionGUID: 2WjdrgNHTNWxFKnkxnrN5A==
X-CSE-MsgGUID: GFgD5iXMQu2XIreFs8j7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91743551"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="91743551"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:47:21 -0700
X-CSE-ConnectionGUID: NDhNkxxQQVGxpx2GGO6J0A==
X-CSE-MsgGUID: 357VeSmWRDeRqM4nYDm/yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="263370525"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 13:47:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:47:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 13:47:19 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:47:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VUzZZpDuGx07aPK5NJP2L5UBTbmjeD/LGyQXlCmgMPV/WoEosKDFINGLpS+VALB4ylxZtFDKoikvBGkb6XFnAF+d6+9NEAOF/RhTZh7OmPo9jFpQgTkidYkx5P07jgfpvNEhdLjooXv7B8o4hBxRCwLBbR4sL3hlmnE4DloY3tfkmhFIxF/9NWLsspHSuzHg0Mt3E+Shi4cTmZdZNatCSU+6om7uFb1+sBb5JUk/L3kdqNX3eikZbYSNPhm4SHnsUg8GbqAAJNWmYA31QVWvTdjLUEZPMbR5xjQkNnxHH9ZAAWEc38wzv/OykIyJrOKg5YoYkYM91oN4vI1AbCi+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMTwjMRmnyKWW2+ZD1e9mgnOaFEDk5R8tiNvJ4sfj14=;
 b=V6jtM5QyiolVPipK9aP2dR+AbSwPwPz2uhVNle/AHmpMT7KF6dPz5MYkbk6EvDVclAZYIF/QkrcoDrRTAZvLv5ugmHZfT3xtYPwe4J5pAk/587FkbtuXm4NWvN1lFZUbvmKDKcNqzdPRBb+EnTO5oJo0s5JNDXPfq5T0X97W9MeRGMG3YbbgrBcxjXTPWX0t93ml4vWnaNJQ7Q4rUlSQX2CrIms8X9rv+gFPN2RyKSg6mi+yH166qqyy+8MJx+5zHEC8zgymxtbLngwtTgPYmuSOy+9CDfxn4uoFVMHYOh12ZymcLh5PqRcXPW2MdjrQRBc6ZugdiKaL2UdZe0pukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by IA1PR11MB8803.namprd11.prod.outlook.com (2603:10b6:208:59a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Mon, 24 Aug
 2026 20:47:15 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:47:15 +0000
Date: Mon, 24 Aug 2026 13:47:13 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Breno Leitao <leitao@debian.org>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
	<rdunlap@infradead.org>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <aoyt0bpXGQf1Y8GH@agluck-desk3>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|IA1PR11MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b15dbb-236d-4d09-6151-08df0220e14f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|56012099006|10067099003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: kx2zaHxJaBPYjeuZAijposQan93xeeDv78nGeQH+Tdn5psaT5JddUiDyaDGe8EJGwEx+96rDSkRAltOEn/wm59afp1Gq6j9INbS6oQ0kbMtaxn5l2CRPtBkbFMZnsjoh5B5osaodS6gisSPEEYRRIx6kcvJunmQIEoPzrzE/0qRCSiE95cLmgwVCuhBaPhsjetvRKCzvT/n6tkyySAlMq5ywjav9EJGOT/oUoA0bhVzv6SexQVrAlxoNUNerOTz4+LXuW8xMVlEfLecKC8jCcPjgbR2rTGdHtdijB6xhjqUHJBg123NGZ4YJh2kERaCqXoTJhnjXjFQZRXLe+xFAKcW4pKa7z6lJU0mV7V0aTDhuZY+5zDNpurJWCf+LBtK1RkMYLGYwIZAdSslPZd7de7Umwwoph+i5Agi2YjnR7cVs/jYbrrZoTgY1C7t6iWcGgRN5Q9AQhYnbrMh+QpLGlTQiU1vutFvRLU27lF8lBKiU11IOPFK1l5BuRiUoBAn3n7eX8hYNwZNEeslL43eG0FmW7IWRYaCGJnoTAg5IJCB/OcqqGsPIsZppMfgbBQo0BzpVtOtvEdlckzKPmi2H17U+Gpk1FA75JLoPyGwj03w7Uq6+MMoRqe8YzK7zEsjweypeEuVAtVTIJgbwL36uH6xGyeqIQLD8Xg33KQnKJrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Md3v0AfDc6WNhP4bxacUYnVVVPPK5lY1o4FacWlAZ1arNqke/nQjJvh7Rerw?=
 =?us-ascii?Q?9pz/72fX1h+5Ua9Bpo7TbcmeMxk92zufL4bW5Kl5JdYtRjukV8UlG6r4VlLN?=
 =?us-ascii?Q?ncleGhlnNL9iTf21G4o1GhazJIU7T7RbnaJC3CuqOFdD9bUvQJnjzyykE5Us?=
 =?us-ascii?Q?s9kS/dMwLauAZnOxY3kpYIEuWkhSr0C0kHOcVDP23MswXfIpVfkEg2Z1cl8a?=
 =?us-ascii?Q?9L0nfpGYujpYXvWglNlX6DKi25Q6ieTAYYtnjo8L0g9mv9nxm/lOunzN7n/4?=
 =?us-ascii?Q?YsILKbTnTN/mOo69U283q5AHLZBPW0MfOm5Cwsnkz21M0E6LxHr3EoRIL0GQ?=
 =?us-ascii?Q?v4l6E3ifw/PIwqj4ciCTzIB6jJizDqGgKTNztNXYXvgVuOeFiDRRGDnke9Xs?=
 =?us-ascii?Q?WeFlZBVNSb3I8cD90ah9K1edI12oFQE07VGFmu3ojQ+MPrXQQJ60AaIHgert?=
 =?us-ascii?Q?egqEnpyRiSLDvy+pxW1BolaF3aQFmZqwrYo2v6WfxfaAbP4kAezHoItZkaV8?=
 =?us-ascii?Q?CRbGflG90IaAJrmGRtGV20qtBrp9dhOtWGoaFVIJdihuISH7hPRiaEONmDfs?=
 =?us-ascii?Q?5q0FO9MNwGDs9L1bNzsjWoxo353AmZI72ciKp21J8+SNeB9SpAQwBXw8gTZ7?=
 =?us-ascii?Q?k1+VgpT4Z8bIziAOhPvQjGIG5vSoqgjCW5J92TP0FTLFwPqu6pmG4poOhxaX?=
 =?us-ascii?Q?H4lwo3KDVLugws+rQnsnOytyfFBVLoOOVijLxSb2Cep23rag7MuiXbuaf7rb?=
 =?us-ascii?Q?cVFAYAV7EiYZ/INPKczBQuWJd/ZqWuXp6LTBT4q82uQjZKDRPUzmpaN6jGQ+?=
 =?us-ascii?Q?ri/zBeD4jtSL91B6nUegt9yxl5bWgsnBW+QfOShJAfwjj8GL00x0JgZufTJ5?=
 =?us-ascii?Q?x7X/s8nQ0gwn0xksAS5h0jnIY/HebA3t5uaSyP4tXP5job9QGYg3aQdMsQx/?=
 =?us-ascii?Q?GttiGX6eDkhJ1936xypKZn0GC5FZO13U4z89RfNH2nxmEbj6+lKczryFGtJ5?=
 =?us-ascii?Q?ijaM+5TPAsjyNS/OmqfdhRi5DbFonR/muPbLib23wfj40fjkVwBCh2Qn+px9?=
 =?us-ascii?Q?/AxuQLyErpGk5IuFgBveM3Dy7N6IEmvQOSfHCUdr9zV+hdIqktolCi5LgIlc?=
 =?us-ascii?Q?UVyq2OA1+XqHPM6lHpze9W1majZX327z6UZ/TeqAl9DSm8KzvZbUyvtr2SsN?=
 =?us-ascii?Q?Eq7/iIWtbEIfiUboCUFxUrgeQJGfIXtkPjN6h7nu1kORtak1jFUT/52U7zS9?=
 =?us-ascii?Q?cyop88jIqNNlppifEmZg3YtrcetNisyNSboeg0Lt6wEj3Tq74KDM6pS9U57n?=
 =?us-ascii?Q?cr0uZQfDuQS3XPGulP753EThFTo41u9yUhG/zLnRDHtlO8DwHFcoaEZ+cFdU?=
 =?us-ascii?Q?I96A4NFt0fpry7PBp5BtITrHGahPSAHNxQYvreTxyLJi1kVJm6LKvn34bFe5?=
 =?us-ascii?Q?k1jwVrNa/zRcNERr4Iuzj+BiwTbHoA3J8giQ6DP0Q5LpfB+EQlfkZnEZOuwU?=
 =?us-ascii?Q?fJZP8L+vYgPLwVp6+q3P/6SvwqfZaUnNj+6tqkhUDsn8D+UxEsbzUN2gw/J6?=
 =?us-ascii?Q?DcbTxch0Cx9eObRRYx6cgC6xLoXnxIaLrjoFDnzA6ldON5J1sjdEtXKz4lyN?=
 =?us-ascii?Q?6boQJLJU9uHcWyiSPe5Pk/+4VJOp3ZvhKoHCxDN6L0QVItgsekAxFVhX7jVw?=
 =?us-ascii?Q?zEFf0xVxxw+38PfU8jn7DZFkD6CE4DaN3aAMF21Zw7RzO0AbiF/sH1KPDWqB?=
 =?us-ascii?Q?VqM7uLAmLQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: MPnHMnGSVXm5WUqQ4D+HkiNnZklETojiw/lc8eFIe6K2Ttpy2hppqiCslxQ1F+UPc0W5/lyiyzE+56y4Du5FSe1yWewjlTPhAAZdbxqpiMQaIO8rBe7JyewqjYb+0f+sJ91WApoMc/Z9YNm8YjTjWuieCPLEX2s2ROrmIFaFk/wbcse3jUZieq9kzSTFz0e6srlQwGK/0EaHkMbnyhbMDE0WZex75TSE69Pyko2ZoOrBRYhnTgxcD1cLZR6VILMOlm7dXppylUdZSlAGXp3xzCLXnz16s6TlObYSv8OEOUdd17rW3JOWPSfQwxeLf2e0B/s5SVQFAw+bZwshPkE5Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b15dbb-236d-4d09-6151-08df0220e14f
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 20:47:15.4037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4EirCatMFxngxqgy0irGN19zJX1dV2mrUYlKxolwfuD+ogcMzU/J8Qg8orYCp/3i5IssnKLMuAl2H3E9fiUhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8803
X-OriginatorOrg: intel.com

On Fri, Aug 21, 2026 at 03:24:08AM -0700, Breno Leitao wrote:
> +/*
> + * A bank that keeps reporting corrected errors is repairing them faster than
> + * anything acts on it. Count them and let the admin put a ceiling on it.
> + */
> +void mce_track_ce_count(struct mce *mce)
> +{
> +	struct storm_bank *bank = &this_cpu_ptr(&storm_desc)->banks[mce->bank];
> +	int limit = READ_ONCE(mca_cfg.panic_on_ce_count);
> +
> +	if (limit <= 0)
> +		return;
> +
> +	if (!(mce->status & MCI_STATUS_VAL) || !mce_is_correctable(mce))
> +		return;
> +
> +	if (++bank->ce_count < (u64)limit)

If errors are happening faster than Linux can service CMCI interrupts,
then the corrected error count in bits {52:38} will be some number
bigger than "1".[*] You should add that number here, rather than simply
incrementing +bank->ce_count.

> +		return;
> +
> +	printk_deferred(KERN_EMERG "CPU%d BANK%d logged %llu corrected errors\n",
> +			smp_processor_id(), mce->bank, bank->ce_count);
> +	mce_panic("Too many corrected errors", NULL, NULL);
> +}
> +
>  void mce_track_storm(struct mce *mce)
>  {
>  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> 
> -- 
> 2.53.0-Meta

-Tony

[*] My personal record is several hundred. But that was on a debug
system that had been poked to signal an error on every cache access!
