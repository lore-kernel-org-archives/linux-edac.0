Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9A37C933
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780514369; cv=none; b=Ofs+2q9rf1l63dsBvM5dabQxQpRJLPfVoWa2FhtbOEkxcSmFkN/puU/QzQy2oVuMZ2ExkOhMcZ9Oeh174H5kfesYBzByI2h/u3wpH+cErqqo5hQ/FAylGA/dPsPLx/7gmxj+Uaq/QqMiba9TFXoIoi0gefi4qfPVp+k9L1b6N5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780514369; c=relaxed/simple;
	bh=8JlQmKyS3DE1T02n2KBXLIJQZrrxUv2tK13RROIA0VQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2te1YrlsWLZTMziDsBEcSKDyqBlRQ8MYgPG6SNaPFTe7DgsWhsaApW4jzwgwRpG4JwF03bh/5TUAEeV8QkymJId9AuaNuJ3xwTD5CxFpUiQY+CTO+fKR7TRikaJSKRVXt1BDwQz5LFOOfp2mbyEbGy410lfGySTZivd/E9L+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGh0YWNF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGh0YWNF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36d8b644473so4244791a91.3
        for <linux-edac@vger.kernel.org>; Wed, 03 Jun 2026 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780514366; x=1781119166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ks8udlxWFVFor68V8OzfjcCN4g9WTq8BGgBOKtU3NBQ=;
        b=OGh0YWNF/WVAusfT4qoVrBRvKfqP9DlGoYOSpMPTvnVRZJrTselfocWC8wOVD0crQa
         pb+BOeBXm4EcuOBi+ZJrNJX/trHXjYjSpZW+DHoZ6mVUvisgDIFhYbHP+Fcv8f0whKk3
         KxveXyxTyE5FAeU30tUR1xcutO4Cs2w5hoUmBFRHX/JoRVu/eBGnwg4UaeYFnx1Xi9lw
         Iea+MrjVRTps3wQ8xUWRu56YGC7HcRki91tkYydj/IcqkDh2rAFbt5HbfcAmfMG7TNy3
         nJ95yM0TWsL3OMYp6Z62xAnNzNwg26gaPuhb/YNgL2bHGUctlGyy6WRBP0rGr1p3SOQe
         nXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780514366; x=1781119166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks8udlxWFVFor68V8OzfjcCN4g9WTq8BGgBOKtU3NBQ=;
        b=dbYD0N9SxwS9MV/o7zpvm/WZZ4g9fWXn3hfMYrvyGdQjsZNxBnbCflX6+qEpVsgeOP
         v8wlWu1I7i6gW06T63SA1T4CuuRCoB8BFPHjoKqx4tFQj25ID00t47RRXPzxrCht+Zi+
         AyMEWV6e4PN3HkFK8DN2TULZY/twRkvL7jIsFIcPkHYf/qY7/4BASckoxdKqkJUTe3TP
         Lce7JeatlsVnfLeMhIMsqT9Nn+zSIFDF7PyhyRlkpYXjT01zhvvPHlOpTJAmbHy0SGmn
         K/o1Y0E1BaLs3jIztdI7L/eQmhEiDi/tSUow66MuN2K7r0c/Vm7Hqoa80Bz/IAtkX6AR
         4Wcw==
X-Gm-Message-State: AOJu0YyWWvuXQOL0+PEGo4bl5DaSYvMlj3eoGtirZoEoEE+/6xyPgrHf
	vGEPetAVFtszYkeokdXJt+TnnPnwceGjlas7ZoNjxCLpquuJGIxpwioy3a6fHscX
X-Gm-Gg: Acq92OHMk43SiE/PfB4mxQHArp9IXvzcfOw7VK+xuOEwZcQTrO/uUrGDjdli/h/WSwP
	mlbFdp29RHtvT68K4XM7QNjaBigTmAy+UApYXvdQIbzQR6SIEaK8ETVW2YIGkF4GLP5jz+Rj8hy
	xcCjoK6gAYOsIUaNsIoHLu75SXlNQ5aaW0OdRgqVghCma1OGGpng4vXMZnkhG61sC3+Rh5flmnx
	drGrnKXn8JvqzfoWr79v0h4N+SnnoId9AAj5jf8QgyFzLPcR55vgdDNkHrZKsw8KzVi7Kl695yn
	jXoYivcdEl4RT5ApgSTROQNRHLSqvLn80gU8T0+zElEGR+sFfGUDAEdh4m+bd+HkQ3M47nIZ8BM
	QtAAXupvYxNQyJTCPAyDJpjERA5iFiIjOpNgceaJ2XLeDMAnntjwwq6io7w75Lr6227BpffrpAu
	oRf+7SF6uRT699SttDWMq2VL/lyq81oChLSNOIT91oJnF6VNrJx2cIGCbXFU/1Z3fzCHKsPryS6
	EwqMnagwItGFxB5ER0AIuOHqdWTmyx+/n9ghx5mSWCT+w==
X-Received: by 2002:a17:90b:4b86:b0:366:52fe:e749 with SMTP id 98e67ed59e1d1-36e2eee0226mr4501646a91.5.1780514366160;
        Wed, 03 Jun 2026 12:19:26 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8573sm527656a91.14.2026.06.03.12.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 12:19:25 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Johannes Thumshirn <morbidrsa@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
Date: Wed,  3 Jun 2026 12:19:08 -0700
Message-ID: <20260603191908.5618-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use platform_get_irq() to retrieve the interrupt resource instead of
directly parsing and mapping the OF node via irq_of_parse_and_map().
This is the standard pattern for platform devices.

In addition, platform_get_irq() returns a negative error code on
failure, which is now checked. Since we are no longer using
irq_of_parse_and_map(), we do not need to call irq_dispose_mapping()
on error or driver removal, so remove those calls.

Assisted-by: Antigravity:Gemini-3.5-Flash
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/mpc85xx_edac.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 277f1c6bd522..f494d922c6a1 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -555,14 +555,17 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
+		pdata->irq = platform_get_irq(op, 0);
+		if (pdata->irq < 0) {
+			res = pdata->irq;
+			goto err;
+		}
 		res = devm_request_irq(&op->dev, pdata->irq,
 				       mpc85xx_l2_isr, IRQF_SHARED,
 				       "[EDAC] L2 err", edac_dev);
 		if (res < 0) {
 			pr_err("%s: Unable to request irq %d for MPC85xx L2 err\n",
 				__func__, pdata->irq);
-			irq_dispose_mapping(pdata->irq);
 			res = -ENODEV;
 			goto err2;
 		}
@@ -596,10 +599,8 @@ static void mpc85xx_l2_err_remove(struct platform_device *op)
 
 	edac_dbg(0, "\n");
 
-	if (edac_op_state == EDAC_OPSTATE_INT) {
+	if (edac_op_state == EDAC_OPSTATE_INT)
 		out_be32(pdata->l2_vbase + MPC85XX_L2_ERRINTEN, 0);
-		irq_dispose_mapping(pdata->irq);
-	}
 
 	out_be32(pdata->l2_vbase + MPC85XX_L2_ERRDIS, orig_l2_err_disable);
 	edac_device_del_device(&op->dev);
-- 
2.54.0

