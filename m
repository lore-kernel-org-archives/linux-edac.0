Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822840;
	b=XHTKKF37N8RS/46StewedLEUCig3orZ2lINC/LdCGfZRtC+d2D9WfOQZTTTAzU9W6fjh
	 JExJB6wonNIC2xAxcsG/AUjaAJP/pNQenDvuId9CY9ZgbqoCveFyulsJKSIIUuXl/VW7D
	 TaBGsvnds/InxFSuxi+PGs3OHhjNzVncxWYwSj2F6oI8Fy7tdBAGT2dOcOScOaqSpukhi
	 nUgapSZlGXY15WBgI/WUzfQHL2IbI2x4J+8K56AyA1taokpdTenYsbrMsLFcC4SYNVpQU
	 EglBrImS/D4kqY5ZJfIXdDhhI/7Zx4OhW12x0Hlx5MNf7dlYa976fX3Tol6/YvoSUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822840;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=yf/x4wJo2R5yVwi2QYSBdfjG3cB6QvIsoaV4cs+Sr8k=;
	b=SvcFZPy9MnRv8nEC72rRfTpMvG9jnCDxQl5CpXwbLGxCdTQHxmCzEQldxibSjuSep1f6
	 HR5ZUCrNv9Kl695f9M0MeAAlABZxmpueS45WMTLpt1wiXodvGPiwATL7i6fU71UfU7FOX
	 w6kdQ6R7Ui62/fYFJsPlOXZui3xlptRNINoIx/IugvyIWyzoqrN2d0/tueKNPy+35pdHG
	 KU60JK8Or1M5ZRkERq41Xbc0aLTUBqdakjRP434oKiaq6P5IGRlwB5dUjT4WOYZ3p2K+l
	 qncqQJcgp3uCgqRFfbwmg9qnkidCDUw0mV0f8NMTQWRbcUyjGssoNQy9tu+RwFzEqFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=lQlUd0wl;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C028606A31C;
	Fri, 27 Nov 2026 23:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C028606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=lQlUd0wl
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 185C640E01E1;
	Fri, 27 Nov 2026 23:40:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XR1ociVqygF6; Fri, 27 Nov 2026 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795822834; bh=yf/x4wJo2R5yVwi2QYSBdfjG3cB6QvIsoaV4cs+Sr8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQlUd0wldEFAcSxOUX7U4OIGMrjOtxe23TFgefzTJLAVokYk1Q6CLXaqTKGrrkwy1
	 PRGRv0Bf25wNt82UT/XmE2fVyk58YBcSqUK2IcgrLXLo05I0e9EuY0Xty3uYfmRjkS
	 ZslE18vl+jrMC94XNKm6B3eqTLc+eMdLPGuc77iduZYbfDIx725hY1JP0nBo/EpCry
	 a5iwYqaKXdG8Xml+FqyABG//4Ksl+w4D7e+UHXLavFUaDGbqPOE8DmiOZrSmN2ELtV
	 rkJ+TE4x4OyW8/SRUTOqLoy6R1CO5O0ITu9hYsOCNgI1NS7YuA25/BtotVOSM5EWbh
	 i/MacpO3khdiD0cYaL8i8dQXO0+tujmzjNwtZRtO0sgsSCpuisRzpyqDF0JzHgKqXa
	 y3LHb9K1BOG89cRLJeIgEzcrPpOqlazV7j5+OxR0WyAWUrCdxJw1/shFGY/NZcfKiK
	 Hy8ghWzOczEAVj0nH2zpK3N8uejOHY+r3wB07swKNHiaJ/SJtk4aBZtVSNpuD+6CwY
	 CXD7OVSt6b8zXrC8P3S34MgQxC43Fzn1OL3EG0vW8L4MKWAFAh2R3VTVaS1Pnm8+yC
	 OnK7yMqc2RaL/4pJpJ7aeU60Z57gOGj6kTW/kx0h3Byb2L7ohJ3iXZOQSODduyZNWL
	 KJZMPENLdg0yI+LDdGCdFPc0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BCF1540E00C2;
	Fri, 27 Nov 2026 23:40:27 +0000 (UTC)
