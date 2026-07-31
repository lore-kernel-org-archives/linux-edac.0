Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8E22AD2C
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 00:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785458690; cv=pass; b=m9+NQf5sKFuuCukzjJkVgyEhYnsPKEeTpHgU3Kj6u3bIFfUKBAzq+lm3atesD0ifDQe819pApkr/985qxxp9i+dBT8f2As1ZP/XRtcDBWskuKFaCePQhMwbRxdnrO87pCRqobOOSS1IdxArjWt32wPVdz9h9xr/VFNlaQ1FTF8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785458690; c=relaxed/simple;
	bh=RmSPxtW+2H8QmEj+sRUMEzP5pT+izkC/Fv7T35kBDf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhrxUUche2dzM2q5Bt2rBdd8O2vTaM89uwf0s2orIly6faf2MeqG616IzTkI/Cp+cs9cu9fIitgbrHurD1EzPu7ljTlxW5FMpBhS7IsMMv2/BZE3B8/ac3RiKyrx6+6+cmYjWhohJaEisW6AF6JUzBNYB6lZ8LvnfFCjz8rmK/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fq8l82dh; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fq8l82dh"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a051904222so620529a12.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 17:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785458686; cv=none;
        d=google.com; s=arc-20260327;
        b=OSjcOmMmic/56nwxOWR3TdITi8sFHoslnPzUpkZuiRm2iXt/UD7ul/9uQlpL+K7aIq
         aa2U3jlmwP/HKzqHpNILAVtn2R7QsmhWKnn0XTVJlVKzVKj2DFajSUUdfYUS8BQBhlKI
         XE7renfCPDq2hEnrfbOy6IgeYaKb8vWIKiu5iaVPJvAsSorLDStDTMxsvH2gmxBdIIfd
         qFE3no55nsJ06cF3uGk8btmiWsmilXlbUD4R9idTvkoIIIIToSKyb/Ntp9RxtB/F9h8h
         LIUS0ZpwXoczpwqf3I04k6a7A/1FQLiEoKMDACdLwi3ryN9BoG3qjhMR+ltHdzOtl9p7
         RUSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hg0QOEkG4vYtInjORlmzxyaD1qxCibtY4OrHLFhf3HE=;
        fh=YXv/5GxknVkmjBUuOhIDHcLFJzrB33uAa0EMXY3vUGQ=;
        b=L5EmjKDHflqrGzpm9ivTulWZuc630NHDPh8p4Ii7dL6H3hCEFUfl7l/y5FS3XPPBZW
         sk3OOOIxMbW/q8Ayo9sBggFrkcVAggsAKSb0dEoC4hxza/I6VAcoq/y6vdTx4sXFmt+0
         VSMX/PnL5rXHuQpiaXOM3SCFzKvfUKDcaOUmJEbxjC9YFqIHzqxXnPojI+iBizQ3fdpX
         50VMASHiuPKJiTYoknMaytYX15fyIyxtxAavoBTlcPCVQTpdOxE/D47jzRpGzjR16DDY
         UvJ1Gp570NxIfJTuDLNz3DLf+YBKAjJYua3uoXq8F4do5DB1ESOc2xekdzFo5SAz67/f
         3H/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785458686; x=1786063486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hg0QOEkG4vYtInjORlmzxyaD1qxCibtY4OrHLFhf3HE=;
        b=Fq8l82dhic8nHojNH4T/9LC9bOx8xDviGd3ccqHBd8l6qCJu8oVayi085F/AnVr+2W
         TANLA6zYLUVdwUeSGAGOxA6eoK59+5/+hnXNtCPBpsjyBa3d150E2MtEUd/H+f2cmOuA
         KnWae428d4s2X9XtuguFc7qzNHBmajj30x+DW8WIDKQyIWk9mrCM/lU/6ivYGB2VDJa8
         COFI8dqUiCYWOEKOgwINzDrBC7nMcrY89gCK8KxYD7O34S7DrQJA9YB+cr7KxPJl6gBB
         42aDGeGRZutVS7gywBeB6OiecxaP3DH85oa6xmgc7w1nC5VLEYeRp5ISVKB6TiwlYABT
         WjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785458686; x=1786063486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hg0QOEkG4vYtInjORlmzxyaD1qxCibtY4OrHLFhf3HE=;
        b=knNxnvP/qDBSiK6zjSXDN9nou0CPbWsAl0OXL0hAQeHyJJTAKkztE/DPVpQU89/9l5
         0EpYS8PbykAZXdEP9c+h04EF6gDvQuY4z7hyBJnzRDSBU08jUaU72+9jpkV6q8qlsAhV
         qDZmYppGvO0557yqNmEZ/4j8gLSsb3DxzxldCOXEqRPMXWSON80pMz3LFrvzBJvu9C3P
         X+OzgEqfCnOSg27vjkXPRbzsDvIPNnV9miwX2nuORrdODVa/jq5A/lVPKw4kYcPFPRVD
         LiMSYAsetSuV081LpDMeKi2hO/nEiu/7yz571rfmsUM0+oI861k57NDWstj6pqf3sLe1
         4fDA==
