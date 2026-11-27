Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821817;
	b=QpA4aVvrzzxuSXUQu3IN253BYYOI+rCRwV3u1D+4nSR/sv9MKQHzEDLcDAiomCEnOiNr
	 ECd3B2PEPBm9wVgsD1flEJNbxYpQp3ahGkagdKfpDykKkA3GIu5WS75kmk3hI9zM5BpAv
	 5PxGi3KsSwai7XK6Yyah6fPRcE/+CkhZ7t0fPEk3E5EbfPEFAvw15pNzmU/kIehBe1VqK
	 Jn+qMANUllMnX6qS4CLAO4E41+YzrB+ccfZX4eWGFiOBx+dSy6bXWhVxpk1gLb2yPLaK6
	 SnmTsBNxTmhjMI2w9MoB9Vkgn4iHkztDlaFbNix6I3Mvq6hliG+9ReBBuDLp6esVvWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821817;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E+cJLBHvdBF1tF2dc5WrNqVuBPNxJGnHZIyQiOUrjoU=;
	b=ITDSQ3eTvuybcPTNwEtYmNAppX3QXCilN8Ry0JW0KmBysWAjKriWy0V/1VCGoMJ0NicS
	 vHrMUiX6QP7hHA2lAcLpRswM5G3uC0QyRv4hkl96FNLFJd3mGyvA1SztithWE26h2cBAD
	 wo4p3SEQeRW+KjBvB23BhlJekuIs7jLlbrenMUoM2uy53IfwzPcDD9DmOx9pCUBydfG2O
	 lSZyiUEZpTlc40Ba0nBbPTqMRkEWiYsQdZv3m5TZRqahJ+Xi2djYLbTk6+X53J8foZZyu
	 VE7ilr1OpiroCg4HXx8MvgRkiBUaty2CS8lsAFDqi7PtPaovolF0nj9aBFGU1mRFGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KbCKHkc7;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EC606A31C;
	Fri, 27 Nov 2026 23:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KbCKHkc7
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 819D740E0240;
	Fri, 27 Nov 2026 23:23:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id my8Rg2w-vlF5; Fri, 27 Nov 2026 23:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795821804; bh=E+cJLBHvdBF1tF2dc5WrNqVuBPNxJGnHZIyQiOUrjoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KbCKHkc7UBEL66mPCv7Dcnfb4iMQfp1AQkuxGQ2QX/JSy1s8msoOeGO41sodAcqjP
	 bMjYD5CkCHSzJzcaUUFXDYgjVvO+9wvLufqLkAPsxcFYEEgJizSiScXwxFBq7lsMhJ
	 qEriNxzU0A3KepQgsBHDMmYcJ8Ck08iwrz8dRRaWJA8t1CJ40nnOX6ltfHAfokzQe9
	 qyBvaXY4FR/rB8d90bolGbt+0SA7bZ54LKfdzvDfbSdm5tnUmiAQ7yLIW5tUNont1R
	 /xF9aAGx2wxCOm89bt3W1geb+vfwa6Gew076yZqFrzzSLBN9DUHzb5+mksevc/Uj95
	 DOYEb7JO6wf/pHKGn+lG33Z5dmPYXgmZXxh3ZWe+3yfizy9jGwRVTJp5KWvi1zg03s
	 kKo8FBiIUWxu/QwH9EAzzNI9qGNtZa+eWEE9VpGTogKn7eU2ArWCx5NRop+zwtl+/4
	 EPdNXMlJ4RGzLgkrZCDOtj7PgymTWKvOtALa1uZXznG/0NqLniM/Hw7JPmbQVMPupP
	 nkTEX4s2CUW6hjIvI4/Bk0V1m0JGXQcZuHaRMCmhh0okELsQmff55fGo/uDu8Q7Z88
	 MHhMySo6ICULMMG3QgZnQ4W8LWkNERtFpk70RHRgmGCCTt17NnQp+BjtS9zTU0dwhE
	 EMW4x0h2PFD441yN93UHAbz0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D862F40E01E1;
	Fri, 27 Nov 2026 23:23:13 +0000 (UTC)
Date: Fri, 27 Nov 2026 15:23:10 -0800
From: Borislav Petkov <bp@alien8.de>
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org, chenhuacai@kernel.org,
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org,
	Wang Jinwei <wangjinwei@loongson.cn>,
	Dongyan Qian <qiandongyan@loongson.cn>,
	Chao Li <lichao@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v8 3/4] EDAC/loongson: Get DIMM size from ACPI _DSM method
Message-ID: <20261127232310.GQawoQ3plxyLGp8raz@fat_crate.local>
References: <20261118030330.25779-1-zhaoqunqin@163.com>
 <20261118030330.25779-4-zhaoqunqin@163.com>
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
In-Reply-To: <20261118030330.25779-4-zhaoqunqin@163.com>

