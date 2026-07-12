Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122033A1DB
	for <linux-edac@vger.kernel.org>; Sun, 12 Jul 2026 01:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783821350; cv=pass; b=uLBrItDyg5+7qryKJxXGAsrb80m+2lIId4RUdKJ/XN9efSyVC4bK7o+ONGmVvMe1DwAw3tA+aIW8Lt5HPO1vUdJM6yURkV3rk7gc/7OnXUJJpYhxRBBkwIrl3fZyxd/tZbDaRmQsM1hPISi/FL8v+XOB35rdcbwhJKODIVpLqJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783821350; c=relaxed/simple;
	bh=2GZLppV/vtKjUADCwZprchxoQylNv5M8k5Ge6kZMSM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=vCZZnMB102qf0qab0e5Jvo7MJ8cSlBOnCTLAGIANcrrcrUfPlCkVKvAhshaNAX0KoWl54REoC73Oc66abanl2EzUoE/OFxsaqTp2weav+zrb6BWnksX+td9KPNxM0MQnnTcc4vudYdTAnB4Au+wFvC2p+h2ymJcCDvDPr358TuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrPYLEo9; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrPYLEo9"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1630cc8d43so51756666b.1
        for <linux-edac@vger.kernel.org>; Sat, 11 Jul 2026 18:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783821347; cv=none;
        d=google.com; s=arc-20260327;
        b=ZNU/q5SJqKYdlN7HCwSwtFtgTH97fAnuuWZukmJtCXOfX0PBCOlCYafUI0B3ONHAEs
         rFbSK+A7hJVpm+7KEbLWPiUlq6HKamBI15jykbEufwWrfNmZG8oGyTfXB6olzV9+NoxU
         tbI5Mh1G38X9cdjVRwdPCEqtXsHFEYmsGXPrYXgrxCvzakSOMq+w/r285ezpEhyV6cv/
         pgHiElqLltlYJAoYbn3QAE0mhlA1dXBPW/Iln8TPf68WXfAnpN/hDrvbOwZ4ERV9zx5v
         HLBAxp+dqjypDyEaVGsDw/lMYxGP/vVHLQ97u47ELHQ6CeE4b//XU0nv61kmACj+G5YY
         j/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2GZLppV/vtKjUADCwZprchxoQylNv5M8k5Ge6kZMSM0=;
        fh=SvcoeHuAa/EL5BnguqDpaW1ghsiP4Mn1QNtXmRaaYb4=;
        b=AzIfvJQdIXbDekb+de4Ik7qUzEYhuMQ/wKKg9//cE7t4jB3SiMCUMr/JMXtQ+MBTbp
         rUPcedMqJe0d49vLLh627WpstZPkggDILQYfZ3BZo8whrYtp49C08ZouGo4p3zIgG3H2
         KAzEoyqSKHBFlzmVN9xPqJrs0lRpw4+budScgtPeVOkQytYov4Dhh47OlYCHS+qXjciX
         39HeMVoI3ls9vw2t5y03pZOEPM3mdYS1v9eS+rDlf389ZuIWm3uYhTjSMZ0aTXuFT6fa
         8Yegxj/fv8+P1ztPe6RtKDLDu/4jwXbdSk8pFnS58ojToNOgO9SXujCq1NLS8wuVmS+J
         wQbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783821347; x=1784426147; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GZLppV/vtKjUADCwZprchxoQylNv5M8k5Ge6kZMSM0=;
        b=mrPYLEo99j3947SDPPLeuVc1QGt5JhvhKi0v4rJgG15wjJGGx9jh2ADfvgCKR/YTU4
         0PhvSpl3UhzhiCGX/76TrVcSZSTnO3NFJl4D4TaElpNEGKqKSYJC2vNMbb+YNBs1a5VP
         1jqs6ljxRtGI/lf2RGc54zRht2gEGRdboXiM38iBmgpMDF4EWgjd5IuPX9i42YA83f1p
         xsrKWEUwETgIn/Y+gmXic5HORa3nV3HLHp7lQL1Q/WrOGGCvROngJOEeLDsH4vlaU15S
         3/eXc7kjOfHjyOYZYzqs3Uco6aEfMaDIzx8BfASrX5iw2DNKkB2kQELgVHr/dC3aaOeE
         mKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783821347; x=1784426147;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GZLppV/vtKjUADCwZprchxoQylNv5M8k5Ge6kZMSM0=;
        b=svv46c+iJIPsnKOHDuQfuTJKOGP6UNyqCduP3Z7+Tv/O5Ke4hfAfeRfVhHN0tw9+Ys
         5Cu4ZEO3jA2JWFw18B3Bt3z4OxAtgp280KceW07p6FbomTylNZAtXWBxWMeLGBRr9J9p
         bdoaCgFQHHWHTN6g3D3UxGuTBQ0MTay0vk8IIXrF0a7YAyJZxUuQ0OdIT3+Tdvd56hl/
         0jE26x8QMe271Gktn2xWH2VickWq2mgamPXH+6pvEX4dYUJFw7fpxn0qRQlGsqlT+zdx
         okoUlSlLQkzE/vd64h628YBN3CSMTvTPRrlt8z1DvS/eOhhhs8IykxQw6FYkMISHJgVg
         oWRg==
X-Gm-Message-State: AOJu0YyLFVfrzcyVIAAhCfXPGqW2akwTKOI/XKQYz2wolKBSePNlSMUP
	nIoW57ZnGOl1R3cruQUeIKb4a/dQPku4s528nGN7Spz6zzgUO3iX6+stTngUrY3v2ydTXaTrht4
	a+5Y9e6F7YYqvUb6FUgIAM+zX+LaU7Z4Yp7r5
