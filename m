Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227545;
	b=t6Z84LxNrzgcVtc5mCXbROgaZq2irBo/hbMjWhGy/gYh/q8+cXeKlicdftNkkwJk6ezH
	 nC3UYe9kWsoRu5VZ4cf7TNMUnkj9cBCYqCB2SFH7cy+cWxXNAMQvZJiIey41j0qP2czMY
	 VwUEKvy2nHkH8wxlDvcsNGr8/sKkePbfnwoDg9GqLeBcNFP8Cf4j9CI7LL+UNS1hUi4Gp
	 VBJTdFu9zD65M4znsOFC+OJRwlTeihknpBsuFXhuHGJpRSZQRpaz52WfBAaUY9rn3BfZr
	 Ng3J1UhY5BHT2rlq0sj1T7LSQGX4h3Hw63ciu0dt+wPNsfw8SNOlLEfsU3dMh8yeJQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227545;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Udmccze+zEanKUPWVBdY9ea3z20SVh/JQ2hv1/0uQrs=;
	b=wQpBrIauYgjyMz/cv4FjMMfuUHybMqsTFqG7+4t33m50dbsF4yHYqt5a+iGkI1bVT1Zq
	 4Ckp2U1zU3Uxflw0JEw0i2vheyOeTK9Z3IQqtMMbWJbysUvhvmmEz2IAXZZVmhRUvtgB9
	 /l2vyRE0OFSkUbr8LJ7cIimvRwlz9Cz8/1FbB8yxPy4aMmM9uBNtYSKlj3OFCV/qNHYWO
	 tfjKvPFFuQXfbk56UUgJm4U8C4nV1ZN3/7lAyAXUQWM6OJYSDdNHCGFF1mD0/2B/MtxNR
	 9AdnO+0LlSFwYKtE1703BqUYwNNyhi5/RXFBvmgOMwjtTnNMv6Om/xkjnzNl77vNi6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjIGneQU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74B2606D83A
	for <linux-edac@vger.kernel.org>; Mon,  9 Nov 2026 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjIGneQU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757971F008A3
	for <linux-edac@vger.kernel.org>; Mon,  9 Nov 2026 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227545;
	bh=Udmccze+zEanKUPWVBdY9ea3z20SVh/JQ2hv1/0uQrs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZjIGneQUIEhtTBMVvnCgXjbRK3BFbokkzWzq0OBNDvidYJuEb67PUkd2xv89Par/X
	 8JS6xYIvydfMucj3tmNpwigRGNNv8FesiZF28tybHoqtqqdhM2usUxgaxaTKZriojK
	 nV9HQT/86qEDKz5POkbsZ/Xh41bJAsg7/c3EGOCwBa5k275AkiAat3ptmCfRawaviD
	 WwjRuQ25HTlYRKsrzDN1YJRy1IAAmuzAjYYuJFpvjdsu5eWL6T/El4tJHQnkYLWpYV
	 c2q3q7aChspXTnKKjaiqlDEatehcrA/Njqp90e7OHf4HPFtwTt/FYDpYNu7njh0No4
	 YapyW1C/d792A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c102ad8420so552271e87.1
        for <linux-edac@vger.kernel.org>; Mon, 09 Nov 2026 04:32:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErERx++IOnRhmnaEkJspy28KEruxpROH4Xqz1FziBxa5L7eHNLnTBXAcyeQ2G3C06X3ZHvKNJNmySPhy@vger.kernel.org
X-Gm-Message-State: APuU4Z/UVXBchsxrzBKyGPA3CbiinenckCBKrFmE7CHhWnXzoeuLE4H1
	XKdtET7F6dAu8Xi8g6EtGl3fRi3y/me+m2IUGi0uMmJlm9DPyGfe/hzmy9TvHB0pC1R73sQU0L8
	OQX/k88ZpKnJjw7QgpHF4c7HF9B2qkfI=
X-Received: by 2002:a05:6512:31ce:b0:5be:4386:8072 with SMTP id
 2adb3069b0e04-5c14c042497mr1063807e87.56.1794227543795; Mon, 09 Nov 2026
 04:32:23 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104110355.1437249-1-pierre.gondois@arm.com>
 <7c59eada-ea8d-4b04-a24b-9ba6aa2a6c64@arm.com> <62430a5e-1e43-45de-9f8b-f0fdc826f38b@arm.com>
In-Reply-To: <62430a5e-1e43-45de-9f8b-f0fdc826f38b@arm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 13:32:09 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hGEa=ZBLcJDGfbL5S7C99Kj8JJpaqObMj1RZZeLn=puQ@mail.gmail.com>
X-Gm-Features: AclHuK9C0VgmSOJIoZ6xy9CAOcwTI4p77cqP0wxSxIc4pGinWekVEQNGKsbwnGQ
Message-ID: <CAJZ5v0hGEa=ZBLcJDGfbL5S7C99Kj8JJpaqObMj1RZZeLn=puQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] CPER: Add Memory Error Section 2 support
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Ashok Raj <ashok.raj@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Borislav Petkov <bp@alien8.de>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, Breno Leitao <leitao@debian.org>, 
	Terry Bowman <terry.bowman@amd.com>, Dan Williams <djbw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Morduan Zang <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org, 
	linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:58=E2=80=AFAM Pierre Gondois <pierre.gondois@arm.=
com> wrote:
>
> Gentle ping to check if there are additional comments on this version.
>
> (Thanks Mark for the review)

Sashiko has some:

https://sashiko.dev/#/patchset/20261104110355.1437249-1-pierre.gondois%40ar=
m.com

Besides, for CPER and APEI patches, you need to get an ACK or R-by
from at least one ACPI APEI reviewer listed in MAINTAINERS.
