Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB483E92B5;
	Wed,  1 Apr 2026 11:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042337; cv=none; b=hbkgzxNOTqCXSQdcHfyCf2kqxQQCb7Jyu/y1yh5NnjEGPGuStuumgbuQzxDbO/JPSd8mV4amNVRMV9xFijoM/nciHS2cr+FAt7hcCOVzS+UeOTlCmWFomNsQbIYrLkTPnvd7YuAOdUoRXA/zkSlTkmxhsCVZoAaQ8urXzgrYnDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042337; c=relaxed/simple;
	bh=AmVuNaU8bjb9WlqJAbXNzotMSiJ3qgtPn+D2zmf7pGQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNTww7gKtPsotQCV2RSndEJk3LWp9HESp0zMmy+3Hg3Vh+pvVzTArLtrr+ZAviSKd4/H0ZTvnhWKIapNlwhDI8Ct+xqMZWo4zZj7QGGxblydQoRsrFtc/mDk2TBtckzVei6yuFo+lkhSrj1YzVJ5LGojzO+Ea1v5zObloDJGFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=IJbpV6Mv; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="IJbpV6Mv"
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8260320B6F08;
	Wed,  1 Apr 2026 04:18:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8260320B6F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775042336;
	bh=Yb7Sfkit++I9F1LsU4X8Wa3F1GL2S/Z652WsH7kA7qE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IJbpV6MvDKMX3a+4wI0zZ7WaXk4nOf9BcCxT+weQe8KbTAO640PVpOHd4FRBt4QD/
	 McmPluDRa7EU7jVekAKB3Y6w3si0foxTSCgkjlf+8sR8U0JHrHiufppd5NppaY8IE0
	 azWirSFCa+4J5/cMjSx7xSq8tdCE6fsl+MoRyack=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	shubhrajyoti.datta@amd.com,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] EDAC/versalnet: Fix device name memory leak
Date: Wed,  1 Apr 2026 04:18:56 -0700
Message-ID: <20260401111856.2342975-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device name allocated via kzalloc() in init_one_mc() is assigned to
dev->init_name but never freed on the normal removal path.
device_register() copies init_name and then sets dev->init_name to NULL,
so the name pointer becomes unreachable from the device. Thus leaking
memory.

Use a stack-local char array instead of using kzalloc() for name.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/edac/versalnet_edac.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index acd51b492772..012c4f40994d 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -779,7 +779,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	struct mem_ctl_info *mci;
 	struct device *dev;
 	enum dev_type dt;
-	char *name;
+	char name[MC_NAME_LEN];
 	int rc;
 
 	config = priv->adec[CONF + i * ADEC_NUM];
@@ -813,13 +813,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	layers[1].is_virt_csrow = false;
 
 	rc = -ENOMEM;
-	name = kzalloc(MC_NAME_LEN, GFP_KERNEL);
-	if (!name)
-		return rc;
-
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
-		goto err_name_free;
+		return rc;
 
 	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
 	if (!mci) {
@@ -858,8 +854,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	edac_mc_free(mci);
 err_dev_free:
 	kfree(dev);
-err_name_free:
-	kfree(name);
 
 	return rc;
 }
-- 
2.49.0