X-Gm-Gg: AfdE7cnEeSyOdg6rbEJlPeKQiqv71RGFsunJuhFubjJ/PTDiKIMrVLFYvTVuAiDWJAh
	KYUYK1CYhLMBj4cnCYhmYKRE7i7T2nIcMcdq+p60nIQfcs4niHxdfAyBNUFIB1d8r/kh7Letp1d
	6YrcJO438Pp90oPLIlvmKgdw2sQllixgb7ZLyseEAepm+MZQ24PjD057XEEmk2WID0MRrldaBSv
	Ai2JtN3VdRdr2WMHEC/QMUhGaVKwv/onXvtBr/W6uAGiNhuSEqQXXgeTodShW7X47zzvUZJ
X-Received: by 2002:a17:907:d1b:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c161e92d7c1mr166698366b.6.1783821347338; Sat, 11 Jul 2026
 18:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1783821137-14654-mlmmj-7f2b267c@vger.kernel.org>
In-Reply-To: <1783821137-14654-mlmmj-7f2b267c@vger.kernel.org>
From: Hugo Whitaker <hugo4zelda@gmail.com>
Date: Sat, 11 Jul 2026 19:55:36 -0600
X-Gm-Features: AUfX_mwCRfF--klq5-t2Bfb7I8BNUxu7my-XKEV2fx3A4ARdMhBn_qhFCwbKMQI
Message-ID: <CAMVs2dRX5z-zOrrSCuhcP8=CNJO_8Xe8tf8yqA+aTRopn6RcCg@mail.gmail.com>
Subject: Fwd: HTML message rejected: MCE Errors and Crash/Reboot on Fresh
 Fedora Linux 44
To: linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

After booting Fedora 44 (7.1.3), the kernel will log MCE corrected
errors nearly constantly, then crash my computer.

Starting a new Fedora Linux install on my Vivobook Pro, moving from
Windows 11, results in several crashes/reboots, about 1-3 times per
day. Switching to acpi-cpufreq driver has reduced this, but still to
about once per day. This event is seemingly random and interrupts my
daily activities. Likely high severity due to the crashes, but
otherwise unsure.

The detailed description: After using my ASUS Vivobook Pro for about a
year, I switched from Windows 11 to Fedora Linux 44 7.1.3 a week ago.
I never had any problems on Windows 11. Since then, I have been
getting crashes after several hours of not restarting. Leaving the
computer on overnight will cause a crash 1-2 minutes after logging in.
I have gone through multiple steps to remove this problem with the
assistance of AI. I reinstalled a fresh Linux (the same latest version
as of writing this, 7.1.3), live booted from a USB, dual booted with
Windows, and used the latest vanilla version
(7.2.0-0.rc2.260711.dd3210c4.322.vanilla.fc44.x86_64) but they all
seem to have the same problem. I checked a stress test on Windows 11
and saw that there was no errors reported through WHEA-Logger, it
doesn't appear to be a thermal problem, my CPU temps were at about 85
C average and 92 C max after stress testing the CPU.

Steps to reproduce (Note: no errors are logged when the lid is closed):

Install Fedora Linux 44 (KDE Plasma)
Create a user / login
(optional): Install Steam (I did this in my first and second installs of Fe=
dora)
Wait for about 5-10 minutes for MCE errors in journalctl
Wait for an indeterminate amount of time for the computer to restart,
this is always under 3 hours as long as the computer is turned on

hugowhitaker@fedora-mbv:~$ cat /proc/version Linux version
7.2.0-0.rc2.260711.dd3210c4.322.vanilla.fc44.x86_64
(mockbuild@1e2118f8b432450cb13e5f2c2f631a65) (gcc (GCC) 16.1.1
20260515 (Red Hat 16.1.1-2 ), GNU ld version 2.46-3.fc44) #1 SMP
PREEMPT_DYNAMIC Sat Jul 11 06:07:04 UTC 2026

hugowhitaker@fedora-mbv:~$ hostnamectl | grep "Operating System"
Operating System: Fedora Linux 44 (KDE Plasma Desktop Edition)

hugowhitaker@fedora-mbv:~$ uname -mi x86_64 unknown

Where I found the errors, these accumulate every 3-10 minutes:

hugowhitaker@fedora-mbv:~$ sudo journalctl -b 0 -p 3 | grep "CPU:1. (19:44:=
1)"
[sudo] password for hugowhitaker:
Jul 11 11:38:20 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
0xdc20400001010135
Jul 11 12:09:05 fedora-mbv kernel: [Hardware Error]: CPU:11 (19:44:1)
MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
0xdc20400001010135
Jul 11 12:09:05 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
0xdc20400001010135
Jul 11 12:11:37 fedora-mbv kernel: [Hardware Error]: CPU:11 (19:44:1)
MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
Jul 11 12:11:37 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
0xdc20400001010135
Jul 11 12:12:54 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135

hugowhitaker@fedora-mbv:~$ sudo journalctl -b 0 -k

Will be provided through another reply to this email

Processors: 16 =C3=97 AMD Ryzen 7 6800H with Radeon Graphics

Product: Vivobook_ASUSLaptop M6400RC_M6400RC

Final Note:

I'm a new software engineer, I only have about a year of college
experience, I had Claude AI hold my hand through this whole process,
debugging for hours and checking system files and logs. I didn't know
what half of it meant but I had a rough idea. If you would like more
information, or even a better report, go to this GitHub repo that has
Claude's response under "Claude Report.md". Good luck and I hope you
have a good day!
https://github.com/PhoenixGamer128/MCE-Error-Linux-Bug-Info/tree/main
