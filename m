Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FF386572
	for <linux-edac@vger.kernel.org>; Sun, 13 Sep 2026 05:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277744; cv=none; b=L9EVbtsw5dZ9HSUnFwgETTisr1cM+1k2Z8CKv6L6mn6VOHOc063j78aL7EOFvj58YBPqTxypc9vAuKZ+qa0ZTwDmjws1Wrp2Bsvs49fVRoYfj6YY/E2NfMyvG8MJRMxyFgFnEDVjbwNt587iadyG+/s2+N+Yan9YhYUXpDBwWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277744; c=relaxed/simple;
	bh=g3UkdkpCWLnZGOnt0s3r1JZYTobd2xUzpt7kHCypGs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSCfty7GseBozCNJuQoFVK6+lNwyaFfVRkk+6hP7aWs829cbi1Pkow2hv+phGLdkF43lD3RyZtPwdxaeVKtX8GH/fEs6JIH766EjFiQqpVpsHVHQUJd3Q623tQ8nl8XxuG/5OIwE8fs5m0hypscDXt5NoKIw5eo/jD04T3Bfov0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJiHx042; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJiHx042"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so977769a91.2
        for <linux-edac@vger.kernel.org>; Sat, 12 Sep 2026 22:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789277742; x=1789882542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEi52B8rAYhWrqmn6XsExZbTrS6LSYARttaUbapzORo=;
        b=FJiHx042TR+0fsP6tvu2pVf2uzcBP/43QTPIynsOu4ZvzwIb9jX3YAMQAYd4hQfB/d
         QyWjO1fJIv6o6XucjkCWl7cv6ezvMKvcXc9s7L+83/vQIomrdQZA0c24kb9MBMCfxiix
         I4mh2kzFtIEIHWK+rGlUgeRHOTlSOYfcPizdfRjb2wjlfi3ZS/0JIPUk19S6SN+papBU
         cK4e9pB9mVa9c043FbO8yWeIGXlV8BrgZnSpKpCU8eq5xTteuCpk1P8+Fr90lGDvr/f0
         ezTy59LnrmJNLYUUB0PXCDrLRHkQtFmFwvPOIwUbbHg4+oVBUk8oWuHSJlrK9DwRLJYT
         ibhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789277742; x=1789882542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEi52B8rAYhWrqmn6XsExZbTrS6LSYARttaUbapzORo=;
        b=GCnytY67rvKfgzR/TF6cBepfdS6KB9mQJ7/cWo0QZrpVVW9/M943Po8ODGWr+4QwyF
         KbM0cgVE9vImMHDCUpzj1Y4uV3aT20raieFpXgAI7l2IG+u2TKNIjmovYTnBB27MSwB4
         mVTAsmt1R+NOF/QLRUFcGAtSPvxDhesJbf+bOJa7DGwZa9SOs+HWjDeeH7jZKa3/73GT
         VKRpTfFhKYpCfdl6ikFQz7izPvLm24dy0w6BNQ6shV/8gW7JojGtnZHtkviA3/p045mU
         NcXiPBbTbWYiAsOVcUSf8sV/DFOY8rzSf6j2pB77Pg91BIoIJMa0FvIIMY/q6K+hMbIe
         oFLw==
X-Forwarded-Encrypted: i=1; AKwUvBwhZhPy/bmy/rwEBrPnwZeGml5wMN/U6iM+1zhAH5DiVEGKaED9FMsaMS8mGcolhEwQ4xBseUapzu/v@vger.kernel.org
X-Gm-Message-State: AFuF++ndfLMKSTPRSTnbs2OhXacVwY8caTeimEG6PAxyaGbs/+d9PGoW
	4q/m0yg2urJgO2ibfAhLkHBekXaariQnYyJFTKS+FoYrqrIU1jskPXMx
X-Gm-Gg: AYBFou1l/ItLO4qNGNZ+2L7MtFkQ2JGPfX5OOC+EL4rJAPbZVuLVQlP42Xh9V8SHMA2
	3PhGx9cFIceNafVam7ZIkxi8OBJDfm/wEXjDlRX0d6E0AnqT6myeNvszrCaRz7HkjDs12wfLkqc
	Bd8qjd1xY1xu2H5ENJNe05Xoj4+NxNGDla/CQzB7kq9CYIVij2IB8jAMkoV/T0FFtRWMDdQ2rG2
	U9AS+nFcgEQ3yKvc440G2kRsavQW9JwRrVPL9OEmS2Gd5Spb0NCbtDapxVrq2oiphmu4dCh81me
	wsW8d7KHiFmbn4c1UVFOQshFhEnZ4VevtHCLZzyK9xlbLBxA+I6uevM7rO0CSc/vAu8Vrs4D9pu
	S/WPyfWywLSio9DvIRnptdGeEbVTsNI1YT8v3ShvliTbHMAtKLvjm3icLOLFm530JFcXpIgIw0m
	L2Ppw5MVpSRKdlWBjkxQP1/PCJ1lPYLpwEMMFW9ERsMO5nJ8rY7Dzkl7CASAU+puyS
X-Received: by 2002:a17:90b:4fc5:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39d9bd71246mr21202876a91.9.1789277742198;
        Sat, 12 Sep 2026 22:35:42 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm13277134a91.7.2026.09.12.22.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 22:35:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] EDAC/versalnet: fix remoteproc reference leak
Date: Sun, 13 Sep 2026 13:35:32 +0800
Message-ID: <20260913053532.1324671-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mc_probe() acquires a reference to the remote processor with
rproc_get_by_phandle(), but mc_remove() does not release the reference.

rproc_shutdown() only balances the power reference acquired by
rproc_boot(); it does not drop the device reference acquired by
rproc_get_by_phandle(). As a result, successful driver removal leaves
the remoteproc reference unbalanced.

Call rproc_put() during removal to release the reference acquired in
mc_probe().

This issue was found by manual code inspection.

Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/edac/versalnet_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 97ec05d68bbb..3a06b41c1d84 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -953,6 +953,7 @@ static void mc_remove(struct platform_device *pdev)
 	remove_versalnet(priv);
 	rproc_shutdown(priv->mcdi->r5_rproc);
 	cdx_mcdi_finish(priv->mcdi);
+	rproc_put(priv->mcdi->r5_rproc);
 	kfree(priv->mcdi);
 }
 
-- 
2.43.0

