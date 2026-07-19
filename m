Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B1D2D7DD4
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495515; cv=none; b=Vi6X7tJjeylFMKT4HMXnKft0gBcxsCimszzgttQNKTGFRYzIgN+xqxnLieCqGCaAS+yWtouJOEV055A1colU3ekXovqFBZ2U/AlQQW6f4nHE63AUudBikrtuedjRpkzwPbuIFdtnYxYCj74dswkpfR2P2PagcIyvkEje9l6ZmAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495515; c=relaxed/simple;
	bh=DOKnoD2ZG6zgxm9ONXHYuwTCKZ2S9eKZLkwhANYRJf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BDvMuQ565EVgZ2WcnriwzOl4KpXew5JhvKj1svDcFhNz3jY6WCtqKFKZmZuxA7fDgQwuyi0US3xqYKfSSLeiNAxeRpV53F5ltJr6Z7RlzV5459K6gtRRygMjL/L3jlw6kWnYT9rGQWum5jmYTHqcGImsjfAQXSE5YVWknZws56k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0wCRFjw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0wCRFjw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so9084402a91.0
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 14:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495513; x=1785100313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gl8awQyGmjiKwuQWENOHzgNB58UOmcAca1xDTxmcvg8=;
        b=j0wCRFjwXQjxkONzfRzgu4jAto7cP8gjEGVeUeHvi2AUD/ORB5oMHJOnQHXVxEi55Z
         s3Yt33oysitKSk1w2u10hCIwLxP6AGNqpKFwfta2yhoi7cwcUYPfhqtNUHSDg5Vct4nb
         PUGp0YOrGddOjdjeQPed9brufE6EKSyAb7rAqj8KI+7/zm6eVoeMFgx38FCoiVUB78Kq
         W001AFShSp+jG2gYmaWaoXWjmYDBbxus3iw3liSLgD+e2zwGuQH8erhEwHZviQHtEcs/
         ma3e9EJgCVkNF1SIJ7xL7tpThAifosxHm6JF59fK4N3oEjXiP7hSZYyGXq+r26Al7LHE
         rLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495513; x=1785100313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gl8awQyGmjiKwuQWENOHzgNB58UOmcAca1xDTxmcvg8=;
        b=q/bk2yHjB0lWEI3fBO2ru89nuKfxqsj588a8jqF7WpwS38dfZTzuBwMbM9DHVOv6rT
         RBGPbdv8CN7rMHGVbAzKGElJRu1ogbEZCEVh/7I0CgF+hpbtqtjf8mX2leNOnSDIUS8G
         L/HE1YggxuUkWdF2yQQUZOL7vp5ZfNhvXWv90+QP0x8jhQS6WqggzJi6o+OBLQLNydi0
         FgHU5g6uZaTc2iFTUCM7SXcbvuJbdxpYgZeXIy00EXDmwwuxx3dnraMMahj3PITwwdFU
         0cRx3qsLwgrkxy2+zqirSDKwjTpENTuxLFmevW+inV9t2I9r7qM22P/Jd4Wy5ZqfuaZW
         sXIg==
X-Gm-Message-State: AOJu0Yzpo4dVDPfCky8XjPZm6wYku1FJmaInW7PhIMhsCGp7vZqmlJ/J
	lkWZ8zuBvs72QiPdfTLKqWET79Z37UAcbcaI3BIcyidwqXRwaqvjqh9z2Fontw==
X-Gm-Gg: AfdE7cno+yuUf9dmpvKt948hLQXRbSNdxW5ZBoIi7ZJSKoUVVvHtrHSQChls7lU3NG1
	Ual+T3M+IDDyladbDQ4OGqI7T1ujRSIcwcQwp4AESWszjkXrOVeHt562McTbxv6TCGQQIccjh7j
	qu+uZsx5l+rK/b1nvTfPJZijQk94b1G207e37v0N5htMwN2vAjNRRFD5DF4llzwAW3w02LloEFI
	wNm0CFV1iwgvZPQvAbx035XElg9eZ9jtfs4mdwvSFNHIav24shbQ0ZLEB1laFiwsYAo6IP1z1qu
	jIeSx2SAG4d16ry8To6FE27o/Lsi4Ay77ALXN3JfKKF96Y8CUoInx/gcCslIia/eEfjAG6lHL8b
	dC8LKMVkWruI04drUH1vT1HFQspLdGcf3Omw2fpCY/qzRUNZi9JpFhPptyyCyompsOTLD5MlvC0
	djSIfB/AxJ7RcPi3M3PZQEFpKPnW7MU7RVZfosM12BLF2T13klS6VRFdZGZTTGKfyz3D3Xzh7h7
	u24CJ2x92JRQHazpPzVLuZWrIXTSVgFsAb8JMPpIU2fgGyc+/t5vWA=
X-Received: by 2002:a17:90b:58ee:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38e4b588b44mr10793158a91.38.1784495513390;
        Sun, 19 Jul 2026 14:11:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b22bf63sm4614307a91.15.2026.07.19.14.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:11:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Khuong Dinh <khuong@os.amperecomputing.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/xgene: use devm_platform_ioremap_resource in probe
Date: Sun, 19 Jul 2026 14:11:50 -0700
Message-ID: <20260719211150.585626-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() +
devm_ioremap_resource() pair in xgene_edac_probe() with the single
helper devm_platform_ioremap_resource(), fetching the PCP CSR mapping up
front and assigning it to edac->pcp_csr after the edac context is
allocated. The redundant struct resource and the late re-ioremap are
dropped.

Built for arm64 (CONFIG_EDAC_XGENE) with LLVM=1;
drivers/edac/xgene_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/xgene_edac.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
index 9955396c9a52..92d1f15bdf30 100644
--- a/drivers/edac/xgene_edac.c
+++ b/drivers/edac/xgene_edac.c
@@ -1844,9 +1844,13 @@ static int xgene_edac_probe(struct platform_device *pdev)
 {
 	struct xgene_edac *edac;
 	struct device_node *child;
-	struct resource *res;
+	void __iomem *pcp_csr;
 	int rc;
 
+	pcp_csr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcp_csr))
+		return PTR_ERR(pcp_csr);
+
 	edac = devm_kzalloc(&pdev->dev, sizeof(*edac), GFP_KERNEL);
 	if (!edac)
 		return -ENOMEM;
@@ -1902,13 +1906,7 @@ static int xgene_edac_probe(struct platform_device *pdev)
 		edac->rb_map = NULL;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	edac->pcp_csr = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(edac->pcp_csr)) {
-		dev_err(&pdev->dev, "no PCP resource address\n");
-		rc = PTR_ERR(edac->pcp_csr);
-		goto out_err;
-	}
+	edac->pcp_csr = pcp_csr;
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		int irq;
-- 
2.55.0

