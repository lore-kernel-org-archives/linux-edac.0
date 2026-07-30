Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453A03BFAD9;
	Thu, 30 Jul 2026 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444962; cv=fail; b=EH/XGCQz3wl9/hqGdkyYCKZqvYCPVPYUjUTXgqa+PT3NZpSO7vwS3U/P2xF1ImqK5hFQ5lJsD5lxr5wBdiTtxxGXDkoW2rGtSgQoiYLXg7iWBRtjoXk8waDzno2Ci/7h1w8SbpTR5QCukmAMjZCypoiq6U1N5deGoYNGxHqseyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444962; c=relaxed/simple;
	bh=8c2+k9fGdGLBhAvADJkI9THo5oVptaCX69jNk59HZZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KuCV8qc+AGemFB033FKwiHd43/RgxoIMIYWz9cm2nNvUjMmGbuN7hsu0xe5oi4fQkAxjZThtZV149CSqryAj37GIRZgzRgJxDJwTPH6sIoBb6JrPBLxvPEetnJJ+OGZtiw+rSWyMeP8cjdQAjvorsdpKNwqMBAsfyugz5pVyNS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QulWwH9u; arc=fail smtp.client-ip=40.93.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QulWwH9u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btOX+vZsWQY2fOcj/HUYFriBFproLutF0DBIeChBamf396zpucMDVuyJ5ZY19IKOc/MeEPy4qW5riKTADbc5pEYSaKXu2MEuSSkoJMcx1wXJM7Dw3meT61fbl7BQWRNlxei5xyuvyUTz3HM17JyxYR2fALXPlktMnrrK28Ybc6w4lRPjgwP35o04ondEOJs9dBqdrRjtRoPAEU18u6HwwxeIF5GlZFQ1uxRmZOnN72kocpmIvjIhL7Uoe+7EPlOT6ZmRaX64LdnXBAwr2yCtMesrJXJKUXMKkvYk8hG6lm6kZNy4GIIn5eXoxi/qp10PbU3d2DihxAimfQNCe82dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr+QMo5Whjwym47d/vMJcPr+wMrulsm4mD+cM9Y3gdw=;
 b=ZxgRrMkeQ6vN1lgf+rcnxFDZ/MPtIJ+OeS2hrkduyF6sN8dBa8mfXtMK8aB1ehJsWmIZzgPvpCboesWh5hPHnLmmmCY/YrA3ghUpf2Iufsx7YHDuTWgXmFzrkNsSAVY9xbrwiV94Anqp85YBVMJDrEG4C1eHphnOJgnD6jOSnkplJ+rqlWjb2kR4UJoUZpeQVYKAhLoJjdZISLvKrRSFWV+IcUi4cpC0rsgcZWwxUDAFw48LyFKsomU8b9H5GKNT+OYh5c+OIVp3PGcWm9Fa0+98ZSsq9YXzBS93ZfeCd1zBz3lhb6aBVgd1CzWlnruKn3ikN8M2HISSYCGvZpcaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wr+QMo5Whjwym47d/vMJcPr+wMrulsm4mD+cM9Y3gdw=;
 b=QulWwH9ub9oTGtSLlCskUw5V7yr08wQtD+O0le57LUIQce/I6iKTRHP+NPO8gNjGapE9X5SRMkjwINGmU5SOkudmscLIsCNUKNQoEmprymlpyO09B8h9vHga2eMYb4Qo9jYPeI8xBpmIPhhosW1UhODFPuWj4R9oLPc1Zo5BtjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 20:55:54 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 20:55:54 +0000
