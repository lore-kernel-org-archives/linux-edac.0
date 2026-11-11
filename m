Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439535;
	b=OFHN2SXvGcZEnKKtA1TTT0eAwzAZ+tAagy/PxZfgA9OGMbJ002+SW1/bpR+5NSOh675v
	 DPLqbtB/ayOeHI8Ib8SWrCXmCAmBW29XVlLe09NnxVvLeS+irvIxi7ncvJ/ep9x/At5Ao
	 lSslKpnftFxdYHCgMoG91KdAJq1wxioQrcqqc27KoPCSMcZiXWQOnud1nw7NhvXi4pD8y
	 6mSRknfW4uvhPkesaUzoBhjEWs2IedAno6Ux4/tMYT13uk0ms5acBxLT1ln2yRrmj9Hpa
	 FsOhR8a2+Z4jYmZ92EXwKC6xNndv3PSi+rY5LghekvSRdHrlcq7ntUbjq22HstBCVDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PG+feDIjqnRZOjMW0RwMSkFCn75KuYBbqVAgxpF/4fM=;
	b=YDj82nhegt4r8U5i+Nafwf70weYageUnuHNS9O/Eoz4UX7y0YfUD2YjQwwzas5F0oBPt
	 zIU8lV/htj/GCOkQDTwPVYGcf7Bwr3VdyQ84cKMFJvUcN2asc5vPwxnJArRhyu74X46eW
	 ihWgrZatJWa/Dn0O/6IrEnwohAvqdxFOYkP5cYu6JaG2iZtT7xIX81wXfYJyB4z5TvRx/
	 YjIEPwNfUtXQaz9hGmyQoutKeqe3MO1IqRt9pJLzTJ7lceXRZ5U8iNVq+XgZCzF5c4Orf
	 dMK5FbEZ4hPh0SKvvF/ZgUXV/IbnVBciR6vFdofFe+dpkftnh6wUFte6u8VzwA8jVgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaDVMzvf;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DB4606A321
	for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 23:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DB4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZaDVMzvf
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5575568eec.0
        for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 15:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439533; x=1795044333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PG+feDIjqnRZOjMW0RwMSkFCn75KuYBbqVAgxpF/4fM=;
        b=ZaDVMzvfM7ghi54DhXjuMpU9nEP/CmgcffNM+h+NOANu4Y3o4DWQZadCjPiBvITZE1
         e0tf9YzEViXcSWytLH7a7ZkwzD2Y1Cx+pumDK0y17gTYcI8FygE4GOiMne/MgceA9qNc
         Oo1l4BsmA6upMajKsUR2x3Md5wefOg34RxUtn6TliwQQTpiq9yuYXcyM2hJWSwcmEq4N
         phywvMWeV7NUJ8anZsxj0lftbtPlzLPULORc0OQFzjMId5ahHeGvj+enAieu55KsNDRM
         yiQpfeRWuQvsWKXuXsFZxEFapr/Z/xDq8DFyl6LamcqBkKTq6QTIGVjcVp6JLrnR2Fqu
         kp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439533; x=1795044333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PG+feDIjqnRZOjMW0RwMSkFCn75KuYBbqVAgxpF/4fM=;
        b=RbuMtiDMrYrIZ6Bw0A0q/n6Pw0bZrCvf+/FtMZKFYHzQjlgixrmWH2CMp+zXxDsqiN
         9kM7Rw8wUGRWtChntOSQmMQab/Y2Rbc9QM7WQoL9nwB8wzXC0WBPo35OiBpRnI4yv3au
         3DWs0jVsEukY4BhxnNESpsvgzk3GwrXF0xCE9yVpmOyOveg5h3QqkB3Zks+Y3JjwOYyH
         vMuPxH6l2H8Mwm2P6LQmNQlPiPo/HsLO8/MK91G39JHl124rcihXmNwLmM9idCxFNsTM
         GNTNtK6F5GpduwakDiVDLo3IhZ7bRkYnzzV6itonGVlsAygMi5kmCwyWH15pqpGmvTGG
         J5lw==
