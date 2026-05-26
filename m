Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A293CC30F
	for <linux-edac@vger.kernel.org>; Tue, 26 May 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779786331; cv=none; b=pZjmnKqoavvQ1OUzEIUYblv1/1xE5XgO4T66zBmVHTgF90/IRCLYXYBA36280wLv1rYRtw3E/2cS5T97wrMpMmJ8+iAXJBtuNjCihUDQ+Nzzl6qS5yXOQHbpJimRYPtNmo48xrVX+ucPQzsP9Rl566LY1rNzmxEOSw5RtSUwcKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779786331; c=relaxed/simple;
	bh=Uso13cRvET3dK4hCuVG93kj+SaS/kvlMbi0QdfBZ4Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eE359Mg52fiJXo7Qt5Eh7WiHaZJZhpsTc+TWI7/w559kwzjlbwhznw9ZScu8obaiLAewfma/RQkZBsxHkBLBKqAyZVkfFqVFZtW8bXhBgN163ABWwWOwOsmvA4RUPnhf9VsAQ5RTvle9q4XXJCCE6i4qi5eujA6lw70itcznv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CPmuQe0W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CPmuQe0W"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490426d72f7so36199175e9.3
        for <linux-edac@vger.kernel.org>; Tue, 26 May 2026 02:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779786327; x=1780391127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6hkZLCJqZEIf6tdb1l6pwCjdZtpTbadIJQ5Xmwq8XU=;
        b=CPmuQe0WxjbV9qOv1+00ISM1AMVNNLZeg714bDXt2fYIPAjgsh18j5O1OlkgzKD6kL
         fRsxsPiC7THg+A1AV7NWmhZG2Zrrv0PbIzYjGxm6KY0EsAMrAjGOQ7doGkz7fH+gMNki
         n/ojz2Ym9/SOlcVMO0BksXTQMg8hpuSwQajZxNib8upwYBmem0Ft3kC8/rQtflMGjZBW
         qXCXY9bYNViPMLI9a5uwOJs1RdBBoxHZP7o888Z+XyYmnHFLjnPttdC0USHYiDlNswKF
         QWQ474oHoUjyrmJDPTibMzchjXCmvlhAYRRnHPQLXHgcuHqtZDH884NOVneaVPpZGjze
         j5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779786327; x=1780391127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6hkZLCJqZEIf6tdb1l6pwCjdZtpTbadIJQ5Xmwq8XU=;
        b=owAaLAVJb3F/werlwiU+1rkEnAabT3Pg2RNiwyTtY++SjC12zU7SlnkJ8Q9j14yvUO
         CD1gILkLNAUCPDiOf879pll+EdcoKzT94RyeEXFxe2yZrHzQ8MCoxtqktwV9RtF1Vybz
         nHzhhXTOPam3o8FCA/TfA/b5ZoB0+96eDY+jL6Tgu1iv7rp4adsnzwYM5zHlRm7yNWke
         lVIykegbHW9H7oTFhiB3qBT6o50Il+98KsXIMDIzZvblEqMEpWc9TS1JfJ8dNzszMuya
         xs6IMa4lgZOGo4WTbGGaKmrNXbEgaqyHUBJ4TXazO7U12VQLAq3OXu6lF+uqWcHOeLkZ
         QGcw==
X-Forwarded-Encrypted: i=1; AFNElJ+ayVxyuY5gtji5KVl7aQRNSjGuvFx77+aPYgA9vQzh3c0seb7jxJUe4XjNeQB8KejxUz07LAB3Nn9P@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdz8WEfj/xWPyBY1zVlYjbSRvwaSXT7zUwWzBQ7H4cRIL+CPWG
	XziYlXTSjUNNunek0XCa/+cceTzNFPIM4dBYIDK2nmxG1lv6gbYN35q9Q3qck9bSEK8=
X-Gm-Gg: Acq92OFDJyL6+NiV5oa3EofxRec6F7Qg3thUOWM0sYYcINDktW6DcG2XzxhNV+F+j3M
	UCVF9WuNuRWf/UPppNKvWDIbp47uqSJhozr4tC5P0uc86g7YvsCaAfPVIg+GpCM+oH64RnSEqEg
	rlTduoTn2ICxXv39t2GC4U8Fg0RBKCGAs9hfqzWMXcDmygUmFFhP1rrUnWf/tMm3bv4GtXJAvO2
	G19lC/gNO5E0ak9d/js0nfw+EfIpUzMRkccW/rahpoBxTFEnfDAq81rSQf5hA8v490DTlkugl83
	MUzH3hJLwy7hwY88zPxpyqQAK5zihnpHxWobzBQMH/u+TAtPDXxiuwm+tyVQfVFoaY6x2WBmhMd
	SWq1GOF0xTSs145XdPBK690WADGyy+khCj5Jn13t3fgBa6WEgsYRGY2QHHkqFJ9bNVyLmI9MTkc
	aecWumpk8vdezgPIpcgqhTCYqPm6dS9dmvL1CeAzloqGHxYO+VlwrhtsBMpCN/NgMNS8tQj+GqA
	FgYiv9V39/OZg==
