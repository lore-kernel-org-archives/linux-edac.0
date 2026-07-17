Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF9346E55
	for <linux-edac@vger.kernel.org>; Fri, 17 Jul 2026 10:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283492; cv=none; b=rsAOXqQcoHPrnkDIRlP8/0V5aWOL5AlVM7+ofJt2eWgidX9eM51gzJNxDqsidG+1nwj3MUTsXTO8h9qrVDK/Cm7Bvz5OAKiteRt6cmdbbVYL27RkviHnOiC3C0772Gfb7bErDgmIfwp175f2vqGo+sxRH10N34WoWMS+crDmTTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283492; c=relaxed/simple;
	bh=BzLaUkJpUv4ee9IISBI1cUQtlYeMRmZo3IxSHTprMxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E81bopyihYoX/PDC0u0XSqffuZK4dysnKu5P3yufBIiCffrcHMjb0EvsirCLgrpZLFzHpw5bvK9Ak8l50vc0/VcPyAxtPdOWikzcE2T314Qq4GqRDaK8c5z4rZa3uYGafjvMQVwVLpdMTh7xYysmNWiGeBllCiK00kUW5jJV08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EjC0NrhA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EjC0NrhA"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so11126931a12.2
        for <linux-edac@vger.kernel.org>; Fri, 17 Jul 2026 03:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784283489; x=1784888289; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BzLaUkJpUv4ee9IISBI1cUQtlYeMRmZo3IxSHTprMxQ=;
        b=EjC0NrhAUwrmLCqLCR83rPTrM1Uv2g3gXs4sxtYfISiWEtaYjRSVhECcgX1z2ib9MK
         jtuQ8t7bstE9SsCSnbKvNPU8TPO9vZqfgKDhOEJ78LI9ZoJ0oNWnTpdfRaNBbn3HB5W9
         /BqhsozrSd4PBx5cnY0QqNaBRzv31t5Z+IFyBhhCbD0w3raMFgMzSYbyX7PJc4e+VEt9
         RDuf8llAOKzgEBT87dI/VDwfNIpzmvbCnC5jZ9NBNo6PVTc80Sq4akp7mxSjDcqVMKrx
         4qSR9+O6dzZgN1QqpW3AicKFjieY0xR83oVdOBzSJJ9Br007HQoTUpT3+YLxY7lRYIpI
         n89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283489; x=1784888289;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzLaUkJpUv4ee9IISBI1cUQtlYeMRmZo3IxSHTprMxQ=;
        b=nTfI9krPDLRRTpob9pNxCUy3oH9I/YIxCJEVIhO1TiC4fqL/Zl0uWIW/Ufa3L2bPJs
         G25vAModB82Nxp14mXfrI6HPFIxJMm5zmMsQkCYRkAfTxlVfXBMGzTPddBpxyOZR8jl/
         2P9y1OakQlxYsOYkPBJ4QRTvs2Kdob25yay8FySddfRmVdYTdoSNwCoktJEJC74zXVzE
         BiOTYlGzOADSMUxxre8GQbGxDZAe1G0pvJtB2eM3MeAowLFT3we7IbywCL7OvlzSw6U/
         P16MEbL6Ek18NhmqmZdOpgfIReQkvCWCw5KpdnB+oJAGA18xPPbxLMWrwdD+XBFKIOEP
         HR+g==
X-Forwarded-Encrypted: i=1; AHgh+RqmkS/JC9g5M2+JVbWbZXnepPX6b2d4yLgCCNCuxj7w8U7fhTUMxhZPjZBeTpwZicBLeCtH4w+17OZ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzF21SSRkW2n7l0cSZwZKTm2cHRFji29USN+ru0/0rTCogmhc69
	K6iVP2t7HsW1b6aNHMvC4F71kDTjefApDP03WPAcRU1TWU89xGxOQlPVGsAEaDFyszY=
