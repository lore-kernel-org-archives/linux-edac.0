Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112243C7DB
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601646; cv=none; b=oHuwBa6Vji4oQCUFnYlEp/kiIFoCnOz+we9yYappvdSAeS7ZuudnJxsVBJ7vU/qwRNJ536l++hb4EeG/5m4GnQMhKsi+t2LLCXseRi/bDcZtmUcALEw3dhJ/p8D8Um1B8c+6+UG21tMx3F8HqyP8tnet6oPSwlSXFdKqp4LKLdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601646; c=relaxed/simple;
	bh=fApNG7pEOll5/tB3rqVahJ6bvMIxHk8hHb2CY3jSzQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IMVj2axhMWR8rhTmySoRKCgGuGAURXaceZNf0gdHmY4gHQBOW9ma9ui0BooKL+ITncF+xKKdjCpmFnAx+ewS5uvKlh9Qqa72ScSe0bfuTohhRRllMrBWqeFUIG8OKfHUci3ciKl32sjljKGBpfu1VO/peT9AxX0DzgnAJV1NZMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B18f2qkz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B18f2qkz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1872460f8f.0
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601636; x=1789206436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=B18f2qkzikKfnKphA4OculxGEwrQf0Ep8+PaGaQYv/xYwiV+a89Zau/mKSmPPjQYhK
         jBtOa3jRCJrVMt4WrCdrseZhMIzpxP7K5HyQLvnDuBXwseT6zqLPO6oYjihWs5l5VQw6
         IaPriatQT0RC9lzvBO7VOXXAMuqADXWdKOJvgkOPcub3MdhRvpJ4b7usagxcgO1SuInd
         me06Vd1NkyrlDIAyGAKSjoDVx+LUxHmS9/9ZIUdmxHwmU25+LAqgMQ6GnyW4BcJimHcz
         24lVKx1gKbJppw7SPYNA7p8cpuCncSXDDngh0Emhlo8DhQgZWF0reb0Xaz8DR7S7DvIc
         dv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601636; x=1789206436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQmExMUpeIFcvU7MdenadgThwocm9EsyaVYoR2H42kg=;
        b=qpCsLHPaGMw3MT20zAdtnY4S49ArMgoBah6cFhgPmKewhKR+k72H+J9wOdWYSC2L0T
         Jc3tbDwPqBE0x8+MZlncmB1sGMOkGY1eaNTou1MecD0XjG+DhQEE46Knn647jz9+EOPd
         ZVF4SiejQqI88kamAH4S+ugTspWqWxN0ifZYkT0e9mA2LAfG56jcw+5zrzVAwnbHgK8/
         eG79h9CXkeaBYVRXpVxHn1j1F+PHEN8yY9wp172rny9iXc79EMaLl+LR6pcExYfUrTBA
         wIm3RlMHruf17DMi1ohGeojzWIrxOrOtAPWmDD2t12wxFmGKpiHcniqv73nVGuGPwiQT
         FQQw==
X-Forwarded-Encrypted: i=1; AKwUvBxeX1yY6VdXAqa227HQPF3c3ofVkFJdUW43O8Ff5qI58vk4+Ac4RMP1gD+996WAsHDkqpJW+eVE6Nx0@vger.kernel.org
X-Gm-Message-State: AFuF++l3c+I1Qh7D3mRkusjOXuds+sprjZezWa3jsiIyDOBwpc4GSnBS
	IrR2c3U2v298XMcK2NRqmJ4TiE9yxHWME7yDHbrR4u3NRybciPydaBA8
X-Gm-Gg: AYBFou2H+/zK9dTT2MwfPSvtIunE50pAxzLrb1pGkZXo/ABJK57BryTV7p3RtxQIrq3
	wUUpkmwdEjnmdXKggel+ljMIcBBRW2o8g5GieHdAY1/2L4wKMvhlv3bVblPgrqG+HQ8MbdGMA6Q
	XdZlh5kg0RmWjM5xcS3Jig3BAWEB2MW63LWUdMe08pMIstnaagh+7Gxtib0f7oMHEbn3ixjeKgr
	3wwEcVbc3oFrEZky/ltn/4gkWB7US+FXcdA0pQ45J1Gtxgjamv1Me4WCa3JeYQlCzMWjQn5Pvch
	B94E7TwpGrfszks7zbSKw08Q6Vi1pHj4SbC9hpayuP64fxxgxXHgK9W0gtTGETjLl6xpCI8R1/E
	nH+RpVPpEnDISWC4SVAsfar3VeM8xNBFFLLUYL+rDkq1OpWiv3W5PfQXwQGPGEN4+HuNtCsuK+q
	sHK9+oIyETE+iXmiNm0jJ/vy1NSsGDOPdK7mfCEenQilF+ndvXF/dN4Ig7/Hzs3OryXF8lXj5jB
	Z15pX9tQgNfVtu4IisUN4mukY5ofLJ+evN0dCOE/WwufH81rZRyHg/okGdaBspthv4wdPUH+VJe
	Zw6XtfZ1qeWU5ODzzoWn8LhaQscBXYhsaYelIo8DdnzW5287/+FJB2kZ25bawEjswDSic0pEpHE
	elQ==
X-Received: by 2002:a05:6000:2287:b0:485:8b5c:da39 with SMTP id ffacd0b85a97d-4858b5ce1bdmr9454058f8f.12.1788601636313;
        Sat, 05 Sep 2026 02:47:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:15 -0700 (PDT)
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
Subject: [PATCH v2 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 11:46:49 +0200
Message-Id: <20260905094649.41996-10-kmehltretter@gmail.com>
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

pata_legacy no longer has the qdi and winbond module parameters:
commit 3c4d783f6922 ("ata: pata_legacy: remove VLB support") removed
both together with the VLB controller support. The entries also refer
to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE, which do
not exist either.

Drop both entries.

Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Acked-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4864e37005be..33298da28b55 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4994,19 +4994,6 @@ Kernel parameters
 			the first port in the list above (0x1f0), and so on.
 			By default all supported ports are probed.
 
-	pata_legacy.qdi=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe QDI controllers.  By default
-			set to 1 if CONFIG_PATA_QDI_MODULE, 0 otherwise.
-
-	pata_legacy.winbond=	[HW,LIBATA]
-			Format: <int>
-			Set to non-zero to probe Winbond controllers.  Use
-			the standard I/O port (0x130) if 1, otherwise the
-			value given is the I/O port to use (typically 0x1b0).
-			By default set to 1 if CONFIG_PATA_WINBOND_VLB_MODULE,
-			0 otherwise.
-
 	pata_platform.pio_mask=	[HW,LIBATA]
 			Format: <int>
 			Supported PIO mode mask.  Set individual bits to allow
-- 
2.53.0