Date: Thu, 30 Jul 2026 16:55:45 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@kernel.org>
Cc: Tony Luck <tony.luck@intel.com>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] EDAC/dummy: Add a dummy EDAC driver
Message-ID: <20260730205545.GA2624247@yaz-khff2.amd.com>
References: <20260707215307.396571-1-bp@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707215307.396571-1-bp@kernel.org>
X-ClientProxiedBy: SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3d9110-4267-4f3b-7c2b-08deee7cf236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|6133799003|56012099006|5023799004|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	420mTz2AzntI9zsPAviTSrgf8eQbB7EbCoP/WD79Q0CN8Ye2X++pn4iB29AP6pIwy/e18/7/Gf1U1ASRMo5QhYewps+fdKiWUNQhVFmcFGBOexDb8/XtwugotY+oifAWm59sCPiwh5Vypor+FVPlygSRnjJtMQicAAi4jLi7FaQvKu4qxI5oYBDX3fOSIWm4LvxUxYNtPmWArKAyOzr7Xx5Z3rgO37gQw+tMADyyV4kVUtpa7K4m6Jqx8+n0HfhInGek49kdAm3wUmqEMbhIBfEMb3gUNRqFeoMtynOynUNST64JFB/7aHkfOufHn5OWW1m4BqnmhDS/CPGCQFIzQUZYBx4Sn500Oem4Ucd1Dn7sajIRQj0LkVK7faE8puDhhcA4QtISx/AmBqehCMJw5XNh4t9qNkpmJpCrUxmflZPdai26t7bu6Zw8oyvINJXxuOIxXo/sksIxj1CY+nezAcrqd6lczsVnWbjLMDAs7C0e8WPaE+7T1QERI2lklBtoSi9wKHInfvWdewzeRwt7jKX3228tFCPqhloZY821eXB4RVvtiF9mdzWpwLmWFYBtXyzvAnSUxxiuAGFd23lH10Ka0cpQ7e8aMFWccbqzyofSogh5Zo1vGnsOfq/4xTz5Tw1wtJUpbUq4FZmeKLak1e2BKUEOY4c3OMuwtEyIsd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/dB+chd7sHj9DyPxWtAFLQJUzvZtYAsn5KPRiDLpJoJ176XPcvqFrRgmf7IO?=
 =?us-ascii?Q?AcHxW3oLx9KOEZmf9iiXWlD0zN699QOvxObcRcMsM14nBag5Q6IwzfGE3+iN?=
 =?us-ascii?Q?cAU0p2fwblNAfQ+K/jPiq+OlA2+S60nXJU5pFdMM9XxRi1nBCJKE4fRWpJ26?=
 =?us-ascii?Q?UZTW4mktkofLZSlYBndcam+RcgYwjg4LnokMb2BS01BKXlsn66PZl9XPb3R7?=
 =?us-ascii?Q?QxNJRYObkoq8afpu7QzryCKOt9w2fx7FB32pwxw5DhdngfkgtD3QNRgP/6Ii?=
 =?us-ascii?Q?mijZr6ohwTA3zYfXNoGRUBp797Kz9n6AgNXr1ulilkXCR647t8tJfmo8jdr/?=
 =?us-ascii?Q?fDy/OlOPlxjFzHKOmrDVTDDdMGM/5bKy6jwR80HLXAHyxxi9+GZ8Yjsw3H5N?=
 =?us-ascii?Q?wXd3wg6BSDQJtjaQw03MNqV21bgaT6Nzwwu+8UXWJzi7MXTLeG/YbSt9N4mk?=
 =?us-ascii?Q?7ucfH4hq76CdpRT1skox3BgVE8e93bHMbrj4FgKJQKVJ46Sih8d2TCE7HdVU?=
 =?us-ascii?Q?r3NiKgphlJXNesA0FWSKl5KHSZYQKq7ncmHvOSUHoafy9WnmBFF3u390Eni0?=
 =?us-ascii?Q?limRlpEbV6+cCp4TOTqdcIEdArlK3ffE3WD0SiikO+FNKwV+akJcwMajl++5?=
 =?us-ascii?Q?RzXwZwcwJ3RPtjK9XC0Gkmk663Edh5R0nyZEki2TA1XO3s/dQ6RT/b18OYX+?=
 =?us-ascii?Q?hjQcjm1BXhP22LHIuYLmbnN/LtFAQpkJGzHNG09caKrloX9NkmFV9zxUAAaj?=
 =?us-ascii?Q?mjI1+kEgqt9sngDG2oUePsju7A4oJm+MoZbPKphdEAQnDV0PrSo295/9cDpU?=
 =?us-ascii?Q?Zzeip7oz1L1pcg5i9VZ9hY76cTUurUlOxxImbCFIyeYvB+aYB/MLj2TFD0Jg?=
 =?us-ascii?Q?ZZ3D+eJ3FRm2IDGEsWralDs4WqDOKZ3oTXPaBSH58vwYdZFr4NMkY9vCLoDE?=
 =?us-ascii?Q?sYaHnQazwnhHRxlF49OwpSGg+67thaCKuzcFfu9+MgoMYNHWjsSIj0l1ozeM?=
 =?us-ascii?Q?1wPY66aGpZmedzwXlh124xbR8zPdWUjsCG6/+/TWqJ4LR5zbGm8cf5Q+Hmi7?=
 =?us-ascii?Q?GHqIZTUtsPfuf7WA5X59skX7bwKPCLahYNPUZWAYh+PCinQ9fDdL9Dlg63n9?=
 =?us-ascii?Q?TMHrPmcPthw7AgxwpN44fkWzlzZ3cydQ8omX2ldyZEOL9TojAvHolG3gQbCM?=
 =?us-ascii?Q?2a0l5UPVaMQFs5P/+pgE0WBgpaW09tR5LIgGwm5ACMuouDFIa8cb8W67pS+Y?=
 =?us-ascii?Q?hvOomQxjirqWz6CqnwPtMJqVupIxPxXHW+Kv6jSVQV+rZ4L/8XA3s8nWdFdK?=
 =?us-ascii?Q?dr2oOOHIIYU9Xd8wtnql+wbCytu+ER8LJMO+IjMdzbUtEsQqyCyMfbEkshJE?=
 =?us-ascii?Q?SToNANBqvnTlJu9uDpqSMXvm0SFm/lnAUnBfPUdlUGAip56G8QdxHHKF4TnF?=
 =?us-ascii?Q?/4nPAPJDpI4/MiBZNSJCwrwMvnSq0GRSZdTNCniyEMJGuFi0QNp5kPgT/Sun?=
 =?us-ascii?Q?tWkDDSWvEBVzdecoiLbvr5JdfqH88BqUb9Ooe7xbHEVxcPf+A58OqlszNBLR?=
 =?us-ascii?Q?8umKvKW8GKR6/nxmng0qzyBN1YI94oi8XGuuf1p6FgPo5Sv8Aa5MdsNiqtMZ?=
 =?us-ascii?Q?bvijs6vpePDqEK4iFpgbT7UIpKhblbd6ZQsQopOHqA1S7tOJbGPIfZLNXLOL?=
 =?us-ascii?Q?m2UTuNSXuJdLAi8rgMSJ75hFLknXRlEz0gDIBdTJDRQKC/+XXVtR4HTg+TP3?=
 =?us-ascii?Q?53akfzPZIQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3d9110-4267-4f3b-7c2b-08deee7cf236
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 20:55:54.3327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zLnMHACIPz+ZUEWtxuYz+BeOYbr/5kfPKqVQhbEVNuZvCHlWda8jdG8LbueCeIDnJp1PYd4pj4GvNthMBWmDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673

