Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093814;
	b=WUf9BJlaFGD3YZCyGAgewBEKuR0L2Xb7AX2QbgvxRw/oKtvva2dOI/0dks2TqD38JZmf
	 qH+f64yRoppKa1Hb4WfYxFToHoFSSvmEH5VJc1TCVVI8ZU3aQqgC+7IJrND7Juy4yodhW
	 68RkXpBjJI8T+R54tcHyVWrP0ySnz4mC2xqzNufsaL9Sde0x/WlCnAKGwCDBh0bFoPE/j
	 Qo8IJ2JJLh0xBThfnkeTFQGwsKOGvV8R5qaPB80f9mIYYFM1T7moqTY2P6bqpM7XrKePw
	 U4SVSwh2Tkv2lrVivi/4iTsNZe8FuAc99vBOiE49eD9Om2X/eDnENi7T7+Z7NEUJ6WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
	b=xosqsPTJ2He68H7Co+MfwBTWsDLsg7ybWD4QYJhrfoV3pLctSv0JdtSEUtC+orW5M/QI
	 Damg3ejkUgDtTMeF9EM54l3xhkV+4OQUjdrxBHJs/h5M05kisUsv2uTFppcJ+oBS+V40C
	 ukSFjGGEDViNmTk2adVvSJM1M+cgZjJV+WBXrHKtBEcTQrCPFfUlGp2ywscsKt9R1XO8Y
	 Disbfzsf/PebtCgQ3wJj73IeHtCR3HK5UsadyFWxnFqne7f2l9RD4nZ+TFuyMTgDkMpaz
	 D4tzSH0pZMTfFtPry3/49/da/IUCAcRWSfKDKqbQxyvxTl136kSQlMtpN8YS+I1L6YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q20Csucv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E559606A320
	for <linux-edac@vger.kernel.org>; Thu, 19 Nov 2026 13:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E559606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q20Csucv
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so31727505e9.1
        for <linux-edac@vger.kernel.org>; Thu, 19 Nov 2026 05:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795093813; cv=none;
        d=google.com; s=arc-20260327;
        b=UTZhpxjacaXVxQ5A/10BfZkpZOmlwnJT6qHmjG1pDNxjFzvo2TnOrJotyWsOO14IJP
         lIVz1BBGebF8PCOGWLO8NthhNS+TsXDR558m4dOZHil3jL0RWe1xTKcoBvDIKmNNim8H
         icoxk86NDfq3Hluac2tViTOv4wDiiFIPDw2mIe/OeSI5tv9adB5mMeJqvIdUmb/ZymKp
         642GjqoCS44v41b9EV8RT7D8t00b5h1y62sYyjXH0PFcyqSN0kxDVswTK4MT7K7pMoz2
         AHQmiC5gaCClEZrFMzEKPTroaJYBaLXqQ9E76bFoUliAb4ZuoKVPTUQiVMy7dKPnTDvC
         AKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
        fh=86bDCkoZX8ivRX6poluwfqEw98OioCX//FNu0srrVeo=;
        b=YczvkydOyzt52RHPBR6H/4CuqXu5tFjEyFzEmiLRUFaTDSy1nKKLml6WKoW7E2CVzt
         3k0H6CU77oP/SfA5UXlj/WJw6oL8EhFh96Bx1Mbp/lj1CMVAKfKUwR6JEaEfat0mx0d8
         9819ljB+qln2b+ch2EZB1EZ9AQiYyjS8nMChFvcMPqkbFF2B9S/eeK2Ls52R4nzRjc/D
         failVoDNAmO7rGoUEeYQbc8aiT6+g2rns7UUlMueKWld73KzKYm8xRGZDnw8LAFGJknE
         y9XuyWllHsAZOQlOjduFUEziHk7/t0x5bWe/S62XiiHXEWVlZEIse6onYbspCry4hLYm
         SA7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093813; x=1795698613; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
        b=Q20Csucvuvx9Tb5WhFCQowHVJjc/rFkxPEA05yprnxRWUUR1KPaNZs5YMs29YW0DOF
         LsIatCWWT2JBkk8Ng4G3iz9/c/8vIvCNMQIAlfcZ83C6zWwvbrx1G7IIwKiNtGnjoDgk
         I8fGGqc/S/6iVNr1Sn0dXofgTIvjg8VrcUZWqBFWXRhComYSyEBCXDDh/G682UgcjLkN
         7IB+IdVN0WaP6qMuaiH3jdDLtqXpZDYy+4I4HlE5Rpi6F6SUVvGaE8LcZDZs2y+VrRi2
         ggGeEwbXadFlHX65rn3ugICox9rTs3Tl2iv18BG/wCViYV7Hq7D0uJs/yuZlm5w/7nfe
         7YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093813; x=1795698613;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0YkeRHLQXh9//5hIwvDEqz4eOkErWHqoPv1fUtpnY8M=;
        b=BZGS1SRUTgfQYU2+URxxvoLN2k88RwUhVJns5zMc6spJZxV5CJu5ProVjw4q4iR2eq
         Vk6/wcwWsMO3lJuX0HO9WWAFFB5PRIWZ30dbnxPOyO9Da0fxC4ohwK2lSuOfwd4tEiex
         299n8g45dK/1Bw3IBx52nBYiWqLKdcM2yEGuKHyLDlOxKrSmkYKvES3f4hZq3oPd+5zs
         ropt84LdeWYv7FCzJedxIz/bpZcZsCFK3uyatgfYuFcbrajJ/3el05noOeiYKAeQhlB/
         cTob7Rx0I2NPm1Ei2NLcDBDQpvnkzmb3msgdekjRnSLbszJ8q/SWPQv+rr+4qTP08vLa
         tbVg==
