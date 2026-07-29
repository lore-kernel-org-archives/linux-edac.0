Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698272459E5
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 01:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287177; cv=none; b=jqO/Yg/HA3iTqzvEI5E3DBNK737YyIjKOKAVWBGpjTPGgfAZSOdYhUDwLFDm9V8l1Hs6fXYYTSd+saWKjEhnLPMmda2+Nf7Ps+tZsGWrwD2a3XDPulODq/O+LG+xM0r9dz+3T1KzTT622FM7mhESpAmDYDlccTxPKaYVIF7Jed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287177; c=relaxed/simple;
	bh=T5IjCjOJrodc7fhcJnxghWuloAoJ3cK0L9MhlqRcjW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IqqMRB2wRRxlTxXm7UPEHEpLe6V6XIprzk8h6WCU9CHHOVWInsrMbapbBWBaZ5/p/7BD0Q/zJ2mYs7L4P+o7yQYxWY+NGaZby68WQr8yw6PBcwy4I9m0zo6HI9lLt1UzdfL4BxWH6tFAuSq1a18mwqSKzmIUxPDEdM+NC6rTgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPZ8Cgnn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPZ8Cgnn"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84847482584so343163b3a.0
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 18:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785287176; x=1785891976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=28woVQ5e39EeLg3xlYHy6X58JzWK3j8h7TCqWlJWO6A=;
        b=GPZ8Cgnnjgeu6W4QDzb0vgpwFqaRKWE8YNcoL0pqWADNnVVfC4EHy0yxc+nmztMy3t
         pl3BJkYqNpPrefCjt3oMblEmy8EhVEGiWe7O3JE6CfPk30S+HihNkdur9pG12peq74XU
         Q2IZLErBfsVnvl1KJvZaDBJL0WgAiesruUQJEY6x52Pr9sYPXsvNK98VScXeRTDjMDqE
         DaXaFTeXVz3HTOiwiyfO4K+BSsNFu1LiBLVLxcVeE3LtXN7w8KKeryKa1T3dgxrAK2Nt
         dnR7tZhsDrrT2Ipi0L76QBXLoMZqcXztKJ4eCN6dNj68Gf9TDrtSStcSX+GCkFh9gxlk
         IPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287176; x=1785891976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28woVQ5e39EeLg3xlYHy6X58JzWK3j8h7TCqWlJWO6A=;
        b=oOKYnMWdg9h2rLl9OnW8UKvLOYnY5Ypy21PyYWwqHnm4NWTcFocPly8x3mQ3SLmE1b
         Wya1LmGLExAEmZpZxIpvY1ENsC7O5KZk6aDguk30PLiE6bWFxmvXdcKdyhfO532sMwE6
         2E8fD288bhTCvS8eKyqVF/3dfLTu4+q8JlvdU8/bVcHf+O4vhtVQslMBBNNxRZqu3dCW
         ErOh/1LcmpE5qYVS2pamjMoTAQz2VkrTM0PSEmvCfxBp00D8aVtWiQMpI2XuxfW2W/+m
         Ms4KJ362ZdGkKSg41XfmB1+wtrFSNggKMDiMPJAxGBIiJUs59ge772WZ9iChfqg/xS9P
         ohpg==
X-Gm-Message-State: AOJu0YziuiK5EsHuGzmCF1BQv+RqzKhZocBOVHlJpf3N4XuinUVb56d5
	Svm3NAogDsO9adtJ9gFsHV+sOFq2EPKGO/JPilYXRuSE6d3rLkgBLAiDf45+nMWP
