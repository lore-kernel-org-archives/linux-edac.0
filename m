Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175164248D2
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601641; cv=none; b=hahFEO2JHZ7d+X9MSWf20b+iEBAlehY236Wj6bhfLR7cVRyJnBJ7GqvGG81vyb5VuXpUQmKAgusniY5DKreX5gO59xWlzB0RzbSts7mVwSSKDOlIE4BwdEbDS74A1B76MWeTPxWPYlhq5RMduT1efCqej4tCNBWgL1/TgJTsvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601641; c=relaxed/simple;
	bh=8GOJ1bBhkXnXFQ/xtc+4fZdZejRnue5u+K5BgJsvQus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ojdx5hLwChl03wa4rbhe+uS6TCIR/dkofIdfXcTSTU1/20N9AEu48Kkm/Ob9EyHiESqtWZcpxkaPEVk+LixUJL8W/ohooNbPvjTqzuMuIBQh3mRtjsog5iGIGHmzZudez/LuEt5RHYYKlq2mzSAEMdnbdp6zdgzcFaOPfP/YtNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ucx/KA64; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ucx/KA64"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1268530f8f.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601631; x=1789206431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=Ucx/KA64UP7YYy5FQQDaPv4iVpJGN9cu4a6gtRoYPN/MlsoWrBgL9kqhFiscfmpZzL
         r3p6A7rGwpSo6U00Cb10wjtr+mD6z0RLWlLAGmEE8eyqONRmuXoNkL/FV689kTIzZBWP
         gqEKeCMO2k4MN8VMPu92HuDd0AlqnTh1jQBi+ZvkLa0A7mZOm9Tkn1+mZhoGemzlxztQ
         YEtV2aJBvuK1aZt1EKWgo7D5sSEqC36gCblrWzvmQX3yyNe04+mJSOI0JWRmrg1dVZ71
         oylWSAJmkL2qP7fdvg4GTZMjKK5y7eqyXLGgH/+rq8Ob1Xept9jfj6uuti0/qYNUcrlG
         e3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601631; x=1789206431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVDepIdvewIAkDae/qknvPHnA6zOWa1HlsWKZdzZmcw=;
        b=pz9CA4iOouqWrqegDF2UkulmBxwsQZjWkli1EX31mToS+poPTisn3OBhmdGGp2OOZ0
         nBS9424mIG7ctA7UTqSjbeITdGJHJ/WvMTzDmiakh1eHMQ9jNcJMGISkhJaRuBYodpDr
         NKDUaVaQAASMPnyDw1ZXb+CvA4nM0vmbG2wLjeQAoNeuA7HKZhon9i8+FMp3pw5s5g4b
         g8cg8CQl+ARR1QJwG8HegtIV+f3+z6It8CGmrmUCOZjYwII6V9GK6r+xft6EULXMR9FH
         h6EB/XLGZvw5DFgGjJ9hhzDYwLjKMWqKY/T5Tb8moT27PFkKqZusaReuLsMMkrE6G8fn
         g9yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIJih5Yl9ylm1CMiZK0ssxNFK+rK1iQxSwPVYZFTOh1LshRoj/Iww/PT7dwfSvNeNZRKDB1VqBcQ4g@vger.kernel.org
X-Gm-Message-State: AFuF++kYu7+83ZDR1qKYcuSDNLvJAp436I1H27fDcdF3IJEVZ5iV62h2
	kGaYE+0gQe8UUDt4sA5JgBWRNQmEegnQJmsR22kVVkaAiGEUFfOUwaU0
X-Gm-Gg: AYBFou3fwZmHkaL4MxzR90bJzg3fdhjqWieraWv8JFNRDzIn1SN6Vbumg36FZknVTDQ
	IZgqe/l5p5TnSREoGVpR/m4oXJmKhip9I7eFDBmpj6GZRlm6j/vE1NiaTR/wz5F8p89alCMcOYJ
	kPhht76YEtEvcCaAXLM5x6JhnBsctsVIdT6E34DmLprz65pAzeRtguEYxAy/mQ77C9f9Z8oJnCl
	DolLqOuPEweCZyP5b/ETXv5VAr7GGBezldQaCGyEdsOcacKRtjgp9R+2Y7BzqKTBCGbeTEHX8wU
	h5N1EwesOF1QMzc+eWjPS+mBkmG5OlgtNiE6tpVUnrtyct53mqTfcc5KWLD38/FYVH0U2z1c1UW
	JZ7DBzqPoYyo1BoCP+C/l2k9qL8Awf95PfO/g2xAb/VmDLeTTCHBuFAr9RZIeMNg2fWjRWAAEPK
	sty9weK7Qs+YSFp5rCex9Zf5C2H0DxQQ0YmOI7jivayLiI65Jmmu6ApP9qEnHTf0V4H1wbZ3Qio
	IOCLjbEzcTprPtwaMSevqUQ0BreJVh1s+fVtyWwjH471HahIMozbta3kSkIHAfhU04uucv2cZtC
	wXPnLezjcTAN4uGel5LbRO2Uuocedb9uOb2+W2DMM4f/a3mGkzW2Gpbzh/7N0lyLF+lg
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr14547032f8f.21.1788601630963;
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:10 -0700 (PDT)
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
Subject: [PATCH v2 6/9] docs: kernel-parameters: Drop the nomfgpt entry
Date: Sat,  5 Sep 2026 11:46:46 +0200
Message-Id: <20260905094649.41996-7-kmehltretter@gmail.com>
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

