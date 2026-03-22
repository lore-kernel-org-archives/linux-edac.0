Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1582ECE9B;
	Sun, 22 Mar 2026 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185106; cv=none; b=S5T2FUEY2sZyA1wyNL0Z2FdvK5xNj06En19PTQiXKc2Prx+w5LH/b9de0c5SsrRnMZ0ftwSpFVekvPFeQgLhMy2dCwk0NQah3dx7s57tc+nbCQsWlkgrNLjVMMsmv45YpmABFJSOkccvkQU7MQazbncoJX3RI/JrSkBFkiJ4vM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185106; c=relaxed/simple;
	bh=JlJMxGdckNnvDSmKsHS+ovLiN2WFqaP3Xh0e+Bhm5g8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCf6v8gum/gy6yIYeMLY9wmIKyNnZK8p5Q164r/NAP/Epn9vMGL3HNl497/v0UgHb+W/fTvlUn3sdaS6eSXZoBQonxgzg1v/Bo/C/Bt7BL3YjfBIxorViSMpvwZ4TNQcbBoHcHQSh1KhnjOnfOc+jlgrB7zCxsz3PHi2Djbvrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=UYVkt68M; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="UYVkt68M"
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 68DB320B7129;
	Sun, 22 Mar 2026 06:11:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 68DB320B7129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1774185105;
	bh=YUSjsxMb1Qlb5AfAu427DsuO/MxFoG7htH8lXZE7gm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UYVkt68MYf4B1k6k0KjtXQ1xPES6yaFUDC7wzvmEQxXwA6rMSlGlIv1VYxjz0TSIT
	 09MXvFf71WUFAVT48dvyLjTn6ItQiDjcXMKOnye4SQu/PVVsxIfXIFJ3HaL5f2UeUI
	 2YbvioWt2lbcsK4tMt8r7yHoRe+DH7gEu4vhoZWM=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	shubhrajyoti.datta@amd.com,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 4/5] EDAC/versalnet: Fix device_register() error handling in init_one_mc()
Date: Sun, 22 Mar 2026 06:11:45 -0700
Message-ID: <20260322131145.1684744-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260322131107.1684647-1-ptsm@linux.microsoft.com>
References: <20260322131107.1684647-1-ptsm@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When device_register() fails, it must be followed by put_device()
rather than kfree(), because device_register() calls
device_initialize() which sets up the device refcount. The matching
release function versal_edac_release() handles the actual kfree().

Also reorder the dev allocation to after edac_mc_alloc() so the error
path no longer needs a separate err_dev_free label.

Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/edac/versalnet_edac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index acd51b492772..6463e88ed3d3 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -817,24 +817,26 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	if (!name)
 		return rc;
 
-	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
-	if (!dev)
-		goto err_name_free;
-
 	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
 	if (!mci) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
-		goto err_dev_free;
+		goto err_name_free;
 	}
 
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		goto err_mc_free;
+
 	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
 
 	dev->init_name = name;
 	dev->release = versal_edac_release;
 
 	rc = device_register(dev);
-	if (rc)
+	if (rc) {
+		put_device(dev);
 		goto err_mc_free;
+	}
 
 	mci->pdev = dev;
 	mc_init(mci, dev);
@@ -856,8 +858,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
-err_dev_free:
-	kfree(dev);
 err_name_free:
 	kfree(name);
 
-- 
2.49.0

