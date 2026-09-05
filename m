Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2928D233956
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591843; cv=none; b=eauprNYTTgKlZ9TK3fknbhNAhCD9P2UlfC/8nwnZ7azYhRXeq6KESZUpo2NBr4BRxtk8KDwIoEo9VeTZe8XqYQb44d+jInauH+KzOnXRVUq0YFhr4GANOwIrl3A89jfokRh0cmDrxS7E3l0a59od8R/k0gqG0LVobENeiZbCLjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591843; c=relaxed/simple;
	bh=mhOUqwN3oOeKlzw4AsIblKh3dvC9P48S/odFVVFSApM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UPQ5/dgiv8nB80aLNgQ6/00rCy6z1/5IH0f4JaKmPMd2y1akZJKgJACM2HdzW9dhpXhhZuPKoOmSziEFNdkNuP7tGyAXpShRBC3dDvEGcK2HW5gkPJRr5rj/qZRLE6cdVaY0o0uZjtWabTlHekLEDCCyZcBW8Jw6n+dS+fg120I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rTtTkvs6; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTtTkvs6"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-484392e3d33so1153223f8f.2
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591837; x=1789196637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=rTtTkvs6rM4NMcTBt8xaHA01lBlWiXX3jY40M7exjflP2eSuk0fXtdEIVw962mYre4
         Ppkhcmkyfiy99qBQIutIEDXPYrNbMzpER24nQZGdCVpycjI6q5KVdpUKf7835Z626bmN
         0XYU9d3/pG6cwOndupi0QvQi6RdAnlwn51MBcM8TP+BCx+Oj6nw5Wy1oefcXyYw/RX8U
         PlSdHcYzEtkmipy9uv6trEmsh6UITF6Equj/68D50/aotKv+wmjg3xY5J4LrzFrWl1pv
         4ATLBMbxQZg0lwHvXoZGKMF5rEB138MBB7DThJYARD28T63bmsjfq9M9mDodqWNgAR6p
         vVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591837; x=1789196637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqbG77xAuC4eDU7XlaYrFKEyC2xRrttTZAEX6ejP9/I=;
        b=iq6uXeUzss2+QCLwgqiamBhVQ5vZLixs5f/keps6wQlCOxBvMz05+RWY3W4O/NCmPe
         36ZVSZZRkgedOogh6w3iv2Wsn8s+Na/0OPC/GvbrVHmA99ZR4hE1Jcv2UsEcjsclu9Ns
         s28//sDIH4MbBDRpjktd/UNF0eviFzKegCrnspTSWMPSCPSJzw1vh7F6pSQRfqjrN2nO
         /JTbrEIgfwbBdYZj4cqvshOrdGlf5Tas3wFKwOUHwq4Ac0GcNnansOnIr15FZMtdn3hT
         JfGaqvwZuVXO9RZ53kEOI4xe2Dt9yg9EYlPFc/Bdbqqbc8TUUqvjS/i+u9YcG4IZPLoj
         kXNg==
X-Forwarded-Encrypted: i=1; AKwUvBwz1KhmuX9hn82/JbE8asTXw5thYn5h27W7WimrAJWJnR02ZW7YMOCy+RhpDQdadl2gvp9yEkcSg+km@vger.kernel.org
X-Gm-Message-State: AFuF++ke0uxr1/fSBXhZjJpIHiDygS4iqrYoOegErKwLmFuTSYzxkPK5
	6hx968a+49kYr1cRD/COyhuYCawx9GB3I5cmL5MJ3k7SDyqn1NVML8J4
X-Gm-Gg: AYBFou2esSwMKqXZbGPZ9wWDEbgWwaEcpk6QjQ273PyZFf/9y4uhZ3UXTRfUN3W3jgO
	NI7fnDRRukXINgtnieK/tomJEieycp/SUBJeNyih5UaLPwjXGH7s2rlSFLTZfPe6fIOrbuuLUHw
	iIQRJSWwwda2K3zQ56KRet21bLdbE3kvolo6tORDRR3a1F4zoiq8OpXviSoBufrg2YAgMqdprkN
	0iaZHQymPOYTUuv4zLXIy1fXDan29haczcf2oLJM95oo8TRr63zAPF/hESf1RtDhqAI3nsHPRPM
	pxwR/nVDIURgep3FPtLZC6hxxDkqk7F38oaKcwzJdKxSEVfrjllxug2DwzU8oWxpQZDiwCxQh3t
	ML/hNvvVbiCw+8PS8RcbpjT1BxCk2eUHvmKD+D/PVlp8Oci5YyWXBwt8V9H5odDkGDl0PzI0tSK
	iugaISyz0gO5kIXfe9GM08Xjb7MDYCeojlgzFev+KbSFmAC+ujP5EDn5dSSYA6jGVYRuFdkZ6gI
	Go4vqzRxM7C8YuJ0yvlSj6BogazqMGvRS1ghWJOlWzBngJ2AmY5TmtbNJsTfD7xVecmIjTde/Yw
	LIcTv7Rxzw7r3vyOdqQJ6s9La99+GncyL9xuaw70lzEWEzfthxq0OXx58gPERhAu+Oqh6/EP
X-Received: by 2002:a05:6000:1a85:b0:485:8c17:9775 with SMTP id ffacd0b85a97d-4858c179a0emr7751270f8f.55.1788591836769;
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:56 -0700 (PDT)
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
Subject: [PATCH 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 09:03:39 +0200
Message-Id: <20260905070347.25902-2-kmehltretter@gmail.com>
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

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

