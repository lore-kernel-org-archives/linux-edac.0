Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA7A25A2C6
	for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786783051; cv=pass; b=AHKHbhhCH7N2E78FNc2SGJUm+BDK//u7cLg0OmQmqER22zsCSPinFe6M1pCPLcq/fFbzZ0wYbCcymJziSR80QoBcGfkBTt7BS2X8L4r8Co0uz+D5S8w7mNacBb3zdtiVM3T94Ll+rdENKp0WNCfomctaj0XiqDIyw5iEf+7G7gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786783051; c=relaxed/simple;
	bh=TOuBwNFLCth8KyUIpToOSFCZBoSVBe6TfV6yeTTMIZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6MqUdxSnkBdiTs755kMT/+y488UxZndEeCif47YnfNSm9kt13wWj++BdS09ftC9pJDNe7x4WrliGM9vJol27i9FcCrcrN7TaBIhsuy0rYnsY3wiEwhjfVdsDutU4P+7pxIiCUVMCNcpGwvcU4xaSb8p3TT0pnxTj1fOaI53HnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glMgmD8Q; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glMgmD8Q"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848643382fcso1809495b3a.1
        for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 01:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786783050; cv=none;
        d=google.com; s=arc-20260327;
        b=T8oCHY0PfCkw9N0qtwPJz/r9w74TcZpAtlwfd7h4lDZZi74Dg2ejmdi2sh4QLeeTWO
         lNNQHomXN/bYsCsL7libiK2o2JGFBkGlVwVEB2+S86DHyctlpF/OjNJfCQsTMVaKihym
         WfNozPQi2n3ZxUVdNVhRm+1VFOrugKMH5phRnMts1tLxk6XpTmZcHCMs7BJfN8vBMeWQ
         wTMfOx5BRfoodyj3R5PRlaQyn/CbOU5xVtuAisO9g6tmIWoC8Jxwu9UVnReT3xjdxL66
         kFcIrsaw+mPBCoVTcPFxP7CDTBYBaZycdyg9FGRHycTNSlIAJvufgN+t9FyKHaFgRZM3
         U1TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TOuBwNFLCth8KyUIpToOSFCZBoSVBe6TfV6yeTTMIZ4=;
        fh=ivmUkBTa7eBhCvKCuEP8oms+R+91+brCot6PXtD+/Io=;
        b=AljLcOXe3nqvxLJVhV06NsGt6m+vVU7R0rAVv/85xkYM04BpAhzgWm2/CqA4nLQtnv
         bC1sgV6bIQ5H4eg9mSEesf+MujB4q2e8D4wn35lv7GADw1F0zhNUuZhah+H8c0jvh57T
         mHkk7T+x1KPsNdfAeOlSTFgWSu6OgZ4WXx7S84UacDaaunZpXfF0gvHzLZsyB0aiQMzX
         TmlvhnK47OEkdhJtycM91mxNOFSVeGytA2QBn3yD4dSn4zC5cXzq3wXMMql/bM7fE4Jh
         pAXg9/b3yKkeO1PUYuETRdvVp/7iI76YvhIMpa82ztxgZmT1ywEWTqhoGonmH+6oaoiE
         mCSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786783050; x=1787387850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOuBwNFLCth8KyUIpToOSFCZBoSVBe6TfV6yeTTMIZ4=;
        b=glMgmD8Q3ir/jcEiiP7Ewh6r24rMfUTTlAJowGETdZewYvftIWsvJ+IL7OLghKRj44
         dXMlfNN96+MI394R60+dK5dq3F/bVG+3VKGvbTQCpI1alWd/GZ3n6B4Vhmnv9AbZShiN
         cQfMIglYqVxwrSai2GQfnzRraoJO75dlSfUfuhmHtqN8s60ZwBkWURJGppDUxIRcqKW+
         FCCN9q7AqOm97Kq9x6GjsiKKRPVByMmRMwSOyhQX4Eu7VMORHPWxFDE5xcANv4EUTb5e
         gNU2zqUP51vVZMSp4OjOhZoiDyy+LiQN1M04+9xhDWEhkskKrUTp3E+NkKu6qaW5WHuc
         rv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786783050; x=1787387850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TOuBwNFLCth8KyUIpToOSFCZBoSVBe6TfV6yeTTMIZ4=;
        b=sTPQLi3Eu5trgkrcyMkk5Rp3CkkMiLsIyhkOfXuArDa1kNnWKVX6voeY/UHBIFb8rh
         6uTH4pXLZDKC1BKRaM10hpK5u2pVjR5lVKngKOrw1AbAVcodtCzfkbozho909aEWxfsT
         81F1fjxCKahnDFSDL1bfnTEEev2Umh6jQ7j0N2Jl4W4c2cD8eYV/baCwVt/KwIxft0lG
         fCs+dGDys2qRFZoU1ayILx+oUfPDZOD096QKgg7u4ffRx4RWT8zX0ULIxg1qKxgSV/XP
         rPFYSG5q2JnVApR0v776K1EeghKoh1HLpPJglmCGSs11HfZWH8AXQKejE+KtF3q6/OVO
         o85w==
