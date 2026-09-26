Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B0136403A
	for <linux-edac@vger.kernel.org>; Sat, 26 Sep 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450673; cv=pass; b=aL08e8cfr6p1zBX7kcijl8aWPo3S5w60/BYAVMFgZq5IzZA6q1xnrkBhTU1wNECR8Reqzq4I4u57DVc2/src1rLCsdy+uQvEEIE1+y5b9xd8vtUcOWZl/bgvHrRfizXIhvj8ag4DmSSuWrlYdfnENUA11ABcrAZMUiVj49Fr7YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450673; c=relaxed/simple;
	bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nn0kQeZZH4l3VkVUibZCJ+9SQKIpDU9phPsrWsV7g2h568nfhET9FX3eGIcnjAxvzWCHP/ILtRcP9teA6xvNwcF1GD38+IJIB4oLLh2LvBPkTCoTp2ph534kuxB7pzeXIWzrZUHSJNWyEOfqpmGE1Eus/s1NxCQekr2imHTL1X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCWhaeQJ; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCWhaeQJ"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so1609191c88.2
        for <linux-edac@vger.kernel.org>; Sat, 26 Sep 2026 12:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790450671; cv=none;
        d=google.com; s=arc-20260327;
        b=n+mnTWX9uCT5SQjqtqIKCL7x999xeQbA6hJNyFpyWWpk58UUhqgfFx1bNgN9F2GZ94
         yFd+Y+iFOYzRhvdLG3+KYy1yEJUqV6yN6QkXj3tABqufmbb8tpH4t3j57iV4TwgshbUj
         jnR3qPe9EKjXxVV9wf19QAQEr2J7RYjiGNE7EdXcyRlRva8TcBVldvhy4Dt/oWWxxdIK
         msYiuCs47rmkG/Hg8BNcf+RfJte0BEiuaNcSpe+rtbtGcBDlRe9KmefvgBcoI7es8p5H
         h1ClnSHhdEu8zEbTFVuKkMJ+BGwGVp+5TTt1US6XIclf2UeKVpzsN90Mku19u7M3WbiJ
         dytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
        fh=udhXQvv1FY/BsLqLySXrlaCrbvISQ49FxXzM9Zt9uXk=;
        b=dc/lPBnGutYdUeTLZXy3H/J/UiZ6adqD6/mFrSoilMdMsV/3GAxMzYV6DcHH+kFfaU
         1MlHMCVVmh6IumR7p8EXP6KRYlkUe9yJZK48p9YsxDq6PxlU/+U2EZA9xaZQOVvYHlyg
         zSaq/bLj7xZ+79dKOikpDuU5M0hvqYkbaw37dq9CAxknTHMa773Wu2eHRiSPudpRSiO3
         zKeXWFkqxDvPm4WczFohm7ID/Y0NrtaCnqPCb6N9S96wEwm++rQP4yPLxhOiujdd8Jfw
         mD3R9VFw3LFIqhN9/GvwX/eQGRaJv14RUeok3HhlEiO/UgbOo8PRtOJ4G3LCHpxkUAyN
         5tAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790450671; x=1791055471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
        b=DCWhaeQJmz3zWy7VmsMAAwOmfETwCc8H+gDAlqhJW+OWG5rGMNmegAOtt1RhnfVd5C
         zoFFZ4+fqcXOXRyiCEbRVZXwl/oXSM9sG1zdMqusO62kTxh8tukfN8HX3SXHchz4VlcR
         MuXvW3b78Dpq881gL9EOSxwEjYj969DtaI9NhgSheiuIs/J7V5LnoyavWsu2ZUtbR2HZ
         dCHhGFEaVDLKJkjTs/zi4tst6kSPhZXSgQesXuPJNtdSzWXrWhIudzuSwFuQqlOD4yEW
         EkcrKr2cQS4cZr9qDNN0nYA7sbxU9RkfTMokpaVE348ZGUQnjsJQOVftBwceq0kbOBbT
         UXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450671; x=1791055471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7frupD0wg9SZIXkGZANNB+CXtKsKzSBxbx3NeU9iCYI=;
        b=TdsXk2lrggA9ShedoZKTx96V9Byz1tdHYcYFsxSjdbhI+OHtKbPQEKnLYTks4FSWZV
         D9G67HiKAQEBqjviSuk3K02tApGaPo3x4gliKgCOxfqmVg+turcQfwQdQRFUgsMWNV4o
         iOp5Dltf+wnRz1L4IQBK/jOcqHMGmVu/c7KJ4bm8xJag5cLeB5vuc9ELm4sd2QUyq8VN
         27cgT4TQ56E3GjvqvHnYMBGDxo4RP3+KuaJb/pl8Dr5Ffam9O0dasBmP18cRTWwuegqA
         chmEK2eKIIQr1yXIn6ep8bb3H0I2r7G4wnOchQtZHrIb6stZayO6si6lj9b1V31LNxAr
         v0Fg==
