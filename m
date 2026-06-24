Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0A63502A9
	for <linux-edac@vger.kernel.org>; Wed, 24 Jun 2026 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782310753; cv=pass; b=enZrOrbysBUXPn/4Sun5iV8hUsdxA1mVUqXC1GPKrH2YZb6y9CTb7F7pkvJ3i4edpgNVGkRKIWu8nhLFMlCwls+4hRgy2cvJS30CMozR6Lu+/DL0vhRgOCpOdJNCZU+hNPR+XY157XEsAUrmhMAFYaOJfhUo7dz8SFV3p2Ia7ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782310753; c=relaxed/simple;
	bh=QVnwepwvfCAzaRzQxWo1CopBFAsJoLngebQF15QkUg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ez4l1uUWTRJuGjbmBkWepU+kOKJv66vX1EwX+KivKygom7emHSfoKKgYlgMjiE1oS/D21dBbv40AvwTRQ2qRr+JjhxACPbGsXnEaT63BRu7KbNfT14M5eOJOB8eDHW5NUbaNU87yPOfeQWihkJmx/2tR03jF69n174L4zjkimKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU4D22b0; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU4D22b0"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139d5c9a495so842159c88.0
        for <linux-edac@vger.kernel.org>; Wed, 24 Jun 2026 07:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782310751; cv=none;
        d=google.com; s=arc-20240605;
        b=WwXQdM27VFgZq1WXlbYgg1ioDILXSCBPC2dVQrACzYzOaEi7u884J0uUyFSgCseaEp
         54jSwwAs6e0biRfQ4D0ZDqhzd1ftGXdgWdOFafpjhO5gM5OObTc5AHTstA6ybAs7sdxF
         A5nZXQtoOjA8ryTAiWJ9/PGPPhs97Y5cq/ajSOZ7v3NeO3uMjB7DBKZLCkr4rlqC+fZ7
         IOekl+vUNQH47eQky7kf2t7EXiE/AFBgVKn9ortMmBGimCWmYIeszE+26k+QiesZ0Br4
         oybGq8kbBjLGGulN+lv8DFJmMWAytXk3n5RuT43AmDiUVRe5HNuq1RGlfV0f3lXORNv8
         Kwbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QVnwepwvfCAzaRzQxWo1CopBFAsJoLngebQF15QkUg8=;
        fh=LwEjDAN5vSxGFdKN94U6nSYk7lrCMKOaGoAMpPBUIcE=;
        b=OjZXJtfiQa4zb4GgVrvudkudV8CYpQUEzutcVdeMeNqGsOYGcBLuR0G2zPO8K0HTEb
         qtaVc+XamKRTRb7yXEnpVuonSEtuxrh9wPCll4EK6XtS8Cw2Rn2Ybz8fdZ1h+NmOh399
         gTjFpbHDVf2e7GoXXqUr38D72TRbm3/gpGz2okqjaGhT+dB8BWYX7t/Ndq9gtPLgchth
         wJ1ug+iLY8NFGTNrfU+JFNN9ooLGCb0SB45TnmW10e3jo4uzHCJ8zZ/C1eaTrg/Ck9AM
         WI74bZ/YF73YtoYCXnJk2MqdMIhYg7FXLpWG51WOG0560Rr9nXAQ9JC/GUBN7xHHaR6D
         00SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310751; x=1782915551; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QVnwepwvfCAzaRzQxWo1CopBFAsJoLngebQF15QkUg8=;
        b=fU4D22b0dQutN+rs1sv7V3n51mS/q+zbOrsABqehJUCJWzLobynBwwS6UR0MaV7od0
         Z+amuhAZ4efByJINptxpgz01Usx43xJ/zNcxXTRMrqbOPUfFKepOpPaZrAxxFz4Ua4HO
         w7sgiUfv0vwsPjSdTt0kIOQY7oGsSnSmyZ/0o5TWKYX/UrmWaBR9gxTHC7ZJVVdtd9vu
         5vVnRK+g8jo2pK+BplV+sNqEILT5gDu0ZftOC1DqYh9AqgnbfdOjlD9phHeXlY4ZgF6f
         kzGJd1nSlURfXD1oolk9BxbHjkPbes9Ix1qbe9Slh+FDvMc/3Yqw5ERznaRkkyQOMcHn
         ZoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310751; x=1782915551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVnwepwvfCAzaRzQxWo1CopBFAsJoLngebQF15QkUg8=;
        b=JGx7ajrjXHLHo7nlTjwBI6v9m4EdOzucsPJZevm+VN45wGspUgfpZXFZrHTfqWhcbt
         F5DWKsXo87dFr8NSU6VBUhE/Fs+m3DmesZ6zUCPGnQ43fGLTqUiwf9AOitgGeRVR4DDT
         jcuhN5sI9OYvfkG0CjLOjsPrujPmG8lubYC0WfZe0nvMn9SsdjQOH1dh4uhOKVSVe3UC
         jBq480hAuGr9LHuPXpLkRGr0zPOl8TNPI/L7J2ePtBqd3g62W+db4xgq7mtpMws7F0af
         EyN4zKMVYy1F4SKlDfL/LYOAWDaCd9ZVNXiJEftP+C3VANinQbfoS4sHM2OaXALa4XJM
         A/2g==
