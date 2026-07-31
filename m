Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0461A276038
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460897; cv=none; b=b6b0x7B/FomS1tr2Vb1XXk9ujGB2kS0tNLPIVjtMQWZhOeT3lR9bZFe6JbvxB0I2dmycs8TuG+ha0WNp+ukffCwI7wszUmtam/AvPhM3ZFomZ/fKS2MPTbvgwPy+19Cn0i6BRUJg6fC55GaoiwtBVpz5BH9ELYtTOnMenSXx7OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460897; c=relaxed/simple;
	bh=EXM737zPqfFOz8c2oTEgN+Z9Ea1EJcWSCZdWPrOgRko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BByyq2HvUOfzEroXNscPxTs+2ay4fpYOH+siI3K6Nc2teVa/idiG8EPlQ5ZH9CE01w7cllmmIi4V/nNFpYrvBKvDeuQNIky1FEjPhYtw6WLnFexgGMvVi92Qvh28rhUojnzY0+wx2iIYRPq2TE06tqc5TI1sOvpnqODdc/4ZFxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACbXCwf+; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACbXCwf+"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e88b60121so384056a91.3
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 18:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460895; x=1786065695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQZ7kr/xVyL8NQz8gujRJuKRFxvmEh5rg2s5p7tnoi8=;
        b=ACbXCwf+1lg8uvDFgch52bEubs2P4s6luW+0X55FFZ3ZagcQj6DKL/Xl56du73stR8
         zKP3cltNvk5fqBhoxzRUgVSWoWbefCHdH8qiTri6ywnkXEiIOOcNokXyO5GqGbcRYfEe
         IfGUHp9o/Y4KU5NTk9K2MbYUwnjPqZCnQhf94Rk2GbkSeIEmAb6qcXaYd4zyvFM4nsNz
         A2ylIVZbIRdBoXHzfqcu8ZRxpgws/4MTVintDRbB8eM8+2VzjkIwgsePC0mZDPu2w0Sk
         wzEqMREAIkL4zWsWOZc+pvjW9/zcSpKYBn7FD4HRC1rSK3U6rCEQdYizFXY4chijez+t
         kvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460895; x=1786065695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQZ7kr/xVyL8NQz8gujRJuKRFxvmEh5rg2s5p7tnoi8=;
        b=jZUMdW7MQFgLzG3uB2kg2OOEVjceHL5/TbDk5QJcpuSCObVWxL0fX+oYdinTBFf7UR
         ZXPn1MhbDUEq44PnjAabNCWKGb9qj+wNP95ecjNOU8PvRQSaQ/4KOjs4mqZEvi16c4co
         T9Yrk2lFJbQnKuinXkW6El8XBxfooBjPXMDvMIM47ak7n1O8E3cUDoCcZGnpJ9jtSBz+
         4FnkEWv6mLn0LgsJIFPgsagH31phZP1dum0a1HAuWfqetYQrfXrMBPSMmRP4BGF9vW0k
         qwcN9ovonoGl6TXHwwxNK42rtqS8ppN2C9id4b44acpljaTo1hLzJ2u3zg3uiqeKNm6h
         JAQg==
X-Gm-Message-State: AOJu0YzYKgGvn8vhIbr8rSDYx0mKuw41vVZh3UjG0TWhUsMyo1RHW1Ob
	akXvvPUQG3SS8MdRFYIsIFIyRc+nvDw4cL/Os4clHtFF7VMGY4yvXmGxue2ndg==
X-Gm-Gg: AR+sD11fYl0t35IC+JAnfG5TgYJZQ6c0l7QaxhYcJJ6qvcck5MRe9XKeOpSf1d+z2DW
	WJCP94Vpr7sVZ6trnV9zt1JDZ2BPlhfOFqcueQp+HMykVnl2CZcUZHq8Dfq2n8wOulOjbFO1Min
	tF7cy+IEZmmuw+Me+fdocOsabZs3U8kTUdWbwRgxtDsq6fNZ7onKC1XkU8waz8M0MF5kWNpFASH
	6+5ca4w5IJqHo7DYjEQo/tpYd4LZJI83j5ZC4NDwIUIjdlAUyGo5cf7EWnf9FHTW/oRMkGb3xfu
	E1v7IoWiL9LVEv+lEPs9LJVLDdwTgiuq0q23TAmjVri5SnQhXO+lrt4Qo9cnfa8U7qPSa8MNkEG
	6p0i9SH+z0KoD+BzypzQEx0cU+v3MadykNi1/iOZ4mb4HdUgz8NG/SWpMpLGSJgKh8nc/MBNkEk
	DftjSRNCkaFQ0AVeDKq8LF61usVFmfeGUKU4KsJn6KpgQlR6/xfWqZRFnOZcN7IBs56o998Keo9
	HQJ0LH62sxhFxW9zjI6biArcb6g7DhsfFf5jajINmQ/2qIq9tKb5x4L+9SEDXR0nqCK+0oFpOvX
	2lmShHNrFSftD25zSkMejinytVDHKc4uR+/WMwW/DljXesUo
X-Received: by 2002:a17:90b:4ac1:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38fb13c3a7amr108448a91.20.1785460895317;
        Thu, 30 Jul 2026 18:21:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 2/3] EDAC/fsl_ddr: use non devm for request_irq()
Date: Thu, 30 Jul 2026 18:21:29 -0700
Message-ID: <20260731012130.1212640-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to tear down the irq before edac_mc_free() to avoid a use after
free on teardown as request_irq uses mci as dev_id.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 3745eec67335..c505fb268474 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -599,7 +599,7 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 		/* register interrupts */
 		pdata->irq = platform_get_irq(op, 0);
-		res = devm_request_irq(&op->dev, pdata->irq,
+		res = request_irq(pdata->irq,
 				       fsl_mc_isr,
 				       IRQF_SHARED,
 				       "[EDAC] MC err", mci);
@@ -635,6 +635,7 @@ void fsl_mc_err_remove(struct platform_device *op)
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+		free_irq(pdata->irq, mci);
 	}
 
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
-- 
2.55.0

