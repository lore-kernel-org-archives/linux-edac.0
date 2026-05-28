Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBBCDF76;
	Thu, 28 May 2026 04:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940874; cv=none; b=t4u76CtPepILOiZXn3mikOWxSy6LtSDQeo7PyoYAPaB3etsdJfLM5Mjb0ClRCrzeYhM1wM6UMoVvtJgGZ8xYbIHomW2mV29SUiuz7OpZM2AIF8DwgZRq0w5RMryzItrRPCuMBYqV9rFQq/hMxb7QPtcTNrf1qIuzM/buQMQxIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940874; c=relaxed/simple;
	bh=6bP52mY+oHgdRJ0feB4Uxf+Y7lR8eubltev8wvz5OL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0w4ruGjquiPJXDLesNjmzpIqdMCfTEDaiS67ZtDCXk5W6ladEf9CnG6JyZ92chNSp9jy9ZNC3A79DxJ/0IG/aqUuaJpiB1s1YpLjcV5ZtTW1bURC5P1B5BBVv5IESymo5KKODN2S34OLWvG0SgnWTW8e07zrCVTvleE0r9m7O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DV8uzU/P reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DV8uzU/P"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CA90940E01B5;
	Thu, 28 May 2026 04:01:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id eSaKIp3A6vtl; Thu, 28 May 2026 04:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779940858; bh=HCRqtFPfsxcnFwI0m3fmFelyiadoy8NgkIgTgRZ1rVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DV8uzU/PDESIeoKyE3KNrXQXkiiVyCus4YmfwsvDpXEDEbTU3j+FxU+jQhHrwS5XX
	 9EOTOpyPowg4sQD1Di1B26z9vG3RHdx/BQDfnMt8YvazbMUvwo1iW1PVT87YFF0nx8
	 MOMVMe3Nx/yidgBnuKz9w3t2CAUtHxRgBgHdNgrd3mQhG+8YfoF1+7/OJP6gH7xwgJ
	 XNdpJpNXSSmrrh3pHajkXpeEpOL/vkJqNi5vSsb6CYMTe1Ks7c9yvmIiylA75WUCNB
	 PmrDa/rCbvFVBDQqLSYY+cy0reJmwn49e8MyHUl536silrjEz6cXYaz909Shqi0Z5I
	 csEntB9b/rYzMXET/rBYoTTzmOmEnYLnxNVLRP7ZIO+DGasir3cU1YVRlCZtdGW32L
	 V7KcshWE6dM7Q3vKZ763/STlLWJkNru/UKT0yUS1w2YfvWTEpbcxRhhPzjahmxqFL4
	 iNCfq6EcKmkLSpqYIpS+X6g1T6HG0RA0ZBkrTfLsr0K0leU7n5OSpZS9FeuSahwZ6/
	 Enra3o3KnAjHDpfgEGprb1WlJTkvUcYr/2LakwddyhxeKtYBw9KPaxADrR/o2bM7Nb
	 nECDDCz6m7Cit2UYxZCLSYQwRGUDSGs0s6W1VVL9rr+b0gEOrt9mICOzBkmyunXx5g
	 qNSm92GoCIxrdCsZ1UTRHpU0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A496C40E0031;
	Thu, 28 May 2026 04:00:48 +0000 (UTC)
Date: Wed, 27 May 2026 21:00:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Tony Luck <tony.luck@intel.com>, Mark Gross <markgross@kernel.org>,
	"Arvind R." <arvino55@gmail.com>, Jason Baron <jbaron@akamai.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v2] edac: Consistently define pci_device_ids using named
 initializers
Message-ID: <20260528040038.GFahe95n8sFjjEsj1V@fat_crate.local>
References: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527061057.3796383-2-u.kleine-koenig@baylibre.com>
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 08:10:56AM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> Borislav Petkov asked me to do a patch for drivers/edac/igen6_edac.c
> only on top of next, but I hope this way it's still easier.

There was a reason why I wanted you to separate the igen6 changes - that
driver is getting regular updates seemingly daily currently and that patc=
h of
yours doesn't apply again.

Anyway, I fixed up the conflicts. See below.

