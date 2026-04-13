Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146533261F
	for <linux-edac@vger.kernel.org>; Mon, 13 Apr 2026 23:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776122069; cv=none; b=UTpa2dlBulF8HEumEsWdjy9Gru1VoiqbIBqy7z5r8pEcOw1EYxLAp7cnt98xcwCNQNzMfLbcTIgSTrPh/40wP16SSegwVq4dbKskP/hW+nqb0U6tJIvax/aii1VI70G/RTAUBpXQxs8uqKhv/PuLoOEAOTfyPQJ50U9Bi+9g7wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776122069; c=relaxed/simple;
	bh=ji2Va5v84kYBjDNGJ7vQaJdlyFW07sYBWEVS84BZO3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KPS9ZlNnquqCY561ul9RG0gSDJr1WV3w2ajtCU0fzPFb89sa49eSssDDriO4cDqECFKIG0QcxG388RHDij8prn+P4dgy3wNsjCDqyrbC1tDmDXKb66omLLFDm7lyqUhIebZRUBr6yctn/n9PNYHl8zc+w1UapKrxtqp6mtHs6Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKUbkIwO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKUbkIwO"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aaf43014d0so30111065ad.2
        for <linux-edac@vger.kernel.org>; Mon, 13 Apr 2026 16:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776122068; x=1776726868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qifmdnzaAxfEy4w4Mah8qbIqZ2DwqSxS6VwV60LoDg=;
        b=eKUbkIwOloLn1Z9HMaUNQA/qKxm6m0WbyEI1eghFBL4jjOlro/yePKzel77OMm060K
         z45BTDeueVnGZTY8/XLpZ2PrfqpMQbslfHmKYN9L8xuAj+URgSulE0DW0Q9D9yJKIdEq
         ERXItAi//jgNQG4wQK787OYRsohOlg0VpDraawNbIwXIfuUgkjjTC67H7z/kHti3wxoL
         oCGrlOfhs7QNglUaTk3QyMeTgLiHH7fYRdMeCtRr8MP/lu7W6tmznK//4byv8Pxfd1cW
         /24yry9m0YpRSe15T38UU+e83tLe1nGHvYLcRJ6C3D1JW25a7AMo9G1z2uvNDwBdXP09
         bUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776122068; x=1776726868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qifmdnzaAxfEy4w4Mah8qbIqZ2DwqSxS6VwV60LoDg=;
        b=azXqfBhCvFLYMcf9pGYSENFdTjvsy1IIRofjcEHrKj/opNoQN/A6GsqqNpXHHs+EN3
         +SZbLLI/g3xlLSKfIvPrI2VU61svqbfxWmKFJ9Svu5+dbWEexgzzJkM1E/ULMdFuch9r
         fPu2OmJPbRKcb242V4KZomwztBE470rxE34cj8EyQBxIvbXREF13lA0N4Yw6LDQD8yIN
         Ty108U2MOb1C+hiLjUcUVN3Gt0D77HD94BggwyL8821b0mAwxhWX/leYfF0ZkmMqaa+S
         FRytoVao+C1yCEnpFTaazZrXYopbYnGxJpMVq4SHGfJKJeXoFTrVnsDw4v9f79NbzAwf
         407Q==
X-Forwarded-Encrypted: i=1; AFNElJ/D9fhB3dTa73gQMD7JIKNsqy9NwfLOlOq5igD+JYB/cRRg4suekl7OL7ChDx8yLxN8ScELwm8kCJDJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqzPEXQMHYr3iXtivIRVwpRL9VOXV0sqoLGE4WYDKhjYpcqPBp
	/k46AbFkFZaMmG0HiZv4s02HJQuQgo5/fnSdog3HyFLuf0j1/H11byz/
X-Gm-Gg: AeBDieu0mqHqWP1zgzI0mq4SX+TyC6tHZhn0zddfEdHCmOzFqa3tJcKDgsF5aB9mvG+
	iPA8JYLo4Z4bIlUz5Eo1L8aZgXnMt7dRsIfNI3NjJgUydHlXoHi4rjopfMpWbCWnGykXIAF7jEy
	sS/5ZZxJI7b0OvXi4qfHKU658NQPQpJZhXRKJVmwt+Sv24/upd8DtM9pR6qafuwLm+HL22/ccw+
	lLL/ghxCPkqJvyfhzx+YSJyONXfetT3Ty8ECzH1FaSWe9TmHqNi3TDiYLmqd0LIi13K9pmQAjsV
	JBETuyuIaSa1eES+/cciiHGKOshqNoY+mlCkjtUSekCbKoS3fTnYcyzz70FLqOGe1O/iw9U057V
	sPDtH/P+HLEipwEGvkD1kavlTJoVa7EBfoAY2J2dEOYi5+NivIcaeR0CuSDvk5lnkJsjOeGBSGb
	qa9lf68jL6taJaXw/6IoetLtOCKRhvC96KdU4nPU9Q3jDC
X-Received: by 2002:a17:902:8211:b0:2b2:d126:4e77 with SMTP id d9443c01a7336-2b2d5975bdfmr107459265ad.11.1776122067624;
        Mon, 13 Apr 2026 16:14:27 -0700 (PDT)
Received: from anarsoul-xps15.lan ([2001:569:7c09:b500:8461:f909:7a3b:1c4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f43994sm129635805ad.80.2026.04.13.16.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 16:14:27 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vasily Khoruzhick <vasilykh@arista.com>,
	stable@vger.kernel.org
Subject: [PATCH] EDAC/i10nm: don't fail probing if ADXL is missing
Date: Mon, 13 Apr 2026 16:13:53 -0700
Message-ID: <20260413231413.73987-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasily Khoruzhick <vasilykh@arista.com>

ADXL is not present in Coreboot- or Slimbootloader-based BIOSes and as
result, the driver fails to probe there.

i10nm does not require ADXL for decoding errors since commit
2738c69a8813 ("EDAC/i10nm: Add driver decoder for Ice Lake and Tremont CPUs"),
so we can just switch to driver decoding when it's not present.

Cc: stable@vger.kernel.org # v6.1+
Signed-off-by: Vasily Khoruzhick <vasilykh@arista.com>
---
 drivers/edac/i10nm_base.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 89b3e8cc38b1..69a4a255e4c8 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -79,6 +79,7 @@ static struct res_config *res_cfg;
 static int retry_rd_err_log;
 static int decoding_via_mca;
 static bool mem_cfg_2lm;
+static bool no_adxl;
 
 static struct reg_rrl icx_reg_rrl_ddr = {
 	.set_num = 2,
@@ -1208,8 +1209,14 @@ static int __init i10nm_init(void)
 	}
 
 	rc = skx_adxl_get();
-	if (rc)
-		goto fail;
+	if (rc) {
+		/* Decoding errors via MCA banks for 2LM isn't supported yet */
+		if (rc != -ENODEV || mem_cfg_2lm)
+			goto fail;
+		i10nm_printk(KERN_INFO, "ADXL not found, falling back to MCA-based decoding.\n");
+		no_adxl = true;
+		decoding_via_mca = true;
+	}
 
 	opstate_init();
 	mce_register_decode_chain(&i10nm_mce_dec);
@@ -1243,7 +1250,8 @@ static void __exit i10nm_exit(void)
 
 	skx_teardown_debug();
 	mce_unregister_decode_chain(&i10nm_mce_dec);
-	skx_adxl_put();
+	if (!no_adxl)
+		skx_adxl_put();
 	skx_remove();
 }
 
-- 
2.53.0

