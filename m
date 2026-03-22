Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432EF9E8
	for <linux-edac@vger.kernel.org>; Sun, 22 Mar 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774180741; cv=pass; b=B1VhTJF89gvg2TOc0cyVTOD6rBhHV0sT7wbozUUeX6TVPWX8yCwkcjJPXJtiKeFe6LPHpexhnYFLnoTTMY8MnWwdw9g1NmO1jawquyg0qMdm+Yvv/3Vh0N7/zvHALHOI0IJufCeaETIPSEIpO4gx37/XFjddHHmtz4xtYaUYpbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774180741; c=relaxed/simple;
	bh=v/ZEE5VtGRnXLalFp8qM90MPyJkV3IQX8VarMvOPp6Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RK85p5gu3byht92j1EJbXWJro5/AAIzOQYfQaPajnzbXVani2BWP2DldzPjgmmA14OFKVL9EFeypf43zkSX5b0+XXmgJyz17tK32gpnQXzAjZqzD4ZtCsCEDjoihZGtBucHbGyO7LbA/viqcybWvXDqwK0x7UurMsKhRjnqJxdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mide.dk; spf=none smtp.mailfrom=mide.dk; dkim=pass (2048-bit key) header.d=mide-dk.20230601.gappssmtp.com header.i=@mide-dk.20230601.gappssmtp.com header.b=Mc3G1bbu; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mide.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mide.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mide-dk.20230601.gappssmtp.com header.i=@mide-dk.20230601.gappssmtp.com header.b="Mc3G1bbu"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5fff18d44fbso2037522137.1
        for <linux-edac@vger.kernel.org>; Sun, 22 Mar 2026 04:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774180739; cv=none;
        d=google.com; s=arc-20240605;
        b=KC2IGwp+pNo6PpP70NRKkyRIkdiduZ4zq09O2JnPES962QjWYnGVKqVm5w+dulORTg
         QoVl1m2OUGCcziP6FPEHmYsBPUxuBrDOhTqIJ/6AmKIRMeIUFjaCKpwcPyJiaVHPzVwJ
         cP8kI7KCQ4Ea+KJr3mJRPp+WALff6xVR0Zyz24+0JG8clMTAt8aXWwNiHgbWlcRq1DpX
         RTtSKbaLSTMtY5gQYTX4cyzEFf6MHYI3z1Qi3LYEDtt9Yzs75UZR3il8c96KhvUv6COb
         j9DWaseMO9iDSVpbVvmZ5oFPPGpqy+wwdQ81OpTuMlC+zRtWbtdu9o4Yx30OiQeY92Xg
         G+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=0vznUEaoZYv+FJ1HkFzUOaZu3AryxSvqhpOnMMxqxUU=;
        fh=1XSt4VivjKS21eQ6Ansmh/HtceaVA7Yotnc576rhXqw=;
        b=W4aXAZTioLoJrfB/17MdcwMP+YnWKSj1J6f877k+7LgJUxP5xBLPjn5/Ui5XwQF7Jc
         kPJvxA0na+Lr2+fdvVw/jKgVepNbTvNGsQELwBRsIXLa89Qi8PxztStuHzJHJWg1K2a1
         xg+sWF18wye+dW+CzZa4pRrR2qtjoID74RWGzfEl5DHP7Iw5KYdib7EQAcjOKM3D3KGj
         L9h7XY5Cia2ey+asBqCps7t8hHvBcHmKgdkOv8EfsHazNQRKeDg/pnMCJlUUTOnxFXbQ
         v71TtI4AlBmTgIPb8xNr0JM6E1m1t26C7EcAzXP6k1kMne4VqU9Tfw5cUPemUNQl91f2
         roDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mide-dk.20230601.gappssmtp.com; s=20230601; t=1774180739; x=1774785539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0vznUEaoZYv+FJ1HkFzUOaZu3AryxSvqhpOnMMxqxUU=;
        b=Mc3G1bbu3GvexaBIcVF6xI5P6SxuALhOW2Ep19CDDACJKLQ31guQ4qi1tT166W1VDz
         LgIH1RMovwM/+Cf5w9NDH0YDGqfWm3WYLsmD/c+qlvPXQxhMsgOhriiK81dXwqKnkvHq
         YMYv7m3JCWVr9pPbjcF9B+II0taCsykdaxBdKLOgI+MThxJ2FZotVPchoL2tB+s9Ah/q
         35jctclGSva+3EJ3iQ/fZyRLZ030FyGlTB1ffNLHCvvvhvFv3UE9p69huz4xjcyycmAG
         cmc0UyTl3YEV6l0w8O5rhc39OA8Pd5jM6rBg2Wv4adnAg92vd5h9rf15zbFTGnfcaEBj
         07hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774180739; x=1774785539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vznUEaoZYv+FJ1HkFzUOaZu3AryxSvqhpOnMMxqxUU=;
        b=CFa2Qbja47uKE8PkyisLhsBu6ADoD5Jv9ebtYAhfJcNkheY/igMjMk4bXwP95hHxIS
         QHrVoFDRmMNu+nxImtBLNUWk389FOVAloYBBhUheCW7yh1ZAiQPCEL3/Ic3cRh4xMY8Z
         IZTg/vuZ+PKHKtybgp/u2jYKGKXFU7bScFSJMRDffwZhGAwl8bDqxbWT/uVG4/c9VAU1
         hgFLRTRh6yAO2BKNjgbL+tuQAz5icyrN0wSv1ZSzjynTilv/q3J8igi+4N0vZuT70L14
         CC9Y15UCViXe2PvD7amGn6ayfBsHdVPEVbyc5+cCNeScS3e8fiw+eUUwdLqTIB7yx3cz
         aIJg==
