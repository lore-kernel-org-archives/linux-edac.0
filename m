Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF983630A8;
	Wed,  1 Apr 2026 11:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042344; cv=none; b=kkFYnyjng4kC8tS72Ri+CLsKB1rDF5T1PYGofzFjrEubaiqoGz9AsMNZLz/avA2fNGKGJ57vhOOiAoG3e87eofZZFyoKC7HmqseLqBU5+7vqXl741Qe0CWr1/sXU6wsD81Jyt3NPSUe0O/8D9x63VCWq/PyZewZhrtWXuCmGN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042344; c=relaxed/simple;
	bh=iwXymy/mKQL7af9GLLBWsG8RPI1jL7ZOYDxou8GkCHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A4r3zeROIugPiZeWtYc5927AYAuNQP/86zbvtAMc3fHbhH61AOssjSlus7kzj1+TrUtLWpAQBGhjxpTkybYYbp7I2Yer0lkyiqdNV2ir2cmgn1yFdV6LgeVe16ikl77dH+b/e9Lz0ACbBuKENZhSygURffsrB4m4ZASCfmUvlE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=mO4vajuL; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="mO4vajuL"
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 89E6520B6F0C;
	Wed,  1 Apr 2026 04:19:03 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 89E6520B6F0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775042343;
	bh=jtu6wKa9++/vvQBc5gyNpXIK+dkDxPsMDLN58/RKYDU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mO4vajuLL4oBH72HH0JDKgrlKRLMH/fymKOcvykvRPnNeBUaxm/uPskVBRMgDmktT
	 nmHCgW8G+KYvuA40vK8Qtsssiqy5zeIp64xkkKfTH/Q7UOfFBJrAlwBaxaPXInMNLz
	 Udb/k/KKhGmMrHd8yqshsV0HK6M+oAwcwaRM8+HY=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	shubhrajyoti.datta@amd.com,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] EDAC/versalnet: Fix device_register() error handling in init_one_mc()
Date: Wed,  1 Apr 2026 04:19:03 -0700
Message-ID: <20260401111903.2343006-1-ptsm@linux.microsoft.com>
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

When device_register() fails, it must be followed by put_device()
rather than kfree(), because device_register() calls
device_initialize() which sets up the device refcount. The matching
release function versal_edac_release() handles the actual kfree().

To simplify error handling and avoid complex unwinding, split
device_register() into device_initialize() and device_add().
Initialize the device early so put_device() can be used in all
error paths.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
---
 drivers/edac/versalnet_edac.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 012c4f40994d..94580d3c3170 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -780,7 +780,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	struct device *dev;
 	enum dev_type dt;
 	char name[MC_NAME_LEN];
-	int rc;
+	int rc = -ENOMEM;
 
 	config = priv->adec[CONF + i * ADEC_NUM];
 	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
@@ -812,23 +812,23 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	layers[1].size = num_chans;
 	layers[1].is_virt_csrow = false;
 
-	rc = -ENOMEM;
 	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
 	if (!dev)
 		return rc;
 
+	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
+
+	dev->init_name = name;
+	dev->release = versal_edac_release;
+	device_initialize(dev);
+
 	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
 	if (!mci) {
 		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
 		goto err_dev_free;
 	}
 
-	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
-
-	dev->init_name = name;
-	dev->release = versal_edac_release;
-
-	rc = device_register(dev);
+	rc = device_add(dev);
 	if (rc)
 		goto err_mc_free;
 
@@ -849,11 +849,11 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	return 0;
 
 err_unreg:
-	device_unregister(mci->pdev);
+	device_del(dev);
 err_mc_free:
 	edac_mc_free(mci);
 err_dev_free:
-	kfree(dev);
+	put_device(dev);
 
 	return rc;
 }
-- 
2.49.0

