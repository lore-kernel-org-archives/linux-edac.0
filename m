Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66286331EB0
	for <linux-edac@vger.kernel.org>; Thu,  2 Jul 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007611; cv=pass; b=HnxGHtdmn2QFjulyBIdE26wrp1CTrbD0xMgNMDBaEQs8YqCTwjPYCy8n3yw3M9/nUvzNFPl6KtjmUfDkkKj9l26i54/89I0nD2rrgWxCKeaiqrmlE5fa9kNy1Z78ZgDIuZNJfz8l9b0r2O3kyP3LC+C8fsmOKYiTU+V7ymPZbJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007611; c=relaxed/simple;
	bh=LKwZ8Ehv5Sl6O5UhaeENPwFfey79A02eswN+OWRhsk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpZy4DfFjn5FGB0+8i/BcOCErc/aVj7mzC68evCvka+XKHe4YW7ha/1N7+lrvjpb65Kf3IHltDJJQ/NJ+bU6gHTyLAZZJ8otMERwm8kWd2TE59Cawa4TInTsbs1x/UaTgC1bASOv5oX2mysjScDxTv0I1G7hv3cNHP/ZvXdeBBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZX/aOFm; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZX/aOFm"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1152829a12.0
        for <linux-edac@vger.kernel.org>; Thu, 02 Jul 2026 08:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783007610; cv=none;
        d=google.com; s=arc-20260327;
        b=Gdo3ZuUUQtG8BGyQ2nPyfh52+u9/Ed4gTV5Yi9LBbTPZHBVRlpPKM7Qu3O6kKHWnu/
         r1Ly1dUMjFS5ECT6liAbtbQjzgUl5YNHfAv98nex68izohsGEnID7E+HuFH/FihqVR5m
         5UiKV3D0Gqqj1gBjlkgSrJw7hE1JZkFatl1tJnijfStQHTpRd1pirzUIe0Rtpykf+pmb
         98WuPh2SQcZG6tZ7TdEI+zZw2RNxI3Wz8WByw4DM6kzyJEYvFNAEjjpfg68A5WFeAPF5
         lH28VF5+CFiqfZOuiG9Dzq82Gp7aoFh7f9gPu1ZCHPyo4G5RohWtWbuzpgoc1/ejnwUj
         gdMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LKwZ8Ehv5Sl6O5UhaeENPwFfey79A02eswN+OWRhsk0=;
        fh=zBlSM1r13/mDYNNm13d8CHFeZEVvP1Xvue4gILm/MFA=;
        b=SnGIsd00aSHguUEq9lusIHm7bE6YIElPgoM1lUNP/hnbY+KSznsLbMU/zoSAxKNuVp
         H6KzPB24hCJCByxQ4x+/UdYupPRzXTAZYKNY5p7cuxR6NjHSjdvkIw7JKcmhiXB/Debx
         swuAZfoeiZIMOiIJ7YZBL30rNAwg0mYXZyshMZJhW9/6BKcQjrE85RVgW1dHx4Q9ky2e
         7knkfu3nW8socc/BbJkYSgxYrQSej9iJ3QXNMG9a/GJ/8Bsab0qy475vAAw0rZXyMtDp
         OMOEmk3GuLVo9uc2mR4AujwaTjQlei9YFxYc29UviuBn645oSQfTimvqJmKfguvL40fg
         UGcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783007610; x=1783612410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LKwZ8Ehv5Sl6O5UhaeENPwFfey79A02eswN+OWRhsk0=;
        b=MZX/aOFmMQIztnNnp37ORN9btOUnpht5MxQUqLmuRzp9XOHHvjgHNR1BZtvsUmsbNi
         6arWDXv+ZhFv8kJsv6DTRzQUwQwLmUPzgeu3z0ZcckQWWPkp2jPa3g4wEsi+6uWO3kko
         e8PHveACeLXm0EwOAz/3td0D7qrEEgXC57fY87QWQda8/km9qWmiNMSeXrulaTjFBSC1
         rE9uEUrIt+J3fcmx0lwwr7UUm+Rtd2JKCH9lFVqABj7cbWYmdnpV6V3OMDFrK35t1Uo1
         taERkk8Mknj8DvUxx+RgKiQ1TY9AU3CF4d51ufE/NPNASk9Bewy1TIwubrIwupVrYgwv
         +guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783007610; x=1783612410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKwZ8Ehv5Sl6O5UhaeENPwFfey79A02eswN+OWRhsk0=;
        b=U0NxvvTT9vgS1OlFtGfm05TrxZzMau9czuoP2KOMDn9+gdb6C2f19R7Ds67wkgZMhl
         iHkNaIDJADJROdKVA26OijJdNXQnS+6890PMFsmslrxHF1pHeEQwWIMCforfQbv6LF4v
         hMWey3pjCVNgpC5wuvvqirNkvtGrBPJMxr3DavL4v6Lg01njmkfOttYzO3IHec/q4Kon
         8Dlm39DNKOS073KuEJA7VjuT42pzNmi5Mi9gkzBX79JTYxMOgo9ky5OUdZqGonGu6duJ
         +VuqFxfJ2Bp1FXk6yyMgnocxgCbWgBVrQRi8s9r/jAA8iewzweraSBULY+D3V0xeXBR0
         Ob8w==
