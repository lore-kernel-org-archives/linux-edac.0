Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C16A3DA5D6
	for <linux-edac@vger.kernel.org>; Sun, 18 Oct 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364196; cv=pass; b=A1iQ4gqojsZuywxIOUXwn5zk515cjuIiyoKVAzAvg+183/jqkpx0dNXsMlPZmQ4ELQmVX3X4QBuax+Ch8ZY7/H4E0css8I8cl4xRGn1syUlH78TYxfFnVG+lEMr+9cWZpNeov70cNBN82WLsEjnrBB/yf6a6J68+1BRXul4zo0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364196; c=relaxed/simple;
	bh=VOFkIvAigdspmltRsC5BPa5luOWcWKRWs14otyoXgFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDTjh6QqcpPkyaHVpytb6IdR3TegeBNbtKDFuEHKkGeX0h/h9H4UTcgLuHZCcNFHLQjylysi8fH41J8FW6OGSEa8zakAAdnt0GtcHezedLcyxULCz9uXbvcRZMBKPf3PLs4Y8G7QGNAwNHK+ly+YSc64hScv7ZqNjfw5GMdF7Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loErZrPs; arc=pass smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loErZrPs"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-81ba09a5d23so1204306a34.3
        for <linux-edac@vger.kernel.org>; Sun, 18 Oct 2026 15:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792364193; cv=none;
        d=google.com; s=arc-20260327;
        b=BoCy2nHWoxbCI7UmwQFDk0Tp/egnXuwnPRn/CeXLafH8hCOLMIFzxNEgkU+BCpsdjW
         0ye3im36AUivcE1x8/4bP8fXhufXooJ9FkwaDFMuoOVlbuKTmctUP1mYuWhUq/hu6zWe
         vBMthajx/ea//cl+ryIIX1tGrvSQXgzN1aVxoJHH62jgLFRH8v26YbiXsnhT5DsEkb45
         Qc63okthE4E/dO2i7n6LKwEtHftd/dY5rgKqbhNTfiSnn2DEh0ebiRgBEqZny3fK4vwB
         GaCAxFASdwzR46NNG2k89y0FfcPdd4ZtiDuhQPHn69hINt1OZGCnpwfeNMmo2VAFlRMm
         +H9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejS/LpjqoYagtCx8wF4IBCZ5sMYQJivNYsQq5fSIx44=;
        fh=PMm5s1Upq0LX6BZXXhjgFfgzE2ql0kidXmYiWQOccIk=;
        b=FuFJ/NSyz812QvoKJGeQlVK54WRict5YQGHDVc1Pbijl800l6PfxkZTxwSStS1d5in
         CUMkN8aZid0TnuWM0y4poc6ICN0vzMKJnNBQg9a4PQIDxmJo1AUuJzsF0e+cu5poEX4C
         /fQkBDW2FAa8ZzT9atePZ2nB9wcGkZD7feGMmUk46V69zawAlNC9+8uuQrZrIp3iEUiT
         au+RreyRrgJ0w1TLMDa8d0gFIkNfrsIt5U1bMcjUziD8d04j4m84yI46on6KQ+7MlEEi
         c2DHItD9JUwiNXMAfMNFxsRAI4gS4VCPlELTJBdeASdP/5riVeCuU2pzc6dKxtqlqT1s
         wrzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364193; x=1792968993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejS/LpjqoYagtCx8wF4IBCZ5sMYQJivNYsQq5fSIx44=;
        b=loErZrPsVxfxTvLN3UWmgTs8Wtm6cLLzrYo6DywA4QFZniisWD9tcisU9w6WB23bVC
         XzRBNaWKDnmSg/rWBmzWe9W9urGOPIBIGq6gWH5t2wn43VQ/bRjsMqRGokNzRa0h97Yc
         IYx3BNEiElmqZuNM5Vo31V4W9Uq/mHPHFVIK4gxseI2QTfq8z6JPlR32XmvGiHxonzdt
         tiQz1PFgfw6dzDm99MosMlh9k7BCsQXxjToyYaMGxdm5DN07XLDy6ruljYKo8lc1dvdo
         VJ1lA5Z+dC6C+e8DPOEehRZTcLc/3y59ZzwLH7oJSEmqai/mrWVo/ASj/HXi6uI4II2F
         0gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364193; x=1792968993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejS/LpjqoYagtCx8wF4IBCZ5sMYQJivNYsQq5fSIx44=;
        b=EjoK3TGxF0xAO+Cf4qFIXbFz3KOLi/yZpXV+1CLtGBAWD+xgfuVt8mffrJrmrRE10A
         l1he5NQokk5RQg/6T3z04jpBIyJAlzyk7sXTGhADyxgUOwXW0GD/oa5SQTyD3KOzysTx
         tEVWHMBmmPQJjvkdnR6A4bASLFxoPpniOCA5tHfwTv2xXOzT7kCDysmXpwPW6bsExCn7
         cTK/GHOGDIY3C+V8w1IcCuNpB8Hw16Z1Lsz0i/VsIW3l5nSqu1VPRFunzQcskGZsDWz5
         6rL9V4OeFcr5j2tvYUkEjb9jgP+xdy586+velIU4Dvjm31ByaaWb9p6vOsRR/dyICp7V
         IB1w==
