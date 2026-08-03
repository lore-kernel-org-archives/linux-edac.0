Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF8641D216
	for <linux-edac@vger.kernel.org>; Mon,  3 Aug 2026 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768270; cv=pass; b=CYrLJFS1sraj1f4AelXapVGVze5G60NyJidHMYj6WKPryPkuszFFjTJuooBfVVIziQNRfWYBPE27mEzUGAVQNXdicYP1oBs2CaLUH4qgPQEd+u78wFr3Wx6XL1vOHHPVGpaVFkEXEN8ReIu6I6cLBGCTxkCU+gkMh0adROsgMf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768270; c=relaxed/simple;
	bh=9DvebWMNl5WPtCMcBqu9t6NlLxzn4v0a1Q8EalKFI60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAYI8DkpTbFBkLTV2xS9d7U1s9ewGh8qp4sd6GXxCv62V5aPRobjG3gpMWgSAdOC4nzYT7pESvW4bJUOIqHq4Vd2JVAwwTnLlG0V+J7+BuhI8lZGHJJDQOkvzfKvLbDvskPQPcZBfXxYesUNwXa2bRHtzTXFwbH+sBTO5qU3JKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMNlkO4N; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMNlkO4N"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66892c81725so4575685d50.2
        for <linux-edac@vger.kernel.org>; Mon, 03 Aug 2026 07:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785768268; cv=none;
        d=google.com; s=arc-20260327;
        b=YZNmX9OXdjim/004BwucNfYDvup4bt8I0YOlATTU1N1FD9I7CZuRUlj21SduzfK3sI
         i8u9/CC6L1pPvsSjCM/HujJHkpa4jY5pHyd48dkvxRnafSbEMHDm3uaQn26LmRwWUo8Z
         qt1FsEWdZnVhmNZ9YKmanhM2ppZKUJ2BhOOeiju7JCjtHQ1ww3ycuX8PL8dm2sij+/Gm
         w7zAbIbuWdVlaC+jv/3z7y7m3uminsY/ieKy6hcDatCbiPSG28Edn7nkhOsf6Z9c9VDZ
         HwebgyqezhefnyihN7V7auxSgW8Ik3tCfH8HeO+1FjhltweruztecoBfLmpvKdh5NsRc
         xDbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9DvebWMNl5WPtCMcBqu9t6NlLxzn4v0a1Q8EalKFI60=;
        fh=wZwEx6yyPPvNIEPW8HOjnn608H6odYhon0RgP+buN38=;
        b=Y9LkckUx34b2VZBSbEMf0i4/cipWeA7Eg5py5mHS4ICxkkj2lLBsMV72m0J5Fco1sp
         p0uvY1EXnr6G43broNyVvakTv4prCJstCx2pMhIKOXomDeiM/UfQL9k+hw1MKi9wn4HJ
         tybBT9Jch6w2hYsrmbhIOOPNzx/TLKl/Gu30N3+l8yfTxbGRV3kcJJSex2x4T5+d0rK4
         3OzDyH+/62xlts39YDxI+geSD9uOs6QQMKbpe6QaWD0pQcpTZQc89aVMqWIfMHzXEOr6
         JWIxlDyWn/sSje2P9U21bj6voaWRkrQDWhyYY4DBBfCMLjO5HOPHoFH52yNbwSehkllI
         lG0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785768268; x=1786373068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9DvebWMNl5WPtCMcBqu9t6NlLxzn4v0a1Q8EalKFI60=;
        b=bMNlkO4NE8+s3uDjGzDhkbfumn2ZOA6lK0f8kpoe6jUXALfHdXoq+W0gZJf5ohbU/G
         YPej5EnvkLMYzqIJiA27vgZgFLYGj8KgZE3zDupZAZ1+cDBBMcJNOW3HE7awmEx25d2n
         +z/8a963PH1m4+lVyUhlnAOvFlS1tZ4pEFayfUGOHPI1v3m9GQHpOC+qoWOfNuxaMgHo
         N2KNCDUqGpu8bOHkunBi8OiT4JS0yvsRDN7qwuuGO/rBWndA+sdN9CdnrtHpeY/0fqth
         BhR3cEkEEHP6wk6cE77hLZpM64xe8GvJazI48NUAm+4JmzR1U2Ex8zr5j58vyJrRKoqc
         +LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768268; x=1786373068;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9DvebWMNl5WPtCMcBqu9t6NlLxzn4v0a1Q8EalKFI60=;
        b=nUD86FPRtMh+gnIl5efTiTTtkV16OA2DVmu6lXDfWTXnFkk7eDSKvgTx0WKoPO5pQA
         NKCsSBeXckuFC7DsoMafDJOVV4pJOOeS3o/5z0kSuPJ5rUqmEzUwF+FwMMhOua7jDFpX
         sAyeyyK7IGD6vl20nGsqnFHhfA8A6hPLT9ELIPC7qTCIkw8l3Vk8yYUBGd339DoBeiFy
         lT7mmP9avnvZDT8CgqDY20AgytS4AYKMsmPMCUow0K2EP91gsOfx9JAoPG00qcuhQ9Sk
         fOz6gyYhEXDQNQXsGO9nlcTmAYtF7m27ZZA20rR6cVwB4JRxIC7S3iyVbLWx4lrkP8md
         PYsA==
