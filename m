Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C033ADB0
	for <linux-edac@vger.kernel.org>; Tue, 15 Sep 2026 01:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437335; cv=none; b=V8AK5Fx8ipbe7YbhgyEwqYsQV1aX3raJ2M6elkOsH+fszJZvig76RxrTj/DqjyWHzORdPCzD9Dovl+VqgCftm7Xg1iRy59HIhGE6WAcJXId30FvF9Qez7Ylify57NffvPp1OJwoGPT1lChsAAbWGOH2LpvgXe4rbqghNnbww8wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437335; c=relaxed/simple;
	bh=H4sOniYLWo6+KB8DHXp68YHJ7qte+sqivFhogKC0E20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQFJdcfLI5xJpS+x8gWEthX1U7PLybWG/qBhsUB3V2p8N3D3S2ahQPtm6fTdvz1H75tTibANGTyJiFo6WZi7sU5ZRBlshymaserbZQqrOl/TZy34DkAeo+t0kQKMbAqQzOQEHdVbi6jvtk8VBzWwmSPbyy2qpDOn/C0JuXVIA2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUY6W7KI; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUY6W7KI"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-530ea5dafd4so32695561cf.1
        for <linux-edac@vger.kernel.org>; Mon, 14 Sep 2026 18:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437333; x=1790042133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiIvJCNExljMSljYlzye2b1G5pTXXWKqhzAs8LgW/vk=;
        b=JUY6W7KIpVOulb7t/xW9eD9JTVGNgk7pntYkjaevhtf8+GXqvGNAmyxwls8kr1BE0s
         n2jReTbFh7bphN5veGmmBK7LyvF7tq1mh40oJWnvCb7ZPBfInp6CjN46t7Xkj5kawIPY
         PiqsHYjCb/HbxkpZB+bnKhi81kyyF5UfeHB+6Yg01pIYft0ur9oZAIvjDZ30Ws0w+yUE
         6o89HcdzZY9HtnEW9jG+XT6ivcTL7J+q0cIQaBAlgKRRkrESsEtbScy4cvsUuDKX5rXG
         7NZu5uySQ9YIigwDyafrh3H9a+vQEmvxU1fRzr6xdU/FeAd3fRaCdpXqTIiZ6u0cDtEU
         vUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437333; x=1790042133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AiIvJCNExljMSljYlzye2b1G5pTXXWKqhzAs8LgW/vk=;
        b=OpA7WCGoOqDiMZNyKxKIxHNDxj/rxszKC2oDt8lE8wr4GCbHxsl0+lnOH8pDoXAYC3
         Id1PcAqdbr91LKU7S51T3iCN3BszxedyP6Lv5lQvhaOOADjAiFyjwbiQ+CfK56yCvsvd
         /sAUfiqeA7/qf7xLPMwRiRyoTCiLCGct3bJhCYtFEuGbErLivj9m2jmARn8I8lcS1w4H
         WsXlLZ2CWZnv/ztEwyh8IW8TVuhgjf3cYB+kpRs8uGjeaVKfucYe2pFHGmHHwKRhoDcG
         ge3uSeZW1CvRAMZwtyM1UYiVc13AJA0awI1kd0G8L3ApkU6Ukkiaz74JQjLGtGYw+4YK
         ty7A==
X-Gm-Message-State: AFuF++mM41Dl/ixqO+HQLT6p+J7zzzkvpm6zYWFaGgp/r/6eh2obbipb
	ioKE4fLA/l8cpjNtbUaz4adUflMNWKpbSqL4MPmG2qFr5IX0lBLWfio=
X-Gm-Gg: AYBFou31lhouwKPABmrcOq4nrg1qXuowXEO11Gcbo0qh3v184ng7+bzEmVyVJuznmX/
	TCWYkp2cMJl7wrAJ9tWLuTxtECeJO0xq9tJtzNyJ0CgIID8XWg91VmqgTJB3bfJF/Bwo3lt0/2m
	1BtCgPyqnHDnPDE/sV7voMojVxMvwEUXMr1JqxolvsXbr7go4J7eZYsotAYepcERw6Tu2BBT0Su
	23MUor/8+b71XyNLpN3ohz9C6hqFOYPcL5wEHQHzkJVP5PJqdchtqEqLWltI2oPbabU7dIZzhUq
	bNDAM40mR28zXbfDO5Xrq2MCuznO+DwE0rqz/WQEPc/ypnSiauHo2vLPgUdi2aPe353tkwOTX5A
	bcP8zkN4SIx/X0CIwGP5V6aScbAmuDyqiejPHB8CvKYkcEytn1n8Egrko0PUZnGhCGN7tCB5ZTv
	MQQkYFX2dK0ML+Di4cu8R56OsDIWk79jZoFig9QtUqn5g7rK1QtZeheSOVzuYONRsSRs041wfYB
	qwj8/kZc8AbgbIKzeHN5ZqJgKq3704+1IbNKYNgZKAJUgCq3i7noo7t/L6Wa5HKTmO482PEfIlS
	lDZxkMc4eJyS4VOVnvp6ez71taeNAvjvA6hHjQJKfkwkZlXq0iyQ+0ngAyvOLctBlvy4Ow==
X-Received: by 2002:a05:622a:2285:b0:530:d491:d168 with SMTP id d75a77b69052e-5310d03093cmr74722151cf.34.1789437333195;
        Mon, 14 Sep 2026 18:55:33 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:27 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/3] EDAC/e752x: Use managed PCI device enablement
Date: Mon, 14 Sep 2026 21:55:17 -0400
Message-ID: <20260915015519.83833-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915015519.83833-1-mhun512@gmail.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

e752x_init_one() enables the PCI device without balancing the enable
reference on probe failure or removal. Use pcim_enable_device() so the
PCI device is disabled after failed probing and after driver removal.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 806c35f5057a ("[PATCH] EDAC: drivers for AMD 76x and Intel E750x, E752x")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/e752x_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
--- a/drivers/edac/e752x_edac.c
+++ b/drivers/edac/e752x_edac.c
@@ -1387,7 +1387,7 @@ static int e752x_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	edac_dbg(0, "\n");
 
 	/* wake up and enable device */
-	if (pci_enable_device(pdev) < 0)
+	if (pcim_enable_device(pdev) < 0)
 		return -EIO;
 
 	return e752x_probe1(pdev, ent->driver_data);
