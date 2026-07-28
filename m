Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA79E4756CA
	for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 22:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276522; cv=pass; b=FYBBO3ZrSf453a2sAUpYkuHAGWmTXqVs1MUhvx/BJPQhBcjd9fvxDTEd779l6RyWJF94ojRklMs+DIxFfZ/GYey/dSjMNVS3iE5b0VNaJl8jf1uT038MPsYm6WFPey+BbAHUliw1ON6JdoU+DXMdcZTUVZUvvSh48OrbxeaWPQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276522; c=relaxed/simple;
	bh=66ex1fs8TchlYXvZh55rJ2lAIestaqS7kMHXiK1SnyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY+pEdQfPI0GNw8dEZ1Eg92Ti1iBe7Ui95SJfznCGhFDicdquBRRWoA12gJcN5NrqJ/ythy/WHo/O3Y8Gs01PrrFiDmVGetRFMg6L+aoHuN5IvrdIJGscvbO9c6nqdg6E9R/F6nlNrEsEbpx3J+WeRgYjJgELc1W6R3NRSK6aow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FM9+MXsK; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FM9+MXsK"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso379365a12.2
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 15:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785276516; cv=none;
        d=google.com; s=arc-20260327;
        b=Kfi26doucGQl0ETOioyJUnCNXrgu8c2aH8IAHyV5HJ2HqsrDHOrj400ZiloAIDesbG
         aeA7phNBKSSXYYieXRogPLymCwXDsiXZf3EkOisQ7Vyl8mDpHlG8lFQsR4z3HOSl3/F7
         /cMwhWOWF45SRleRhLCi8K5zaB6EfGa/iyTUfe9bcMYY6BbZoZxGSt+Ch45FZRW7e0fA
         Uwv0M87Tn3ewrV0rT6UAsmzsv4nT+IkMEaydfYIh+OHH/2DKq64MQJ+6X7za/JeKc8c3
         lkYmDFgJnR/ewlL1rzqvUey0dnIxxvAzE9xrr9b1oAPcXYNta/MyGMO5KKaVeUmFZJOy
         KFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        fh=79HRjgMvUKSs4S9yHyE9sTuDVH/9Wb3/jw3K7gdGPhM=;
        b=I4G6lxj7q2mCYyTzL+mn+F6lv+KfhkNVM/nZCHWCxsoNQPRMVSgK8FwBe09c9ZtWQZ
         GCAf2/C/HGuhImzoGE6NXp3MKehrmumN0m+H6g1eSdDdYWIkEq6GUNYqXGaM7jAxMdBs
         ML7cuqMC7qklSouHX+I00gJXnZavLENyDmEJXtDXctw3BfPE+SQkRjJ9X2NE/8iYtvZf
         0e9ZNBXJrzXrroo9qrpynwVnx2eI+olx9OJZIoNAq+hrhMbr+Ot6x47EjDhPlS29N1He
         hmeX2cUsOwcWwWlHBGcJ0ONUVmx5J+KAFjAReRnr9JgVJQU+aIXp3cwMDDL+azv/7le3
         +XOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276516; x=1785881316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        b=FM9+MXsKRrK5WV4beLGDASgMggZoaQcLrT3Ht5i+hCVAfQo+20GqVViUFaNPgccZHR
         +SYVeIyaTtqDGDEeSyZFOyXy6aPnd7YjslH3qYtUrH/BbpE0E/YpttqTBQojuwzamR9J
         llnk8Mbj12G4lYLYp2y9O/g9C2kPPwExinBY8gSm+JVNjPl4iEB7Pklg0lgFeU9ki16x
         XE0dOTn9MfkL8KfeuhIlTXaH8bQFDb+446fDsKnXetAZmgMT0K1ODmROxgy8KGfcHtby
         fPSBW4Vw59N2Rr3Nrx11MDPh7cfZpcO4tXfVVYUZRMJ/rx3iMByYJmyOjJ8EXdHM3kaR
         yN5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276516; x=1785881316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiN+N2sya3idAsHWaRZRoY+QX7TSzFxb57yiuUePn60=;
        b=TLwv1ghcb9nAwua2wsxcZLzbcr2DZkXfUCIdH9kYMkxkehTl1iIj5yuiUp5+HDfldE
         LvTU31oeYEummNV1AzNRw7EoCjuJBC2T/8CG9xPEA8474Wi6+9zdgjA842qhjHmXjMZE
         gegP7W9NU3x0uqhsALasjcYAqrCCnvp/xeBsHCFQ/rgA4L0IIfzPwpOv9UqhOlG+7px3
         ifku+yg/grZBYWPbMl8WAfKbOxHiPunErXb65qUC2qfZE8qwzxcyoITJrM8GHcjpw1DZ
         Ix7MWccCOL+g22ZDYLcBKk1G3e0FHcjnAynMn5uawbP23FbJ92uwSX/7LruvmF1ffN+l
         ZFbg==
