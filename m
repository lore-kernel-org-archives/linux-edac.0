Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7658840800E
	for <linux-edac@vger.kernel.org>; Wed,  8 Jul 2026 09:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501924; cv=none; b=HomGD4R18QEQX5yM3+bji6JxhIL13UzAmcjDyJy4KfYy4IhQsWM7I5wz7Req4v4BJ/euF0L5Foxkq+phFEi7IqhTU1TMLbiX6nlcwrn0d5sXGoOmvmRXuhRmNYBOyk9O5FkVdYkYeV2L6q5kveJBfGTIHUw/20dD+8HcoFidm1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501924; c=relaxed/simple;
	bh=/cVYweEI2jaSD5YPAIoWp7HmaE274mGopeccG6xhxAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/d0lgkZjN08PV/enYKrApqbV/1ogfRWX1Q65pc22+xlNqSh6vBTdOLtAzCd2yKLN2q7D9jqW1/KdG4J+ndO9LxYVBWk3v9BndoFc6quBNRGYOxXtHRIjwEIEMvKWEXpzJ+paAihDP6sUQbOX6nCqYAoHfIvvPnKOp9orcDmZIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLSGD2wN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLSGD2wN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so2885645e9.3
        for <linux-edac@vger.kernel.org>; Wed, 08 Jul 2026 02:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501921; x=1784106721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qk/gHIJvcYYiDjQzQyUo5tbWBK+ddodOy55VkH8+5ck=;
        b=NLSGD2wNpcDfCeG4CV0rC6kL0SPCCCwDK2GJmgJAS/mcXDYSlZu8Q0HaEk4bIFR7an
         ft4nWPDzzUrGka8kzP/zGO6JpxDUekWKcfm+dGKvS/uvvRUqgWoGXnabYfjTOlVi7l6Y
         FblxVo+RYLOMVEWzUw/DhAeX4oo4wr0NJRiCo8dIEAZ8lo6KAXGmBmhl6KOjA3doeMm+
         SMy3gd8hKz5IvDLFXh4ekThKOS3VTSbKG8s26a2PzPzX0RS51/oC+HhlpjNVlxUpPOyw
         oscLf+yfykElVNvmWanp2mtUaU/3a/xhZeVDlDOuUlot//oT7zAKcM03xyw2/6f76rWZ
         Wotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501921; x=1784106721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qk/gHIJvcYYiDjQzQyUo5tbWBK+ddodOy55VkH8+5ck=;
        b=VkOQ8nZwqPSCStWPcOUk+VNCdUefqqn4zh3QT/h2QJ3JgreGzI+X+gKWeryEB7aFYD
         tutjcclQkCiCLnPz2OB9hz9QoUsH6e9IK6dNDnTj2aSKT+JbhUcxpW9mn3vURsEiStH8
         wqKQ60ZnsY+CPwkoU4v+Zk8aAfNYwMytpzddRKJCTn7rcLawzdmShwyYqHf+9Fi+xjJ0
         7b4a/Vjy2QVZP68Xd0+9u4X2Kpw+F9Xi+zWFC7HYWvpaYjAI9f38cgd0tg6GUN4UWxKt
         SKNYm1tO5yyEwwd6J/k6eW1V5zliJDoXbqttOEHbh1j7szK+OVuf0EDOZh3APxwZqXIK
         PedA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9vLOBgpC4iw4Mfcdf70aEqylTaOl5hpqmDWlxLZ///M5VR4G6vvvlohkilIvwfcdg9xbB+iaEV1ck@vger.kernel.org
X-Gm-Message-State: AOJu0YwMCWgQUtz2EZHmdQ8APuV3khs1vUlE4HY4Nm029UpJ7WgCQTa7
	UVLrUcN6Y4X//vmNRARNmmI2TwO1aefmqCw+c7PPIFNZ8ui7HEvO5G0Z