X-Gm-Message-State: AOJu0YzSmcIbt0+sAYikhMKtuk6tZ7kJ4TbHz+R3dM3NZcH4E8vPBQvt
	BXGkWtj7/z6iwBnQ+mPyhpjQ9fiL0YnBuDI5s0M3KFOd21hhXF8ERtYuf5xUDTsZj072cnzzlsq
	eLu0F6l3y97uFRoqgmudMQfK48f7gCsEYmiu90aDjeVtb6JgwkqJu6g==
X-Gm-Gg: ATEYQzzLAx6D8vwKBFsV9IovBbHAKMeeNIrLb5m4t8r9nWWwymndv426oQfqTh5BxMg
	G86CWCM1FnnxoBrx106btpPp3kTChiRBpeiFrGbTqmFioDUecGrEQwlQlQ9HRcpROPUPrwnqxBm
	1+uyjXh7tv4ETSxeQ3ECDA/fHp+e7LwnSkLgMfNI288ngFh8xntTO34g+YgxxGl6G+qnC4/37xJ
	kZXIh7K72SjYIajE10hDiJmaFKv/Q6A2Cv09aqR8/CGcLWh+6lgAvvnrNPqWRDqIjFt6nolB4sP
	LaY8cHeSKlS9ox1KlvBzImEUKjypsrdkEZvGNfE=
X-Received: by 2002:a05:6102:3713:b0:602:9228:34a3 with SMTP id
 ada2fe7eead31-602ae79cdfamr4570700137.0.1774180739170; Sun, 22 Mar 2026
 04:58:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kristian Mide <kristian@mide.dk>
Date: Sun, 22 Mar 2026 12:58:48 +0100
X-Gm-Features: AQROBzBgq6TB-8_NXCVeL5JvO2l6Jcrgv_C6LChj8vydl_5aFTq3hFTMBXOte9k
Message-ID: <CAKFB092mmWbikzrQTev9dJv1=FowHX5rGuh70Ee1=qutwpOGbw@mail.gmail.com>
Subject: AMD SMCA: L3 cache scrubber deferred errors flood logs on Zen 3 after
 6.19 polling changes
To: linux-edac@vger.kernel.org
Cc: bp@alien8.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

First off, thank you for the continued work on the AMD MCA/SMCA
subsystem.

Sorry for the resend, i did not realize i was sending HTML emails...

I'm writing to report what I believe is an unintended side effect of
the SMCA polling changes that landed in 6.19. Since upgrading, my
system logs are flooded with deferred L3 cache errors every 300
seconds (the mce_poll interval), which I believe are routine scrubber
findings that were previously not surfaced.

Hardware
--------
- CPU: AMD Ryzen 7 5700G with Radeon Graphics
- Board: B450 I AORUS PRO WIFI
- No overclock, no undervolt, stock BIOS settings
- Tctl at idle: ~30=C2=B0C

Kernel versions
---------------
- 6.18.3-arch1-1: no errors, verified clean logs going back one year
- 6.19.9-arch1-1: errors appear on every boot, including after full
  power-off cold boot

Symptoms
--------
Every ~327 seconds (matching check_interval of 300s plus processing
time), two MCA banks report deferred errors:

[  333.051338] mce: [Hardware Error]: Machine check events logged
[  333.051343] [Hardware Error]: Deferred error, no action required.
[  333.051352] [Hardware Error]: CPU:0 (19:50:0)
MC11_STATUS[-|-|-|AddrV|PCC|-|SyndV|UECC|Deferred|Poison|-]:
0x8724ba0800000000
[  333.051375] [Hardware Error]: Error Addr: 0x00ac672100000020
[  333.051382] [Hardware Error]: IPID: 0x000700b040000000, Syndrome:
0x0000000000000042