X-Forwarded-Encrypted: i=1; AKwUvBzw8ScGsfCaB+VcNPgQlQlZhyHFkH2F3adKg2v7ETeEpKre60wFzdEFInjJXuGALhYm/OupF3RcQ+d4@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9QAOgtvMmIhDKtWURsppm7aNwZSk3M3Mf+L4BHvOyC4ylFXHJ
	6AqJyjJDOPKTxEqPTV4qy7AVRT/F0Wu6rYH2wodj7M5iU7gkj306KQ96iMfvt1VMnAVxd1dfEww
	ONtl5GPRyzcLQnWTnRdnsLhEq0rF4oHA=
X-Gm-Gg: AYBFou0c8J5rGJrzFcs0B6xg+uq5KGJFtOVwhuKQxY4cnzHtk7Kx1sn0PkMTU1NcA+b
	KWHqdtd531dQwEHHIC7/rFdv14/8yBbqk4lg1mgQsmfb6cEE5KNv4JttT74DxHy3se7xQQp7dzP
	Mqrgc4sni7+FtFe0kr6kjR43WEmCeTYdtOyDdCOQI6udEfkcst4zEOc6dPC7Re8RmOLk0xWk7SM
	bvBEfvV3z0zrVPaLe3iMFEULYKSfdLxK6ZlaqqqtqUbdX/6C9KIyFni0FMzXpSeQoAoyG2jXbyE
	Neg34vJNiVPlWpVWT7BO3keFdHmJ5YW0Y+KhULtnu5SnBLvmEji4it8=
X-Received: by 2002:a05:6830:4128:b0:81d:8057:9b7f with SMTP id
 46e09a7af769-84500f4d898mr5770027a34.28.1792364193081; Sun, 18 Oct 2026
 15:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com> <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
In-Reply-To: <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sun, 18 Oct 2026 23:56:22 +0100
X-Gm-Features: AclHuK-FL-g-dxxplQ9WjTqpUo6LUA2zDPurgO-FQV-GA5RtzvuribE1sLlFWfg
Message-ID: <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 6:59=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Sun, Jul 26, 2026 at 10:28:12PM +0100, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > ACPI 6.5 Specification, section 5.2.21, defined RAS2 feature table (RAS=
2).
> > Driver adds support for RAS2 feature table, which provides interfaces f=
or
> > platform RAS features, e.g., for HW-based memory scrubbing, and logical=
 to
