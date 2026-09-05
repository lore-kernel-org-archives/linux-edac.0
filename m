Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6CE35C683
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621759; cv=none; b=AkhwD73iKOk6GEgZJlpHtSTtrbQsvDlbNk8qnSz5gepZmY1IRfi1B1AcxnzZjd11eus82/wRZTDbHGLIKSap43ezJuZpUED4cEu6PVDUTOe7Bs4qulvFdHFZ1ZzIPRd+i78gJjDODGQhR4hOr8gKTbU6e90aJkDIfQC697hSSfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621759; c=relaxed/simple;
	bh=stE75XH+VoyliaLEVzRsIQuDTfaIfORb7fDDrzhIzIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8sBAP4zWvxG7UYVMK+M3JI4v1YUMTfFe8SIxYib8sfeJBDzOP72UHTxCLXyiwKxh59ZtBzJ15mERyxUUCS1KJLUqPJCGSl4/m2XgQcnzijRP86g63mBeaZI3D8raqwHKCQTjJ0Avdgu8R1C8pfRl+S41OUMOigoS/c7C5Ff4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8VBuZdB; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8VBuZdB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48442ea8f59so2527661f8f.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 08:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788621756; x=1789226556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=R8VBuZdByeAmOt2hgeiAFGbVlzYgkzSSgERPwbBPl7cKgG7HsAyE6M7wK8FxgaTYDA
         jnP+A+T1Q6ZI+Bo4qeibVLWDiR06l1YcNMjWu2BYr7VrQfI5ucQnodCaZfkn8hspCTgd
         xCMer0DSJqBa8O0qupacAgvtYunxyUJjL4rIi+wrpTWGYeK5dp6zqe60eXADpuTwfQ/t
         /87fOBp5cbjOPlen9dN8IxYE4/A6hx0uqYR6wiE6AVuPHlFBEhiJiB4zNbKn6T2B0bcH
         NNdHWzuUKhMn33Nyu7ZyUhAZJTBLlPivctwY6668dsBNKyxoD5AohDNaYLPCggO15xHC
         3ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788621756; x=1789226556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xiwfJ3u464HVWwKQuOirA1XlcYzmmwiUzq3bDqr5FyA=;
        b=f1uTbFim6rYh0QN+YqtgQ4LGuln08BQkaMbA1DypNwMWz3HB7Ifehfyy/Yl7tx5Gsd
         Vigj6UVM+VR2MfaRu0HNjEfd7UcpCPlAIB6NmhemqlCOfUTXBUsKCBrUWc+44XFGsufY
         1MWUGWwVUfrI8lT4Oo2eGk13VxDq8eUrK0q/57FJ0m27aEFzUVlXA45dgTTtMd7GiKED
         MvsfNMOG59r4gOCEA4mBpjD9EeR2jqlu/BYvdZ59YezkNB5SR+mIAmp1JGw0/JsCAg8I
         r+9WbL9IdWoOE6xrPu0iQo+Zwnff/hhJci4Sdwru5ZjyQZ8kmYtbpZLvF3ZA1dhGMEEe
         kQ6A==
X-Forwarded-Encrypted: i=1; AKwUvByxsdiLfkpioja4vRXU+pxl9Jfzvsia0/iTiSKmnBqu44bruLRMrvxQ8VsF6cMCHmju2PAXomXpvOHk@vger.kernel.org
X-Gm-Message-State: AFuF++lqpsNnPfYzAXH5jBZHHSr760wUviuaBibw3QvVJemaic4hCE50
	Apn4s0c1uNFeCefwZIEBD0mNKo2hva+JS0nRKcqwFLnSPjiNV9iywcD1
X-Gm-Gg: AYBFou0y/dDFlhB0xbliZ+B5PFqQ7Ma02TUUW6gFiWwetk73rmmAirHDZpEpTsz2Ah2
	q8QDbDdHRsoeJGIa1YG1Nj8ogvgr+IlXMGbKkKggdFS9jCaf/gK+FINQdm/OK0OLvqXvUwhs89Q
	8poWppLnxPELfdG3JclpCmNCuGifAmaKrPpJCWoossNQigngos5qGmTr5NNBKFlMbptTEVXiI7D
	N9gwsHwCGJk7aX7gAQiGae8TF5RkWA77Iob0adskKBh+JJKN6Db6lk9vE4PehI6V7JrlP+N4/+a
	8qULiHdz1K6pU4EhFu7yDkYQxNq+yNWlOYdszMaZZjsp2fcCmHZJxK0IXKeEkIo1hgRwko79nFl
	xUOwqSnV7WyMN9T7K/c54HTn5goFwqm5KVyRNvcdHXN3GX6OPsYDVrjF3ekqxVUXOWZZMrBLbjq
	8jZ4oGq9s2aB0h53NMAYeNA8RzGRDSW85jy2k7+GN+t5x3sKPJmT3mSkP9QIBK7Dlk8cOlF5yGz
	c9AsKMvNVldbcDmXI8nipu238qU3w6LG/dsVvYzmWGMiII9PSckr/2O8YNT6bv4mWVskwK2X13N
	DROSoGLGFryrxml2FwxgyvgEaIVV13ibHMO8tWZlBgog0H8JAGa/+YSN2aBGbUjB
X-Received: by 2002:a05:600c:6303:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cf82cbab5mr112017265e9.6.1788621756075;
        Sat, 05 Sep 2026 08:22:36 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm246185335e9.3.2026.09.05.08.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:22:35 -0700 (PDT)
Date: Sat, 5 Sep 2026 17:22:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <apwzmSr6b0WEkW86@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
 <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>

On Sat, Sep 05, 2026 at 08:13:45AM +0100, Borislav Petkov wrote:
> On Sat, Sep 05, 2026 at 11:46:43AM +0200, Karl Mehltretter wrote:
> > edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
> > edac_stub.c"); nothing parses it any more.
> 
> Nope, it was:
> 
> 7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")
> 

Good catch! I will send a v3.

Thanks,
Karl
