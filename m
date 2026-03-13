Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC0B375F87
	for <linux-edac@vger.kernel.org>; Fri, 13 Mar 2026 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773439160; cv=none; b=u8U9G5VC0DzJSrKAxYl+YeGrCD6yy10ZafUWolX1rXLVmjFmQvnykufG7fhgFIACaQslJYC8qs2EaPV8t+50k5XOFkYA/cj65u8RTixp7NgJlxe9V/YBp8UH0HBqoVo4Xq1efYOgfP5bmjMKNs7/R5WUYz/YBjgIwT0Fo0mi82g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773439160; c=relaxed/simple;
	bh=tnZSHpQFUD4e3XsdMf7OhRHyt80RmLLxLzOFmS5r6yg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVWsHZ1gpc3Rf2gup7+3rI8VqMgPEzZJxxEYBVTBtozTpoxuafddv/C5yLbyGgoVZzL5QIJz7FO7/Rtqnn6wG3ayzNSW5wST7EKSDieRJ8u+urxp+ke9w+tBRgDgJrNzAO1cvpdPp20XWMlFPiyJMWEr5hkdrLdyr28Vg/84zzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ghsm+eUT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ghsm+eUT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35a1a36f0c0so1458944a91.2
        for <linux-edac@vger.kernel.org>; Fri, 13 Mar 2026 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773439158; x=1774043958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMGP6NrDc2l/cDWCsF6VnZBoId1E/2ANAkyblFCOTU8=;
        b=Ghsm+eUT6J+ww9QUIbB2cc34XRMIc3vkXKllPWpKudBO1dG6Kp9ksKzLQVY9Zxz3oX
         DhE3LaxsOzXO0qOg4t24bRtZRjo5/rEI/0g896iHdlD/K42SFMn0ZjfOhwD5zoWHw6QZ
         /ZtXP+2UGLLOdWGOCgszMAJTpoEB9ILTYyAfaz2ogO7Ss2y0GlnSQNCoie/tDWScaf6s
         hbavDyEpaT+4ezcOhfcbPP0GsyBjRm7agKGOaLrM3vujs9NdHCIIZONV+Lhbq9ny+LV6
         8Xw6gqtjEz9GYPjFbFff5KXEHP4Zm+2Ace7VBrutcL9nlkvfq5UFoif6/7lWzK2ZJBXu
         A1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773439158; x=1774043958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMGP6NrDc2l/cDWCsF6VnZBoId1E/2ANAkyblFCOTU8=;
        b=m9skUSfk8cWBrK74qQcN7BkcCrFJkMEdfA7HsUhO08iuGD/qwsGyLxt1uivXticMYM
         QkoCSMwmtVX7MU7Uwgeq1rUOLN1GaKtEo4gVDrYGKTdajUgx6IzA853LAHFrusCuf6xG
         cu7ptFRV60MrTVqPLs5uXTQCYh5k6jrJO2H69Pj1JflqJ+MwtIqFAt21wFD/HRw+4/Yj
         4WMNN2u3IikgfwZeSDUDjArCEJFvONXzOH4hGmADTPr+3ojSbp+uC+g5tJzsxxPeX3Rs
         fob6yA3jhuOBZxDExr6xg6YSYEfEHI4LapN2zLUUsg2jc+WxF21mATlx1NqrXk6ngCzP
         rmYA==
X-Gm-Message-State: AOJu0YxsUBj16u80OL9Qx+tbZ7ggha8sASKKGEvnAwob1bpompWckezV
	b/0iH15lyE8A7aJQSibN7xLh0j6nwp3bCjDNtMs+XoK8KoR2Q2AAP5UxftEqPQR+
X-Gm-Gg: ATEYQzzwVHwLirRAxnpsy0YKkJFzbbcijfEJaPHt69nwG3mAFLGGiGzaA0GtfNRUE5W
	OiaFxp4ui3wUV8nwkdvhPjn6domv3ES4dHkZpRsRva5LTXxzaDY65U7IaMfkzEUxW8R/qn9mMLp
	W8+PPMXbiYL0fCtkjFBcY054/l/fhwpnJh7g4fH6UZjs15VBlWP8NAje4SdToxc/+/DiQu4Ii2M
	yNRQwQ55Xiu2/rR0v4RFiYZ5Un1G2Cp8n1RdKtVwVGgQlxJ7xDvLl6Ghj0rThjLdO9orvXPWiKq
	K0/mh1KRwirTomy/lMXmOCV9pxEbDXfihpuNPvyVcth+z9qwkve0E6u70oCBx7eUxZ9Em2eM0IH
	FzLIT6Brwx0u9o33xfuoblLFqGGCDLCytYuiBZSmvUwzdZbMg8w6cjwkvF6K2sMq87OmprnAtiV
	9GlbnBuhWaOnop7WRxCHMbGHKJFyqnGTD61fMFqGyMHgQtrA/lFsw6ow==
X-Received: by 2002:a17:90a:d006:b0:359:8e1c:53e with SMTP id 98e67ed59e1d1-35a220b54d6mr4474536a91.31.1773439158195;
        Fri, 13 Mar 2026 14:59:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97c960sm2673529a12.4.2026.03.13.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 14:59:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] EDAC/i7core: Use kzalloc_flex()
Date: Fri, 13 Mar 2026 14:59:00 -0700
Message-ID: <20260313215900.6724-1-rosenp@gmail.com>
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
assignment to right after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 v2: change subject
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