On Tue, Jul 07, 2026 at 02:53:07PM -0700, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> A dummy EDAC driver is useful for testing purposes in a VM when one
> doesn't have all the hardware needed to test aspects of the EDAC
> subsystem code.

Is this intended to be a replacement for the "fake_inject" interface?

I like the idea of having a test module, but I think this is too simple.

We really need to cover the 'layers'. IMO, that's where the complexity
lies.

There can be module parameters to describe the layers and their types.

Examples:
 layer0=all
 layer0=channel layer1=slot
 layer0=slot layer1=channel layer2=chip_select

With this, we could test all the permutations of enumerating the EDAC
sysfs interface.

> 
> Assisted-by: Claude:Sonnet-5
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  drivers/edac/Kconfig      |   9 ++
>  drivers/edac/Makefile     |   3 +-
>  drivers/edac/dummy_edac.c | 193 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 204 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/edac/dummy_edac.c
> 
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index a44b85c440ca..a8914baa5f7e 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -581,4 +581,13 @@ config EDAC_VERSALNET
>  	  and other system errors from various IP subsystems like RPU, NOCs,
>  	  HNICX, PL on the AMD Versal NET DDR memory controller.
>  
> +config EDAC_DUMMY
> +	tristate "Dummy EDAC driver"
> +	default n
> +	help
> +	  A dummy EDAC driver is useful for testing purposes in a VM when one
> +	  doesn't have all the hardware needed to test aspects of the EDAC
> +	  subsystem code.

This is verbatim the commit message.

> +
> +	  You definitely wanna say N here.
>  endif # EDAC
> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
> index a37534300ab9..92f8d03dad30 100644
> --- a/drivers/edac/Makefile
> +++ b/drivers/edac/Makefile
> @@ -35,7 +35,7 @@ obj-$(CONFIG_EDAC_I7300)		+= i7300_edac.o
>  obj-$(CONFIG_EDAC_I7CORE)		+= i7core_edac.o
>  obj-$(CONFIG_EDAC_SBRIDGE)		+= sb_edac.o
>  obj-$(CONFIG_EDAC_PND2)			+= pnd2_edac.o
> -obj-$(CONFIG_EDAC_IGEN6)			+= igen6_edac.o
> +obj-$(CONFIG_EDAC_IGEN6)		+= igen6_edac.o

