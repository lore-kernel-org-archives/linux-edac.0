Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507088;
	b=KLCQGLIcA5SeyAQz57vWtVEi4L08Kt7SzNGsPcPuZ8wMW4kg82mUmjFZTxdxAJIB1y8H
	 XF6eVB4m/lWvMEHG6GBI3GerFKEPk+8cEzBwwWAyVDfUfqEQhv7TXnn3yajllxHhQVQI9
	 r5FDvBXw7JvPbah6lq8tpd16JBXfipQYn1suQsPpfY+BY4NMX3JFw+FunH0XyAdN+r5ax
	 p60jjx8xX+OhbqyswuXdio8hJJOQvAK6B6pYrr1reToAO/t5v4W1O+tgNOf25tq/D/oqA
	 Wk5K1IvNOgAzlrP8GHWxTrDakI551Dm3JbOk/9hT9J1GBxT16GklolaDBemyLnbnVfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2gkhFUEZhZL3R13P9KqCeOSqB0UlsNfQup+MwcWDhUw=;
	b=vwwjXMFmuWYgp69IsEGU5mqq9+T7TUm9ezk1Lzur4xBYHTIMgA25WfjWbak/08M+wZAI
	 J9330pcmUyjUqgvIAOI7PRU8IV+k6Yh47a9dYZwgnQYeGVBwYlla4dy0SqFYnDNpB5xOE
	 725XWAFMSQBMQvcSduo9H4jgeTRLY3PRxQBt1dwS/5rpF/HnS4o0+GXRkz90WLDVaaHWz
	 dqAGFIs2Tz2q3HVHNXBKUaBx/uY0ucBeh1NcpMSxT85lgclamB+1NuhDAe9CYpJJ1XL/Z
	 CEB8KXvnaZjbIvw8x7uvcckfGI/8zitVzqt9QfofamlkdNCVBW+vM1Edo/90kJ2XN7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlPF3Srp;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F57606A33E
	for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 18:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F57606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlPF3Srp
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so327268eec.0
        for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 10:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507087; x=1795111887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gkhFUEZhZL3R13P9KqCeOSqB0UlsNfQup+MwcWDhUw=;
        b=VlPF3SrpMuhL4dauhSEeZQot8mXX4O4FbXY6Pp73CAsEyX7JANKhHwFqxavpWq1D8j
         dXH7T43sZgKgenXAlJeuVNekRPpHy8b3/jgXE/EB0LqJuIVEU7vd4ANcaqtPcVzRZk8M
         j1KtSjM06xCfyrcslXg3skcKAPeEpKBPW0fHV2iR3Lthq1plavgzaIzCxFkrJ5zirBKv
         N+M6U6AaiZSUL2NRk3ZwFV0yVbAxcHUNEcfh53cYIi4Npn/2PfwIquSZGkvxppYidahW
         k2cnn6eB8SXkyoO8HCM4f0Bh6dPckiBwhAezM1yOM5EPnZ1xi30M03SJqrYuNGtr7Miu
         3wlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507087; x=1795111887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gkhFUEZhZL3R13P9KqCeOSqB0UlsNfQup+MwcWDhUw=;
        b=px/iFUQ9eMfKsHUfk3rXtOpvLVbkgWBqKOLRGZHyMjJc57GRGnzXft6kAW+uuAH/8e
         8UMrvnLfktx+T/if63zubeTn2wuXTgseK2aFGd0n036eBLSrJ0osXxkXjPpsce4TkkLn
         lgP2EDbsWLjJmo6CMXIAiqr/d2iigZ2LbwgoM41zVoklf+DEyqY3Kr5J/EfqFvtrsa3S
         hdkJ8o/2PxW21PK8EFW+dCfg3+O3m74/FEUOuAaxpdmSLSCck9t22Eak3CofVOphCO8n
         Wtlg9hXqRm0pubccADblD1tpLwnJrw7ZWlrzSFAtzDBJY1yKRYSVqrciVNK0tkUyFM/x
         6UoQ==