X-Forwarded-Encrypted: i=1; AFNElJ9BtJGJ+glgf6VpvdYmMSp63sqdFroUNQ/SmtVo3JfEcTyoEpU7St+osPFq1iwFqRCxkmgjc2ZMOlz0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9gvs7EySxJuO5nQqN7ZL5B169lDFyvk7uNyzPD1ZGCX2U/OAV
	moYw94jwdny0lBzxJkQI/C72aP35M4B2sVNyo3cMDX7S08WOVzL5b2+J8N+XZIK614Id4adcdxg
	MlcHZLCJLg+AUkJgGCR4fD8wr+vbIvoY=
X-Gm-Gg: AfdE7ckNJXB51EAxGgnqu/rX5PYxeA7GomE3l5dyXtvMxc0SiGjOts6nV9W31HxF5S3
	CTA8NIFQs8SsX093pJoMYJu8dqyIV6KWw09JkCjc4iVZ41J8idnzYahjyRs7aTINQrHpzRvk3z1
	FsaHP7gs1pJrvmzX20M/iUT8OFCohwd7/QlhxMtGkC/11xdD45oY1mcetlQLCwz/M0MjdlJVO0V
	kP2XBtLAKAiVHL8N4M4ZJM08T0M7HwV0L4M+JYBXQMO3wUqE1XVbHO+JuHobaJSZBoR416uYr4h
	3EZN6cWZLjO2qtFOymSEmg573BKP
X-Received: by 2002:a05:6a20:7289:b0:3bf:95f4:dad7 with SMTP id
 adf61e73a8af0-3bff4282ccfmr6829621637.41.1783007609637; Thu, 02 Jul 2026
 08:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627061723.43014-1-rounakdas2025@gmail.com> <1acf2543-6773-4dad-a94c-76fe3c11ca8a@kernel.org>
In-Reply-To: <1acf2543-6773-4dad-a94c-76fe3c11ca8a@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Thu, 2 Jul 2026 19:53:18 +0400
X-Gm-Features: AVVi8CeYSbQUUYaEQHTr-tGnO-VFWxnr4UkduYfPkq4CsbaMykT6dx7usDNhqFQ
Message-ID: <CAPYTKoOBG=quMkOsnAaT7Kn3Zni_Jxw8kjJPwRq3CHrd=hnQoA@mail.gmail.com>
Subject: Re: [PATCH v4] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

Thank you. I am glad that v4 tested clean on both platforms.

On the two remaining ifdefs: I originally left them as-is because they
guard the double-bit-error path, where the SError handling and
arm_smccc_smc() reboot are arm64-specific. Converting to is_s10 would
compile s10_edac_dberr_handler() on 32-bit too, but that looks fine
since the symbols it needs (arm_smccc_smc, INTEL_SIP_SMC_ECC_DBE, the
S10 sysmgr defines) are all available on 32-bit socfpga.

I'd like your opinion before sending it. If you'd like them removed,
I'll do it as a separate commit, patch 2/2 in a v5 series, since the
DB-error path is a distinct change from the IRQ-index selection.

Thanks,
Rounak
