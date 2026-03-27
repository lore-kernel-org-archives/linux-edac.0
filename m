Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41DE3BADB5
	for <linux-edac@vger.kernel.org>; Fri, 27 Mar 2026 14:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774623436; cv=none; b=nPSOoOylCjvtMnyokefDA41UGPO2/FZZxCB+2QqdVRBMQA4uIzhyNAKf4Qvs6sbS1zEXAz7XPhVidCqiJ7jtTPr72lVRkXJUYmxTb3cIaoJ0/RwVacCVMzMk5fudPs7LWkB9sQDCmNBa9BljJ9jR/m+n8Mq+7c7Do1ZYuKUoZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774623436; c=relaxed/simple;
	bh=9699wlmglMM9NOqYCMKkR8oDNhZpkagi2TI4FdcIrzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rJatakMBnfzamtRS4ntAMtgWLfFcLGDRMBvMqDmUSwIiuivVI2DcqPu+hmVs1H2kUuvjDeSpQQqA1TNnJk0bgV5L1LmjP37vAECv3hJDPvgG5QNyrdGCgrPjQudK4UQfO27ZUvDgEK6TQUNJBfQR+iez8GW5hOTUlQlpAUPE5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxIO+wYE; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxIO+wYE"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56b890d1687so1933694e0c.3
        for <linux-edac@vger.kernel.org>; Fri, 27 Mar 2026 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774623433; x=1775228233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XJQcKGdkpP5G2c6c8EG3NLWIVMsiIxZKQbXqCl8RBE=;
        b=hxIO+wYE26NQgTdT+nkUxl58vJGieq01p8Io4ghI24plWIwuLbjh2r8mGDEWuHN4Dx
         WuMtdI/JICkEiO0dIE4EtWEABOVK6IgrTKIlPNRBuL6sqnVFJO7QyQKVGedCuB8B296G
         K9+mecSgs0qZi0nvabVwzG19SfEj6l7dNcIShhXHZSb5crHQ09VjGbkgj8uIpzs/nSKx
         peNBfWdn9Uw8I9/9XZ8HUC5pdosSLeLPkqJuoEsJfO+686Ze1DH+n3U/73/R+n5qkX6M
         zPRkw2mpDzstbZgEr2joDZGJ/JgAXTVcBwr3xPASw+MQZqawco0H6lAAyGFaZHYPXlWN
         Vcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774623433; x=1775228233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XJQcKGdkpP5G2c6c8EG3NLWIVMsiIxZKQbXqCl8RBE=;
        b=VpdRcjdtQwxn8OzdcInbj03jMEIuG/67PPgDXqZnrzq+Qk2StYK7AuX9TM3CtRIzun
         IJ27je+Hr0FT7NLx3YBLNyZxI5kE/uhPXJ2do1n4COGp8Zn0xeFxDAg1dj79tFRbWo/3
         nTPuIjXoBF1oWcESdeUCC/KUEWetv9Ex1JmKH6YmHHlEyi92skf1Y8SFg4n63Q2SM/av
         WmMjKtEB3zvmJ0X2XDJZC6FzbCZcwObetcBQiyYX3hj33aEmOmOU5v1i5GhrCnacTqOh
         2uRNv9uAgP+ccNAO2dINfeSwGmfMz8ZzDWAebKlhBQENh7k9lYQ6pywZAN+VPGv5SEWY
         0H3A==
X-Forwarded-Encrypted: i=1; AJvYcCUCl1FXZKzk8CGryYvO/GerZ7vCfLUj+P5I1XJrnwTYQc37DScMtiKJjulc+dc5Y0F9VlfyuAXVXMey@vger.kernel.org
X-Gm-Message-State: AOJu0YzncQG3pjFm7qMbBBUgPs+jvqB1xVX33klXTHpo5PXxZBeJywEe
	b6e+Ftc2p1tgrqBx3UHnLuISV38a0ZZ5zFPa/6JeDAtQSuNocOTrpjZ4
X-Gm-Gg: ATEYQzxFHSIGYyzN9s4ZeMxcKoqS7o80mzWe8Q2tKQ02+bk9rpBFp33IH4xvkWSC28S
	QiQFoVvzeV2x++TWuqYv/bgptO7gTvojkGn/uxCkgOJ+Hl29G1Km4Rq2DAr4uaEPkMf1aHgjrwh
	YJlE5d/5xzWdZF9oxKmI1iTeKZOXHIds7UrP8VbzardlvHiRlEUbKeTMtqqrAYr4BVgMlWxw+t5
	c4mJxwD8wwg73wGfvAthXUp8cmyeAk4c3k0Cuz291s+y3SipNCnXkDOf7bqSXAH7W6USHL6PRfa
	mT63Znut9PnEqQNeKayo1IDP3HOpzhvKAjVGzN/cZwzuvPjb98cWj3I6xBA7FOKyIPMjkoh1EVb
	gVxPcJVNZoXCZSAj2IHD1QG1Uo6j+BGW4NxyIA0ncmVaq1fE3sTDnXh1MdFVmEihdIZ2xQ1ItdX
	tk4m2pH2WOhASFOcuuuY9+HBta7pC9dwabxhfBaXvjUTr2BJfqCe4AGe3svTmf405v/7ZaJXsZx
	1uU7w==
X-Received: by 2002:a05:6122:4690:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-56d4a4c45d9mr1248203e0c.4.1774623433306;
        Fri, 27 Mar 2026 07:57:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f5:b08b:d413:3987:a2d7:5385:7178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31c3097fsm9080590e0c.7.2026.03.27.07.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:57:12 -0700 (PDT)
From: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
To: Jason Baron <jbaron@akamai.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Marilene Andrade Garcia <marilene.agarcia@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH] EDAC/ie31200: Make rpl_s_cfg static
Date: Fri, 27 Mar 2026 11:55:57 -0300
Message-Id: <f353c3aff47abd88bafc46a1c0c5eb9917e11b28.1774619301.git.marilene.agarcia@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse reports:
drivers/edac/ie31200_edac.c:709:19: warning: symbol 'rpl_s_cfg' was not
declared. Should it be static?

rpl_s_cfg is only used within this file, so mark it static to fix the
warning

Signed-off-by: Marilene Andrade Garcia <marilene.agarcia@gmail.com>
---

Hello maintainers,

After running Sparse in the linux-next branch, I noticed the above warning.
I would was wondering if you agree with this proposed fix.

Thank you for your time.

Best regards,
Marilene Andrade Garcia

 drivers/edac/ie31200_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index eaab6af143e1..a5dc4b88097f 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -706,7 +706,7 @@ static struct res_config skl_cfg = {
 	.reg_mad_dimm_width_mask[1]	= GENMASK(25, 24),
 };
 
-struct res_config rpl_s_cfg = {
+static struct res_config rpl_s_cfg = {
 	.mtype				= MEM_DDR5,
 	.cmci				= true,
 	.imc_num			= 2,

base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
-- 
2.34.1