---
From: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig=3D20=3D28The=3D20Capable=3D=
20Hub=3D29?=3D
 <u.kleine-koenig@baylibre.com>
Date: Wed, 27 May 2026 08:10:56 +0200
Subject: [PATCH] EDAC: Consistently define pci_device_ids using named
 initializers
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

... and PCI device helpers.

The various struct pci_device_id arrays were initialized mostly by one of=
 the
PCI_DEVICE macros and then list expressions. The latter aren't easily rea=
dable
if you're not into PCI. Using named initializers is more explicit and thu=
s
easier to parse.

Also use PCI_DEVICE* helper macros to assign .vendor, .device, .subvendor=
 and
.subdevice where appropriate and skip explicit assignments of 0 (which th=
e
compiler takes care of).

The secret plan is to make struct pci_device_id::driver_data an anonymous
union (similar to

  https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylib=
re.com/

and that requires named initializers. But it's also a nice cleanup on its=
 own.

  [ bp: Massage commit message. ]

Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Tested-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Link: https://patch.msgid.link/20260527061057.3796383-2-u.kleine-koenig@b=
aylibre.com
---
 drivers/edac/amd76x_edac.c  |  16 ++---
 drivers/edac/e752x_edac.c   |  28 ++++----
 drivers/edac/e7xxx_edac.c   |  28 ++++----
 drivers/edac/edac_mc.h      |   4 +-
 drivers/edac/i3000_edac.c   |  10 +--
 drivers/edac/i3200_edac.c   |  10 +--
 drivers/edac/i82860_edac.c  |  10 +--
 drivers/edac/i82875p_edac.c |  12 ++--
 drivers/edac/i82975x_edac.c |  11 ++-
 drivers/edac/ie31200_edac.c |  86 +++++++++++-----------
 drivers/edac/igen6_edac.c   | 140 ++++++++++++++++++------------------
 drivers/edac/x38_edac.c     |  10 +--
 12 files changed, 182 insertions(+), 183 deletions(-)

diff --git a/drivers/edac/amd76x_edac.c b/drivers/edac/amd76x_edac.c
index 2a49f68a7cf9..7bb11ffdb0c9 100644
--- a/drivers/edac/amd76x_edac.c
+++ b/drivers/edac/amd76x_edac.c
@@ -332,14 +332,14 @@ static void amd76x_remove_one(struct pci_dev *pdev)
=20
 static const struct pci_device_id amd76x_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(AMD, FE_GATE_700C), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 AMD762},
-	{
-	 PCI_VEND_DEV(AMD, FE_GATE_700E), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 AMD761},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(AMD, FE_GATE_700C),
+		.driver_data =3D AMD762
+	}, {
+		PCI_VEND_DEV(AMD, FE_GATE_700E),
+		.driver_data =3D AMD761,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, amd76x_pci_tbl);
diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
index 7221b4bb6df2..77c1fe75451e 100644
--- a/drivers/edac/e752x_edac.c
+++ b/drivers/edac/e752x_edac.c
@@ -1414,20 +1414,20 @@ static void e752x_remove_one(struct pci_dev *pdev=
)
=20
 static const struct pci_device_id e752x_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(INTEL, 7520_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7520},