Date: Fri, 27 Nov 2026 15:40:24 -0800
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org, chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/4] EDAC/loongson: Improvements for Loongson EDAC
 driver
Message-ID: <20261127234024.GSawoU6ISvM4Sz9vl2@fat_crate.local>
References: <20261118030330.25779-1-zhaoqunqin@163.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118030330.25779-1-zhaoqunqin@163.com>

On Wed, Nov 18, 2026 at 11:03:26AM +0800, Qunqin Zhao wrote:
> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
> 
> This series contains four patches for the Loongson EDAC driver.

Also below.

I've pushed what I have to:

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=edac-drivers-loongson

You can base your patch 4 ontop.

Thx.

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Fri, 27 Nov 2026 15:29:30 -0800
Subject: [PATCH] EDAC/loongson: Do some more cleanups

- Zap more unnecessary prefixing
- Fixup module name string
- Other smaller cleanups

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/edac/loongson_edac.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index 250eba136655..05b95b71233e 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -47,7 +47,7 @@ static int read_ecc(struct mem_ctl_info *mci)
 	return cs;
 }
 
-static void loongson_check(struct mem_ctl_info *mci)
+static void check_for_errors(struct mem_ctl_info *mci)
 {
 	struct loongson_pvt *pvt = mci->pvt_info;
 	char other_detail[64] = {0};
@@ -121,7 +121,7 @@ static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 mcs_per_
 	pvt->mcs_per_node = mcs_per_node;
 }
 
-static int loongson_probe(struct platform_device *pdev)
+static int driver_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct edac_mc_layer layers[2];
@@ -140,21 +140,20 @@ static int loongson_probe(struct platform_device *pdev)
 	layers[1].type = EDAC_MC_LAYER_SLOT;
 	layers[1].size = 1;
 	layers[1].is_virt_csrow = true;
-	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers,
-			    sizeof(struct loongson_pvt));
-	if (mci == NULL)
+	mci = edac_mc_alloc(0, ARRAY_SIZE(layers), layers, sizeof(struct loongson_pvt));
+	if (!mci)
 		return -ENOMEM;
 
 	mci->mtype_cap = MEM_FLAG_RDDR4;
 	mci->edac_ctl_cap = EDAC_FLAG_NONE;
 	mci->edac_cap = EDAC_FLAG_NONE;
-	mci->mod_name = "loongson_edac.c";
+	mci->mod_name = "loongson_edac";
 	mci->ctl_name = "loongson_edac_ctl";
 	mci->dev_name = "loongson_edac_dev";
 	mci->ctl_page_to_phys = NULL;
 	mci->pdev = &pdev->dev;
 	mci->error_desc.grain = 8;
-	mci->edac_check = loongson_check;
+	mci->edac_check = check_for_errors;
 
 	if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx))
 		mci->mc_idx = edac_device_alloc_index() | MC_IDX_INVALID;
@@ -176,7 +175,7 @@ static int loongson_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void loongson_remove(struct platform_device *pdev)
+static void driver_remove(struct platform_device *pdev)
 {
 	struct mem_ctl_info *mci = edac_mc_del_mc(&pdev->dev);
 
@@ -184,18 +183,18 @@ static void loongson_remove(struct platform_device *pdev)
 		edac_mc_free(mci);
 }
 
-static const struct acpi_device_id loongson_acpi_match[] = {
+static const struct acpi_device_id acpi_match_table[] = {
 	{ .id = "LOON0010" },
 	{ }
 };
-MODULE_DEVICE_TABLE(acpi, loongson_acpi_match);
+MODULE_DEVICE_TABLE(acpi, acpi_match_table);
 
 static struct platform_driver loongson_driver = {
-	.probe		= loongson_probe,
-	.remove		= loongson_remove,
+	.probe		= driver_probe,
+	.remove		= driver_remove,
 	.driver		= {
 		.name	= "loongson-mc-edac",
-		.acpi_match_table = loongson_acpi_match,
+		.acpi_match_table = acpi_match_table,
 	},
 };
 module_platform_driver(loongson_driver);
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
