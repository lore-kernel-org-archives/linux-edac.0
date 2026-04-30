Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B753263F44
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586469; cv=none; b=ntCsu6erZiZJorcghM9GZe7n/1jbO6W8inzXWv2n0byelkUl2b5FbcJnCjaHTg5fmPlIM9A3NqYlGkSWrlsoKVovUbZ4QSSdwmGa12/V/YQxgVWKkY+WKlPls+NDfE96NElPlwIGe56j8zEQ3s37n8tr41irUv8nNbfqBUATACg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586469; c=relaxed/simple;
	bh=hSO61MEHDuljEoCwQIOmP8GW7tSE2ESykmqtlCrWhlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJCvMtGa8sVkDJ6jviJb2R/4aXDDk9W6WNvBqpmC0inWu+TwuDExCDSkv5+Xhu3WGJZOPa54UjhyCPoBQapTPF9DdXaBT0vVy2pe2+WJ0qILG+0dkRZuzFwkVOGHfM59/LC1yuYMAzeIr8UQVM6MLqG1mZOYpa5pMRzGsJXMsZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zad9R65j; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zad9R65j"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8296d553142so979618b3a.3
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777586467; x=1778191267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQ9C3UXbI8sz5or31IBXbObkRFxJVWeprKwndPijx9E=;
        b=Zad9R65jXGPtl8owr1iPMYeeJXWRl8e3iVug3cwrGXnl/F5mHk6RtpGJxqfhmL8v+m
         1zfTRjsQ4WrOS6bYH68e7A9UittMNR2g+iFyBJe8XZwUQSH2QE1ixCZiYqiPJ9jFXZBp
         hK4DgqUdL9u2WLil7maB0lTcaEXdZIEBUpCNVdzRk1S9ituLkxmCnwoU09kPy6cEXyU0
         8IxT8ySYn/m8BTBpbNIo64ZVp3sFH9fjROic2C3oYMpUjQ/pLUWbcktDFnl+gHdT3JCy
         MxJYxEsYFsNVxRJBDepxYWWGZdRzQ8/6oXDLvqYqRb19V/uaqe1tro0wxu23+MrJx22w
         uMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586467; x=1778191267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PQ9C3UXbI8sz5or31IBXbObkRFxJVWeprKwndPijx9E=;
        b=A22usl3+OXjEkQCbAcoldtWMgQ6ewBDp9mtFqFJSk5Luz+S+eds2/hdfOeA+KALzf7
         PmOaHLQRidWGqRWS5r+ebiCsjDY0/TewPZ+SOHmc6pOSKEC3i8lIhYOiiK/VJQuea04A
         C/j6ZdpInnHPrXAHSPsEiU+QUshKAXWT1YFwDlG38uV2yQKrDgbuX3f+xFY3qmwMY3f/
         j/27RBDMyP7eFofN79RyCusIUoHtkapS0l6JtCdP6iebC3N+nxLjPL3brxUm/R34MUET
         wre1rEgPIXNcNW4dDtvaQtliyPKNBMOZ0yw/Wu5QvrC5K84LaZW4EiRfMQ80qmHvvyAe
         0N1A==
X-Gm-Message-State: AOJu0YxNFFcgCTeT3qvGcXejhmwZ3rpKsdezuv/nd4o0XiE7MD+ZoeOY
	fd0lsOpahT+fK7U9IwnX24nd343QpfEVpCmt8amfv6qmZTe3isjhmf2RSlxU0g==
X-Gm-Gg: AeBDievSa6QaSsiCXVgiH9g5VT3GCD3hWPZZAMEHaU31tgrdWE8mhjJz+C+sV+FBInF
	3nylXCEqP1ychmtIBYebU6KTJKk4Cyjao7Wcbg62rDkcWhTzzIrRnLbOXGN3rZgexanCPn4yLHK
	MA2u3gttxxbNeQCwB/L/hDQ5K1zN7oDKbLvK2o2GSUeI5B09V5YQwiFXvXs0bbydTteEA/erzQr
	djDlK/0Gp6a25cgXTbli9J++K7YMEpi3adx6UBdEMQ9g/pQngRV5fkDdyKPO0IKytZv4xrB4b8d
	pvuZypkgfPoz2tWkr/KYIa0PUVGvFlPKP8XJYRdQqMImyAd5w66F52CnKhVvcZXKbB9Zp2xNWbq
	3VfmCmQ/ejwpNY6LZ3+dHAO/YwvzGVBRSmmVAFKee8yrdnjd+u1HN7HKRM+ZWdRSRkuf7I8M57h
	tBRzMqsvPKmwBAdKbseeuLShHsDLWUOH/GWV+IVh182pVsMAjNJ1vCeOHMEiwles14fOmhIhNYG
	2ZQw4ZxjKCh7uJfCcEGrE09mSSaW8Vbokn3aP/WDJTliw==