> > PA translation service. RAS2 uses PCC channel subspace for communicatin=
g
> > with the ACPI compliant HW platform.
> >
> > ACPI RAS2 auxiliary driver for the memory features binds to the auxilia=
ry
> > device, which is added by the RAS2 table parser in the ACPI RAS2 driver=
.
> >
> > Given the address range provided to the userspace may be the lowest scr=
ub
> > address range in the presence of disjoint address ranges, skipping addr=
ess
> > ranges that are from other NUMA nodes but happen to lie within this ran=
ge.
> >
> > Driver retrieves the PA range of the NUMA domain and use it as the
> > 'Requested Address Range', when send RAS2 command GET_PATROL_PARAMETERS
> > to get parameters that apply to all addresses in the NUMA domain.
> >
> > Device with ACPI RAS2 scrub feature registers with EDAC device driver,
> > which retrieves the scrub descriptor from EDAC scrub and exposes
> > the scrub control attributes for RAS2 scrub instance to userspace in
> > /sys/bus/edac/devices/acpi_ras_memX/scrub0/.
> >
> > Add 'enable_demand' attribute to the EDAC scrub interface to start/stop
> > the demand scrub, which is used in the RAS2 demand scrub control.
> > When a demand scrub is started, any background scrub currently in progr=
ess
> > will be stopped and then automatically restarted at the beginning when =
the
> > demand scrub has completed.
> >
> > Co-developed-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Jonathan Cameron <jic23@kernel.org>
> > Tested-by: Daniel Ferguson <danielf@os.amperecomputing.com>
> > Signed-off-by: Shiju Jose <shijujose2008@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-edac-scrub |  20 +-
> >  Documentation/edac/scrub.rst               |  70 +++
> >  drivers/edac/scrub.c                       |  12 +
> >  drivers/ras/Kconfig                        |  13 +
> >  drivers/ras/Makefile                       |   1 +
> >  drivers/ras/acpi_ras2.c                    | 624 +++++++++++++++++++++
> >  include/acpi/ras2.h                        |  29 +
> >  include/linux/edac.h                       |   4 +
> >  8 files changed, 768 insertions(+), 5 deletions(-)
> >  create mode 100644 drivers/ras/acpi_ras2.c
>
> Was this supposed to build on x86?
>
> drivers/ras/acpi_ras2.c: In function =E2=80=98ras2_update_patrol_scrub_pa=
rams_cache=E2=80=99:
> drivers/ras/acpi_ras2.c:68:9: error: implicit declaration of function =E2=
=80=98iowrite64=E2=80=99; did you mean =E2=80=98iowrite32=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
>    68 |         iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_ran=
ge[0]);
>       |         ^~~~~~~~~
>       |         iowrite32
> drivers/ras/acpi_ras2.c:99:34: error: implicit declaration of function =
=E2=80=98ioread64=E2=80=99; did you mean =E2=80=98ioread32=E2=80=99? [-Werr=
or=3Dimplicit-function-declaration]
>    99 |                 ras2_ctx->base =3D ioread64(&ps_sm->params.actl_a=
ddr_range[0]);
>       |                                  ^~~~~~~~
>       |                                  ioread32
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:290: drivers/ras/acpi_ras2.o] Error =
1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:551: drivers/ras] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
> .config attached.

Hi Boris,

I have got an arm64 setup only, did not try to build for X86 recently
after adding the following change
of using iowrite64 and ioread64 as suggested by
https://sashiko.dev/#/patchset/20260325165714.294-1-shiju.jose%40huawei.com

Following change is required to build for X86_64 build when using
iowrite64 and ioread64, while it was
fine for the ARM64 build.
Note: I'm not sure whether RAS2 is needed for the 32 bit build or not
and the result of the 32 bit build.

diff --git a/drivers/ras/acpi_ras2.c b/drivers/ras/acpi_ras2.c
index 51adfcddfa99..cb389ae6a3fa 100644
--- a/drivers/ras/acpi_ras2.c
+++ b/drivers/ras/acpi_ras2.c
@@ -12,6 +12,7 @@
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/edac.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kthread.h>
 #include <linux/platform_device.h>
 #include <acpi/ras2.h>

Thanks,
Shiju

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
