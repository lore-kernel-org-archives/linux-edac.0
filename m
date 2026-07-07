Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88DC17D6;
	Tue,  7 Jul 2026 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783384354; cv=none; b=pz/AolgWkIiALoYoNFt5tT/aerPiZEr1EaIt/XspseExOq2BsgTd9okcL2eQDYuUu1gUHpKHxhNxz/VR+kEBbha8X7/CsMPS5ktysQSivpd+ml3OGKQQa9gu+QhnvAtl2pyd+FeEFiKnUwceRTFjBOGlG2Cf0utx6XWdblfJ9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783384354; c=relaxed/simple;
	bh=II01kntZkcUuvfnO++is88amhd86w/4kP0w8F1W7k+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN+RQhQaX4+Jf9FELJfTNfAu71A9v/HcMVRrjG3iKm0cFT+kwmV/m4InsaLp6+gdMOP3NzxNOYGIGfJM7CTmrSeukxXXWZmj7xa0NE9i0NFaBU8u3m/pH3gs0Ig1qM7j+lXcVs4tYhHC8zGm7RSKYAOqNomu4n/eUs1Nxy3BRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RAPM0XDE reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RAPM0XDE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3C44240E016E;
	Tue,  7 Jul 2026 00:32:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hBXYiimq1Qhj; Tue,  7 Jul 2026 00:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783384332; bh=FWTHKIDtJZAJLaItmK2CoGPFO9fOuGKuSe1Xf/2evM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAPM0XDElt/lBDr3r+pd4J+Beov28vO9bCdnZHf0Q0OrOIgHZ1dvCsEVzx3RHmk+P
	 qfoGwiYfjvUcve/t+nYkK7T4VcuHlBzX/U8UytdFhvX11VGwyDnCPOK2YNHmWG61kW
	 RKLZ6i7wOw3pb4NWRTTZzdLqcIz+doi+xifdyRSHS37vA+lUAIcHZaFszmBtC1QI4+
	 wdKGZVwg+ifS5n5UVwrYWeDUmtU2QscXwF2fvkH7GgPZNFRgHXJB9yvHIgCzZ4dM5u
	 yKEElwNKz912+Bg1WSJYob+cOVqTP4/XbWs82u0aNaM/KR5yaZcUo4JarY5hrH0d6O
	 jKOSy7Zs5AieMOpVDQeyok8dUvGaaPH59sN/NJ3qNifqRUiZrI4F7OYZkQmJhHFVbE
	 IIBfEFE/svSwISlKsFzCRj1zd3jAgQAxU9+ER+v03WTjkwS52G2kqNGo+2gcNv/y8G
	 TwN1Fd+xR5E7PdrmKMcxK3UdiIAcuitt2397ZlR1nx8Ta99JebC4Ff1mHpU+Ow1uEw
	 f5S3ldeaj39LPMs2rrEuFRs8qEEHWsI1Q0o67JR26kIKMudes/I9pA7fdUAqaEaED9
	 b54hqfIVzhYQhEavZgaHhxrXmKo66Vr24caH+zKogA29S+ba1txIo5jBHTXkNkTQTA
	 HgX6ULpT5SYK9U14v5VMzA28=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D682F40E00DC;
	Tue,  7 Jul 2026 00:32:07 +0000 (UTC)
Date: Mon, 6 Jul 2026 17:32:04 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v7 2/3] RAS/AMD/ATL: Translate UMC normalized address to
 DRAM address using PRM
Message-ID: <20260707003204.GAakxJBJWtxD2fM6Th@fat_crate.local>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
 <20260630210640.680758-3-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630210640.680758-3-yazen.ghannam@amd.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 05:06:39PM -0400, Yazen Ghannam wrote:
> From: Avadhut Naik <avadhut.naik@amd.com>
>=20
> Modern AMD SOCs provide UEFI PRM module that implements various address
> translation PRM handlers.[1] These handlers can be invoked by the OS or
> hypervisor at runtime to perform address translations.
>=20
> On AMD's Zen-based SOCs, Unified Memory Controller (UMC) relative
> "normalized" address is reported through MCA_ADDR of UMC SMCA bank type
> on occurrence of a DRAM ECC error. This address must be converted into
> system physical address and DRAM address to export additional informati=
on
> about the error.
>=20
> Add support to convert normalized address into DRAM address through the
> appropriate PRM handler. Instead of logging the translated DRAM address
> locally, export the translating function when the Address Translation
> library is initialized. Modules like amd64_edac can then invoke the PRM
> handler to add the DRAM address to their error records. Additionally, i=
t
> can also be exported through the RAS tracepont.

