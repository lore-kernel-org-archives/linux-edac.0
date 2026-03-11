Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FB391832
	for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 23:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271618; cv=none; b=P/gqNyQVPRA+X7DQex3Yde129IquBxoUBJiQxc/W9v+az4cwD/7H4nZEtX+/ip5iPGqFVcNKdsZGBBgtkgOi64Wz+mVJWC0MfkfgtXOuxo579QJ3NeBlve3K6nXcUud3B8RYnSn3rya3/oU54ej+8C65h1XNwT+m0QsCJdcNOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271618; c=relaxed/simple;
	bh=Aeamlkyrp/Tri78LJI5YT+eY+rTSWMhlN4ljcbL+1vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKvhd+puiZYZ5bpmhV1k4W0uE20Bba7GltjwhfpZDz4RnmgT3gy0dvgt7NDV2iWAlDflzh+ZXrnGWwPowo3CXSD7cgV06BHPV6KKykctxLRRQF8Ru3H3zlNsTynpKq5q3uk7qgP8fVPhwB2oIdDZIDjhyKvUriW4pu91uAkfhII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noKHxHOQ; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noKHxHOQ"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ca09f2056so351487d50.2
        for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 16:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271616; x=1773876416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xE9cexzHArZthFPt7zjFOtjoKCh1E9B4tVZ/2MEZ4pY=;
        b=noKHxHOQfHsxFAO0lu9heJVZjvhB4c2TKJpddDzPT+wEFT+GlTuKYyy1EhuE3ZyVOc
         9D9b02eODeT/X+vdwprTFzTGisSyX13suaro5t4EKsuviokaG0JnX3OsK7b692LYBKfG
         qezrrAijd6iPTtxPquqiRyiuPCxkeruK6TTzws1ZrSx/PhAdtBI5YyjPWKnqNJOlVsw/
         dnCEdXFxXZo5ePYMLh8ad2xSzduwmam4Vv3mbT2TGeb+ZxWm1IL7JDQlstpeoWfrlU9j
         0Six0iIeIfgH+xhFN0lIUh6JHYn4Ua3xkSNGTl5iDU6SpbMjeWYmRkZ5c4wEzDycbgrV
         Gu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271616; x=1773876416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xE9cexzHArZthFPt7zjFOtjoKCh1E9B4tVZ/2MEZ4pY=;
        b=ay/InCBW6n5PUwWcj2ryyqcLECUic6ry6YhiqAaJMQvB5RNuP7a/LkztgIQnX2j41D
         HvjZkfVR2Bxc3PpojQwAI0XbsDoXOcdRgpZN1MqO63BER1VbTc+M604W+ufBrxGfdla5
         2qOFvJgICAlvF60f9S6gvj0GXXA5gxZTNeEoc2qQg+atJ6oE6kSB5gsx/myuGZxtUt+/
         hDmOtgJ8TGVtwqVZQm2PQIjU5Gonsb8esUCYryPovJs+eqjeOafyEeSt9fef4CiT3dWb
         qH6OhNjwT78E15MhXKZ+7cwU0oer/AUrj6ElByopAcdXRFChgS8/78rm+JcBL14ztJ9f
         bC8g==
X-Gm-Message-State: AOJu0YzIJMVbZA0bjAMNbvkqaPzkAD2wC7BrD0JXXksZNCtzl4AnKaoh
	+tiMi7caPud7OsyCvxfXrtw7XOwFyrmLp2vJLgegwxHhZ9HTv9/Kym+djXqkjP6a
X-Gm-Gg: ATEYQzzv24SEUn/+MtfL/2BYeim1N1FTA+WYBHpcYXQjGlbonWo2KyJN2T3quoo8D1q
	ftFWrdzk7HtUiqe2r91qhDShs4cY5B58Nmsb8qEXm+geL1trkfqziA8eFBpr4U+d5cj9z/NU+LL
	kKbXjPtUsnZmgQCRcWPdtGHRt4AYsSBzzMBfUjv1SYppiITvSriyTg+/X/daBUQ2VyNvQma6vbz
	hCkDRPZDs/VXVNihjSUKJzl00hsIkoc5D+8Kb9f5kDVc5ypMxPuDYGLLXVc9lbmn21znZWg/5Vy
	IFmRFYSiomHwsiuO3Y/fPg1c4bbSzegAmT4fWsoc8z93PpGtEna1S+Zf3neVfXUUin1xpICGxyV
	2NZUHrRX27f4EuIQ9WR2eglQf4AmAHefUen1Z0RuSUFZGjHwpLBozcq/ZUklEZzYVNmQoFfpBYT
	Y6suUYIm0FhamXRlgf8wkr4Wl01+DhwgulxeIkl5dYjL7+Or1rwD0r+w==
X-Received: by 2002:a05:690c:6:b0:798:2723:ab40 with SMTP id 00721157ae682-79917ecc38fmr42758297b3.22.1773271616175;
        Wed, 11 Mar 2026 16:26:56 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917e2019fsm22517987b3.19.2026.03.11.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:26:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] EDAC, i7core: use kzalloc_flex
Date: Wed, 11 Mar 2026 16:26:38 -0700
Message-ID: <20260311232638.18585-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocations by using a flexible array member in this struct.

Add __counted_by to get extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/i7core_edac.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 0f783173d0ec..b87c4c6471ea 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -240,9 +240,9 @@ struct pci_id_table {
 struct i7core_dev {
 	struct list_head	list;
 	u8			socket;
-	struct pci_dev		**pdev;
-	int			n_devs;
 	struct mem_ctl_info	*mci;
+	int			n_devs;
+	struct pci_dev		*pdev[] __counted_by(n_devs);
 };
 
 struct i7core_pvt {
@@ -455,18 +455,12 @@ static struct i7core_dev *alloc_i7core_dev(u8 socket,
 {
 	struct i7core_dev *i7core_dev;
 
-	i7core_dev = kzalloc_obj(*i7core_dev);
+	i7core_dev = kzalloc_flex(*i7core_dev, pdev, table->n_devs);
 	if (!i7core_dev)
 		return NULL;
 
-	i7core_dev->pdev = kzalloc_objs(*i7core_dev->pdev, table->n_devs);
-	if (!i7core_dev->pdev) {
-		kfree(i7core_dev);
-		return NULL;
-	}
-
-	i7core_dev->socket = socket;
 	i7core_dev->n_devs = table->n_devs;
+	i7core_dev->socket = socket;
 	list_add_tail(&i7core_dev->list, &i7core_edac_list);
 
 	return i7core_dev;
@@ -475,7 +469,6 @@ static struct i7core_dev *alloc_i7core_dev(u8 socket,
 static void free_i7core_dev(struct i7core_dev *i7core_dev)
 {
 	list_del(&i7core_dev->list);
-	kfree(i7core_dev->pdev);
 	kfree(i7core_dev);
 }
 
-- 
2.53.0