X-Forwarded-Encrypted: i=1; AFNElJ/jnT6/Dai1HB+AUS9ArKO4p3y5ig58s27id6Pw8lNU0fKT4C4D2BUXRcFlavNfD0aDCvQJxADQrm5q@vger.kernel.org
X-Gm-Message-State: AOJu0YwsIyALPWXac8vzh13k3Wy1eV61mHD+uANosysKeK7Bmd5pV2Lg
	FLqYRpcCg3uSdW+i6pWNXnhI23iHiuUy96lFV/D+mawFRPf4D/e/6K9j71P6tbJLX8+9JMcN+d3
	HlcDXWUCvtWWXtYf7JDJNNI9/9A/vDvo=
X-Gm-Gg: AfdE7ckdLZtjOo6Nk/RB92GB9UCybRrT0z0lyvJLAcQYbpp/6ud+i0XGA80L3Yyafkl
	QpEUILWAhJjhlIvAJJNRPQt5Fc6rAFxi5+B8f1c63zmi4w0BV8NzdYqA7SuzlkySz9vnaHh3+nq
	uZJRO+AgTc8l50qDC2Bn9JSUI8RCiHUXyg0W+Rsr5z1oebulFCnYTuP/HqqjWvv5Xd31u5aST20
	3uZX1+rHyq3gP5rQgEzvcqma5gPI4zdYplfeGxdQkEEsEgmTbsTJibtfkrOoRDDoA8KdbLnSI4+
	/RBBvF8uPEDTa/CvLFwOg02MGxBISN84DRX38WU=
X-Received: by 2002:a05:7022:42:b0:139:8172:76a6 with SMTP id
 a92af1059eb24-139d0c04115mr2731687c88.1.1782310750779; Wed, 24 Jun 2026
 07:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615191508.46335-1-rounakdas2025@gmail.com>
 <20260616081709.48774-1-rounakdas2025@gmail.com> <4a6cf8c0-e425-4381-adf3-daaa1b20ba96@kernel.org>
In-Reply-To: <4a6cf8c0-e425-4381-adf3-daaa1b20ba96@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Wed, 24 Jun 2026 18:18:58 +0400
X-Gm-Features: AVVi8CcqeJuRBaWrY8PIctPG36DD1SrJ0TKInVxrH5jqP6qZL6YrERToP5-VGiQ
Message-ID: <CAPYTKoPcDeY4sGRfeu9N4TbDaRpxrwRiYqU9bcz5YFxfR=dWiQ@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC/altera: use SDMMC compatibles to select A10/S10
 IRQ layout
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

Thanks for testing on the Stratix10 devkit.

This looks like it was tested against v2. The message is threaded
under the v2 patch containing the v2 diff, which uses
`altr,socfpga-s10-sdmmc-ecc` inside `altr_edac_a10_device_add()`. This
only matches the SD/MMC node, causing `sdramedac` and `ocram-ecc` to
fall into the else clause and call `irq_of_parse_and_map(np, 1)`.
Those nodes only have a single interrupt, so it does `rc = -ENODEV`
which matches the log (-19).

v3 was reworked specifically to fix this issue by using
`altr,socfpga-s10-ecc-manager` once at the probe, under
`altr_edac_a10_probe` and storing it as `edac->is_s10`.
v3 link: https://lore.kernel.org/lkml/20260617000711.60804-1-rounakdas2025@gmail.com/

Could you re-test against v3 when you get a chance?

Thanks,
Rounak
