Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824849B5A4
	for <linux-edac@vger.kernel.org>; Mon, 21 Sep 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002464; cv=none; b=FAzB0oC4XEftCgfK1+hORMXUcGrywlQ7ACG1OYqpVZZen9w+7y9+P7MhKRuZEB9LibyXNVln57F953/D5ZbhdzksTDVlAL6YtOiO/RJTuevBtcOvDaYa5irXIDxE43RBZ/K7cZ+VOyf4kktpo+IiXPMOBSB08h3XEy84sN5r4sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002464; c=relaxed/simple;
	bh=yyPLV3+Ro5C2XR3LA/FZ/qEHrvLy3j0kue0Tnqcd6+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1twBSrksYb1bnokNBB7WoJnmmKz6ZMU2/hkwHt1VUoRL6G5MyPIv0TizMJq8zSucI4kd3WIdPscTZj2hRPJCtCRMIrfTlywC8HOnCAeD3srRrNgtFFvqbdFEPwF09MlS60JPvuzw+lvm2qe42+Zna0yuFwGX8WqkcGM7mSIPpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxiX08PM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxiX08PM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a147688bso3182350a91.1
        for <linux-edac@vger.kernel.org>; Mon, 21 Sep 2026 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002462; x=1790607262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWp+iLlQMdqyfouFS2cFnYcodix/vvF9kBi7DXbEuGY=;
        b=JxiX08PM3FYpTFXpUZOUYIv27chF8qL4DBrGwdUB0lje+6BTWzEtKvu99rjZVT+lHn
         fMWVsV4ythXy2vkWZ0MxOCh0l/QEdnCb7bdj72qJuLO3fKCd+5/gc8vzYlt67Q3yAKrI
         S7awHLlKnHMb+QCkpfbqCyTzZ9QjBfB3PrUvjE0GqpNdyVh1BTmc6h60dMYMRJWjv9oA
         B/AOgpysYsX/LF8NKz10MPl4gtMObEAOfcSl1GXvwoyRW3Wh6z1BC5vojx7dsoqzzahR
         qwhNoPK09zkQ4U6NWi+1rKT/K6RSyGGfzygZoWOEAImD5Ocuyo775HUqbCu5wACfT2sm
         a3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002462; x=1790607262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWp+iLlQMdqyfouFS2cFnYcodix/vvF9kBi7DXbEuGY=;
        b=OoZlVMezVQxisIQhRietioObMI134F3k3TveH2jRYWYlKXiyKM1J2TSvAtQgAq2XQJ
         S1TjANWC/HCTRXPh1+bYGtL07VHoSBuF8YhXOMpPAUNtBRq5qlJsmcjd3EgnU9ghbOzy
         vnZLO6uceUeRVbmNNvRSkedRuFPQg9REes/JMCOe8H73sZMc+5m1qMb25pI+eBLRRv4m
         xkog67tKZXPFH4WwcgT8j1VvKqHLqTqsN/UHl0vcYyfgmTWOcpiAjBtMeoh3WIYDlxiF
         b7UBbh/tk3UiA66IY8yS7vpdJfLN4+fK9dLpL8LtymJ/wI6w2YsQ+W1KfFJ45g0ML9jT
         zUpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzguxGa+baS4yNdfzDGiEIE/3QggnthpTgLgdk/OSmjXR4tFHTgEUp08BB0L5PhGNQrYGqh9YHR7vtb@vger.kernel.org
X-Gm-Message-State: AFuF++mzxBBY4fzbo2HCjeOIBHozzgiHcbk4GkVVM/5ES9MetiVb1FS5
	NPfdLEeb376GlmSKrX7aqctJRaLUUCp05EpOj0NJKUxCzkOBOVDpDBNo
X-Gm-Gg: AYBFou0xLOtPk4JIyJmWjEo34SHitoHeObUq0tsBTYlwTzqvfuZqcT0e8GSeLA7+B66
	o7bWqbaMiqM1MuEw2/FQL8Cfg26Aa8MUcBEwB3iOvxoMONMvbPA1zZLHD+ScggQRcTwEzA/eBbc
	Z23x6NGjQabQb6N99jgbhJbDu/I6H2Rxxs4hi82rVO3VPlXFBA1pno9LBafqz6hzyksNuzAW5HK
	1W+raOPUBT7Yn78cKfvEP3oB5yjUmdEPTWtwDQxRJ5bAR0yYXOYQj2IGSVKvzA/fRkhCiyRKHeT
	f4XiPKcEDii6wSiUWc09e9LiMiOVNo3dXt5qJijlzYD4j25rPHJJIAQg3UC26O0trNA5YJluWkq
	vfnrrZtDcJuowLQ6n8QyAquSSSW+YHAfRnxPDg//bsqLgtIlJ5il6kIkMEfqtBvnnC5wVYbeQ1Y
	MN+UDXDWWPRyriYKitLFINjx4BZlwQMp42l7F4b8vazofVVU1tbmfYxKdEA4f+NU9X3MmYX/pTv
	m3U7I4Y+w/T
