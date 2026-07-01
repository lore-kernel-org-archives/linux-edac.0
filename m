Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC101481659
	for <linux-edac@vger.kernel.org>; Wed,  1 Jul 2026 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911081; cv=none; b=AhqOF/KvosSABuWXGtSIF5xbPyxYVLlNf++khXuDNgmNmrI/kJQSXL9PaKzX32RZCrjTvESJgXu83kGTWZl7Fz8niR0nRQ4jjDlBHW72kHWwlxh6NdUDjckmS8+H4K7txPDKqcTRqALpwcykWtwG0sJez9mcjh9SBDEvNmo28gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911081; c=relaxed/simple;
	bh=Mhhpwy6g6VhSPzMWQ5TUVHZS6d81GzGUZkhLZI9ENj0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qd3LzLyq2WqthJeit9hCKo+WwQIrfCPPDKaD2B2/0hNQ8V60UyUsmvJnAl1iH+H3wcatEzgIsCMLFgmGJzUOS9xyoJLN5PPu4oQpKMbMLox7nUwLCYearoVpz5ks7oCkkAlYswsfXmPMullg/IFhRfEOp5c0qlydvkeqZuqs5KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KrNrG2Ga; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=krqpKCkZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KrNrG2Ga";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="krqpKCkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782911078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w6biIp+0KHy4qsl4qCvSx3Im1RKNm0cd7G0xQSd7+wI=;
	b=KrNrG2GaV1g4w1ev1N9fpJN7eki3CpSu6wzCJJbz/nUMoX8f8PwUNEi1yA3dehln7VLzQv
	7UkiUClWYJajtj/n+5ddosj5UEKStG8UosKS7WMyNtr5aUjZpIqgujo6XU9e7V+buqQwIW
	yBiMIvLJc7i5tf5T1dCFzMdcS7BbER0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-0xEfHKDgOWuaV5Hm7GlMoQ-1; Wed, 01 Jul 2026 09:04:34 -0400
X-MC-Unique: 0xEfHKDgOWuaV5Hm7GlMoQ-1
X-Mimecast-MFC-AGG-ID: 0xEfHKDgOWuaV5Hm7GlMoQ_1782911073
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-471c76f357aso556704f8f.0
        for <linux-edac@vger.kernel.org>; Wed, 01 Jul 2026 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782911073; x=1783515873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w6biIp+0KHy4qsl4qCvSx3Im1RKNm0cd7G0xQSd7+wI=;
        b=krqpKCkZm1wY/NaKmCkkJdMTeINrdPLYoHkF9I9bH8e9XFxHnW599x/r832E/YKaxr
         Up9Y8gYXDGZuG4XhLhw2Ny5agNpW1WA7nilCI5B7v79oF9/yfOyMioAtDUE4Z8i3GyVA
         ds32xU+skqmmn1TQzsMAVWUuXlE+BzNZAbwWkKWIuwGAQ4FrpWEjQgh74WO/PEkjVPm5
         gKWdx0gKMmCUB4D7gkfqzDQIYVQn3ZX9K3qbkPBUZDTtBmHzoyAXJrkGk15oTe1oH/zJ
         TCwzqFBZUQ+IuytkS92v7G1BgmxUG7vNSk/hlXt9aLEr8TY1HP1Sv8tZWRzoe1SYPuew
         /zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782911073; x=1783515873;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6biIp+0KHy4qsl4qCvSx3Im1RKNm0cd7G0xQSd7+wI=;
        b=Cmbno4APF6imm6RdrIsbPCAUgaI67/eWtFndiKFLQBGLN1JVJ7aqMGshKG67TkPcOS
         6cRTCy6kS5nnf/p/3Tj1ALe0Bs0oEHVPvz0lfHjuszEcaaZ5vld4YRnKFNS1rHVuwhpC
         BtZ7Ya+JkNRGOVC4Z1hWNpr09MDEnnZgdiV8sCEG5+LXKnweUwwGC7FEVl0B9BuNzKjp
         NQ/TmG6kKFjUJCHkV1f+ek/A7RR0gvuYujV7Bvhx9DSPSCqLlxtmPXyOJuVwZQdCM6O1
         4yCUVHbQXrtqjqmg8uvNmuc/OIri/ktQMHumFlYcE7TfkQTn9akQq61qEyrSl//WXl0D
         ZWdQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfEo1SXamcmxPVkkLCA6QiqG11gzyNvGp56QvuFl4QCvCwJAWaG01tsNTF7GFXA6C/KWlLUEvxkDi/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6paVQtnERESzL4RwI8mvz6GDqzbfFrPNjmej38LV5vloBTgdw
	vgHs4S6fcZ57hn+ocysZrnAyOmvQtBNnR2CHBUZdRmZRh6dzEGsFsMkDwi2s1vieujK4Z0mdLIm
	bRD+t48jpz24uGViDrSJFcoVmU10Lej8SKxg6qO0K7/JfqSEoqH26wEchzaq5Xh8=
