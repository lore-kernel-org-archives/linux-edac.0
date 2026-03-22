Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C72366077
	for <linux-edac@vger.kernel.org>; Sun, 22 Mar 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195455; cv=none; b=uWST2g/zmLIdHJGapkd+XWqtonzOL3BrdpqZWRog2tfx/hW6IFc3QMDtaPLsUXzrVPw6NJ2pzUbvgwrTrqOsMlfO/JvR/nWWW+gFo86fMmHfBtVzM+b4rDBPgvEwFaRI7YRqsKjPHc7S9KoWoOifxUjEezhAMjnfccGHILN/uGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195455; c=relaxed/simple;
	bh=cSma+RNhKpwiwXY2OWkOn5Im7/3nZ04i8GCn8P//2R0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cvUD4bKGbnfWOdZQbjyKrBsSgPC8Pc8wD0FI+ZUrmkiAdK41cTNro0MQxYqBHcb1oub17I1E0MErRl0chzxCRK1v889DIK2aiVO//mcux406w22xtNO20Dxtzm3ezo5iJ/Xzvk1Faqcnx+Q1hHEttHK66krSXo7ZQPs3XZaV8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luZWB/dT; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luZWB/dT"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1174086a12.0
        for <linux-edac@vger.kernel.org>; Sun, 22 Mar 2026 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774195452; x=1774800252; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYBv417uwONoku4BJAZzKSoN5vmSBmqdTeAEgxfrOO0=;
        b=luZWB/dTBbIti6qtZhVCXwnaToWsaBe/S7BIu5cYJ+nBuOStMzIFX0lqU2+zMH1xPr
         v0K9vvlc9Agj/woUIZEP9wjoDppDtXvqXBxlFvmt0krxGwBMgPBHBO41JadDksaSj6G1
         YV94hU319dt5NIp3bnt9QNSr01F7KsYxwtW2UqUCgwzmMf7MzQwaVTP4L27h3Zvvgv5z
         GbQmL5KOAiN6eMTaEKMakOiX6rwEFp2cYmMkbBv4XD2KYaiLhVhv+wWEj86Y+An5NY2/
         msnVeJ2kJ4N0AXIDC2wdkdZ+5GoYT1R8lae238W/xvnUB6qxvh2XVMeyJSdJQzj5bPMr
         xnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195452; x=1774800252;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYBv417uwONoku4BJAZzKSoN5vmSBmqdTeAEgxfrOO0=;
        b=RgSPszeRVowS3wOj+OB2KSAkpjWgHoM7vHXDot4AS7oB6FXF71HGq22XqzELobcIok
         lm74Zuddl4s4fgRxU2AgZ6Y/UPQOlQFc1mzZYjBMMoYMkJsg9cVXcvrFpuCIjYeIYSw1
         mJInEyZd4nKLqpYL9nJBVHF9M6wFipRGLul/htt66b8CxqS0JPHjP48sUDZdilWYrpV6
         9M7GqQpz2FyFe89wEAUQHSS+4yjW9X9r2qfLgnGIUHYx55w86N7Qm438M82cWcs0u6XL
         c1skR5+NszjbBf9VZtQR1XZK+MSc3o2G0eHxC79OFBTECMZHQBFpenjn8zRPSgzkojgw
         PYSg==
X-Gm-Message-State: AOJu0YycYmiVHw3HG85JEFkHjkzrSeBrk7b8eU5I97wMDx7S67D0ebEL
	PJDPl+qnTTjZf5f+Hn7l/NlezSJpXuy2LEtm9mCoOu/075rc3JFL4FK84/j5xLeGoAEW+A==
X-Gm-Gg: ATEYQzyHeXRy18DX3/vmsgJJYoio2EroOFLcEKXlmEpIAw1w60x7PlUN8QJgQt8BMjL
	BEtrgYU+53qy7sg5KQ/bxceuYW+HoaBCViw+QS6wDJYA521iNWyAcfmxJUul4vzfILANvfVv92f
	TSK3WBr8Tij2xbjUeypJlolUUT+zkzDq5y+xjj24pMjKmKLCogTgxsNTVAsHd15bbnR8d4vK1nf
	G6rtgR5i+OS7EN18z0sqq2I8I5MAG6ficwFTz7p1XXmkpPMWYk280SbqaNZbNakigOdExVy7HG1
	GA5/4lIh6h9hXZhSUFmQ/XNugaqtFoTp6Ac+MWOLNPP2lKBy1cDHNnQTVKktolBdq+e7J1HhFa+
	71wQ0ai0flOLF50WxW7PJt07jO14TWLt2uP8TjVNLv/oPpWTaQwV/esrKHmvEBkJYHE5GoW0qkI
	/HanHzzsea3szn4WvUuuejirKZp09NddIiH1sr
X-Received: by 2002:a05:6a00:368b:b0:824:ae74:571f with SMTP id d2e1a72fcca58-82a8c35de62mr6869798b3a.40.1774195452251;
        Sun, 22 Mar 2026 09:04:12 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bc66b3sm7381045b3a.21.2026.03.22.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:04:11 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Mar 2026 00:04:08 +0800
Subject: [PATCH] edac: versalnet: Fix device_node leak in mc_probe()
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-versalnet-v1-1-4ab3012635ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAPcSwGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMj3bLUouLEnLzUEt3UVJO01NSkZCMLg1QloPqCotS0zAqwWdGxtbU
 Adq6SulsAAAA=
X-Change-ID: 20260322-versalnet-ee4feebc280e
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774195450; l=1423;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=cSma+RNhKpwiwXY2OWkOn5Im7/3nZ04i8GCn8P//2R0=;
 b=RQcBszhzjsA1+7puHMsABQ8/Mu4rzdakNPwBNBBUf9TSuXhfb37HvfFpjEAGrDSGxjP2MAQJU
 BefTxxcdrccDhdvCj6+QhIj+9cAEvd4TKLypKRk9k6v6NETBKXSGdml
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

of_parse_phandle() returns a device_node reference that must be released
with of_node_put(). The original code never freed r5_core_node on any
exit path, causing a memory leak.

Fix this by using the automatic cleanup attribute __free(device_node)
which ensures of_node_put() is called when the variable goes out of
scope.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/edac/versalnet_edac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 0b47ed7fed63..915bcd6166f7 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -888,12 +888,12 @@ static void remove_versalnet(struct mc_priv *priv)
 
 static int mc_probe(struct platform_device *pdev)
 {
-	struct device_node *r5_core_node;
 	struct mc_priv *priv;
 	struct rproc *rp;
 	int rc;
 
-	r5_core_node = of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
+	struct device_node *r5_core_node __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "amd,rproc", 0);
 	if (!r5_core_node) {
 		dev_err(&pdev->dev, "amd,rproc: invalid phandle\n");
 		return -EINVAL;

---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-versalnet-ee4feebc280e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

