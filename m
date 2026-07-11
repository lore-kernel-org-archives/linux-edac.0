Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CD12F0C48
	for <linux-edac@vger.kernel.org>; Sat, 11 Jul 2026 17:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792549; cv=pass; b=J/sOKKql8YHY1VnAFOsxvbRowTMaRXARKV6gjymuoe4JTRQ3ftzDiNUaUHpa7vEUVlBP67jtqcD2K13JorNN9obseu1aBZS+jjRJCZqngarCfiDkj1Fg028UCx5x5yScQX8QbGk+BUhuwvhsin7mGYxMIsN3/+DcGIJEUw/B6yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792549; c=relaxed/simple;
	bh=cP2oudwB+NgQEVLpSlLu8At5RIA5GkLrltBG7dOel48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5KC7bxFYm1ByfCb9o+m/mSBWsO/QZ8ZutAxrkfY30l4RuPfpOG6iJFBd7RNDADLsisKXXYTP5sZLf/3dVxu0mwsd+KOckKrtEQty7YM9hGucBojiZiccAWceGBUv2a+X3AvwWdXjqrnNB5MHlrf6cOSXaA7VuKwLI7cKhO2hSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6EIfiYf; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6EIfiYf"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so16131085ad.3
        for <linux-edac@vger.kernel.org>; Sat, 11 Jul 2026 10:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783792547; cv=none;
        d=google.com; s=arc-20260327;
        b=LX6foE0QnkOiLbowqkBReRruuF6ZmMIXXYTEPK1zUGBdmdVBEijrKIy6utuMGJw+9v
         X+GFMqg55FypZfMrLjn+a8Dn332GxfgAsaQ3RUEozuduIignNCPaZbFuwmUCFJ9/abT2
         Jif1eyGf9TaVxkhrKVzgxxD7mmKZbHZURvOGP+/AsTuv4MGwUAGvk1UxXJbQWbZCYSQp
         aKn3MewyMyln84XRC+ylj4Fr6Efvaq1GVMzYQQRRFFMfdDE/rbxwaSwa49Zihksbo677
         kN/Mgova0GYzPhC36tSvGCTbpkpsOuTctgGeeTcIzv0WHTRwOEZnv86ffUyw9ZeI97HJ
         Y8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cP2oudwB+NgQEVLpSlLu8At5RIA5GkLrltBG7dOel48=;
        fh=vu8SZd4OL2n/5Wwq2G35y5Af2dNiCkhY9NGKaCYsqSE=;
        b=kET48MtkYaj/Bd/m8wTVIceGrTQlj4mGxQxa56nDzRFN803joGaIIhpMd5r94H6OwL
         oJbTn7xzNKXHPRnXK5bcH4dnmNDclBGib5AA75toc0pn/mCbaS2+VNFuPYdPkpVMYYbX
         8hfK3kUHuWHvtV/ISHgwSgO3IPe1Hg22G7qSLNjxnWGQDgeTMUDvHyPF0h+P3tnHZtLG
         G1E+40CUuDH5+qraMjJOODP9tiD8sqzrc/ugL4LDvoYeLjJo+iz0ONFMvhSA99RqBC7B
         9VyUKdgIXVbkuASi9oKkSlhD/uOGVfY3bVX8hpCvpZruBdRQ2d+sG336lQeS0iWlu8P9
         fH2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783792547; x=1784397347; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP2oudwB+NgQEVLpSlLu8At5RIA5GkLrltBG7dOel48=;
        b=q6EIfiYfaIaPGz8Gw8cyT7f8KhrJ3CVQDLPDP+2iWSERwARfJu41S+pdUlkMt4P7/o
         rn8JZzgIcK+zAA0+UrzgVM6cZSdNjlWAyPoTVWzg2sn1jgdpxmOqSA+aAaHB8xaQSoJp
         Y2QJjwMGiDXMFSqeM6pfxouJa3bPOh23QKjlaBGhWjhiS44Um/edIDeidZQq1wTj3+dZ
         WFGNLarfh0DdLFPU6mbPRrjmL3VuAwh3YqAy2ydwi4l2BneO2BqXTBWxMIeHoRlYq1Vl
         TNlL0hN7nZ0oF6MQBV4KhVG0fXFdEtRYYlmQVt0rQG7r1eGbJ9B3pgBftTksfLbEqgax
         4TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783792547; x=1784397347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cP2oudwB+NgQEVLpSlLu8At5RIA5GkLrltBG7dOel48=;
        b=Bj3OPlmLu1cMAcWBsgqpMFIaRbl7KTNKLcOQltdAl7Wb7DWAuaysnVTL2YXPeitF7J
         gZugtUffCq0/Pvk+KfTZUKnhpZfaNaLccqhc6oKST/rAVMi2+I2+/cIuRnNavrVEZkLT
         kTHnHu8BhZy8P7de3YV+RRIMgSDqYO+1FWHNCUoDTzapNqnRl4RGy+Zgfz4saZaUFv9a
         cnU2pqM8S+cx7x5KliM/199vK9g8+t687g8+1jfzikPp0sGXtMWtyQP8FpppT6Pel1K7
         xAzNyG9z/jdW59xeXQtWysGxSag85oCG6AI6qiDxxFJ+9ekjNNQRoXm9M+d5XXwn2ZGH
         gXOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC9DSmpMiOSqg/3bifd3XMZ5xU6EFC1GZY/namF+IpYF2IQzwN3bL3LhvdVwyvLJgalbLfdaP1sX8e@vger.kernel.org
