Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963429DB9A
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 01:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288207; cv=none; b=BFMuqm2SlhbQruJbHYU6HdrK1YazIG15Xdz6nCUFQZIu1PAoku7lhwGcNEwq0ArHR9b5xL5pEJiWmQDJkN1qTxmZhqWCiVIKzJImKa+LIyb1YGh15L6lId3GfvdhpGZdvQkK3Umx4PEe5vxoFM7keLcJmgSLl3rJyJjRcmpPr98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288207; c=relaxed/simple;
	bh=ruyCAl/d75W453410VelrLvh/Qfpj9qdc2hdxBMy15I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WHU3viLExyQUTvfbaLzmQPwLbtTDvFHu9SGH9J/YN0zMrR3dAQLlz5KZX/UPZUgdV/5JZm1SW1Ur4+ZhxWpDylHrbzhCx76OoDGARSdUioLGoinaBUAbg6UQCO2ZAvL01kGfe18Nsp4kcU8ZohZUg2RSeE+0yv0+UvEl2IZ9RgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/2Tg6Wi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/2Tg6Wi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ceae1ed204so5887065ad.0
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 18:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288203; x=1785893003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AGRW0GPVXdo/+h/vfV0tTRF7kuY/c8KFwUfzyJ8FbM=;
        b=n/2Tg6WiVuW1RyAD/vL1y34Xot70OI7D9mMONLaMpnJTagUfWFKJC5n42yEPlxN1vx
         bi38Cw3H1wEuH5vE7Hr0vFPwlgKZ863ij+l1bUZ8Z2trTTspldLA1aEjcxtGWLRPRjvk
         3B6WqSTu2pjGKc4Ctx85NOtbkPwdPx4XLoNPaq4sZeNkn7zrHtBr5Pab729+r9hp6+9T
         FkMyUXy6L2FeOPTNxqV0GzHs4CXeB15Qy3jxKP6u65Ej0gL0ufFzzZRZYn4hjpTqHY4t
         d1PVz1pBR3zh8Wxyroru5ftM4r8A9rnJYjUCPJlI7C8ZPsPa9lHu50FIcj4O2DtWdJHJ
         0UCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288203; x=1785893003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AGRW0GPVXdo/+h/vfV0tTRF7kuY/c8KFwUfzyJ8FbM=;
        b=Ie5l5fbQzz8b86CLP1VHdqy0gTyVVp/CnLJSllkffrJCQioeXM/fhZ86i9rRIJbxnm
         RMzvtKcm+z3FSzf5EbYsXx9dPg1Ldk+3GcoNQveEFFbhCg/c4FTr5PQXx56QSGo4q71J
         xGwe0B40eBPZWC/xqv2z8cHbOoEu+55O0JOatpebZ7sgVEgQ7M+n/ZD3xIIjzCNTj538
         w6D2Ec6MBh9DIHVsc7if5PFEWjJRAEdKsoNdCXUOERwJyeRmpPC2LG6u1ONIJjOmhCNp
         xtN8JiUniHfhEigGUp0SzQg714WAxsgK+E7ybXTV5sSTvz2p58mqUUSB1u+uDoqFWfBs
         ljLA==
X-Gm-Message-State: AOJu0YyFKxKM4/e4yLe14TA/8klXyn4/hsnFvtqhnRYs/MYPfr4Couuu
	47qz9c4OX354RLWZ6NpIYgFOR0oNNNtObaZpaVaK9YysPdFeU77oYKFoqw6rRQ==
X-Gm-Gg: AR+sD11I7OoQicwpEALjIF2oKKjeZ6S5cThafWFKskrAeAMJsxxQ7Gmpqq8zcM2wNM5
	lwLJVWGqKm/gh0Vp18OibslHpD9Sa2cPwCUCVL8Ri2Yyjs/ZbRS6lNwf09hXxNw8ilrAsPyf4xV
	8/Be3XAbTNnQi2LQ9mc9LYDPJiKrOO8ZdSwl80/RzITxhJiWztwgbyC2EV3LGDj9U6XExutbUmV
	YycIfiaKo03/ZEOs/CUeYd4C5XMDXmqsKBXg5pyY1NpRu2+0rjl11gEcb7IjjlEbya9dOjhlJ1W
	bF+4J8kseiOoux3njCP6eD3Mv8nKJ7CTRj0LJmghRPSDO5u/5nyc+f1/q/+G/7pVRvIywLB7xyf
	qJLOyoiT3Wvm/GaWEV4zeBY/dMXet5XtT4Ta2ky1/EgPH6wqGIdgXO1YCmfsIBnveOdumJG5pL5
	1auYDkcrw+yYY3pl8NayW5nFK4uOeQQ8i4nQCrJ2vdgvSfCK5XR0W0NuS6WAimoBG9ox4p4cAnE
	hNBRvveHXpck6T2X4DaAE3+qSYBoO4PYIAR47bkBpLPy3vue0T41xBtzR7Ch3wXZQQaDlR9STnx
	sXPMc/KYCY5xPbBzWXcrHe9kSEgjhn9FnZMuOw==
X-Received: by 2002:a17:902:fd83:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2d015d25a51mr49814735ad.42.1785288203225;
        Tue, 28 Jul 2026 18:23:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf7cb7sm3329575ad.68.2026.07.28.18.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:23:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Date: Tue, 28 Jul 2026 18:23:20 -0700
Message-ID: <20260729012320.616174-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to tear down the irq before edac_mc_free() to avoid a use after
free on teardown as request_irq uses mci as dev_id.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index f4cc89b26954..f1ddd1f47f2a 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 		/* register interrupts */
 		pdata->irq = platform_get_irq(op, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		res = request_irq(pdata->irq,
 				       fsl_mc_isr,
 				       IRQF_SHARED,
 				       "[EDAC] MC err", mci);
@@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+		free_irq(pdata->irq, mci);
 	}
 
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
-- 
2.55.0

