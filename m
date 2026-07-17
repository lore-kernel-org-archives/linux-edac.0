Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A493E5577
	for <linux-edac@vger.kernel.org>; Fri, 17 Jul 2026 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286232; cv=none; b=Qsv7rG4pfa+F3kbQ8FkCft/CsnQmkpPTltMo+HK/RHX22uMGgWeBcuy12E4nq47aqGVOejK5r+bMGIwwew2/SL1dWZq1o/dpwdiY9YSPhMdjR9YTMV9xZn/qAILQXZSj8s9Wrbv4+43RqB73P7iLSK1kmjK6A9/FODM3G370Fzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286232; c=relaxed/simple;
	bh=s4FFN93vUsxMFbb1XoSsqsFyH4QJnXBz8jwb7/hbrfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dBpF1ZrKiwAQb7e0TjlwKOlmIN4J6YV3PwRng73hufPoQdf3VQgxvSp8AwnCeEpASfcbR9V2y7lhPb85yncKO0jKVdamAg9ly7hCuCarh4HgxvqG+Tqye+PantydGlqC/hL3sALBB28xoeaubQtAdNcULqDitIWGvCLZVLQ2frI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PCj27xfQ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PCj27xfQ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso2069056a12.0
        for <linux-edac@vger.kernel.org>; Fri, 17 Jul 2026 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784286227; x=1784891027; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s4FFN93vUsxMFbb1XoSsqsFyH4QJnXBz8jwb7/hbrfg=;
        b=PCj27xfQ16AKujB9J0n/nPxIfNA8FVtjTUQNuqfwRZ7bTEXLiHwZDjBNCXZ79K5kki
         rixuxgZTzVDKpku/0wgwdR+wZX6JtIpeUuzuWryoP3KHz/wC98SWDsSQuoLAKDbFUUDG
         jSjlTGnyMBIKOCTkd4a1CbrIcEq9zf2w0O9AORhkLYH8bNgvqNI0P5nMk8gzYVb1yrjk
         bbBr3i0VCytMvhhzXgFDY0lcJHMD1NVAQHTuqkDSgoP30ym+6px6mVPxyvmhfKAe7Uzv
         SICkIQW3eBPSWtgCmXFoxmlUIXLAQ3wc8XkRaGMOweFppgO358lH6o7EmKlCtagbNVO5
         8HPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784286227; x=1784891027;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4FFN93vUsxMFbb1XoSsqsFyH4QJnXBz8jwb7/hbrfg=;
        b=TqAy+uVgiBheqWlJhNL80o2D4U1g2Hse/TzbnoYC4ekG862VTJ3K/Lo02xoQU/ktsh
         v0Qla11x186MaFDn0eoAoWrqA0WxA2XuA5cIkqCJ+CgQQkdAHCadHsJDuv1VDjQQCXd0
         f0GdglgmB2i2JRX9GuxIWCxduZsTQLefejthG13dvnGlYY9HzX8twlw7ptbG4J0fxBBu
         E3KJ+gcw5rLe2Q1IcCwVohze/694COSJpuyWtOLRmST5HcKRx5BpBEHPSy4JillQg7mw
         uHDoJi3XtY2Tebtelk9feYHCW3Wa3IfeyzDCTBPKm11t2dlnUNxnDn8OtopgqFsWQ2Zz
         c0TA==
X-Forwarded-Encrypted: i=1; AHgh+RpAZr1+bC+YyQ2MRLIDLLZEoJMjYU5viSzHrn+9+wvOvK7Id1joXkOmHlLRK4pdCzWn/rWBuDiNPeQF@vger.kernel.org
X-Gm-Message-State: AOJu0YxFcaI/JKM5Cyr3s7wHxc/J1qTTKM2Ca1EhdVyHV0GVrF7eVa44
	GbTcZiC6u8gQ6bi4kdlSqEPI6FMrF5KdHU9q7NxNH0L//KxXJftcxuX63NVFPZNe7IM=
X-Gm-Gg: AfdE7ckI49zR24bTYbZ5gd1s/DXec46o25WA9ezptVZHhgoqz8/04XmEaeATEDj2dk1
	q8pt/RP8Zd9bnndiIcynwxBOmWsJuZts+Tg7Gx64A58M0xHmAHBn6sEBkNQl4QrZrZxAFXzBSxt
	H3OiTcxVu7uDfq5wMgnVHXZQ++k2VrBXTdaySa23gBvaMu6EbErEPnslXklrdyo1jbQffd6cvgZ
	F9fPAcaw7OJwg2k5c9rQpsqp/CZelmG++dHARZc1Ucb0dsZ0F36WPo79xvd3IC4h70X07RwfE4S
	Fm4s1FlARQWIl/TA5L1HG1jhUAjRK/cTL0kMgWkRmjasYK8e3bonYSyYi7dGxx7MqlaXlLTZM6X
	Pdd+bMJDwtPw5WDeQLoCAct5RohPJc/EDorR63FI0umSsqIxqcb4B7DoMoK2y3oPcludZMFUpHl
	H204tV5bFpvqSub1XSZ/3zPntoHUjxufiIC5BVW0Iwz6t160DwpbBGbU3UpueCmvJxvaHEJnwIb
	4/q+VykTo+gO7c4GmKG3aqIGO1MztUCWHTCaO05XlA=