On Wed, Nov 18, 2026 at 11:03:29AM +0800, Qunqin Zhao wrote:
> From: Wang Jinwei <wangjinwei@loongson.cn>
> 
> Add support to retrieve DIMM size from ACPI _DSM method instead
> of using hardcoded values.
> 
> 1. Add loongson_get_dimm_size_acpi() to call ACPI _DSM method
>    to Get DIMM size in MB.
> 
> 2. Update dimm_config_init() to use the size from ACPI, with
>    fallback to default 1 MB if ACPI method fails.
> 
> 3. Add ACPI UUID and DSM function definitions for EDAC.
> 
> The DIMM size is passed from UEFI through ACPI OperationRegion
> and _DSM method, enabling correct display of memory size in
> /sys/devices/system/edac/mc/mc*/size_mb.

Please, do not talk about *what* the patch is doing in the commit message
- that should be obvious from the diff itself. Rather, concentrate on the
*why* it needs to be done and why your patch exists.

It is perfectly fine to explain non-trivial aspects of the code the patch is
touching but do not regurgitate what it does.

See also https://docs.kernel.org/process/submitting-patches.html for
additional inspiration.
 
> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> Cc: Chao Li <lichao@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 4ee9dcb3d5..413ca654b4 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -13,6 +13,8 @@
>  #include "edac_module.h"
>  
>  #define ECC_CS_COUNT_REG	0x18
> +#define LOONGSON_EDAC_DSM_UUID "65d0431b-7eb8-46df-b914-b7d568553140"
> +#define LOONGSON_EDAC_DSM_FUNC_GET_DIMM_SIZE   1

Are you serious? Can you make that define longer?!?

Didn't I already told you to zap all those "loongson" prefixes from static
objects?

>  
>  /* Memory controller index invalid due to inability to read it from ACPI, etc */
>  #define MC_IDX_INVALID		BIT(16)
> @@ -68,13 +70,39 @@ static void loongson_check(struct mem_ctl_info *mci)
>  			     0, 0, 0, 0, 0, -1, "error", other_detail);
>  }

>  static void dimm_config_init(struct mem_ctl_info *mci)
>  {
>  	struct dimm_info *dimm;
> +	struct device *dev = mci->pdev;
>  	u32 size, npages;

This tree's preferred ordering of variable declarations at the beginning of
a function is reverse fir tree order::

	struct long_struct_name *descriptive_name;
	unsigned long foo, bar;
	unsigned int tmp;
	int ret;

The above is faster to parse than the reverse ordering::

	int ret;
	unsigned int tmp;
	unsigned long foo, bar;
	struct long_struct_name *descriptive_name;

And even more so than random ordering::

	unsigned long foo, bar;
	int ret;
	struct long_struct_name *descriptive_name;
	unsigned int tmp;

I went and did it for you ontop again.

Please make sure you go over the changes I did and keep them in mind next time
you send patches.

---
From: Wang Jinwei <wangjinwei@loongson.cn>
Date: Wed, 18 Nov 2026 11:03:29 +0800
Subject: [PATCH] EDAC/loongson: Get DIMM size from ACPI _DSM method

Retrieve DIMM size from the ACPI _DSM method instead of using hardcoded
values.

The DIMM size is passed from UEFI through ACPI OperationRegion and _DSM
method, enabling correct display of memory size in:

  /sys/devices/system/edac/mc/mc*/size_mb

  [ bp:
   - Massage commit message, drop text explaining what the patch does
   - Zap insanely long define
   - Zap loongson prefix from more static objects
   ]

Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Link: https://patch.msgid.link/20261118030330.25779-4-zhaoqunqin@163.com
---
 drivers/edac/loongson_edac.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
index d9c86d7e721b..250eba136655 100644
--- a/drivers/edac/loongson_edac.c
+++ b/drivers/edac/loongson_edac.c
@@ -13,6 +13,7 @@
 #include "edac_module.h"
 
 #define ECC_CS_COUNT_REG	0x18
+#define DSM_UUID		"65d0431b-7eb8-46df-b914-b7d568553140"
 
 /* Memory controller index invalid due to inability to read it from ACPI, etc */
 #define MC_IDX_INVALID		BIT(16)
@@ -68,13 +69,40 @@ static void loongson_check(struct mem_ctl_info *mci)
 			     0, 0, 0, 0, 0, -1, "error", other_detail);
 }
 
+static u32 get_dimm_size_acpi(struct device *dev)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object *obj;
+	u32 size_mb = 1;
+	guid_t guid;
+
+	if (!handle)
+		return size_mb;
+
+	if (guid_parse(DSM_UUID, &guid))
+		return size_mb;
+
+	/* 1 = DSM get DIMM size */
+	obj = acpi_evaluate_dsm(handle, &guid, 0, 1, NULL);
+	if (!obj)
+		return size_mb;
+
+	if (obj->type == ACPI_TYPE_INTEGER)
+		size_mb = (u32)obj->integer.value;
+
+	ACPI_FREE(obj);
+
+	return size_mb;
+}
+
 static void dimm_config_init(struct mem_ctl_info *mci)
 {
+	struct device *dev = mci->pdev;
 	struct dimm_info *dimm;
 	u32 size, npages;
 
-	/* size not used */
-	size = -1;
+	size = get_dimm_size_acpi(dev);
+
 	npages = MiB_TO_PAGES(size);
 
 	dimm = edac_get_dimm(mci, 0, 0, 0);
-- 
2.53.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