[  333.051393] [Hardware Error]: L3 Cache Ext. Error Code: 0
[  333.051395] [Hardware Error]: cache level: RESV, tx: INSN
[  333.051409] mce: [Hardware Error]: Machine check events logged
[  333.051411] [Hardware Error]: Deferred error, no action required.
[  333.051418] [Hardware Error]: CPU:0 (19:50:0)
MC14_STATUS[-|-|-|AddrV|PCC|-|SyndV|UECC|Deferred|Poison|-]:
0x8724ba0800000000
[  333.051438] [Hardware Error]: Error Addr: 0x002b2e3400000020
[  333.051444] [Hardware Error]: IPID: 0x000700b040000000, Syndrome:
0x0000000000000042

[  333.051452] [Hardware Error]: L3 Cache Ext. Error Code: 0
[  333.051453] [Hardware Error]: cache level: RESV, tx: INSN
[  660.728529] mce: [Hardware Error]: Machine check events logged
[  660.728536] Memory failure: 0x331e00000: recovery action for non
struct page pfn: Ignored
[  660.728546] [Hardware Error]: Deferred error, no action required.
[  660.728552] [Hardware Error]: CPU:0 (19:50:0)
MC11_STATUS[-|-|-|AddrV|-|-|SyndV|UECC|Deferred|Poison|-]:
0x8424ba480085c0fd
[  660.728571] [Hardware Error]: Error Addr: 0x00ad331e00000020
[  660.728577] [Hardware Error]: IPID: 0x000700b040000000, Syndrome:
0x0000000000000042

[  660.728586] [Hardware Error]: L3 Cache Ext. Error Code: 5
[  660.728587] [Hardware Error]: cache level: L1, tx: RESV
[  660.728599] mce: [Hardware Error]: Machine check events logged
[  660.728600] Memory failure: 0xc1f200000: recovery action for non
struct page pfn: Ignored
[  660.728608] [Hardware Error]: Deferred error, no action required.
[  660.728613] [Hardware Error]: CPU:0 (19:50:0)
MC14_STATUS[-|-|-|AddrV|-|-|SyndV|UECC|Deferred|Poison|-]:
0x8424ba480085c0fc
[  660.728629] [Hardware Error]: Error Addr: 0x002bc1f200000020
[  660.728635] [Hardware Error]: IPID: 0x000700b040000000, Syndrome:
0x0000000000000042

[  660.728643] [Hardware Error]: L3 Cache Ext. Error Code: 5
[  660.728644] [Hardware Error]: cache level: RESV, tx: RESV

The system has been operating without any crashes, data corruption, or
functional issues for the duration I have journal logs available
(approximately one year). The system itself has been running for over
three years.

I narrowed down the change by examining the commits between 6.18.3
and 6.19.9 that touch arch/x86/kernel/cpu/mce/, drivers/edac/, and
mm/memory-failure.c. The relevant commits are:

  d7ac083f095d x86/mce: Do not clear bank's poll bit in mce_poll_banks
on AMD SMCA systems
  7cb735d7c0cb x86/mce: Unify AMD DFR handler with MCA Polling
  34da4a5d6814 x86/mce: Unify AMD THR handler with MCA Polling
  134b1eabe6d9 x86/mce/amd: Enable interrupt vectors once per-CPU on
SMCA systems
  4efaec6e16c2 x86/mce/amd: Support SMCA Corrected Error Interrupt
  5c4663ed1eac x86/mce: Handle AMD threshold interrupt storms

The most likely cause is d7ac083f095d, which prevents the poll bit
from being cleared on AMD SMCA systems after a CMCI storm subsides.
On 6.18.3, the L3 cache banks were being removed from polling after
the first storm detection, so the scrubber's deferred findings were
never read. On 6.19, those banks stay in the polling bitmap
permanently, and every routine scrubber finding is logged.

On 6.18.3, it appears the L3 cache banks were being removed from
polling after the first storm detection, so the scrubber's deferred
findings were never read. On 6.19, those banks stay in the polling
bitmap, and every scrubber finding is now logged.

This has two practical concerns:
1. Log noise: on an always-on server, this produces lots of error lines
   per day, making it difficult to spot real issues.
2. Desensitization: users seeing constant "[Hardware Error]" messages
   may learn to ignore them, potentially missing genuine hardware
   degradation when it matters.

I'm not in a position to say whether these errors indicate a real
hardware problem or are benign scrubber activity - but either way,
the fact that they were not surfaced at all before 6.19 and are now
logged every 5 minutes seems like it may warrant a look.

Happy to provide additional data, test patches, or run diagnostics
if that would be helpful.

Thanks again for all your work on this subsystem.

Best regards
Kristian Mide
