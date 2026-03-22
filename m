Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BACA2EBB84;
	Sun, 22 Mar 2026 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185096; cv=none; b=lDc7PiWwc1/ZgfbZa3DgPxUtUJ/7+mTqzpOubk/qp+/MLeiR8qFnO6cgUA0YJ0aXvwQcy5ylIE+VmNib9Ny99GxJg100jh4aFgwT9J/KshaaY6F/hhvzdm5L+f1UzetkIrzUolxPOBdNkW3rJqIeNgbRnetTQsNH/+irC2BFrto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185096; c=relaxed/simple;
	bh=XFjVRNgzpZgvpiPQDIRXVNNJCSTD4bfEKUaHKJv78pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMmhSYybk1gFRJMfRck8a1G+J+HokSpEtOOzqipPCtZEb671d3LO4vFZMre+1iKuJuaw+OZ/XIzbrC67Zt+u356yXNrcwWdV9abtK50tTqZQb3zhSHjgmzQn6L4u4zGdtQa67Ud8ye/4qbcu3R34LOcVTfI8Xvri4fBNXqTLgLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=jimqgr/z; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="jimqgr/z"
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8FCE320B7128;
	Sun, 22 Mar 2026 06:11:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8FCE320B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1774185094;
	bh=+Boc9fiv2GO4Tut+9hzh6BerPuKZZ3SkpCXGRgMoJCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jimqgr/z/wedRXVtpToJiQjshkFrnDiXfoNTFAnoM5tz2NgV0XRKCyIi8tC/KC5KC
	 WxTtxHmBOEZyYvVzgO0n2lJHgHlYmDexoX5A0N8dNestyB2eqYQLZDt2TkzmI/+/YK
	 p3U9iJwuL6ivu6iA1CEjbbgsR1kBe/Fh6+4vP8TI=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	shubhrajyoti.datta@amd.com,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/5] EDAC/versalnet: Release reference to remoteproc device in remove
Date: Sun, 22 Mar 2026 06:11:34 -0700
Message-ID: <20260322131134.1684691-1-ptsm@linux.microsoft.com>
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

The rproc reference acquired via rproc_get_by_phandle() during probe
is not released in mc_remove(), causing a reference count leak. Add
the missing rproc_put() call.

Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Cc: stable@vger.kernel.org
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/edac/versalnet_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index f70243bc8a7a..28f5036f381c 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -958,6 +958,7 @@ static void mc_remove(struct platform_device *pdev)
 	cdx_mcdi_finish(priv->mcdi);
 	unregister_rpmsg_driver(&amd_rpmsg_driver);
 	rproc_shutdown(priv->mcdi->r5_rproc);
+	rproc_put(priv->mcdi->r5_rproc);
 }
 
 static const struct of_device_id amd_edac_match[] = {
-- 
2.49.0