X-Forwarded-Encrypted: i=1; AL+hErGA7tt7xIW8RJkTa9VyTBjg15d5QQYJa7CMIPY1XZpXXKTm035gWUyRFCIsKpW/QHezfvgU/BuiJmmb@vger.kernel.org
X-Gm-Message-State: APuU4Z+m1XGE96RlUJEUhdGILCWjkLqebdSU7ZvPd0J1jOdjd7cUktmo
	sKbkaoF2WnReQEYzYUg//iTdivDhFJWX4oRTZv6AuvBeoG3QDLFsrCojiawnoa8akk4WtrNYKhG
	+nPFmn7FiZu/bnJo63IVmv3vDn80c5Gs=
X-Gm-Gg: AYBFou0nlrbq8509nn6SLT8f63KONjOQCAFLG06ugNujdnlieHgFvQt7RuWGSHD+DvI
	M2PDMTyfdY1CKisHK1TG9MEYpinxDh1jPvR4L8KXxUi9uil94xdh80UUW6guwHgoupCryuzpvKm
	KmsFioL/dij7crxP5858QtQE0HB073URlonxCDQGbLH0dpstQvUBDr5rcR/WrrmLC0TcdOMWCgS
	UPyWtZ5DP34KcC6b5oBwl/xjmi7HaKrQio5QediD3Y4hW4hJwJaK2oVccNmnImKSNkr97csSdJN
	5mCNrtNOInSyvI2Byf8zXBfdmzoFYAyY9iLdvQAgbUnX724AjmarZHe8pQgrK9JF7+ZHipOspSY
	AAgpNBFxbwysTcJgq8EdRK+j43AXNhZ4TAmRlFdfn8VpJfcALGFAZZIQ=
X-Received: by 2002:a05:600c:468b:b0:49f:e8bf:8f9b with SMTP id
 5b1f17b1804b1-4bb7d6cc2f4mr115781875e9.4.1795093812667; Thu, 19 Nov 2026
 05:10:12 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Wong Steve <shyckless@gmail.com>
Date: Thu, 19 Nov 2026 21:09:59 +0800
X-Gm-Features: Aa3M54rk_NLBNvdvWCWtABMbz3rNSD-UDzIhVnzuGyd1gYLXaiXITirQ4suK81k
Message-ID: <CA+X8SdjUoe-uhdG=+RbqLa7oaTwoq=2B5i5uqx8KtEf8hOdDUg@mail.gmail.com>
Subject: Re: [PATCH] EDAC/device: Fix double free on sysfs registration failure
To: bp@alien8.de
Cc: lgs201920130244@gmail.com, tony.luck@intel.com, wu000273@umn.edu, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

On Wed, Aug 12, 2026 at 11:16:45PM -0700, Borislav Petkov wrote:
> This is where you lost me.

I ran into the same problem independently, so I tried to reproduce it.
It's easy to hit: calling edac_device_alloc_ctl_info() twice with the
same dev_name makes kobject_init_and_add() fail with -EEXIST in the
second call. I did that from a late_initcall on next-20261109 with
KASAN:

        a = edac_device_alloc_ctl_info(0, "duptest", 1, "blk", 1, 0, 0);
        b = edac_device_alloc_ctl_info(0, "duptest", 1, "blk", 1, 0, 1);

Without the patch, the second call gives:

  BUG: KASAN: slab-use-after-free in
edac_device_register_sysfs_main_kobj+0x14b/0x150
  Read of size 8 at addr ffff8880044eec10 by task swapper/0/1
  ...
  Freed by task 1:
   kfree+0x176/0x530
   kobject_put+0x101/0x1e0
   edac_device_register_sysfs_main_kobj+0xd2/0x150
   edac_device_alloc_ctl_info+0x3c2/0x570

and with kasan_multi_shot it goes on with three more use-after-free
reads and three double-frees in edac_device_alloc_ctl_info(), from
__edac_device_free_ctl_info() running on the dev_ctl that the kobject
release already freed.

The if (ci) check doesn't catch it because ci isn't NULL there: the
release callback kfree()s the object, but the caller still holds the
old pointer and frees through it again. I think it went unnoticed
because the path needs kobject_init_and_add() to fail, which doesn't
happen unless there is a duplicate name or an allocation failure.

With Guangshuo's patch applied (it still applies to next-20261109), the
same test only prints the expected -EEXIST message from kobject, the
second call returns NULL, and KASAN reports nothing.

The patch also turns the if (dev_root) block into an early return, which
I think is the cleanup you mentioned.

Tested-by: Suyuan Wang <stevewong@hust.edu.cn>
Reviewed-by: Suyuan Wang <stevewong@hust.edu.cn>

Thanks,
Suyuan