X-Gm-Gg: AfdE7ckHsSna/3oFiy4H/Y0qjVRuVIDnJYTRIMRbGWljP/sfg5nPDhweSagybpjTO7b
	mEi7iRhM80EWMTb2ycs3mlqfDREZsWgWhkvbkWKegOBmvKAna8/RRKzllmxUX87wKY56EQsWzf3
	0pXEX17SESS75rt+tGcku3KenS94GZnS3XmVrM9DsNikSJG3G47C7cUEAxHyHSZ+2FqmShxDFqE
	dNQF3LbAAVkhWje5Vf7EfuE7Hv4xyWqdvKSLj8h/fipIRgynolaTXg+aO7Ztfo8CoombhPQICy0
	uwlPWw8H6zU6WPUcNQQCmfRV72+o2Mch+ldTYZv5eF1FCizKWkaseV1VVchA5PHkq3rC8upwGUa
	QryxQ0LIS59/qsDU4SGX3zVYgs8qHTvVJXuUl58d0FHr8h+pm8+ffUToxqfq6HR0k716si3tYHe
	LopNRHtLPRoegE2kIO4yoER8/elfKSuamuk3I9Ubv75G4AG3rcPT8WHz6ABi3n+R187jLf0AJrv
	EPo5ACxuvpWETuW0uGOJsJW9wGMhMeY
X-Received: by 2002:a05:6402:28cc:b0:697:f61b:24ca with SMTP id 4fb4d7f45d1cf-69e652e0a17mr692256a12.27.1784283488904;
        Fri, 17 Jul 2026 03:18:08 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6eb22107sm464569a12.0.2026.07.17.03.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 03:18:08 -0700 (PDT)
Message-ID: <b0705c60-1eb7-440d-91fe-ad329bbe407e@suse.com>
Date: Fri, 17 Jul 2026 12:18:07 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mce: Fix build warning after MSR-interface switch
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kernel test robot <lkp@intel.com>
References: <20260629060526.3638272-9-jgross@suse.com>
 <20260703105555.1758819-1-jgross@suse.com> <aln1vdH7dPKmh0kl@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <aln1vdH7dPKmh0kl@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6R3M7aUG1LUYfuLO7RAHOvpe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6R3M7aUG1LUYfuLO7RAHOvpe
Content-Type: multipart/mixed; boundary="------------Wyf7k00e5TCNCXGWBbXlxCsR";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kernel test robot <lkp@intel.com>
Message-ID: <b0705c60-1eb7-440d-91fe-ad329bbe407e@suse.com>
Subject: Re: [PATCH] x86/mce: Fix build warning after MSR-interface switch
References: <20260629060526.3638272-9-jgross@suse.com>
 <20260703105555.1758819-1-jgross@suse.com> <aln1vdH7dPKmh0kl@gmail.com>
In-Reply-To: <aln1vdH7dPKmh0kl@gmail.com>

--------------Wyf7k00e5TCNCXGWBbXlxCsR
Content-Type: multipart/mixed; boundary="------------zghHWDVgElYlbXuBJcCbfjLE"