X-Forwarded-Encrypted: i=1; AL+hErEUM38cF4MO4Lw45BXiMR4Pt8In4O/3wMiuTWBtvn/QxQLDmOl61XxBdRigo1gr5XYe1u0Ln++jzLZB@vger.kernel.org
X-Gm-Message-State: APuU4Z+eCA79Q65+NorRJWkRORxS8z8lAwsUUBH1Ps4EiX2DKcztKm5Y
	oWmDm8HtDnRgki46oj7otukFwGmTtwMYYnh/n3zau7lAjoslMtnV5AUo
X-Gm-Gg: AYBFou1ljJZwDwV13vlTn/johwSmksY5U/w0xTzwXpDSo7CoBxDFJDDA+cjRKPFNEnt
	jpFNOEguuFpniQjfX38J7vtCMaMWV476QrOesAtb3C1muVoYgvYFrBCad4xJBARlfp/YV736pvg
	sDBYlfC41hfURyU9wUzlEY/C5IfvPMZMLQRv07emx1AF2rLclzWR0I4VOPNu/UekUlWA2UeBXL4
	Bv2/TJBpnsBW1zCXiDyYI90AFpOFSzMlYeuMjpI6PPQdynOaXQLNnOcIK3e1r1yM6R4PGqWVCOk
	meGMmult5m2NummHVQRgfbfRFvf4t/aZl3qKU01dW6ArWQH+W3XqF3drI8fmJfEukeJrnX1N5PL
	SLZgUL1AIPtrE/VZ2NMR44LROERM7uHSLmj9Zx8aUByXFFH4PNblweFQzCgl2vz0k0byxq4iBAG
	Co8iudBvXrrJ4IT5HinpCRXF8HC+Hae+boF0kcGNcshfpncvrvVWz76l/kErA1ohBjE3AQwesOo
	ezF7PcqHAePq0WtU9nNtV55uwVm+UlJFwUTwzE+lm7TxRpm9GzS0bVTAAmeLFGmIxwdCfVZ9hvz
	Q/pRwlo9Y2GofK50uFS6f5xgl7Jswn2l3nnASyKllg==
X-Received: by 2002:a05:7301:77c7:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-376ce6aa7b1mr3264031eec.36.1794439533137;
        Wed, 11 Nov 2026 15:25:33 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm22626946eec.26.2026.11.11.15.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:25:32 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH 0/2] EDAC/i5000: Fix the slot loop and re-enable the driver
Date: Wed, 11 Nov 2026 15:25:27 -0800
Message-ID: <20261111232529.407154-1-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2022 i5000_edac was marked BROKEN instead of taking Aristeu's fix for
an out-of-bounds read in i5000_init_csrows(). Nobody had the hardware to
check that the driver handles both single- and dual-ranked DIMMs [1].

I tested on an HP xw8400 (5000X, four channels) with v7.4-rc2, KASAN,
UBSAN bounds and EDAC debug. Without patch 1, UBSAN reports at driver
load:

  UBSAN: array-index-out-of-bounds in drivers/edac/i5000_edac.c:959:20
  index 4 is out of range for type 'u16 [4]'

and the same at line 961. With it there are no reports, and all eight
slots (4 x 2 GB 2Rx4 in slot 0, 4 x 512 MB 1Rx8 in slot 1, both branches)
show up at the right branch/channel/slot with the right size and rank,
10240 MB in total. On 7.2.14 the same holds, also with 4 x 1 GB 2Rx8 in
slot 1 (12288 MB). A two-pass memtester run with the driver polling (two
DIMMs) saw no errors.

Not tested: two-channel boards (5000V/5000Z) and error reporting, as no
memory errors occurred.

Patch 1 is Aristeu's patch as posted, plus my tags. Patch 2 reverts the
BROKEN marking.

6.1, 5.15 and 5.10 do not have the BROKEN marking, so the out-of-bounds
read is live there. Patch 1 applies to them as is.

Analysis and test kernels were prepared with LLM help; the tests ran on my
hardware.

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Andrew Luebke (1):
  Revert "EDAC/i5000: Mark as BROKEN"

Aristeu Rozanski (1):
  i5000_edac: fix slot number passed to determine_mtr()

 drivers/edac/Kconfig      | 1 -
 drivers/edac/i5000_edac.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

