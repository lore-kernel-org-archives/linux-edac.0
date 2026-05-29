Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BCB23E324;
	Fri, 29 May 2026 02:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780021909; cv=none; b=lSoohDm0YSLYHnujP2wGYKdP2Lk6yBPCQkEwzZSYBtW8e1YgxfrjUWE1jqi5+407UW6WsY1zsvsxtY0Ux8R1rrT+PcfPgg1CqJWs62QNMaC4EGlL095iFvDEw+XrbJdih/hPEnRdbyPnmTByCv6AnG7jeZ47y8jbRotqiTkBPMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780021909; c=relaxed/simple;
	bh=IpzqA3ttmo+1QBf+rCniC7qrTbU2mqbQNXrWy9O9m0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOpT1yyCrPMJhXHLVtWyUB5eQnjqFF32MQ2eQ5QeLUAMFHli2/6uA9+YO9kICUgYzHgGbM7CYE+0toW1ni3R5ZtMSrZ6djGBJPWnAM4anD1ouN9298WvxK2JKNdH9GGNIxCGyuiu+lMgXnbsualRptpwcVrKg8jKXuNLa75K3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V8kHJn5w; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V8kHJn5w"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7AE9440E0032;
	Fri, 29 May 2026 02:31:45 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ZMPMM35tKfYF; Fri, 29 May 2026 02:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780021894; bh=X04lhcUerzs1zGj6CwtaeCHv8cupfCS7xJIGSHR7iw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8kHJn5wYYEUsb+EfRZbOvYazhH//1idPO3ZS5wc7rTQkrnTGMqFCf+1ezCYtJrE7
	 h6hP27uVu6lIpHF7Z5OQPDZGtq+l9P08bHWSviKoM3SrbUI0phj7uwNZVp2frwFFgn
	 EQ6tEEA5pnm41wxEiN5bhUPQViS7StZv3MZJmjJoFtvHTUZpbNBEldOebeqXqApyjO
	 +GhifakjqFbTw0PMaS8Ly19wfSb4GcV8ZiZ1eP6MExXMbxFrxifefxPB84XByxjuTv
	 u2Mg8BTMbfKHllw7LMndAzkXFdLijEqZEkdGAaCZP0ZyJACbDNDpCWVqGxpPkG3QIK
	 uCZ7bXyjJxFvIc9QZNa/63wIIdK6SW4LLXUs+/s5yw+bKbEUaBVpe2U0Vg2iCTeE/J
	 eJJi8oL7F+DtPTPYSTCPs080rAex1cDX7+5XYIBDHe9verQJMRYO2YgT8BtdmM/DcY
	 Qox8Ggp6oXdRSkyZYY1ptKGnbMp42QbkY0aaN7l6+doBU3NIv+hOKahiwpS6EYLnXY
	 Dwsl1u7MDwQkG4QdgN6fIc6ELsfefPk3943riFU/bVHAZ1SHC8E1ON/CgXcLT8x28o
	 zdY1sruY1IJ3U+X0mHt35dVg39GW/nPROEKCaW4cULDZOPwmfUgmkK4x4vwnp++8j4
	 LN+9aSWwuNqJS3K90MmVsPtU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 375B240E016D;
	Fri, 29 May 2026 02:31:29 +0000 (UTC)
Date: Thu, 28 May 2026 19:31:20 -0700
From: Borislav Petkov <bp@alien8.de>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/11] ras/amd/atl: Add Hygon DF1 Data Fabric
 system information helper
Message-ID: <20260529023120.GAahj6eAQunnVndQdz@fat_crate.local>
References: <20260528035246.526012-1-shiaichun@open-hieco.net>
 <20260528035246.526012-2-shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528035246.526012-2-shiaichun@open-hieco.net>

