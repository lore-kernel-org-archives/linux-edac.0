Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2E92DA755;
	Thu, 12 Mar 2026 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773326558; cv=none; b=mlXk+2UN14AHssw8bgLoCqCADZO6VZyJ0rCTD2p5USEdb5CYL6cY8WG1gr7IMe+gFDcYiNZEZXBox3Ir0yreGiw6W+0wPdbhiUywEO1xORpc8vhRnVIIqZ9595+JqnmK4N6LLbLqfNk5i6e3qCZxV3aI6Wz/Sz3l9IhZ6VSjxDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773326558; c=relaxed/simple;
	bh=A25FIQVgxEOoQ8v5d2RaRkgvwNpjBmt3TPFslUmT0sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvXF9asKZei42piQ2amnkYGl6HCXUQgl9tAdubmcnHgEwSmHC10HwjoHmTLMiHpWEEGVjrTNICI6nNvZF5cPlrYpW3JWG55A4X3p9p8mzaJmd3JVUSTFBA7mMCxKRwd0LPfGS1t3l3NSl4m9+n7kq7LL3p+te1H7swb0uVBDBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=dFtEahrU reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="dFtEahrU"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B629D40E01DB;
	Thu, 12 Mar 2026 14:42:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uY757SCesaNz; Thu, 12 Mar 2026 14:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773326536; bh=JLRnVQPOHRZFziGB91RZyFZ10SIKBWzjtrLzb1MMVr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFtEahrUNECWk23g0XGA36huoSz+u2/dPIt24Ov24qa1q5kAHSq8Q9kwNuiiBHQxV
	 SfO9mV+Pt7e5gsNhOSQtE1iKTaVGqtaaIuT7FmWoyoVbYbifdIIgfiS0FO0hwZqy6m
	 zM3PY6FtOr31Hsu3KbsRtcG8SXPOCzmI7Mn6aVA6fjKRDvbwnSs5uGxmp9Bs/fdTeh
	 bPCTi2WIQunf9gWzYlYPB/cCxE7pfSwYWau1mloBsRLzw7eLyfylo2aEkHG4MUsq/t
	 lJ2iEVYJr14zmmZQbyrvtJNPttGQZuyuzoKIztG2XKWQEwnLV2ZbH/dZusuPWqn4EF
	 AMOfcW9L9IueQP+LNUlbQPy6mFYfDUIf7RyhOuDySmy1WGVMK5hNUSCBrPmyfyY3t9
	 nyIqSRrtRfyaop6HXlCfTGDjJdBSn6K9kfyjiErw1PjaMjANIulvWTuQs1AutoX00B
	 Y5nfNhuOJ8PCM5caMt8n67Ft+ByxIzweqSZifq612xzvf3Yzg4tmnHqNAoouWEsUVy
	 W1XiEgiKWxs1cDj+fBSJQFoxuZlSG4wwFxjoTC7bCUffJfYVefs4bUZHBUzFC1xJVh
	 NziczAVXhueAinqND1Ox5Y6CykIphC7rIvrRIzaec8kLPiC+lgG+wFUXSLOH5gToZO
	 7l5UIU4f5dhrdWdWr9J/OoSY=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 271C840E01AC;
	Thu, 12 Mar 2026 14:42:04 +0000 (UTC)
Date: Thu, 12 Mar 2026 15:42:03 +0100
From: Borislav Petkov <bp@alien8.de>
To: =?utf-8?Q?=E2=80=9CWilliam?= Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
Message-ID: <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218163025.1316501-2-william.roche@oracle.com>
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 04:30:25PM +0000, =E2=80=9CWilliam Roche wrote:
> From: William Roche <william.roche@oracle.com>
>=20
> A non Scalable MCA system may prevent access to SMCA specific registers

"may prevent"?

Please explain in the commit message the whole scenario how you're trigge=
ring
this in detail.

> like MCA_DESTAT. This is the case of QEMU/KVM VMs, where the kernel
> has to check for the SMCA feature before accessing MCA_DESTAT.
>=20
> Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
> Signed-off-by: William Roche <william.roche@oracle.com>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Cc: stable@vger.kernel.org

AFAIR, you're injecting errors. This is not really a critical fix that
warrants this going to stable.

> ---
>  arch/x86/kernel/cpu/mce/amd.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/am=
d.c
> index 3f1dda355307..7b9932f13bca 100644
> --- a/arch/x86/kernel/cpu/mce/amd.c
> +++ b/arch/x86/kernel/cpu/mce/amd.c
> @@ -875,13 +875,18 @@ void amd_clear_bank(struct mce *m)
>  {
>  	amd_reset_thr_limit(m->bank);
> =20
> -	/* Clear MCA_DESTAT for all deferred errors even those logged in MCA_=
STATUS. */
> -	if (m->status & MCI_STATUS_DEFERRED)
> -		mce_wrmsrq(MSR_AMD64_SMCA_MCx_DESTAT(m->bank), 0);
> +	if (mce_flags.smca) {

All this code should not run in a VM. So why does it?

What is the use case we're supposed to support here?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
