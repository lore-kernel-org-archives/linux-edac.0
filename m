Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2829F3E16A4
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591854; cv=none; b=d1qi2sVZTVTPmCyf8jv6GNoUeK7uaNwOtU00TmCrKXl//9l0SxQnG6yj2nrS9B29UsJh+YztdcczbCZqwAShkNxCBe4+Z3ZhUha4NIc/ue5J6YzBY2K+f6YUl2ap+oeJaj/BZ9CGG/vv6h52pjpOq9nIF49AX/k7c/teiassDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591854; c=relaxed/simple;
	bh=8GOJ1bBhkXnXFQ/xtc+4fZdZejRnue5u+K5BgJsvQus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jir2OE4AiJs3mFDcmgb7t5Cf3KK0pfdgP8A1aZA5NrVbwE2qKnYXhwgMDbY/mUMRiSy9m17NdBZQV88mAtNoi4tDf2EI8RjDanRegNF2lWGI5PavVi7dtaL+S///EeLRmp3AwHm7sTaBns3/2HymvOmd+V0OVyFtuoqyDNvN2vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RncqAtK4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RncqAtK4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so1824985e9.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591846; x=1789196646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=RncqAtK4nFcBPPTgUs8AMiwXa2wMoBlgCSap1WCpkog2HtcMl2dY0x6D3q6dmaNRdv
         dICsimEaPz30ld1lTg0ZiKxsLwFIftpMqaKvhdk05060EGt0E/TH9wY1NjnUxgLHrxpl
         xv5k835yE02E708d8v5CHjGi4xQDLYi0grCez+M8lkOCwlFNTWgxrabpNifw0coZTVKl
         3M94khTCkWfOlr56gra/i6mPDGQC/HAyeu9sioXVfRX5a2izI+B9jI0HqjvLPJSJ2uKQ
         o9xkwaqBSsK6NIKcOiZXcWQmBYJ8fkAy8Nv9UPXWxOtAtXNA6WCvCEdNkipGdHKIoSXo
         6zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591846; x=1789196646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=UeUavrVg+iWXqUm8eDA/7UNJP7y90poHRxQsYCpQW3uu7VAtGVT4Au7GvV+UJa/Jxh
         MTEk1cs2r02DlA2OHgTKgfReqtJ+On3Qafmb6XwuVzKOP1+GszkgyNudXNLj7nEV+Y/K
         qB1Sjul6dwAH/QYFDthh/BH5Hh75aSuCW6aHSyPSoERm7R6RFi/gicylaXPVGBN7j/PM
         SDM9X/dhVGneyNF6M2pWnGUuOXsfUZ1zkLATZnPHo7aVxjhFHacH3oLlUe1KEG4mdO6R
         a9kFNMjD5PVIgMICsi9NDpr5G5c6FMV5inI04URYTU2LAqFvASd30M3SogPEyEkZrqq4
         e+Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzoJtufRfwnvxrEJaVKnfZPgu16pzxqlIPc+09apl0RUIv1LgAMM4Os0EEbGMeXkzdJ9eNM4AERqnsA@vger.kernel.org
X-Gm-Message-State: AFuF++kZEXJkjQ4rbs+xW9CzAmVWyXQzjQ7qBunxdnDqw0cTINDtXGZQ
	7eA5qfzwXFrcakoBnw1NJlE0oMjd7bVBixRuKGiLxHuoxfVOvSTjRRLzFNDjNcbp
X-Gm-Gg: AYBFou2ccVdaTcArhzLjADg40pSFTQqtsnpyM/lITQ2TULk6EkjJq1NUawvtt50+bh5
	LlduDPcNZeiq2zrqD2CDQ4NdQQehk46v6VGCiX+gjfdwODPvIdy7xoN6ZPuDuaTdpG55nARd2xE
	QqacNrJei0KuE4Gs61/DYyjUl9D7KnArpZLn+oN07CwX4jbarc/ZLWPnWmTzvwB4qrwjy8AWlNB
	WehAlkt9kPxDYXocHX3vEK8ykRDP7IpQDFG+bcN3AuD/2vN/eL1C0DueKXIaHxG719u8uR5EjBv
	quDIRpHYoktsoVDWTwygYeT3Lv6U2m+sSbe1RwiuJqN3Nb+o39peY76j0SnSuUN8hRux+FGSPkU
	Ii4yH1IxlBmkn/06+gJCgwd1CzFLdE0VwFZeYcs0SSh9gPdT2DvJvU46XvXt0XpwH0vMxc4C4QW
	3wW3n3hAKJXM/wv2p6/kgK1VReiLqJHzuL1MEcinVlXOaizG8Yu/6fSMF+i66bSEoK1qmuECrFm
	W+95h9hDmrTydB74t+D5lAmdCrVzJmdSKl5XE4D0niKH6UuNFiO0yn4vXGqUoZtmlMJU+X9jUXK
	1wae7UX0l0GOIgEtE41Fl9MG2mKmymAdicVRM8o5yb8O/NoyJstRZ6jigNM5zyoNti7NGUTn
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr76992175e9.29.1788591845868;
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 09:03:44 +0200
Message-Id: <20260905070347.25902-7-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2ed1e2c03c61..d44728a45506 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4553,9 +4553,6 @@ Kernel parameters
 
 	nomce		[X86-32] Disable Machine Check Exception
 
-	nomfgpt		[X86-32] Disable Multi-Function General Purpose
-			Timer usage (for AMD Geode machines).
-
 	nomodeset	Disable kernel modesetting. Most systems' firmware
 			sets up a display mode and provides framebuffer memory
 			for output. With nomodeset, DRM and fbdev drivers will
-- 
2.53.0

