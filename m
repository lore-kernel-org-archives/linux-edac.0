Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE8D48875D
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832432; cv=none; b=RhrP+dOQgz8ziEyslb0oGOKPZu2IoWPlXy3arAuNXFhbj7dwp6TvJmUOwO3dUwkvC0nw5KKeGa6r3ciPaG4THudFz7/uxVz/OHqsMvnvxFbBeSzXqbI+WuqkzILyVk3JegL2hpg9cRUDvIfLxueXoeAatgmtj6QauzQIT/TOneA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832432; c=relaxed/simple;
	bh=sSmtUuUJ70y44iGSZGE2SXfyBODS1MzhYzpUmvVlbgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Idy7t2eKY8dSnrVwuWpgg3W9m8G/Am0M6fChMpdRQYAVNokWPFdvnafBqvteYYb8M2YZfwTjpfQpbCSDTTbr0zV7Q4AS5Nd68Dr+VqLHh+5tEvBEkvPcwK5Mi+9a90/Z1lloBnkAZvPHANDF6uOc2htK4raFQzeI69/8c7jEnaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNrdHJcH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNrdHJcH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e08baf860so1122195a91.2
        for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832426; x=1785437226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULIJ1Xv9cw+GY9oh3jjJe8v9mZ8WuSVlbfwPasElOsE=;
        b=lNrdHJcHyRpAkAO0rKsBZyBVjoqW09EPwyNzDp25CzD3hs8g+dgYUnqgE/bWuzQCse
         gtRuD2Fnas5os73bsGO14WZxjnu4KfvIeP4Zuow/GldKftTQnvR1K2n9pHI+1+uYAmVa
         9+4BdhSF2xyBwzQQfsC//o+XMjpDaCw8D+ZvkILYVyIaYK2BZYsYhew1IZAV7As7OO3M
         lIGK0wGeEx8Jaf8mvRfE0yMKaxBkOU1KVc72R7oSXvMx3DEpmmEUj+Aq8930RQSnOupe
         9SwzPu6sfq9LmjgRl3o3Ecn6FeS9XhBgqIWoA4mztDCJJAmYCwn7rQU4WVKGcF5xzhIy
         YNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832426; x=1785437226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULIJ1Xv9cw+GY9oh3jjJe8v9mZ8WuSVlbfwPasElOsE=;
        b=PdqJ1tRZZlYmCMC/TetAsXM09dUUieF3qTAJiSE11UKsp/gRaVmcxQbgn+VFtKhtzS
         BNqx4sw+J4uYsv3V+kfkh/CpngHpcWzgJqRizcrvbV+MSPN5IRrgkqSSTt/wV801+uMV
         cgcah6bYuEBkwm5TxxBn78McAydpXVLCMB1TbRI2SgFNOECIBybvuMX2Qsapla5AaPd7
         lV7MZrs7+EAL25Iy6eUKU+akdKO6Eo+FrVOcJCzKOKfuGYumzOZhEdmDmS3aWzd2Sa8K
         DtQGGlucpTj1+lqyMQLU06jXSSkiw/1NMRlkScO0M6DDdXs/6F5WRqKICCexiuw72Fzh
         7S6g==
X-Forwarded-Encrypted: i=1; AHgh+RoTTYPc0occrd+I9TrUlCXw6C8NqMxfxoXCvtU2YSKYEFP02Bm+tSMekP9rEP/UXZY34E5XWw6SzXyt@vger.kernel.org
X-Gm-Message-State: AOJu0YxZSIKLlkZ12VWiwEg5oTK0RGyOsskWnY2xahi2FnexLS7oD3cT
	49p2608QLSP6Li6C0o5WTj5rq/sEPL9vmjfmPLaI3izpXy7S02k3fjcXbo8q6wHF10M=
X-Gm-Gg: AR+sD11B/fvZ7AgCsmEvY26LwrLCrMBbtkib1pU8m5Z/CqAFv44LRFAF2N+gpeQmxBF
	JydjdJQjPzhVrsPb1aAZaSm49Od4b7iOX0nEZV3Zcc+YHpbLC4aZuho9QDYFLSb4Vxft6fjNgDR
	Rwho0QhBAV6YaoClKRzhfKLp/da92h9kSS5a4kZ5nskBtStFXD606VlyVmoVj8NaRoJk/Jlj0VC
	mexUCommR6fCNulJHiMhEOxwwbS2zD+o6mVWYVA3DpklX1qxNgHj2jeEA7VRmUYf/Buv3yqTvRM
	80s3b0+m8+yESoDrmy95EFJMkkssVNb9dqBGB1zfsK0R1jzmZQJZlLIGd2P9wccuCmt2Mt1b0KY
	2Zm4YKd+754eKwjbBzq0X3BAAVohEYCDiat8CAjpr6kjy40Lmur1/hMFfy0yPf3yhV20En4Xs82
	2TTIyUjm8=
X-Received: by 2002:a17:90b:518c:b0:38e:b3fd:d582 with SMTP id 98e67ed59e1d1-38ec6657a87mr4132955a91.39.1784832425783;
        Thu, 23 Jul 2026 11:47:05 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:47:05 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: cocci@inria.fr,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 27/36] RAS/AMD/ATL: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:29 +0900
Message-ID: <20260723184538.3888637-28-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/ras/amd/atl/map.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/ras/amd/atl/map.c b/drivers/ras/amd/atl/map.c
index 24a05af747d5..4ec9333ef745 100644
--- a/drivers/ras/amd/atl/map.c
+++ b/drivers/ras/amd/atl/map.c
@@ -771,9 +771,5 @@ int get_address_map(struct addr_ctx *ctx)
 
 	dump_address_map(&ctx->map);
 
-	ret = validate_address_map(ctx);
-	if (ret)
-		return ret;
-
-	return ret;
+	return validate_address_map(ctx);
 }
-- 
2.43.0

