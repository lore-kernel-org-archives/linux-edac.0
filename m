Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F7E355F54
	for <linux-edac@vger.kernel.org>; Fri, 13 Mar 2026 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773439017; cv=none; b=a9JuxHIEkoW2GvHwGb1M5d2wpCyOggdo1mmTfFAM77hzVn7rphkzbXQ+NlIM0RzDnNEWkgrS435gAsSTwBtBeVTr3ChOUjfsz1hsJeHGcB27UvcvQ7pesiaY6AcULTJiBgkveuQdUTwZd165HjmoO1+9A/FM6RXPnP1K6A58kyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773439017; c=relaxed/simple;
	bh=p8xoIArBlppC30RwPeF/veB1TKIg57IxMIAFYPp1Avc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KF9rctAHRJERiV2AekT918m78FppJFxX9JhNnbFSls/dYHxh8qg+oDr3LSNTbis+yJg6DZt8fCUqAVNOWXzYl74LSefKoOPx7kLi/v1vNg1ZGUcE14LiarHwqmn5RpaiyPOtodWAd2eeBDLfolhAiy6Jixr4mHqYeKM12aBtYMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVetRbZj; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVetRbZj"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c73a12af63cso1593110a12.0
        for <linux-edac@vger.kernel.org>; Fri, 13 Mar 2026 14:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773439016; x=1774043816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWNsUFZ1Eksh2ypyDZx8PXfQxHNZvOE2Wf+PolOcJnk=;
        b=CVetRbZjWF91wFZExEMyz1juHqWATFtlm3hQMneThDeDTmce2Lc7W55lEntPRZTdlG
         SX3GyqNXd8rMldJqhgf/bWkkqmTKBpcYWi5Gj+jug3915zz1pG/N1Ua68aRBOk2yQAMM
         734UoX0v7v8X4qU4NPtl4AfSE+ywnglGECksDa01Z5e/pVo7gH4pJDII54S9nYcrwouG
         GdPYkq4xclfSp8ynh4+0pkx9+yshF/622vqjzlFYBtAUdcsOeNhbkA9RcgQ0TdGhAU3T
         B+MErMB9YTmVKNMTOFFCjHkoxE1UuIRxuyr789L5RRcklnBUhqjkL38hfjFDcviMPdv8
         af2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773439016; x=1774043816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWNsUFZ1Eksh2ypyDZx8PXfQxHNZvOE2Wf+PolOcJnk=;
        b=KKhNdurOfGoIdeXBIY+UaP9V6Zu+shS4qXVzBwzYDHPWOAJHTfrG9ZeaAZrKOIYBqs
         m0Ktg+zIHZDTOPBZNiWpiT26iDPzyPWr5Rgp14KtzimgWnI+qSOSZfC5Uqo9fSFCB15S
         CuGE0W6e1HWYu0eAih7o8Iad1VX1yXe7siU3BRoGza5TvfL4PmP0xFf9u0R62Zqcus1d
         pw8yiMYvXrSGnQ0Sn3OQEhbL6hNNqTXkzow5K8mRNZGKQ7CiGIcJdr+2/UlqzolhIjOM
         xSLOeCwZxeHHhCgqdMYeOByZvrJgdsUx46wPdTjvaY61eFVneszfatlGh9/GxKaR6ZKK
         cFVw==
X-Gm-Message-State: AOJu0YzrPcf/4+BVO1ReOGKEiaJcr8QDiygf1d5VLC8S8NL+Xi67ubo7
	3nHvJFwe8ARt+TpjzyWw/d6ANyTJgSW7Pk7aPvfEKhMcS/v+a5gRrGg1SaHwEFTq
X-Gm-Gg: ATEYQzys9MDsXUCcxcmotJysmpUN+zMW56iR+YMFzFEJDbtSxUx/cbyXTIbIr2Zg6YC
	d9YB3VJ28u8t8mHQ7c9uX8SFMQ0TavwDd02BqEWVDfQv6KbNk4Pv9tvpaLMhStxtNnBbE4uKsTd
	N/vNa0vm8F58Ok6J5BIioM1BmJR3CaXagaWlsOhnYwIF9us2oYbNL2tfes7EeXoaX3nZ3SR1L42
	f1FDmhj2WdM8mW9PufU+XXk8MymTVPRJMbUy0w/3vg5HYUyeigYNvIRGLL0QSTqKjvpNGu7a45b
	aa3QbI3OdHplt4Co/8Kzj6JgsBm/x/bRYmLW9S1aV7TTNOkcw63uwAae7IncxD2MDcP6k5jvsUV
	2OVGPdZ3pvQHD65x+P36Fj4ZZo9txHkFDdMVwGwXEdMaXcAZ4Pr4Av6F/kUi3JelJN50vBQ9E6J
	4hxZyqw+g8riiIGwZhbwC6MygwxUim+60yUo8Kgfn47/pklLUTVvH2SvPkLW9qaAGJ
X-Received: by 2002:a17:902:c947:b0:2ae:c795:6b37 with SMTP id d9443c01a7336-2aecaa48f77mr49883485ad.19.1773439015829;
        Fri, 13 Mar 2026 14:56:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece5c9737sm41513475ad.25.2026.03.13.14.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 14:56:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Tony Luck <tony.luck@intel.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] EDAC/sb: Use kzalloc_flex()
Date: Fri, 13 Mar 2026 14:56:37 -0700
Message-ID: <20260313215637.6371-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocations by using a flexible array member in this struct.

Add __counted_by to get extra runtime analysis. Move counting variable
assignment immediately after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 v2: change subject
 drivers/edac/sb_edac.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 09d4e816404b..7b282dfd093f 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -364,11 +364,11 @@ struct sbridge_dev {
 	int			seg;
 	u8			bus, mc;
 	u8			node_id, source_id;
-	struct pci_dev		**pdev;
 	enum domain		dom;
 	int			n_devs;
 	int			i_devs;
 	struct mem_ctl_info	*mci;
+	struct pci_dev		*pdev[] __counted_by(n_devs);
 };

 struct knl_pvt {
@@ -771,21 +771,14 @@ static struct sbridge_dev *alloc_sbridge_dev(int seg, u8 bus, enum domain dom,
 {
 	struct sbridge_dev *sbridge_dev;

-	sbridge_dev = kzalloc_obj(*sbridge_dev);
+	sbridge_dev = kzalloc_flex(*sbridge_dev, pdev, table->n_devs_per_imc);
 	if (!sbridge_dev)
 		return NULL;

-	sbridge_dev->pdev = kzalloc_objs(*sbridge_dev->pdev,
-					 table->n_devs_per_imc);
-	if (!sbridge_dev->pdev) {
-		kfree(sbridge_dev);
-		return NULL;
-	}
-
+	sbridge_dev->n_devs = table->n_devs_per_imc;
 	sbridge_dev->seg = seg;
 	sbridge_dev->bus = bus;
 	sbridge_dev->dom = dom;
-	sbridge_dev->n_devs = table->n_devs_per_imc;
 	list_add_tail(&sbridge_dev->list, &sbridge_edac_list);

 	return sbridge_dev;
@@ -794,7 +787,6 @@ static struct sbridge_dev *alloc_sbridge_dev(int seg, u8 bus, enum domain dom,
 static void free_sbridge_dev(struct sbridge_dev *sbridge_dev)
 {
 	list_del(&sbridge_dev->list);
-	kfree(sbridge_dev->pdev);
 	kfree(sbridge_dev);
 }

--
2.53.0

