Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC433D4F0
	for <linux-edac@vger.kernel.org>; Fri, 14 Aug 2026 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786683274; cv=none; b=FqLqbfy1wlET4g71UVukwaN0rdGAOBPMDk95bv7e4ctuLsP9snAMfjDY9Ae6lpWlwRHJ3fkPUBnpfQI0k9NxyuH5r6sjwBddVVkQVj6XiQr8zO9w3nwm+DvITShEEd1Xq+ZTuOn0dpeWQcyd2KrySWZEH5RJo9Jtw/Vv5dK/3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786683274; c=relaxed/simple;
	bh=ciLA9/0CvxUVTi09iV/ng9qyi2M/3iBcMy/BD1oAyu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ANz1gnk6I8BgWoP1RPSSNk7qg9eu5jo7beobOdvzoHhkNeJT1H7CSi/LuxaTseGS5F9pCRH358Q66h5gTiJl8bDmmBmAAGQp1crSXx77imcSS4jaiJEXf5jA2K/mIE0FeFNPedCkvbJyw3mMDsYAaI43AhKr6hXVvDlcEL6hIfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCB5ZiWP; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LCB5ZiWP"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e347638adso718136a91.0
        for <linux-edac@vger.kernel.org>; Thu, 13 Aug 2026 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786683272; x=1787288072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wDBbBt18eV5juf49KKXCNzd4XlMk7Rf10mjPIDLpkKE=;
        b=LCB5ZiWPsw+rW3pprP9IMN3BlCe4U+89zIo/jf+SKjcKKU9I7xFkoVg21E5+uUeJGR
         M5Aa8n85/vMLXwTaFm8QmufSHSa1bsdDOuFVuf7CXsYUgrNiGd5y0mUEtLCKcAqLfaRU
         I2URreuECWMvCjR2NzvA1AqExSxWtrglraNtdKj4Jd5UobCO+9eL9vF4PwBzDp8WdDg6
         5dPXI0kxy5Ztw3WhRDug11GblXoFi89mR/g0Nn6BP4qeoBdkFONvUgD35jjZ0RMsXdWV
         4jBHzvwe0DMAozYTRYE+YnXeBMeTjIsS/ibPepnnk06cccfLd82uWJ6wDpyC5xoWkPMG
         ir4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786683272; x=1787288072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wDBbBt18eV5juf49KKXCNzd4XlMk7Rf10mjPIDLpkKE=;
        b=UZogSeBdoEDh7fBqFIhJgVw6Pb0VBNTZyKuqIBGoz4RzHTSh5Lbyeelco0YP5cD6BG
         jIk0q7JhfeYOQwPMZbT6CMNQiAFfWUtHrYKygbVpq4P0zN4UmG5pQ+sycMZdlUPSiI73
         fEQqUCuwEt3qfNM2kOwiURw2oTKE/8ls0aFhRxz/gIY3SFnM6POWP0vMwqkmLjIRIdOn
         9LOxA8lre+d2TEn6h73JM+S5Ef8Jq8Lwxb2S4IZSLZEpFBLeWubItKsnvZnpT7BwCvod
         NGIVKpnjCYPchAmfGZDm6/HvgcisH/kJLrSnQ5komAkBHS4ZrmrVV369ycySHfF/pY5G
         AsXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr52b+R1sbgp82Q/Waeg+gakSXkU5ZxDAhxPFSYqCSf2q63bxXah8oS38+tIjVIJICoanOo67ImfUrc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsn3RD+98NKDtSptAnVK5AUvN14PdZskauX8zUS/Mz3wYhEBlP
	uLXNsK1hnNubyCvURAC7Dr7anohSPhU8b4YMMmgm4RCqnhXegHccvXpz
X-Gm-Gg: AR+sD133Ry6OTprgJlpgFDHVQpksg4x35FAXxhGFrN3HqHPc6rVqsDW5c5FNfT2YN2/
	Xl1rblvagziH1T+9yEuFhASbukt3IWC0BEltaLH1EtcmQGeOirf5fZN0HO5JAx95EtDOgWT0JIb
	e3wvmDsgp9mFL/4ln5tlmpenZFJ5fTPycDke99GqCSnFyH6OVO3LJbagaWIyaecjyFRXYmCb4Y/
	+peyOg8zxBxUraEDuV31Mq+1EQ991npc2vtLhFcffJhgJgjJRfgqtenZsWRrxSjlh2Gah9sGQt0
	6BAALwOOILVbvBIadsmnbFkn+Dn9JfE9bSD3WGvIfBnnfbtMxZNBeCVwZPuM051SOYx4VcgN26+
	pFRLiCBQVW8OGTCUMdnVds4+FR6U9NIOWHofbfNCU4UBlSgXrIb8WyCx9XRym5opWvEyobDRgzI
	/LCX3MFyL762jMy0Bj8o/lheqO3BFStskkmxZudjN7yoX8Oz0S8ptrKXqTFGd9k8HNAy2UAcKv3
	l+x1C6lC00it440pmsA16ZbE95wLOu9c1jNfcMOHbXy8tJ+F8/B55INt/ioatqpMhadvTxd5RGI
	RA6D
X-Received: by 2002:a17:90a:e18d:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-3933b764d23mr3635810a91.8.1786683272515;
        Thu, 13 Aug 2026 21:54:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339ce3016sm617844a91.1.2026.08.13.21.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 21:54:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Khuong Dinh <khuong@os.amperecomputing.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] EDAC/xgene: Use platform_get_irq() for IRQ lookup
Date: Fri, 14 Aug 2026 11:53:47 +0700
Message-ID: <20260814045347.13841-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The probe function propagates any negative return value from
platform_get_irq_optional() and aborts the probe. Therefore, the
optional IRQ semantics of platform_get_irq_optional() are not used
here.

Use platform_get_irq() instead, which matches the existing error
handling by propagating any IRQ lookup error.

platform_get_irq() also reports lookup errors itself, so remove the
redundant error message from the driver.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/edac/xgene_edac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
index 9955396c9a52..aae7e03b0573 100644
--- a/drivers/edac/xgene_edac.c
+++ b/drivers/edac/xgene_edac.c
@@ -1915,9 +1915,8 @@ static int xgene_edac_probe(struct platform_device *pdev)
 		int i;
 
 		for (i = 0; i < 3; i++) {
-			irq = platform_get_irq_optional(pdev, i);
+			irq = platform_get_irq(pdev, i);
 			if (irq < 0) {
-				dev_err(&pdev->dev, "No IRQ resource\n");
 				rc = irq;
 				goto out_err;
 			}
-- 
2.43.0

