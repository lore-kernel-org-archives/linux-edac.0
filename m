Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1D72E7398
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 01:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460338; cv=none; b=tgcvTm3c/astmWhXLrY7GVx32ijy3NxmW9eY5SPBYu98qJyc1KsFk/D4/y/3Q1Pd1gIIBjLPs+vFdtK4jPUaLGq7ZwWRRf8+NfHGp44RdLF4/7nFQP8QrXGF7DXLjXC6VYSFWXniNkUTN6XkOyKXwOZmBlO4LwmYYDMosTVRIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460338; c=relaxed/simple;
	bh=XZgZLRBGnrLz7UxFoKVt8SOA3rG2AOHrDekOGrXRxzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2h7UqKIfyp9LSBAWF08OdA35yj7z5Wb6iiTwxpIlrkQtlQSIIZCKOEUg51dVNVJcgqQs2dZHT2Ju5GDVZSFtzYt3EM2EC/YFDveC8i0xntxlEGxhSqPgWPftYEQDwlb8jZFfFHa6CVXOhgEVET2BIg0f0YTjSXPVF8OrPkUvcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQ6ET0zL; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQ6ET0zL"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-930f4e5eed1so28024785a.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460336; x=1786065136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAyiS+iv9GtAFUXbLU9tJyvS5gv3/Uh8uF2gqIgEVxA=;
        b=EQ6ET0zLq/CqHIfJoMm3N4gQCo/PschLpHd8tRuKBdj/Pi7e97H+r8ebnEcixsDaTx
         5/7HieJIKNw+2Z6Ktgp3Uz4OsyERsA8o83J6zSXYy8oCrz7sMT92zeW1/dmTBvSH4ES0
         yHjIxBXnzOCyqxFhUWxBcUZQDemjG8BTYnl18F4mo8K+oIsr89TX3YeeuYC7Xu9UYvmy
         bQrRhXBkvXagLYbcpJHCqOmPnGNFdiuCEB721okmw9aUk9cGDQvvZ9aKYn7SqqUrQQfL
         ECoVpW6VIsw8FutZgoDemTbSjen8QpR4t4hjsZyXB0A/YbxhYm66ZKF582o+4AYMK0xl
         3t+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460336; x=1786065136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAyiS+iv9GtAFUXbLU9tJyvS5gv3/Uh8uF2gqIgEVxA=;
        b=f7yPrx7kbd8gXi/VUBs7VpJEvwOzlwyO+sw2zOPwv3D/7io21lU9uEQtQrWlla2qp8
         mW+Ykg7W4H2UZVKc6UvEE7VsgWSojAcBRdM/PxZ7vbcCI+IswbIjGre2hUJ9ZDEAGpx3
         /pHHhFAE27UM+3PePog3AkFFvoe3WpvUCF4uTJgZC+fMaHV36Fpq8IHF6JakmnUFmcxK
         axAZTxKLAg6OZU5oDeQ8OJvpdtSlyIBatEryCXB2DlIsuNimWzFnvtjPq0T2S6imTgiq
         BwBbb9TWz25g8pkVKqZuvro4aEE87dUDqxpBV0c7CxxsychYy+2lqAWDLAu9HfEQX+NC
         0o8A==
X-Gm-Message-State: AOJu0YzcGgbP2nkuLe0LXf5yT4BOK3Ct3m1ue0i3vkEBfjjFapcdERWU
	Q6/o834QK/NJOSnbxC/WZHy16O2ScaKEy8oUA0aYCzhW0gUM2v3sLKQnaXbqbQ==
