Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA95395ADB
	for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429160; cv=pass; b=dGXxjc7KWoCzf7ycfcbs0xYemGZYz3sGTn/12nMijw5ZLvzsjD1fqAtqq6jPbPkIs4vY/ZKaYaii4qN188wwSZi6AOYfJ5G8GnUIqhAsYBkAOBRiQkvPRJuIBjlyQU78mEDeVpQGuYTEYakKT7p0/HEKCKi6WIfJGK7dawjTflM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429160; c=relaxed/simple;
	bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2TCxbEXFHTERFWXmDzm6LHQnRUpxIvaRyBZzMHuhI2PFh68g3oZc6obZA1W3M0l6L7i/JIXgVyTD9KXQ6OvRB85r5LZE+KytLQ8/adIufKUrDTJLbdJDvwdhqjss3r4Dn2a6vU4WVYyFWmaT2KFNsQ7aXouC1oAIzrqCLlWe0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lI+d4iU7; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lI+d4iU7"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2258478a12.0
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 09:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785429159; cv=none;
        d=google.com; s=arc-20260327;
        b=j/gQRPxAY/rYMBdh4OKweXbyCwE6Jsf860QROIj46A3AfIr89bN6WS2FsNf9QvBbJK
         B0sRwLpIaNZceLjjGaeKksBCGDBh2hHlKscoA3PPWwERKwbzBUaZO69lHuweiV2Voibe
         RuRghs4jGjiH1uMysxMvg0UHvi4bF1E9oS+tlGxB5O3b9lIYLBqjP1slI2ehE+xPNUaf
         5a5BpZqdaVfG/ogtOCZHCSwdSdWKvqNk3to1DM8JNsds6Z5ruUImKWx92Ei2H7JP2C09
         BRZNzHO/dCr4tT/1HwMC0udz/VOcCQe0M9MxMyDoqJAgksy9tNrzph8z7Qf/FH9maofl
         BdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
        fh=HSGOSaK7rVYDbUnZyPk318pK7v8VMQOi2RZl3q7wfDk=;
        b=j4mgCXhPNx+TyaL3R8f01IYJmc41G+b42JOQForspWJj/Ff0ZfYEU04xubU2g0/gAV
         IiKBoP/0nzBf3cKBMnqNCJHGQ9oDJLKWaniEQUFBHYPGIHTopJsDPDVJQgto9kMUidkT
         Rpb0YqbthFPZ8gyW9SsNMS9FlG+FRfmNdexFweQOF5Kno0OkBwW2DfAZOBOOz7KCSf4m
         mIKCFmsmcNA0U/BPNIUxrgLwUKHg4Pw1+wlm9xu1hHThuFcaavpQuQW4KGW64feG8pKX
         +QosN71DVCVOMqW6Pvw7LGlHygbV/L/AN98ueW3bIXqLdHwwRxwiDROFOPR7vS38u6h+
         E+KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429159; x=1786033959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
        b=lI+d4iU7n4QzMPjvovE5o4pavwrDuEmPw0kWYZjhzOVal2vgUNdbJ9U8kZKPrLLtb9
         ws766XjCpoRheUY54d4PCT4I3Npf0usqWQDSNmm3eKL/YVwR2MRgmpZjLK0lImFp7BwI
         NK8OHiZiaYFdvsEtit4MU3gTr76AZ1/z+D/0VBB1BjI2qg1zA2XK9k+Ia4y31uhiTNor
         b0/5Gu2I0PtkqozUq8lYiQJicLT5ves91SJKmPjd7KFKYgn0oiPzsBRcJn4kOyWGMvEh
         BgI6fEhqHTLsvhyM+gmS4QWC5Ej8fRfTlmTkyqzb8wnA7Iv9FGQlmy/kRqkQ7xAUB7SN
         gyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429159; x=1786033959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IPweQa939gd7nIqWfEjM0QcoU+Zhyc9RPuy6U7q0p2g=;
        b=DYrV+GZht2BocwgbosE2w81IaQu6yNqqZvbE9CC9beHqe8drkVuUTJNhFGF0jXCyJM
         AeU7k2hlgIFfWuXAqQcLDovpD6WqGzzNPwUAQd/EdogxOdb7231sRBTSRFBXxCwH3bfs
         cdp8itFV+nY6dmaB4cyzQE5Jap+dg2tGstcAgx35OdM3ZMjYQsMXrsuVQx2Huad/T5R4
         rz/+gWLftuTON72DxmvqszBDhWQPU36v0wvsn4HGuYOh3mo3QpffDDMa/9KppRg5tVGm
         C+nzOXvsCLPyDVpcM2DI/L4rzZudmrExoKIxVfOgCY0kN7pt6CYajmUCKpeg9eXR+iRl
         ca9A==
