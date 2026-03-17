Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8BA37C0F8;
	Tue, 17 Mar 2026 18:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771483; cv=none; b=KizHSvWnAQqI24/E73Gd4uxqqy2yb+ldJuhLp9z7xHo29NUoOXqw87b1LmVDhu4liBbD2smcg3vpxc88JNWRGlceYOjNgcGaP/uH9cVslimbPEz/2Pltq037Ez8i4aJoVkTxsgRD881tkU/84wFzEkMoahCyquoOEXVESJmxJF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771483; c=relaxed/simple;
	bh=8sQOhab+lLJnNeLoApSw9cxA5r6UMvr4xD5yzJ5e0Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsrmgTeq5L5FPTNhxey+WLL7A4Pkmr0JFDug7broAgqVjq2wKJ9232HYjzig7Rkirsexz0wXcoHC5gozqxBcEzSNyg+YtKXHpPzOMTKPP3PYvSsoavz4RJO4phTbtk2gPNKmOL/P8a1qp4Vvz+CZ91ExPqIU9tG21LiMXctUh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ikbw7vnf reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ikbw7vnf"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 630E240E0163;
	Tue, 17 Mar 2026 18:17:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id My6jmH7xuHWt; Tue, 17 Mar 2026 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773771471; bh=KYzFzFRcjCgN9GdGMwyidFk4yMbzsJJWvq01cki7Jtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikbw7vnfg7BBVbAlEjEbXxw/U5WCUY9HEXGKgbpeBUyA/AShkkmUjaKEpjDewJMtb
	 foGDTuRNyBu6nOBO7FsRnY8kN5uKLTIZhckD7YafNHbISJ+OPaU7c89nBQJjzB/8ej
	 5f1+CSiN2e4SRTUeYtChB0ifkRA3Ve0iyn4sFlcFTxL4ur0LECeO6GZea7Wzq5tyPm
	 k+WcFDU6ejnOFw1dEOFbmwSFg+4U9D2hd/Uw6OJ7Zy19ioOlFc2nQVRrQLBl0DVsmc
	 F9D2pkvc1isYmZxKJPMZJIMfibmvmXkefake/cnkQtdsczqzTxfvklPppAAnRNuW2L
	 +JTrCZxlIphIoqaYuquBcq23TX46kjSEWa4RxcroFwpcacxoh9hVOPPIJdRU1A74Qa
	 9s1HZAJRIubeJXS0i/d8VRGuyQoUxMcQ3WnCQrwoKcLYYFsPlzFdy4Cp1gqpPrYANC
	 S6GavBMBU3fbV9BsyZDPgz3imROF1Zl4XMwdYsEmbkKR2u7osTwHjl85LnelnJCqZ0
	 ZkPwRnZ9LuTxvEZgOBeWmkWVST1d6lMNpkv9UBrs8zSNLZ/pVO/hnFTXk95mtczXQp
	 qojW16fjT/QQcrodo1XnXIvbWCf7N2Zs5YRV+IJJwWjmAqN/fZEwjqASpbQA77zvys
	 y3WGdeGkGfBK+Mhs5Pol18V4=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6A2B340E0223;
	Tue, 17 Mar 2026 18:17:39 +0000 (UTC)
Date: Tue, 17 Mar 2026 19:17:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: William Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA
 machines
Message-ID: <20260317181731.GDabmau8-FycDqbzZ4@fat_crate.local>
References: <20260317103810.2492661-1-william.roche@oracle.com>
 <20260317103810.2492661-2-william.roche@oracle.com>
 <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
 <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 02:38:58PM +0100, William Roche wrote:
> On 3/17/26 14:32, Borislav Petkov wrote:
> > On Tue, Mar 17, 2026 at 10:38:10AM +0000, =E2=80=9CWilliam Roche wrot=
e:
> > > From: William Roche <william.roche@oracle.com>
> > >=20
> > > Access to SMCA specific registers like MCA_DESTAT should only be do=
ne
> > > after having checked the smca bit. Avoiding a non-SMCA machine (lik=
e
> > > AMD QEMU/KVM VMs) crash during deferred error handling.
> >=20
> > Not good enough. I rewrote it to:
> >=20
> > Author: William Roche <william.roche@oracle.com>
> > Date:   Tue Mar 17 10:38:10 2026 +0000
> >      x86/mce/amd: Check SMCA feature bit before accessing SMCA MSRs
> >      People do effort to inject MCEs into guests in order to simulate=
/test handling
> >      of real hardware errors. These efforts are of a questionable nat=
ure because,
> >      for one, a guest cannot really make any assumptions about the un=
derlying
> >      machine and especially which MSR accesses the hypervisor filters=
 and
> >      which it doesn't. See Link tag for the whole background.
> >      However, regardless of virtualization or not, access to SMCA-spe=
cific
> >      registers like MCA_DESTAT should only be done after having check=
ed the smca
> >      feature bit. And there are AMD machines like Bulldozer (the one =
before Zen1)
> >      which do support deferred errors but are not SMCA machines.
> >      Therefore, properly check the feature bit before accessing relat=
ed MSRs.
> >        [ bp: Rewrite commit message. ]
> >      Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Po=
lling")
> >      Signed-off-by: William Roche <william.roche@oracle.com>
> >      Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> >      Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> >      Cc: stable@vger.kernel.org
> >      Link: https://lore.kernel.org/r/20260218163025.1316501-1-william=
.roche@oracle.com
>=20
> Thank you.

Rewrote it again after talking to Yazen. A patch needs to have the proper
justification why it exists!

x86/mce/amd: Check SMCA feature bit before accessing SMCA MSRs

People do effort to inject MCEs into guests in order to simulate/test
handling of hardware errors. The real use case behind it is testing the
handling of SIGBUS which the memory failure code sends to the process.
=20
If that process is QEMU, instead of killing the whole guest, the MCE can
be injected into the guest kernel so that latter can attempt proper
handling and kill the user *process*  in the guest, instead, which=20
caused the MCE. The assumption being here that the whole injection flow
can supply enough information that the guest kernel can poinpoint the
right process. But that's a different topic...
=20
Regardless of virtualization or not, access to SMCA-specific registers
like MCA_DESTAT should only be done after having checked the smca
feature bit. And there are AMD machines like Bulldozer (the one before
Zen1) which do support deferred errors but are not SMCA machines.
=20
Therefore, properly check the feature bit before accessing related MSRs.
=20
  [ bp: Rewrite commit message. ]


--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
