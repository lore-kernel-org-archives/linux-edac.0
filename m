Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BA58FD02
	for <linux-edac@vger.kernel.org>; Wed,  9 Sep 2026 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964424; cv=pass; b=APHx2XGRD4ccwTmMMMj53IOyGtu+1rRxeKmDXyPm3PDLyrO+u5bPkHhG8FM7N3wQiZ6E0R0Y4IxOFG8ayMDmlb4glzxbKn3Vf7g0qpfNfwDDL51zn3Qok7Q4V+rqPxKGKM7diofsLBVJvy0uqFWYU5sDlO3Tfk3VwXtfpJNsud8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964424; c=relaxed/simple;
	bh=sc3bVyIxBh0d+wj/LxXIb/GjWX9SGCKPaM9V1MhQnEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZmgPc7Ug4kpA/V5CBGd5dshwD0AUq8WMKjd3HFNz06PtrqXcELzH9bwL2nL+ClUUTUIdE1iqPr2gZ8BnloGj8sfPU32gL+AfllBaIta5/OD/ofOUh6hzFWaD86pcAl7YIf8NvsU8xReYrdr02s6025zZ8vhsQho7gAmFWUV+1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STCVCevf; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STCVCevf"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b613d3e19dso4390091eaf.1
        for <linux-edac@vger.kernel.org>; Wed, 09 Sep 2026 07:33:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788964422; cv=none;
        d=google.com; s=arc-20260327;
        b=NmFfgMdeLsIlwjOGow9wo+/tcHTdAxY5V/tVwzffmfxzz/992jHaF9Rt1KV+YY/htE
         CmhlwcqxOFoHU8TsqPSfd6u7azerstpZV71FgxtOlH9577BcfrmWDBGEgV8A0Mab+kM7
         8lKhaNn13UAt4MeHNLLvP72vmYE/nw8OEeDw+4tVnDaByzP5tHaMWDnJB2vQQZFbqO36
         udE5Gubmp36bwRTnX6VelPGFZ8p2kV1eOEUvbYoMx1alojYK6bhG2es4rvaJELC3E0A3
         WqaA8h7zD1VawtEeiG5/K4lp2z4IjQWyABQF/QLnqlquXE0AS1KQ+AQd8EJVAKG/9Tx5
         KvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JrAGYZtQxHWbWrqLOMN89bORD52IltCr3/3mzUcj/II=;
        fh=PCYVlPN6w1g0/Rh9L8wRNMRZ5QGVMuodzF2FudyH4hs=;
        b=bwncY8Ew7RZ2Ny/g1ZsRPOIRONezWzHCZTT5tJMYHeeVLOoeJA7v7iuhY8zB1et0Gn
         JgJMoVDeJs0MdOKURs+/RjjUBlYdPmyhBHF81U9spQ6mVEhF/rFVwhji4hKEYkvhWc0l
         8w5xsVAzDfACS8HUJrIBuuIhWPh0RDtMUaNmx5wg56eXBFllLrj8VIP1q969O+ILR71Y
         KwJglK8kDVrydbry+0x3ugBJaaAoJr9kgbLqDj/Cf9QN559fJadpsFu+VZNMuaF5hdPL
         Z2NK68jQEOu3kZXU2W9JGlMVt97vSwlVUwoi+vICgNXTl7wXCj/l8M43c6/kfWeyCEpP
         hajg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788964422; x=1789569222; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JrAGYZtQxHWbWrqLOMN89bORD52IltCr3/3mzUcj/II=;
        b=STCVCevffGVH+xJ1jeQuPH5X1mkSgNWc2NriIhxtgsziNN7QI3lmYqGLuAKyb7O2zu
         IfZCetT/FLvnZQZuElChnQIsg10KU5yBZNU2VuSKJ3ht4RXyIhBquMI1rKXYSBFjXE+c
         5dybE61/AD70k+BS1eXVCYtRYqe27S3XigX4EYhyWQ3NZd5UDtUG/F6xgg7D3VrxyjHs
         10nz8esO0orh/If4viN12m2H05tHKPxSd9LL6b31n7xkJAI551TQVhsazs7tEYIKU7Dz
         OOGt9iai1HBLRhF1+QnTnFAho/i0T9RNPsEm+2eChTXcv0VBTCUupBJcR6MEL+x7a5Jf
         ADFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964422; x=1789569222;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JrAGYZtQxHWbWrqLOMN89bORD52IltCr3/3mzUcj/II=;
        b=herD+tNnj0ZhKETcNmlxwsfx//fBkylSc4kg9sSJ8NBunBICKrR71N2DJCCwCkivs/
         qgEi1T7hcbPikzPmp1QJyMlHqn71B4Zzuvp0Uf/KChtk+TZuXqBV2xkQn0c63szdF7FJ
         c/oiNPorxyU1LlYi3VcOlY5nFCzbtgdhhfwB3Ct+rLeWBMOaotBUSWhazUP/FQrPs0zk
         iAur2kNu+3zbQmB1mgoL2nXey3OEbInA1wwkX0z/btbVVIUJafS3HlR0vcRAghEJRkvw
         akWAr1tp8wZKXFur1ZExm/dIYDUWCBFHw4d0jH2tMOrJKaROK6xE8KEI3qdQHC4tKNfw
         /IAA==
