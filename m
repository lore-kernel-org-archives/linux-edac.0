Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439536;
	b=qilbvzgSZNn4d9c/lxtHZ7CHF9R0cpsuv3Apm4PMq0+/moZEMsMeVU9JiIIqlpVw6p71
	 7VQboHAaKoJb6iV4Ie751RqgnYFGBmj01RbKh3QkITj/Rr4p8AM4tzPSyIrH/R6iPrRy/
	 y0D20RR1haYK/bebQAwuVhIRroFUP1SJd+e8evg/7TaUdD045/7XB03GbIaHRSPuk3iXU
	 kVuCCi+k6LeEXZUqxmfAWd0PM5UoBYVulh8gwN0F060OalO6nthTEFfTX07JEPSXmXHh4
	 WjVmuVMQRO2Xa8pe/t5qL3JQ+JzP3c2ukRj0NhUax3iiS83Jq67DpwjeJu1RzUsGjcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=48wpzd2rRuW6jSp7Tlrac3vDJDtgbTZqBF+kHuRo3/A=;
	b=ET1tqJfd3TukTP6OEAO638Whz0rOSI73QvjPqts2JfhtYKHdFl8jXJSuTG9NnPAgUsdW
	 a0lAdTbv1r1/YY9qkt6q8lrJ9KTmg0y57f+1AN5yikiM2BcW3AnM6MRodJd8JqeYbkFOD
	 mHbG3KmppdtXzqCyOytTMcmhI4//CY01B6fhbSO9uxps6Aq5dNpe1X5BAbhzrfvyd9eBV
	 oUffC5p0c8vivHQ0wOY5ZHZTuhwv8shBJO7rRfHSHl5MzoD1ZnBSXj9PkbxOfSKVIRVDO
	 YgC6npbk2wpfkT3yN0I1cnY1nkmi34AOjwH5VCjQCYcKUVt2IU//vOxYEt3W6/+Ar4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F626SGWm;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2B5606A33B
	for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 23:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F2B5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F626SGWm
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2498396eec.0
        for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 15:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439535; x=1795044335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48wpzd2rRuW6jSp7Tlrac3vDJDtgbTZqBF+kHuRo3/A=;
        b=F626SGWmtxKJ8cQRouGxWZfd2oKHQGb5C0wqkYnagzeeDuzZuq35L1IDSNMek29Gbm
         jjV6g15QjNix+Wxzi+SEeMPH6mflxEzLRXVC2wptnYQEncIBjML3C1xEtIPnlcDDk288
         Y667CEWU6m4Faoxc68tCVVqOb3EZSTjdnP8HveGT4mOxveRnpHH+vxvYJHvrmLwNKpVB
         VNQOhkmks2dhO+Y0g6JWYNZs0TMEQm+lJIav5ta/pxoR7AvkX8wszblbWVy00Je0DbhM
         kxXLMT0R15OsxjD2mn+W/nHO4JV17woJ6EDHU0oBTTk81WyFf2cQWeXFEgnZx2aBzo8r
         Aw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439535; x=1795044335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=48wpzd2rRuW6jSp7Tlrac3vDJDtgbTZqBF+kHuRo3/A=;
        b=kj/kbkxKrFfS++qqGkVl+rL7PGSsG9CXw7/BmcdTnGhhiJaNQUjJ/ydp8oa5AOHdCg
         zRCuUFRp81Nn6v2AcCnyjFypsr2J1e12s64g5JgJhjedQr+8ehnKqsNWoohJm2RbVpCU
         eJliQb9rP8aSOSq9KV7cSAfYtFPnjU3O9AGYBbWIurUP8ANEPeYt0EcZkIbcpUiYOMmt
         gsDA8FO3pcpGRvAe9gmE9AvGV4RFAuQh/oBFtilmwgjOWo6ANijHzXXqN7Aw348ZnNx9
         si7dkhzhE70xJm1bRmINYcDIYIDy7WBrsEPWshn1h/xip7GtdTeO+DPmIms9lGjNLia2
         D6Tw==
X-Forwarded-Encrypted: i=1; AL+hErEt5Srqm33a4mc2FEZF8bpPDHhIdF6fJV6NnIbx5NFltsKMEmq9qkg0OIiJaPUsswnIwOnl7MFMykrZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/u+Jq/hUmNH/ucSUSYL1SO6vCDrh58Qzp/TGsPhQO8Zm74AyyM
	+l8pA/ilR1zjiHDI4fbXAcqJ4JydhCe4DBJUyUC3G2tLnvBZwn+wkDh1
X-Gm-Gg: AYBFou2RTCTBkirJ2o8Kd09+upt0wPY9cX6g42EuA7F8NEaGUwg2g7dFPSbtfErhCit
	1b5GsNyRl/uI3IH2eUj12kcFrLt/QyoVLfq81rA/sSip33Yrg4Q1PsCwO+1YycleY+Dr5ukmJ/A
	YQCcaexuuM+CgikLZIc7Yd557jwcaqXIftjWpGab8lJTqkdNdF+DyrxxfZX6FjzAAInNKqJrpxU
	3rcatAYIdEfGWRc4ICBr0pfVPG/n6uHtO4jK6kOzKByvqwskS0Z0LektQfCBSRLEbiYGCJ3/Weu
	hX5+2khDOyDRKtTWWYHukXlCs+Vn6oufnXm9U6PyOMPtxH4wSFpARd1/Nsm7m/QorMufHYIQhFJ
	KL/cU8Pf/9RiUqTU5KPeqhj07TWtO5V34f/VpoNrpFmwwH+z3B2jjNbNp4JbtmKQ/IoB2hu4fOx
	CAg0ZBdrdrn4eLphPG4sJx/ShzAWK+AHlDtRUdR/rQ1xt5tyx77BdM1p53csD48zdzFfdhhfn0N
	xw+FrMIZXUk+zlrs4IpKrluwSxMK7OnKcGN2L4Ar42PRKu1BL+aApPNAZ8NwHTNt60GOm+r7wUq
	+jb39LhHWlmcaopDKID3FrW/Kzlt7bO8Co3ZSA493A==
X-Received: by 2002:a05:7301:2901:b0:36b:d3dd:2e9d with SMTP id 5a478bee46e88-37686278c31mr5725653eec.19.1794439535470;
        Wed, 11 Nov 2026 15:25:35 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm22626946eec.26.2026.11.11.15.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:25:34 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH 2/2] Revert "EDAC/i5000: Mark as BROKEN"
Date: Wed, 11 Nov 2026 15:25:29 -0800
Message-ID: <20261111232529.407154-3-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111232529.407154-1-andrew.luebke@gmail.com>
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
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

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Assisted-by: LLM
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
 drivers/edac/Kconfig | 1 -
 1 file changed, 1 deletion(-)

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