X-Gm-Gg: AfdE7cnVvpEprv4A8IO0EKfHaYjoD3RyZJdVJUl02NFkAmPsF8IEdkAe65eJp7WoO9a
	9zWnZZBje8n8WwS7ApAMIq9b4qmzWHRSZXfNEj5mD9tfGjJBK8xP4MhR8DNzaIlDFsUuamuGKSa
	TvB84vzM9r6gwSpr4WxBYu7VCGRE1n9fAVybO3YD4UPYRgL4ZaWwuQeegoguKaaaCuMcncR55Xp
	U2qbIXldEEzkksFDrjfWGGxnUHcdvx+ub4h5QO52z17U89nyglPrPuteUJmGn42bnGgHl3K3JJh
	e74D1eq67U6be6+xlG14PIsf4auUpjyvEniwVOnFC2VdPcof2nNvcge8FLuqzvax7tJFIoTdyfo
	lPhpiHw==
X-Received: by 2002:adf:fe50:0:b0:474:4525:eb55 with SMTP id ffacd0b85a97d-4775a7ca02fmr1775776f8f.47.1782911073411;
        Wed, 01 Jul 2026 06:04:33 -0700 (PDT)
X-Received: by 2002:adf:fe50:0:b0:474:4525:eb55 with SMTP id ffacd0b85a97d-4775a7ca02fmr1775741f8f.47.1782911072956;
        Wed, 01 Jul 2026 06:04:32 -0700 (PDT)
Received: from [10.22.3.81] ([91.26.127.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf65sm17806606f8f.21.2026.07.01.06.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:04:32 -0700 (PDT)
Message-ID: <d1ed9792-9529-44ff-beb1-adb2b7879572@redhat.com>
Date: Wed, 1 Jul 2026 15:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RAS: Move contents from arch/x86/ras/Kconfig into
 drivers/ras/Kconfig
From: Thomas Huth <thuth@redhat.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 linux-edac@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
References: <20260410122748.29978-1-thuth@redhat.com>
Content-Language: en-US
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260410122748.29978-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2026 14.27, Thomas Huth wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Commit bc8e80d56c1ec ("x86/mce: Merge mce_amd_inj into mce-inject")
> removed the last .c file from arch/x86/ras/, so that there is now
> only a lonely Kconfig file in this folder. Its config switches
> CONFIG_RAS_CEC and CONFIG_RAS_CEC_DEBUG are only used in code that
> resides in drivers/ras/, so those Kconfig switches should better
> reside in drivers/ras/, too. Thus move the contents of arch/x86/ras/
> into drivers/ras/Kconfig now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/x86/ras/Kconfig | 23 -----------------------
>   drivers/ras/Kconfig  | 24 +++++++++++++++++++++++-
>   2 files changed, 23 insertions(+), 24 deletions(-)
>   delete mode 100644 arch/x86/ras/Kconfig
> 
> diff --git a/arch/x86/ras/Kconfig b/arch/x86/ras/Kconfig
> deleted file mode 100644
> index 7488c715427e5..0000000000000
> --- a/arch/x86/ras/Kconfig
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -config RAS_CEC
> -	bool "Correctable Errors Collector"
> -	depends on X86_MCE && MEMORY_FAILURE && DEBUG_FS
> -	help
> -	  This is a small cache which collects correctable memory errors per 4K
> -	  page PFN and counts their repeated occurrence. Once the counter for a
> -	  PFN overflows, we try to soft-offline that page as we take it to mean
> -	  that it has reached a relatively high error count and would probably
> -	  be best if we don't use it anymore.
> -
> -	  Bear in mind that this is absolutely useless if your platform doesn't
> -	  have ECC DIMMs and doesn't have DRAM ECC checking enabled in the BIOS.
> -
> -config RAS_CEC_DEBUG
> -	bool "CEC debugging machinery"
> -	default n
> -	depends on RAS_CEC
> -	help
> -	  Add extra files to (debugfs)/ras/cec to test the correctable error
> -	  collector feature. "pfn" is a writable file that allows user to
> -	  simulate an error in a particular page frame. "array" is a read-only
> -	  file that dumps out the current state of all pages logged so far.
> diff --git a/drivers/ras/Kconfig b/drivers/ras/Kconfig
> index fc4f4bb94a4c6..070e17639faa3 100644
> --- a/drivers/ras/Kconfig
> +++ b/drivers/ras/Kconfig
> @@ -31,7 +31,29 @@ menuconfig RAS
>   
>   if RAS
>   
> -source "arch/x86/ras/Kconfig"
> +config RAS_CEC
> +	bool "Correctable Errors Collector"
> +	depends on X86_MCE && MEMORY_FAILURE && DEBUG_FS
> +	help
> +	  This is a small cache which collects correctable memory errors per 4K
> +	  page PFN and counts their repeated occurrence. Once the counter for a
> +	  PFN overflows, we try to soft-offline that page as we take it to mean
> +	  that it has reached a relatively high error count and would probably
> +	  be best if we don't use it anymore.
> +
> +	  Bear in mind that this is absolutely useless if your platform doesn't
> +	  have ECC DIMMs and doesn't have DRAM ECC checking enabled in the BIOS.
> +
> +config RAS_CEC_DEBUG
> +	bool "CEC debugging machinery"
> +	default n
> +	depends on RAS_CEC
> +	help
> +	  Add extra files to (debugfs)/ras/cec to test the correctable error
> +	  collector feature. "pfn" is a writable file that allows user to
> +	  simulate an error in a particular page frame. "array" is a read-only
> +	  file that dumps out the current state of all pages logged so far.
> +
>   source "drivers/ras/amd/atl/Kconfig"
>   
>   config RAS_FMPM

Friendly ping?

  Thomas