X-Gm-Gg: AfdE7cnD1nPwkkvvEDeY0Yo8OZD7Y5tkV3wPfJt5ffIrlv0Un0P03s6SKCH5xoGqT5k
	B7eHZZIovu5djyfyHC+RvNQ3hFoxht81sFrwcUr9m49DT8/7tdm9Ws8NwvZEbJcKIgY6NDEGiLG
	bkAYhKuRQnL/FBHxywX7AToa5Ox9WILsjybam5HcOkI9vDaYU4LBGb21MW7GSxgO9r1mVlYWx+v
	znA+jGdVsyfGavAAjD86x3lz7szo5qrpEF5OOSsBDJvZeWSg68A/nOlBPoW/MjYvx94WSQs2NuZ
	TNiWTreHOndDjpnMZUtZTEtxNqSrGd700r9+DwoA/AzI4EJZ8RBx4bgDjszVnytf/ZG/+NsCDkc
	1uX25VVoHbzSSUhZgtqTHA597Rto0iqYtv31JP35QBUpnmhsqyFQYS/YPpycItYGur1jtt+KiHV
	OqcXAFzm/+zXDMW7rChJ+Vtgqhx2SlNipqQ2ozIOh8fTIQ77fA/aaqqQ==
X-Received: by 2002:a05:600c:3515:b0:493:bc92:2a2f with SMTP id 5b1f17b1804b1-493e6894936mr17222565e9.1.1783501920468;
        Wed, 08 Jul 2026 02:12:00 -0700 (PDT)
Received: from localhost.localdomain ([2001:1670:1b:3626:64e6:9d2c:1204:3e04])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm127772895e9.2.2026.07.08.02.11.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 02:11:59 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	rounakdas2025@gmail.com,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs in the DB-error path
Date: Wed,  8 Jul 2026 13:11:35 +0400
Message-ID: <20260708091135.94114-3-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708091135.94114-1-rounakdas2025@gmail.com>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the last two CONFIG_64BIT ifdefs to the is_s10 flag, so the
whole driver selects behaviour from the ECC manager compatible.

s10_edac_dberr_handler() is now built on 32-bit too; the symbols it
uses are all available there. It only runs when is_s10 is true, so
Arria10 behaviour is unchanged.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 drivers/edac/altera_edac.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 24bdf7f5bac63..1d1e2b5ca14c8 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -2058,7 +2058,6 @@ static const struct irq_domain_ops a10_eccmgr_ic_ops = {
 /************** Stratix 10 EDAC Double Bit Error Handler ************/
 #define to_a10edac(p, m) container_of(p, struct altr_arria10_edac, m)
 
-#ifdef CONFIG_64BIT
 /* panic routine issues reboot on non-zero panic_timeout */
 extern int panic_timeout;
 
@@ -2105,7 +2104,6 @@ static int s10_edac_dberr_handler(struct notifier_block *this,
 
 	return NOTIFY_DONE;
 }
-#endif
 
 /****************** Arria 10 EDAC Probe Function *********************/
 static int altr_edac_a10_probe(struct platform_device *pdev)
@@ -2154,8 +2152,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 	irq_set_chained_handler_and_data(edac->sb_irq,
 					 altr_edac_a10_irq_handler,
 					 edac);
-
-#ifdef CONFIG_64BIT
+	if (edac->is_s10)
 	{
 		int dberror, err_addr;
 
@@ -2178,15 +2175,14 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 			regmap_write(edac->ecc_mgr_map,
 				     S10_SYSMGR_UE_ADDR_OFST, 0);
 		}
-	}
-#else
-	edac->db_irq = platform_get_irq(pdev, 1);
-	if (edac->db_irq < 0)
-		return edac->db_irq;
+	} else {
+		edac->db_irq = platform_get_irq(pdev, 1);
+		if (edac->db_irq < 0)
+			return edac->db_irq;
 
-	irq_set_chained_handler_and_data(edac->db_irq,
-					 altr_edac_a10_irq_handler, edac);
-#endif
+		irq_set_chained_handler_and_data(edac->db_irq,
+						 altr_edac_a10_irq_handler, edac);
+	}
 
 	for_each_child_of_node(pdev->dev.of_node, child) {
 		if (!of_device_is_available(child))
-- 
2.50.1 (Apple Git-155)