X-Received: by 2002:a05:600d:6450:20b0:48f:e245:394e with SMTP id 5b1f17b1804b1-490426dd0f7mr202300005e9.27.1779786326436;
        Tue, 26 May 2026 02:05:26 -0700 (PDT)
Received: from localhost (p200300f65f47db047ec792ae18ec05cd.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7ec7:92ae:18ec:5cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490424b5b80sm148128445e9.6.2026.05.26.02.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:05:25 -0700 (PDT)
Date: Tue, 26 May 2026 11:05:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Mark Gross <markgross@kernel.org>, 
	"Arvind R." <arvino55@gmail.com>, Jason Baron <jbaron@akamai.com>, 
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] edac: Consistently define pci_device_ids using named
 initializers
Message-ID: <ahVgsnn--IRyQDRv@monoceros>
References: <20260429152513.3755034-2-u.kleine-koenig@baylibre.com>
 <20260524211305.GBahNp4fVVbGeibGXj@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2jinotj74zoook5"
Content-Disposition: inline
In-Reply-To: <20260524211305.GBahNp4fVVbGeibGXj@fat_crate.local>


--c2jinotj74zoook5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] edac: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0

Hello Boris,

On Sun, May 24, 2026 at 02:13:05PM -0700, Borislav Petkov wrote:
> On Wed, Apr 29, 2026 at 05:25:13PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > ... and PCI device helpers.
> >=20
> > The various struct pci_device_id arrays were initialized mostly by one
> > of the PCI_DEVICE macros and then list expressions. The latter isn't
> > easily readable if you're not into PCI. Using named initializers is more
> > explicit and thus easier to parse.
> >=20
> > Also use PCI_DEVICE* helper macros to assign .vendor, .device,
> > .subvendor and .subdevice where appropriate and skip explicit
> > assignments of 0 (which the compiler takes care of).
> >=20
> > The secret plan is to make struct pci_device_id::driver_data an
> > anonymous union (similar to
> > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/)
> > and that requires named initializers. But it's also a nice cleanup on
> > its own.
> >=20
> > This change doesn't introduce changes to the compiled pci_device_id
> > arrays. Tested on x86 and arm64.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@ba=
ylibre.com>
> > ---
> > Hello,
> >=20
> > the mentioned follow-up quest allows to do
> >=20
> > 	-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data=
 =3D (kernel_ulong_t)&snb_cfg },
> > 	+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data=
_ptr =3D &snb_cfg },
> >=20
> > which gets rid of a bunch of casts and so brings a little bit more type
> > safety. This patch is a preparation for that.
> >=20
> > I assume a single patch for all of drivers/edac is fine. If not I can
> > split per driver.
> >=20
> > Best regards
> > Uwe
> >=20
> >  drivers/edac/amd76x_edac.c  |  16 ++---
> >  drivers/edac/e752x_edac.c   |  28 ++++----
> >  drivers/edac/e7xxx_edac.c   |  28 ++++----
> >  drivers/edac/edac_mc.h      |   4 +-
> >  drivers/edac/i3000_edac.c   |  10 +--
> >  drivers/edac/i3200_edac.c   |  10 +--
> >  drivers/edac/i82860_edac.c  |  10 +--
> >  drivers/edac/i82875p_edac.c |  12 ++--
> >  drivers/edac/i82975x_edac.c |  11 ++-
> >  drivers/edac/ie31200_edac.c |  86 ++++++++++++------------
> >  drivers/edac/igen6_edac.c   | 130 ++++++++++++++++++------------------
> >  drivers/edac/x38_edac.c     |  10 +--
> >  12 files changed, 177 insertions(+), 178 deletions(-)
>=20
> Applied, thanks.

