Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3AB43CE56
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601635; cv=none; b=Tf7p1eL+Lcm1tLt7dibYMvASTvwy+AEVn4FKv7rSXap3ZV3+zf6DtcSuFD5OGr84aBKCY+Nh7MjjXdUsEY/f6y04xToP5dJb8uf98NqmqO34mAIsqXV3vjXDq+nKuZDkY4oqeS/fEsWRd8nmAGB+4f38JPcWzRgqMM8kMVFncC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601635; c=relaxed/simple;
	bh=YsfDHjDKsIWAkoUgaj1imFKWTfOFfJnvMXwuV6H0pgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sae9UzLpnMCNa0qoy6zCG+2dwcOTF23iM/cfUgIQafvXMYjR4jH0cZg77mI/f8brg4CLunDybTSwrP4juvKUnhJCwgLYNNI1sj0PBsLK7eQDCjG/N1sVZbyrKyR3fnShgmWjGYQJwC1coOkPo1higknfUipYqodo4NoUwPrb6NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF6eznBR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF6eznBR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495437bb891so12847155e9.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601628; x=1789206428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=WF6eznBRtkwHGPWcdSI5zmE6nOZXyfhdN2pXXayZzx0BbgJPuw+KlFuKyGt+oPL4Gn
         x5Fdmar1PYKUgTWNQMERUPVz0nv7Mxix0vYmZEYWQJJOKq2IhCwllLS0NUlGI53+Sb5v
         5/bNjxfGOVPTwMCDRyEgg8niqb1POYfm+DvWwohpgMrPJQpIvHANwiBLbEd1TEAyWkB6
         Yk0kGOVhMD6W24IF/0oUwz3EPVKNZvvniPgnF/EmaNhO2oDa4d3jzD/DgSjSYE1SDRdD
         eJVT5P/AMMCz+8MsEccoS5fKN9eLm8DUge+M/Pg7OhsbQTmPGElHSKeWCxs9g7wuy/tx
         Kv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601628; x=1789206428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=lOiDf+9v3Le4XmaOyzuMzH/HgD+VgpUhCjePtBPJnkiAsz8raM1hc4ZS3uJe3KOVeC
         wy2gXjdz72VEoRCzTTnzoSSbAF5Ps7a8Ah1rMB2n7Vv2/mZn2EJ7U9LuUJpqqYPc+q8S
         NG4+0IsQxCYXzHacXvutecZeFKEJPAscLP8SNwvWxy8bmkudQ0lxtT+dAaTlPVDOfRGN
         VjpleebeFYtMwhpyIuV+pK9t2F49s2zMegjbEss4S2I0+1tLqTtshgqqFDui2Vvuqkpv
         BoZtYp85bVa51VAMqWQjkMo6gS1lOxRDQ1b/jufZlsJZHB+oiYKt2nvA8XYR7oyDf+Jr
         DPDA==
X-Forwarded-Encrypted: i=1; AKwUvBz/DS3OpvyEegBmvBoZFiltIC9Em4stnUmCnklmN/GMaAscJH1WiWq4KYI0wiEwuXtzizxXy06RKYCk@vger.kernel.org
X-Gm-Message-State: AFuF++k6Y0fISNjOSFc3X9DEvlYa6ceKE2M231IsVdvdIgww/jdA/LR4
	Qqm1CrkAj1bTGIJTjaa/DzmB+fPaGcnphlN7ke4phFV/PB7q5s9xR1ZN
X-Gm-Gg: AYBFou2ilGpKWTldpaXX1sYdcjzA2qaCtvU3IW+lANr2N1gansg5d+3X+rKihYkvVNN
	Op5LPb5MdpTOlwhZYY8MXrl8kv2OvYg5B5ib23+R1UcmqWzLIvlPLrJ3sbMLnPj5YSoBJtAj3dY
	02HDOS/n4QaB+2+PcrWb32/2iMVZ0NCA/0hIO6Uv2/0126gnqgoXhFsSs7ffftbNHbXpTgOAXY2
	//T3mSD7bJre4sXwjxw6pKtdTQ4ew0k5IgvvA7xn3kKbrdexj8zgX70PLkrbQubJqLON5tRjNuT
	viZ8VPcBVMXmWPe7bRQPYK4to80EUclsiFmPBHmGA+ki4+7f0CLJynPBG+tLWvR4sh7kIp0xJws
	ZT+Z9c+Co4PnzlgHgj7ZhCsYVtJ2WeQL4qmvUOqvnVD7ph4DIXbEx5D67Uucol/iHSOiS6E5slJ
	DzY20pfXE8LeOfCy8k3mr8KguoQBSqmA5Co7mECd+RpccG6SKPQ+R5kHM4uYXzO+Mm1/57PV6S9
	jrWNXKN1jAVGfUyQsXp/ohUW5i2YtpxMH+qvZkV1EyPOAACIzh9WpM13jst84BpiZ1H0vq9Qi9E
	5maP+zMn67x7v5Ng61mbzoQp6Ow8wXWmvWTZH4CyLPhnvehg1SOVxFljOJQtOX0Pu0F1Keiql9J
	chQ==
X-Received: by 2002:a05:600c:a307:b0:49c:f13d:ffea with SMTP id 5b1f17b1804b1-49cf13e05c2mr154976805e9.14.1788601627485;
        Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:06 -0700 (PDT)
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
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 11:46:44 +0200
Message-Id: <20260905094649.41996-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0

