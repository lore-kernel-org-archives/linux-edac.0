Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C3837FF6F
	for <linux-edac@vger.kernel.org>; Thu, 17 Sep 2026 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669136; cv=pass; b=mxGlC1/dTzbrq3nX7h+IWvzSpidu4TV4hJ/daQcUPymeUueFwM56LfKsbjkRrCvVD4Xgrewd2/UZMvNZkxyQxVV0l/vcxZa7I6LIWtF/wXt0Y9Fs/4LsAxEA3EaMaaTzprHeeZnUTLMhdJNGmvSq+sQGOq7s5EXea9u5hxRMwD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669136; c=relaxed/simple;
	bh=TOT1meVSqfblGDrdqsFf6MzcvOlETVrJmJLU2ZhnqmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmIkr/pdqbM2XjMiFYCgRi5ffYXmxg6ey171iiDJluZFiUzZZN7uXOFi+IgSW1gyaKMgp2eDdu/ZbAOQeib3mBQbrpZipEw8MAZJ1nqL0eKKnGWVkVx94OBLPc919rDEPJ3Om1grh2WFNEnQa/ARbLo3G2NEOfnLI/5WXXqzN+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eymp/YJL; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eymp/YJL"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f705536so251664066b.1
        for <linux-edac@vger.kernel.org>; Thu, 17 Sep 2026 11:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669133; cv=none;
        d=google.com; s=arc-20260327;
        b=SKAN81AqIppI0JaFJ8ogS7VpPKR+HUz336fqMT4qTcQmRu+zRi2Oci0+NOBZeUIAWb
         M9uxoFTl/2L7N5Ij9+kLrVRXp1TuNl7qVe7SZx/ZsifIIxbRPbqC4qbwT65MFNa01/+h
         CqcB20zvC2JR4LIGzmVXTm3BtEc1JuMahu89jDy5SnrdB8jNwhj1QixagglPCr3X4Nnh
         6BnVR45qfbAJDJGesiXtTf655V5mIGSjMTn1qhVyMG3yH7+hVWjR0JSHm/4lDw2theLz
         fjYOqk228KXr8kRqrd5vdMES9sLKklxMQX70P6gF1hzUJwKtg1miu1pkdFNX5ZS/VCsJ
         Kw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l20clSa/FKU397EhPwh18Xmkk9Ag+DiAxpnayaLKjKc=;
        fh=xgccP/fKRJTKFW/pK4X4AR8if0S8NkFNsiqyhzKlg6I=;
        b=APufjOTxccWxUJ0qdPXX0z+1+O3FJVKs0/qVVohoh/3lPOZ25TKpF4S1r2kr9LrjrC
         FlKXcntku7WkO1HcEbKCLjKhDLDOSHfOlyzP6z2+yjG7lV157nvCjDu35BfiXy6BnA/z
         i202mj6M5IB/kW3Swvn7JyyL1Nzp6vIlpy4oYhjoAVyCLiGtCzl6qC9tqH9M9g8wozZ7
         qe29xsxLvW+0U6Yig319qto6wSi4J92d0nRGOSLOxnWwY2c19GFpMBdFrpflx0wu4el0
         xdrcFvmzj2ylNHQYQPKk6UNyPllJo7Yz/1d2TgigSdw1BS7PB+4XSLKOKaLSH6D5md2P
         mhcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669133; x=1790273933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l20clSa/FKU397EhPwh18Xmkk9Ag+DiAxpnayaLKjKc=;
        b=Eymp/YJL/5kDsNlGBeFZP+xB5GX/1wPjs4PMA0frT41jOFom5zx9NrfOIT2Y4jPDdQ
         dG7FdmVQZAGHZh/B2LyloFJqjteQwQMZm7ez3e2ssKYbZ2r6Ks0ZZ6PtLTnPw+g5fhHk
         xJBCtENVDWYTLdNV/2eYGMqkjiAJISvYEgssbo/Eg/hyVL71ciRgh9bdtjkOWTV/TPw3
         07+kmmso/ujJRT3iO44sXIR06oyxCPiF96tZ7Xo6fQz6i/JMdmjGm8qYjjWsc4oWrclI
         G+GHwd58UUe55bRXjhevXnYXsQ0L88rFt3YXnKLmT0BMFdJQBofSjjMcftNfQlhb+ckg
         ULrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669133; x=1790273933;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l20clSa/FKU397EhPwh18Xmkk9Ag+DiAxpnayaLKjKc=;
        b=kDuFEKtPO/j6tv1/lbWVqBYndM16gRYgEVb0nT4P+essmQvKhCyMGqm3+Dpru+rnWc
         WsvQuQUEIhw/qMrx7Xi1qUojwPliacB6rGkWRUAzUgMYa7yzR5lDOJM8c1TGVrACyZ2h
         /bQnMh7wqjlpm5eYOP7CxE7kuoXcx+Kfw0AN+VScy/XgbPUIuwxLtchx8oiec+CkU3qy
         trBaRcoc03EKYgL1wIYg1QnM1OUDCm8pX3jDG9XiY2INRb70LXRtPZJj98F8CyxRj1zu
         Xd0P4Fj34nMZwQ9NRrE6OGdPSVNyCmFGUEVCuo/w5pxfXoHQFoSP5fUIxvXGcLk9PD6+
         YXuQ==
