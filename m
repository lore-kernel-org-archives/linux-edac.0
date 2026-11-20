Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795189333;
	b=vjMCPqU+i8A4lv9kdlRTd61CXTWMU3opr7kTKZ211WkO/+Hv6/lIrQ1KwPX9w1vl/OGe
	 qoQFuWI2gsBH/Eap/s/HRGKY1M3r53HfXW02ZS3nOw53Z/DbmUu0vacS6s90ulIRVbwnb
	 F0wbMvT8etvMDiUu1pvfdZ0oFmnDC1XUj+6rYzAbVwiLwGBeAJhlyMvC87jvrfU8e9kCm
	 qblT49EEM9/6kHPmsBI3IhFqV90twRQGM19LnJ2SPNNcNbF7MDQE1Y1WjuNYMwLzN46kK
	 gsdk3vIxaI8m+QHLmIWdEHZPMnZqqRzlnA38w/32tG1hHtJ7Rkayhxb7BSBKorGqpbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189333;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=rfoD35vTZZX0sigBsALdIqocioomDzHuR9WZvMkdGO4=;
	b=DPHn4lb9hPmLC9nSzWqbhXLtLYa8ZBG9vEEuw+gEFWjNHy9Bd6J39Y6IhUeHMQ9gh6Nf
	 hCiKRAYBcw2c2iVy/e4fMEUWoGaRYTNwO4GuFYSXCqJnUUufexKICQbEEqWEmWgd9B9nN
	 KyPd7ae6ORtax0Fi/ziPP7uCyL1E08Zvn38P4TfjpDrfNsOdX5p0SjHpaabuX8rFbh3A2
	 Yey4TiEzk4pHl7KB7+GdfxW4CjH7lC50uofwfQfR+Y65j9XN6MjJGC2v5IEdXYeayEIYi
	 xm2eh0ZkWcbCPLjFfAN7+7tcEYOQGkFSOJxkFYQndcnozOhC04c1hQmBUYe6pak+Tbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=utSS9xUN;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B722606A325;
	Fri, 20 Nov 2026 15:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B722606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=utSS9xUN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34E56C6221F;
	Fri, 20 Nov 2026 15:42:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 74FF6601B9;
	Fri, 20 Nov 2026 15:42:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 320AF11BC03EE;
	Fri, 20 Nov 2026 16:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795189329; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rfoD35vTZZX0sigBsALdIqocioomDzHuR9WZvMkdGO4=;
	b=utSS9xUNWsQ5vzBs/Jr/W9SrHIOlyJPtGKIBTth+/cvrATnVF+d8yE7TT0imniMhyDvtK3
	sLCKlEr56EjJ7kvHOnqSI4UDUCCvHLV7ElQ4gAsIEyxw/Ee0Yk1dZ53EkZ0eObd/bbWbqV
	faihchOxJsNyH5623O12GDDsd4wXnSfXge3O24qe33NaLm/kqjJZTKWCYyKXa7uxTZVsRy
	fegXnZZlO6ksEVzI0vfCivKp3YJykzqlsFscbTF6jB9mmTaHA3wJUMx/5Qd5OZJtR/wqqY
	g4xM89hS8ygmrLx/lfxLtsMqy10r/pSsFJ+BzEBmuazrb1L0K7h6bbFLyMQkOQ==
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 16:42:03 +0100
Message-Id: <DN05I5YO7GJP.2JUFMLWXFSOG7@bootlin.com>
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Paul Louvel"
 <paul.louvel@bootlin.com>
Cc: "Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v8 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
 <20261118-paul-v7-3-rc1-edac-v8-2-ed791084cc19@bootlin.com>
 <awAs386mgR23nmJ2@ninjato>
In-Reply-To: <awAs386mgR23nmJ2@ninjato>
X-Last-TLS-Session-Version: TLSv1.3

Hi Wolfram,

On Fri Nov 20, 2026 at 12:19 PM CET, Wolfram Sang wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential
>> issues to consider:
>> - [Medium] EDAC/cadence: cdns_setup_mc() reports SECDED mode when ECC is
>>   disabled
>> - [Medium] EDAC/cadence: missing memory base PFN offset in
>>   cdns_mc_err_handler()
>> --
>> [Severity: Medium]
>> Does passing err_addr >> PAGE_SHIFT directly to edac_mc_handle_error()
>> miss the physical memory base offset?
>>=20
>> On Renesas RZ/N1 (r9a06g032), system DDR starts at physical address
>> 0x80000000, while the Cadence/Denali controller logs 0-based DRAM offset=
s
>> in CDNS_ECC_U_ERR_ADDR and CDNS_ECC_C_ERR_ADDR.  cdns_setup_mc() fetches
>> the /memory resource into res and enables SCRUB_SW_SRC, but discards
>> res.start and leaves mci->ctl_page_to_phys unset.  Without adding
>> PHYS_PFN(res.start), edac_mc_handle_error() reports a 0-based PFN and
>> edac_mc_scrub_block() fails pfn_valid(), silently skipping software ECC
>> scrubbing.

This is correct.

The datasheet says: "Address of correctable / uncorrectable ECC event" for =
these
registers, but DRAM is mapped at 0x80000000.

>> [Severity: Medium]
>> Should cdns_setup_mc() set dimm->edac_mode to EDAC_SECDED and continue
>> probing when CDNS_ECC_STAT_IS_ENABLED(reg) is false?
>>=20
>> When the bootloader has not enabled ECC, mci->edac_cap is set to
>> EDAC_FLAG_NONE, but dimm->edac_mode is still hardcoded to EDAC_SECDED.
>> Because EDAC sysfs exposes dimm->edac_mode via dimm_edac_mode, userspace
>> monitoring tools will see SECDED reported as active while the driver als=
o
>> requests the ECC interrupt, unmasks CDNS_ECC_INT_EDAC, and exposes debug=
fs
>> error injection on a controller with ECC disabled.  Failing probe with
>> -ENODEV (as documented in Kconfig that ECC must be configured by the
>> bootloader) or setting dimm->edac_mode =3D EDAC_NONE would avoid reporti=
ng
>> active ECC.

Good point. dimm->edac_mode should be set to EDAC_NONE when ECC is disabled=
. So
that when ECC is disabled:

# cat /sys/bus/edac/devices/mc/mc0/rank0/dimm_*
0
x16
None
Channel#0_DIMM#0
csrow 0 channel 0=20
Unbuffered-DDR3
0

Instead of:

0
x16
SECDED
Channel#0_DIMM#0
csrow 0 channel 0=20
Unbuffered-DDR3
0

I don't think failing the probe is a good idea, but it should not expose de=
bugfs
error injection for sure.

These issues will be fixed.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

