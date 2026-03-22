Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677BA2EC08C;
	Sun, 22 Mar 2026 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185101; cv=none; b=aHP7r5Y5rzWpjX4cYTnZA4jxwzABWZUG0dhspBw8DxhoAlMhLnEgLpDsqrQaXrER9mpTgG5ZJaZQ4fUdagVO/vOhK8tVpkv5dd7y4qcN9gu2JknUayp6A1s8e6B20HULEMNNazLIZjYHbIHdWBsFyTB9QRJtnBK0wMvH3DIojEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185101; c=relaxed/simple;
	bh=+1TufV+wOOI00ZAe8M1oG1mr3Nnz0dnFcfKwxAEQeO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4SDHqRCPYOUuCnhx1s7ieG+UpjGhMq76DMrJ5cJ0FjjugB3pmY5ZziiT6uguqETQx2sLh0pWaQdiauJ6VZC6S0rLFJQIrukQxv91h6/D8w3h/FkUBYIOE+XSW0e3dR0uwOyWyiB40l3n6PDxIM3Gt+w9pQaeySko/qhYAUuJOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=crTq4xIH; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="crTq4xIH"
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id CD43420B7128;
	Sun, 22 Mar 2026 06:11:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CD43420B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1774185099;
	bh=m88l9njESPglZaDdttc1e20/fYvuMVOS3zuvnOSKxN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=crTq4xIHeCkznzmEtET6EHHiUe7bO95YjTvIK2CAXu/XQDFsA0sIn4YhbXY95drqW
	 DWPIkU3MmpgIxNVDKyZlG+5YjEgCqMNSwrA1jb2xTGMeQH+P8AfW0sJSVWtUSFG78a
	 NfdtjAElcLcTbmy+IaRH7Tm/lcm6UDHoqOfu0n30=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	shubhrajyoti.datta@amd.com,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 3/5] EDAC/versalnet: Fix memory leak in remove and probe error paths
Date: Sun, 22 Mar 2026 06:11:39 -0700
Message-ID: <20260322131139.1684716-1-ptsm@linux.microsoft.com>
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

The mcdi object allocated using kzalloc() in the setup_mcdi() is not
freed in the remove path or in probe's error handling path leading to
memory leak. Fix the memory leak by freeing the allocated memory.

Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/edac/versalnet_edac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 28f5036f381c..acd51b492772 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -937,6 +937,7 @@ static int mc_probe(struct platform_device *pdev)
 
 err_init:
 	cdx_mcdi_finish(priv->mcdi);
+	kfree(priv->mcdi);
 
 err_unreg:
 	unregister_rpmsg_driver(&amd_rpmsg_driver);
@@ -959,6 +960,7 @@ static void mc_remove(struct platform_device *pdev)
 	unregister_rpmsg_driver(&amd_rpmsg_driver);
 	rproc_shutdown(priv->mcdi->r5_rproc);
 	rproc_put(priv->mcdi->r5_rproc);
+	kfree(priv->mcdi);
 }
 
 static const struct of_device_id amd_edac_match[] = {
-- 
2.49.0

