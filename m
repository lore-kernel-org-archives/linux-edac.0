Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3E1D8E01
	for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 03:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786764660; cv=pass; b=uG+oRWR3g8/7V6XsJEvriRh+1HhjxvRb1vCs1NWhM1QVI4Im1iOuNRPGCPmaLT2hLS3neR/aIBr4tGTe3gi4EmUfBqpHft2sianmYQVQlUMpOXfp5tNswRi/iex1H/7R0BaeYF1PpM1BzavYPOtUPx8YEDIBPGO5009Od2zDQyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786764660; c=relaxed/simple;
	bh=zHKKpEGI49ya2HaDsGRP/CgBP78r28xF4VrrkMoq4bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1LDBRRM7uZokb/B2balUfYow5bPCP3jXDnepqP6Pcdme2thGuIWqLTk40mwqyE5us5UD7A75xwlulLHfoR5RNswln7Lv7IloV+wabpq/dkjMvsZJXnN9EHIMB/8H9aD9O3Ne/vY1lA+SKAdAxjhgZU6f1K0Cumpvn7jwtD7E8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcVpFJQL; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcVpFJQL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5335cf904so7177105ad.2
        for <linux-edac@vger.kernel.org>; Fri, 14 Aug 2026 20:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786764658; cv=none;
        d=google.com; s=arc-20260327;
        b=LERRtanHPjCu5PTG/RzNUmZSKiJz89oveYtPXYOS9YQqHF97XE5y/yqiPfMzHkzjZy
         Va2tgj9CmSETGz0QMYYrCmi5Nq+ZSOnClBumCv83CxVUNXshduMcCdq0fz9H0JVjE8nk
         kNyZmLLBu7Ok0cUmHHT+sV8xHy9LukUtB6NthlKcbOWhknhK6/6VgiKTswoMuJLfBD/j
         UwkC0O8fx+tueTg/j8gvG3Zk2AJh1Ok+oCZZjmWFsUuXmOZW8RDs3U3O/mX/DpzpAcYZ
         4EzWK/oTtM+uON1fmqKgwvb2FWnS9W8xUoBArsxztby0bW4gpWrqzGI0eAL72PptuZE4
         FoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zHKKpEGI49ya2HaDsGRP/CgBP78r28xF4VrrkMoq4bo=;
        fh=1IYsnd9GAgKqDTLIwQtCPWdqC9aGIYHIW2/WVxLDiRw=;
        b=f/utPAfIzC0sJNCVzac0PMNqujnwA0RI6Lf8zAvk81ksuZl0cZfE9zBEM/fzGNoMTK
         izAz7A1NCfxmMGh1xNvwMGeTBICXZxXH2yW6jd6xfUFgXM+mGu4stWSqz5cH5G2LSL9N
         5iAZWrZwoyBfrWosJTXPgB8e51PccL6jjnq18j76M6MtiTqEn0ICINN0wA6YPWGNjCf8
         A37wKmxcNQkO2X5B+Hwtw4HYel1tOWU+GnNDyiSWdZ3posCn1rPMondrSHPu1ErTkakS
         l7brwnprCfO3uFsKW1CyXd9nQfOS7AkxTBiEUuS17CoKdf12xlNvm3cpKaM7kWW/d7Vm
         DL1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786764658; x=1787369458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHKKpEGI49ya2HaDsGRP/CgBP78r28xF4VrrkMoq4bo=;
        b=AcVpFJQLht0WYMtemIU0xxzg+/676pfh48fUgtQ7VKhB9Y9aibhLf2kzATaQ+gmm7f
         jJ7CUJhpNk2UkmDQzfHGOQbitDyjUYRClX8ili94t+kAtA6G59Tg6/gh3NGxoFXIZaE3
         MDUTMvnNKQDEzPc/jyqom7VYG+thhQ6gkKcxbX3iKx1WOFH8ogYHiAivwq2SmoC643sg
         P67OK0NDChT2Plp81msqDAf4F74u+/i3a8x3xieOtgBRSEvbYTU9ARtfjzbF0xf+4LEi
         mUB4VSGCJcruLSJQPNWZWN69/AyD4Er0XOiXaEp1of/Is6PJBSBuYD9HUSbKM8Umg5yu
         FQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786764658; x=1787369458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHKKpEGI49ya2HaDsGRP/CgBP78r28xF4VrrkMoq4bo=;
        b=jcGkCUVEv+Mm9sdltBVroMoqlfrOboUGUVZMLQZcFazU+kEi9pSSQQOOj3YQG5DT0N
         V0od9kJxi4WeCZyjy5jB6WpyyskflzgwiOIsHjxdaly7i5Bp+TrzaUzLVLIha9E70ptu
         zq38dOOCMLn4vAaXufdg6i1ucfFL2AJeE68W8u64buvEggQpJSj1ICPP1oWiSN5rm0ux
         II828CUQXdtnfd5z1Z9G9a3Qq/17zUBnlQyjqXv8pYF+Z83CiY9+jNm703MGzHLXXqkX
         7B2neIGUd3ICssJXOLyhnK39Qm5N1GEdV6UwaYM2RFay7Au6IRerBIu+Yp+YYmZQS52B
         NkbQ==