X-Forwarded-Encrypted: i=1; AKwUvBzPpn30s+EIxBapPZB0LQodjej2pwtItzFz0uR7GVahvXWNvvKaVnhjue6gv8pNrRIu/1rpRNHZhbf6@vger.kernel.org
X-Gm-Message-State: AFuF++lO0cEF+2YqCC/9rG+uKL11fx1hJj0asib7GWcZ26E1UIR2s53k
	EGpSBpqNx5+zobsldRfbuRYRgCRtO/+iysTRVoB1A0dwpZCKXhI2iDv1TWYUVA9iBWzz47fvlgg
	ykZ8qMl23y7xVuRazkKqQU38G6MV8j38=
X-Gm-Gg: AYBFou1SaOkF4cFJb88UBAuEUMnQ6ZXRbMC5CUL0lqhRPR7JwT4f9oyOclg86rPu7GI
	Hfv/QOCAggQSzylALx/D1gBBeiAkP6xvCrfQKBm7np+96mCHSRIWJ5TeZSAKnKxN6OseZrrElNw
	brBEWw7dubhfcLVIWB48WaAcNIJgjYEWhKwz23Bzv+XSr21FiKbY/L4326iq9oj3x7zStgsTMX3
	t3E7USIGbVH1Zs/UqdVlC6Ma+UjBsYqV/5vLfy157LzqIGLrD1F2Hv5eEflDZmjMvLOo19cpW2V
	V1FbZ01K0gqa+dViTHhU10d2A09YTm9I2OUTJh95Qcu5vQQ+/RAkEfU6ADQzy4K03Hz0G7qxd81
	BekptSbk//zyu9w==
X-Received: by 2002:a05:6820:f034:b0:6b9:3295:76fe with SMTP id
 006d021491bc7-6b932957a7emr9354112eaf.8.1788964421691; Wed, 09 Sep 2026
 07:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909131253.2158486-1-dinguyen@kernel.org> <20260909131253.2158486-4-dinguyen@kernel.org>
In-Reply-To: <20260909131253.2158486-4-dinguyen@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Wed, 9 Sep 2026 20:03:29 +0530
X-Gm-Features: AcwNN1VZvuSDtTgNoji8VaCpiSitHoNDPvAc1bk9oPNPvkeAKfWaadrsviD1jLA
Message-ID: <CAPYTKoOmFpCzw5EydwxRdq3LhKP6p+osY=gxvy+KOZWQsXu-qg@mail.gmail.com>
Subject: Re: [PATCHv4 3/4] EDAC/altera: Fix code leak on dci allocation failure
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

>         if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL))
> +               edac_device_free_ctl_info(dci);
>                 return -ENOMEM;
> +       }

This file will not compile since the braces are wrong, there is no starting {.

Also, another thing that I noticed is that 2/4's Fixes tag is missing
its closing
quote after "probe()".

I will rebase and resend my of_node_put fix once this series lands.

Thanks,
Rounak
