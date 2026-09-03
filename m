Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A29283FF5
	for <linux-edac@vger.kernel.org>; Thu,  3 Sep 2026 08:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425393; cv=pass; b=kWwaoi0Dx4VZHl32KL6Odj9WlmjA8pRzb6QsVyaea/4uyz7DmyxDuf3jTFznfTLaT7pST4Ybk/GcchZL90sTuxhmWjs608KV1w4Ube9oqeBKoKxyJXYzJs0iQHLTAKhzK5+5dBa+mRr4vREXLUO/plCbEF6WmTsOLYw1dO7SToY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425393; c=relaxed/simple;
	bh=4xFBYRVlD8TkT/agYfvie0rzFIuWbVqQuTIjgw8eAwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6LuL1RNRK7jsQqI51fzO3nTRV+iNfXHSukOG3JZ28tECxKbkXWEzMOsN6eRXgMU7brjiQOBR9Bwwkwqb8SnzVgozR7DpwLj6JkGnlICgIdCHWPWnyCxn3yclp/2AkavhNX/S9uNF5N23tnQND/qQLjnrVhwvC23lEqwWzzMoMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HeH52Ugz; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HeH52Ugz"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so3213560e87.2
        for <linux-edac@vger.kernel.org>; Thu, 03 Sep 2026 01:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425385; cv=none;
        d=google.com; s=arc-20260327;
        b=Q7TMWibhyk59l2XRFA0Qp2GfUHQE2ZOEoHXwRGbQHf9bw6okEFLN/PhAgkOTTeTUbm
         DSF9lZ8FKgajLZRLkKdxROL3W7oYSBqoib2eiqyouz0t4QljbuLunORaOqbJtq+TbRvQ
         9Ev3SdH+IB3T+yODf3vP4/ciKhIWHQ7PEjGlR+991PnP1kgQIcQW5X1gtKVZ/WI3rMoK
         tqh34DtDep1TY0iIqoXiYfVO0pzjDWcbliD1tn+R8pr0GIuIZCh0aXTx49EmFopIqBmt
         4+qLcW3HXbtFdWzo63CR4KUjKfUKGTvmmiR41qTPYo2VjPNbXq0XF4iNX4mnWTZZAPPE
         MzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8qupEJ+Oj3t/z5MM1UFl4HO0bzmR1UIRo0/61ehsCh8=;
        fh=Yf7WAeUQei1+s3F6+UHV++PdEYKlsi+4iuoNhigl79w=;
        b=U4F3LZr53kAlZsFPDkaJeKZdoOeLFQOw4DGKql3NFI7dQUesxGLXrRw5b3IM+O7d4r
         GfuHJd+ZEeVy9s9RTSAXVXy0LkYsfdva/BX/MXpjHabqZtuvq7fjWiNdSmcRRzP5ZvPx
         2sYgq1JUFXvW1NOQSjTABWUNI/VWIjXp7WEFdk5ogLeidnqJY9ZzhmNkFs1Of5lKJ2dl
         mGQj4pPazxaV3delgyZzQoJYZqojpcIigMI76rk2nHFywqSSdLmp9CLs+4P5pZ8LL1Cz
         Vz6WTCdhQQPiYrJDFippLSUjZ0I4T/O2oWnZGha9t8/ueJdjFOxTc9Re4NknM9/bzxAn
         1Asg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788425385; x=1789030185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8qupEJ+Oj3t/z5MM1UFl4HO0bzmR1UIRo0/61ehsCh8=;
        b=HeH52UgzwLWhbVOZ+m4QoglqC0KFmb2H2zGxavEXCCroHhwk4cElC28HdC+z3wGeEM
         fCBjHp7sfOYjDcOScwM8JDDL23nbhCJS6+zMplLIsHmqL+wvUDaf8PaWK2+mlEJ2Sg6T
         +MuwzncNLcjiGK/gT6R99GgM2dzoo4zYuUB3I4jZZSQ+ZgBNyKMbLo0M6iG/gemHzZLg
         eSM7jwMxNCZ91khW49J4Od4jatRH1AQncXuQ1qADwTPYj7UtGMYz3tGLANH3erXXEDS7
         9C7Lw1Nv2xPZCAFoRY4e8pHzogVLCRqPqyLESaT4jI0eIOHMrQkn2aZm7+g3vE89XyGH
         ilyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425385; x=1789030185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qupEJ+Oj3t/z5MM1UFl4HO0bzmR1UIRo0/61ehsCh8=;
        b=WfQzVF6ZFCK8/zEVYvjmbtYZ2FeqIH4yLcXc/IHE0DGuX/FkXRyqewFxfGR1X8sK4T
         Ou/NYxAGJkog0inrKejJ38Uz3H/hiNVBXSPy6R0zagX2PvoXiQ31xyyLWjnXQWNbg9PD
         V6Fyb+02J4A1dycI74RXoqWouISWIwaplwaPbTLsP0JB3av/UJ/mhEBVaPyJO+nnJasK
         YhL9n+fvtO8Ae8+J7D1h+T57z51AVg0tHjrJ+pbyyyrwtvT4dZL4ubVFKcSZ38fWVjh5
         fVRWdzAcX8jT5KdlKiYZZ7HZeU0cyeRlsF6RR/Ux7rKPEVGoo3ghUi9ANeMhaDp4F866
         /yIw==
