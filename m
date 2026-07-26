Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4D3815F9;
	Sun, 26 Jul 2026 23:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785109974; cv=none; b=a9mnv1V62R+/xJV7jA5E8hrMn+UKT+UG+lBvG2t5U7HP0NXBgAtpqRX/6VuHqHs9adjo3j4976Pi9jM3HrV16JI/tqdpXhRZcDXISYltMzyzwkqyNHAesb4FXULt1jbueMJq038KcjpgbQ1W5bGklGtXhh11nFVPd+DE3LXPYYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785109974; c=relaxed/simple;
	bh=r8oUY+yZ373J6lFTSufV3H6eOiIFYlI7BKgYnwAxFFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlGBnpqmH1Azu6hhB/4vVCyIpIp0vF7BmtwdrddLdJK5ZlKmnZvWKkxBXr6VinLeIa8pFIJNTj1EIxvA3W2LW6kNL341+j+SFoRr7nV0Tyf0//hg1k50s/U6m4N11omArupfxWoJ8aRG9YuOeccM4c4v3Dau9J9FT7hvX1WRXLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Pg2ELqJf; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Pg2ELqJf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7D82940E0198;
	Sun, 26 Jul 2026 23:52:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Ou5xdoMmNViU; Sun, 26 Jul 2026 23:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785109959; bh=X2nPPRpw520Cf9WWdaZnNT01ZjOArHqB8OKwud71eyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pg2ELqJfSXSWqxfLI4fRtWWVbdN4T7igfvH5SSPHixpU2Yji4SONyX+SJpiIoyYiJ
	 I4g7bvjUq5fip5tNYj4lZ8OCrMXeV8GoY4Tk1p4AAnsLX/FSFnOtVQ4dEUg+Typ1S8
	 gE9KVY4mYQmysDgn5YEgokm4mA408568nzN1vf6JzfbtoWWVSwcCkN4HzdojEgbdxq
	 ARWPmIutzc0hwQuH6dd9FwvojifegxNwf/+6mzYPoDHM2W9Pkc84iuhHeV0xEYAHOD
	 0GIMlOLXXqL83W+3UMyXnAv4/BXKKoZjKGKv0kjIpnBJRuHYAjELavQrZE7IBtxVkd
	 2lMTawvBfgsf3j98+M0+hXg0RslMdjE8Y/PzYpIohdtelJFvNTaQ+YSdpzG537tTIz
	 wKAnNtvIlF8IqpQbBSBgcPMhI/39k3qYOuedStBtL5PF3Yqu6QsUZ+tCZBiAyQCQbH
	 hx4LSa7qj5KhINmFRqYstcKoFoGO0Za/idJpM0BWe6JA/6wkJqw2zw21wCAYYVHT1q
	 ou0yxzFJEMR0OlxjrBaBMxjHIeZl6EzL3jzwFxyosf7qicG8Ylxu3L3Izk/B1zcI4N
	 zdoxpEZfOXX8TPYbyFxlpM8N0glrcsvz2bd1VKqXjo6E5s3WsCo8qldHieB4wd62z8
	 mbxvPgYyNvLuZQS3lxbPiLus=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0388040E00C3;
	Sun, 26 Jul 2026 23:52:31 +0000 (UTC)
Date: Sun, 26 Jul 2026 16:52:28 -0700
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in
 handle_error()
Message-ID: <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>

On Fri, Jul 24, 2026 at 10:49:37PM +0530, Shubhrajyoti Datta wrote:
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index d1af5e175f7e..316f8f79c4d8 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -439,6 +439,8 @@ static void handle_error(struct mc_priv  *priv, struct ecc_status *stat,
>  		return;
>  
>  	mci = priv->mci[ctl_num];
> +	if (!mci)
> +		return;

You have a WARN_ON_ONCE right before that line which checks against
NUM_CONTROLLERS and init_versalnet() unwinds all the setup the moment
init_one_mc() fails for one of the MCs.

So why are we adding dead code?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