X-Forwarded-Encrypted: i=1; AHgh+RqqF9K7dWojIoOn9FpgzpqHE43ebpuC/dzhV1uJC4GFOShk2glYJwDyBcRPFrVS3weJDmEfI1PLC6UK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xsYJZks5dh9Iw0l4w9HzLgopAHYAqJXQD7PdVQrN/p3rzy1b
	fIFqM4EyEOUapdXaj8ARwSKWD1WfxH88ukt0QGlCTnCkGEK6qIQPUaH7JF3XE87mxB1UYcHVb/2
	XHx2bcXDTYgL15Pdogvl/59bL/QmyTnI=
X-Gm-Gg: AR+sD10aYLmxA9qFfqsJbjvHrRfK+oi+cCBPEhafcF/qKkRpi1Ft9g38rEszDQkEZF/
	Th9YFi6pVyQXi7Ce2dlfxJD4b2NMmN1kQ5hTaN4lRRJ/cfHmtRTfsdY75CoHLYalZF5GRP0+HxH
	R1c/MWp6zjfS+GQP7W/lrPyfYJZ16WawHBwOrA+TNIVtz3nMepTHRc4iB2h7Hfany0RIq7xW4ah
	GxTfM7FPVRJ9Ibd56Nd1xwz0uRM6HWR1VpRB8Ywox7f4MmP0P7V7J6q0hXobvE/Csgtk2yuov2C
	glpfZwDmj6ST3Qdm9amPHC27Hxe53D/ehu4Yccj7ibktH8vYQB3ND5mPGi7rZC6wDys/1rDksGk
	LHho1F2UK10fp4CA=
X-Received: by 2002:a05:6a20:431b:b0:3c3:a3fd:db0a with SMTP id
 adf61e73a8af0-3cc71ba62bdmr13327259637.16.1786783050017; Sat, 15 Aug 2026
 01:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806155412.1518582-1-dinguyen@kernel.org> <20260806155412.1518582-4-dinguyen@kernel.org>
 <CAPYTKoPpccGRmu60qhzxUy7MAoH40z3B=ioUN4qCSFFmPakWmQ@mail.gmail.com> <ea68e8dc-3b5e-45eb-8822-d72b1c358c51@kernel.org>
In-Reply-To: <ea68e8dc-3b5e-45eb-8822-d72b1c358c51@kernel.org>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Sat, 15 Aug 2026 14:07:18 +0530
X-Gm-Features: AUfX_myAkWjI2zqHjjgmXaDNK5USoy4SpMm7aT3PX7pPsuTUHPf6O1LemP2JoIk
Message-ID: <CAPYTKoOG7y66zBtsRFHNCjyDfp7F12_5BY__=WKR8qP9OWw5QQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] EDAC/altera: Fix code leak on dci allocation failure
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, niravkumar.l.rabara@altera.com, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sure. I will rebase and resend once this lands.

Thanks,
Rounak
