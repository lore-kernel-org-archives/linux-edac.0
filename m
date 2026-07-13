Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FDD34DB74
	for <linux-edac@vger.kernel.org>; Mon, 13 Jul 2026 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783974864; cv=pass; b=SuUP1I8Dc+lcHlQ21WKolGKosufKtu/13bw7mGYv1bpI2rNjyDfTAvLDEgCtuJTLtn0VnXi384rAuLOFqBnsg4TV+fIGjf6b4rZSovkcJ1S2wgHSgpimnSJfjIF0aM2cBVFkt5EHauBP9Hv2OtjEcUYrWiDbBki8YM6NoiwYo/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783974864; c=relaxed/simple;
	bh=W/P+WcIMPwXPhXLq4lQsP/sKyOKN5gjJpcxeDF4BMnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRDP2ORfColb6I9lhqIBjb0/yfxr4BPqwydSa28WjmkH9JPD3vOwDawtIZw2zm+7jij0EslJvb7fo0gHPBBdUe0lh251oVJGeZFCEXvtJ6gazlIhLAzP6nGPsGpcIU4ExSOmWpTZruglX1g2nfXvuzyeeVEQ1WxFcOepuuAIreQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MkpVE7WI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RayMw8dX; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkpVE7WI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RayMw8dX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783974861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYnN9/ZnNvCiHJFphpM9o0uEDJtBWzbnzlpkMTNiE+A=;
	b=MkpVE7WIX9aJHCVfJmM5uJNCC3M+qZIKzPyzWYwH/FNiIporEiLOpKGMMi3IYEuU/7Mf3Y
	TYgownh0LpJbd3upnPNj9y+cAIlrZ23f6v8YuSzXnBbAdWQ5U9fh1SCMxOkQOikWUtUX0e
	wEVmk2ZRk5I5k9AJMn/jmE9NLXANRmM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-ArkGDZDyPjqghyZqLP5oWw-1; Mon, 13 Jul 2026 16:34:20 -0400
X-MC-Unique: ArkGDZDyPjqghyZqLP5oWw-1
X-Mimecast-MFC-AGG-ID: ArkGDZDyPjqghyZqLP5oWw_1783974860
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so29665385a.1
        for <linux-edac@vger.kernel.org>; Mon, 13 Jul 2026 13:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783974860; cv=none;
        d=google.com; s=arc-20260327;
        b=ESjP9pvyKo6pWFJceHIRkjEDt/E3CvA4Nn6+v4jQCvlHitSiP0zkBFkmj5wMHRvq7v
         TnYa3ETABsro/fX0I7C/QFUFH9DXt/nR5Ix1DaS+3qhhW13WGzikZIZFxXF+a3sZ/NgS
         JxGXACauOfoC5jM5oM/Mq2BOIlkC4EmCBKQr6dj58IAQ7tG3kVMIL3g/ZQ1jbvxfZNKL
         /Ls3IkUKibwXHa7g3kJXY2kD1xYzYfXR9VpRr5QWlTv6Qwxvh4xMedF0HtUI2HX+GLja
         hIsqqTnpaeUdjKbP+/1OOnqAACwC6sLT4IQWJTdghCF/MUM31siaGLFoOnwS5X3TgNEN
         xSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gYnN9/ZnNvCiHJFphpM9o0uEDJtBWzbnzlpkMTNiE+A=;
        fh=hHNPRqeXLNBD25cfwehaccaXGcij8jNkmduJkko+FNQ=;
        b=A7S0fo4ocHO4v32W61nOej8KelYM8ILZvxgdX3HmiyGvP72zTzGZnLYMujpWyjdOxn
         15mSh1y4j7kumMC+b2LjMHZysDFRVtHGvzn6deonICoZ/kgKCDUaPkc8/GsxqZYgjAgE
         Zb4qNtGCG/MkMk4sJgQFQE3zm3FETIpl3aI9XcmymzpxuW7GGzXmM1IJK6BHwfxEQg4w
         3Xh5AY3KnkNj9P/havUVsUn0y6VOCuN4dsx+s8pGBLrY5eDB0+mWHMmKHpQdflg+sxDt
         bMetQlMY8N3UfLo4LXV9eyz01NVDuKZBchDuuB7zCQvXhqhb7vvBDYsW6W7wEpMWy0Eb
         NuSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783974860; x=1784579660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gYnN9/ZnNvCiHJFphpM9o0uEDJtBWzbnzlpkMTNiE+A=;
        b=RayMw8dXqsKZAoG7d92N0R0elTOBO8udhWF3mtY2AVI4exFqsZca7MWSqrF3W0TxxC
         JfyXYe2GE1OjG5kJdDVEE0qMXJKO52kxjVNZL30eK3rSrt7cG8LUJjtF2zAJUlYYdrY0
         gdrql5Bzcp5DgX6OYqVn+3SdsREx+Eb7rah6RJzTByZpQyHRUUS9lVlFSgbpPnhQm6Xl
         mQX9PtEn39NqqWl2dyUfcdmg1h79BvaZUGp6LIEKS4DxbWuf+U+V9jROZZDWX8zLTRux
         znF5ADhgD4YZ4mdV4bvU4++UovODrkRRwH3FCCEV9LDmpS4fKCoE0fgkwaRZhh0TSqR7
         cBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783974860; x=1784579660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYnN9/ZnNvCiHJFphpM9o0uEDJtBWzbnzlpkMTNiE+A=;
        b=i2oMON8c8ffGZC3yZtTeiDCayA3Kj9RAKzyCYa6B+dETgqk3AKNcFzbJ7HFnXOE4eA
         NpV/mitfuCWZrvNhUZZsy6zwWteRLSnMMXrR8t+l89hPMcNCiIq9zgTE5lsEWq6dq8+t
         bFqcykO1tRD4gmIb0ZeKD5ueDWpmObEu9Kz/OzirYsu0/gw7Tn7kQQTcsEj2MzqoFnQA
         tMaqVTimM55P0oomcrrZc2gEZlN10XoawelKweLqfs973se1NPfWydqSxLWzD7JDRfE/
         oidIFrbzQsQfvYzApWrjRPVvtnnCvRmh2R2UWdDlyK489/QUCv5I2PKr1p7/ocRn/xen
         y8qg==
