Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725122;
	b=GKFfJiXh6n54wEVfLPUclUgQotJS1LZSbaqht884qAVN6ouw/fqQ59CdxTNH4tAVGblt
	 lN2aFiU9RCWXtOGoQGuRGPS9yc/xBn3wCwlP2IbA6DhU3Ko7dxgxlMaqpKXihiJuXjofG
	 wDUWOA0StsEVpDRMbm4XNQeBxPqT7L/0HPdmBYXACuO82F7mYEEYytIodKKxXsUmhW3Hj
	 34lAFy/1yJvnB05I5T+HTwS9e4aDrRe5u5srxfG85sKPAOS+mx9xItDPX3Ybu6h8w1gff
	 suPMlV0JioABY5FUuclb+Xwsvz665CxT3D1djqPdrrBgZ4ZjTDrCqNvBtVITqZ9sm3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
	b=EWEU5TQ0Th2W0fFT6F3vCMpIC9lzv4qA9McmHBZnlDGj8LpYoKzTR0h5L8kuZPd50RiV
	 /JvsyRGpC/zvIoaAjZ5B/bXyFTHVf8XjExtzfJlgvBM0guN5/lhc6O/upVjdAqUZWQP8y
	 pX9Dq9ibI6cLkN37lZMmEu0EqpW/Zr5hsbv5WCml3Jt0UHKCHVhbNZppJN8AYGRcvCH0z
	 HoUuHprHa+RWNJWO7PceMLcSsme+4Pu0ZLHCVSPzqCrgo/LqFW9ETsSmHUUEw5bk0/TkD
	 fQ+fZ9IkOuWwhC1UQTD0i/33UPfdtATHJK+Z9zNFwgBPxy62K1QIhD/YT6aI95WdykA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYiKcB4D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5ED606A338
	for <linux-edac@vger.kernel.org>; Sun, 15 Nov 2026 06:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A5ED606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pYiKcB4D
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-536c8f958d7so15397071cf.1
        for <linux-edac@vger.kernel.org>; Sat, 14 Nov 2026 22:45:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725121; cv=none;
        d=google.com; s=arc-20260327;
        b=kIFU/ob+SbPB9MstQ9WASsMVswlsc18eKfc3AWfZfLwQjM2+DrRPyKWtoBC1HvbmH8
         +JYju/azL52GK8RNAXQRoA7CSNslDX2QOFc/wJRg3/J87xHJMX2N55tBAPb4C6G8ebyv
         AktwHAnDSqEV2aK/HbygKFtjgK9l+enXnOHcgV+yYQWIWjyH5MUWoecC7Znvu93EmB+e
         LlI8s0A5tRtyRkiOrN3MeMF7Ip+uInRqzY3Ja9OXdUKwex79nM2DbO5jQqOsVbcVF8YP
         ZbV6qbAtiQ+gMUMiCLAM89MPmRfvBfZsfGTe4+TBTTdxtRxTM9dSRCQxLOi+v5xrtgkc
         USRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
        fh=PRoRJ3WbPu4nlOG7Zx/AJV+jp9oAsi7p+qLpvS52n9Q=;
        b=cpr+FXtzBhFaGfR7Iv3GzV2xf8MlcEiBMdu3bKV4Hav/srOce0bwF9aaR1liu7QMYe
         Z9R2a3QHrcGHeSVF8PWb3jCH6ZJbyve8mpa3uIeD03sU5Gl2H4UpkBbYnNwuYwmHG7m2
         dgyjZYphNNGX9zQ0Z90oZkbaZ9ZPIzdTo6HA9s+kQcoC9u7/WlOll4kTkgPKzk7vFAH/
         eFqnbMG22pjnRBWYQvNSq/ImT4JcdMc4931UYYcB4GkveF1fAs/vFfKaZQxCUT8QoivY
         XUAbBcrjoKzVuMBEhIt5HMgd7w7nuu7TUqjcFlW4KOzW13W/IYzZowkkqBD1yVB7otQc
         wYqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725121; x=1795329921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
        b=pYiKcB4Dkw8p3OxL4Am4xaWjRSZUG5ivDuVKRm1HgQNSi82FSOcSmfvvCZOR9/Ymin
         SdnkieChYZBpdm2sEMzgk5XpIEuoUUbtFukA7FVTfRBF1fhFiHns/loNIp2aCkaRYylD
         y1PmoORLg9Hh3EhcKe/lI978mJuq+J07c1lxaoBEVKXTlmlEJcRY5WcDk8UkKp7S2YK4
         /a1kAeXh8aoc0opjOaoRzE6Pp5kNCvlTDnts5t3UUwIrSWX69OdGW8w1viYTJvYzHknV
         Y+0wio8bFpzNO5QWm4DxW8VeyaAR+nEQVy8RhxEHskg59zWLhYF/EnljdsrrosWSwcJl
         jLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725121; x=1795329921;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAZqS5tW0P8Kr9gtuBy9z3go+odNQ1jK4DHH70/QF0I=;
        b=0UYtFE5jK+UBiZ302KnKFXAy3V3NyvXXG5WW2SEn8gxGXawJfjOOTk0v3JDO89ZNOb
         VngWHpd20GReONPoaMPb/ZKlB0B93/zbf2fkdfXXE+7iDVLXEs1V/+Gq57INSY39NWAp
         SEc8dom48EED1ZZa8DoD/h4YNsxR4L53xobsULrjUIrb2GFfugpNIeDJg2+jUPNGeqVI
         gAoy3RvpCCEbf3ct8NgRFgXmviQ8LIzhUr2wpCG/tlgiWylI5TIiTz6aPkai8hViOHJ8
         Bazz/mqQwIE4wCjtqCtZefvIdwJX8lnxeo22Ln9UAYisnlBa23wY1aK39W4jlMII/0eM
         qOWA==
