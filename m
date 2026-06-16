Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAA73D88EF
	for <linux-edac@vger.kernel.org>; Tue, 16 Jun 2026 23:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781654305; cv=pass; b=c+G5GEJfdoLw+VItH5g4TQRwPFFjs7pqkguDUpC4SWmp/Jp72yBj/yOnCZmKtyG23wRgoHbFUGPM7JI20xBvS/xY+zwZAjZUGIa++gk4bJpDudHPzpa49CT725TiuGVVHY/H2yfbomAzYZCg0KRxiONzWW/VXkqHPN5wqLIz1b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781654305; c=relaxed/simple;
	bh=PigxUhwJd6dBxWlHuP15uV89ucmqJhKaixwB70ZgMAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jcctu7mvZkj11WHi4/6oZujT5mQ04lSRZz2Fc0sbbhY5R8Mx8Th2HL4HMzoCR2FYGh9ItMzjrVq2KzO3XiQpQvfuWAaoCK57ukS+fEL529AjG8MlqdIgsBJPboBb3mxTXveGHlGY+yFavNGuSjTo3UYiMUgWXvDuxdGCRkbxC2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbbNC8eN; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbbNC8eN"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1370417c01cso6730828c88.1
        for <linux-edac@vger.kernel.org>; Tue, 16 Jun 2026 16:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781654303; cv=none;
        d=google.com; s=arc-20240605;
        b=XCETR+FfgOIW6X5t0tSoQ5vXDGWtM36sq5xd1/y6YD5gu21dWpvcndBDUeHwimi4Ua
         89WTfuJBqbngVv8hSYJAv0ZVYgVI4/mE7SJLEKnjJcC8GvcKQCN/prhbj69h5rRvR8Ok
         b/VXamvoAtdNERA8Da5hRhudNyUW60su2EcCc1ZWwjccSZIRZKJckHRCJB5uR5dnT6Zb
         Q1cQe3gPmqemo078JBwhurrA0Sqyj0eD/2+Mce2FBRLxEufyhoxCxU1PES3L7664CvZQ
         vnMkQ0rlSY4GXvIV6mUQYyQP5qs/dFmOFSrQ8aq280pSLgCpGQdxUHVvyf/sL1zVTdx9
         gX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PigxUhwJd6dBxWlHuP15uV89ucmqJhKaixwB70ZgMAo=;
        fh=0dQNLPz0qDWh7crb3pq1PleFo6IMT+l1CCRFtOvX65w=;
        b=Xjnzv+Wp71P5HNooNwVijF+x6d2uqPvI8mxLcmouhnpK5L5mvNJkWYpPKL/Y65rElB
         hiYDNFcpUJGfO3B8LgKVZ5OJ15QIuYt17gfzUEpO1NU1HPSn4sEELxPUGNamQy9o0omI
         bZRUUQ2X9lLsMCSnMVNaArSavLVjOz0U+t8gXkmo2isStODdOG9TOW2eJY6wL+SKPcK+
         SOjvJK49kADJebtQr4cWU5bi0Fl3/MPQiZmIlpp8wapq8QZ9dr3n4lEJzam/fT2WVL0r
         jc4XdgI49jco3cdanVSBIzDvaeDAPA1t6PVcyheaoMFoxi0hQmpOTMGSU0d7H3MuQ7rH
         OnPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781654303; x=1782259103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PigxUhwJd6dBxWlHuP15uV89ucmqJhKaixwB70ZgMAo=;
        b=AbbNC8eNbR0GCtQfcWRQVArRH43jcQSfgpANfGpDxVen+XqUfk8AFI0akEPig0Bbdf
         mIrBXRAkel1boLygf/7H0pHfZRWrYBsnYVRWgyPTs7f0xH27fJexVmatc94W9k7GjRE+
         93sks6fhZyXapXaiEkMtnlVh1HiqUmDFjI5INk4buqIsOu9SS8oQ4HygvSGr0RgTkV59
         lnWdKYowYYpAVEU7RnGOFf6OOM6fDNVOOCpJ5MEZcFBKNY1yd3yYZDYWuTk/azS0XnEB
         iGlw439U2z7Nmq7YO2IBFP1rW/egXbNBg7ItqKT93P6pa1ML+I2bj1aZ7StTXuO0+RqX
         vyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781654303; x=1782259103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PigxUhwJd6dBxWlHuP15uV89ucmqJhKaixwB70ZgMAo=;
        b=UbfzgF+FIpWC6sVzAEIUrePm6JPzTkujuqqjzIFu8RBEXE6LqsioFhXaETVwCP22W+
         EyfwM8YtMLpuvdUiRrSHBMXfU5l034ss3LQI9umtqXZx3SdvPUAx1DSEvT4uxAayBmpl
         eHgmm5nzWscTaCczCypqD6J24WI/7mJ2GQpcbylle4K3kSx05uHufN1JrFq1ZUKTjMek
         U+XbjVF4tvU1QgERTZV6p2MCZDm6PnAiOm8dRAdSVUDRXJaKdw69LYx5Ldl6dOvkcq5h
         r4T3TMsdX0djZLzCuJArm7Ar1ykFQITUmbDwLEHp2GPCYrdbPSecqVK8tXM4+Scnx/8Z
         a/Ug==