X-Forwarded-Encrypted: i=1; AHgh+RqstqOVYJr8iBipegTfUrr0aUxhJkR45h5FzvN23ulnNQnECoDSKN4/jN+xQGRwsDKxQBNMm0mUkkws@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5q6AR6IpRRLbZcKXtuwjopIHBjQcK7DcBcAIKH3+1gOIQ0PiI
	nJ28UE+7/rf1WrpIhYH7jBDPnLiRvdK+7+1PIv/oGrifvA164Yy8ut2KT8tY/Om1JI4hiWtK7L6
	IuPnSTI/PtY5jj4fftsekTJ7u1CF4MmWmlErb6zRZ87yLXKhMLvvPip7scZtZ7SHZ80GDBqC7Ax
	fsjVycOO5gIp9nDby6sMdzGRa+sunZrkKYTp0ABg==
X-Gm-Gg: AfdE7cnq3YxtqW2G75qZ83n/pfb9AqLMdM2nlKT+Zq0sZ2/cCR3R+/cmD3/Pqq3cE5Q
	xkJu8HxFqSCj+nTo5n5X1BRag2l0MxOmj5Zr+EYFxUk6tnwld9Wn1aXAKY1JqvKPUwq2POVgpu9
	2JSXiJRt+4QBAj+O3OGMmMh1zvAA32bCtp25ha90wGA9Bio1n6YFRFvXD6nqicpOfIG7WLB1Kfd
	3AVzjSpCqfPqSVl5tGB5Ydpi1U=
X-Received: by 2002:a05:620a:838e:b0:91e:df9f:7804 with SMTP id af79cd13be357-92ee4cdaf91mr1584219185a.38.1783974860057;
        Mon, 13 Jul 2026 13:34:20 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:91e:df9f:7804 with SMTP id
 af79cd13be357-92ee4cdaf91mr1584215485a.38.1783974859515; Mon, 13 Jul 2026
 13:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629213624.936258-1-jsnow@redhat.com> <87ech7gi45.fsf@pond.sub.org>
In-Reply-To: <87ech7gi45.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 13 Jul 2026 16:34:07 -0400
X-Gm-Features: AUfX_mwuwbfAs_MoPHnjnqOa4fh9GUzDICRCNcIN6bbmYIckyG1oo5JkOenzDZo
Message-ID: <CAFn=p-Yu9OV0LJN8rGrc6GTkJZ38XAvP296tfwBxU6CnhLYR7A@mail.gmail.com>
Subject: Re: [PATCH 00/14] qapi: convert to explicit intro section syntax
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	linux-edac@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	zhenwei pi <zhenwei.pi@linux.dev>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Eric Blake <eblake@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Lukas Straub <lukasstraub2@web.de>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 9:00=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/2638342206
> >
> > Hi, this patchset converts some of the most trivial modules to use the
> > new explicit intro syntax. This particular patchset does not
> > differentiate between "trivial" conversions and those that take
> > slightly more liberty in refactoring, but there are (debatably?) no
> > such cases in this patchset.
>
> Looks entirely mechanical to me.  Am I missing anything?

Honest answer: I am not sure; I have edited so many QAPI files that I
cannot remember what is and what is not mechanical anymore. If there
are instances of "non-mechanical" changes, it would be for cases where
I decide to indent some paragraphs, but not others, effectively
introducing a new split as to what appears before and what appears
after the tabular data.

I genuinely do not recall if there are any such cases in this mini-series.

