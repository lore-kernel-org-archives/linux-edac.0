Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5B411FBB;
	Mon,  3 Aug 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785770694; cv=fail; b=KO9Vavb5dAeyQqFsUqpSOzms+afnYE0XwVA+5KYY4iPkBSDoI4ydjqBijElwP7Z3EkzNNWsgsJrt4zvaYNaDOen024C1wQPIVKCsluHTsz2nMs1RdYdttGkLT0GUBxKHtNQujc8iDXpEYRAz3hVTzhsT1ZBBgoezCoXmGmtVZNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785770694; c=relaxed/simple;
	bh=ouJbyH5Hyup+wXyuo+IEC5knLA7HtjIpUKNAafM2lIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cIk6fiipkdhvChrY3wDUy/Rr/YvZzqU7ZfQfIYWmBypHU+nx8M8H3V+p0Y7naIlYzKL0fn504EzJ2zX1KeN+b2PuL7IScS2b9LG+RtSAMcOJB0BJDsFul5KKqQsRnMhxZ1CZ8xYXsQ300k+1+IvOLKNCYXd0S6nRXXstuNfLuTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uIH65V9h; arc=fail smtp.client-ip=40.93.198.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uIH65V9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpDgcixWBApbSgE/VF2PwmblTbVbRqNozjr0tc+rTsuk46Yir/fJVaBib9G1r0zvQbTJYKZImNiD6K6t2DAvIvPF7Uexuz/fSV8D5fTnNJeNKpsY1ypQAhUiD3ypqXdldNqb+VysLb0I1ClksBR4VEC30t4rLfLYHfu9XPI4GR/OlkUd67AaUlxun9VlmuVQjXzfDLnypV0BsOpLKQ6hHDUdwTfJ/lukyreL1M7ZTizZqbJw4RAh3+5r9k1yjYj2kOCkeD458OD/cWLtGrfDA83M4IrPh+kp3c1jGa30deUhAD5bGN5x2X+znsY3Go8x+Ym27F5S8xM0NG9vyPQZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAoJSzvteYF+aZeZDkgli9GL3ySlMKHwUL4V8FktH4E=;
 b=oXAvpWB26QzlVqVmv1szrYxFJWGoEfZ4kwCH90IbldMQyKXP6HeCcPnieCmjVsSX2i+bOH/mGSPWfjTchrcFCsfY3u3g+Dzf4QlrisnSO++/fYrfjZQJoHMpGm6FjsY0wdIhTEKF2zBwz1VP/ZRTRx8FbMuqXBhMF15GJY2vDgJFFt8TvBRSNfOTW+lz2cKPwz+2JxK4WW1j+BGVf6XzLQnxBk7mr/By4otCx4DhAMJnpz3PesNQFLqfiea7dN6GITMLkfM4+SmonoSizAPVE3b/EzDHepHN4YCf1DLEv/dm5UBWhzVZCGoGy3pctAioHXwgTM01jbXpIadv5GoNMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAoJSzvteYF+aZeZDkgli9GL3ySlMKHwUL4V8FktH4E=;
 b=uIH65V9hbgBIWwTJOg45qUxu/tcf/YzwdqlLumGA73B1lv2z1rtUbU9X9CcGcTEr/01SJRq7dtJktKCdm9Y09WxL01wBJl46qUW+Exgy2gh5vV87YIzg+TxaTWsxUNmP6JyJvzEDvcslbquV2GXTHdiZunEu4ff34DpsbSKeWm0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA0PPF316EEACD8.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bcb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 15:24:48 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 15:24:48 +0000
Date: Mon, 3 Aug 2026 11:24:40 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v9 1/7] RAS/AMD/ATL: Always build PRM address translation
 support
Message-ID: <20260803152440.GA923@yaz-khff2.amd.com>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
 <20260730194834.3203601-2-yazen.ghannam@amd.com>
 <20260731235523.GOam0163w6pfMOm9oU@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731235523.GOam0163w6pfMOm9oU@fat_crate.local>