X-Forwarded-Encrypted: i=1; AHgh+RqhZk0bq+MCQfXox7uj7GzsJGByD0JaYLr6dqeAG7TfFoYFmBe9jGk5GN8PSVKvLD9hJpqKl/IVrY8O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9zp0C4YYxyiWBCUlFcx9Vq0GUQghe256m4ysQcEruhraYX3qR
	bjTkK+/k13sNO+D/cn9UWRWs0Y2K1WYxro1TJNdHPC/WC54705tCosXAXeCHBh/TTtv6yHxk+3S
	ys1woZyuFxS+Pxs7raHXWYu3a4lMq+1k=
X-Gm-Gg: AR+sD13mcCZcWqeipcENC/huAIAuR26vTLJvgvgCRtTT/OKsvAVJCc5dNsYS85gKVVJ
	YNpLejqsOZtYbo3zP+IVtn4E3Q5CKXDO7Sdjprh04Z3ZfC+tBlULsqJPuoPLexIyMP/lSmgZv9P
	NELFzzrJBzzHgwFLFVDIuHkIbKKYMs+IlAMGoZXOJQ47BTRJRfXsN2AQpOrEJXoGTKWNbKpYVKl
	I8eMNX1iThWHLHMRsdAunE/5RM1zsZ41f5qv7+yZKwTHXM0c6GrZVXrQpwP/WHObAP4J59mYiNa
	lu3L6U+JbKSlvpNhdBRmtpuMId7MP1L2ewPuodKvcHQzzJFMrUlRprkgeXJ4169b/wW5sM5+k6G
	fgUAReuGUQPzgRiKzH8E8T2gAVNKqdgNl86TPKQTBgLQHI4yvOhi0xTnqMV7uGVdNMV9kWLIcvN
	QXG4i/tuPCXr7jYCBksT8dTSZaEM5KaivMHjWKrQqZI8sfaPudYaCTJ3Q=
X-Received: by 2002:a05:6402:2423:b0:6a0:923a:cfe7 with SMTP id
 4fb4d7f45d1cf-6a098d2167dmr6769a12.37.1785458685636; Thu, 30 Jul 2026
 17:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729012320.616174-1-rosenp@gmail.com> <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com> <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local>
In-Reply-To: <20260731003650.GLamvuIgDKrojvA7Yr@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 30 Jul 2026 17:44:34 -0700
X-Gm-Features: AUfX_mxgQSCcsnyTFzeRTEP6B69fhRmRVOHrIZ4lirPD8ZJQL1uhaxN7k2m99dQ
Message-ID: <CAKxU2N-GnnSqTPPSYwpXiNRNdP+qdJWf+ueaNQQWNKvXWag3wQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
To: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 5:37=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > here already disable hardware irq. Just call
> > > synchronize_irq() to make sure pending irq handled.
> > AI disagrees with this suggestion:
>
> How about you try to parse what AI says and verify it yourself?
Makes sense to me.

The alternative is to use devm_add_action_or_reset for edac_mc_free.
I'd rather not do that.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
