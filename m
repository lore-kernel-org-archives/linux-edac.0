Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB1726ED37
	for <linux-edac@vger.kernel.org>; Sun, 14 Jun 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781446572; cv=pass; b=JQejUrBYFBC/3oqoNUAmDqpSosGVw8mV4M+JLd0/vPx4DzSPSHfLBiRSsXj8MnA6UqTaAG8vWXW4dPeSybhf8tF19FVVcJFDjIMxaUFbKHDmLJulsALJi3W2snqO0pBpevda2OuQyrETCFjUTNkw8vrIpjQFsh4T3TIruwsIG4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781446572; c=relaxed/simple;
	bh=Hczzc9aa7+pubkqEaDjPPRveS1j1mx9LSpw4DYqmYtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSVpP+On+dHUlMOTOvj+9guVIbpLphw/mh1dDyC38XxsVrDEREMz6asYK8nwUv7ncBUSQbqUJfEzWSojm/a48lhsATHNndoG9bTmEFEVc63XwKCrF1iio+prEY4AU7UyZWlLKClH0NQD9pomomg4rZHYOLghI/il+sWv+n0LsHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lafWp2R7; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lafWp2R7"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5175d339e8bso626341cf.0
        for <linux-edac@vger.kernel.org>; Sun, 14 Jun 2026 07:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781446570; cv=none;
        d=google.com; s=arc-20240605;
        b=XnlPHgSxR7lysT8SlVUsLISJ6q5xAAl6RXuhNfyFuo/WaKQnHq8eJoNWmCuctWSS5b
         y8WVSqJ0+4fU3V+odBgnPvUtA6MTZ6JqUNFj3M2fxIT4nMDgMdWAWIonl0hC2oSGl1xq
         RfHxNCsLFFZjH1ovigceSzzjvmvBA8S3vw9IDQQwj16Rdn5DaOiZP5Q/YmeUnV84wHUI
         K5Vkwats7ab5+xUqiNK9i8MQ/VpbTJdFTnIOzCFjrHisVzuv7UseYu+gMCqpEWYZadcl
         gM+FJhfsV3A+z16EXIZlN8jmuiPYQ1X1rcQHYsX6Vvks/cAPcA4VKNN9aSm/FUFhBgn7
         IqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hczzc9aa7+pubkqEaDjPPRveS1j1mx9LSpw4DYqmYtk=;
        fh=LgHSy5E3DO5JXB/iFjrUIpMUs2elVcPNhEygka6o2aY=;
        b=cW1Nd1xuyd38WIW9G8JeS3vR+4hTDS+ulVQSXQxMsKBFivhHiTKY1EM7HDDWTIYh57
         psmBuiK7B5ATbR1hA7IVrwUFLuH+kqYl244sDrKoakM6lCNow3F5iqqss84o3bqupScw
         sDqbgDc0Sl21pNEWNn0jk399E5YYfLrgkms600vlw8POjlnSylDlw47OZyHUW/mqPTgY
         lgi+oHcxcHpK9tIJ4vIRXKva/Lk1WGgf4MdJe1S0I8cNUFe+ASH9tOQVMcl0vRzy1trd
         dVa8eUimx71i1m1dkHlu+EPDasFGzEnOwJT14oOdoYyI0/Jqutp3BG63KFWSS+a0xHho
         q2Zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781446570; x=1782051370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hczzc9aa7+pubkqEaDjPPRveS1j1mx9LSpw4DYqmYtk=;
        b=lafWp2R7QaIU05e2ABfjupO2tAhRwmbxsPLwSvDNPqV88RkUTtrJLXPkHZgA+spdlx
         f52ElrSgRt4VIGP9b7KoFSXJ6YLFBO9JXRoVyXvuv7809EY39oPIEGaCXc1qkv375INb
         fD7WRpCeL9OkCqsCF8O11+7kdSXn9nlsYKf8C+PLIGtp8vntCm+7qyShwQohk2F40d3F
         RebfkJWAt4xmNGCrOrLowJEUGKpGnTgJHMYlSlUJy4dHeSkqATL7LfUSS6tnCQWvHe7w
         FkQ2OfXspU4O+Xn9NVKl9YEqeJbhp8Hoyrqd5LNuLx5sPZUQwZ3OanUYz9zCOp0aRpnj
         p0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781446570; x=1782051370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hczzc9aa7+pubkqEaDjPPRveS1j1mx9LSpw4DYqmYtk=;
        b=cT7fSEcTRYbY4VyDXwW6Rod0ke9aThgFfBYGpybsPhizSmQN9EvpSN47VQTL3UV8QG
         93lXYppDLI7NpXfnds+poUv2FypCmuf0Vce+8kvdNICwCPuTp/kkPUPsl9OaNXahIUQk
         F9l/b90NnUFef3CPAU7aKAh9q7Jnf8cZqEU1XJyS3nXKfgyTkLJAISMB0wH+rZbSb4Vb
         2SHSxWsXaxx/hHvTlSqudQLbKKIQe8ktQCsZAFwj42ip+JoIG6/MFXTmVd9p9S133gG4
         xxLpuBGqBhaV7CAPXo+MyGglzZNp/+ollXxiDTZBmtIxS2oYZVyIZ6XPQJKEhjM74gEj
         T+6w==
