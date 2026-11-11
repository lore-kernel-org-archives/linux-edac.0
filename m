Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363509;
	b=Qbt2Q1fnMpj5lzB6eUygwtzi/ayEEru1wutwslg9R7enLWAQzHT0vwsf4zEsaTNe68zV
	 NG3NCLHU6dortHi1f7IXUAuSrW7p11ctF/f7n72/ft5OefqfO/L/DC7rOw8k6cDcjUfBB
	 Kh/NS+tCeMhK4UoOex/doEfxoI3ACcn4tnmaVlLsCwVi0DimkUPFMmkCcY8myQY5tP9Gi
	 QlnRlT8WDluoJGCYD1JJXL0t5bGdOXDrawNPZ7ByA7CXlIUnex+3O8kHXTABXA558Ps7S
	 RRnjKJWXoHACKsqcguMfkuqfgGcEFyQs9Zew7FurOhBnU1NOBOK/+4TSlceS7Pc97QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrJY2Fwepo7894Ql+NtyrHeNRWa8RX4cvLszfyzbChY=;
	b=lZgqxX8fJoJsM75iXqpfrAwMvStxXLxA+9PF46+9i+TxBGvSxloQMxtd8S0f8TeuSY+j
	 NN7/PRIUENlWrpSpM0Ql2itn9bX0WUAETrfRl117JAjimbywdCxkY6+yxF1SzWzNL+81b
	 8wHs8IJNm8bYDHBbWyFHdlSoBXyO1CGpCJjn+pol/IfduqGJP23ROdS99Vkg48q72NP3/
	 ifKS+P+uTB28TGf5jFRACY7Wrt3iWdrKZuRCngcQBa8vdzBM1WeQvk9zvXMHextfr94qA
	 kLywGVIR6Hb0tIBujWRLlihoseGUfk7B4XfOHaMzvBCrxifKgKEWw3CXscUc9c/fYPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTFXJwxw;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC4B606A327
	for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 02:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC4B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QTFXJwxw
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1416587a91.2
        for <linux-edac@vger.kernel.org>; Tue, 10 Nov 2026 18:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363508; x=1794968308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrJY2Fwepo7894Ql+NtyrHeNRWa8RX4cvLszfyzbChY=;
        b=QTFXJwxwMGi3KYiPUC3uGm1ejP9JeD0ap+Sc+8ZKk7AA+OBcdrTjSUDDEQ80ejyupY
         tnMsX6HSAMgzQmFT6Iu5Ulyf4l14ZD1Zr7JmfVheB3rz6DhdPbG7Lari0K6dMpx3GFu4
         yrVSfdBjNtgTdM/fAaEkKnGzFyI2MFr1WprZz1tS7CiNRq5h66zNeQ/HsbmblmiTV/AR
         3MFT4TAx5h6bEzcjG3Gdx8QGBDJuOlE/yUFfCxAmlWRI8rSJ5MYrQCI0iVpLUAyDh+xH
         N4CwaLOKv1KwXRF7RsPnxQdQT1vHhtPJCeV/aF19kPrrPj4gRCFZaXYHzCkWKfIrD+Mp
         sp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363508; x=1794968308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrJY2Fwepo7894Ql+NtyrHeNRWa8RX4cvLszfyzbChY=;
        b=vNL9BEg24T4S7TudqRyWZcjDPBrmD0XGIjTG6u6GzsvW7MK2t6e1Nf1sKUj/u4WgVq
         JeoAb8j2hVBxYmXGjJPDnuULL+7dKXa6y3t8Vp1ABWOevT0qc0bWgpoz3N1n5ug6rWGg
         pr8bZsgIiqtPam0fmg+ejL3IuMOEUSqo2HVo+h8fcM5OxeLwplGGZ5giRZK3Qd615KZT
         nxpxW896weItx+0uh1oTRwfuAYVwOaKfdyurrNhFYlIqfyNo//EVY9VYm+ZjYExTJ9i6
         uB/UUI3ru3KN9Xi7zoEJDX0FDhnHQg0K+vBnoVuOoMxUQNaQpKbVH0xJNEkzsGbVQXo4
         u8ig==