X-Gm-Gg: AR+sD10aIJ5ywbRXXS3w1nKB+c+H+XsnBSGJrgJoWwnYrxFl1FJDRFAjCA8CHJaZj8S
	u3MUQ3TXsBN2OopJJOyTOsC2ikZ/kiIHU/CAaS6yPuoHYAahYsl5OzSh3cllIp+M+n8MfNJS18D
	ovYpzLIKJYZkTLx1wSNAg2RKVd1CyXs/WTmpXiLHiSD8L3lCjfex2nm5GrnF5nbdhk4WvxGotgw
	ANb3rjaA3VYEzNRkSKw8WdMxO937a2PNb1Lv2YK5EwcxEdwtJXs3zDEXIMO3tZVwsJUkiebxxJ2
	CFSQiyJObdiZN3yrNLkt4HmyvxThv1pX6kjkvH0vhDtS7J6SCgiRuv2IinJny8WJKE4zUChWgXz
	9I9c14+RlnHDurg/z1NbeNyBPU3BmqW6HKAKbqqCLZK7lLoUlKkpXpU+GR14PLpvHwsjQMqvRyN
	j6qELYTwaPcKRRyUpl9/Cd0tb3njTh3SwctqRBaYvtuBfsRxXoBx1G61KsoyaJjc3+WrS52a2DM
	gk0udY0FgBidHXCfjRhA2SkC3QmHqDfUzrM5nvmXwWY4+gdqmOJiDFmirG+Yj7vDkIxXOL3Gi52
	elIe2YYRi5dtnMDvRAVZP4fStrMt4OMB8LIZYEyEKSydzHWP
X-Received: by 2002:a05:6a00:32cd:b0:84c:2d22:7307 with SMTP id d2e1a72fcca58-84ea798e94fmr270666b3a.13.1785287175535;
        Tue, 28 Jul 2026 18:06:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373ad9sm562711b3a.40.2026.07.28.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:06:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/device: Use flexible array for scrub data
Date: Tue, 28 Jul 2026 18:06:13 -0700
Message-ID: <20260729010613.607577-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Store EDAC scrub feature data in the device feature context
allocation instead of allocating it separately.

This ties the scrub data lifetime directly to the feature context, removes
a separate allocation failure path.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/edac_device.c | 12 ++----------
 include/linux/edac.h       |  2 +-
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index cf0d3c2dfc04..fd3e4631ce17 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -577,7 +577,6 @@ static void edac_dev_release(struct device *dev)
 	struct edac_dev_feat_ctx *ctx = container_of(dev, struct edac_dev_feat_ctx, dev);
 
 	kfree(ctx->mem_repair);
-	kfree(ctx->scrub);
 	kfree(ctx->dev.groups);
 	kfree(ctx);
 }
@@ -643,7 +642,7 @@ int edac_dev_register(struct device *parent, char *name,
 		}
 	}
 
-	ctx = kzalloc_obj(*ctx);
+	ctx = kzalloc_flex(*ctx, scrub, scrub_cnt);
 	if (!ctx)
 		return -ENOMEM;
 
@@ -651,16 +650,10 @@ int edac_dev_register(struct device *parent, char *name,
 	if (!ras_attr_groups)
 		goto ctx_free;
 
-	if (scrub_cnt) {
-		ctx->scrub = kzalloc_objs(*ctx->scrub, scrub_cnt);
-		if (!ctx->scrub)
-			goto groups_free;
-	}
-
 	if (mem_repair_cnt) {
 		ctx->mem_repair = kzalloc_objs(*ctx->mem_repair, mem_repair_cnt);
 		if (!ctx->mem_repair)
-			goto data_mem_free;
+			goto groups_free;
 	}
 
 	attr_gcnt = 0;
@@ -748,7 +741,6 @@ int edac_dev_register(struct device *parent, char *name,
 
 data_mem_free:
 	kfree(ctx->mem_repair);
-	kfree(ctx->scrub);
 groups_free:
 	kfree(ras_attr_groups);
 ctx_free:
diff --git a/include/linux/edac.h b/include/linux/edac.h
index a6b47d27052a..3d8ee12c11be 100644
--- a/include/linux/edac.h
+++ b/include/linux/edac.h
@@ -864,9 +864,9 @@ struct edac_dev_data {
 struct edac_dev_feat_ctx {
 	struct device dev;
 	void *private;
-	struct edac_dev_data *scrub;
 	struct edac_dev_data ecs;
 	struct edac_dev_data *mem_repair;
+	struct edac_dev_data scrub[];
 };
 
 struct edac_dev_feature {
-- 
2.55.0

