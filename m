Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBE63D9DA8
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 20:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357818; cv=none; b=ri4rEy5xLfPbA023CMPfrr1MnJl7uXanJBmkJs0nPvc+GyUHoR9s7Uiu3jpFBUbqiYl9g43gBQbRXUYfO6RYWP6bvIRIcNNy87868Hf1JH028h2X9POeDNwLUIrd5poBGcUx1Ma1HVKaeVDnpA6NY63nMbCeTdCmSRj5RfItWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357818; c=relaxed/simple;
	bh=4BOmkU2vSZ/U9gONkaoeVKNfjOlDFt3ExDRgHcQlNIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHEZrkcIdtqLJW1GfP/7bb0WtONj89szPlRM3vreKsQjcHM+04DSbSVVkCvxKIh7e3MDcI/nSieMaZy3dTG2F/Lvj7GRqK81eDwRTLIRoy/MtbZpZnWhjFZMJ+Y28FUYlo0ldGz0QDOxVOHy76Qd0uT4axEYPtFPK/9flSTGVbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rh7R6eeh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rh7R6eeh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacb8416a1so14937585ad.1
        for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 13:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785357816; x=1785962616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++0iVCZUdHPXOWic5UVGxf1B/unfU6P/EZ5LYxleIMM=;
        b=rh7R6eehDGseB5tQoDc+dwBt4sLQ9ttj8gY1iar2uPPBD4CABKKxCACkwSzQz47zSj
         v59o+iCP4SkM5dtFmwFTmihDKk3SqciGC+fwEl92zThe1qMZHA6kh1O5CLNDyO6ZuWXB
         zVMMrcFtiMzAlU/MtdVAanMbav1TanR385j6kBfB0IpvTRRQ2q0c+6Cz5iOf4Es3lQCq
         HkwP1SlW/JpreUnb5Q4Dtj+89UCC4d9AjS7XfFgv2LxANF0bKzOXBOEp0KQP3aS3sIVj
         zTCvT0nIBIbFQeUSgxICYDH4WG5HiJeGS/4TxDWWvdSm+Bzm3t7xi+hCigzSpxkPgVg9
         Np8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785357816; x=1785962616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++0iVCZUdHPXOWic5UVGxf1B/unfU6P/EZ5LYxleIMM=;
        b=WOa690TxfpZMkvUTc0EYsTg731Q3JzoMBf2tJKhARQtTeNaJ1b/uj5ZFi3uAXoRo4i
         YLK97Se8kGwgNH4HhmItrO4B1Msdk52kGxnAGfgOAYZegLnj+bkCbUZszvBFYu7p3kbz
         E08yHbSzT+WXlJFZ42HNE3PprhQHG5qKkaa5ABx4UdKG7eMtrgRobdAw3iZBjDc6kTrs
         V0w4YooWWNfykVZDsDa6Wx8UpZ2qP0Vzn+RDqrqlefDvtPocsDrvzZ18g7sBJGg+Ka6U
         Ey3lWd8bTJ8oS2p9SWsv8OSwCx0MoGNZ5kwm7B3ilc7+C/jGobjQzXRdU+jFRWIk3H/O
         AVEg==
X-Forwarded-Encrypted: i=1; AHgh+RpAYIYE+aOWhYb+bAJo6oeVesAmfI9ohLpHOR9L3ax5H3Gbm1B6lt13fiKFimtju+ZTT1dRF0XDG3ET@vger.kernel.org
X-Gm-Message-State: AOJu0YwhKNAvoyXoTzKo24BGw9xZADB4FX1sh3qLlnzCUKn89EJ+wcxk
	hMMwgy1eKP+miVihCCvC7ptYpc7zCDc4W9qlyHzdUZFlVnPAuXwwT4V9
X-Gm-Gg: AR+sD10se8JcnAaRkWWKEE+VbPYocyjVZ6xXFUmhm7u5jtXnBMG61oPxbEzPzFhAKZJ
	8j/59Zjplk4A8h9y+kNUtkO00Zt3X1DRbgjSloTK7NrL7gEqlVVxN0TaJzkZWy5xvKnlPLlmlUa
	N275ZU6pMvLeYcynh4iUYU3vkEDEQh7AXoMrdTHCWEMvUj8jKGxdy+u2fHyQ/4bTmn7FDkR+/Yy
	nRvgP/mkncYMg4qW4zbOaXxccJD5BGGgvinjz1l/SLmoV7rl8jk/VJvrbcbs6Y3Qsz0DPLisSkl
	q3KPF6Cn5QdByD2mw4rP8qW5Z79iEjWjS9Bz/cuWuG1ROLkhKUGVkapwg/rKo9DYjKwPJ8sakx0
	YKBoVYYbGRgt2x69qbjyIvX4AZ0qXg/RiQWFt2m4gZSf52onVYwPmHcghnxXPvo7R8/vyS8iEY9
	vPG2NQT0UWbhOhXP7Mkmw+D0MhXm2Lt+KcDtuq+HmqM3/Jl9u2GbskXTiab7MLIDSpFYsPrPKDb
	cQqR7L+C3ERgm+OgriQjDxSG54wv+/Jt00i/j/TjQ==
X-Received: by 2002:a17:902:eb8d:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d0339f1126mr4140745ad.21.1785357815927;
        Wed, 29 Jul 2026 13:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:209d:579a:9da:66e9:b9a4:b92b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b12cdasm14650753eec.1.2026.07.29.13.43.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 13:43:35 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: krzk@kernel.org
Cc: bp@alien8.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	krzk+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: [PATCH 1/2] dt-bindings: altera-sdram: Add Agilex5 ECC manager compatible
Date: Thu, 30 Jul 2026 02:13:08 +0530
Message-ID: <20260729204308.21562-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
References: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the altr,socfpga-agilex5-ecc-manager compatible as an enum next to
the Stratix10 entry, since both share the Arria10 fallback.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 .../devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 2ccb0f216318..34af88988b84 100644
--- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
+++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
@@ -20,10 +20,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: altr,socfpga-s10-ecc-manager
-          - const: altr,socfpga-a10-ecc-manager
-      - items:
-          - const: altr,socfpga-agilex5-ecc-manager
+          - enum:
+              - altr,socfpga-s10-ecc-manager
+              - altr,socfpga-agilex5-ecc-manager
           - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-ecc-manager
-- 
2.50.1 (Apple Git-155)

