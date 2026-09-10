Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D7D362137
	for <linux-edac@vger.kernel.org>; Thu, 10 Sep 2026 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003981; cv=none; b=DX7oFs9ZJIsYR0gy9J2Jsq1jNtcrkxTnW+wsfVmWki55vvyIfn3wefE66mG8gokH8FwGXYapRtnFK+kH9D9kqIG6GnnnW092hldFTDUT9ihVthAEFKZ0WKb4WFmhmOrL85X/iwpUQwgKEX6kVTNrTWK0vC0kQVKaL4KI7JgmbR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003981; c=relaxed/simple;
	bh=5npIdaapraypBrumlWXF26qNLLXzmRV667k+YLJkaDI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WeJYEAeq3LgowPKGJhiSXlw3MeUnD1K+vL3z3P7L/0PlaFxinThWDGQldWLyVHBwAvc2OjTv/qzIL0zjI8mu8bpd7Z5+u9EesojpXfX4OSB2lMiO1n9pqYLa+Tx5dwbyI5cNmLjuKjdNVCy4xo7DxivSVPAnKwIaDD523qj6txA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oTBYOs9h; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oTBYOs9h"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso68933345e9.1
        for <linux-edac@vger.kernel.org>; Wed, 09 Sep 2026 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003975; x=1789608775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=oTBYOs9hrQ1g2s7H1bO9ogdhbix+86v1yKFtfKCQWjR2iRiM0lteprlG6Tn3bvnNeW
         RDnjU23cFSUweUOo/dO+YQs57po24Vf3jckqzJ7ygXrMBi2RX2UeRHj+//bkJ8Eiqukq
         6dmbafTfGj8ObvjKL3mFBCqDa/6+bq4N4jT/jPNvy3dFG8CMTQtFozbVCsxKjxzetMNJ
         wxRIGzrC4KOjnhjl9GxsScP+rj5w9qgsm2euP4SfZ9sVImxRy5fXrI15ETNA5Ppcuua2
         NtIxDrLqswMf+z5hVSRi8PvnlqC7QVtXzpLkpX1wHIxIC88GSFYtxvHmgyuubyqaolzO
         KxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003975; x=1789608775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYl7DgYw3pPECQ79mBvyISUl5xXzjI6JeiWJOfwAtIc=;
        b=Fp0+oKBaZsZET/upF55buQ5HMFvb0oyJvhbSbd7rNU3m5io90MAl+6di5lA3DnYehj
         Y36LhLROCMIX+Q98Jz/W+EkU1LVSPebuzX8dL+kCLumowTEJfaZAZ/7v4gDQyPWilGze
         63k5UjY2WfcHGEnaR+NDbhR7+JwUSsAUJJRTkR9gMaxGh6rBdiKrb0KrVM6+G/fXxAdW
         oN/cQ0lglwgOKhwt/34euNpwGw8b0I5irhgwojf5gpy3qTeeiO2u+XBqb9848i0bZsLM
         u97UHssKkMWceHvNi2sv94RjStCkqoquuaMKOWHR45LyMmw51YH//UcPa8WlGzvH1QCh
         4aqA==
X-Forwarded-Encrypted: i=1; AKwUvBwD7WlDRB2pwhDQ7Zq8n/lA6xnN1EnTMzXpIyHoofn4fyE34dJWvheoZdyYDBcbj9dC1QxlP2LVkyML@vger.kernel.org
X-Gm-Message-State: AFuF++kDw/RyrO3USstddCueDkciRkSQnSR/8Vn5P0CzWtEAjo6SIRiq
	J/EgOyFvpRoHj4Uj6UXBWKabI6FheJ7n0I7ooom3Qz1BGggZ99k7JJE1
X-Gm-Gg: AYBFou1mY3o1QQTqRV8z0o1mSQAy0jlMplkUsCp5883aRfiOJWSGwO3vWbCklX8ZV0g
	eaiIt7HjZ/IjGrsT16BHnuCzfI8YgwjVPwvEAuEgoWqRJ+4jMzPl4XgXr1ZdcDkDmRu7Od9dcia
	BVorm/82ZKdcvCkQlTLwfPSLAyyBrCccoTR2KcRj0RgPl6C49gkzxdDBSMsgGLYhFQCWVhkRDbH
	EEUwqpGQa6qJ/hjqvtfhNmPK/JrQmi89SniR1wpCEWpoFl3Al+pcNL7NIJbuBhrtyj+75pZ9UuI
	tuwc6PGt57/WBLRt87wSup8O/jmkZj4F0RDlR4dFVz20knzvWXM6Wlc8q7nxNyJ4N6BBn59HMRA
	5emSxRHXkwbtq30akwKSOLQSP0rsUFy62ZJaDj9zy8kwum10I1VueC/DDkv77l/nD6nIDVg6h3r
	WSk67iNzJCB6o8zzRQRXHATh+OrctTg/uq4RULfLD08bSmAebveJjwt+siFnWSuqB6beb5RrxTf
	uAwP0me2OIG/U53tZIJgErloDDHPJSbQRQQTHyZxaFKGw+HHvv7ex3sQRo3hd8+zQO9wdPtiXwi
	cCFXh0/Rw6vz8C1Of4guOnayUHroUFGuoNyyc6VbcmEysVpvp5chF0gHqqa1Wj3jFXq+u46iJFn
	7bg==
X-Received: by 2002:a05:600d:849c:20b0:49c:fe46:7219 with SMTP id 5b1f17b1804b1-49cfe467228mr261724915e9.20.1789003975492;
        Wed, 09 Sep 2026 18:32:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.32.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:32:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 2/8] docs: kernel-parameters: Drop the bau= entry
Date: Thu, 10 Sep 2026 03:32:39 +0200
Message-Id: <20260910013245.8619-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260910013245.8619-1-kmehltretter@gmail.com>
References: <20260910013245.8619-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0