X-Forwarded-Encrypted: i=1; AHgh+RrWuDBaD4QS/cVHjZLUxJGWYzG4FTt6POqDV2d4MiwWpTFBWveAjwqoQFC+jjP0ci+ugZBOjrzRCnwS@vger.kernel.org
X-Gm-Message-State: AOJu0YxhrLBFGcO2KTRC0ePPpGToKCawfcBD5ElvlZbQJz50DGV33RLQ
	pdhu55wWK39iaaObtr4c/K2bzp50y9FcVXpWyeq5DCyLOS4YsAMFhF7b3M6uXGo/kkbRv32O3YH
	fPrPekOpWXOPX8yiDMhZNU13tYLGAM4s=
X-Gm-Gg: AR+sD11595ODi+KNvAgjSDk2Ed0xqlQWtI5FcRd/TnDULhk7GVSmXhL4qcpZ06DDVfg
	yXq1Rf0JWTOzuwIJmxhDJSTmvNc+gupdps5pT3zQDmshj5LJMkyPdk/wQPmLFrBKUl4mb0GcrdK
	euQrMsfiq+1D541/jh+/25H7rCbYT84DYGZqSfFUEvrRr2rb3ccKnN04ls7xvZpsp5aiBfgSQL8
	OeiBWlcWNeOJV33wpC4Km0wWm2UMd/vZmkzdG5omx7V73kLBYK4ILZSc0aF6vVnrrmEyAnAr2h5
	FFdvnDrW+LL3vZwWh3SdWp5THA/3JUgo1hiS8tRAuS1CsoSyFNcinKQ0UnTWjw4TLTI3GRKQdg1
	iRA==
X-Received: by 2002:a05:6a21:339f:b0:3c0:9c1a:8936 with SMTP id
 adf61e73a8af0-3c90d6aa817mr1084696637.62.1785429158796; Thu, 30 Jul 2026
 09:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
 <20260729204308.21562-1-rounakdas2025@gmail.com> <d580900f-d880-4ede-ab74-a83fc0c71be9@kernel.org>
 <20260730-gopher-of-unnatural-leadership-968ec0@quoll>
In-Reply-To: <20260730-gopher-of-unnatural-leadership-968ec0@quoll>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Thu, 30 Jul 2026 22:02:26 +0530
X-Gm-Features: AUfX_mwOeAWKmxBCapFH8OO9BAgQcC-KTiMT2iLqxqLFMwzUP1ftIsgRaivSSA0
Message-ID: <CAPYTKoPQczv-9bcEkNbUitcP91FXqyGo187JW_Ld+DpDfaZJeg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: altera-sdram: Add Agilex5 ECC manager compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: bp@alien8.de, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dinguyen@kernel.org, krzk+dt@kernel.org, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niravkumar.l.rabara@altera.com, robh@kernel.org, 
	tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Sorry for the noise, both were my mistakes. These were reworks of Dinh's
1/4 and 2/4 based on top of his series, but I sent them as standalone
patches replying to your review, which is confusing and not parseable by
tooling. The subject didn't make things clear either.

I'll send the changes to Dinh instead so he can fold them into the v2.

Thanks,
Rounak