X-ClientProxiedBy: SA9P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::30) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA0PPF316EEACD8:EE_
X-MS-Office365-Filtering-Correlation-Id: afc74fdf-29bb-4463-9e7f-08def1735ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6DGAy1S35QFGM9NDmoR1QB2fsf8dVMBZqUKPlYprxzsq+By0lq5PL5ZkyDrfaa2Nno/OwoqWoDl7HLTguQiJqMLeXG1PA/gCuevUO6wxlegN81jNYb7sI1LeWVtv+jneZm1Nuz2mk0dn18goaon40nNXng9SytkQyC2iYxGa7fMTa4AVXa1W5tFLDQMHnmILo9FSF/gN+NtCX76GMWNhSmhzdXNesFxqFOEYCjKkYhydrC9NjCd5hSU/ecFf+97Y2weIL8TPk9bMY1kuOO20bc3kty2NJpZohzOrqoaKUA4/cacf3TPriybfq6R32d3i+7wHtQPKfKFzZJI8apux2KZ9Rb9t7Dk7Oy/zS8mR6eF9ouBDQevKuVkYhwXrfqWzl6M2wNUr2vI70qZDf/UcgNWIN+EIozROQl3Fd7ikJwkCWrs08Bz0440Q2wsxyFfpiR+fcX7HDXdOygXT939ffA20QzbffbMs3LZ/zR1Dci61XwtErqzf7q2qg+cuO7qQ20NZBGqBCcOv+F0O6G34tSRlwir6sgjIaFlmxbNsL1fiu8RxQ45ukpvfs03Le/UT+52yoHAakJzT38OW9XI199JpzCWihS1P5AC3sWh6n5709mQYEA1d56WYOFk8sYK4Iz+De8Xfcx1Hn77GcHFSSHzJNUbO6OZOP6tAIaub8eQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qPAuX+01sHtx1Q2VnmoTlqA8/B1SXBS43aYlmmT0FoD3BsvVanLzOGmuMxy8?=
 =?us-ascii?Q?MQlDUzkYIJodlakgBvnukjK49xKcY7c+1Rpfk8Q1FBZPlCQRxAZUF7039LGd?=
 =?us-ascii?Q?eB3V+NVFlDk/IOIQYF7PG4MsBd11XetiDTVeO3NTTq97t4l5TT/Vn6bwRns8?=
 =?us-ascii?Q?kVxThlfFMuisZ6NVqcj6Nrjd5lpvhhYC/CafyYadIz7FzVorYs2TgPlAsEIM?=
 =?us-ascii?Q?nPIPpw04KzHcmLs0hsEjSiqI3oEDkYj+t4ljAOnZ5vcMPX6MDHygA+npMOsS?=
 =?us-ascii?Q?nNQeETKMk3TeZE3wFkFwxJw9YfkEHdFMAr5A+jwnN87KKceG7iHS4esRkWWZ?=
 =?us-ascii?Q?zbX6IMbVhowH93zX+d/IinbZm47IhZGVv0ehpM25BDTwW+1AhPIiLe1eo9/U?=
 =?us-ascii?Q?fMtELti+aekQWDhTiTVKMKcbvJLEJmSMQ9wQUic1e+4IIwlZDK+zlS16mZQP?=
 =?us-ascii?Q?EmXeCU8jn2jUioWu3xx9Ep2L9MlqSEPqaCA2BOoVbDbg1w74Yx1kHxEIIpYv?=
 =?us-ascii?Q?5h+dw63ZW13ZBoqvToscqgNSaFiYnRCGVg/QKm3Ho7jWzB+3wYLJuuTCBQX8?=
 =?us-ascii?Q?zg+/A8/EYsEk5TQzOoX8HyWQruUj+yogKDDuYJn39kdOd53fa7pJH5WCC5Fn?=
 =?us-ascii?Q?lma0ZxCh63lHorji7msGrClYMzVl+is1r270Exf3aB8H9ULfJelCAQ0/uEA5?=
 =?us-ascii?Q?5+TLC+Yz5674wmaGLOf3PBKIxWFj3QhvqVUmDnFy5dHQm3DX6btfnffxjTAo?=
 =?us-ascii?Q?Ixh8k8TENKcddhzr2TYYd9niTqsS1u6RBUkCgFAOWN5mrhyPiBhwUteOZGQu?=
 =?us-ascii?Q?5InvXL3zciUdx4IMSGzplcP5YVgIP2UebT0dhUyXpt2EyWflGnadFKKy/iVq?=
 =?us-ascii?Q?ZGSr3SeL1aEQeG4c3zmKfI8bY5Nyy3apTOGPV1giIQ5aJIORZM65JHDliFO7?=
 =?us-ascii?Q?JBvsGBu6oug/DyyL0su6zY1J6sqqJsRdLBGN13PymvpoRISULsAge8hs2FWm?=
 =?us-ascii?Q?Gl8YxdvMPe3f0PsXL1D0Er/5Ptie7KlAnpUEtlVXq+QNjIy6f9Yx3mET2QhA?=
 =?us-ascii?Q?4t9KW39GPK9+gYe8YbpUmoPI2IS2y0//VETcIfkf7HBkp6vFVd1EOjgln9X6?=
 =?us-ascii?Q?GQjIRBsO9X3jMcPf7rAuf3z7aHh/CDV44epZgP3liVVdS7C5NZimgjs+dOc7?=
 =?us-ascii?Q?Brb/tHR9zU6u8/phanf+prH3yQ8ONfKfO7pkcrWEga/2233gqicRb2iMU6tO?=
 =?us-ascii?Q?6lGUSDTQp3TU4wBg1MTuJrBCYr46aaxXKJVM4q3AFdPCmMczxTTBvwFGLlOI?=
 =?us-ascii?Q?c4VoJI5VJ00i3QS9JZVIKbUY7GKronAxPzBu0qvnucaLwNHkGIsuv1pmJ/wZ?=
 =?us-ascii?Q?85xFPq4vHDdPqUcN3Rq7Ca/qKihtOPpnI/ujAkzDt9xmyeIiHPZ5QGNgz53t?=
 =?us-ascii?Q?OGjErTl0zAmrG/7tfEPSSfUDnTUcrPqbUwd4FqqTOtZbdKjcqdKkOYuFAyZn?=
 =?us-ascii?Q?rALGEgb/5lhSBgfFHVkFrwEzDU8JaUD7+5PwBOSKJvXtkzsnufPxIlsCBFHd?=
 =?us-ascii?Q?9swCx2NB/UPnWhrM0j86rUJvPETafW0Vx8o+x06QIPB3zuJX+dauyw9WaVkg?=
 =?us-ascii?Q?Dr2hbRXypJa8IXHWRpDNbH7+0Tzx1ZdhsZAIcS5pXrzKv8FYP5XHVKgWnG6Z?=
 =?us-ascii?Q?+7isIvrjJGCtQBp3NUzMR6eje1Kg3Vds3w5MDAxXgw7IzUWq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afc74fdf-29bb-4463-9e7f-08def1735ab5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 15:24:48.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnnDVwcWD80XSkr3/YLkoIUPScbbQ5R3hYgTRlh86sJZ46uB4NzifDnMXpD5D+Ld2/uk88U2pZUZIdTIPLzkTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF316EEACD8