On Thu, May 28, 2026 at 11:52:35AM +0800, Aichun Shi wrote:
> Add Hygon Family 0x18 model 0x4/0x5 (Hygon DF1) support as the start.
> Add Hygon DF1 Data Fabric system information that Hygon address
> translation function depends on later.
> Prepare hygon_get_df_system_info() to be called by amd_atl_init() later.
> 
> - Add is_hygon_f18h() as a static inline bool in internal.h, checking
>   both X86_VENDOR_HYGON and x86 family 0x18, with a TODO noting it will
>   move to <asm/hygon/node.h> in Hygon Node RFC next version.
> - Add hygon/reg_fields.h for Hygon-specific register field definitions
>   with Hygon DF1 System Fabric ID Mask defined first.
> - Add hygon/system.c for Hygon-specific implementation similar to
>   system.c for AMD.
> - Add HYGON_DF1 to enum df_revisions in internal.h.
> - Add hygon_determine_df_rev() to detect Hygon DF revision, guarded by
>   is_hygon_f18h(); use hygon_f18h_model_in_range(0x4, 0x5) to identify DF1.
> - Use get_dram_hole_base() and dump_df_cfg() shared from system.c and
>   exported in internal.h to avoid duplicate code.
> - Build hygon/system.c from the Makefile as an amd_atl object.

All your changelogs to each patch come...

> 
> Signed-off-by: Aichun Shi <shiaichun@open-hieco.net>
> ---

<--- ... here, under the "---".

>  drivers/ras/amd/atl/Makefile           |  2 +
>  drivers/ras/amd/atl/hygon/reg_fields.h | 60 ++++++++++++++++++++
>  drivers/ras/amd/atl/hygon/system.c     | 76 ++++++++++++++++++++++++++
>  drivers/ras/amd/atl/internal.h         | 18 ++++++
>  drivers/ras/amd/atl/system.c           |  4 +-
>  5 files changed, 158 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/ras/amd/atl/hygon/reg_fields.h
>  create mode 100644 drivers/ras/amd/atl/hygon/system.c
> 
> diff --git a/drivers/ras/amd/atl/Makefile b/drivers/ras/amd/atl/Makefile
> index b56892c0c0d9..3716fe068eb6 100644
> --- a/drivers/ras/amd/atl/Makefile
> +++ b/drivers/ras/amd/atl/Makefile
> @@ -15,6 +15,8 @@ amd_atl-y		+= map.o
>  amd_atl-y		+= system.o
>  amd_atl-y		+= umc.o
>  
> +amd_atl-y		+= hygon/system.o
> +
>  amd_atl-$(CONFIG_AMD_ATL_PRM) += prm.o
>  
>  obj-$(CONFIG_AMD_ATL)	+= amd_atl.o
> diff --git a/drivers/ras/amd/atl/hygon/reg_fields.h b/drivers/ras/amd/atl/hygon/reg_fields.h
> new file mode 100644
> index 000000000000..b669049c46e5
> --- /dev/null
> +++ b/drivers/ras/amd/atl/hygon/reg_fields.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Address Translation Library (for hygon)

So it is Hygon address translation library?

> + *
> + * reg_fields.h : Register field definitions for Hygon
> + *
> + * Author: Aichun Shi <shiaichun@open-hieco.net>

For all those files you've copied from the AMD ATL, you made yourself the
author without even mentioning that you've copied them and adjusted them to
Hygon. Not good.

...

> diff --git a/drivers/ras/amd/atl/hygon/system.c b/drivers/ras/amd/atl/hygon/system.c
> new file mode 100644
> index 000000000000..bff577a559ad
> --- /dev/null
> +++ b/drivers/ras/amd/atl/hygon/system.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD Address Translation Library (for hygon)
> + *
> + * system.c : Functions to read and save system-wide data for Hygon
> + *
> + * Author: Aichun Shi <shiaichun@open-hieco.net>
> + */
> +
> +#include "../internal.h"
> +
> +static void hygon_df_get_masks_shifts(u32 mask0)

All static functions don't need a "hygon_" prefix.

> +{
> +	switch (df_cfg.rev) {
> +	case HYGON_DF1:
> +		df_cfg.socket_id_shift = FIELD_GET(HYGON_DF1_SOCKET_ID_SHIFT, mask0);
> +		df_cfg.socket_id_mask = FIELD_GET(HYGON_DF1_SOCKET_ID_MASK, mask0);
> +		df_cfg.die_id_shift = FIELD_GET(HYGON_DF1_DIE_ID_SHIFT, mask0);
> +		df_cfg.die_id_mask = FIELD_GET(HYGON_DF1_DIE_ID_MASK, mask0);
> +		break;
> +	default:
> +		atl_debug_on_bad_df_rev();
> +		return;
> +	}

That's basically a clumsy if-else.

> +}

And why is this a separate function?