X-Forwarded-Encrypted: i=1; AL+hErEg6aHFMAxJI2lEV1GNEHWojTux+jcagcF+KdJtfbGtgVYLan76dVOuQEYpDdV7M8msTlvmC4ctR/ec@vger.kernel.org
X-Gm-Message-State: APuU4Z/ynbvXNoyMfzUEjBaJIjpvSP9kGPT67CxxynLMaG/WYO61cpBv
	CD/TOK1qEhQBYigg1K64MDkqxOpxxGFie/ZJjEkicH35sQ4ZRWKftJjj
X-Gm-Gg: AYBFou2S2Mt2etPqVqb+1XDTME1gxneDAnBoIOcVh3eDF0XLC2xtJ8+w3UpJpvLVhDo
	Eo3w3EjcADEFqiLq1RfbUXCRfj2S4PLl+LkWoXs46SdwLaisH7HPldV/FNISiweiO+XtxpCtwqF
	5a6YlZmGFF0wNn1VUxsBXEpDM4O9DDXaFOQ9zqCOh9jfzRZDc9hv8f6jAsN3S2/Q20HilRV5S/c
	YftgjdybDiTuW+TnPbIInze1SEeaIPNV8VvouUw6leIXHENHNViH9JFoZl33qBJFlySsuumf7k6
	4wVqsTcQ7vSZ9hQA5Rrbr6o1UM4hqQkerSRGgqn0m1u9HGFYZsQlA3JLvLP8ZRlCDpTsWEFPoLO
	kksQccuPxjlbildjV5dEQYDQ//e0Qfdligr83m+2DAyV8owFX7IDp7cqZVmFsOPtrdM339PEwlE
	skUf8ofXmiO9lVwM76Rgnr5EJXto0+8MhVCWdrYAv4LkfEFYM+uevEimpcc/WbNLsyD3gjcPaIb
	/vy51RI/fu0XRc38URnCqKmmGj+QUASJa9PtwXskExqm2VEFzy/2sdkzoUOsllMIu1ibaR/9f1R
	iXajcO4E+PnasrE6PwwVM0AnBuq/qKquWjAsnqpF7g==
X-Received: by 2002:a05:7300:d0a3:b0:367:185e:867a with SMTP id 5a478bee46e88-37687212a27mr6162231eec.38.1794507086925;
        Thu, 12 Nov 2026 10:11:26 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm215678eec.4.2026.11.12.10.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:11:26 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2 2/2] Revert "EDAC/i5000: Mark as BROKEN"
Date: Thu, 12 Nov 2026 10:11:21 -0800
Message-ID: <20261112181121.565824-3-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112181121.565824-1-andrew.luebke@gmail.com>
References: <20261112181121.565824-1-andrew.luebke@gmail.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 7556419180a3 ("EDAC/i5000: Mark as BROKEN").

The driver was marked BROKEN, instead of taking the slot loop fix,
because nobody had the hardware to check it with single- and dual-ranked
DIMMs [1]. With the previous patch it loads on an HP xw8400 (5000X) with
all eight slots populated, reports single- and dual-ranked FB-DIMMs with
the right size at the right branch, channel and slot, and stays clean
under KASAN and UBSAN bounds checking.

Two-channel boards (5000V/5000Z) and error reporting are not tested.

Add myself as a reviewer for the driver, as I have the hardware to test
future patches.

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Assisted-by: LLM
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
v2: add myself as a reviewer in MAINTAINERS (Boris)

 MAINTAINERS          | 1 +
 drivers/edac/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 222b7fc2c3aa..e1aa80d5bda3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9702,6 +9702,7 @@ S:	Orphan
 F:	drivers/edac/i3200_edac.c
 
 EDAC-I5000
+R:	Andrew Luebke <andrew.luebke@gmail.com>
 L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/i5000_edac.c
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729b0d3a..63f263c4263d 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -218,7 +218,6 @@ config EDAC_I82860
 config EDAC_I5000
 	tristate "Intel Greencreek/Blackford chipset"
 	depends on X86 && PCI
-	depends on BROKEN
 	help
 	  Support for error detection and correction the Intel
 	  Greekcreek/Blackford chipsets.
-- 
2.47.3