X-Forwarded-Encrypted: i=1; AKwUvByqgBIYhMjZQPE3+U4FhwpmJHrJq3fG07392cC2UjiWiPM7cbNNAdISyMtX2L8SL0GE9GjD0aSSaThQ@vger.kernel.org
X-Gm-Message-State: AFuF++mFtpHOXdgEu7z5gT9CYGiKsbw4smIwvBTaJgGxADaxBnV9CJvg
	6qJVPP366N+HUbPoAFrhFD1fH+BRK2A6bVHJfUzdWrhvVVOl5E7Wxgyf7Zbz58mErPCt2gA3CG7
	Sbne02kjwMoC6/F8onLZrLUsuCyRS5JFe6erG+1OAKA==
X-Gm-Gg: AYBFou2+VheCh1G05bes2aDUabvc2JdId5jQmXqmPKJ/wdPKUxcYO5W/1s8X2sOPhJG
	8svidM/WMEI2180DcUZPTAuG6dAe/4w7lSxzY7emrWMuD6LaIFznw/npWwRZ+PFUBGljcHjrBYj
	CkVtYGPLfyyujnJ7htp9cp7ks7ygd9nfJ2k2SVdVcxoMKJzeXsCr1QcqW9qHF5XRe8c2bZMfqPi
	18f1YBAp9JoSsLdykTasGFg+k9L8j8IyvnLhEhaQQer9aoLvqxaPOJhb/fJYFPfBZUgSxUh1+nK
	S6snBtwHvY04q1kksKYXUqc1VO1HbOhLJKJqQ6y19Rt58w108xIGLTkzIqAJYvqXKtLlTCQdwwV
	lkQ==
X-Received: by 2002:a05:6512:3052:b0:5b6:4b1:f8be with SMTP id
 2adb3069b0e04-5b6087ec2b0mr2784218e87.31.1788425385396; Thu, 03 Sep 2026
 01:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903041320.179965-1-atomlin@atomlin.com> <20260903041320.179965-3-atomlin@atomlin.com>
In-Reply-To: <20260903041320.179965-3-atomlin@atomlin.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Thu, 3 Sep 2026 10:49:34 +0200
X-Gm-Features: AcwNN1VGaaX3VQtIld06ROEx1uBk0jP3N4jeV01F_iY1UtWlPEZVGnuL3VgEq_U
Message-ID: <CAAofZF7rNbEZuiGJXyjn+wwtdF0Y9vDEo2hGhJak6CCkP8YB-g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tony.luck@intel.com, bp@alien8.de, tglx@kernel.org, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	frederic@kernel.org, neelx@suse.com, sean@ashe.io, chjohnst@gmail.com, 
	mproche@gmail.com, nick.lange@gmail.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaron,

On Thu, Sep 3, 2026 at 6:13=E2=80=AFAM Aaron Tomlin <atomlin@atomlin.com> w=
rote:
>
> +++ b/arch/x86/kernel/cpu/mce/intel.c
> @@ -229,16 +229,17 @@ static u64 cmci_pick_threshold(u64 val, int *bios_z=
ero_thresh)
>   */
>  static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int=
 *bios_wrong_thresh)
>  {
> -       struct mca_storm_desc *storm =3D this_cpu_ptr(&storm_desc);
> -
>         val |=3D MCI_CTL2_CMCI_EN;
>         wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
>         rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
>
> -       /* If the enable bit did not stick, this bank should be polled. *=
/
> +       /*
> +        * If the enable bit did not stick, this bank does not support CM=
CI
> +        * and no corrected or UCNA errors will be reported on this bank
> +        * (SDM Vol 3B 18.5). No polling is needed.
> +        */
>         if (!(val & MCI_CTL2_CMCI_EN)) {
> -               WARN_ON(!test_bit(bank, this_cpu_ptr(mce_poll_banks)));
> -               storm->banks[bank].poll_only =3D true;
> +               __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>                 return;
>         }

Not sure Sashiko's review it makes sense but to me it could make sense [1].
In short:

> cmci_storm_begin()
>    __set_bit(bank, this_cpu_ptr(mce_poll_banks));
> cmci_storm_end()
>    __clear_bit(bank, this_cpu_ptr(mce_poll_banks));
>
> Since __clear_bit() and __set_bit() are non-atomic read-modify-write oper=
ations
> and softirqs run with hardirqs enabled, will the hardirq's modification b=
e
> overwritten and lost when the softirq resumes and writes back its value?

Sashiko's suggestion is to use the atomic versions, "clear_bit()" and
"set_bit()".

Thanks!

- [1] https://sashiko.dev/#/patchset/20260903041320.179965-1-atomlin%40atom=
lin.com

--=20

Marco Crivellari

SUSE Labs
