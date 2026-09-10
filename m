Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C447342510
	for <linux-edac@vger.kernel.org>; Thu, 10 Sep 2026 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789003994; cv=none; b=R3Yv85ekhKBJg/y0D7M57wkQEeUQaSeDWU0wJcUKxdRW4t79p0QAF5joijRuXx4itQKbwE4D482UhaWN4Z/SjikQwkKvP65kGECu8gbfkG0xAbSp+EHwailh7zD33FY32WQnBF/qJckE0Ca0PjsEscgW5mp+7kpMH5szbTzgnGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789003994; c=relaxed/simple;
	bh=qYH6DW3OX6UAw4/JqAXW8T1nZ5UkGcJ820hwItfbiXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T/4F9CM1j2AJkjh2V+xweHfGm3wsuKk5m9Zy5mXXZBiftYlMEqXRPV/I7t/TtucbpYt7q/PpbV8ogsvD3lq9UKP/g6o5i+1VZOTMUgMhS8z5/9GpMILtPRh2T3feg/OvX8ncbdE6nfo8jW5cr6JX6uEi/8AJWJvXhNYVhUFmgZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHGsoflG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHGsoflG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso64158785e9.3
        for <linux-edac@vger.kernel.org>; Wed, 09 Sep 2026 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789003985; x=1789608785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=VHGsoflGoH1EMEKYJ8WhYHFs2hx5YMvsRMtvZFqrxZi4gkkOTIlcRiLxqiKZ89PTpi
         pPJg2JioLNUf8/KeChzI/4Jg6CPTtZddUBlXpkgLJF/VEjiFoMJ36ZNrDBRdJLNljXa2
         KkBgTiMG2f5CkluzgDlEM0njkRz0k4vG/QnS9a6Na8V10UEYtJi2WacXbzkveN3eZC4I
         M2WXHAaWSJD5oLXngZ0Flv6g91kXWJdwiZdX4ygCGSwfEnQeTE0em0Z5N6IAAOG1U2xx
         LWCnckAWNuInTAQJ1HB4kmcbcn9x0P2m8QYpTl88z9zf+tpd3Ur/ngcSu6QeFKvibUJF
         +Zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789003985; x=1789608785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+FNgBRdn5SuYqzApc8cKDhkrkv42DWP10C8olavTwg=;
        b=VrsuWJ8KPwbIj0gtV+l5YNcfGgkfb6IBwqbIDhxGDfiWLERP22FB+Q2IGuzuKK8wBT
         DPaRx0UzBsikfCak/wz+QT7JE+4gT5CSs1+HcTtfAgz6pxg4hEmr16mimaswoqGszx23
         RgMMTJfqz5LQ3itNQHR4pdcDiB3oV7B06p5erRwEz4pZdKYVLCi9wC1DKu3L/R9bYhXe
         u3MhSOThfE2LNiGNO7pvoPYBoYPaVeQpM5mAttUFNci2BvVj34CMvVmDej38Qk1q+w87
         GvqdVriUecyvKufXASVPdyYj6O2EWYaglFiMH3u/asYSjV0hakVcGGuCgFUQ3wWUD0IN
         pcCA==
X-Forwarded-Encrypted: i=1; AKwUvBzGBcL09MmH9nOedMBEB9NjVuzAb8XrF1GBvp5J0jXQgWmirKl7MeG3MUTp1iX4ELfq2UcgA1oIrrvB@vger.kernel.org
X-Gm-Message-State: AFuF++kQqXD5CAGxm8Ib3mF3trDIy7vOjcauTXjgbleGibonQKXHJlpa
	aIv/yPp4nlgLQXW6lePK4HPzi68Ne3A6RLboMFQLhVD/96sa7CW9H4Ax
X-Gm-Gg: AYBFou2hRkejxz5ioRFvzR1KJODPEtpPpNPEe0W7lbSVFgYR6fxG9biIdlvcotRQI3d
	LrD2nNpCRf5ejDADlD1G5Zp5xPJp/v/Tlktq2V0Dcmo8W0DnM3HXcF06om3jLg0Ymx/k6f/wD4s
	48CJ4hmJAp4Z2X7oidOydMKzAmTco6iydOADXOAz0CXIUFJ60lFsNWq/p+ktq4pbx2xMJqKOfC2
	IRT3qAyiudoC9WCUBMZzFRrKVYsSVDdI6d5m0HK+uv6evuO8UKpz7CShaYE55NrL2ngLwWoIl3U
	EVUnshSVcI+5ueZSX8Ih3O2t1fy04/hFRvxNBwUWcmKzB2JlJgkkcZS+zVqc87xXzcXjhzNHHng
	H0cP/DIANCMBLZ8ajL+N6f9DLeriML7wrw+kGxov2FZZ6NkuXzRhd5CXInESi6hnAcLR/dmJza+
	OICGNX4xsyLiON7zuOiEOmmg6KLVWDPkHZUxTcFehU+4NJ4bHz2zsWMOjqCKwR98ee/fEBxf5AS
	h/rdxO50fUKAQG7u2hp7dBVg2mKIn9TThgI+Q9MwobNcJt03FPkRpmVPhNREmJYe/GQfkPxFPno
	F+e20Jr46Bf3nZkl3la0xEVRu42wwEqe/6lOlwjkgWD90LFVZkWEYkhDYHeYSjtc8QUxEoBbO+D
	ETg==
X-Received: by 2002:a05:600c:628b:b0:49d:2856:fcf6 with SMTP id 5b1f17b1804b1-49d2856fe91mr11506445e9.15.1789003985034;
        Wed, 09 Sep 2026 18:33:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b090-6201-5565-e933-e630-1831.310.pool.telefonica.de. [2a02:3100:b090:6201:5565:e933:e630:1831])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm35852735e9.15.2026.09.09.18.33.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 18:33:03 -0700 (PDT)
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
Subject: [PATCH v3 6/8] docs: kernel-parameters: Drop the nomfgpt entry
Date: Thu, 10 Sep 2026 03:32:43 +0200
Message-Id: <20260910013245.8619-7-kmehltretter@gmail.com>
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

nomfgpt went away with commit c95d1e53ed89 ("cs5535: drop the
Geode-specific MFGPT/GPIO code"); nothing parses it any more.

Drop the entry.

Fixes: c95d1e53ed89 ("cs5535: drop the Geode-specific MFGPT/GPIO code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
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
