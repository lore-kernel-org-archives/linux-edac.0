Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581983F482C
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601632; cv=none; b=JVhcfVP+V+ht9ba/4r8aEmfhcMkG2Uh4Qe1T8VbVxJToonvKm0JT6RsEoLYWzdRnGSyLL8eNClgYwWGhmgiuH3nM1yJZh/WGvBt4U+BnK7eb4wcWe/7HL9x6fLDszetTdqycHThkbMNxUKqUInXeU7mfvgrXbQKJs90AbG6tyhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601632; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ggytWGJDreXVjxQA59C2UCnPggdwqfexb9yUMYray4Ce4Tp06Vztbu85Bz4+HhCzjopa3OIfu5CXDCGvkAD0RHc9KqELRJsa3yEwmwOE8U/fuBeXJhb5rRBap4UkTeEPjyZap1pv4QIrHQydWW9vBuTgHNAbfUQcmZYc6jiV5Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sS3GkGDt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sS3GkGDt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so1129563f8f.0
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601626; x=1789206426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=sS3GkGDtOZOrxGVH2ecp8Y9BijuvKIZGE9cRol9c394h++PWXXMUkrbfk4MaucH7Xb
         U6xnSpOgpPlCLgGRJgFJusDEMpGl6GoEPagk0EBRDekWebDNSJ9c2+7bDODP5t5sx6WO
         S7qWSKaOAWth8EWw5f4FyoVQksRMC12WKRbvoec5wN9+mVJAxfr0JzbGojpcXGDPLycy
         Wm8keJ8zf60yL0isTXgjllly0MsmA/q9Yly09xrEJx9E+b1vfnw2Do6nlXQGx7bqY2/W
         iT83xkaYf1IN7FJtaRTK97E2OxZs+3sKatwn2475v/Wkqn0YcgJ9E5z39H73lyE+5dXm
         3iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601626; x=1789206426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=XxwGqCtSiLPNrm6exhTXq3QjRBQv4ccPc0o/DBdw+DTpv0FHzyXnGSWoEjqvvjCeTr
         8F4/uVj3agAC02G8xXppmKHPI3DYXOH09vusgx8+RKliHyhObZou75VkyIrOPAepzODC
         WXWRLtExhz9wNjCNpXFTG5xOG9BtEed1zApM6Si6Ru0g7YkX22Q1ABtxjsz11X5L/a90
         DKh/K9Za/dkskHVoWouVhOAjx8QJK279Qu1UwLugrkQWGXU8t6kEwAmMGl7tnLPUo7aT
         jBVstcSQKYqMfO+adHlvym0UpfS+3HLLNU8aeySpp/nOvDnYzB5jxsd+MpAwA7sS9zel
         0tkg==
X-Forwarded-Encrypted: i=1; AKwUvBxM57pUk22y19LZjHNsJCTR3l74bLy96lvAszgd2c4vMwprPPg53EHTkOH4y+fzlRSgbmillTxyoU7V@vger.kernel.org
X-Gm-Message-State: AFuF++kLyawFP5yyjqR6P9xPIWgF8CDjj2OMQ3Qu+Cm9CxLRNtXBesbi
	HoR/iW5/bGdBTa9UbH/6S4WcyvYs7vxNcc59NpQgAHAmH1E8eEt8UWhS
X-Gm-Gg: AYBFou0jlJ6RkcGzwJawM22gKdKPLHEDGW70opH9/hV9ENLB/0CUveyzGOb293G5F1p
	LJp84jzb0Ug/0A1/YWpovznBaENZTC/J9bxlXG96pdzJU1b1FBXdtvurFkBN8+l0YZd/hxPWwjU
	wsl0tMvv9Zulr4FtG60moQ3LC7jeMUJi1adpFxj0NA4B+wZWGmgGrst3H6XqKebw1tjadnDTuRQ
	ytsmq71PJ1qI9HvWP0J8ltura7p5RRYBg9/IYYsUX/N6XOHMgoSTSDEDyw4Vi4aqo6YHtFtOdR8
	2WFW97hluYdDhIzPDSAuZs8SQbfQVXv+ZUjB1gtA5QFp703Y4aPZ1Prtah3tkZ5jlGFNQwufjXl
	LW5S0qKYWBHtiU10R01IqIs4/wlhjVk/jA1YWb6jn1nO749B71J21GouXqxFLj1kQWJmuexQEsA
	M1x9kPnaNG5mOdzVkYV5yEbxHI0X45SY0V2magfUEPfd5iegyGZ7iu6lm3Ww6oRcEakYy1oGaGd
	ha0q8JrRw+i+Xmhl6qoYdpi3HOh+zdYjBxv9bFJY/sEYP5cedevX+KpC7qErcqiT0pwxppB2Fio
	5gAOwLyVuJeF1YQ5QqYbSAJ9hJ+IC1XlCWvJXiXUPbnta4oTu2ASt9TyocpNVTVTbec=
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr21220202f8f.13.1788601625675;
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
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
Subject: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 11:46:43 +0200
Message-Id: <20260905094649.41996-4-kmehltretter@gmail.com>
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

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

