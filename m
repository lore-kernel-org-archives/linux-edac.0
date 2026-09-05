Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71183391E77
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601643; cv=none; b=XIuSY+sM+Dir8vL+gKiF2bMN3VoZuwISOhxNbOGFE9VysTUnoMNq3CjZWT+hdZcnC9/OmtXd4r6NjxH60foK7SO8PdDsqr1TUKifHdi3WYzwPNs1vOzrUYk8vbjTvwHGYzxNUdMQ5tXGHNCokH7ukZdgS9z+wqrrLlaKYt7fLMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601643; c=relaxed/simple;
	bh=tXKjfoKiXZ7V6wID0vROu3EjAKBYvGUXtlTaR3CzeO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nqIF+AULM4azV6XV0QWirYTNW61Izhv+OeKvu9CK7ik+sy9bzvl6vcqVQnqM6r4h8q8T9+gBnNZxiAEp1Qt7nlkGB4VELiXhGaRiyGdkmXNqbyyAzKoTTgziiagHzwbFHG3e8uhOKJ0nt/dRPjnarIWm8DRpupQs9vG6oKj0vvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEVPm1zf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEVPm1zf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so16713735e9.3
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601633; x=1789206433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=IEVPm1zfJ3dYP4k/o2iihvqOZUQoa934q5meWH63sSrsaeYufweygjH57c8MV9NFx+
         lkQAY6pKYddn41/9VK2PK5XddDJhNrdTbnuKAaBUqJQj/pQ1hH6uaKHFaFZpYydnqWif
         iYUdcJQ3zgkHLUpus7f+x7lrko4HImMasZiYYCKwX92AsuKXxzX4Y+PE06+v3awXu8z+
         aKzCjivlRQudT5FLIn5THmRE9Yuu+YyNddrBqUxqTa60piZAC4sp1gP0mr3F9Jdu435L
         vGAvspUcmCZfuLpNewH/64WPN2GxRDd6MstWVz0P/WNasjh8mB9Q/dxa4Btjp3Ij8KrL
         cImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601633; x=1789206433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0boECcjjn/VFHFH6rk1vpO238PkXNlP4zHZKdanKNnE=;
        b=XIAleOFRKk7m25I3+5h30UAWttzFSavPP0r17HkQvultUn/zx68nHYwcPI/NNxFkSy
         iIbsnzEm7ULkMBMATLsGMwY1cXGDvT8L6yCI5HDyZYTB3S3dBXdTEAn6TZnm6xTdwA5j
         YeMTU04LHPBqFNyk1ol1p19cdwC5nqYc33GVSboqqhTgg6ZA8lYq+NyOhG9XRbAbZ5Cb
         GYy9mxYlzQk/PWdQG/tuY1uleXtx4Uigj1itBp4hGbCt4E6xKSwiisXVjj76HhyJ32F2
         aszaVBJ0MklcupyQreQOtHKwhhPJbAMQ01D9vhjl9lAVpl1qJv+Svd47uqDteBaKDwb8
         94cg==
X-Forwarded-Encrypted: i=1; AKwUvBypfMbF6greBqDeF1Oyq+7zjtdbCzQFNMGDkz4IZH9GlNzKVMqizJtJuL3gt3uR1I7ntuic63ampR56@vger.kernel.org
X-Gm-Message-State: AFuF++kvFeRntxuDOxRnlQT7CCcrR/ZAmmK5vIEUwj0SFg4uAfQEldIJ
	PdU+rdy/aykHF04CmriDOpW8XaQ0XFIvAubJ3OPfGH4IewDZcSH5NvKsxXX+Lteq
X-Gm-Gg: AYBFou1XLVv0r3xAi70etFKtM1yVuPmGSairalYDSQIxo0AzplQl+R1j9eNjy82QjuC
	g8zb8/Hj/IEUEZSMQEz9OBQtrbY132e6QkBR7UUZCUDZKGzimfj6Wn6yims3gppB/5gYDhQdy6/
	j+SIkQueRs0MxBogWdMrNgZDwf6T5Mu/16w9CL8hp8DGGLLa1nS8ea+qUu6PXMuer0UlVzeRAmw
	5PUtrjyTmvWEfb1/oqEguCrRJtEYzMKjFMFmFAX5S8ckLlhGExX/5MYuqg7D7fnei/ucTygkSvT
	2mETkAKNro+DLMgYFHLto6cMhjSpB5kaxYq7JnmYrC7Q6D4MGXj54OXZDVT9ee/6ilyvbxs0Lzy
	FLTE28HuvoXYFOSmM5cDCmUO8CFY5yp20QUQ3O0/EsAtoLs8raDFLG5U+0HATQHfo1JLRwHLQiF
	2ENfoCrlLRZHxAM4+EKqcUeOT6lNOLXVPQMUdPLiVefyIyQuUDxXuA0pK0alYpzeeLj1PqXPeas
	Lfq5XEbqhNM7Yv4mMyK4XL9gZPVdC9/J3tM3lUk87a3W2dfCBkVLwmG8UA0+892DQx7mq9ew+lP
	oCdvOP//jfByUPEzGVJm/YcGrqjpfh3Ms0zaI0zdDzG7BzworGYZ2KoXF88DF0KRIYs=
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr260260105e9.10.1788601632697;
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:12 -0700 (PDT)
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
Subject: [PATCH v2 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 11:46:47 +0200
Message-Id: <20260905094649.41996-8-kmehltretter@gmail.com>
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d44728a45506..48dd273eaf6c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,11 +4765,6 @@ Kernel parameters
 			waiting for the ACK, so if this is set too high
 			interrupts *may* be lost!
 
-	omap_mux=	[OMAP] Override bootloader pin multiplexing.
-			Format: <mux_mode0.mode_name=value>...
-			For example, to override I2C bus2:
-			omap_mux=i2c2_scl.i2c2_scl=0x100,i2c2_sda.i2c2_sda=0x100
-
 	onenand.bdry=	[HW,MTD] Flex-OneNAND Boundary Configuration
 
 			Format: [die0_boundary][,die0_lock][,die1_boundary][,die1_lock]
-- 
2.53.0

