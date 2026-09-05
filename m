Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6642B3DB658
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591859; cv=none; b=PNzvpwMLRiik930Bgz+zvvMPAXA+oHJDKvYRqfCVlC2RniPiMtBsRPrhf2hy0wdwHlVS4hqlZpIed53GmY6LNGfbkvLm4P+3FXtdA2U3edmlIM+fjORyyx0zxdHsKxnLMVjhawTZMMBI1KV8qGsaRlgqUFfhXJJzyCzqJIJp93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591859; c=relaxed/simple;
	bh=ItZT5GNunHVnueIdaFQjAOk/BPjP1n6HkFAdihTWgYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IqOuoxmGb1jHwF33deBEKs6aVFLDyxzU/0QjPhgxyaWeExqZEyqP6O7WgDhRpC2V5J5EhaN7tvpAH++mw3va4Pm2PhFU2rF+UVENAl4V+J82ZLDxZNiOvn3xmDhthsXN8KP2wI/3eu9+eWHsZklwb+O9L3CeKu6EijK1ZQq7V5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ot2TgaTS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ot2TgaTS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1912759f8f.3
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591848; x=1789196648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=ot2TgaTSFyf0JGzHOS0qVEAf6ZxzDDZ9GbwaoviLSwiAMvTFLOKcRxlwvGcTuqHzw5
         EkRs1xP7nf03aZMrJAMt2A4vqFH6X5rfGTK0/Vyri5Ijk2c4UffB1TcG58IRkXtYgSV1
         Lqiczg4F7DVsT/bfD8Dx4iw+ZCRZ0G+oAO5ESiQxUiSEN3HFL52rQVd2QFAYy01WVJvc
         AuwmYB7H4ehU2TRk4SWu99reuV00ExXtZkNHcXcIzps/tOjkWE+FX3P8hYqnEYJ1/MCI
         dpBI0NJG8Rj8bLcFMvzVpenCY3Q55LPB62VZMu36usLLEDEOOWtHzGUhvARquerAn5BG
         Sbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591848; x=1789196648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFzQQFmCjPVcuR+l7FGQ0u8MffPmow8qd7a6fWjai5g=;
        b=B9M3+8LxxICgMVHT8JoPCIFP6aNaMfsnMhN7TvA4fso2zyBhKeMKsQlrBYnAPf+Vqy
         HaS9AWYEeEeXx7boLV7c56MR3b6nvkKA3NxrkNwmTCrSoCwTECZ5GDsJq9Y9aTGcdQST
         0HmFwKtaw6EdlQYQ2JHykaC5T4egSRtP0KvL6LMWxjwLw4tka0rgLpXeol+PuWEivESK
         5LjgJ76kFBUhJWlljZudiO8xNetF+5rc2/qn9C2oV7uuAWXl7HqB/gVk+ceje/BARXLv
         9JBwioiAPa2icMVwZPDKrQp7mjZmOs2PE7zQJ9eIK2F/Iy6l4vQdDzM6pQbXhpgOzAgh
         Xb6A==
X-Forwarded-Encrypted: i=1; AKwUvBw001kA55tQQere3YSIrxDc1vqhg6IcRkQQzvjs9gPEQP4XwQTz7VVGDoaJKilOYD8lN4UUUGHJHOpN@vger.kernel.org
X-Gm-Message-State: AFuF++mUGkYiXF2i+78Um57GHzw84gkZiGpgOrnAUCmStlY1bw9+NJee
	NAAawMPEVJfEWJUtenZTa9IbV5oCMlqjqeRPbgb+86g87r45s9fgrC3O
X-Gm-Gg: AYBFou2w1b/7/yFdpYDNIEuD05zJg70gHXO3J6slMpJxHOGYlWaCyvtE8XGUbpzpaQa
	i3DUk8yHnR/iH90+oXe6AIQkRYmvChFUur3S1XqvBc93zk0p1NOSeiItOkIM0L+EOoPTKdFpjwe
	ArqMmFWnMVJehDXZ4W4gjKRHFR7YaS5eGRZepOogYQmHZ+K3xaMgTHBYgt25I4DqYad/Gs+ZcU7
	UUjVNEEUU6mso0jqrcvlkYvLHv6JHeSEw8VME5Hf1+g6+qkHAeo1LjHQvIbOwoeWSGidu2Dq1F2
	KpyXLo+VM1WxhqqSd/vLwCS8CyJ8fQZahwoPNvbxGzNd7f28voQ2NtsQ78kgzGypeIJyo/QyWCi
	C1nU0pw3Psp5+sdsAs5ZMxDrtg44Ge1GL3s3+ALQN3jvLxQvpAVpldi+2TWRvy85Vx8MG5K2+Mr
	Vckkb02ZK+/DdKY+TiwjI5xh1usJSEFN8YnvNW5aObck0dERme6dG8F2lRSt5kgD+s9+RMS6IR/
	RHdMgmu+FjCP1o4z8y1FZoto2do5IbjrPMugaZg3oxldCPuBW0lSCPosBzg7lz+ri+Y4/JpBlXa
	4B3FmuRyYFCU8Yoe9Ps18gRMVHJd/qEpV65Iwl25G/WVUo7UDE/duuqG1mZRTmgi/6209aVojAm
	/9asozzM=
X-Received: by 2002:a5d:5f55:0:b0:481:503b:b663 with SMTP id ffacd0b85a97d-48587091856mr13328658f8f.18.1788591847580;
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:07 -0700 (PDT)
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
Subject: [PATCH 7/9] docs: kernel-parameters: Drop the omap_mux= entry
Date: Sat,  5 Sep 2026 09:03:45 +0200
Message-Id: <20260905070347.25902-8-kmehltretter@gmail.com>
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

omap_mux= went away with commit e9f5f1e45608 ("ARM: OMAP2+: Remove
legacy mux code"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: e9f5f1e45608 ("ARM: OMAP2+: Remove legacy mux code")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
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

