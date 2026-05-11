Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E5E346FA0;
	Mon, 11 May 2026 12:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503936; cv=none; b=Pw7ff2V1zXiTQgRrPgkU7TygS3HKt71fFc5EXEFRMO2qg06G36D/4hx09YTGHX/GAYqznrIutNr+jtaNSecockFENsFnTvVRrQs4mquBsGC/x5VkIiFzFPkyObYOa59vPxKanZHznioOcfcqESMF5LGxpt3FW85wM+Y2SdCE6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503936; c=relaxed/simple;
	bh=Gf8z+pND1JqjyyjImbkn5Ya6PxgwNq6Z9VoAKm+uPhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaTBbpbYUgcmn6wX/Z7N/gv77O1Mqxxa0zWxihdtBxphfrfhyvBiwW4HiAPFOLv3fgWwUFqSVnvwImkivHbgH6bzv3FQ3VYsKWveAxQesXJH494bVAP9fPjZRwGMeFFO8cRWlDT4aHJjxJFeKvPn0hq2zfyC32NGxkq7Z6bPkn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=SAG+6C8k; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="SAG+6C8k"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7A07340E019B;
	Mon, 11 May 2026 12:52:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VcxTi4QAB2Ac; Mon, 11 May 2026 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778503921; bh=p4x03gxamVUrwTkQoHClNLVcwB7HX4qPfOiqRvPByf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAG+6C8kKSrETJ0k1OF7tt+TAg866BNRy0AQZzeW3AJn40pJuk1DaOXM340mlIfmy
	 tUb4Hh73GUblWSKxTkw/lSjSdjMDZ8/UjA9C7IBLJyp2VMbB7YX2n3o4CGo4a7Cljm
	 XgtAn8wB05Hwup9zDXWNiMAtB+Cn+gbBI8MS+NbdVtLE865uhJQE2CLaadNyvs9Set
	 xoV/hyE9aXmYkVGwkhkNS21SEmH27uybGDn9gDBaW2A+E9zlvhNZlpmhuf/mCPPe6Y
	 lyMMlfewbR9PNMCjl8X4NERb3fWgwXeoVUQQZ5f6H5O2cpKkoWQYV3LxISNZHmD0Mk
	 QKa1uhmpAcClMdI5iZ+iBIGsNJIcvu4yed7HVca+3nVsT0LrrNLdfoLUaQ4JKLzCiV
	 UNSP07cvlxq0neNwbkEYW6HoDdYMfROP7Q6me74meWc4a/K7NsH8iOhhBihUqHfGA1
	 apt/xovYx/ulDlzeKvXfC1aBifp6Khmk1oYcMEP7QdlyicuGM0hZlpBl7/PDlyOXCw
	 o4AR4RibrfI+YTP7SaacwLFFX0CSmo4y9PpdsFvTUUpy7D+Pdp46hJZWtcjPomkSyr
	 /DFcX2Obu8fjPoIbFHWnFgUbIsh7z/4KNi0t5cj08e2NbDCE78XMusR2UkviMoHP0c
	 NLF/uKg6AGbZq8uSP1IhFfDI=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5764E40E00BF;
	Mon, 11 May 2026 12:51:44 +0000 (UTC)
Date: Mon, 11 May 2026 14:51:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andrei Purdea <andrei@purdea.ro>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	david.laight.linux@gmail.com,
	"Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Tony Luck <tony.luck@intel.com>, Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin>
 <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
 <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
 <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>

On Mon, May 11, 2026 at 11:59:34AM +0000, Andrei Purdea wrote:
> No, the current code copies "error_ip" with null termination, and it
> drops the "c" suffix.

Pfff, that wasn't really clear to me from the explanation of strscpy...

> And that seems buggy. And that's what I requested to explain the effects of.

Shubhrajyoti, does that have any visible effects when using the driver?

> strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);

No, as said "[h]owever, just to make this safer, we should min the size".

IOW:

         strscpy_pad(chinfo.name,
                     amd_rpmsg_id_table[0].name,
                     min_t(size_t, strlen(amd_rpmsg_id_table[0].name) + 1, RPMSG_NAME_SIZE));

In case someone goes and changes that amd_rpmsg_id_table[0].name in the
future.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