On Fri, Jul 31, 2026 at 04:55:23PM -0700, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 03:48:28PM -0400, Yazen Ghannam wrote:
> > PRM (Platform Runtime Mechanism) is the only address translation method for
> > current and future AMD systems. The library should therefore always include
> > it.
> > 
> > The PRM helpers in <linux/prmt.h> already provide stubs that return an
> > error when CONFIG_ACPI_PRMT is disabled. This lets prm.c build and link
> > in all configurations. The library then falls back to native translation
> > at runtime when no PRM handler is available.
> > 
> > Drop the CONFIG_AMD_ATL_PRM option. Build prm.o unconditionally and remove
> > the now-unneeded stub for prm_umc_norm_to_sys_addr().
> > 
> > Add -EOPNOTSUPP as "PRM not available". The acpi_call_prm_handler() stub
> > returns this when CONFIG_ACPI_PRMT=n.
> 
> Please tell AI to NOT write what the patch does. :-)

Ha, I try, but I make the same mistake myself. :P

That's probably obvious, because I reviewed the commit message and
signed off on it. :)

> 
> New commit message:
> 
> "RAS/AMD/ATL: Make PRM address translation support builtin
> 
> PRM (Platform Runtime Mechanism) is the only address translation method for
> current and future AMD systems. The library should therefore always include
> it.
> 
> The PRM helpers in <linux/prmt.h> already provide stubs that return an error
> when CONFIG_ACPI_PRMT is disabled. Make prm.c builtin. The library then falls
> back to native translation at runtime when no PRM handler is available."
> 

Looks good to me.

> Yah, looking at prm.c, I'm wondering why we even Kconfigged it. Oh well...

IIRC, it was to be more modular for custom kernel builds. Of course, now
we probably should put the 'native' translation code behind a config
option. There's a lot more of that, and it's only used for legacy
systems.

Thanks,
Yazen