X-Received: by 2002:a17:90b:1cc8:b0:39e:1329:7816 with SMTP id 98e67ed59e1d1-39e54d703dbmr16759570a91.15.1790002461942;
        Mon, 21 Sep 2026 07:54:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a063bf8ddfsm445424a91.14.2026.09.21.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:54:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Sep 2026 07:54:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Borislav Petkov <bp@alien8.de>, Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>, x86@kernel.org,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/8] hwmon: (k10temp) Stop matching Hygon devices
Message-ID: <b292d054-f0cf-4695-94a2-40f0d71563f8@roeck-us.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-6-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921055603.25112-6-wanglin@open-hieco.net>

On Mon, Sep 21, 2026 at 01:56:00PM +0800, Lin Wang wrote:
> k10temp matches the Hygon F3 device, but derives the node passed to
> amd_smn_read() from the F3 PCI slot using the AMD fixed-slot mapping
> (slot - 0x18). Hygon PCI slots do not encode DF node identity, and
> their SMN roots are grouped by socket.
> 
> The derived node number therefore cannot identify a valid Hygon SMN
> target or provide usable temperature monitoring. Removing the match
> does not disable a working monitoring path.
> 
> Remove the Hygon PCI match and Family 0x18 branch. Hygon temperature
> monitoring will use the Hygon node and SMN interfaces in a separate
> series.
> 
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/k10temp.rst | 8 +++-----
>  drivers/hwmon/k10temp.c         | 5 ++---
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
> index 91b99adc6c48..9680c4f3383c 100644
> --- a/Documentation/hwmon/k10temp.rst
> +++ b/Documentation/hwmon/k10temp.rst
> @@ -28,8 +28,6 @@ Supported chips:
>  
>  * AMD Family 17h processors: "Zen", "Zen 2"
>  
> -* AMD Family 18h processors: "Hygon Dhyana"
> -
>  * AMD Family 19h processors: "Zen 3"
>  
>    Prefix: 'k10temp'
> @@ -128,7 +126,7 @@ it.
>  Models from 17h family report relative temperature, the driver aims to
>  compensate and report the real temperature.
>  
> -On Family 17h and Family 18h CPUs, additional temperature sensors may report
> -Core Complex Die (CCD) temperatures. Up to 8 such temperatures are reported
> -as temp{3..10}_input, labeled Tccd{1..8}. Actual support depends on the CPU
> +On Family 17h CPUs, additional temperature sensors may report Core Complex
> +Die (CCD) temperatures. Up to 8 such temperatures are reported as
> +temp{3..10}_input, labeled Tccd{1..8}. Actual support depends on the CPU
>  variant.
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 3e7e63edc6a3..e0a7211a513c 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -64,7 +64,7 @@ MODULE_PARM_DESC(force, "force loading on processors with erratum 319");
>  #define F15H_M60H_HARDWARE_TEMP_CTRL_OFFSET	0xd8200c64
>  #define F15H_M60H_REPORTED_TEMP_CTRL_OFFSET	0xd8200ca4
>  
> -/* Common for Zen CPU families (Family 17h and 18h and 19h and 1Ah) */
> +/* Common for Zen CPU families (Family 17h, 19h and 1Ah) */
>  #define ZEN_REPORTED_TEMP_CTRL_BASE		0x00059800
>  
>  #define ZEN_CCD_TEMP(offset, x)			(ZEN_REPORTED_TEMP_CTRL_BASE + \
> @@ -475,7 +475,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		data->read_tempreg = read_tempreg_pci;
>  	}
>  
> -	if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
> +	if (boot_cpu_data.x86 == 0x17) {
>  		switch (boot_cpu_data.x86_model) {
>  		case 0x1:	/* Zen */
>  		case 0x8:	/* Zen+ */
> @@ -583,7 +583,6 @@ static const struct pci_device_id k10temp_id_table[] = {
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M60H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M70H_DF_F3) },
>  	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M90H_DF_F3) },
> -	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, k10temp_id_table);