Stray change?

>  obj-$(CONFIG_EDAC_E7XXX)		+= e7xxx_edac.o
>  obj-$(CONFIG_EDAC_E752X)		+= e752x_edac.o
>  obj-$(CONFIG_EDAC_I82875P)		+= i82875p_edac.o
> @@ -91,3 +91,4 @@ obj-$(CONFIG_EDAC_VERSAL)		+= versal_edac.o
>  obj-$(CONFIG_EDAC_LOONGSON)		+= loongson_edac.o
>  obj-$(CONFIG_EDAC_VERSALNET)		+= versalnet_edac.o
>  obj-$(CONFIG_EDAC_CORTEX_A72)		+= a72_edac.o
> +obj-$(CONFIG_EDAC_DUMMY)		+= dummy_edac.o
> diff --git a/drivers/edac/dummy_edac.c b/drivers/edac/dummy_edac.c
> new file mode 100644
> index 000000000000..00b4fee3fc8d
> --- /dev/null
> +++ b/drivers/edac/dummy_edac.c
> @@ -0,0 +1,193 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Dummy EDAC driver
> + *
> + * A minimal EDAC device driver that registers its own platform device
> + * unconditionally, so it probes successfully on any system -- including
> + * VMs and guests that have no real ECC-capable cache/memory hardware
> + * exposed to them. Useful for exercising the EDAC core, sysfs interface,
> + * and userspace tooling (edac-utils, mcelog, etc.) without needing the
> + * physical hardware the "real" drivers depend on.
> + *
> + * Modeled after drivers/edac/a72_edac.c (Cortex A72 EDAC L1/L2 cache
> + * error detection), but with all of the hardware-specific bits (system
> + * register reads, SMP cross-calls, devicetree compatible matching)
> + * replaced by a software-only error source that can be poked from
> + * debugfs or left to generate nothing at all.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/debugfs.h>
> +#include <linux/slab.h>
> +#include <linux/cpu.h>

Subjective preference: order alphabetically

> +
> +#include "edac_module.h"
> +
> +#define DRVNAME		"dummy-edac"
> +#define MESSAGE_SIZE	64
> +
> +/*
> + * Simulated "error syndrome". In real hardware drivers this would be
> + * read out of a per-CPU system/MMIO register. Here userspace (via
> + * debugfs) or nothing at all drives it, which is exactly the point:
> + * the driver has no dependency on any physical error source.

This needs revision.

> + */
> +struct dummy_edac_priv {
> +	struct dentry *debugfs_dir;
> +	/* pending correctable error to report */
> +	atomic_t inject_ce;
> +	/* pending uncorrectable error to report */
> +	atomic_t inject_ue;
> +};

Redundant comments.