X-Forwarded-Encrypted: i=1; AL+hErE3fwYvfFABwzE4Ptl+4Hegy3D6YxuVTmVtGTj/Cot7Fa4cVOsE/VpZHPzKn5fMUgRWU7kIvM+En9fj@vger.kernel.org
X-Gm-Message-State: APuU4Z++yvz0Pv4puFGDrT5I5A6B5/7LxaO7D3HV9s19+jNzOp1BTBva
	EjJ/bUQpKYDm26HwHsZocVL5k6BFzFI6Yd4kLlQbmCZO5v7zJMolmF+jimpcUw==
X-Gm-Gg: AYBFou2CZKCKCpgQzntxO4VkSMNlWJJAe2CfYOfT3+uhTx4xnwXoOTndoMv4s8x3vgU
	QRKsa8LxRH5fWamwGnYDPjk1dDcIA0Bz7hs2gWN7JJ0iX4+MOB/BRJnhcYNuMkM9HajVFf0VYDu
	xn6cjRQyEhCPonB5pfzxASnPgIUh/YMC7aK+nZ+OMDo6w8wDxVPaItlBzuaVqNOnKOUc7wAJ4CJ
	V6814ZVp3wGwgu2mdiblzvHpBp3sUNB74kFEv6JQL8GcNOP4QzMNLcVoWhxDiTomnA/xn5fB4bS
	HhUvjYok65L5tpGPGKVHwUDUH3KbcKWWWp4sfYfWSdM9iD4W+4TqhsofhxweDkRSkl24NoAvMy2
	toT1H6UXEfKrRv8cEr92ytyMjDESQKykVvlrR0RGb03nUDI+qaxbW6tPYwwJYzZSz1Zb9SA3AR2
	e/47wRT5GeT0pcOMRr9MsQTlMQlXGCGtq/fKjvQTH0OIe3/lz7lAsfaCvcxfyZqaTu4NZyRAB8d
	o6JO/8la+bWPrHgkDtz+JJc9Mv0+F5kv6++z3JQbHNAlT9BOtzuB1Sfr4dqBcHFESUgaY9PmCo6
	XFjkVUDmhbSoGWuNZ9TKPNp4AczRPJv5FgoeSNkYdjyea1nQdYHeRFsWGViIZlJro91RiKuVfBS
	V6uTrOJbhdEMTPT0/S3ndRm20GqQ0tyHKE8oVII4e14Rny4FI1AX5ZYdxOgmqES6IIicVG7GxWk
	somFqQGDBtTiSHdjiLyka4ZMiJ
X-Received: by 2002:a17:90b:4c50:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b182ec2051mr1060564a91.11.1794363508275;
        Tue, 10 Nov 2026 18:18:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db9d1fbsm2034540a91.15.2026.11.10.18.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:18:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] EDAC/ecs: simplify allocation for context
Date: Tue, 10 Nov 2026 18:18:08 -0800
Message-ID: <20261111021808.60779-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use devm_kzalloc_flex
 drivers/edac/ecs.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/edac/ecs.c b/drivers/edac/ecs.c
index 332872d4214c..e7f7e189cc76 100644
--- a/drivers/edac/ecs.c
+++ b/drivers/edac/ecs.c
@@ -33,7 +33,7 @@ struct edac_ecs_fru_context {
 
 struct edac_ecs_context {
 	u16 num_media_frus;
-	struct edac_ecs_fru_context *fru_ctxs;
+	struct edac_ecs_fru_context fru_ctxs[] __counted_by(num_media_frus);
 };
 
 #define TO_ECS_DEV_ATTR(_dev_attr)	\
@@ -149,16 +149,11 @@ static int ecs_create_desc(struct device *ecs_dev, const struct attribute_group
 	struct edac_ecs_context *ecs_ctx;
 	u32 fru;
 
-	ecs_ctx = devm_kzalloc_obj(ecs_dev, *ecs_ctx);
+	ecs_ctx = devm_kzalloc_flex(ecs_dev, *ecs_ctx, fru_ctxs, num_media_frus);
 	if (!ecs_ctx)
 		return -ENOMEM;
 
 	ecs_ctx->num_media_frus = num_media_frus;
-	ecs_ctx->fru_ctxs = devm_kzalloc_objs(ecs_dev, *ecs_ctx->fru_ctxs,
-					      num_media_frus);
-	if (!ecs_ctx->fru_ctxs)
-		return -ENOMEM;
-
 	for (fru = 0; fru < num_media_frus; fru++) {
 		struct edac_ecs_fru_context *fru_ctx = &ecs_ctx->fru_ctxs[fru];
 		struct attribute_group *group = &fru_ctx->group;
-- 
2.56.0

