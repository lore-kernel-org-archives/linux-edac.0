Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841846;
	b=r8Ctr4kviswlUXWx2bKMZe9WRQuZFgLi+34CJ8eFzhEwZuPX6rx2X7Jy06GIw/wkfYpR
	 yOfC6wTfZX2bVzUsa7CJ84EiH/GpAh6pylKunxm75Bw9SI4DufVnmiIJXhft7xkOudlMH
	 Rvlg5Vpt09/Byz5XBNJP8l2J0/ptn/jU9X0wNltMHCrfzOx0M/lPD5VE+ZbCnpnKutZPP
	 +vfQnIieBQr2vI3eEtn0XZ4ybNrbMZPf9A5HjbfVR92EDUiMgyHXWKiIKGHBaWpY3p2R/
	 buFOsdvX8n9YX/Olr6j0RcPITh6Xm2CK45eJ05z1dP1VIkNQ5X2l9jiD/kaTsEJUrGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:From:
	 To:Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Content-Disposition;
	bh=ydenAtai05NyhlllhR9e0OsVUNFw6CpyT1AZjioMNGE=;
	b=q+uBcAG3Ruk2kF8dyZhEnhA2627OeR0gP67pXxoU/UqVQ/P9deNHutO8uvCv0DzL0DH6
	 2ZAWS2zqXYv4JGN9sYSt/9WGMBeeEBxfm8eSaSqbsp+Nll0YlJK6L5AsZxNU9wJEqzfKB
	 G+Uu3mB8/hOv4RvLPoNW6csA7Sr+AYx2fqt53IlDmaHlc/ONgsjBeYW/L4RGTj0vBTfDN
	 bzm61pC6dOwoqGRfyCNX74D4zMQDyxeH09WRUgWNhvIu9aWryu4MXYZFrfzujBeTBP78/
	 tEe1a2LYDe21gVuJ1GzhfW0gWdohOfRagMBl7A8MmNdMKFvi1N9gaShhUSDBheV39YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWdQTxQC;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B928F606A335
	for <linux-edac@vger.kernel.org>; Thu,  5 Nov 2026 01:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B928F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OWdQTxQC
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso188394c88.0
        for <linux-edac@vger.kernel.org>; Wed, 04 Nov 2026 17:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841845; x=1794446645; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ydenAtai05NyhlllhR9e0OsVUNFw6CpyT1AZjioMNGE=;
        b=OWdQTxQCUqwXbHb+36RknxcB+WBnZo2rFG+nQhEbg3L/hCjWQRHDqAWmPNN729AtWh
         //c5jnyeomgWgBDauMCM8M5i3Q9WJg2yapIu9TopSRBBmeeBp9rI2LJtMNCdFqab/CCz
         WiNudzxddVydooYpHoVbCqt5n+V53UGjW1G/AEPPG/E26fHtUJ+Kx3Gfa0yKfF+E7vnE
         9AEj1mkQ/+IvWonyi8dG6UjVBj9pFUsG2ZsIMQaApmLox8giOEJbiJOikmHzRvIJlmZZ
         5JtGTSR27JjCBKNi4/Yt6X5m2DZz1D6d1Ek/ZPLDoAl1S7BdL6DmjUuW1fN8N7aV31I3
         WPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841845; x=1794446645;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ydenAtai05NyhlllhR9e0OsVUNFw6CpyT1AZjioMNGE=;
        b=o1va6YmvYRMXVdQcqeLHGFVa8Mb8icf8+YHDVCaFf3alUL980oqs9duqjqj5rAk7aG
         IPd9RTsy3e6kAq6giAFd3e2ocENxTakLWcgvW9an16vcYQd9YNufx09D3ST8YdFy3/5d
         ktUI0kuohbQ41meZJ3t9k5yqTYWgkcs1jhnhpIQWGFNYL31ewEqzAaaPneZx/Gc/REPY
         6Np0YWyplG0tRDuLiGmryBgSQP6y1qoMxCUsYCJikyuMTgDCMspNlOIm7QrXdhWqFfGY
         vmIK+WnRpogVTzuuEDEgUJmyvO2i47JYFVl4gMFw8zslpUFn4uuVH4lbxVxarl/NgEo7
         lAuQ==
X-Gm-Message-State: APuU4Z+G5f5ohw5piMQJ21xKgHVZbWT0dYwFo09/3rXjJa/qo4TJEywq
	M8ElOPFYbr4ObzdKmZ9oIu8oEZUt+hiFALdJJtMafX5bRMbeWlt30t6E
X-Gm-Gg: AYBFou2odSjNEx/2k1I483Jn/20sg2YCAg55yMnXPQUUBeEAdXZ6N28HBWjZf6cxM7h
	44H1zYnfcKsXP2bX6v+O6iKSxR5pTUlzLMXh6M2gXfnB2jx1o5HoTLQSIWKfV5KfT+8BzGlCJoi
	yU2lL/LvEMrkgU5Hu4MJWepMm49YUXZp67hVxBkqEMAScvOJWLJL/BwRUGUB34I0DMPrKo/2q7q
	pe6cNh1LZnvS3yrOgSHvXWQEnXbpXVFTLrwgijMqLTtiAlakyYPzjD+CpqLbLDYe/U/tSoEBCdy
	zL2GR/c9iUBTMJTYCgB6hFyP970snofCH8sDTrWSGx+XVxl0DzNPINzCNTVsk7bZGQrscD4jfZn
	ddFXc0p5ulBxtorIpN/kn7VvKfqAHsb+Lr9lfxrdVYNITEj0erx+FwgdDPx+XdrdLDAj6UYsDqX
	V6p4EJTVGowBZL0yXTHFI586UuSJqLUFAX4bgn6UnB7aMxwIwIQ/YQdMUavXMWltB85p1fBkF03
	/JMsjWwCqfIORo0T3ZRm0j9q3LZHCw32KPgCxGXvR3p9IYVlh0msFdWDmzT9Cb6J6hpJLNafp/7
	wvwjlJqmqFGqRW2NT9apHL5UG6US/I+tCZwsy3UnhZ2OoGcUZVIHV+64f4Abai9XtQqzlw==
X-Received: by 2002:a05:7022:ea8c:b0:1b2:3e1d:17ee with SMTP id a92af1059eb24-1b24f4ab3f4mr1563076c88.9.1793841844622;
        Wed, 04 Nov 2026 17:24:04 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm14331402c88.15.2026.11.04.17.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:24:03 -0800 (PST)
Date: Wed, 04 Nov 2026 17:24:03 -0800
Message-ID: <41de3d396f470cdbb944ef521dfdeb4d@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/amd64: Stop allocating ECC settings separately
In-Reply-To: <ardZinoPZXbXZvhe@google.com>
References: <ardZinoPZXbXZvhe@google.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Borislav, Tony,

On Fri, Sep 25, 2026 at 10:35:19PM -0700, Dmitry Torokhov wrote:
> There is no reason to allocate and manage ECC settings separately when
> struct ecc_settings can be embedded directly into the driver-private
> struct amd64_pvt.
>
> Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Just a gentle ping on this patch. Could it be picked up?

Thanks.

-- 
Dmitry