--------------zghHWDVgElYlbXuBJcCbfjLE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjYgMTE6MjgsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IFRoZSByZWNlbnQgc3dp
dGNoIHRvIDY0LWJpdCBNU1IgaW50ZXJmYWNlcyBpbnRyb2R1Y2VkIGEgYnVpbGQgd2Fybmlu
Zy4NCj4+DQo+PiBGaXggaXQuDQo+Pg0KPj4gRml4ZXM6IGNmZjIxOTM2OGJkMCAoIng4Ni9t
Y2U6IFN0b3AgdXNpbmcgMzItYml0IE1TUiBpbnRlcmZhY2VzIikNCj4+IFJlcG9ydGVkLWJ5
OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDcwMzE3MjYuWk93dTRzbnUt
bGtwQGludGVsLmNvbS8NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gU2FpZCBwYXRjaCBpcyBpbiB0aXAgb25seSByaWdo
dCBub3csIHNvIHRoaXMgcGF0Y2ggY291bGQgZWl0aGVyIGJlIGFkZGVkDQo+PiBvbiB0b3Ag
b3IgYmUgZm9sZGVkIGludG8gdGhlIG9yaWdpbmFsIHBhdGNoLg0KPj4gLS0tDQo+PiAgIGFy
Y2gveDg2L2tlcm5lbC9jcHUvbWNlL3A1LmMgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9wNS5jIGIvYXJjaC94ODYva2VybmVsL2NwdS9tY2Uv
cDUuYw0KPj4gaW5kZXggZWI5OWYzODRkNzQ3Li4zYzJiNmNjOTE4YjEgMTAwNjQ0DQo+PiAt
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9wNS5jDQo+PiArKysgYi9hcmNoL3g4Ni9r
ZXJuZWwvY3B1L21jZS9wNS5jDQo+PiBAQCAtNDQsNyArNDQsNyBAQCBub2luc3RyIHZvaWQg
cGVudGl1bV9tYWNoaW5lX2NoZWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQ0KPj4gICAvKiBT
ZXQgdXAgbWFjaGluZSBjaGVjayByZXBvcnRpbmcgZm9yIHByb2Nlc3NvcnMgd2l0aCBJbnRl
bCBzdHlsZSBNQ0U6ICovDQo+PiAgIHZvaWQgaW50ZWxfcDVfbWNoZWNrX2luaXQoc3RydWN0
IGNwdWluZm9feDg2ICpjKQ0KPj4gICB7DQo+PiAtCXU2NCBxOw0KPj4gKwl1NjQgX19tYXli
ZV91bnVzZWQgcTsNCj4gDQo+IENvdWxkIHdlIGp1c3QgZml4IHRoZSBBUEkgdG8gYWx3YXlz
IGFzc2lnbiAncScsIGluc3RlYWQgb2YgdGhpcw0KPiB1Z2x5ICYgdmFndWUgYW5ub3RhdGlv
bj8NCg0KcSBpcyBhbHdheXMgYXNzaWduZWQuIEkgYmVsaWV2ZSB0aGUgcHJvYmxlbSBpcyB0
aGF0IGl0IGlzIG5ldmVyIHJlYWQuDQoNCk9UT0ggdGhpcyBwcm9ibGVtIGNhbiBiZSBmaXhl
ZCBlYXNpbHkgYWZ0ZXIgcGF0Y2ggMzEgb2YgdGhpcyBzZXJpZXMuIEkgY2FuIHNlbmQNCmEg
VjIgb2YgcGF0Y2ggMzIgdG8ganVzdCBkcm9wIHRoZSBhc3NpZ25tZW50IHRvIHEuIFRoaXMg
d2lsbCBiZSBwb3NzaWJsZSBhcw0KcmRtc3JxKCkgd2lsbCBiZSBhIGZ1bmN0aW9uIHRoZW4s
IGFuZCBub3QgYSBtYWNybyByZXF1aXJpbmcgYSB2YXJpYWJsZSBiZWluZw0KcGFzc2VkIGFz
IHBhcmFtZXRlci4NCg0KDQpKdWVyZ2VuDQo=
--------------zghHWDVgElYlbXuBJcCbfjLE
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------zghHWDVgElYlbXuBJcCbfjLE--

--------------Wyf7k00e5TCNCXGWBbXlxCsR--

--------------6R3M7aUG1LUYfuLO7RAHOvpe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpaAWAFAwAAAAAACgkQsN6d1ii/Ey+K
VAf9EW/x7HWcJJ8AuZTDCtOUE7FnQpd28diNorXdY73CbMtyhjU4luV5b9+Va8t90kaJcmqOYZMT
PJw2AEBWnhdCgsfTClTLgAe9WWZkxrD0oRHaTtAI/QZ9P4IxLmqY0cNxft2vIcispuFcQJEp0ngQ
6EoJSLVxlWHxpfKENmTR4By7tZ3hhcTLWcN9x/Cw7HpWg2XkZWYDTAnBdtb92t/MqCXDJCQf/TBk
VQhuvexwmz/NsUpWI0M6XiKeoGAUrE9NifgbfkI9mZl1teTaU+uUc66NjJ2a772WPK+xbWU1PrIB
/TxEF2+ja9B4fuU73zNOvSQjOdZyZQp4ReSkg16mmQ==
=n4Un
-----END PGP SIGNATURE-----

--------------6R3M7aUG1LUYfuLO7RAHOvpe--