X-Forwarded-Encrypted: i=1; AHgh+RqJ+Yo7/L0VR8H4i8VCY6mreorZ5Kyi0VTbeNbvJ6D5ZFSEgq7IqqM0RFfmawqResWnHJalGXAIo5X9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxico+/+ZOY3sAc7ntlL1MriFppisWzn0jJiIuWFUydtr+2zj8z
	Ip7xAJxwA2OToGy/LmKKamxp81y8H+MpWM/2L2c6tf+s1sn2v96w+A+4K+g8qD/17UvC127O7RE
	aIte+yZFg6F2jqBjK+dSm6b8s0rk7cF8=
X-Gm-Gg: AR+sD121cG+M/Vlk8j3CdyF4DLWVYEt0iZb6V/89tq1QI7a0OkEFgMXVsLC6lSH6sT5
	Ni+qT1yqt/t/VPZ/9731WtmIIP0ibOdcQok2e8Q4cuxL8ZNA8AoDtI+U7W1bEtEtdKmgtW0dB8C
	TOw3FWBlj9ZUpy23pDmGe0x+bV69HYVCdv4VbpaFghbbNdKyLJgb15LTcqVf/hXOMVAGnwlZol4
	SQUU0hoabXIG776tR3R7TGxnhi3DgITpbxRqtuFFG0xAojjf1Hyc4H/PwHmSw2lXekvbgfAFJHO
	igXwlhZFHk3aLlURMhhWPHK0w+Z8qqLMlBNm1lHvgTdP
X-Received: by 2002:a53:d205:0:b0:668:8bca:3c41 with SMTP id
 956f58d0204a3-6694f05f08cmr10462220d50.17.1785768268137; Mon, 03 Aug 2026
 07:44:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-3-shubhrajyoti.datta@amd.com> <20260802184623.GAam-Qf9-yes1DkNkl@fat_crate.local>
In-Reply-To: <20260802184623.GAam-Qf9-yes1DkNkl@fat_crate.local>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 3 Aug 2026 20:14:17 +0530
X-Gm-Features: AUfX_mw-ixZnKIIWaCJ45n8Qn2U9_1318h21JGJtFyQkSxonopCuy3rGGskLy_c
Message-ID: <CAKfKVtFtFmUKwnWY4xGwcRQG+qJ2UdK6LK+3QX=Ukvr3v4Y7EQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] EDAC/versalnet: Add NULL check for mci in remove_one_mc()
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-edac@vger.kernel.org, git@amd.com, 
	Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 12:16=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Fri, Jul 24, 2026 at 10:49:38PM +0530, Shubhrajyoti Datta wrote:
> > If a controller's configuration specifies an unrecognized bus width,
>
> When can that happen?
>
> We did figure out that controllers cannot be non-contiguous.
>
The current driver assumes that all 8 DDRMC controllers are present and
indexed contiguously. If there are only 2 controllers then the bus
width will be
unrecognized.