Use this commit message for this patch:

    Modern AMD SOCs provide an UEFI PRM module that implements various ad=
dress
    translation PRM handlers=C2=B9. These handlers can be invoked by the =
OS or
    the hypervisor at runtime to perform address translations.
   =20
    On AMD's Zen-based SOCs, a Unified Memory Controller (UMC) relative
    "normalized" address is reported through the MCA_ADDR of UMC SMCA ban=
ks
    on occurrence of a DRAM ECC error. This address must be converted int=
o
    a system physical address and DRAM address in order to decode additio=
nal
    information about the error.
   =20
    Add support to convert a normalized address into a DRAM address using
    such PRM handler.
   =20
    =C2=B9https://bugzilla.kernel.org/show_bug.cgi?id=3D220577

or run it through AI because I'm tired of adding pronouns left and right =
and
removing text which regurgitates the code in the patch.

> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220577
>=20
> [Yazen: Remove 'handler available' check]
>=20
> Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/ras/amd/atl/core.c     |  6 ++++++
>  drivers/ras/amd/atl/internal.h | 11 ++++++++++-
>  drivers/ras/amd/atl/prm.c      | 32 ++++++++++++++++++++++++++++----
>  drivers/ras/amd/atl/system.c   |  3 +++
>  drivers/ras/amd/atl/umc.c      |  9 +++++++++
>  include/linux/ras.h            | 14 ++++++++++++++
>  6 files changed, 70 insertions(+), 5 deletions(-)

...

> +static inline int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
> +					    unsigned long addr, struct atl_dram_addr *dram_addr)

... int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id, unsigned lon=
g addr,
				  struct atl_dram_addr *dram_addr)

> +{
> +	return -ENODEV;
> +}
> +#endif
>  /*
>   * Make a gap in @data that is @num_bits long starting at @bit_num.
>   * e.g. data		=3D 11111111'b
> diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
> index 0f9bfa96e16a..c69158f66639 100644
> --- a/drivers/ras/amd/atl/prm.c
> +++ b/drivers/ras/amd/atl/prm.c
> @@ -19,10 +19,11 @@
>  #include <linux/prmt.h>
> =20
>  /*
> - * PRM parameter buffer - normalized to system physical address, as de=
scribed
> - * in the "PRM Parameter Buffer" section of the AMD ACPI Porting Guide=
.
> + * PRM parameter buffer - normalized to system physical address and no=
rmalized
> + * to DRAM address, as described in the "PRM Parameter Buffer" section=
 of the
> + * AMD ACPI Porting Guide.
>   */
> -struct norm_to_sys_param_buf {
> +struct prm_parameter_buffer {

struct param_buf {

This is not BIOS code.

>  	u64 norm_addr;
>  	u8 socket;
>  	u64 bank_id;
> @@ -31,7 +32,7 @@ struct norm_to_sys_param_buf {
> =20
>  unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsi=
gned long addr)
>  {
> -	struct norm_to_sys_param_buf p_buf;
> +	struct prm_parameter_buffer p_buf;
>  	unsigned long ret_addr;
>  	int ret;
> =20
> @@ -51,3 +52,26 @@ unsigned long prm_umc_norm_to_sys_addr(u8 socket_id,=
 u64 bank_id, unsigned long
> =20
>  	return ret;
>  }
> +
> +int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id,
> +			      unsigned long addr, struct atl_dram_addr *dram_addr)

int prm_umc_norm_to_dram_addr(u8 socket_id, u64 bank_id, unsigned long ad=
dr,
			      struct atl_dram_addr *dram_addr)

> +{
> +	struct prm_parameter_buffer p_buf;
> +	int ret;
> +
> +	p_buf.norm_addr	=3D addr;
> +	p_buf.socket	=3D socket_id;
> +	p_buf.bank_id	=3D bank_id;
> +	p_buf.out_buf	=3D dram_addr;
> +
> +	ret =3D acpi_call_prm_handler(norm_to_dram_guid, &p_buf);
> +	if (!ret)
> +		return ret;
> +
> +	if (ret =3D=3D -ENODEV)
> +		pr_debug("PRM module/handler not available.\n");
> +	else
> +		pr_notice_once("PRM DRAM Address Translation failed.\n");

Dump ret here.

Also, this function is an almost identical copy to prm_umc_norm_to_sys_ad=
dr().
Merge the two pls.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