-	{
-	 PCI_VEND_DEV(INTEL, 7525_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7525},
-	{
-	 PCI_VEND_DEV(INTEL, 7320_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7320},
-	{
-	 PCI_VEND_DEV(INTEL, 3100_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I3100},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 7520_0),
+		.driver_data =3D E7520,
+	}, {
+		PCI_VEND_DEV(INTEL, 7525_0),
+		.driver_data =3D E7525,
+	}, {
+		PCI_VEND_DEV(INTEL, 7320_0),
+		.driver_data =3D E7320,
+	}, {
+		PCI_VEND_DEV(INTEL, 3100_0),
+		.driver_data =3D I3100,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, e752x_pci_tbl);
diff --git a/drivers/edac/e7xxx_edac.c b/drivers/edac/e7xxx_edac.c
index 5852b95fa470..02071180b638 100644
--- a/drivers/edac/e7xxx_edac.c
+++ b/drivers/edac/e7xxx_edac.c
@@ -554,20 +554,20 @@ static void e7xxx_remove_one(struct pci_dev *pdev)
=20
 static const struct pci_device_id e7xxx_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(INTEL, 7205_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7205},
-	{
-	 PCI_VEND_DEV(INTEL, 7500_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7500},
-	{
-	 PCI_VEND_DEV(INTEL, 7501_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7501},
-	{
-	 PCI_VEND_DEV(INTEL, 7505_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 E7505},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 7205_0),
+		.driver_data =3D E7205,
+	}, {
+		PCI_VEND_DEV(INTEL, 7500_0),
+		.driver_data =3D E7500,
+	}, {
+		PCI_VEND_DEV(INTEL, 7501_0),
+		.driver_data =3D E7501,
+	}, {
+		PCI_VEND_DEV(INTEL, 7505_0),
+		.driver_data =3D E7505
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, e7xxx_pci_tbl);
diff --git a/drivers/edac/edac_mc.h b/drivers/edac/edac_mc.h
index 881b00eadf7a..9505bbd41784 100644
--- a/drivers/edac/edac_mc.h
+++ b/drivers/edac/edac_mc.h
@@ -88,8 +88,8 @@ do {									\
=20
 #endif				/* !CONFIG_EDAC_DEBUG */
=20
-#define PCI_VEND_DEV(vend, dev) PCI_VENDOR_ID_ ## vend, \
-	PCI_DEVICE_ID_ ## vend ## _ ## dev
+#define PCI_VEND_DEV(vend, dev) \
+	PCI_DEVICE(PCI_VENDOR_ID_ ## vend, PCI_DEVICE_ID_ ## vend ## _ ## dev)
=20
 #define edac_dev_name(dev) (dev)->dev_name
=20
diff --git a/drivers/edac/i3000_edac.c b/drivers/edac/i3000_edac.c
index 9065bc4386ff..04a231660b88 100644
--- a/drivers/edac/i3000_edac.c
+++ b/drivers/edac/i3000_edac.c
@@ -485,11 +485,11 @@ static void i3000_remove_one(struct pci_dev *pdev)
=20
 static const struct pci_device_id i3000_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(INTEL, 3000_HB), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I3000},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 3000_HB),
+		.driver_data =3D I3000,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, i3000_pci_tbl);
diff --git a/drivers/edac/i3200_edac.c b/drivers/edac/i3200_edac.c
index 6cade6d7ceff..d600b6c05217 100644
--- a/drivers/edac/i3200_edac.c
+++ b/drivers/edac/i3200_edac.c
@@ -466,11 +466,11 @@ static void i3200_remove_one(struct pci_dev *pdev)
=20
 static const struct pci_device_id i3200_pci_tbl[] =3D {
 	{
-		PCI_VEND_DEV(INTEL, 3200_HB), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-		I3200},
-	{
-		0,
-	}            /* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 3200_HB),
+		.driver_data =3D I3200,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, i3200_pci_tbl);
diff --git a/drivers/edac/i82860_edac.c b/drivers/edac/i82860_edac.c
index b8a497f0de28..e8c1ee80bba8 100644
--- a/drivers/edac/i82860_edac.c
+++ b/drivers/edac/i82860_edac.c
@@ -287,11 +287,11 @@ static void i82860_remove_one(struct pci_dev *pdev)
=20
 static const struct pci_device_id i82860_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(INTEL, 82860_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I82860},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 82860_0),
+		.driver_data =3D I82860,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, i82860_pci_tbl);
diff --git a/drivers/edac/i82875p_edac.c b/drivers/edac/i82875p_edac.c
index 553880b9fc12..869de8e372b3 100644
--- a/drivers/edac/i82875p_edac.c
+++ b/drivers/edac/i82875p_edac.c
@@ -276,7 +276,7 @@ static int i82875p_setup_overfl_dev(struct pci_dev *p=
dev,
=20
 	*ovrfl_pdev =3D NULL;
 	*ovrfl_window =3D NULL;
-	dev =3D pci_get_device(PCI_VEND_DEV(INTEL, 82875_6), NULL);
+	dev =3D pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82875_6=
, NULL);
=20
 	if (dev =3D=3D NULL) {
 		/* Intel tells BIOS developers to hide device 6 which
@@ -518,11 +518,11 @@ static void i82875p_remove_one(struct pci_dev *pdev=
)
=20
 static const struct pci_device_id i82875p_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(INTEL, 82875_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 I82875P},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 82875_0),
+		.driver_data =3D I82875P,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, i82875p_pci_tbl);
diff --git a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c
index d99f005832cf..09a79eaaa486 100644
--- a/drivers/edac/i82975x_edac.c
+++ b/drivers/edac/i82975x_edac.c
@@ -624,12 +624,11 @@ static void i82975x_remove_one(struct pci_dev *pdev=
)
=20
 static const struct pci_device_id i82975x_pci_tbl[] =3D {
 	{
-		PCI_VEND_DEV(INTEL, 82975_0), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-		I82975X
-	},
-	{
-		0,
-	}	/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, 82975_0),
+		.driver_data =3D I82975X
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, i82975x_pci_tbl);
diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index a5dc4b88097f..e3bd6436669b 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -733,49 +733,49 @@ static struct res_config rpl_s_cfg =3D {
 };
=20
 static const struct pci_device_id ie31200_pci_tbl[] =3D {
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_2), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_3), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_4), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_5), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_6), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_7), (kernel_ulong_t=
)&snb_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_8), (kernel_ulong_t=
)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_9), (kernel_ulong_t=
)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_10), (kernel_ulong_=
t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_11), (kernel_ulong_=
t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_12), (kernel_ulong_=
t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_1), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_2), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_3), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_4), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_5), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_6), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_7), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_8), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_9), (kernel_ulo=
ng_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_10), (kernel_ul=
ong_t)&skl_cfg },
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_1), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_2), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_3), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_4), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_5), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_6), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_HX_1), (kernel_ulo=
ng_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_1), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_2), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_3), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_1), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_2), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_3), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_4), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_5), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_6), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_7), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_8), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_9), (kernel_ulon=
g_t)&rpl_s_cfg},
-	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_10), (kernel_ulo=
ng_t)&rpl_s_cfg},
-	{ 0, } /* 0 terminated list. */
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_2), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_3), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_4), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_5), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_6), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_7), .driver_data =3D=
 (kernel_ulong_t)&snb_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_8), .driver_data =3D=
 (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_9), .driver_data =3D=
 (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_10), .driver_data =3D=
 (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_11), .driver_data =3D=
 (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_12), .driver_data =3D=
 (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_1), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_2), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_3), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_4), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_5), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_6), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_7), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_8), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_9), .driver_dat=