X-Forwarded-Encrypted: i=1; AKwUvByp6uczHLaHbZ4O3crToYqCT80/D3wns812KTf+GRLuN35NnvaUjpJJJWEkT0h0k6yv5Pn6fHoUDzu6@vger.kernel.org
X-Gm-Message-State: AFuF++lzVQTzleO/fg9N2Z79y9qrexu579bHxBoKAbmR9CO8LFjbe7Oq
	i/3g6GW3Sas5gubMtrpfjR43pTlstad4zinrCFa3UvGwBFJOpmzADWPna/GcNK5vsGEzgGYTkzk
	qTOs8KLIWwhVpVvXSMqsLXzKXxF2Zc9LmJ0ECz9hwy46iJKU=
X-Gm-Gg: AYBFou2IqhTQNrghP6Drwsb5WD38RhAgFmf4DLAf28d3plvW4eldw7/4Ko8kPiM7J52
	yootM4nXPItmmX1naaUICbCd/3/T7nn9WBrNipV7dW+heCDTqp9oR0lZBZhfoSKdWWlTfqJ2W8z
	GmimtAHMHFnCcLWjOzHg5weNokfVFUdoPleL06YkR+41VqxClASvK2TAvfUiGu/Rx80xV8CiZdy
	x0+sQy8WyM8oYL4eh7DCgRZ4qWG4eL7BKukLEZO1j4AnosirX1XHcKja+3hDXkQ6XbBnwFYvxit
	jW8OLyBRQzWFPSc7cFg6Q+iFb/qiOBrgMg6v33TQ3/Hxu7hP+KPbWBPaWKwpOjCm6iG7/F1AzBa
	9RbIz3QwncDE=
X-Received: by 2002:a05:701b:2908:b0:144:f86c:e330 with SMTP id
 a92af1059eb24-146cdeb8e14mr3241689c88.3.1790450670969; Sat, 26 Sep 2026
 12:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926120846.35716-1-rounakdas2025@gmail.com> <20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local>
In-Reply-To: <20260926185955.GAargWKzpAwXXC4CQW@fat_crate.local>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Sun, 27 Sep 2026 00:54:17 +0530
X-Gm-Features: AclHuK_HTO0In_htLjTxJbuSrtbwkk5pOzlK1Alk6WxrLLl9JXXZ0TUg4b4TAmQ
Message-ID: <CAPYTKoNgPmfNQ9jSeexPWNt2pcwKucf87hhkJ8HgZ59gxfG9Cw@mail.gmail.com>
Subject: Re: [PATCH v3] EDAC/altera: Fix device node reference leaks in the
 SDMMC ECC setup
To: Borislav Petkov <bp@alien8.de>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dinh,

If you have not started on it yet, I would like to take up reworking the
error handling in altr_portb_setup() into proper goto labels.

Thanks,
Rounak
