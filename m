Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173602;
	b=WzIl5Na5FQFtZCkjZ3qe4Qr9Sc+kWDThAxgt+Vi+gX0+lovhQoQGz5MiIvXrB/rCiKcu
	 Jzm7aEzs/gxrt9mYKTbFjIsXAJ+2tnnPlVmQnEEi+0pPvlxa8ulpGO4QtEZFdbvEp+ZqQ
	 ouxSB86BnPjNfSpPuX8+zmSUsi6edIQXCv2m61/mOiXMnuRRS8aDk0n6mfR42O7IJnP7c
	 PnpJPoMIyzUKbm8MmSJUf7Oeh+c4yYiwAN0feBpCFcDOAzsbgIZigPk4qjQFWVXjVjRVo
	 qQNvzlGI4DZqEOcJEN7x4eja6mRQ+AvWmymv6R5Lz/ri9AQX4X3DJmg9TzsAkWEjvFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173602;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=gNcTdMNoAR9gRnBMyvwag/gk0hbmSsrfzpvTTscVcK0=;
	b=h1P/gh90dZEpwTL4Jgu2VJdlqd0+cOYMbUzTA+xS42Pajgf2lBA2Y3c1epozdG+A/LAG
	 PzsTx41JhVu4QTCfytLUGaZdosgg90p+VmnaqquiUtxNYgQ+oeBncr58QfjodkuD0A4jv
	 jAvIPAJhCShAweF46CKNZSkqnM2fwjYf2aI1lyQtkVpjhCziEThsXtFtKejKn9DFmb7h/
	 NUHPWmZoB36p0pHLa6f2BgrWo3jvvr0fmKfUZdWi5Jfk8Xa8iIAXEOIq/UgK3FeYHeb2G
	 w/mbOJa4gJ7BWY15wk9dY1k4bTuenEThJ5rrckidy4MutqDjM8pL0W1fsq0XoAi5h3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=E+ipsy5D;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6811606A335
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 11:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6811606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=E+ipsy5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=gNcTdMNoAR9gRnBMyvwag/gk0hbmSsrfzpvTTscVc
	K0=; b=E+ipsy5DZmgibyZ225i2A3KvSwW/6S+7BiOwIza4wDy0EmBBTwlFvne8c
	11HxunERh+H4/RNSzt8/qjKoaLbDPg/GOu+ZxKITLLvN5HKoXautnO/01LUqAw6+
	m3ZION2ymsLyN7itbb1yCzWvl56yFMvEMjN1e8pVDy3XZ7ijMm0yC95+cJk6IpDH
	v8koSDGi8iWltrPLN/z9Y4mZvadswu2Bwm99szGZTw1Bsrg3ym+GMcq3gZ5bBlok
	X6m/voWJpmaZlBjEmrtRfRyAfpCXCpsoD/XC50ZsSyiOXUY0nfNQMUAHUfJHyg7a
	5EchhgxfJjSiSvhzZZaDEbXPL5z7A==
Received: (qmail 1452867 invoked from network); 20 Nov 2026 12:19:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 12:19:59 +0100
X-UD-Smtp-Session: l3s3148p1@PqSwbLNgduUujnuU
Date: Fri, 20 Nov 2026 12:19:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v8 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Message-ID: <awAs386mgR23nmJ2@ninjato>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
 <20261118-paul-v7-3-rc1-edac-v8-2-ed791084cc19@bootlin.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-2-ed791084cc19@bootlin.com>

Hi Paul,

could you comment on these, please?

Happy hacking,

   Wolfram

> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] EDAC/cadence: cdns_setup_mc() reports SECDED mode when ECC is
>   disabled
> - [Medium] EDAC/cadence: missing memory base PFN offset in
>   cdns_mc_err_handler()
> --
> 
> commit 75a0021a276efa3f6b0c9a800bd2617eb0141dff
> Author: Paul Louvel <paul.louvel@bootlin.com>
> 
> EDAC/cadence: Add Cadence DDR EDAC driver
> 
> This commit adds an EDAC driver for the Cadence DDR memory controller on
> Renesas RZ/N1x SoCs, supporting SECDED error reporting, software
> scrubbing, and debugfs error injection.
> 
> > diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> > new file mode 100644
> > index 0000000000000..a3b72116ba129
> > --- /dev/null
> > +++ b/drivers/edac/cadence_edac.c
> [ ... ]
> > +static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
> > +{
> > +	struct mem_ctl_info *mci = dev_id;
> > +	struct mc_priv *priv = mci->pvt_info;
> > +	u32 status, err_addr, syndrome, reg;
> > +
> > +	status = readl(priv->io_base + CDNS_ECC_INT_STAT);
> > +	if (!status)
> > +		return IRQ_NONE;
> > +
> > +	/*
> > +	 * Hardware is not exposing how many CE / UE occurred since last ACK in
> > +	 * case of multiple errors. Always set the error count to 1.
> > +	 */
> > +
> > +	if (status & (CDNS_ECC_INT_STAT_UE | CDNS_ECC_INT_STAT_MULTIPLE_UE)) {
> > +		reg = readl(priv->io_base + CDNS_ECC_U_ERR_STAT);
> > +		syndrome = CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
> > +
> > +		err_addr = readl(priv->io_base + CDNS_ECC_U_ERR_ADDR);
> > +
> > +		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
> > +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
> > +	}
> > +
> > +	if (status & (CDNS_ECC_INT_STAT_CE | CDNS_ECC_INT_STAT_MULTIPLE_CE)) {
> > +		reg = readl(priv->io_base + CDNS_ECC_C_ERR_STAT);
> > +		syndrome = CDNS_ECC_ERR_STAT_GET_SYNDROME(reg);
> > +
> > +		err_addr = readl(priv->io_base + CDNS_ECC_C_ERR_ADDR);
> > +
> > +		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
> > +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
> > +	}
> 
> [Severity: Medium]
> Does passing err_addr >> PAGE_SHIFT directly to edac_mc_handle_error()
> miss the physical memory base offset?
> 
> On Renesas RZ/N1 (r9a06g032), system DDR starts at physical address
> 0x80000000, while the Cadence/Denali controller logs 0-based DRAM offsets
> in CDNS_ECC_U_ERR_ADDR and CDNS_ECC_C_ERR_ADDR.  cdns_setup_mc() fetches
> the /memory resource into res and enables SCRUB_SW_SRC, but discards
> res.start and leaves mci->ctl_page_to_phys unset.  Without adding
> PHYS_PFN(res.start), edac_mc_handle_error() reports a 0-based PFN and
> edac_mc_scrub_block() fails pfn_valid(), silently skipping software ECC
> scrubbing.
> 
> [ ... ]
> > +	reg = readl(priv->io_base + CDNS_ECC_STAT);
> > +	if (!CDNS_ECC_STAT_IS_ENABLED(reg))
> > +		mci->edac_cap = EDAC_FLAG_NONE;
> > +	else
> > +		mci->edac_cap = EDAC_FLAG_SECDED;
> > +
> > +	mci->mtype_cap = MEM_FLAG_DDR2 | MEM_FLAG_DDR3;
> > +	mci->edac_ctl_cap = EDAC_FLAG_NONE | EDAC_FLAG_SECDED;
> > +	mci->mod_name = pdev->dev.driver->name;
> > +	mci->ctl_name = "cdns-ddr-ctrl";
> > +	mci->dev_name = dev_name(&pdev->dev);
> > +	mci->scrub_mode = SCRUB_SW_SRC;
> > +
> > +	dimm = *mci->dimms;
> > +	dimm->nr_pages = PFN_UP(mem_sz);
> > +	dimm->grain = 4;
> > +	dimm->edac_mode = EDAC_SECDED;
> 
> [Severity: Medium]
> Should cdns_setup_mc() set dimm->edac_mode to EDAC_SECDED and continue
> probing when CDNS_ECC_STAT_IS_ENABLED(reg) is false?
> 
> When the bootloader has not enabled ECC, mci->edac_cap is set to
> EDAC_FLAG_NONE, but dimm->edac_mode is still hardcoded to EDAC_SECDED.
> Because EDAC sysfs exposes dimm->edac_mode via dimm_edac_mode, userspace
> monitoring tools will see SECDED reported as active while the driver also
> requests the ECC interrupt, unmasks CDNS_ECC_INT_EDAC, and exposes debugfs
> error injection on a controller with ECC disabled.  Failing probe with
> -ENODEV (as documented in Kconfig that ECC must be configured by the
> bootloader) or setting dimm->edac_mode = EDAC_NONE would avoid reporting
> active ECC.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com?part=2
