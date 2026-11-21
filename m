Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795223119;
	b=P/x1G+vxlryT+mHQDkAQPorlk3ff646SGmW4Uen65Ru47v26yIJPYeHAM7k9H9XO+x0G
	 JFizOrge+KMuVb9mQbxvDyBltHqbI7JTJhlLnQfgjGSVY/hp3GUhz+OiUyX/4xdWRK8R8
	 O4ZIHCHRPmewXuH9Bh7GLfR1ND8g0Y1yMM9VxPrZx0uF5feOjriXxCr+DTtXKUy0/HZJS
	 KER/cIx92y4+ZI+48SeuvQnXXTSeAHb4iZ+AvqEntmNbD0kCFFZuub0Aai8DTdSfprR4M
	 PJN6BDh8ZCP869qwRhSMOItBZ/f8QaBKo6zLZNeoAwonLulcjEZfuxkY7T9++N2d88Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
	b=S92qViMJ/jKsqMggDkgRAU5G+2lOKL0/dpHSvapVxthcK/1oSmejKsPfPJuDZicZv36R
	 AZ9zLmgX8t6n4SMG4Bh9byWAkN7DaBi8NIMxGSviaef4fKkPZAKM53awgLv+ShVhnCq6k
	 OiKfpPGsW0Y7ug8Z9hQ0OvA0FQgnJDkRXCGUZOuuWPU0dOO2YrFn6zRKXT3coqx4V+5cO
	 PluFk5Ir8Wo4z6G119sP/Vn8vwd/KbPPeNmdFtLxgPtGVhjOA3q7CtPexq78vdbKtafoQ
	 b2Bck9rIvVc75hlC5VlnBw01BNwurhkX2m0KQVbLwWH3wE2xOEw5CzdBUlDhBGNeWaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNm6DzDO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02797606A6A5
	for <linux-edac@vger.kernel.org>; Sat, 21 Nov 2026 01:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02797606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNm6DzDO
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9496400270fso135581485a.1
        for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 17:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795223117; cv=none;
        d=google.com; s=arc-20260327;
        b=HmpILSBvaaU5pYoc5vhSvc2UVK36V88Y4HtpXyNNX8bg8sxERNeH3aybge3fx89CRL
         5RQ+r5IYYotpTnBp7F7lTtJmna5UHA2AdNAZCb3KPMWRCpRCoEhyqhm9V07pnqzWPvAA
         FZ3Qj+pKoKHbD+DIaHDChQulRvrN7ukFHK3FVE8m4CesJX7fHHj7UGHlha3wlz3rPJVV
         a6D3EfVXqnmlDc5vOR/UYFo7obU1gDwOFxklM7xxPTpiFBd78SF3wYSKgPUSglpdoCfm
         l3nk8fRGN48Ta6/KarYrOaycqHtQs2I0ge/BzAm2wYjGTmhO98DshUTwOkjB6tdbYZdS
         kNQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
        fh=VRBWEQvpNtz2f/Z9yZTdweF7xuc3ED/Y1KnBPHZF/dY=;
        b=S57Ykb4cK74S+4Bled6VGaxIbTNJloGsHEG3a9V7rgnTpe+Bb7rLSxNOpaOWZhg6dq
         TmbqkGzBKkbc/RubJK8CRnmZFsOeLa2NZQG4KRiWK+frVJ0AHTvwlNfagQgQfbjff06C
         hiIrJ9XxFRA/wyFxUraCq9XpDBMp1PP4V/tQ10DlVQFpjz8Lm87N4V+V2NdE1INP8lx/
         5gYp5y0Ybs8FYGljTP7Sfk6b1mMP/lYGocUCia6Jjf8uFMGXY2mgyl+ZNcXxwW+sU+WQ
         C4easSQrkGWRjqeBdxX7ojrFaemWwp9f471Z3CLo2GemWQsdPwpJ2EIie7I1Bn5Esdfc
         k5VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223117; x=1795827917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
        b=pNm6DzDON3XuRFzRjM7Y+16VKhmwQFhBUf5Hq++UUOPEGE6DGbP+pA49uGkh17af66
         aBRcavRbk+rvUvDZG+U2ITO0qJ3DIL1eqKKxCxfPpixEeseINAmWRQkkc/jlfUjkORZO
         ml8oIoA3AND6rP6fD6MxW63/nSkvRK3jY6B+0ZSMyPTEqfgxlIglT3FWf8ghU4+seyqV
         +bkE1BIYi+8rRt/rK7uML6rU3qu0hJratEMux8jzuyLkRcIU4jtXklfSaSb2arEuFFfo
         linnLAVVmNdFPVTCPEMQYffRNn1H7I5wBad5fvjfMjBsPwnEeiOrq0b4GdHMAhmiAJ6i
         xj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223117; x=1795827917;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8xwlgo/XNZO5KLdBkEW/2WF1dNv58iVv6RHyfi9TaJc=;
        b=h1yQhu/a5b767Ka2eWnJ37hTgfKlxaXUgkmZleUK5Tv9ZG4k4qQRmQRaR1nnlf2VHD
         V51dDtaFoO4uiwYgjzHyUD2YkyYpHTh/FnOzl7N977FtsXztmJbnG6koyzDgq6S35J18
         zlgFjHAjpCqy32O50L1+sMA2Ui4O7NLTCdXrcyZhy13EAVSUJLaIDKCECFD+GGopSbP+
         WvWnAjcJe226jZqGSlOnAw083vugv+pUakOSDSxz3lHk8kGVTZCukCiya7qAHpfFfz3g
         Dl8+uuRlUyODhwSZhUFJ5kLOraFls9k0qocnLAMee2+Hd31z2s21ZzlSm196yHshf3As
         aMKQ==