a =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_CFL_10), .driver_da=
ta =3D (kernel_ulong_t)&skl_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_1), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_2), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_3), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_4), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_5), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_S_6), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_RPL_HX_1), .driver_dat=
a =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_1), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_2), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ADL_S_3), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_1), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_2), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_3), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_4), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_5), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_6), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_7), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_8), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_9), .driver_data=
 =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_10), .driver_dat=
a =3D (kernel_ulong_t)&rpl_s_cfg },
+	{ } /* 0 terminated list. */
 };
 MODULE_DEVICE_TABLE(pci, ie31200_pci_tbl);
=20
diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 9af15ac6ff84..f1fc20d4ebf6 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -841,76 +841,76 @@ static struct res_config nvl_h_cfg =3D {
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
-	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU1), (kernel_ulong_t)&nvl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU2), (kernel_ulong_t)&nvl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU3), (kernel_ulong_t)&nvl_h_cfg },
-	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU4), (kernel_ulong_t)&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU5), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU6), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU7), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU8), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU9), .driver_data =3D (kernel_ulong_t)&e=
hl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU10), .driver_data =3D (kernel_ulong_t)&=
ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU11), .driver_data =3D (kernel_ulong_t)&=
ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU12), .driver_data =3D (kernel_ulong_t)&=
ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU13), .driver_data =3D (kernel_ulong_t)&=
ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU14), .driver_data =3D (kernel_ulong_t)&=
ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_EHL_SKU15), .driver_data =3D (kernel_ulong_t)&=
ehl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU8), .driver_data =3D (kernel_ulong_t)&i=
cl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU10), .driver_data =3D (kernel_ulong_t)&=
icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU11), .driver_data =3D (kernel_ulong_t)&=
icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ICL_SKU12), .driver_data =3D (kernel_ulong_t)&=
icl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_TGL_SKU), .driver_data =3D (kernel_ulong_t)&tg=
l_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU1), .driver_data =3D (kernel_ulong_t)&a=
dl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU2), .driver_data =3D (kernel_ulong_t)&a=
dl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU3), .driver_data =3D (kernel_ulong_t)&a=
dl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_SKU4), .driver_data =3D (kernel_ulong_t)&a=
dl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU1), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU2), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU3), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU4), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU5), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU6), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU7), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU8), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU9), .driver_data =3D (kernel_ulong_t)=
&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU10), .driver_data =3D (kernel_ulong_t=
)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU11), .driver_data =3D (kernel_ulong_t=
)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ADL_N_SKU12), .driver_data =3D (kernel_ulong_t=
)&adl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_AZB_SKU1), .driver_data =3D (kernel_ulong_t)&a=
dl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU1), .driver_data =3D (kernel_ulong_t)&a=
dl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU2), .driver_data =3D (kernel_ulong_t)&a=
dl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ASL_SKU3), .driver_data =3D (kernel_ulong_t)&a=
dl_n_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU1), .driver_data =3D (kernel_ulong_t)=
&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU2), .driver_data =3D (kernel_ulong_t)=
&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU3), .driver_data =3D (kernel_ulong_t)=
&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU4), .driver_data =3D (kernel_ulong_t)=
&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_RPL_P_SKU5), .driver_data =3D (kernel_ulong_t)=
&rpl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU1), .driver_data =3D (kernel_ulong_t=
)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU2), .driver_data =3D (kernel_ulong_t=
)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU3), .driver_data =3D (kernel_ulong_t=
)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_PS_SKU4), .driver_data =3D (kernel_ulong_t=
)&mtl_ps_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU1), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU2), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_MTL_P_SKU3), .driver_data =3D (kernel_ulong_t)=
&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU1), .driver_data =3D (kernel_ulong_t=
)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU2), .driver_data =3D (kernel_ulong_t=
)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_ARL_UH_SKU3), .driver_data =3D (kernel_ulong_t=
)&mtl_p_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU1), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU2), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU3), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU4), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU5), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU6), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU7), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU8), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU9), .driver_data =3D (kernel_ulong_t)=
&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU10), .driver_data =3D (kernel_ulong_t=
)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU11), .driver_data =3D (kernel_ulong_t=
)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU12), .driver_data =3D (kernel_ulong_t=
)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU13), .driver_data =3D (kernel_ulong_t=
)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_PTL_H_SKU14), .driver_data =3D (kernel_ulong_t=
)&ptl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_WCL_SKU1), .driver_data =3D (kernel_ulong_t)&w=
cl_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU1), .driver_data =3D (kernel_ulong_t)=
&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU2), .driver_data =3D (kernel_ulong_t)=
&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU3), .driver_data =3D (kernel_ulong_t)=
&nvl_h_cfg },
+	{ PCI_VDEVICE(INTEL, DID_NVL_H_SKU4), .driver_data =3D (kernel_ulong_t)=
&nvl_h_cfg },
 	{ },
 };
 MODULE_DEVICE_TABLE(pci, igen6_pci_tbl);
diff --git a/drivers/edac/x38_edac.c b/drivers/edac/x38_edac.c
index 292dda754c23..2b55daca33b0 100644
--- a/drivers/edac/x38_edac.c
+++ b/drivers/edac/x38_edac.c
@@ -446,11 +446,11 @@ static void x38_remove_one(struct pci_dev *pdev)
=20
 static const struct pci_device_id x38_pci_tbl[] =3D {
 	{
-	 PCI_VEND_DEV(INTEL, X38_HB), PCI_ANY_ID, PCI_ANY_ID, 0, 0,
-	 X38},
-	{
-	 0,
-	 }			/* 0 terminated list. */
+		PCI_VEND_DEV(INTEL, X38_HB),
+		.driver_data =3D X38,
+	}, {
+		/* 0 terminated list. */
+	}
 };
=20
 MODULE_DEVICE_TABLE(pci, x38_pci_tbl);
--=20
2.53.0

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
