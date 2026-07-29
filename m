Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D55284690
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 01:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288112; cv=none; b=F7wQ+8oc9SW34ZdW50Mg9bURIHvFWkmVvIg+VmiWhTth5z3ZpdtEoTxJIpkUxQRezIGbLPCmiloeBMrdBU0JQCBlACiaad3PrjiCVG07LwtwhiZ3mM7sGqFo0lASoINd7mh1evDqwRRchjy+XkRWxEXN2rz17Ky3cELbc0GCcLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288112; c=relaxed/simple;
	bh=abNdGUghuUIO8k7bkS6eK6CsPop8FaWjA2WWdW2gBW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vh8nhSU/5x/aG1i6JjVRKw+eS70YQsk3GeYO3FVDdr2nnS2GSShbVQa6m39A8AVVAqefry4MdZMbFh3Aiey5dleETI+pRKRInYhjzTy9ystZIQWbjmgwqYx0WSOz+VJ9Wj5m0RVVhMQXGmBVz9Q4zcu4taOr5m7PwNd54rQeMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUyEwOss; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUyEwOss"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so431031a91.1
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 18:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785288110; x=1785892910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqdKMTSTFZVK0AEFQ3HF5uOFZwylMUQ6eX20eOos/4M=;
        b=AUyEwOssot3g29VuzNBJYWNhle2G4fYBEtD10AsaLW5k+EEf5H/HwctG1kU1W4gouO
         R3/RswemGXkupUzwFBdZDC+FLjdZ3MnRG2IW+asJdMgSdbsNnBrBRkBOkbqWPIvaYveW
         daWZd7F+jiWbfpg7pnwqGP30u46Kqj3qNj77V5+vWhX7DV08268Pj/Ow73JX6E3fIvdJ
         fDcUxmw7PNqjFXh6uK/QovxNJmODwcJ1USUHoqPSukPETNI/uiQiP1bnxfvcdQ13daTf
         tLwo2fLNY+913mso3p98RrsvEMYzua9QVwzUdlK9P8pjdVkd2jU1ERO3lqmM/oxsPcqP
         XQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785288110; x=1785892910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AqdKMTSTFZVK0AEFQ3HF5uOFZwylMUQ6eX20eOos/4M=;
        b=ZviDbaCpHZg8YF+XMjKIA+a0WaJ+AaxkOcUSC+FRZAq4ekIeikdsS9DGmHOTS+UdYq
         5cqhfQ2FZoo6awFEw1hMQudItghcQ0j+MMWLt8QSSspqD1yZUp4RNh87cDCaa3B6VxMG
         MUUJUOBFI7biWzm6RR9H8FpJdxw4A1AUFnMJ3Ry+vukYjuftvj/xqpBVWwb1fXwD1uk5
         iQmmuCBhwKVbUnewgCgqCyHRhtDSREFxfqCbAMOdvB5/zlNQz3xiVbTJWugw6ezRW9iD
         yNwqDhKdAVfPuj5D1SyGqOnh47KWeRk2F8f9EkUCKlmVDhAIFgx//PAbIrXkqlJDeIwg
         crvA==
X-Gm-Message-State: AOJu0Yy0HbttKhTo7Rd5++402iahhC1802x5BIzmtMEmSnFO7UggUPKS
	arZgLNux/OzqdPFwFuFl9o2eG6z/bMb5FR/7evSarqS2PgJsdg0Nnpup/RuX0g==
X-Gm-Gg: AR+sD13kqVhd+B5m1TsP2tffL2HkeDV0k/u2WQxePF4GzVDhcV7eOYm4HEqDbmBmz+a
	HxnSAjcMIN5jzvwRplh33pGuQi8oHaNtrBzOi7QGvjt+Bl3QOHwQjHTckGBmqTh/bYFxTP9+tX7
	jApXjKjyUVwCVO3TvlMEgwvQcCO2YSwGNoNzPvAGUpd/ygobFg7vwiHFwUZnXXi3POAdiPtkj8v
	dZehV/6OfdExXe0AobK+bft7m53tJBFMkQEFk3gOWVSXJeHIHsOdcSUT9ZImA7RFCI+OFFvmCPk
	zNIjAIaTfp4rRYLa64xMtF9yz1j5tovBB9mXKG5gzfglrG9gFgYiScVKzeHRgY0/Wa5kmSWtE4g
	eAYunHTlKszxYXiKJt0JXZ4GOX+yTCXlXt5UL3yhK4GwjPwCB9cK2ihkVPnINH+RO/49ntb9dOd
	5qVqvfLzhryvWnVQuwWgw8D8nMOnJNrJAZWkneRwk/JjGE54TuER1OhQ8lh/fgBLwdGVO2w1nSc
	+vpP3l91t+M6rvrillZyNQ/ZJ08eb+uimkcLtnuQkDnL7h8X0Jkzbv4pzNtgJ/QTfRXFVhE/Y3t
	bMVhpyIoKyaTetOpRWt01T/bfrOmtePkQ9h6Sw==
X-Received: by 2002:a17:90b:3852:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-38f6a40f38cmr4599689a91.9.1785288110533;
        Tue, 28 Jul 2026 18:21:50 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f292be7sm557728a91.12.2026.07.28.18.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:21:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Tero Kristo <kristo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/ti: use devm_platform_ioremap_resource to simplify probe
Date: Tue, 28 Jul 2026 18:21:48 -0700
Message-ID: <20260729012148.615964-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() +
devm_ioremap_resource() pair with the single helper
devm_platform_ioremap_resource(), dropping the now-unused
struct resource pointer.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/ti_edac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/edac/ti_edac.c b/drivers/edac/ti_edac.c
index 39cc2ef9cac4..aac6bd6b0572 100644
--- a/drivers/edac/ti_edac.c
+++ b/drivers/edac/ti_edac.c
@@ -231,7 +231,6 @@ static int ti_edac_probe(struct platform_device *pdev)
 {
 	int error_irq = 0, ret = -ENODEV;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *reg;
 	struct mem_ctl_info *mci;
 	struct edac_mc_layer layers[1];
@@ -243,8 +242,7 @@ static int ti_edac_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg = devm_ioremap_resource(dev, res);
+	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
 		return PTR_ERR(reg);
 
-- 
2.55.0

