Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797284A35
	for <linux-edac@vger.kernel.org>; Sun, 13 Sep 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334711; cv=none; b=f65sg6fOOVRe+kMHduW7I8qxv6WgljkIHLaD59S7b9QZsxod7WG1EawfynJ5TPjkOIgFQyDPRMoMb3JqaN5io/0ynixYWe9LeYthyuX4nIr7wku5g7x8PSXGoRAglO79QKNNYGB7eKz0/NrszZHWhKgdgiOqWF6niLjvxq/Ild0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334711; c=relaxed/simple;
	bh=AAAwelguTPfjpAnL+vqAqkkChfEV0ObjfpvLg0+5NtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nh+6v5H+q9DMiEIbQ2rYxDFAN/i3u3Vt9xM+i8akfb6s/Pg49moTU18B2WFA92eYJS4VMBeVC/RKdp9Gtde26d984FJ0ubrpNGjuFhB5m9nC08RZGwZHuJB6hrGiE9fUJgTz7WHKoLa7GszCZc9VdzwETf3SCy5lWr+w2Llm7ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWSY9HYU; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWSY9HYU"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76c9deeso24918311cf.1
        for <linux-edac@vger.kernel.org>; Sun, 13 Sep 2026 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789334709; x=1789939509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTFAKxEPG/XZ7jFrqWix1l3HMof1CHgUjJhMCCQjkn8=;
        b=WWSY9HYUprVN2qPVLIUXCM4/ayDUfB9dCpyKu+RLYZ6Shi5fZyDb9E7dmO6/AYH8ap
         +8R0q4KnASc8Emux7UAXuFpTXGm8r36ExMWGo3bJZ17/kkcHcfT5alFVm68qlePsYm9Q
         nRwPod1L81Hgx/FMhjZNMAtG6CaUl4BA815vxzTWVKF/b/MyaWIqYcH1zRJfAMALwt8X
         BECouX8dp70EgwWD7VzAPmxEWKUiARbZTMjdU8HNt2ShaTnSwDxNI9yovChek1udNuAP
         5seowIkMO7izLQuisnHTwjH5DKRgaDpEQ0KxCmrAwUN/je87BJcoMCGZKX0xjq/OgBmQ
         7c/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334709; x=1789939509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTFAKxEPG/XZ7jFrqWix1l3HMof1CHgUjJhMCCQjkn8=;
        b=jQGhcavjDWnB1IP9kGvSFUvd6yZ6HjIAGnjv7H+O59F6sKw8uSMG4R6rKQpSSxHXkI
         h1FYxc6LVB+ZyFlVyYA7ocUdfmZA2dZIzANjaK4EH586DHupwSDTNZIWfwge5pqcSYrQ
         YS9C+v/6t0GBuvlBOcYACuiRQG5pbXdPrIK9ZuuG6nZnB4LHxaH1mQDKQnJfseHAIyu5
         yAIZESPCR355C/hsA22GD77IXWcz2Tl4yjPDv04F1TrCtFRACIWtMK7fJ8yUWIRVAYvf
         vY9FhDEXsLON6Hf/GIHUMmykb2QKGJQbgyyVjaOyqychbq4UmbGIav8uEmRtrgr5+lFY
         uqZQ==
X-Forwarded-Encrypted: i=1; AKwUvBytzSORTKT847XtS1pR9tn9jWG5s3UIh3GeWK1lz/WKD1X9/YJkwAo4KXWGhgraPIN+DjAehkSgKbTc@vger.kernel.org
X-Gm-Message-State: AFuF++kc9QaAdPGWyrrJg7VQyEnCnjxVFcDZc0nYzKOwOO7EIwspi2wk
	aC+BnO0jwtGb/+6ATfebAZgAsvPWu0KHt0AwrgTVlSHzg3TdUaeQxT8=
X-Gm-Gg: AYBFou2X1gdHyRN7a9te7j329+JFD49aVtGWELKySjRrHA+IHlRuj89GiEt7Vtn/kWs
	DQDpQ2BILWI2AF3LKB3a7LVie4Kj3joLgYPTWiKda/rlUd1l9v5qi2YTMZxWGXdW6vUyoKY6qnB
	BnmPaYxDLEVERjwxtg5K6Mg0GyPG8JczVCoM2ntYbQcCwJrTJGs/T44P9dRlQfo4PiU7WFoqLul
	+NbPhaYU0dQAz1TZA00R2TjwqLQJJRWwVOcS2jEiNb/Fy6Madu3EyK+mCJu0DdQCZCpptn8L3S7
	33ZvTTHSWvsH1G4kACNSwbux6gWte5GFWbEfB9rrNNgGuDFwXfsgMz6AbPHhx8/sZwsPEKu+CTo
	lqH+f4Ah6wUjK/nMAmiVhSNEuXJCzSZZbqBxWhiDAgfuPw5vBtxva20pXcKT3qEbGtE992wfxab
	TLPOFP6M7WqavKixT2PlM71RaASo0AmyUwlNHxYIbk2TKg6VSy99hMHf47zt3s/LVs5AjTnjc8x
	U8SaCr4OXQkf6Te3rKfxwzAJpMIMj6gNtlIM/YSeu+dOQSsONCrLtcYh6NcrhU/X/aMcok4hyrH
	AB8W9MmuBNekNAVaJQESq9JpXONA0K/CbA==
X-Received: by 2002:a05:622a:1207:b0:531:273:b5d8 with SMTP id d75a77b69052e-5310273bb19mr34117131cf.24.1789334709267;
        Sun, 13 Sep 2026 14:25:09 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca45b61dsm80714641cf.6.2026.09.13.14.25.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 14:25:08 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Jason Baron <jbaron@akamai.com>
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
Date: Sun, 13 Sep 2026 17:25:00 -0400
Message-ID: <20260913212500.60272-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ie31200_init_one() enables the PCI device before calling ie31200_probe1().
If probing fails, it returns without balancing the successful enable,
leaving the PCI enable count elevated.

Call pci_disable_device() on that failure path. This also covers the
direct ie31200_init_one() call from the module initialization fallback,
while preserving the existing return values and successful probe path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/ie31200_edac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index 6f5fdf43e7732cd23d54dc8392caed4ca7990fcd..88af77ee07fe367f692a89dd55f188aefe912e44 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -660,7 +660,9 @@ static int ie31200_init_one(struct pci_dev *pdev,
 	if (pci_enable_device(pdev) < 0)
 		return -EIO;
 	rc = ie31200_probe1(pdev, (struct res_config *)ent->driver_data);
-	if (rc == 0 && !mci_pdev)
+	if (rc)
+		pci_disable_device(pdev);
+	else if (!mci_pdev)
 		mci_pdev = pci_dev_get(pdev);
 
 	return rc;