X-Gm-Message-State: AOJu0YxmzZHT+HjqsrVQkdN8vrmEuTkTItR+1IFdtwJm+94P3fyjrsdj
	tvUzcCBF7hN94zpdyUmoEmkehmK+g5fObWoqcDnISBxjK8o0jMDYjAXkw3LCzjfR8/LGa12VeQN
	C0dryFw9pfQoNQJrTNVST0zWxhlx0c/Y=
X-Gm-Gg: AfdE7cnOmmaYBujsOEFjOWhq416+lupol8ei9h5MK8CEZpYSIktQbkke138I1uEpkC8
	JW8KVsoguQb3MJ8HpFWXMw9pmeNUvdoWikcaIw+ZtsyzMWt6Rm2j3QRLfe6wGvuXqMFV3/lYQWN
	YTs2NdVrbXA84oz4CGBfL8G7RSftWGqY2hUynZEuj5TacMLHo40PBscJgu9+R+hh5e2GU5L+8me
	5NteXXyNKYP3xUTNJWhlLaR+feQseG1X/tv6wJTLjDWqiZv0xgLZEu/7VdemBhQ9inp92c7gLEx
	j1mQaW40PMzZoqj18XKOpR4qUOc4
X-Received: by 2002:a05:6a21:6b83:b0:3bf:7bf7:7903 with SMTP id
 adf61e73a8af0-3c1102d7d04mr4078937637.15.1783792547423; Sat, 11 Jul 2026
 10:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com> <20260708091135.94114-3-rounakdas2025@gmail.com>
 <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local> <CAPYTKoMLXheN9HjQEPNtvK_JCJfZY6HabrC27UGVnHzC2zDbGw@mail.gmail.com>
 <20260711010038.GDalGVtqJ6MDh6fYxV@fat_crate.local> <20260711023527.GEalGr7yqKN65ftvjF@fat_crate.local>
In-Reply-To: <20260711023527.GEalGr7yqKN65ftvjF@fat_crate.local>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Sat, 11 Jul 2026 21:55:35 +0400
X-Gm-Features: AVVi8CeIvGssB1dl9OswbN3lP1yMVloU6o_1WIYXpidYpyk9DNEKGb3JpB40CxE
Message-ID: <CAPYTKoOUhmmJohfQXo8hQkcc5DLOatO9E-wrpimTu6XrJVYN3A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
To: Borislav Petkov <bp@alien8.de>
Cc: dinguyen@kernel.org, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

The merge resolution looks great, and the builds are clean on my end.

Thanks,
Rounak
