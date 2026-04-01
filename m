Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1A23EAC87;
	Wed,  1 Apr 2026 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042318; cv=none; b=VKRIQ5ea+ZfTwZM3Lvw+g8+zDdJtj4VxXK/YkC6WrdDNwJgkp4IzGnhSDo+98piIftv/XTHeINchYHTYbYmZl6My56oaqtwR1GNY0SJSgxC2F6nWwPL/Aa8qKaBeeSxJFVih8QU96P008FyOBmV1xDiKCWeF+nfFgpANlDIhXQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042318; c=relaxed/simple;
	bh=wqeS5R7B3x2sElhIpQvFTBnIcoNjLN8L7Kyo+tXBn1M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iew6tjqEcYOiH7lTCWQdmlRAdCMNkZYdxPIP9eRSOBoKoHFwMj4O+LwJWyA522WbWVFY3UateQEB2rfhvfcvbHFykyzI5y7PeauAXssN5M2licCbs5VNa+L45HMKn3+QiJTIBuVrG5ZQ6SPH2WbljyJ9Jv5WSSAp0gQFkABDZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=qh2efeDf; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="qh2efeDf"
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B9ED620B6F01;
	Wed,  1 Apr 2026 04:18:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B9ED620B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775042316;
	bh=Rft7MfpehEAn6eVwVlgmLqG2cqg4LUdTEiqyTveHYjA=;
	h=From:To:Subject:Date:From;
	b=qh2efeDf4FYsA95ggrBW3bcBzwzsdjmGNpbdt6dePW6QXYh4LSeRvSdTy/NKtU5Rq
	 qbzbv3IS94aLKsuRufUN3HoW3osXsML9rEPzkhqlDu+gfpR2CmhjibzcRus20yoxFa
	 blJCuHKuKMNdj3w9GIkwD0VX3954uTYKtWKNVT14=
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
To: ptsm@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	shubhrajyoti.datta@amd.com,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in mc_remove()
Date: Wed,  1 Apr 2026 04:18:36 -0700
Message-ID: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The teardown sequence in mc_remove() does not mirror the reverse of the
initialization order in mc_probe(). In particular,
unregister_rpmsg_driver() is called before remove_versalnet(), and
cdx_mcdi_finish() is called after rproc_shutdown().

Reorder mc_remove() to reverse the probe initialization sequence,
consistent with the probe error-unwind paths.

The rproc reference acquired via rproc_get_by_phandle() during probe
is not released in mc_remove(), causing a reference count leak. Add
the missing rproc_put() call.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
---
 drivers/edac/versalnet_edac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index b87fe57aa842..acd51b492772 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -955,10 +955,11 @@ static void mc_remove(struct platform_device *pdev)
 {
 	struct mc_priv *priv = platform_get_drvdata(pdev);
 
-	unregister_rpmsg_driver(&amd_rpmsg_driver);
 	remove_versalnet(priv);
-	rproc_shutdown(priv->mcdi->r5_rproc);
 	cdx_mcdi_finish(priv->mcdi);
+	unregister_rpmsg_driver(&amd_rpmsg_driver);
+	rproc_shutdown(priv->mcdi->r5_rproc);
+	rproc_put(priv->mcdi->r5_rproc);
 	kfree(priv->mcdi);
 }
 
-- 
2.49.0