X-Forwarded-Encrypted: i=1; AFNElJ96JlluzK/qFtLMopVLsUshyC0YtEOg8SSjUaQePwMzo7DEE3NcSDPd0n4OA6za2eOaJp8OCFrSae87@vger.kernel.org
X-Gm-Message-State: AOJu0YwWthqZ1HuPWDGKUA0JkcrN7huLRQEyp06mEcejlAguWinyyJ3A
	Y2XGONdJi3mzxcJ2tKHSUTdVp/VoPjB94Xx7TK3WbIZ4l3W+INYvUvjKFU9n891/Heu0peEKKsO
	W8Fhj8e+B/89K1qtIGKZ8GuiQrEmgcToSnVIdjJQB
X-Gm-Gg: Acq92OHXRy54zYSauNP2SGw22Ka5srViYRVUn/CY6kMWWdMvVztBpYdakaHlWZw20Us
	0R2b9/XcqvPP8/WIa200Nszpl8JBBW340kPRQqsWdXr5BDGrinSalJE4d29kaSufLi1WGOSUDQ8
	1caFMXaduP8/Ym65WLEUMxQSgcl1OawnpywesyN73YlfO9JbbNfYrm7BpY9pXCnXJzQqGxuU68F
	fdfwFdHxqw466rGHZsVAOZO/nGIrEd8o+0G2GdE9sYKLhgb2GArcCNO6UbAYSClS4Qwt4IKz/WB
	Ca6ygp0=
X-Received: by 2002:ac8:6109:0:b0:517:99ea:ab7f with SMTP id
 d75a77b69052e-51955ee8542mr9071471cf.25.1781446569949; Sun, 14 Jun 2026
 07:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608072607.1819873-1-pohaosu@google.com> <20260609160732.GA19967@yaz-khff2.amd.com>
In-Reply-To: <20260609160732.GA19967@yaz-khff2.amd.com>
From: Phineas Su <pohaosu@google.com>
Date: Sun, 14 Jun 2026 22:15:33 +0800
X-Gm-Features: AVVi8Cf_s84mS_R6ppMJvw5mnfi7cZuYC0W9Yum5eg2mRPIDtXUnmtzMI8LPiQg
Message-ID: <CAHGR-A+kTAcFpBE0wH5WYraUUq3=st+hXMjnF6Zcj8OGqOBJwQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/amd64: Fix incorrect Node ID mapping on CPU-only
 Zen4+ systems
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, muralidhara.mk@amd.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 12:07=E2=80=AFAM Yazen Ghannam <yazen.ghannam@amd.c=
om> wrote:
>
> On Mon, Jun 08, 2026 at 07:26:07AM +0000, Phineas Su wrote:
> > On CPU-only systems using AMD Zen4 (Genoa) and newer processors, memory
> > ECC errors can be reported with an incorrect Node ID (incremented by 1)=
.
> > This happens because these CPUs use SMCA_UMC_V2 banks, which triggers
> > the GPU node ID fixup logic in fixup_node_id().
> >
>
> Can you please share the MCA_IPID register value for these banks?
>
> The statement 'Zen4 and newer processors...use SMCA_UMC_V2 banks' isn't
> generally true.
>
> This system may be a special case. Or there may be a hardware issue. Or
> there may be a bug in the kernel enumeration code.
>
> Thanks,
> Yazen

Hi Yazen,

Thanks, you are correct. I think we misunderstood the code regarding
Zen4 CPUs generally using UMC_V2.
I was troubleshooting an internal memory error reporting issue on a
CPU-only system and initially thought this might be the problem.
However, I think making the code more robust and clearer is
worthwhile. If a CPU-only system were to report UMC_V2 (due to future
hardware iterations, firmware bugs, or enumeration anomalies), the
current logic would incorrectly apply the GPU fixup.
I will send a v2 of the patch with an updated commit message framing
this as a robustness improvement.

Thanks,
Phineas Su
