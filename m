Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A96B43DA2D
	for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 14:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423362; cv=none; b=aRSE1y94JMJxFRKYy0Sw9sezzAerzllWiwS0Q32eUHXv72L8vm8FCE36UgpKV+DxZbWGEvMXO0HeMhULFrL49JCJJIJwyTG+iuRoC7IZjdR64951Ja32WOFHE2ZGbw8oLyRlB/UGwYJ253ehiEEB1ZGkkX6LO6pyrdxwG58kWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423362; c=relaxed/simple;
	bh=6d6a6opuXTN9H4VHkMA8Ovce9yM3y41HUy6w/yHPAHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gL9COyXmySsUVvLI4T+TQEtV1n0MmKgSNIuOF+xGtACz6129RSKJmGvS4zvuIb+meEZNguMzkTZwph4+xTwVoMfAk/akqXK3jXrfUSZGsKauh0ZI+PKASLKhcNNglGFChhy4zWqN/7nhnP8hLfK6H6JbQmG7rES1TY7IVYVccmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCXeRynh; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCXeRynh"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1445684f8f.0
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785423359; x=1786028159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=putRlIHUpdFyZ3nmd/q6KtU72HQBPLS010r6rfjazVQ=;
        b=MCXeRynhCeRGOodQOZPv8+5fHz7mynwvc5itvX/GoafMRL/rbyC1xjJixY0ZUCGoYX
         HLsJQi2K7C2PBZV43/Nf8f8fUgl0MOBoEnOC7bYZv7Ae/nROp4VnlesXAO2UGrvra5nu
         db51xcym11Qzo+i8UWsrps7FjgnPBgXfgwfAkcxRcDos92Gfiz4KuFA/C0r01Og/zPra
         7bkPOUAznmTdp4u4S/D/oL9b766hej4CBmBsZKqSY6j6y4ceIL1wtnbtRuNgscF3+1d7
         oPb0RCQyPJa9myRgS9YalcdTP9hEypeFB2miPnFV0KchnkwdHOOpXZu3/3PRjJuSxKaQ
         xL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423359; x=1786028159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=putRlIHUpdFyZ3nmd/q6KtU72HQBPLS010r6rfjazVQ=;
        b=GSsvbfmbNeGgoTdIpTssnGmHOw9UcPGFFtqavUeDrvfes4f3a4OpLbgQ0fVBd/kGas
         YDhfijspOxOFQlTun7u8xs5VCRBslQxvcs6H4VGyN2SYy3yGXtqIEWXcjoxpU7FY7dMV
         0TFqaB4Srov8l8nNDEJmMAu9lPdIn5DGQZe5yncK1jHV1a/Le6KR1mOpUz4TQbYZkwKa
         ANJqrR0sxQGscYv3FrsfSEJg5Z4hP4v0U1ib2jtJ9WfwRiUlGRyXV6F75VlqT2mXbPu7
         SlH0EQhuP5wc9X7ZUqu7yNm7EtyswCS5nlrlSu3PObfU8rKJ/yHKan17fJA9sdMS0zff
         Jfsw==
X-Gm-Message-State: AOJu0YyHUejIE6j8si6SGD5omNrks12Znu7IBdpHDFPAdxWUTmv57L6V
	8VSiegj4pF9P0W7LeCST0Rl7I9tLJgGiakqCKzMGGXAdOPzTIPAsyVquMvnT+r+J6DA=
X-Gm-Gg: AR+sD1031e9SjB0o48ylUqrh9pgTbP3ZnlmvadUe8Bf/4uprEVxXGo8TJ8w884G/gpe
	ayYTuAwv+2fCP+kTDBUcG006oqRbfdnMQl0zO6B0RPPerslkEPvGw3nyij9GzTOs+NFCaWA6P14
	AhTDsYn/Uac4d5XnQ2OWU5o7mG7fPLjBBdp2ob9x0BPfk8hF9UhdjdiC7tVWtNeq/qk+HffQDwv
	KXVXB7cydjZx+MpfTjpIQ/mORyc8jPVt9QKL4N8UYkm5TZSMEiL3Uz4JVFuRpoAwPrkAb4ZVaEi
	eyKdZqqDPal8G1a21TBrqZpCCoTM7NbkkjdoVdtgtXqIXzPqJ3lYjRM4/yX8Mu8Nah+Fc0P1BER
	3AVBDxryjAXy52vnhKS/48ZUHkJ9rjdTy59xfGiNqPNDEM3xpnX1Kzjm0flfn/Zh8LJ5RiePL27
	ktamVIkWWdMGfE8yTiQolRjd11WaT1mn3JiJEoBqzWzS35I+fuHvDr2Oi48tps/C3pCph3MvHi8
	jv3AWuz19V7hM0yJRxmqgeWt+6+mqA0IqbijCsN9Q==
X-Received: by 2002:a05:6000:420f:b0:47f:959f:f69c with SMTP id ffacd0b85a97d-47fc81ed15bmr4314815f8f.7.1785423358350;
        Thu, 30 Jul 2026 07:55:58 -0700 (PDT)
Received: from fedora ([105.190.201.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d985csm7257138f8f.1.2026.07.30.07.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 07:55:57 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: linux-edac@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 1/2] EDAC/device_sysfs: Use kstrtouint for poll_msec to prevent truncation
Date: Thu, 30 Jul 2026 15:55:48 +0100
Message-ID: <20260730145549.148229-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The poll_msec sysfs store uses simple_strtoul() which accepts an
unsigned long, but the target field (poll_msec) is unsigned int. On
64-bit systems, a value > UINT_MAX is silently truncated when stored.

Fix the mismatch by using kstrtouint() instead. This rejects values
> UINT_MAX at parse time, making truncation impossible. Also add a
check for value < 1 to reject the 0-delay case, which would cause the
poll work to spin without delay and consume 100% CPU.

Fixes: e27e3dac6517 ("drivers/edac: add edac_device class")
Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device_sysfs.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index ac678b4a21fc..e2ee5c6c56d3 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -90,14 +90,21 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
 					*ctl_info, const char *data,
 					size_t count)
 {
-	unsigned long value;
+	unsigned int value;
+	int ret;
 
 	/* get the value and enforce that it is non-zero, must be at least
 	 * one millisecond for the delay period, between scans
 	 * Then cancel last outstanding delay for the work request
 	 * and set a new one.
 	 */
-	value = simple_strtoul(data, NULL, 0);
+	ret = kstrtouint(data, 0, &value);
+	if (ret < 0)
+		return ret;
+
+	if (value < 1)
+		return -EINVAL;
+
 	edac_device_reset_delay_period(ctl_info, value);
 
 	return count;
-- 
2.55.0