Thanks. I don't see the commit in next but notice that it would conflict
with commit e80baec7a692 ("EDAC/igen6: Add one Intel Panther Lake-H SoC
support") and 1c564ef55f0a ("EDAC/igen6: Fix memory topology parsing for
Panther Lake-H SoCs") from the tree at
https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
edac-for-next.

FTR: My merge resolution looks as follows:

diff --cc drivers/edac/igen6_edac.c
index 3ae0a1ec2d54,f3e53d63eb54..000000000000
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@@ -638,71 -800,72 +800,72 @@@ static struct res_config wcl_cfg =3D=20
  };
 =20
  static struct pci_device_id igen6_pci_tbl[] =3D {
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU5), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU6), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU7), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU8), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU9), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU10), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU11), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU12), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU13), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU14), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_EHL_SKU15), (kernel_ulong_t)&ehl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ICL_SKU8), (kernel_ulong_t)&icl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ICL_SKU10), (kernel_ulong_t)&icl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ICL_SKU11), (kernel_ulong_t)&icl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ICL_SKU12), (kernel_ulong_t)&icl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_TGL_SKU), (kernel_ulong_t)&tgl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_SKU1), (kernel_ulong_t)&adl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_SKU2), (kernel_ulong_t)&adl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_SKU3), (kernel_ulong_t)&adl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_SKU4), (kernel_ulong_t)&adl_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), (kernel_ulong_t)&adl_n_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), (kernel_ulong_t)&rpl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), (kernel_ulong_t)&rpl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), (kernel_ulong_t)&rpl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), (kernel_ulong_t)&rpl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), (kernel_ulong_t)&rpl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU1), (kernel_ulong_t)&mtl_ps_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU2), (kernel_ulong_t)&mtl_ps_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU3), (kernel_ulong_t)&mtl_ps_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU4), (kernel_ulong_t)&mtl_ps_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU1), (kernel_ulong_t)&mtl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU2), (kernel_ulong_t)&mtl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU3), (kernel_ulong_t)&mtl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), (kernel_ulong_t)&mtl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), (kernel_ulong_t)&mtl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), (kernel_ulong_t)&mtl_p_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), (kernel_ulong_t)&ptl_h_cfg },
 -	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), (kernel_ulong_t)&wcl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU5), .driver_data =3D (kernel_ulong_t)&eh=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU6), .driver_data =3D (kernel_ulong_t)&eh=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU7), .driver_data =3D (kernel_ulong_t)&eh=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU8), .driver_data =3D (kernel_ulong_t)&eh=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU9), .driver_data =3D (kernel_ulong_t)&eh=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU10), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU11), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU12), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU13), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU14), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_EHL_SKU15), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ICL_SKU8), .driver_data =3D (kernel_ulong_t)&ic=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ICL_SKU10), .driver_data =3D (kernel_ulong_t)&i=
cl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ICL_SKU11), .driver_data =3D (kernel_ulong_t)&i=
cl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ICL_SKU12), .driver_data =3D (kernel_ulong_t)&i=
cl_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_TGL_SKU), .driver_data =3D (kernel_ulong_t)&tgl=
_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_SKU1), .driver_data =3D (kernel_ulong_t)&ad=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_SKU2), .driver_data =3D (kernel_ulong_t)&ad=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_SKU3), .driver_data =3D (kernel_ulong_t)&ad=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_SKU4), .driver_data =3D (kernel_ulong_t)&ad=
l_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), .driver_data =3D (kernel_ulong_t)&=
adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), .driver_data =3D (kernel_ulong_t)&ad=
l_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), .driver_data =3D (kernel_ulong_t)&ad=
l_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), .driver_data =3D (kernel_ulong_t)&ad=
l_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), .driver_data =3D (kernel_ulong_t)&ad=
l_n_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), .driver_data =3D (kernel_ulong_t)&=
rpl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), .driver_data =3D (kernel_ulong_t)&=
rpl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), .driver_data =3D (kernel_ulong_t)&=
rpl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), .driver_data =3D (kernel_ulong_t)&=
rpl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), .driver_data =3D (kernel_ulong_t)&=
rpl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU1), .driver_data =3D (kernel_ulong_t)=
&mtl_ps_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU2), .driver_data =3D (kernel_ulong_t)=
&mtl_ps_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU3), .driver_data =3D (kernel_ulong_t)=
&mtl_ps_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU4), .driver_data =3D (kernel_ulong_t)=
&mtl_ps_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU1), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU2), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU3), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), .driver_data =3D (kernel_ulong_t)&=
mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
- 	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), .driver_data =3D (kernel_ulong_t)&=
ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
++	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
 +	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data =3D (kernel_ulong_t)&wc=
l_cfg },
  	{ },
  };
  MODULE_DEVICE_TABLE(pci, igen6_pci_tbl);

Best regards
Uwe

--c2jinotj74zoook5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoVYlIACgkQj4D7WH0S
/k5hFgf/U1ru0VIZesGTsa7+oWOW+Abmfpa1VuIj1qGqCwbEdHtLUxqTxnHnz99l
fNkHPRpQ/xjSJ2GfoAzmWQ5vrIldQzzKOyBjUciupz0DdvttZIH7XokfzIwiWm3s
q+UfpqeknOqtvm3POcynal2uc6/zFX3lng/P25LoDOGFkbV1BEHC3s00OBs5o8il
VYEtW6DR5TogD04MOPhufdCTpSdXZPjQttgJqagoKklY6w75rynljUcr9L22Gprl
EvBzsJBJLMaCPNGqcN3q/0TI3zpceK19kulwt92+FD18w0qvUkaF2RTTBnOuQgsJ
Iy0M6a2zTaFJyA+szOiq79cOlo3O7Q==
=YvwM
-----END PGP SIGNATURE-----

--c2jinotj74zoook5--