X-Received: by 2002:a05:6a00:301f:b0:82f:2d48:f906 with SMTP id d2e1a72fcca58-834fdb82c41mr5623569b3a.12.1777586466805;
        Thu, 30 Apr 2026 15:01:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad7873sm614130b3a.38.2026.04.30.15.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:01:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 1/2] EDAC/device: simplify info allocation
Date: Thu, 30 Apr 2026 15:00:45 -0700
Message-ID: <20260430220046.72371-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430220046.72371-1-rosenp@gmail.com>
References: <20260430220046.72371-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine info and instance allocations.
Simplifies allocation slightly.

Add __counted_by for extra runtime analysis. Move counting variable
assignment to after allocation as kzalloc_flex already does with GCC >=
15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/edac_device.c | 23 ++++++++---------------
 drivers/edac/edac_device.h |  4 +---
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index cf0d3c2dfc04..9c21997a50e0 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -58,31 +58,25 @@ edac_device_alloc_ctl_info(unsigned pvt_sz, char *dev_name, unsigned nr_instance
 			   char *blk_name, unsigned nr_blocks, unsigned off_val,
 			   int device_index)
 {
-	struct edac_device_block *dev_blk, *blk_p, *blk;
+	struct edac_device_block *blk_p, *blk;
 	struct edac_device_instance *dev_inst, *inst;
 	struct edac_device_ctl_info *dev_ctl;
 	unsigned instance, block;
+	size_t alloc_size;
 	void *pvt;
 	int err;
 
 	edac_dbg(4, "instances=%d blocks=%d\n", nr_instances, nr_blocks);
 
-	dev_ctl = kzalloc_obj(struct edac_device_ctl_info);
+	alloc_size = struct_size(dev_ctl, instances, nr_instances);
+	alloc_size += sizeof(*dev_ctl->blocks) * nr_instances * nr_blocks;
+	dev_ctl = kzalloc(alloc_size, GFP_KERNEL);
 	if (!dev_ctl)
 		return NULL;
 
-	dev_inst = kzalloc_objs(struct edac_device_instance, nr_instances);
-	if (!dev_inst)
-		goto free;
-
-	dev_ctl->instances = dev_inst;
-
-	dev_blk = kzalloc_objs(struct edac_device_block,
-			       nr_instances * nr_blocks);
-	if (!dev_blk)
-		goto free;
+	dev_ctl->nr_instances = nr_instances;
 
-	dev_ctl->blocks = dev_blk;
+	dev_ctl->blocks = (struct edac_device_block *)(dev_ctl->instances + nr_instances);
 
 	if (pvt_sz) {
 		pvt = kzalloc(pvt_sz, GFP_KERNEL);
@@ -93,7 +87,6 @@ edac_device_alloc_ctl_info(unsigned pvt_sz, char *dev_name, unsigned nr_instance
 	}
 
 	dev_ctl->dev_idx	= device_index;
-	dev_ctl->nr_instances	= nr_instances;
 
 	/* Default logging of CEs and UEs */
 	dev_ctl->log_ce = 1;
@@ -107,7 +100,7 @@ edac_device_alloc_ctl_info(unsigned pvt_sz, char *dev_name, unsigned nr_instance
 		inst = &dev_inst[instance];
 		inst->ctl = dev_ctl;
 		inst->nr_blocks = nr_blocks;
-		blk_p = &dev_blk[instance * nr_blocks];
+		blk_p = &dev_ctl->blocks[instance * nr_blocks];
 		inst->blocks = blk_p;
 
 		/* name of this instance */
diff --git a/drivers/edac/edac_device.h b/drivers/edac/edac_device.h
index 24c1921aa490..4562461a3e8f 100644
--- a/drivers/edac/edac_device.h
+++ b/drivers/edac/edac_device.h
@@ -203,7 +203,6 @@ struct edac_device_ctl_info {
 	 * and the array of those instances
 	 */
 	u32 nr_instances;
-	struct edac_device_instance *instances;
 	struct edac_device_block *blocks;
 
 	/* Event counters for the this whole EDAC Device */
@@ -213,6 +212,7 @@ struct edac_device_ctl_info {
 	 * device this structure controls
 	 */
 	struct kobject kobj;
+	struct edac_device_instance instances[] __counted_by(nr_instances);
 };
 
 /* To get from the instance's wq to the beginning of the ctl structure */
@@ -341,8 +341,6 @@ static inline void __edac_device_free_ctl_info(struct edac_device_ctl_info *ci)
 {
 	if (ci) {
 		kfree(ci->pvt_info);
-		kfree(ci->blocks);
-		kfree(ci->instances);
 		kfree(ci);
 	}
 }
-- 
2.54.0