X-Forwarded-Encrypted: i=1; AFNElJ8CTQpzINsSVM9xIV9Ud6ne3n+lkpYrQIDPZoATGBgrOCWP42BE4G6Onh6OVtnOCqJamd/Njm19UpaD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Y7LpI4bP+YN6iWBKXvWKk3L4lAzmiv6rtiu0kZLTiP/xZlRZ
	FX3Pv0Xz+FZ+G04ohSzwGu0O74UeYfo0S3pspawiHZONpMLsvYMCwFaLDErlbalSvGcO5CYrTHf
	R+eathXt0La8QCQE2YrGCSyMAhPzhFiFQcCHkMFSRb+ShW3vFCw==
X-Gm-Gg: Acq92OEBu5fZwEtOhXvsPre0zAFBstPJU5UfcjhRsFS2w8I0ZnWnECyyFi63u5m/JQK
	s8wDFYL474ZzXKNpRsYUYbWAAeZ66/p9Sdti0d8fbYIXcZ+9tu8hKwz0MlgI0dF+20FiT2jv7+S
	S+QUEI0jNYNZcDPNOOxI4C4Gz39IZyXutqjT0QS5O9n+85QrMwH1pT81xHVmG7Ms+0O4ZVorYVa
	Ai5vjkuw8UC9wKmrjVLUnJ1Bd09GXkv2G5iV337sh19uN5klp/lZnQP0Pf2aqEYg+JCn/NINO7e
	0nSTi6csiif6Q3XchSKqMxSZnI8lTextXn7LKZU=
X-Received: by 2002:a05:7022:43a9:b0:138:508b:93ca with SMTP id
 a92af1059eb24-1398f696672mr486010c88.18.1781654303156; Tue, 16 Jun 2026
 16:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615191508.46335-1-rounakdas2025@gmail.com>
 <20260616081709.48774-1-rounakdas2025@gmail.com> <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <3131206B-1E30-4EED-A327-D6FD39E6C4E8@gmail.com>
In-Reply-To: <3131206B-1E30-4EED-A327-D6FD39E6C4E8@gmail.com>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Wed, 17 Jun 2026 03:58:11 +0400
X-Gm-Features: AVVi8CfPFSvaqk_CUtPkIczYnh3MfvUj5LKOXi8RYITwLwkJsxMPUjM_RHYnQ5g
Message-ID: <CAPYTKoNq4894bH5r3bAXLNDogWw52sFg-GCP4H7EDY+L871XHQ@mail.gmail.com>
Subject: Re: [PATCH v2] EDAC/altera: use SDMMC compatibles to select A10/S10
 IRQ layout
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

I originally used the altr,socfpga-s10-sdmmc-ecc compatible because in
altr_portb_setup() np is the SD/MMC ECC node (found via
of_find_compatible_node(=E2=80=A6, =E2=80=9Caltr,socfpga-sdmmc-ecc=E2=80=9D=
)) so reusing that
felt natural there. I later realised that shifting to
altr,socfpga-s10-ecc-manager is better especially in scenarios where
np could be any child node.

In v3, the compatible is read on the manager node. To avoid repeated
calls (as you have mentioned), I have decided to store it as a `bool
is_s10` in `struct altr_arria10_edac`
