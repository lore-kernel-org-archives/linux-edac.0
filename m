Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987977;
	b=Y8PjlRuztEi3brALl9J4tRlydc8ks9GJQBO7iTzzmEWHDMTVeC/mD9p4gdoPS0koHp32
	 Cw7FUBtryHyB8PtMDIn19yDVgNzYtSODKJcJcDSjpp0T9aUeztxQUNxxVR98zsNEOgFPo
	 qcG0NKcxushywg31dlvNyKOmInEMMDKp7NBFNlhMKheORk+YbgSNkwZkpIXemOmVvWNS9
	 OhOnwC1q7FbZq4mZixgM0eYLatK92Y1uSZkzGQoiXqfSLCGVa8+K/Gdtx1ae04LRbty4/
	 /gfKNRTJ8o58E89kmWulxxrgJaAwp0gkqJkAMzCXDUL7wHiF+6/iiMr8guTG6p0aQow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987977;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
	b=mVIKtBuf3wG8ASqDsH2521WqqDi5ZNcW24bwLOxK5LCmPl5eyMH3PYfghi0oOpDZl8k5
	 HF4rbB9BLOh4VIfuhcy9/fx0/Nf61FlvtZXvL+uLkNTi2OUHdBfhm2LVe9rD3iA8X7aSR
	 246cXfw+BYSOholRjqhpxOwHW0yEP3fK2/gCv0nnc/NYQ8E98LWdZWw7UziHiqD/16ibn
	 gJo6fznN4TFOd4NHl5g3M6O5Pqf385RS1Cp7c37lo8rsiNZrCtIXoor1i9NA+LLOE1hQ4
	 RJd702m6WPB+VXCjmh7jaQDw5A43iZ+mlLqpB7/6VRXZPjW0CEBh1Xa3N2sS+KmdwTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE26606A333
	for <linux-edac@vger.kernel.org>; Wed, 18 Nov 2026 07:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE26606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d6a6776719so371043137.1
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 23:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987975; x=1795592775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6to1e8ywxICS4xI4JtlfYu40TwDVD3t2Zo+rkXerpvs=;
        b=CNO563Xc6UpBa5QT8MEzoNvdBNkL3b788IdaXBh2kz2T0oH3Ef0SpX3V06fzJgSQHx
         rgGzchzrS4QsYwIgfW9jZvoeJzxAypdl4tA8o+u71pnRK4NeP9ebz2vC8nFpXrhJev5s
         BQeTFNM02hXDJYLJftygm31RENtUm43UwrfI+QEElA61d2gtHwbyMHGQBYaG/ebI/CHT
         rqOIyqnQEVN7Y1Z1nG/K7g7UImNRNP7ucT63lQYO26l5ytgQmBUi8FRGEHWB/HZjTPt/
         J0nhqjPTKcyN4mCdu6fUyipjY18WIxg/dz0YdR9VA0xXP0jScMZCNRTjy3u+C3SnnKc3
         9Jcw==
X-Forwarded-Encrypted: i=1; AL+hErHoNcFPASAlsujMsJjRhUatFpxQZFKvxJVfKCqqQH3FE7/1SoTO/Dbu1imQzZYDA/sDTiZYSwdEvPXs@vger.kernel.org
X-Gm-Message-State: APuU4Z/TgghIl4UbBgPZt/yoYVRoPnSAMt0fqKuHcJdi+PFTyMRqfM/r
	hmC/IQ9OauB4QzM1BxXvBUm4zVTzCkb94Yw1Blt5ZO2rSJyRLWvdIFVu+P+aXkG6
X-Gm-Gg: AYBFou1kkt4fNzbid7plXEod10nkO4to94ILL6MfZF0O+QMaB8FEqgcEQ81sHro8Mid
	v9D9aEG3F82PRh4NI4phY8YFqxQwhAY9xw5Suz3Q3SUpiX1yHb5zdfe+Pp2XvbjlXACDkuBWecO
	SMblAvi3GPWielIdUfpACemgHbrQhBhUgqqSgTv+Xo5P1qU5wrhjfAA6hVWMvvWe7y/RG+3VFfY
	AZOQ61AHx2YwCOXhnS6ZqfviLdwmmBpEQlcQQ+VmvpQ+kzlDFAhJAxJSyw7pwylDTEQpg+ee+b0
	ktiAeFKZlvKoR/r+wexL/HDPswlFjGhf4h5xsRp/pc2zzq3SCGfdynhrgmpB+ViAPU8MNHoKwUv
	60UM7crxHfQUUpc8FyTYM52yN0zWPfMGvHLHpVRk+/kQL3Rjfw+UtxFrdDI6cz0yz9IemJin2Bd
	RSWaZqBGej+5UWcsp9rBXw4ac4kCnRLV1C3M1YjbjONwK5wbnejSC9np99b+n9r0ArcvBF1qcIf
	h5cAvrHIxrNssKjG31NiU9xRxIFuWDuIfs8LfkgAvcTxrwe+Y35RFox9g/0KgCkrIeiwR6yxL5b
	gVewaFK3p0GbChkuuLiWdYn+h+uue8o8sexVoT1RL2pfefEVLPklHiWf2mSo6zeEWyY=
X-Received: by 2002:a05:6102:5112:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d6ba3eaed5mr616336137.13.1794987975531;
        Tue, 17 Nov 2026 23:46:15 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b8eae882sm1249337137.2.2026.11.17.23.46.15
        for <linux-edac@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:46:15 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2e14babc8so397383137.2
        for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 23:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEfvEMRDBQot3Y3awLhsadXnBsyFabtPtQSZtvmkyvyWHfdZidwOFXq3N61dhABlKFlJpynTjETJDHz@vger.kernel.org
X-Received: by 2002:a05:6102:e0a:b0:7cc:94e0:ad23 with SMTP id
 ada2fe7eead31-7d6ba4d7327mr622866137.31.1794987975215; Tue, 17 Nov 2026
 23:46:15 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-paul-v7-3-rc1-edac-v7-0-84c76c6d7595@bootlin.com>
 <20261019-paul-v7-3-rc1-edac-v7-3-84c76c6d7595@bootlin.com>
 <avxR5VZESPLklIuG@ninjato> <DMXJ5VMIPGL9.1917ON486UJRD@bootlin.com> <avzCbuXANntvBPDz@shikoro>
In-Reply-To: <avzCbuXANntvBPDz@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Nov 2026 08:46:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
X-Gm-Features: Aa3M54q17UL4mAgBxZLvOfOFworgkEOusBybuuLEx_Lh39xXrUjItuh72fZWiHU
Message-ID: <CAMuHMdWC30-=DPtui1EjDEOdtXBVy7WLqNU=xz5=68VoZijt2w@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Paul Louvel <paul.louvel@bootlin.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 22:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > On second thought, any reason we don't want this enabled by default?
> >
> > Please see my answer to Geert [1].
> > After reconsideration, maybe it is advisable to enable it by default. Enabling
> > ECC is done by the bootloader, and it might be better if no further actions are
> > required to enable it kernel side.
> > If ECC is disabled, no errors will be generated, and the capabilties will just be
> > set to EDAC_CAP_NONE.
>
> I agree that enabling ECC belongs to the bootloader. With the current DT
> bindings, the Linux driver continues to work on whatever it has been set
> up before (which may be nothing), or? From that point of view, I think
> it makes sense to enable it by default. But again, my knowledge is
> limited here...

FTR, that was my thought, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
