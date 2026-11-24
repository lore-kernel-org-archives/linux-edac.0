Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795485398;
	b=MIlwXF4Gx0BE7ydhWA0JalrX7zgyZN7cYofdPipOYSaObTUWFfQ1R3N/06Lpl4GRyQL7
	 sfYg5/GqfuqIPMUoekFPEMGCrs/hgJN8rOacDoCam/JEnxm21GVDEVIrbOw63RiLLOaK9
	 A5iCddNupfEEBnB4DcJA7KG2zZJErYXZzBZnlicX7MkHZenG/8u+sN3dXWY4kQlpM92hX
	 0BawynjVI5EhkEirsoHkojMEtHxU+jSiZ2KJrj7UD6LZ7TZBapXigaxv54g3VRHCdkR4z
	 T4m+jM+ZmnSvxJpnoL4VLPHew4kgJcwY0yWU1HJCoVL446HI3Dj62jQFdsPcOqEUmYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485398;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/BV4gF9anlp/vhEs1eSoZiwvaB/0YNfFV5KJA/y6dt4=;
	b=VD1lvs0dM4bYLC9RnfRPnSBPcJeGtzALiVmM16utCgkVVC5S3jGTQSwFP+pahv4HfIcY
	 pAWk6mqGHNA4WNMlo1ZfwIanCljWYZW3b0PucukvNZR18hTCIaZXPW4l5K/w5/fRF6wb5
	 6UqffDmLF5iIpwoQn/qoz0kJn3Z2C2HUve5bZGbl5mA6X7J1ab8OF8Lw+Hu5G10h4MXz0
	 7GyJ+C370pqu9sib9627VE292fPqRLR9tQ/ugUp+3jDEpBC86w1XdZFlrb6WNyarfOJ5E
	 HIyp29vZumo6usHxZCZBDrKRWyfORQO/FK87ToW8njKOl+fyF8WkJyQfwwsGWngsI0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=AT7UDWR1;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B989606A32A;
	Tue, 24 Nov 2026 01:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B989606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=AT7UDWR1
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1E3E640E02CC;
	Tue, 24 Nov 2026 01:56:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LTomsy0WpWZY; Tue, 24 Nov 2026 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795485391; bh=/BV4gF9anlp/vhEs1eSoZiwvaB/0YNfFV5KJA/y6dt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AT7UDWR1BsBBUbdi5SPK82sY8fd3U7cC58aKVHi5V5Pq7rc8Fh4fY/TbK7CqCH5H8
	 MIrnM1coeZgEG70Y7Lr3GYPzUqCrKT76t/KqtKHy18OXDU7HhmPbGSd6kJ4kPXbcZs
	 WQ9mHiB5og6GVLkdZLP9vnUTL0DWRnYlPRUL15skNCy7djC91Xy4nRYQT8C9Hgww2/
	 dbqAbNVJ+FrmC0IdGKNhhHZ2P2UPbxj2zSj+IuZQL3h8kELmgvxAZHYepD0UaRSkrh
	 LPKl5BveYI5rfWtm89QT2LFXKbGuU4kpbvayfyyBO8xlrwrW5+vKlgZ+fBNEMXGjER
	 G2k5kQ2F5Xr/lg6kjx7+hmqiKYaLgFCIPTenWo+jAE68nJYy3p5v1de5FMPOQB380F
	 4dcAlrOQNYoT9f/QIdJ0Nkc5JrGfgm7WxsGZIk6FovUhRFFveEQ4RD3/D4+7S20IsE
	 2aWosI1GRRHN/NPit4qNNQ5jjos22AUO2HlIFzum/SAgqZdpJp33Jp3NYFaY2VMMYT
	 Ij6cQ1jLaYShd8UntELLnrMqgIdB7GSwOqQWeGgdSsmeoLZgQFQWmmO+3Jsj5ZItJE
	 BwTDnPUNS/atubrUiT6Ahzo7UhlIScqS/aY7ZcTzDKgkvcB5ngt72SIjkvcMotXFgx
	 jmcIctZQtr843g99IzROsb4M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AE4DB40E0240;
	Tue, 24 Nov 2026 01:56:18 +0000 (UTC)
Date: Mon, 23 Nov 2026 17:56:15 -0800
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	michal.simek@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/12] EDAC/versalnet: Fix device_register() error
 handling in init_one_mc()
Message-ID: <20261124015615.GIawTuv3nR0SJ0ZsjR@fat_crate.local>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-2-shubhrajyoti.datta@amd.com>
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
In-Reply-To: <20261118142213.100581-2-shubhrajyoti.datta@amd.com>

On Wed, Nov 18, 2026 at 07:50:25PM +0530, Shubhrajyoti Datta wrote:
> From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> 
> When device_register() fails, it must be followed by put_device()
> rather than kfree(), because device_register() calls
> device_initialize() which sets up the device refcount. The matching
> release function versal_edac_release() handles the actual kfree().
> 
> To simplify error handling and avoid complex unwinding, split
> device_register() into device_initialize() and device_add().
> Initialize the device early so put_device() can be used in all
> error paths.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Co-developed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Add the codeveloped tag and remove the non standard signature
> fix the name stack warning
> 
>  drivers/edac/versalnet_edac.c | 36 +++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
