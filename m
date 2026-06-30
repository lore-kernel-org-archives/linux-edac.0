Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90213016E0;
	Tue, 30 Jun 2026 05:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782797432; cv=none; b=OVTmFpUKDDyLvayvCyo/Z2Hq5hHVSYcOIc/1xJ78v/3ddG25Zqd6OsPKUHz3AiLwKjtxtQOMQG8MUx/qTJkELFm0L9+iPPpnEUPKEH54AHYsG8vQu3+SFUBnLT6tlq4WjISbeyaTxFDNnC3ay42p3wExoQjok+nc5waCVS07NKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782797432; c=relaxed/simple;
	bh=3XR3vh6hG/y3IU1Pu/OytO+siKJ6ro2HaJptszwEukM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYqx0bwmI+pTTcGTD7rCF8iSxtZ4CMx/aHFJmouQnDpH4kbnVTsRsQi7wahbOj8dtGWIQFHHGKRujmcmPVpP8amUxGA2MkYHwsB05Jp8JTY5258owt0lW0uWAg9cCZCah9H6nVMCYD8IQg+P3496HmDByO1URRDdL2BOQyFZumk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IkvkVdxj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IkvkVdxj"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0BCCA40E01CE;
	Tue, 30 Jun 2026 05:30:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RKqxhxuumoec; Tue, 30 Jun 2026 05:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782797419; bh=KL408WsnrA9DF76/zvO2S2u1R2tyZbwC18eIDXhAOng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkvkVdxjND6f+jOY8PULhd872dhu12a7J42AgQCvCiY2if0ckeq0amZukys7XCaBU
	 t2kYmiAnE9TcQEtYjfG3Bi+jL0Ek28JkuihaSjonV0t2BzJkbvSG6IeRzDhkAdMAlf
	 1v6vbllIC/B+FI68MvHB6843eq2Q8mUAP/ofkjQbRI5CjpsssswsiQdhm/b/1TXW6u
	 n49zBuRxl0wSKcKITRxjhj64qMJh0gmcVIuKF4uJfOxC9Qo1yu0T7ebV+xL9ZY5sxD
	 1pV2Vi+55s7F8BZ16Ig1lTHZVmudZZ3kuMOaidOluEvaE82ZC1fazSxstSMckng6hc
	 6MDePgtVMjMpwy7rHyiiuuf9nzrpV0CnNadIiX8Q1u4JqJ9Q5vbU5Z/druyxslJdfd
	 pJYDO09MxnJIfvmHP1aPVA7Xvgju1aYAq+KmwKaVJpSqz88b6iKXURdhLqYHiEe7pN
	 cQdKltoi7baJ+jjH0CcNSEwh++LQHlBZujjUvFOuz4lkwS/DH8QHcsCjcVg9ALv2Vf
	 jgX9+93dQ3AQp5b+BhOeOV20Zh+IQGZm2OJHF+odnSdpXAp2y3T703obUtxI4YoDaE
	 XIa55K5qXwjDud8wTjDaqGQLZP5299HP0FazAZVUWHeE9B1/ji8iPPGkeAwmPlJlil
	 vovppz5Lxg5NuryvVlE4fbvs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0D65F40E0140;
	Tue, 30 Jun 2026 05:30:14 +0000 (UTC)
Date: Mon, 29 Jun 2026 22:30:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v6 1/3] EDAC: Remove fake_inject debugfs interface
Message-ID: <20260630053011.GDakNUY33jOOZBa8n8@fat_crate.local>
References: <20260629150731.1009605-1-yazen.ghannam@amd.com>
 <20260629150731.1009605-2-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629150731.1009605-2-yazen.ghannam@amd.com>

On Mon, Jun 29, 2026 at 11:07:29AM -0400, Yazen Ghannam wrote:
> The interface has a potential race condition between a real and fake
> error when updating the memory controller's error descriptor.
> 
> There doesn't seem to be an active user base for this interface, so
> remove it.
> 
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260518160716.171578-1-yazen.ghannam%40amd.com
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Link: https://lore.kernel.org/linux-edac/20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local/
> ---
>  drivers/edac/debugfs.c | 65 +-----------------------------------------
>  include/linux/edac.h   |  3 --
>  2 files changed, 1 insertion(+), 67 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