X-Forwarded-Encrypted: i=1; AHgh+RoE2OLNjWXGqMJV4egLVSa6aabz8Eo1ir1cGhI5b+TnyvXI5TKyJEM5C/vn7c1Yi/+kQuGQGHqzA4oa@vger.kernel.org
X-Gm-Message-State: AOJu0YzlW+V0JTcAhVCuFrGpZBMZbCr18XJktmjYSEjt5/0+a9oDYXIF
	fJ0h1Fm/AON6YILLMTkd7oxth3g4joOHLwQYksG9A4+CCusvaou7QX5OXprQ8/8JkJqtr0b69ZC
	GzFO1XdgDX1DCKwhG0RJTuBinsKymkp2jwmeH
X-Gm-Gg: AR+sD10rAAOFNBLuFRts8WyIRw9ICVVWqr8gHIe0WTPvwItdqmWBHbSziXoe8PjqGpd
	8nCGO57nMLQdGwuXzGnWsY/eO9DXD/860OnejNU05yvW8IduITGsje/JCVOCVmHOlDnhnn8ibzE
	J4MngifbcXTZ2oYfLGFydy1uCcyUxZinRDKQksyu8x7ebUueYUTh7klH5fiINc9icyMDgJoZT0/
	FMS9cY25d2XWZuKYgPbYtXZWaOUKrZVgSjxWSJ8u3ZhxQDMB6aBfO3+mLrNYqFSfeJHe9gKXeXg
	sRjgYVdBu+kbZramf8Pi5WuAjgFSh4dyKVWtzD18aDwVf3j8DaqiAZ5ZH3RMDZ2YuffX+FklYXZ
	x4D5UYE8ufyX1BFIlwlmFeBFgHY2x/WvMn+RrkkC8oB0mee7eMUeHn6s6JEW8Y8uF7aVWf4DlxL
	L5UiAJE6Pld2Zm5iQS
X-Received: by 2002:a17:903:22c6:b0:2bf:9760:b94d with SMTP id
 d9443c01a7336-2d3b0c93b9cmr112092595ad.15.1786764658542; Fri, 14 Aug 2026
 20:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814045347.13841-1-phucduc.bui@gmail.com> <20260814181549.GCan9bVSKYJ4Dmj_Sp@fat_crate.local>
In-Reply-To: <20260814181549.GCan9bVSKYJ4Dmj_Sp@fat_crate.local>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 15 Aug 2026 10:30:47 +0700
X-Gm-Features: AUfX_mwsABJ0IHi4AttdjRjUjXXrLFPuxuRiB-C5eNGZADSmjDGSsitdjRwwB6g
Message-ID: <CAABR9nFdtAaUdqmX7PMu+s6qDdStgjeCMvptRks1zJk+9C7htg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/xgene: Use platform_get_irq() for IRQ lookup
To: Borislav Petkov <bp@alien8.de>
Cc: Khuong Dinh <khuong@os.amperecomputing.com>, Tony Luck <tony.luck@intel.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Thank you for your feedback.

> So this driver received a new maintainer here:
>
> 49b35cd5e7dd ("MAINTAINERS: Update Ampere email address")
>
> and I don't remember seeing it. But ok, water under the bridge, that's lo=
oong
> time ago.
>
> Sashiko reports a bunch of preexisting issues:
>
> https://sashiko.dev/#/patchset/20260814045347.13841-1-phucduc.bui%40gmail=
.com
>
> which need to be addressed before anything else.
>
> So let's see if Khuong responds. Otherwise, I'm marking this driver as or=
phan
> too and we're done with more obsolete stuff.
>

Understood. I=E2=80=99ll wait for further feedback.

Best regards,
Phuc