X-Gm-Message-State: APuU4Z9H0Xuzv2bYZlwWXceh/wjYdb+SmEt35kGz4fG6Xuhr/p+Rii0/
	iKZ6vzD5Xhbqi3FS7KVcIvJY6QLhcg5piqoNDTeUB7uVY9s2282/5vZ1Qux5PwsZhp+xqH/X31D
	ZUV4c7Opnep3/FtpJUJmeiH+q8x40h8aUzdJY
X-Gm-Gg: AYBFou0zu6drCSIN6iOBNkbgBDPLKJ2m9Hm02CZNhhpxgxtUuZbGgl+ZTD/FUTnx1zb
	iRXcM06PVn3qbTDLEouXzMD1EWVHyI+PlNI1dTIqhTFK48qfJJ9wV6sEomH6425i7rNNDxZ5uFu
	IlJwi7XF8nieLP67F0ehxOObNAv3ipdNdru6LBEp6xUjlxy4AwcOLVSyLTRdrnsEbHGjWaqjf7N
	bB7hprC2LHXamsI7nWMJx+ikLoXP7nbXc//fYcCu81kX6enmjYl+Ktwr9oKiuQKVFPtITsk0xOf
	2XN1yW2d9z7RPXlScqhnKPWhLPsjPle7Q/jKcbWfOE+lqVDkT7DI8ZoJrY9POB1Scjkp0Rw3v94
	nLdENrgVCI0iSfVlLQ+9UB9cBXD1ZpJaXfwc71lYdw4FvDcnaQm8QDzUZT/6MCSRYFzqTyIa6cn
	gDHLvfRHTU
X-Received: by 2002:a05:620a:448e:b0:949:673f:72b8 with SMTP id
 af79cd13be357-949bab7c484mr770407685a.82.1795223116801; Fri, 20 Nov 2026
 17:05:16 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Aditya Kulkarni <adityapk@gmail.com>
Date: Fri, 20 Nov 2026 20:05:03 -0500
X-Gm-Features: Aa3M54pTWqH1XC2rWFy8uaXuOTB6eCym0Qm8pobFm_S8fWG3Z5eim7Tuy-Z91ys
Message-ID: <CAO91vefPN9NBiaErBZk+D_7wehUZozU6Bo5gy7mPZw2MtJk_jw@mail.gmail.com>
Subject: [BUG] x86/mce: mce_syscore_resume() queues MCEs with MCP_QUEUE_LOG
 without draining, causing permanent 20 Hz MCP polling
To: linux-edac@vger.kernel.org
Cc: x86@kernel.org, bp@alien8.de, tony.luck@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
I've run into a bug in arch/x86/kernel/cpu/mce/core.c where resuming
from S3 on a machine whose firmware leaves stale MCA bank status bits
across sleep permanently locks all CPUs into ~20 Hz machine check
polling (~320-335 wakeups/sec across 16 threads) and silently drops the
resume-time MCE logs until a sysfs write to check_interval or reboot.
Environment
-----------
- Hardware: Apple MacBookPro16,1
- CPU: Intel(R) Core(TM) i9-9880H (family 6, model 158, stepping 13,
  microcode 0x104, 16 threads)
- Kernel: 7.2.15 (7.2.15-arch1-1-t2; CONFIG_HZ=1000; arch/x86/kernel/cpu/mce/
  is unmodified upstream)
- MCE settings: default (check_interval=300, cmci_disabled=0, ignore_ce=0,
  mca_cfg.bootlog enabled)
Root cause
----------
1. On this machine, Apple EFI leaves stale error bits in MCA Bank 12 and
   Bank 13 (status 0xee2000000040110a, ADDR 0xff7dda00/0xff7dda40) on
   both cold boot and S3 resume.
