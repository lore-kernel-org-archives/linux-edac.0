Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB545BE3
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284017; cv=pass; b=D0ab36xTmKHKJOmMroNVYavLCQqahSVjzR/XLz58Tm1+SeGue3VnIdXRiLhyUFRwQIxA26b/eZqlNF80TExchuNYbWXI7NAD+Gl+Ctz0suFUJ/mjc/s7HmZKKeHWYKGX9w2pbkYQKAedlnImDRI5Z6mSvDm+SdBvf4jTRfWKwIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284017; c=relaxed/simple;
	bh=h9aXM5QjNGMidHsRvBobL9YrXwlC8T0grjYAblNyM9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaLGxQWkfTeP3pgY0LWqanE2N81QhHintzkN3R58NWWABFGAIj18Ww7gQNv0RpBzEsYXjHei2Fuxqi6u54V5zUb3yq6h0lUgiwPD7De4zFLc0Ap5z7H/14c10fFlYNduXpacPrM4qpBDthO0eQ2ROQGwRw2E7bKNVzvxjF+EGpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fV6lcVqM; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fV6lcVqM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a051b73866so263016a12.0
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 17:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785284014; cv=none;
        d=google.com; s=arc-20260327;
        b=Bva+Ze9mm55V99OAVl3M2SfiXsnL4io2DJPdK8edCkVkrrqu+ZBiTSk0Xo0jl2x7xW
         CQRDAUOCaSGWNn5/CefZg+x5i9ir5t6pBj8mdhHh1j5fADq2/P5R4YnHZWN8kt7FV7uW
         QiY6K37GEokbnpUIJwmPbiZPDiBec510Z1rbienyNO23AXXAxgD/TTTBXM+JUhX2xzL9
         jYxl4VSehmb8Iy37Jp/nsTCml0oZpPJ4TQ7Ytij9nHSzo/BuCOFNZGen7VFbmJY4aild
         sZ5hY33PtdkWMTwnflZd3Y7gL11wtgrO50+S6+HUVuCvg1r9IkKB5peANLzjUZkDCgst
         JNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        fh=sMp1kS8NHFjiQczRubzSvDvq4PDKA9pe+OM5OW94noo=;
        b=ey4A9xdrDYV/BFmyNQK2cc7Ojo3sg6zr2/3IOptbwsj792QtiKCO/Hb2noHgIz5ypE
         B/sTd2mG/WXZTcPc8eclHitU99S8YnzQMMYaUIqY9LgnggYRUHYnXfT9iBtpo0QI+Q6G
         gHg1sAl1dQhxXjRmmiYPjicJyYN4oJH2qQwai53lar3QNoESFv5WpP9/Lcd4ueMvKEbY
         0ezcmC/c+vth1Ge+EmHQNa2oFMhNud4iE5IimQVF6JAtzWmPAbV93ftC0ie9e+OCcZls
         V6JUTfABajGrhd/nQPwnynK1dOHztQahi+Qea/tUTXT74Os6KEBVBLuUHvF8MDL0LhDV
         SkEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785284014; x=1785888814; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        b=fV6lcVqMWbSEzgrSfFUmZFiRYNzFm6zR0JHkXuSr1UDoipBhvp418666Rr7zA4gQ7g
         kmR1Gj5nHKe+CR1LeKMM0F6rbzDrfowhdXFvJ+bx4Usx3LhI3HaAzByT/MjgsMQ/JQWX
         FwIJICMjqUjgrcv1dUyKda5DpKhE40DznnYRMbFLEvU+0RRba0fK+D/3HyAasT3JWU3b
         SOOMuzFqzSkw6nLWkDe58Q7QCCEsHFG0OoJ2XTgX5i8rS8RpVlZ8f1BcoeFWYxfVdwIk
         grVfgfjiIJ4uGssG7IVYPLU9tL1vabDO7kW+1IwnJUr0UytM7dAbffIbfq4+tKoW8zDu
         Cj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284014; x=1785888814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        b=AknhgNXy+2R/Bm/E1Q43rGW7Hq6NVvOxtfHT4vKasjbsD89fQ0uvYgV5FxvEOIG476
         zV7EHm25N4hQzvEXz97Me8n9EFq3Khz/bs1MfXEB2kgNd6aio2ktwDaNtYicnzvuo2G8
         csRlCZGuyAhlwunGlGaOpX7V8nOGZX4XKfGjiU5GEmFfLhbOhEL7rCrJulf05C9YlUhx
         eBueEoh/2ZGsdsfiwvqySbxdHwsilX+T45TD3v5856mW5ojiaalS3KTaW2XsSM5CL/EH
         2wR9DV01dgqFfQVuIQECOZsjVjqFhIDEx5NFczeC+sfsPSEQDuSK6dMmHECY4Buv0vq3
         BqnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqO8eCjaYKP7jkDObfawqXTaRnn2jI+KUq8yBYo2mo8s9tp7CuA5Pr5bXitrOU4wqfSFGvCn2e0xa7I@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1q6x7ERMkNTthgOeYBDVfATtE+Ap7V/oSn4f7Ldr427z/A1wi
	3C7nLWbyFZ4fY3eyuMgx71dWuByLqS/lMXV8ZcwPrZ/IUDjxBRz9gE6pWYaVUfbVMqhtNl81rud
	j5cSdCyizKtI7av2qGa93hlrbcRyb0mw=