X-Gm-Message-State: APuU4Z9bFUWGBbSMaH0Z99XxGz5a4r6qO5ZM72ChbCuK9Yo5qE0pIxN5
	1DCnOc+GmkgOUIux/zGrEzLTDF0Sq5jnJXvL2qddGi2ljSwek8tH89idGuP6pTvJOxtq6gbvXG1
	5pPXt+qKMAHrLjJIrx8cd/6AhHRW18Gk=
X-Gm-Gg: AYBFou35XwXWspdoHGsuPoExhDonqV8y5yzojLkMJPad9BEzHMzpAp40K7k5B5aemFC
	Uon9VKKHsazY/CGhbMLWVEPCmjcjIBkqWybxyBt25QArC3fufwwf1SUivsIUbmKNt3LKZjy+eUy
	TV+iqoAna/E2n3VtIxIf8Vr7IFPGpYTldvfnZ6Z+eZ+DFeml3LRiEKUVb3TXTgQRspW9xfkDMkg
	Mj3I3G6tjtZsXlPcftlVpm6Lu6vY77tNJYsV/61V9OAAarW/p+22It8UPYU2wdZSsah1uTwyBZu
	awtJ67B5+Mv1TGsjAWmAwQM7vtpHh4ndLyZu9poN5L6s06fc90JYHScH6wuA9eOQkZ6OQclrkR8
	urzN88FkyW835heJ1iFHr//Uwb0muM4eHtivCnzQkuiENT0Sfu2K2dlK4Bxl/ltqIP2Gv1m/flw
	qGHoPUsIzRW96Ryg==
X-Received: by 2002:a05:622a:4185:b0:55d:3350:d270 with SMTP id
 d75a77b69052e-55d3350d4a9mr10965061cf.35.1794725121094; Sat, 14 Nov 2026
 22:45:21 -0800 (PST)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:45:10 +0800
X-Gm-Features: AclHuK-jDDhL3mEMFmeo9aMUL7RpBVpjc6aGb81YPdfDwTLWZPEh7kzOxY3PHSo
Message-ID: <CAAi4Z-dOp+TvmvtJbkepcFWVA9jsbrq00yd5d+LV86cizsc9vQ@mail.gmail.com>
Subject: [PATCH] EDAC/altera: Check device IRQ lookup results
To: dinguyen@kernel.org, bp@alien8.de, tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

altr_edac_device_probe() passes the single-bit and double-bit IRQ lookup
results directly to devm_request_irq(). If either lookup fails, the
request can mask the original error, including -EPROBE_DEFER.

Check both results and preserve the lookup error when unwinding the
probe.

A similar issue was fixed in commit 47c3e06ed95a
("spi: tegra210-quad: Fix missin IRQ check in tegra_qspi_probe").

Fixes: c3eea1942a16 ("EDAC, altera: Add Altera L2 cache and OCRAM support")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm.
No hardware test was performed.

 drivers/edac/altera_edac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 12175d0cbc43..b7f04cccb599 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -759,6 +759,11 @@ static int altr_edac_device_probe(struct
platform_device *pdev)
        }

        drvdata->sb_irq = platform_get_irq(pdev, 0);
+       if (drvdata->sb_irq < 0) {
+               res = drvdata->sb_irq;
+               goto fail1;
+       }
+
        res = devm_request_irq(&pdev->dev, drvdata->sb_irq,
                               altr_edac_device_handler,
                               0, dev_name(&pdev->dev), dci);
@@ -766,6 +771,11 @@ static int altr_edac_device_probe(struct
platform_device *pdev)
                goto fail1;

        drvdata->db_irq = platform_get_irq(pdev, 1);
+       if (drvdata->db_irq < 0) {
+               res = drvdata->db_irq;
+               goto fail1;
+       }
+
        res = devm_request_irq(&pdev->dev, drvdata->db_irq,
                               altr_edac_device_handler,
                               0, dev_name(&pdev->dev), dci);
--
2.43.0
