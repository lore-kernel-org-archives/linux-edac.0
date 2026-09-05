Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C963A3E3170
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591862; cv=none; b=Vum0fklqI7iJvPvRLQ1FhrQ9rYALtGkA1O7LponvU191OBGo6EZo8umAcTjJPB2YQoYpIJZ6O0mEolodroolIe0P02cgzx6k1rfvNF/m5HJfHtEVkLh8ezkIr7n7r2HjWLD0FpntT/jeKyqatvfh3mZVb85YbDr1OjojQCOtcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591862; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L7klc3U1HwrSt71uT/J5yP1TAPsdvZY7C8Ddu9AhC2xJ0qlD2iBPdZ/qz0hRldc0KuL53I2ekNoe/vdFwi39PM0JO5FWPsZr3/BkmdUX6nqzNMthqfC68oelpRtEqfjO2eilAFzkFo0mvCWOXdEdHoXOA15PoXXjn/hwRQ7IyJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/VnKgEw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/VnKgEw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1162271f8f.0
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591849; x=1789196649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=n/VnKgEwCzZzuUfJUOeRE+oKzjhVOyufVIm6bkaulaLPTDQm2Udno1JesGrfw+QtXz
         rtm2HC9oekj6emqCHGdjmj8Tg7GtyOqUaLYn/RB0+FVYHZ+4xb5I8BszVLSoWQKWnUOz
         ykiTBqE6hq7UgsTha8RD7CuhFhhy5kDjFQBiQCgcgB3RGwGNRMX3Pg7/TRuIJqfw2a9F
         EpjIsiNmxO6bXgxOyi0EgzQ+9+XnRBpbp+/MkKVQI+xT0XzSfP9iUXr4eIb3HBe1Orv8
         BHqNJmEGTo7OOeFNbie58dyBfFSSmVSCeP0DGssZQo3HSLtGpMSaveVk3WFXlSZhC0II
         gtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591849; x=1789196649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=nmGeRbsAfGd2+pnVclsw5XFNpaYpC1RMt9YBgQ5PPa2J9BzuZMxwSfoQ/MuB1XXEd3
         pDwxVNj1oV24nPdyclb3K3CoWHXZdh3Mjv3HPLezy1WmX9E6nlHsIjklJhvpavGAgJ4G
         WmbuBLiGIPJtqLEoQFHA3OIRZwEcBfJFW2zQprd2fIaI5AYffMUNLqR7m/fTWnj65E6E
         mzekJpmaIYFFJIJWltLNzi/7UMU7XclNNUXLHoqRVaPZkEMh5xiQjvWnRUJz7iKY4ZEF
         MworfJnoZLQToEQ8Tv7SYiU2Ul96NC+k1bwDgZY1Ys3mZ0Nt9ZU/H9DcZRGo5+Uv6wag
         FXBA==
X-Forwarded-Encrypted: i=1; AKwUvBzyDbJ1JjpuZPIa2HAfnOobiR1A4nK7tD6RrT1IniOOpCyK6iT+oPAGWI/U/4jrezAEq/WWUpGU4boS@vger.kernel.org
X-Gm-Message-State: AFuF++mGkwyV6P4QlqifUdqsG+n7obTmB+E/cEhTlc21w/NwyEHmRjJI
	FacBgsBzLnPLyOwHH/Th03XXX1uPoqiTFd+aEWLhYvG/cut35HTCIR1c
X-Gm-Gg: AYBFou0Z42jAmm+T3z+RpTyeSDnjNPT2McpwdxsHTVKe+ucNHWlmzt84OkADP3/ak3o
	7hcdaBOLvQsD5enW6FuALYYZwYt1WMt4AypCssH1a311rzLMqroRtAikjBeKSXoHCx5sz9WFbvu
	nNKHgmvCOBbSLkIEFiAlJ/tPNvPwEW3WWV4FBrvmCW+PDkTD9pseZJEUFmfG5CHmfZ/UTSMYp6l
	Zq6Tcfkav5KuZjNHgfXqGtrn0+G/zGXtWWN02vdNbyflE9SA8Ydoc0+MB3vqfK5hGsoEidNbVP0
	sqmNA++aDIP0sZbNmNHqHskMazWR6vWr8MnxVozt/B05YuXM3xyO041o8MJi3aRz32xgNnaWEPa
	iImJKqeQCGBU7TwDWyO6/+gihHn6bE4H1uHNLpYMrzB9zXxqg1/w6kYXrQARyrv1TSvfMd6KJKJ
	5Dgju7XeBxkFV/vqLlvUHzqgWxKixHYpV+jdKqgs2gKfyzMxXrQ86IdbIyPyoxGnuB+9RftC53X
	XhDuSamJFEdOOEwNWBhk4VPBQPAzoZmIwj3AcDoK6omM1Fnezo3Q0kjucKNXqekE/UWkSXi0BPt
	F1wYR+PEmhMXxRLmYq52qyefmmTcwXKsPt5he9Jida7BKwBYHXb52vVnVxq/tQ8q4WeXwkEx
X-Received: by 2002:a05:6000:46c8:b0:484:3f43:4914 with SMTP id ffacd0b85a97d-485872a6622mr9310761f8f.20.1788591849363;
        Sat, 05 Sep 2026 00:04:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:08 -0700 (PDT)
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
Subject: [PATCH 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 09:03:46 +0200
Message-Id: <20260905070347.25902-9-kmehltretter@gmail.com>
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