X-Received: by 2002:a17:907:d50d:b0:c16:242a:4733 with SMTP id a640c23a62f3a-c16b40f860bmr108524366b.18.1784286226769;
        Fri, 17 Jul 2026 04:03:46 -0700 (PDT)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50becsm56202366b.52.2026.07.17.04.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 04:03:46 -0700 (PDT)
Message-ID: <ee0f4079-1394-4eaf-adb0-8ec8210cc66b@suse.com>
Date: Fri, 17 Jul 2026 13:03:45 +0200
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
 <b0705c60-1eb7-440d-91fe-ad329bbe407e@suse.com> <aloC_RPlSLcRz_36@gmail.com>
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
In-Reply-To: <aloC_RPlSLcRz_36@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0dvf13arCEbbYDgYannV36fy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0dvf13arCEbbYDgYannV36fy
Content-Type: multipart/mixed; boundary="------------oUhaYr00Y3RBfz8gAS04RUH1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 kernel test robot <lkp@intel.com>
Message-ID: <ee0f4079-1394-4eaf-adb0-8ec8210cc66b@suse.com>
Subject: Re: [PATCH] x86/mce: Fix build warning after MSR-interface switch
References: <20260629060526.3638272-9-jgross@suse.com>
 <20260703105555.1758819-1-jgross@suse.com> <aln1vdH7dPKmh0kl@gmail.com>
 <b0705c60-1eb7-440d-91fe-ad329bbe407e@suse.com> <aloC_RPlSLcRz_36@gmail.com>
In-Reply-To: <aloC_RPlSLcRz_36@gmail.com>

--------------oUhaYr00Y3RBfz8gAS04RUH1
Content-Type: multipart/mixed; boundary="------------4x1UzRBrgkpL6v96WXD1GjN7"