X-Gm-Gg: AR+sD10xn8EKV2H/1L5hezdg2G6V8Jc/5PJhADs5JdIpzBU18x2AUsWP1zmrd3+/ATa
	3bW7VZU0+mplkr4sp4wdM9hXMfPQPxKexpfBImlBIr9kv1hjxhhQtAxxVU4Y1p6qR1z64CxG1P5
	dk1ecaqu6rKHVLtg1GMUZCwccWQ55fKNzKTCZbcBQHtzFzJaCmXa7at4YKaX9/PKreGseisVoF7
	XbhjOwMjps9w7hspFwo/znPy91mYgD7985YGKMkC1IMRWU8QdC60t/zTqzusYcNhlh2KWjikcxg
	vZO1cMGGj3IysE7qmaxGtMU5xdyVX3mDTlYq58mVrjoXCLLteklklktinQENDD6ySgOcZJolv6Y
	P0/EjSddv2yKyg1GzwhnusvlsXQc8b8TnGeGahFGmDBslMnZZsqKTcOFM2sB+i4mg5ZSZR5O63p
	sLrHOwvE9ed3BOVVciF4U3cLI7EU+I67ag50cjp9hH/xmze8gFMyBae1U=
X-Received: by 2002:a05:6402:24c8:b0:697:ecb4:b86c with SMTP id
 4fb4d7f45d1cf-6a034a0b240mr1758311a12.2.1785284014277; Tue, 28 Jul 2026
 17:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714234609.902367-1-rosenp@gmail.com> <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local> <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
In-Reply-To: <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 28 Jul 2026 17:13:22 -0700
X-Gm-Features: AUfX_mxHW0ADcbLB742WYGYN1hzAzsCDZWTuKdLexmZw6VpD6MNkUeIKBO7Hquw
Message-ID: <CAKxU2N_=DMAxM=-QRZ_J5Tt2rbjXs7C4uJRQTWF-xTquL_oFvQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
To: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 3:41=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> > The unfortunate part of that is sashiko does not understand v2 patches
> > and whatnot. Meaning it will always complain about things fixed in
> > other patches.
>
> That's fine as long as we've replied to the patches and said why it is ok=
. LLM
> is just a tool, at least for now and how it is used with Sashiko.
>
> What is more important here is finding real hw to test it on. I'm hoping =
Frank
> on Cc will move...
Based on some git log/grep, I don't see many devices that use this
driver unfortunately.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