2. At cold boot, __mcheck_cpu_init_prepare_banks() checks mca_cfg.bootlog
   and calls:
       machine_check_poll(MCP_UC | MCP_QUEUE_LOG, &all_banks);
   Because MCP_QUEUE_LOG is set, machine_check_poll() calls
   mce_gen_pool_add() without calling irq_work_queue(&mce_irq_work).
   Later during boot, mcheck_late_init() checks !mce_gen_pool_empty()
   and schedules mce_work, which logs the entries and empties
   mce_event_llist.
3. On S3 resume, mce_syscore_resume() calls
   __mcheck_cpu_init_prepare_banks() again. Since mca_cfg.bootlog is
   still non-zero, it again invokes
   machine_check_poll(MCP_UC | MCP_QUEUE_LOG, &all_banks), pushing the
   post-S3 Bank 12/13 entries onto mce_event_llist without queuing
   mce_irq_work or mce_work.
   Unlike mcheck_late_init() and store_int_with_restart() (both of which
   check !mce_gen_pool_empty() and schedule mce_work after calling
   __mcheck_cpu_init_prepare_banks()), mce_syscore_resume() never drains
   mce_event_llist.
4. As a result, mce_event_llist stays permanently non-empty after the
   first S3 resume (and those MCEs never appear in dmesg). On every
   subsequent mce_timer_fn() tick, !mce_gen_pool_empty() evaluates true
   (without scheduling mce_work), so every CPU halves mce_next_interval
   down to the HZ/100 (10 jiffies / 10 ms) floor:
   - Within ~10 minutes of S3 resume (at check_interval=300), all 16
     threads hit the 10 ms floor and stay there until reboot.
   - Inside __start_timer(), round_jiffies(jiffies + 10) falls back to
     unrounded jiffies + 10 whenever rem <= 249 ms (since rounding down
     lands in the past), firing ~20-25 times during the first 250 ms of
     every second and then rounding up to the next second boundary.
   - Over ~14 hours of active uptime this accumulated ~810k-935k MCP
     polls per CPU thread (~320 wakeups/sec system-wide) with THR=0 and
     MCE=0.
Live reproducer & verification
------------------------------
1. Fresh boot (22 min uptime, 0 suspends, check_interval=300):
     THR: 0  0  0 ...
     MCE: 0  0  0 ...
     MCP: 5  6  6 ... (1 poll every 300s)
2. Set check_interval=5 (just to speed up the halving sequence from
   ~10 min to ~15s), suspend to S3 (mem_sleep=deep), and resume ~30s
   later (at 19:55:59):
   ~28s after resume, /proc/interrupts over a 2-second window:
     t=0s:  MCP: 420 334 325 333 331 327 334 331 324 333 330 337 332 330 337 334
     t=2s:  MCP: 459 373 364 378 374 370 376 372 364 374 370 382 377 375 380 377
   (~20-22.5/sec per thread, ~335/sec total; zero MCE messages in dmesg.)
3. Write 300 to /sys/devices/system/machinecheck/machinecheck0/check_interval
   (triggering store_int_with_restart(), which checks
   !mce_gen_pool_empty() and queues mce_work):
   Immediately at 19:57:00, dmesg flushes the two trapped S3-resume
   records (note TIME 1795222559 == 19:55:59, 61 seconds earlier):
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: CPU 0:
Machine Check: 0 Bank 12: ee2000000040110a
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: TSC 0
ADDR ff7dda00 MISC 43880000086
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: PROCESSOR
0:906ed TIME 1795222559 SOCKET 0 APIC 0 microcode 104
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: CPU 0:
Machine Check: 0 Bank 13: ee2000000040110a
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: TSC 0
ADDR ff7dda40 MISC 43880000086
     Nov 20 19:57:00 macintel kernel: mce: [Hardware Error]: PROCESSOR
0:906ed TIME 1795222559 SOCKET 0 APIC 0 microcode 104
   And MCP polling immediately drops from ~335/sec back to 0/sec:
     t=0s:  MCP: 1002 933 920 941 929 917 934 924 905 933 920 941 928
919 933 924
     t=2s:  MCP: 1002 933 920 941 929 917 934 924 905 933 920 941 928
919 933 924
Workaround & possible fix
-------------------------
Booting with mce=nobootlog avoids the issue by skipping the
machine_check_poll(MCP_UC | MCP_QUEUE_LOG, ...) call in
__mcheck_cpu_init_prepare_banks().
For an upstream fix, mce_syscore_resume() could queue mce_irq_work when
!mce_gen_pool_empty() (e.g. irq_work_queue(&mce_irq_work), matching
mce_log() and safe with IRQs disabled in syscore resume), or
__mcheck_cpu_init_prepare_banks() could avoid MCP_QUEUE_LOG once the
system is past early boot.
Happy to test a patch if you'd like.


Thanks,
Aditya Kulkarni
