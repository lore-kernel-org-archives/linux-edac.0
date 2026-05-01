Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA0C1E834E
	for <linux-edac@vger.kernel.org>; Fri,  1 May 2026 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777664927; cv=none; b=bBOcXK+Re+Q1pngOn3Ynp1ExSFk627A/wUukPmdguNIp3GVZ/2bFAH6COAUqocxmq6ctRbgloRNz3RLW2W/D7adzWTxUMX2guluIeVPYBS4toiVQuBl1dkSEAKXVeH2DrOZ9JJ7c9HkxdJkTOhJT5VNI2mpl8cwrWKXY65QDKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777664927; c=relaxed/simple;
	bh=WJMXInZmFBx6HOEw1UZsj3+POF5+5i/PCDf1SGr3LFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TzaoTnUeKuby4gWafTX0U+32EXxicyZCBjaFFIPy83d+s5p93nRvrd+xFZNz7g7xXMWaCfDClKSOdl+pdB2CqNuW0Q//Pu6ryWXoCMuI062J0BegiPXBBLL9j+NNWOywncLPA9nPcAzWthOujhOVaEkqHu8ZAVh8B/IYQ5KS4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frHBqAOP; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frHBqAOP"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8ec37d52c0dso239088285a.0
        for <linux-edac@vger.kernel.org>; Fri, 01 May 2026 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777664926; x=1778269726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUxeqZ2Vw9GET762QSAUrhNN6QjAzRCjS0LIx4gFA8I=;
        b=frHBqAOPrb7P2fM52aTgMbuRleJKLeyCNVHAY6Tp2wP8Cg4S9PatbUdbLTGNeYfgDz
         oNQq+iKWpkE9YT3SeJkw17Ga30AVVs2y00qTeawm6kU2/9EdC3K6HG4rzPWwFJOvDUEM
         NXDr9DgEgWMp9/d3PFhNRR/YdWpmVfyp3g7ZCSEUAn3j1HWDkmEZhwliuAbj+UzQePmf
         QpK8RCpvK48rrajUarhVs/UNo+L7Bcudz5/tC0/OmwE4hiKkflxUb0dufNyo74QIhxwq
         Bsa6xzQzVVxnoisryfAoINf+iv1LUfow0FFUoAdvRqbHbqn/DDX+4841oTAbfZ4fwhmV
         7L7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777664926; x=1778269726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUxeqZ2Vw9GET762QSAUrhNN6QjAzRCjS0LIx4gFA8I=;
        b=IVQ9NRJHHUIVYw5S2Ls3EZp4oFEv2urtapPkM4KbvYx/Rcp63IAsPbVPItAlNzNpHe
         v0aGIlsWheEspYdbpVdlawt4E/dG5/MpTwyAiODYi2QtL6GS1pa5Uywg7JomaFd1SDZ+
         OUpTQzrwqEj0HdvZi0I/QVnyKKrhmXw7HW4wkpmHyxkBMSfzMAXRjeqOyrcAvnBFcNDp
         iwxTAaeeedCBjnf4FD4pO7bGLIYRmmyNWiPaj7WEboJZvgQcuRVOuA6zUlgTQzjSoUPw
         8uaM1w146nJKfcXK6R1yoELrBp+M8Mv8l2FY4RaCO55T+PVKtAgCT+1jjM69uK4nNvQg
         /cDw==
X-Gm-Message-State: AOJu0YysODvp+pJewYqZI2bSoKNADsNCuYyRnv90JnS0256XiHUShXYt
	20eX70O3Z0qQuBCq0qA2mtyY5ShU+MSIZky2fZFKpsv2RvaZu/54NIPK
X-Gm-Gg: AeBDiesCoz8QXacStDtyAQmcL+CXnL6DNVbjjHcnGdL7MCitbPy+3cKf1jlygXu1x5Y
	3fqbf3r88SSjIE/r55GeNg43moPY6Z+bcdeMT6tznyIFO/WNsIXKMpYKiH3DeJJNkI58nUNzHNt
	Yvn5qr7VEAyyNaWqzyW/suxuSI8jVPTRE2z6bOJuQXLCBx6p2OY3z5xjPsKVM//wI8701RZ/ma/
	2rKmUMfia1o3fNfggDX4CST+wI+UZVReGjH4PpNi5wyVqBHiRPE7IT3dAaotwjQS98TAI3HVJUW
	dgubq6P1rI0FJDCihN8oGlZjLF7c8/bGRngyPMU6Co2aoKXdtO8e6m70yMKKkjkBPzY6cQm4xCb
	jvfYiL9eD7CIkS2rnOD+lKERGFH0rwGzuW0NCMrPrCP6L4LoLwgNGExKYNjwAjBtpv+C7+63A07
	WXeKiK0CMkTB9GGOZHJaIEaP6PCFxFVJAJMqvnQBkjBP6bcm7qUac=
X-Received: by 2002:a05:620a:448e:b0:8da:d152:b7c9 with SMTP id af79cd13be357-8fd17d4bde3mr124156785a.30.1777664925612;
        Fri, 01 May 2026 12:48:45 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253259sm242437885a.24.2026.05.01.12.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 12:48:45 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] EDAC/altera: Fix SDMMC PortB OF node reference leak
Date: Fri,  1 May 2026 15:48:38 -0400
Message-ID: <20260501194838.2682274-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a device node with its refcount
incremented. altr_portb_setup() looks up the SDMMC ECC node but does
not drop that reference on error paths or after successful setup.

Route the exits after the lookup through a cleanup path that calls
of_node_put() before returning.

Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/edac/altera_edac.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db..a2fb30a9b914 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1526,15 +1526,18 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		edac_printk(KERN_ERR, EDAC_DEVICE,
 			    "%s: Unable to allocate PortB EDAC device\n",
 			    ecc_name);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto out_put_node;
 	}
 
 	/* Initialize the PortB EDAC device structure from PortA structure */
 	altdev = dci->pvt_info;
 	*altdev = *device;
 
-	if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL))
-		return -ENOMEM;
+	if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL)) {
+		rc = -ENOMEM;
+		goto out_put_node;
+	}
 
 	/* Update PortB specific values */
 	altdev->edac_dev_name = ecc_name;
@@ -1607,13 +1610,16 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 
 	devres_remove_group(&altdev->ddev, altr_portb_setup);
 
-	return 0;
+	rc = 0;
+	goto out_put_node;
 
 err_release_group_1:
 	edac_device_free_ctl_info(dci);
 	devres_release_group(&altdev->ddev, altr_portb_setup);
 	edac_printk(KERN_ERR, EDAC_DEVICE,
 		    "%s:Error setting up EDAC device: %d\n", ecc_name, rc);
+out_put_node:
+	of_node_put(np);
 	return rc;
 }
 
-- 
2.43.0

