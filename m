Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E70441442F
	for <linux-edac@vger.kernel.org>; Fri, 25 Sep 2026 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341092; cv=none; b=TKVXD8QFmLoLxuDG/7io6hdPGZmNnKr/uDIJ+lHI0dTNyq5fN1Q9/ZH3I+di91QXMaLUrVhWBFRyf7+SYz/RaJ8nN3TtnuoQ1MG7E29fB6OL8jr1ojV7D08/gTPcn68dk4wRVF+wq0A8M7R4xGbRN4HuPspL9pjKb5J0BWoHHdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341092; c=relaxed/simple;
	bh=SNXrjUHLxaO4PIWLbvPnvyB48FFWSNE4zj+UVTQoMOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rF65MBFuoKkLfXJpOF5j9hkCSEunSUdhEfnVCysitZcQL1lVWAv51CqZhAdR/mBMr64ohF7yJj8vw60MX1Yu8scNGcgUkOF2KlQtpqzXhXxsHVtCJfqpCvFOouXskl7MvrE8CoDY26sWOUdkB6CCfBzOhr7XyFH3N5sGFCqX99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-985369a13bbso248844241.0
        for <linux-edac@vger.kernel.org>; Fri, 25 Sep 2026 05:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790341089; x=1790945889;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iikrWSUlQodloxnitQUQlaOsbbx0iKNTngyqMd+wIHM=;
        b=LQ2D2yfeeP/iGQ3YxgoVU0OKYR3wiCjCaHXDo1k6WVUD7sGCLcpb2yg+aaIBuF1YSE
         /u47zUO7oAk8yVx8CYZtCEBjhbtAZZV3b9Q7M7n3PBjDtPAJoCM7RootBXKvELVSq6Ny
         g4GJ1C648KkvzWMp0NgLenb4nRKNH3byEP9PU+E2VFjUnyGWWWt6KBtq6+Urowq4Oq8T
         JEliEW2JzvnKG9g/vUfOyyKgPTT3oraXhc+Rybq3T1nLNPb1VoXRJ+Qj8X6BcklgOnRx
         6uxi4vNURYh3ysl/rs/ymNxtXG9Q3aPhK/ctD0mJ27BLn/C51mD8lar1lMRx5njMSnZU
         Nf1A==
X-Forwarded-Encrypted: i=1; AKwUvByUCGlHQE4zONiIpk8IWwmDWpCf5tawy2BUsFVP+NC6uWyEnGn0SmL2wV8UySzBwHCkMcybqVKIp2Gm@vger.kernel.org
X-Gm-Message-State: AFuF++l5WPBbP0+n35gePVcWIBWc+W9m8IHW51VymrlIrOCXPK9POnv6
	DfDIv89/u/le+KuKEVBz7ktZ23P0+Uxhsmxr7LjM48LRLY4SMkcZ2KIq4cVfIWUw
X-Gm-Gg: AYBFou1wJ5IweJf68DpKTx5elUuPq9ubB/zEQGgimhHzxMEHBoKAY+5QuZk20AERrBb
	TJoXiKpBWWXkB9nJj+1ZvaFeFwJjuKJ5XOYpYgrXCQZEX9/rpIgcUnmQAENJLg4F/8VU48qac/s
	SDdqkxR4CubbYpEqx1QrQ4e8qI0f5RXlw1TuLvxWGNOGPxlrzHd0Q486EYYb2umFF35Fnd7ViJY
	p0DtxbS5HIuqZzKpXaRjBAJP9kdTf1ep3rgdNTuB4CENMewhhw5xTODp31AQnjhfBgS7khzAPio
	7d4q2ryWRXt2G4IaiLOQkXR2gUB27ITLr4P3IfsbCUSUAXJ9acotrriHEjAqKaQfdjT5Q8YrsOw
	P2QGphWobsXThcQpXPSTkBccOhGodbWjMGy39zmqQ71fVytOZUs812JOopHWMRMSuFYSq0Yni03
	TR84fuS4emJjXIvYp/P52322WLQ94VTKFCR2aVEOODSlQp+Flki+mktrOoRJ6SFa+QL31T4BeC9
	deHk64VZxxiEH88VHarqU7eT/I/FRRrs8vT
X-Received: by 2002:a05:6102:3911:b0:79e:df6b:d2b6 with SMTP id ada2fe7eead31-7af1c483ba4mr2117623137.2.1790341089211;
        Fri, 25 Sep 2026 05:58:09 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b0dadb0afesm2565207137.4.2026.09.25.05.58.08
        for <linux-edac@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98536aec408so829749241.0
        for <linux-edac@vger.kernel.org>; Fri, 25 Sep 2026 05:58:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpoLaTa8Vf1HZIs90iCVV0voYVd3Y8/4q9lmUh+9c5ObklM7bFVYFREKmPdBc5+qKqlVZAvnkT+HF5@vger.kernel.org
X-Received: by 2002:a05:6102:a145:b0:78f:fee6:832 with SMTP id
 ada2fe7eead31-7af1cea4a54mr1503499137.12.1790341087879; Fri, 25 Sep 2026
 05:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-1-bd8054a5b180@bootlin.com>
 <arZpZolRwdU8zh6O@shikoro> <8733uxlcl1.fsf@bootlin.com>
In-Reply-To: <8733uxlcl1.fsf@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 14:57:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
X-Gm-Features: AclHuK-YV8P6qGPlYAimFvYOFx6QV9kkt9w-v-Qt2g3Qun14B0iXjB41Jl3A5uU
Message-ID: <CAMuHMdUeCH9SbCr70syV0hVSqD1ccjVptMHoY-6aaEhW_ine_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC binding
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Paul Louvel <paul.louvel@bootlin.com>, 
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

On Fri, 25 Sept 2026 at 14:50, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:
> > But one thing came to my attention just now which needs fixing:
> >
> >> +    items:
> >> +      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
> >> +      - const: renesas,rzn1-ddr-edac      # RZ/N1
> >
> > We don't need a family compatible. Only N1D has a DDR controller.
>
> This is true, but from my experience with this platform, Geert used to
> request both. I'm fine exposing only one of them, but I explicitly asked
> Paul to put them both to mimic the existing bindings and keep some kind
> of uniformity. I'm fine either ways, but before we go through that
> iteration, Geert, would you mind confirming your preferences?

Well, if only RZ/N1D has the DDR controller, there is not much point in
adding a family-specific compatible value.  According to renesas.com,
RZ/N1x is obsolete, so no new family members will arrive.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
