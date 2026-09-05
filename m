Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B43E3D93
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591861; cv=none; b=FReqwJ8KZbcxgDRqRptYjJIiSySbPscrwyRePJchXxvNAtul6TsFk3QuAMO68+PO4CUD1NvZlKIYxaAzi4VSI0y+zut0EAM0x9ZLbpdaSsGvKHy12filS2UJNW/F79oTya5o3EemGb3IYoS2Xkq33n7C7zBxlE+YkHt1FxJ8BH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591861; c=relaxed/simple;
	bh=pPxPTNpM/nAKvWxY9H5AEsCMADngEkeEEOle128cyr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzapOSRZEsRRDpS4O6ZebYL5qCS59qgHaGBdTRqbOEaxix5KY6IiSIF3r8qfsBvvZ9nrX4sUaDVXiTW5b45zTItjdyO9faCutcVByycfOYCplF6zV5ggjuSc6d9Ac459SZ4RpeENmt3dH/NLAFBa121VaPeishK6PMuOOruocfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ufys3Hf4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ufys3Hf4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48584dc164fso1703334f8f.0
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591851; x=1789196651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=Ufys3Hf40M0EzhImnoudR3WSMUwBOrbN7Taboome5GjqVtxwI5tiMndrMjUZtrzb0u
         tK6f+gTpLgllMJq0uTRIdVUM2ba7tKqF+hT6HsioTq1CslyQk1sgjTW7fogCc0Aavtrn
         B28WJP153FbCtnjpSgK4GIYtwAAKNOI8b3qfrR8lBeoGtsPx2WrNMM+iS21NEvcrdJ+Y
         koxzHGYZxc+KDRfoCxwoW3zmi7MOUoLxcLyZNLQR5L8Q4I+VMXuUOVbI5gKB2VgJyFXw
         0+LanghEEKkSJWdgoQB2B4+HX5qgLUjnIKBD8aqa7MWY8nQgLLnNj5vzsTFRCVEtpd2r
         C7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591851; x=1789196651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0TEPPXgHP97qr/cFTbi2WII06m9YnzLfHQVRRK4PYs=;
        b=C2kk7aF7otFaDxmxIYpolJTQkM8YnfGYZyqCCQCpg1B85w436LEN/7bwltV7lYIFuU
         fT87701/iJ9wFFgtREoY04czr1ODclDpXqzwJxkgRTyNcN2YXSaFPxmeBZX3b1zMeaJu
         qxuRXaw1/1JXZazriGo1FfpN8fXfIAkDknfICVJvfrbDZvmv28iA/SNo4S3hlkeYRDi/
         BN2mNhQSWr1UFCMQWCADEruz9juYV50BCt4b6KqF3iW7c0tGZFsN5xCNyAD28AjuD8QE
         rGCT7odmOFwWdJ5XKmgiyDY1qytE2pHPIp2x8xswP925uIm9SIP486SAMagkDuqanrC0
         aOeg==
X-Forwarded-Encrypted: i=1; AKwUvBwy8jE8rxEdY2Wvz92mkUK4dPyqPc1iClP8Oy48Lha84nYi4J2muIki5BLSI5jf1eQ2ZOxvIH838JMu@vger.kernel.org
X-Gm-Message-State: AFuF++k3ThdVmY9VsD4U+wGfcU7YL2kTOVpVdDKaLJ74fbyd91lEyY2c
	3h5FBrcUl1FALb8L/LlIXgQpivPDxnjApXheFsGK2zbEBLQ233HawCtH
X-Gm-Gg: AYBFou2rOLWOrhfjjZNFGD46wsc6pCcaE4WJNabEDiw2wId3GuXbXhT8BCWoZpOfv1N
	sPmJBRINpfo0tanx/O4uhe4Owzr4P20SEdPrXWLEYyhoGrdhujEAec4bvf2JDQ67cfbISS+Oa94
	HtT8q1Tnb7bLAmZnnEmZE/7BkRC73qBhoAx2adSWp/bUUYgkGT4ZtPJcXRdkEOuTInjsaftZCZB
	lmJ/eY+dSriBL2NPZ541k0oUAdaf2oT01MW0io24FJf5vVzuS2NPoouWa6Xa3EF4jXQiI2B0o1r
	lUr0Z/O9fhH4Z1X1fXrdGFOnEoOeQax704LD7EmiXSRdEiiCNuF4GshgD6Ah5+OqtJmssYO5Q1g
	l9Am/WossdlePTsZVe4/J6J+qmPbNSgoYhwkQGe1DCNouwg3SKiXlcFy8jx9NCdPrT5yziKQ+Gl
	o79l8WvvErZbZ9dB4qAd9cCOW5mI+wtpJFcsqS/3Hzhi3UhhBGA4HhdBDF8BP7YcVmJWhNkz+HN
	Nao/KVL6mgMXz8cKeDxC5vRFlZUeyhGrn0dlmraDgIBS0Tp89PGcgfkpm17piCLcLoYCQY15E4L
	+H+101k5EyOPXptVPPCdBZI35+YE0IKECTTTFn5WjyavSAEeYB4CFqpBLBhIm4w7wTkNG554
X-Received: by 2002:a05:6000:24c4:b0:485:8a46:7053 with SMTP id ffacd0b85a97d-4858a467176mr9452131f8f.37.1788591850939;
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:10 -0700 (PDT)
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
Subject: [PATCH 9/9] docs: kernel-parameters: Drop the pata_legacy.qdi and pata_legacy.winbond entries
Date: Sat,  5 Sep 2026 09:03:47 +0200
Message-Id: <20260905070347.25902-10-kmehltretter@gmail.com>
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

pata_legacy no longer has qdi or winbond module parameters. The QDI
support went away with commit 0dcd0a76370a ("libata: remove no longer
needed pata_qdi driver") and the Winbond VLB support with commit
3c4d783f6922 ("ata: pata_legacy: remove VLB support"). The entries also
refer to CONFIG_PATA_QDI_MODULE and CONFIG_PATA_WINBOND_VLB_MODULE,
which do not exist either.

Drop both entries.

Fixes: 0dcd0a76370a ("libata: remove no longer needed pata_qdi driver")
Fixes: 3c4d783f6922 ("ata: pata_legacy: remove VLB support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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