--------------4x1UzRBrgkpL6v96WXD1GjN7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcuMDcuMjYgMTI6MjUsIEluZ28gTW9sbmFyIHdyb3RlOg0KPiANCj4gKiBKw7xyZ2Vu
IEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4+IE9uIDE3LjA3LjI2IDEx
OjI4LCBJbmdvIE1vbG5hciB3cm90ZToNCj4+Pg0KPj4+ICogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPiB3cm90ZToNCj4+Pg0KPj4+PiBUaGUgcmVjZW50IHN3aXRjaCB0byA2
NC1iaXQgTVNSIGludGVyZmFjZXMgaW50cm9kdWNlZCBhIGJ1aWxkIHdhcm5pbmcuDQo+Pj4+
DQo+Pj4+IEZpeCBpdC4NCj4+Pj4NCj4+Pj4gRml4ZXM6IGNmZjIxOTM2OGJkMCAoIng4Ni9t
Y2U6IFN0b3AgdXNpbmcgMzItYml0IE1TUiBpbnRlcmZhY2VzIikNCj4+Pj4gUmVwb3J0ZWQt
Ynk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4+PiBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNjA3MDMxNzI2LlpPd3U0
c251LWxrcEBpbnRlbC5jb20vDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFNhaWQgcGF0Y2ggaXMgaW4gdGlw
IG9ubHkgcmlnaHQgbm93LCBzbyB0aGlzIHBhdGNoIGNvdWxkIGVpdGhlciBiZSBhZGRlZA0K
Pj4+PiBvbiB0b3Agb3IgYmUgZm9sZGVkIGludG8gdGhlIG9yaWdpbmFsIHBhdGNoLg0KPj4+
PiAtLS0NCj4+Pj4gICAgYXJjaC94ODYva2VybmVsL2NwdS9tY2UvcDUuYyB8IDIgKy0NCj4+
Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9wNS5jIGIv
YXJjaC94ODYva2VybmVsL2NwdS9tY2UvcDUuYw0KPj4+PiBpbmRleCBlYjk5ZjM4NGQ3NDcu
LjNjMmI2Y2M5MThiMSAxMDA2NDQNCj4+Pj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2NwdS9t
Y2UvcDUuYw0KPj4+PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvY3B1L21jZS9wNS5jDQo+Pj4+
IEBAIC00NCw3ICs0NCw3IEBAIG5vaW5zdHIgdm9pZCBwZW50aXVtX21hY2hpbmVfY2hlY2so
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+Pj4+ICAgIC8qIFNldCB1cCBtYWNoaW5lIGNoZWNr
IHJlcG9ydGluZyBmb3IgcHJvY2Vzc29ycyB3aXRoIEludGVsIHN0eWxlIE1DRTogKi8NCj4+
Pj4gICAgdm9pZCBpbnRlbF9wNV9tY2hlY2tfaW5pdChzdHJ1Y3QgY3B1aW5mb194ODYgKmMp
DQo+Pj4+ICAgIHsNCj4+Pj4gLQl1NjQgcTsNCj4+Pj4gKwl1NjQgX19tYXliZV91bnVzZWQg
cTsNCj4+Pg0KPj4+IENvdWxkIHdlIGp1c3QgZml4IHRoZSBBUEkgdG8gYWx3YXlzIGFzc2ln
biAncScsIGluc3RlYWQgb2YgdGhpcw0KPj4+IHVnbHkgJiB2YWd1ZSBhbm5vdGF0aW9uPw0K
Pj4NCj4+IHEgaXMgYWx3YXlzIGFzc2lnbmVkLiBJIGJlbGlldmUgdGhlIHByb2JsZW0gaXMg
dGhhdCBpdCBpcyBuZXZlciByZWFkLg0KPiANCj4gSW5kZWVkLg0KPiANCj4+IE9UT0ggdGhp
cyBwcm9ibGVtIGNhbiBiZSBmaXhlZCBlYXNpbHkgYWZ0ZXIgcGF0Y2ggMzEgb2YgdGhpcyBz
ZXJpZXMuIEkgY2FuIHNlbmQNCj4+IGEgVjIgb2YgcGF0Y2ggMzIgdG8ganVzdCBkcm9wIHRo
ZSBhc3NpZ25tZW50IHRvIHEuIFRoaXMgd2lsbCBiZSBwb3NzaWJsZSBhcw0KPj4gcmRtc3Jx
KCkgd2lsbCBiZSBhIGZ1bmN0aW9uIHRoZW4sIGFuZCBub3QgYSBtYWNybyByZXF1aXJpbmcg
YSB2YXJpYWJsZSBiZWluZw0KPj4gcGFzc2VkIGFzIHBhcmFtZXRlci4NCj4gDQo+IFRoYXQn
cyBmaW5lIHdpdGggbWUsIGFzIGxvbmcgYXMgdGhlIGJ1aWxkIGZhaWx1cmUgaXMgb25seSBm
b3IgdGhpcw0KPiBpMzg2IHJhbmRjb25maWcuIElmIGEgbmV3IHdhcm5pbmcgaXMgZ2VuZXJh
dGVkIGZvciBhbnkgb2YgdGhlDQo+IG1vcmUgcHJvbWluZW50IGNvbmZpZ3Mgd2UnbGwgaGF2
ZSB0byBtYWtlIGl0IGdvIGF3YXkgZm9yDQo+IHRoZSBpbnRlcmltIHRyZWUuIChCZWNhdXNl
IGl0J3Mgc3RpbGwgbm90IDEwMCUgY2xlYXIgd2hldGhlcg0KPiB3ZSdsbCBiZSBhYmxlIHRv
IGRvIHBhdGNoIDMxIGluIHRoaXMgY3ljbGUuKQ0KDQpZb3UgaGF2ZSBteSBwYXRjaCBmb3Ig
dGhhdCBjYXNlLiA6LSkNCg0KDQpKdWVyZ2VuDQo=
--------------4x1UzRBrgkpL6v96WXD1GjN7
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------4x1UzRBrgkpL6v96WXD1GjN7--

--------------oUhaYr00Y3RBfz8gAS04RUH1--

--------------0dvf13arCEbbYDgYannV36fy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmpaDBEFAwAAAAAACgkQsN6d1ii/Ey+N
2gf/bOqgeaV9w8rv73I0yHvTVKveb9usbb/DCes1kwJ/O3CvQ1DKwBh5XzlfoH4Q5NjUsHpfzDna
wibWJDGgP08mgiy1lzhDYXbS/DARf7Y+rQiSQqjvBCIXL2sph3C81wRN6+D4YzjKH2KoLUFEBdDk
A5k5YX/pDi91nedLIi4c18OwTRfj67QsXzoz9YhnK3Y+c28BkWZFWcvETNWU+gqPugjvx/ZMh2WZ
L2poibElsJqaN3Kh48hVTvTeLeXQNnJ78/1EBnkMqXUpPw0ufl9KPTfv+EEhFU5xlmi34RZnIEOZ
rf+7Mj0wLpCsLzvJBZMNToKcGx/pkMzFwo7tIF6y2A==
=igVC
-----END PGP SIGNATURE-----

--------------0dvf13arCEbbYDgYannV36fy--