> +
> +static void dummy_edac_check(struct edac_device_ctl_info *edac_ctl)
> +{
> +	struct dummy_edac_priv *priv = edac_ctl->pvt_info;
> +	int cpu = raw_smp_processor_id();
> +	char msg[MESSAGE_SIZE];
> +
> +	if (atomic_xchg(&priv->inject_ce, 0)) {
> +		snprintf(msg, MESSAGE_SIZE,
> +			 "simulated correctable error on CPU %d", cpu);
> +		edac_device_handle_ce(edac_ctl, cpu, 0, msg);
> +	}
> +
> +	if (atomic_xchg(&priv->inject_ue, 0)) {
> +		snprintf(msg, MESSAGE_SIZE,
> +			 "simulated uncorrectable error on CPU %d", cpu);
> +		edac_device_handle_ue(edac_ctl, cpu, 0, msg);
> +	}
> +}
> +
> +/*
> + * debugfs knobs so you can drive the driver from userspace inside the
> + * guest, e.g.:
> + *   echo 1 > /sys/kernel/debug/dummy-edac/inject_ce
> + *   echo 1 > /sys/kernel/debug/dummy-edac/inject_ue
> + */
> +static int inject_ce_set(void *data, u64 val)
> +{
> +	struct dummy_edac_priv *priv = data;
> +
> +	if (val)
> +		atomic_set(&priv->inject_ce, 1);
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(inject_ce_fops, NULL, inject_ce_set, "%llu\n");
> +
> +static int inject_ue_set(void *data, u64 val)
> +{
> +	struct dummy_edac_priv *priv = data;
> +
> +	if (val)
> +		atomic_set(&priv->inject_ue, 1);
> +	return 0;
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(inject_ue_fops, NULL, inject_ue_set, "%llu\n");
> +
> +static int dummy_edac_probe(struct platform_device *pdev)
> +{
> +	struct edac_device_ctl_info *edac_ctl;
> +	struct dummy_edac_priv *priv;
> +	struct device *dev = &pdev->dev;
> +	int rc;
> +
> +	edac_ctl = edac_device_alloc_ctl_info(sizeof(*priv), "cpu",
> +					      num_possible_cpus(), "L", 1, 1,
> +					      edac_device_alloc_index());
> +	if (!edac_ctl)
> +		return -ENOMEM;
> +
> +	priv = edac_ctl->pvt_info;
> +	atomic_set(&priv->inject_ce, 0);
> +	atomic_set(&priv->inject_ue, 0);
> +
> +	edac_ctl->edac_check = dummy_edac_check;
> +	edac_ctl->dev = dev;
> +	edac_ctl->mod_name = dev_name(dev);
> +	edac_ctl->dev_name = dev_name(dev);
> +	edac_ctl->ctl_name = DRVNAME;
> +	/* Poll fairly slowly; this is a software source, not real hardware. */
> +	edac_ctl->poll_msec = 1000;
> +	dev_set_drvdata(dev, edac_ctl);
> +
> +	rc = edac_device_add_device(edac_ctl);
> +	if (rc)
> +		goto out_dev;
> +
> +	priv->debugfs_dir = debugfs_create_dir(DRVNAME, NULL);
> +	debugfs_create_file_unsafe("inject_ce", 0200, priv->debugfs_dir,
> +				    priv, &inject_ce_fops);
> +	debugfs_create_file_unsafe("inject_ue", 0200, priv->debugfs_dir,
> +				    priv, &inject_ue_fops);
> +
> +	return 0;
> +
> +out_dev:
> +	edac_device_free_ctl_info(edac_ctl);
> +
> +	return rc;
> +}
> +
> +static void dummy_edac_remove(struct platform_device *pdev)
> +{
> +	struct edac_device_ctl_info *edac_ctl = dev_get_drvdata(&pdev->dev);
> +	struct dummy_edac_priv *priv = edac_ctl->pvt_info;
> +
> +	debugfs_remove_recursive(priv->debugfs_dir);
> +	edac_device_del_device(edac_ctl->dev);
> +	edac_device_free_ctl_info(edac_ctl);
> +}
> +
> +static struct platform_driver dummy_edac_driver = {
> +	.probe = dummy_edac_probe,
> +	.remove = dummy_edac_remove,
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +};
> +
> +/*
> + * No devicetree/ACPI match table, and no scan of CPU nodes for a "compatible"
> + * + enable property: simply register a platform device unconditionally so
> + * probe() always runs. There is nothing here that depends on the underlying
> + * platform actually exposing the corresponding hardware, so it loads fine
> + * under QEMU/KVM, containers-with-a-kernel, or any other guest environment.
> + */
> +static struct platform_device *dummy_pdev;
> +
> +static int __init dummy_edac_driver_init(void)
> +{
> +	int rc;
> +
> +	dummy_pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
> +	if (IS_ERR(dummy_pdev)) {
> +		pr_err(DRVNAME ": failed to register dummy platform device\n");
> +		return PTR_ERR(dummy_pdev);
> +	}
> +
> +	rc = platform_driver_register(&dummy_edac_driver);
> +	if (rc) {
> +		platform_device_unregister(dummy_pdev);
> +		return rc;
> +	}
> +
> +	pr_info("Loading %s\n", DRVNAME);
> +
> +	return 0;
> +}
> +
> +static void __exit dummy_edac_driver_exit(void)
> +{
> +	platform_driver_unregister(&dummy_edac_driver);
> +	platform_device_unregister(dummy_pdev);
> +
> +	pr_info("Removing %s\n", DRVNAME);
> +}
> +
> +module_init(dummy_edac_driver_init);
> +module_exit(dummy_edac_driver_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Dummy EDAC driver for testing without real ECC hardware");
> -- 
> 

Recently, I've been doing an 'interactive review' with the coding
assistant. This is in contrast to the automated reviews that the bots,
et al. are doing.

Basically, once the patch[set] is mostly okay, I have the assistant go
over each patch with me one at a time. It presents the commit message
and each code hunk one at a time. And it must wait for my feedback
before moving on between steps.

I find this approach helps clean up the first draft. And it seems easier
to make minor adjustments as you go along.

Thanks,
Yazen
