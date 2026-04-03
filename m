Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FBD31E84D;
	Fri,  3 Apr 2026 14:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225034; cv=none; b=pMlSFIljm9mqZI0zcujB+P4UJRvHmyNaSjgkuOYt7iJ8+WjFVt3MjBIpzqR5eera8+wCG6ZzmGzbTeV3gNdieooFCuMVx5jjVdeoFwbO5215Km3RGBCjK+ro/a2Xenig3IZHaMCh2F+UY/IYZTNaiDPG5dkS1SPeXBXU9bigA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225034; c=relaxed/simple;
	bh=zqEZYovmKLOq4tS4/cUv85YFtHohFYrzXffXsg+JoNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUs41yfn9JL4dxFd4cE4e3rceq3p+6ZEG3hzIZeYCHeV8u9mwRtO9CyNZja3Lur3oTZtocBOshB7JZUJQ84PEKdbsT3KL7MXeQa9SS6oOKCFyhnd/1LTrDzFbIBw7wY0qITrmuR3H7B4yHri4eeRnovSGbx25sh1WJpEe9/1UK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GgoEQ6cQ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GgoEQ6cQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7666540E016E;
	Fri,  3 Apr 2026 14:03:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id s0hpxQym-R65; Fri,  3 Apr 2026 14:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1775225023; bh=wnzC4zYM9e2gMAKoUM/OsFwz+amcXJ1pNO/E/rc0maI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgoEQ6cQmB2A3Fh5sANJ7e13PmAxI/34ntYGU99P1cbk6tV4BvOth56FDoypMyqsK
	 q3mG0/ojVdPpOj3ul1ZgHJ4fGWlL7TlYPmQRE3hIgUUoCkfc7lWzsbhbhYqj/DKe/T
	 /JBxT5R5oboJH0GSNxVCpEJ2CLatV4CcuJL41495gUmyIHyLI860mVNHsg10b01skf
	 caWfZ48w4ejmiBHLiMuatr8P/AWl+vsvokxUETV/F7LNqN5Wcy6UYpZL5IJk+GFzD7
	 aoo6pR/TvFlypOfBqGNZO+US7jw1T1Hcd1MvwhxQeBmPmqOIImm2uGe3Dn9MgFJOsz
	 BTtJNieEQkTYe9O+5g1ZMX06B5kQmzVzQve90Y1tIrjB2NMEBwU6mq08ofA4uxh8Ss
	 chVPEvPZzKNqqVMvdWWqA29/FoVdtyNz92ytbOR3NYEbbbF3n/WKmw3I82rzHae77D
	 9z6brIWb+gBczpb/RQaIWmKlMpcemSWLF/f+MAA/FYrFBPSbrpk9RT3RJ6JcIbi5xn
	 VIEog11tj1MKSrYDuAnj/iGKRZ308qR4VcyULaFBLlfqBdqM8sKJRRFQjHF13LQ7UC
	 LEcWwvS1CTEW/Fja+7bfXPPMJcY3Rg2+Gglkr75BFGukUS89suYDLTADwSHYJ3qKTR
	 Z6SE2rh5tcZAxZcHcWeWEBrw=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id CF7B740E0031;
	Fri,  3 Apr 2026 14:03:38 +0000 (UTC)
Date: Fri, 3 Apr 2026 16:03:31 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kristian Mide <kristian@mide.dk>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, linux-edac@vger.kernel.org,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: AMD SMCA: L3 cache scrubber deferred errors flood logs on Zen 3
 after 6.19 polling changes
Message-ID: <20260403140312.GBac_IoFTDxkdD6fSn@fat_crate.local>
References: <CAKFB093B2k3sKsGJ_QNX1jVQsaXVFyy=wNwpzCGLOXa_vSDwXw@mail.gmail.com>
 <20260330231221.GMacsDVVrBmOXSH0t5@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330231221.GMacsDVVrBmOXSH0t5@fat_crate.local>
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 01:12:21AM +0200, Borislav Petkov wrote:
> Just to let you know that we're looking into it - it simply takes a whi=
le
> until we figure out what we wanna do here exactly.
>=20
> So thanks for the patience.

This should fix it:

---

From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Sat, 28 Feb 2026 09:08:14 -0500
Subject: [PATCH] x86/mce/amd: Filter bogus hardware errors on Zen3 client=
s
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Users have been observing multiple L3 cache deferred errors after recent
kernel rework of deferred error handling.=C2=B9 =E2=81=B4

The errors are bogus due to inconsistent status values. Also, user verifi=
ed
that bogus MCA_DESTAT values are present on the system even with an older
kernel.=C2=B2

The errors seem to be garbage values present in the MCA_DESTAT of some L3
cache banks. These were implicitly ignored before the recent kernel rewor=
k
because these do not generate a deferred error interrupt.

A later revision of the rework patch was merged for v6.19. This naturally
filtered out most of the bogus error logs. However, a few signatures stil=
l
remain.=C2=B3

Minimize the scope of the filter to the reported CPU
family/model/stepping and only for errors which don't have the Enabled
bit in the MCi status MSR.

=C2=B9 https://lore.kernel.org/20250915010010.3547-1-spasswolf@web.de
=C2=B2 https://lore.kernel.org/6e1eda7dd55f6fa30405edf7b0f75695cf55b237.c=
amel@web.de
=C2=B3 https://lore.kernel.org/21ba47fa8893b33b94370c2a42e5084cf0d2e975.c=
amel@web.de
=E2=81=B4 https://lore.kernel.org/r/CAKFB093B2k3sKsGJ_QNX1jVQsaXVFyy=3DwN=
wpzCGLOXa_vSDwXw@mail.gmail.com

  [ bp: Generalize the condition according to which errors are bogus. ]

Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
Closes: https://lore.kernel.org/20250915010010.3547-1-spasswolf@web.de
Reported-by: Bert Karwatzki <spasswolf@web.de>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/20250915010010.3547-1-spasswolf@web.de
---
 arch/x86/kernel/cpu/mce/amd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.=
c
index 146f4207a863..7fc78759cd4e 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -606,6 +606,14 @@ bool amd_filter_mce(struct mce *m)
 	enum smca_bank_types bank_type =3D smca_get_bank_type(m->extcpu, m->ban=
k);
 	struct cpuinfo_x86 *c =3D &boot_cpu_data;
=20
+	/* Bogus hw errors on Cezanne A0. */
+	if (c->x86 =3D=3D 0x19 &&
+	    c->x86_model =3D=3D 0x50 &&
+	    c->x86_stepping =3D=3D 0x0) {
+		if (!(m->status & MCI_STATUS_EN))
+			return true;
+	}
+
 	/* See Family 17h Models 10h-2Fh Erratum #1114. */
 	if (c->x86 =3D=3D 0x17 &&
 	    c->x86_model >=3D 0x10 && c->x86_model <=3D 0x2F &&
--=20
2.51.0

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
