Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A188D3542D4
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 21:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777585955; cv=none; b=DPmDfqSj6wQIIiV83OlAlITuvLyPyC/UP8ScHn745X2UbKANT4BuGPSK10EogAJ5cqUuwE8NHV3WeHPuc29GYpAXXK+aaCh8g+aNCJxuYNZkvXj/JkEstt0bFQkQ7QNo2ISzFNRvYdi4nwCIHth6fxrkq+vqJVWAFfCtkNTYLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777585955; c=relaxed/simple;
	bh=D4oNtYz2t0TWPUHQ3j4VxlVibUbLuw6I9Vgy0rU4DVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCpR0D9lLZ2BiEoEQdO0PhkyJoR7YZ+LjN6qXXXy8PJe0gkyDWBMVQ0ggjpDOoCa8IMFFeE25ncWwuo2B4Jo4uiWOzPk1OQFf2SDE1WQWpG/yt/SVJ65WRf0Hm+nrnoKj6Pmy0Bb2VLQ96/oLRZQ9YaTUnG66WkIVmJlyyuDXDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp1b9lwA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp1b9lwA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-364d72f2986so776653a91.3
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777585954; x=1778190754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAYkKhsjHuqfxlTreMjHoYYadz6X7z73kaUVyiEIU04=;
        b=Hp1b9lwAnNIFSze7sGC+dNpZfqYg3cvkmVT7CYR+Lt4zicT4QOfQpvc3edtt+500Bm
         uokRhFLlaW09S1rTmWFpIVsj04WBMHJAGAplCfBlPUa4qQqajUvNFPp8GscrqevFS4dD
         SP5c5Lk2ZAHH6SbWdQCCzr4iMBxjXjGmDeTtzqdSgz3dasYWHD5E+9jZFXRBDLIbHUZE
         Ht7sEAr37bdF4VFECpi/HPsUMOtDjZZJBmXrVKKsW464FzYE7AgTAO9PLLT+j2M6h/Gr
         xh/lm1zQ12G8NC56X/WsvF4ek5d++8S6qprjj7Of7yfzgXwhNFiAmUIVBq0zbpnvf6W6
         NGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777585954; x=1778190754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAYkKhsjHuqfxlTreMjHoYYadz6X7z73kaUVyiEIU04=;
        b=qZ7ufRIOvgLV+Nc3GqLvCm+mL7wyb8c0ykAEB+5NJDYCPPu1UF6gU5N8/1ZKRf6oLs
         R5ByIXi8xWcGlD66cSeOauAErO20kgFRy88Pkcudgl0CTFykmJ2/3bCjqUmO1/y1kVgQ
         PPUoHikqSnRVihnX5t5PszjI+/dGDN+V/8Oj1REhyBzPv4og/8Unve6saS9Z7A83hNDP
         u0j5VDCMA7ZJyZZ66Vipgze/YE/K3/Xrm4ZSDLT2N950AJn897XajsjkRdfKnuPRzzpL
         Pu3GTnC/cX8X/rTGUhACXAAoaFbbe8ZPI3fTMEqb1lg3jVFvvnrSgoQRken/CZp1Ojmg
         +Mpg==
X-Gm-Message-State: AOJu0Yz01ta3LOhjwy0ayViFxexw72AshbAseQFmV4tXezRA0yoglkIs
	qdHUWVxfPLvY+ZvhjLSI7LsczORrG2q2Vly09yiskddHJzxAAJNu5u5LZhuTiw==
X-Gm-Gg: AeBDieuSQR9icY+pvDURw8B41XXlfiDoipIIIByQT2lynT7P/gq0lch8JIXqCIpzwPq
	VuIviZ4mHF91tYt0vi78JlSFdxy46EygnQL3rWx7BxDQRRFyg4Bma9uRMGdgL54prsI0LjbsPoM
	ijvMzxpF5vGMgjTOdzHIyHsaJkmA+eO2KkgtR4dj37PTR15OL71bMPp9L+L/iAO5o59HbgtBdmD
	iEP8hrXjMidBqZLaD7I95R65Zn6772DmR3fVkldfdEDoed+Pe0WFv8WEZtXfaDUSfVpWbtWAT5M
	I0lJTpifrfudcb9Q8TDrLB9hitrCndWP6AeQEhZnqnjnJ7oLpTr9lFBE4cgwT9tEQk2M3+cTpVt
	5uRhzdHsv80iAk1jrnRjKJPJ1kasuxp3DIDLh9FFrv+qEhTRAEWviDjgAcp8dWdbjfjrS10WZc3
	Z7RXz1Sjne4pesgMwQmahsrpGBSPlF5ZuGJeYw4/bX23kzBZ5BYvuM1COl5AKqD3xx9N79TTeNe
	O/FMO9IEJ10JlcBx9LzThPqs+FLvZO3FckYZeQcsca2oQ==
X-Received: by 2002:a17:90b:1a8d:b0:362:e7e5:a20a with SMTP id 98e67ed59e1d1-364ef34a965mr272407a91.4.1777585953731;
        Thu, 30 Apr 2026 14:52:33 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be00b168sm3697703a91.12.2026.04.30.14.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:52:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] EDAC/ecs: simplify allocation for context
Date: Thu, 30 Apr 2026 14:52:16 -0700
Message-ID: <20260430215216.65803-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/ecs.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/ecs.c b/drivers/edac/ecs.c
index 51c451c7f0f0..f0833080c5cc 100644
--- a/drivers/edac/ecs.c
+++ b/drivers/edac/ecs.c
@@ -33,7 +33,7 @@ struct edac_ecs_fru_context {
 
 struct edac_ecs_context {
 	u16 num_media_frus;
-	struct edac_ecs_fru_context *fru_ctxs;
+	struct edac_ecs_fru_context fru_ctxs[] __counted_by(num_media_frus);
 };
 
 #define TO_ECS_DEV_ATTR(_dev_attr)	\
@@ -149,17 +149,11 @@ static int ecs_create_desc(struct device *ecs_dev, const struct attribute_group
 	struct edac_ecs_context *ecs_ctx;
 	u32 fru;
 
-	ecs_ctx = devm_kzalloc(ecs_dev, sizeof(*ecs_ctx), GFP_KERNEL);
+	ecs_ctx = devm_kzalloc(ecs_dev, struct_size(ecs_ctx, fru_ctxs, num_media_frus), GFP_KERNEL);
 	if (!ecs_ctx)
 		return -ENOMEM;
 
 	ecs_ctx->num_media_frus = num_media_frus;
-	ecs_ctx->fru_ctxs = devm_kcalloc(ecs_dev, num_media_frus,
-					 sizeof(*ecs_ctx->fru_ctxs),
-					 GFP_KERNEL);
-	if (!ecs_ctx->fru_ctxs)
-		return -ENOMEM;
-
 	for (fru = 0; fru < num_media_frus; fru++) {
 		struct edac_ecs_fru_context *fru_ctx = &ecs_ctx->fru_ctxs[fru];
 		struct attribute_group *group = &fru_ctx->group;
-- 
2.54.0