X-Forwarded-Encrypted: i=1; AKwUvBymQKbuF4MYqUyTjmHCxEEdPcqXLpOHpP/2F/Jm1IlY6N36ZKB8w5axV0E4iXwYrux3b9pP8qrBgSZ0@vger.kernel.org
X-Gm-Message-State: AFuF++nqeXDVCPJP52OZHC2b1ocSq6PXk/iQr/5WHB3Aqzkd0rRBMIvA
	HwQKJn9dhRAIQ0W5Dyj63dVWTka9Fob/lbY1HHlTzQTxlRtY9POjV++wov6KDFJbIbc2DWSDVMB
	/kUnCcS36XTntOgCMtUEr5KYrXfbb/A==
X-Gm-Gg: AYBFou1MYRlOiMvtGLw90Nd6v7zM7R2GVIvhkrQCN+2iDI8QtNQoFV2LffNUyQYXRnk
	CYHtYRi7dKnPc6QvhBi8Hk5pPWC/eh8HIZQM1+Pf9PCjZ42ZQ/OvN5/xSNdwVv4woX2LK1KeQW4
	zwt0xs/R4hO4O5L1FxvHF8Wv6RmE/bJtQoZYl4cqv3g+BX+tN7zeDj0xDpxUF5GVKze/8hD+Cj/
	ojhP/ujtvooaAl1ZDMzJaiETp7j48R4sJU+ilwBuy4AP6+R7VSbC5fQ1cR81wBuZALLO4OQPTDn
	dh0IkzPdP+4d/bQ+PkyN+amlFbG7jCKOnT9XN7DQF14JP5anFFEtY2wMnCZU/gQSA5g/veBrxUl
	fMmORfbxqSEmEHxEjQJoPBFJpB1j4IGmmw/48SGf9FbfX5Ojhamhy+C71udXujO3Qy3Wc
X-Received: by 2002:a17:907:1ca4:b0:c28:599b:7782 with SMTP id
 a640c23a62f3a-c2a15b11ac5mr1428866b.21.1789669133187; Thu, 17 Sep 2026
 11:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913212500.60272-1-mhun512@gmail.com> <SJ1PR11MB6083885F54ECDC88B894EEDAFCBB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260915005334.GEaqiXDqDGVsYE_NXp@fat_crate.local>
In-Reply-To: <20260915005334.GEaqiXDqDGVsYE_NXp@fat_crate.local>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Thu, 17 Sep 2026 14:18:39 -0400
X-Gm-Features: AcwNN1VlayQ9ktzuVqf3oQSFFUBVBchkxRwlj1BULSIKdsZ4RrkQ3EahK_ExkJM
Message-ID: <CAGEsz8EZhS_5sBDXo0KgmMAXh4JKaa2yjUg=rhL2KMkQddSvmw@mail.gmail.com>
Subject: Re: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Jason Baron <jbaron@akamai.com>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Tony and Boris, for applying the patch and fixing the tag.
I'll use "Assisted-by: LLM" in future submissions.

Best regards,
Myeonghun Pak

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 8:53, B=
orislav Petkov <bp@alien8.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Sep 14, 2026 at 04:51:07PM +0000, Luck, Tony wrote:
> > > Assisted-by: OpenAI:GPT-5.6
> >
> > I added "LLM" to this tag based on current guidance in Documentation/pr=
ocess/coding-assistants.rst
>
> Nah, it needs to be only LLM:
>
> "Assisted-by: LLM"
>
> because
>
> commit 816d9992d9ed434ec52cfbd63080d518e535a41b
> Author: Christian Brauner <brauner@kernel.org>
> Date:   Wed Jul 1 17:54:48 2026 +0200
>
>     coding-assistants: simplify attribution
>
>     The requirement to identify specific models used in the Assisted-by t=
ag
>     provides free advertising to proprietary software companies while add=
ing
>     little or no useful information.  Change the requirement to simply:
>
>       Assisted-by: LLM
>
>     to capture the fact that an LLM was used without tracking which one.
>
> Lemme fix it up.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
