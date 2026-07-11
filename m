Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3CF625;
	Sat, 11 Jul 2026 00:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783728506; cv=none; b=lpKlPUcVhegBpNfcqoAJ119SiSB091KLJCA0i+mOc2oxeIM86EScvyBCHnPB5pLJVFHZcyfOKOMaUEwGJ5Jjg8SwjVIRPrkX5syQNSWKUd1l+Gx9O77CoE1xvYRhz1rssXtAQWeIXtcBGDXj3kt2SFWZ7vC1vdq8Qrs7QoTLgq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783728506; c=relaxed/simple;
	bh=lp9pQNIxIvC3amDLFQjPy1J9hdUcOwoPr07M+DvNxP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2FhDMHng0hBBPV4oQ3yIT7M9b15aXHJRDs/VPtF8c8I8mhKMqeMxM1qI82yh0xbDGrtpitUeUmvMnWgtuwD8d6/N+Kyh6+ilPSLYDKB49HdT1//Fdg+gqQV2Dp6u+B+DxekI/ZveyyeyeVbCpu6Ex9hY8FeehMvkXbg8LOXKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Qjp5NmJ7 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Qjp5NmJ7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 68FCA40E02B3;
	Sat, 11 Jul 2026 00:08:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kB4CR5Mn0DNS; Sat, 11 Jul 2026 00:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783728490; bh=KyOUHBfHr+HGeetuLW/C/WEtsriompyuepvhqPIKcA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjp5NmJ7gjLt/NfVZVC4U35Sxi79TT/WfTbsJoSvGUn0LlYZvoT4RZia8mHzzSZtN
	 /CrcasEDNySzlTM1yK2T8gPPBx2Lo0YsK7WMgM3+P4gXMRCbVgiGqNykRzJeeOY5iY
	 OWtCbdxBfAlSJ33lFpmUDjeZBXSyLj7qcV3g0zPIQ4sjBp/yyCxYMRDHlKBCfn8IuO
	 fI7Yv03ujuU/bWserC1Ud9qDFrGliJOJ23ODIKLvsE3WkACUk7MGDeSD/4MCYSN4U+
	 MjbrQepBx/KZq7yt0Ku9sp4rn/zkqcpWzJno22YdYjYaKa9HB4B+q2Fnwzz/7aL4K6
	 ls3oGYqqN4f6Q8jOtY5TN+a8mOTqBwFe7O3BjXIa7u2eENLvf/p8V5mKCU6ADlvMdT
	 uERILZFa1krbUPGIXv2ErR8hMTrdOQp91ehdoFI75nnyONls1p+Mo+cWW+ej+hD4uX
	 8239fKnL3cGJqV4BzpbYvXZBfVio/jYq5TF6pW8+4Z+fRwPAuE6sX1rAsyozkT+wba
	 I52F7LSajexGL+nsEqH9AobEeyrp6T0ZEKEzESa/Qu+aDuD7GFPeNgBjSpI3rpbzfX
	 NkBD3YA1b9rkXaSRDQdMhpWy66ppuxuDaPWOQ1wDtVz5kxRC3sGC9bUdNE8bOpyVK8
	 yO0lVOOW1Gt8An8sXtfNXnKg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B665440E0140;
	Sat, 11 Jul 2026 00:08:04 +0000 (UTC)
Date: Fri, 10 Jul 2026 17:08:01 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rounak Das <rounakdas2025@gmail.com>
Cc: dinguyen@kernel.org, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
Message-ID: <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260708091135.94114-3-rounakdas2025@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708091135.94114-3-rounakdas2025@gmail.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 01:11:35PM +0400, Rounak Das wrote:
> Convert the last two CONFIG_64BIT ifdefs to the is_s10 flag, so the

I'm reading that but nothing in the commit message is explaining to me wh=
y
this is a separate patch?

So I went back, dug it out and had AI sanitize ot for me:

"Replace the remaining two CONFIG_64BIT ifdefs with the is_s10 flag, so d=
river
behavior is fully determined by the ECC manager's compatible string rathe=
r
than the build architecture.

These two ifdefs guard the double-bit-error path, where SError handling a=
nd
the arm_smccc_smc() reboot call are arm64-specific. Switching to is_s10 m=
eans
s10_edac_dberr_handler() now compiles on 32-bit as well =E2=80=94 this is=
 safe because
all the symbols it depends on (arm_smccc_smc, INTEL_SIP_SMC_ECC_DBE, and =
the
S10 sysmgr defines) are already available on 32-bit socfpga. Since the
function only executes when is_s10 is true, Arria10 behavior is unaffecte=
d.

This is handled separately from the IRQ-index selection change, as the
double-bit-error path is a distinct concern."

Ok?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