> +
> +static int hygon_determine_df_rev(void)
> +{
> +	u32 fabric_id_mask0;
> +
> +	if (!is_hygon_f18h())
> +		return -EINVAL;
> +
> +	if (hygon_f18h_model_in_range(0x4, 0x5))

What is that?

Please tone down the silly helpers.

> +		df_cfg.rev = HYGON_DF1;
> +
> +	/* Read D18F1x208 (SystemFabricIdMask). */

Redundant comment.

> +	if (df_indirect_read_broadcast(0, 1, 0x208, &fabric_id_mask0))
> +		return -EINVAL;
> +
> +	hygon_df_get_masks_shifts(fabric_id_mask0);


> +
> +	return 0;
> +}
> +
> +static void hygon_get_num_maps(void)
> +{
> +	switch (df_cfg.rev) {
> +	case HYGON_DF1:
> +		df_cfg.num_coh_st_maps	= 2;
> +		break;
> +	default:
> +		atl_debug_on_bad_df_rev();
> +	}

That's a very silly way to write if-else. And why is this a separate function?

> +}
> +
> +int hygon_get_df_system_info(void)
> +{
> +	int ret;
> +
> +	ret = hygon_determine_df_rev();
> +	if (ret) {
> +		pr_warn("Failed to determine DF Revision");
> +		df_cfg.rev = UNKNOWN;
> +		return ret;
> +	}
> +
> +	hygon_get_num_maps();
> +
> +	if (get_dram_hole_base())
> +		pr_warn("Failed to read DRAM hole base");
> +
> +	dump_df_cfg();
> +
> +	return 0;
> +}
> diff --git a/drivers/ras/amd/atl/internal.h b/drivers/ras/amd/atl/internal.h
> index 82a56d9c2be1..56008238c220 100644
> --- a/drivers/ras/amd/atl/internal.h
> +++ b/drivers/ras/amd/atl/internal.h
> @@ -19,8 +19,11 @@
>  
>  #include <asm/amd/nb.h>
>  #include <asm/amd/node.h>
> +#include <asm/hygon/node.h>
> +#include <linux/processor.h>
>  
>  #include "reg_fields.h"
> +#include "hygon/reg_fields.h"
>  
>  #undef pr_fmt
>  #define pr_fmt(fmt) "amd_atl: " fmt
> @@ -40,8 +43,18 @@
>  
>  #define INVALID_SPA ~0ULL
>  
> +/*
> + * TODO: Will move to <asm/hygon/node.h> in Hygon Node RFC next version.
> + */
> +static inline bool is_hygon_f18h(void)
> +{
> +	return boot_cpu_data.x86_vendor == X86_VENDOR_HYGON &&
> +	       boot_cpu_data.x86 == 0x18;
> +}

No, get rid of that silly helper.

> +
>  enum df_revisions {
>  	UNKNOWN,
> +	HYGON_DF1,
>  	DF2,
>  	DF3,
>  	DF3p5,

In file included from drivers/ras/amd/atl/access.c:13:
drivers/ras/amd/atl/internal.h:22:10: fatal error: asm/hygon/node.h: No such file or directory
   22 | #include <asm/hygon/node.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [scripts/Makefile.build:289: drivers/ras/amd/atl/access.o] Error 1
make[4]: *** [scripts/Makefile.build:548: drivers/ras/amd/atl] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/ras] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/amd/kernel/linux/Makefile:2143: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Building using config allmodconfig
Executing [tssh amd4 cd $HOME/kernel/linux && cat w.log]... 
In file included from drivers/ras/amd/atl/access.c:13:
drivers/ras/amd/atl/internal.h:22:10: fatal error: asm/hygon/node.h: No such file or directory
   22 | #include <asm/hygon/node.h>
      |          ^~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [scripts/Makefile.build:289: drivers/ras/amd/atl/access.o] Error 1
make[4]: *** [scripts/Makefile.build:548: drivers/ras/amd/atl] Error 2
make[3]: *** [scripts/Makefile.build:548: drivers/ras] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:548: drivers] Error 2
make[1]: *** [/home/amd/kernel/linux/Makefile:2143: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Now, for your next submission, make sure that *every* single patch of yours
builds because we cannot break bisection.

Also, apply the above comments to the rest of your patchset.

Make sure you test it properly.

Then I'll look at your next submission.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