X-Forwarded-Encrypted: i=1; AHgh+RrLczMGq0Om7tpLCdLRFItr5PkDeLgzxQ8WPJu5sS6bUU9lCOk6xRLWWE5LNM9NOBsg9nGquEL52nZZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt5Ytu8uBpq2vUbJR9q0Aoxqc6PelvZX/o85/q4QxkPiPfh5Q7
	jV3o3uAGqGHlCCrITCR178UE1FZPkmjGam80lmnne85V2ke5/IcFbVhXWLDphDyaQ2MlMiF8FPh
	ocUnC0LDHXpGbJ7hqswWHoA700qf1A2k=
X-Gm-Gg: AR+sD107jGlc2UPQAPU3KVD9DPNtGlulqxZjy/eFghxIrhavdxXbekeKyUEpAV9wlL0
	2d2tRYy1oTZ8s5R2FcWCCbR8FRJkQVKX+g3cZsISjKdhIJl/hScLSn37it5k9/ynAIKeneVUsW5
	4HPSH+K/Q1DI6op4qiuJkPu+EjV7pH9MsXgYYNFbkfrS5g0QYHQJPJy5ES0lDslC4clLGgXbBbq
	vNJRS6tfxCVwvR3lOFLqXqrAFO1d1TcMadFUNs2X2oUEq/3ONU3mMxPocd5JehJlfHFzSdAPiNa
	lbu1Uq3o2s3q9Yx2ord1ZwV+3uG91sdMjZig5lFr3leX7HjsOuCpYyMiCnZZ8S18v1Wz93dIGXP
	v+GJaesrAOxS5uuDNTYua97+rGXb/V2tsI3gT0APLrKFTrJ5bFPpxLqb/tAC7Dfpd+tmtdtLU
X-Received: by 2002:a05:6402:52c2:b0:698:a9de:16e4 with SMTP id
 4fb4d7f45d1cf-6a034a5efd8mr2250309a12.20.1785276516357; Tue, 28 Jul 2026
 15:08:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714234609.902367-1-rosenp@gmail.com> <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
In-Reply-To: <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 28 Jul 2026 15:08:25 -0700
X-Gm-Features: AUfX_my55lIzgp4p1LgtC37hf3Fnv3utQEiKazUbNyOLekyaFQ7_OqDwCH_br3Y
Message-ID: <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
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

On Sun, Jul 19, 2026 at 8:58=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, Jul 15, 2026 at 11:00:50PM -0500, Frank Li wrote:
> > On Tue, Jul 14, 2026 at 04:46:09PM -0700, Rosen Penev wrote:
> > > Replace the open-coded of_address_to_resource() plus devm_request_mem=
_region()
> > > and devm_ioremap() sequence with devm_platform_ioremap_resource(), wh=
ich folds
> > > the resource lookup, region reservation and mapping into one step and=
 returns
> > > an ERR_PTR checked with IS_ERR()/PTR_ERR().
> > >
> > > Behaviorally equivalent with respect to region reservation: the drive=
r
> > > already reserved the region, so the non-overlapping reg requirement w=
as
> > > already satisfied. Drop the now-unused linux/of_address.h include.
> > >
> > > Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=3D1;
> > > drivers/edac/fsl_ddr_edac.o compiles cleanly.
> > >
> > > Assisted-by: opencode:hy3-free
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> >
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Sashiko caught a bunch of preexisting issues:
>
> https://sashiko.dev/#/patchset/20260714234609.902367-1-rosenp%40gmail.com
>
> Let's fix them first please.
The unfortunate part of that is sashiko does not understand v2 patches
and whatnot. Meaning it will always complain about things fixed in
other patches.

There's no practical way to move forward unless done piece by piece.

As an example fixing the first issue causes
 [High] Calling `ddr_out32()` in the `err` cleanup path
unconditionally dereferences unmapped I/O memory pointers if probe
fails early, leading to a kernel crash.

because these functions are split into three.

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