X-Gm-Gg: AR+sD11mxAee0QCnGCrZRAJ4FUw9I1d1zqKjn5McvkytSUUFa791Gj+Ww7y+jW4M0kf
	0TwO/wc2OqSHjMsiPfc+AU9jKylxqs6og83e99QSVEGKY9Cdv3660lKbAag/rc82p68dkw8Li3P
	lOPJKe5gdzqaBit196/9+s7UfWJ0YOE/i0qQwKTMLBj5QoNWo0uyxV2Ycot82zZB0+3TVHM1b0a
	cmBXEsucrCqBdJX8wW0D7XF2dC01gizub9XElWx2+Re4pIm6rCPfn5ZIKpy8c1y7sJX9woyppjm
	COctpIqlv5bp+S6q3L1vErVx1VcG0Ic6O8dHnz9lIltMm/x2dqa13+cNmxB90vq2qcx0mLhycj+
	0L94e9efm5G9rYn0BM+AAiOc1g1UQY+fDOO/txKSAH93S4a9A8ooaml4QghyKsRXvw7jOiLYcgY
	10Vz8AuskodV65qgtqMRyoDPpb3rKsiLr1n+1/3WIBYaVlsmkAM2uPIEPaKLXSL1yfqnFv+2RSW
	C0e5CBueJSpVLh+V3sM60QHrsq08sn74DponutcF5U7qPSLYR9ak6mnXOM+6tXBY4nGcNN9cXY8
	hm8skUHvyu5nTU2kFuNmjhfZyYj/2T1wX/9huw==
X-Received: by 2002:a05:620a:198a:b0:92e:d677:45c8 with SMTP id af79cd13be357-934965b83famr19916385a.25.1785460335882;
        Thu, 30 Jul 2026 18:12:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e735e0cdsm533543485a.42.2026.07.30.18.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:12:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/mpc85xx: don't use devm for request_irq()
Date: Thu, 30 Jul 2026 18:12:13 -0700
Message-ID: <20260731011213.1211378-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use modern irq acquisition APIs to avoid having to call
irq_dispose_mapping() since there's no real need to copy the mapping.

Use non devm version of request_irq() as IRQ need to be freed before
edac_device_del_device() to avoid a use after free issue.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/mpc85xx_edac.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index a78d702674f6..651d14b01e25 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -253,15 +253,19 @@ static int mpc85xx_pci_err_probe(struct platform_device *op)
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = irq_of_parse_and_map(of_node, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		pdata->irq = of_irq_get(of_node, 0);
+		if (pdata->irq < 0) {
+			res = pdata->irq;
+			goto err2;
+		}
+
+		res = request_irq(pdata->irq,
 				       mpc85xx_pci_isr,
 				       IRQF_SHARED,
 				       "[EDAC] PCI err", pci);
 		if (res < 0) {
 			pr_err("%s: Unable to request irq %d for MPC85xx PCI err\n",
 				__func__, pdata->irq);
-			irq_dispose_mapping(pdata->irq);
 			res = -ENODEV;
 			goto err2;
 		}
@@ -304,6 +308,9 @@ static void mpc85xx_pci_err_remove(struct platform_device *op)
 
 	edac_dbg(0, "\n");
 
+	if (edac_op_state == EDAC_OPSTATE_INT)
+		free_irq(pdata->irq, edac_dev);
+
 	out_be32(pdata->pci_vbase + MPC85XX_PCI_ERR_ADDR, orig_pci_err_cap_dr);
 	out_be32(pdata->pci_vbase + MPC85XX_PCI_ERR_EN, orig_pci_err_en);
 
@@ -558,14 +565,18 @@ static int mpc85xx_l2_err_probe(struct platform_device *op)
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
-		pdata->irq = irq_of_parse_and_map(op->dev.of_node, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		pdata->irq = platform_get_irq(op, 0);
+		if (pdata->irq < 0) {
+			res = pdata->irq;
+			goto err2;
+		}
+
+		res = request_irq(pdata->irq,
 				       mpc85xx_l2_isr, IRQF_SHARED,
 				       "[EDAC] L2 err", edac_dev);
 		if (res < 0) {
 			pr_err("%s: Unable to request irq %d for MPC85xx L2 err\n",
 				__func__, pdata->irq);
-			irq_dispose_mapping(pdata->irq);
 			res = -ENODEV;
 			goto err2;
 		}
@@ -597,7 +608,7 @@ static void mpc85xx_l2_err_remove(struct platform_device *op)
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		out_be32(pdata->l2_vbase + MPC85XX_L2_ERRINTEN, 0);
-		irq_dispose_mapping(pdata->irq);
+		free_irq(pdata->irq, edac_dev);
 	}
 
 	out_be32(pdata->l2_vbase + MPC85XX_L2_ERRDIS, orig_l2_err_disable);
-- 
2.55.0

