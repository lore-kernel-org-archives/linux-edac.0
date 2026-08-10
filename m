Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9572D331EC0;
	Mon, 10 Aug 2026 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786349448; cv=none; b=PiRmTDBfU4dASAV0mJrD5gy2qT7/aafWSAWehfkoQT8uvJIuTjYW75m7Fs5attmKd9UrHQj+O9jg8QP5WwkPRw1T7v45dxg1b4umRSGskOmLMbBVYyvpcaAvw3gtfOZ1B2Cq4mC+nKUmi4kQI1JgyuFFA7rmCfZWlPH+TVEofWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786349448; c=relaxed/simple;
	bh=D8GAAPcPNkvGTDlj9lP0xZu0c4aQ0+uGJs8xBq+n/kM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=ZiVER0gwolX+t6VWN6hsF4hVoVMexQhTx/pax34DNSMWMVu4qDoScJiOOvWOiDpAUq1qgZSSl5BLOx4OPrkgQ3xI/RA5GYl/va42NNZigefsLdIlpbO9I3yfANko3BpZKhHuW8wwpwC20e/AL7V0o7/hfqamLq6gVX90CRX3Vh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ol0m4cZ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ol0m4cZ0"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BDBF41F000E9;
	Mon, 10 Aug 2026 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786349447;
	bh=D8GAAPcPNkvGTDlj9lP0xZu0c4aQ0+uGJs8xBq+n/kM=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Ol0m4cZ0Ql+pds/46gHDTbjsqiX90sOnocAxtDPny1NKrwNoE52jE/jJOpngRzVsC
	 YSSXcxLgXbE0XDIrqhI4cB2iywfNuJvD0GBzwpZXTG1XSQ8FDg9jony1cfIFCO25n9
	 5tbbwDoiuF5EyiyumRDnSznWZijY3qYvBQKpGHYR+iuLqmjbHdaHUrYLLTRKjgeU0u
	 ratLSBNsbERH7HLY9N9F5LqA6dsZA0aLdF/spscMMk5EM3mhWDCfkZu3U0JasP3vve
	 6jxuaQdP866Q6gSCvFFk7uEwx4X8sI5XJyera4SYOfZf81MJimLLQqfJVjjTeqDPMP
	 9udRKX+sIWR6g==
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=44ada78920db0c5cdf4033a7b68fc9cd12279b08ce4d58d6c9e466420964;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 10 Aug 2026 10:10:43 +0200
Message-Id: <DKL4118H7S5U.1FN3E4DBY4GHF@kernel.org>
Subject: Re: [PATCH RESEND] powerpc/configs: enable CONFIG_RAS to fix EDAC
 support
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Janusz
 Krzysztofik" <jmkrzyszt@gmail.com>, "Takashi Iwai" <tiwai@suse.de>, "David
 Heidelberg" <david@ixit.cz>, <linux-edac@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Borislav Petkov" <bp@alien8.de>
X-Mailer: aerc 0.20.0
References: <20260730105546.3658570-1-mwalle@kernel.org>
 <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>
 <DKC6Z5YGBF2O.TAJAN566BN0L@kernel.org>
 <20260731022855.GNamwIZw7Fz4Yhk__S@fat_crate.local>
In-Reply-To: <20260731022855.GNamwIZw7Fz4Yhk__S@fat_crate.local>

--44ada78920db0c5cdf4033a7b68fc9cd12279b08ce4d58d6c9e466420964
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jul 31, 2026 at 4:28 AM CEST, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 10:35:20PM +0200, Michael Walle wrote:
>> I don't get what you are trying to say. CONFIG_EDAC_MPC85XX is
>> enabled in the that config already.
>
> You mean, *because* CONFIG_EDAC_MPC85XX is =3Dy, then RAS=3Dy? I guess th=
at is
> true for this particular config.

No. CONFIG_RAS is not set although CONFIG_EDAC_MPC85XX is set.
Because CONFIG_RAS was *automatically* selected before the mentioned
commit.

>> It's just that the mentioned commit broke it because it removed the "sel=
ect
>> RAS", while EDAC depends on it.
>
> No, that commit dropped a select statement which is good in its own right=
.

And while doing that it will break (at least) the corenet32_smp_defconfig,
because it removes the "select RAS" (which was on the EDAC_MM_EDAC symbol).

How would that work without adding CONFIG_RAS=3Dy to the defconfigs
where EDAC (or rather EDAC_MM_EDAC) is enabled?

Here's a quick test:

git checkout e3c4ff6d8c94

# remove "default y" from PCIEAER, because that is also selecting
# RAS. But it was removed in 8c8ff55b4da7 ("PCI/AER: Don't select
# CONFIG_PCIEAER by default").
sed -i "/default y/d" drivers/pci/pcie/aer/Kconfig

ARCH=3Dpowerpc make corenet32_smp_defconfig
grep CONFIG_EDAC .config # no CONFIG_EDAC, nor CONFIG_EDAC_MPC85XX

git revert e3c4ff6d8c94
grep CONFIG_EDAC .config

You see, before that commit, the driver was actually enabled, and
after that commit it is not.

I'm really not sure what I still have to show you that you agree,
that it's a regression.

>> Still, it's already enabled in that config and it somewhat recently
>> got IMX9 support,
>
> Who got IMX9 support?

Disregard that, I was confused, it's in the fsl_ddr_edac.c (which is
shared between EDAC_LAYERSCAPE and EDAC_MPC85XX).

..

> I can pick up well tested patches tho.

Good to hear.

-michael

--44ada78920db0c5cdf4033a7b68fc9cd12279b08ce4d58d6c9e466420964
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCanmHgxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gzcQGAsR41P3plwjqhvP+m1h+za6dU6QPVszbW
GDsyisbCK/xjoSONtEjUStgqsSwvGmwCAX4+j++E6ePSZB2BpGbvqUoa1vUcIUwL
UauC8jzpaOBEDvUoDOtL8YzxVrNA2RNEHtQ=
=Hlr+
-----END PGP SIGNATURE-----

--44ada78920db0c5cdf4033a7b68fc9cd12279b08ce4d58d6c9e466420964--
