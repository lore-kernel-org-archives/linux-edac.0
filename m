Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBF71A23A4
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 01:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287358; cv=none; b=pjEnCcgGQnCayhbZPwSztvwIVdewnjswLJSeVnAJ8e40z0d6Mqm85H3K5MlwE+p9JipNhZbgCBicpA0592YS7/Ule5FOw2UTw0oJNF5ga08265VShm/oD4L1kJzQlLlAfKiLeScWN8jgUvWvB5S3gR+bZPkGQekTIiKkF1PCLIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287358; c=relaxed/simple;
	bh=t6/u2P6+Vkua2HqDZjIyPVeI0z/YSk1bYiBhvWL3XD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TN0AIrttBx2YQq8L3IyayrTVOBpXv/kzvC8vzq8rNDqhZrvXqT5E/935st6Pk6Y7qBBfWl43YiMoktJDVRpRmrDOwQZutI79HM8Be8g53uaWqf+yz3u0Pq+t5Qco3CEkxyGtaLhz/DxjwDf9k/8bVkbsZrMJL47sHoSy5aCcgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=duEfC1wj; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="duEfC1wj"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8f186025973so4695986d6.0
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 18:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785287356; x=1785892156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GL/99mhED3zPnt57gPILZJmOU8WHYxYQKPi1ksbN7qU=;
        b=duEfC1wjJ0Ck/g7YhHw78hAPmW00INxeXTLt2vvTQE/W/v7jRSTXdhOSt6bFtjOWlw
         tf+62/CvjCYvlLTG4BI0SfEEOssNU5CYDCi2+9IwScyrJ3PYIQpMskHDh7IWbOKXHmNG
         rW757XNCnKJrs9/6gHqnH49HGutFEOkkR889ikVHPH1SGr9yHuPrA9kUKT86z7GemKDz
         GOahupfV2D1enn2y9deRjtQhwHjzOywqqFfn1s6ctE5VnVXEQQS44Mzi9BWMk5LKLd8A
         /ryGkfY2kDm93MvkMuRuCWncXinOVlSPYPFgtC1YRHeQxemPEEkHPWIRu40WxvRvaFWT
         fh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287356; x=1785892156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GL/99mhED3zPnt57gPILZJmOU8WHYxYQKPi1ksbN7qU=;
        b=gBdxHcdyDRB5RlGMN5SYwxEOdm/kQguuTGMcEElZC37DEFMiKYegrdbmiZlIz/h8Ua
         VB14XHEg1+RG5qUauXsxyn6667zf/cDQN6oQzrehsiCKBY5WyZUqfWRUZPDvFTzzphPG
         hjC9dvvQdL7Hg/1wK3K8DGGE95oR2ovTRGVXJWLkRsvm3v0smC3PbQ1CY1VvwSibzY1n
         yj2HXEPjmaGuq+Fyg//X7Fj/586NLB+h3DjgwUewG/2gc5Jc6wxUHANlqsNrYzdep9n7
         ZX+b8UC2OBEJtAY2EzuECmdX8wwkWdHlT7Hf0lW3gJY0I36XxGrcSHh3STlramE6jtJO
         aRUg==
X-Gm-Message-State: AOJu0YxulCC+2Uxie89BacIhMgeCaPNVneM1wrxMf0WYHf2EFDNNbHhR
	QiTFq021XVw2mGmaXDWJv0Iv/l8KhlYTddP+PfAgTpRzth8wntdMfomB1PAHCe3d
X-Gm-Gg: AR+sD100M33LJb9a1mlIVPnq2vGuPUUc13u30r4WhRPOZDrAHKSoNslsfzv/ejpFmKt
	/ds+n+c/CGpA+lpTHqTdmLm+F2uB+HfYJYBcTT4PfPO3NeVLhAGovWJqdHvWGPpPIM/f0HAZ+GE
	UmxM6TWO2LOQ2DsWHq3Zs2hpSzBj1Y1s6aYRnd94r8ShLVKUzsG73J2A+vHXBtac1ihgUC4WXB6
	w7e7DIqq1lMHmjz67kqDdHuLjeKldNgPUC0wRN+wVhhTj8elF/f4OcudCKOylHZv4kDhoG4Ypjo
	vxItp3sod8XLDhWqgCPhAtedUZrmtubwFJfb8vcj5vxJx9OTl/ooDUYlM7833eaXzEhlu/FXHTh
	kRSLy6jFOW+9jn07c+jKqxJ+j8FMlIhbhjD7RU/mtSroySOeJIW8WqsRqUieoBiERksa4aFj1j/
	eUUv2dRGeGTndNHr6o/X6geMTVyxHFTvTDLqK+8VbWhi8E9KYYAV2ul6AEoEz+Rm3oQ5cLd6Ji6
	v+SzXEo5mVplP9XG52RivzyzKc7UlbaOICgamhAAyp2EPoHF9qSDynO6YyV+nLJNbAewGa50F5r
	iVg/+NjYmQwpT5ViuQsc7JPkF4X4YkHA4EdLgg==
X-Received: by 2002:a05:620a:f0e:b0:92b:6805:91b5 with SMTP id af79cd13be357-933026d30d1mr482796685a.61.1785287355722;
        Tue, 28 Jul 2026 18:09:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933d3275216sm60508485a.18.2026.07.28.18.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:09:15 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] EDAC/highbank: Use of_device_get_match_data()
Date: Tue, 28 Jul 2026 18:09:12 -0700
Message-ID: <20260729010912.608027-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use of_device_get_match_data() to retrieve the memory controller settings
instead of dereferencing match->data directly.

Keep the explicit OF match lookup because the driver still uses the
matched compatible string for the EDAC controller name.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/highbank_mc_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/highbank_mc_edac.c b/drivers/edac/highbank_mc_edac.c
index 68d16cc8298d..ee1f15fe6986 100644
--- a/drivers/edac/highbank_mc_edac.c
+++ b/drivers/edac/highbank_mc_edac.c
@@ -201,7 +201,7 @@ static int highbank_mc_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	settings = id->data;
+	settings = of_device_get_match_data(&pdev->dev);
 	drvdata->mc_err_base = base + settings->err_offset;
 	drvdata->mc_int_base = base + settings->int_offset;
 
-- 
2.55.0

