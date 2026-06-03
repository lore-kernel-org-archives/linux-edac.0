Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D0306760
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493726; cv=none; b=e5m2vt4PjF2VB0NgQ82W+dAmBY0hcTPVxiF4z29OVTRqSvFV8bLMEYLcjM+oT3OzDFNekRHZGWRBpw44m5Q9JNysDhW6ELVN2L/2OcDyihucNjv8nbkgfWhv66HlXcyDq8K9F6nBqbb3VJINg9G1UX/klDUpRymCwxqMcILKXwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493726; c=relaxed/simple;
	bh=ThLfLCHmIQPPoDGt0Wg5gVn1Hgy8Oxxq2S5q/mw1lQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MvTejNOdlm6GllviFR9dNq/liuX50Hv0M6ldLUEtwtOTXUOAIpffC1syhDpfBZxdOylZdcn+J8MjGAY0apXbgcC4fYI6m2La0EllI2HfqgplCGlZ8nP43P7VuRsW+Ot9xAeKUpb7o9vnv7pPRkve4M93US3z/W2G7pzB5/76OfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sFacgiv6; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sFacgiv6"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e613b4f268so476931a34.1
        for <linux-edac@vger.kernel.org>; Wed, 03 Jun 2026 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780493725; x=1781098525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9iKUS1qB3Bumv7I+hG587W9IXgn0/0aiHnghhc7S+4=;
        b=sFacgiv6+bwfUfouWqUSrUHp2lxVuG2TM+45uwx+//LStr1RD+LRmhl8tt6NJgA6D4
         vACiJ1tvnHY5iKT7UaSb10Ncdzhqb9uUHTeUX70j7i5Lq1802BnKWTCwGg0wpcIOTMsA
         eA+Cm8iaIih9k1gP0v4XyQ0TL2CxHi+dYzrpkq4XnW4XAxd4LydiDZu6BCk3Ib5wOE8g
         Sd0Wm1LD+dlPiSzsT9U8BTEWVVwnDZi09sg8XKjfELIdz9f8eqmdxhn159mKUdPRmNGB
         4JvyXzvY93oIVUBJq60U7WtpqQ6YnuGHX3+mK79P0RQW5VI7mHm3Nx9ooYxoYFVMzKAs
         gFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780493725; x=1781098525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9iKUS1qB3Bumv7I+hG587W9IXgn0/0aiHnghhc7S+4=;
        b=CVpjh3IOerq1AJj5ot0w6s5cz1NW+Hd48OZqgNvc8AI+eSH5kA72SyP/BcgWhwxc8s
         M3aOapF8yAveFi0FN9xgaWsSZGmmjlKTbOBluDmwI5+ykUxj4YDbLlhyFrlDI/bwBlCM
         1+jgHEPaYE7UftnLv0paON2nIz+rPONVBfkiozBtKuo7P/REgz/CX//3YelfgT897mWw
         rzkWu2/XqS7KdH3vUrgmczuBzIGhycMPtwXoX2SIG/c8R4nzyexA1qgWgWoAhkwVFN/p
         3nb53Z5CmgRHYAkPdw9UCaYI2cZGhv8O6Vz3L1y1nWbGFhbBbrikfxsEmLZIz8aOpYXS
         jdxw==
X-Forwarded-Encrypted: i=1; AFNElJ+Qm/F2ZkHvQRVkq69RgN6C0b0S9aCBMpJe8Fxm4S6rrUxShBur5Am7gKzX4hABs9/QWEXfLjTtDxFv@vger.kernel.org
X-Gm-Message-State: AOJu0YzK0+YdFwVMicda3aGNEbYUSdiALkHNLMH2iG3oTWLwE6nORNFs
	eVTD5oFYx71uULrdKJvbzOgg8r+UB/BCqeRHXQg2nGe/G73E3B3CtXtD
X-Gm-Gg: Acq92OGKn5Q7p1ZSzOqvtPqkLxWBzMG2akgrdYE9kr7L7Nv6sG+bhayWqccMY6hYngU
	oDTym7ORdrOxrIz8v4MdqTBfq8W/MIinTE9LetZKp1F5RJTw0Tgvs+Y18OP4tSKOWDHXOEqaYi1
	aNyGuHSZoY3GzUs3ep0TIKIhvys51U+Mep6TkUDvaaFMWhS7yxAhmskcbPGUIqnHj2TyYGVP3Ys
	B93nUVIGEWbmjxyM58fbjUgBWzNGM3LnWkTvbbBwtZaZdeQ6Z1cW+39mcaEAjtVQ8d0NpOGhd/t
	FlO6ztc5NNInQPD+PzlnH0JhH/3IGac5cFw3BqWYiMYaKP/BIrLpFoKT7MQsetogxgqt9V9zzOw
	TXxsH3BSNoEAJOcAmvfSWGwWYTwMZF+wIV1VPcVY1ERT8HPLe+fUbZvP1t8OFD+hvySe4CJvi5+
	F86J/rUbKxuwd1khirDb6vfatn
X-Received: by 2002:a05:6820:1527:b0:69e:3063:3b74 with SMTP id 006d021491bc7-69e48d3ec22mr1525822eaf.30.1780493724758;
        Wed, 03 Jun 2026 06:35:24 -0700 (PDT)
Received: from lgs.. ([101.36.107.223])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4624167csm1647291eaf.5.2026.06.03.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:35:24 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] EDAC/versalnet: release remoteproc reference in remove
Date: Wed,  3 Jun 2026 21:35:06 +0800
Message-ID: <20260603133506.1396535-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mc_probe() gets a remoteproc reference with rproc_get_by_phandle() and
stores it in priv->mcdi->r5_rproc after the remote processor has been
booted.

The probe error paths release that reference with rproc_put(), but the
remove path only shuts the remote processor down. This leaks the
remoteproc device and module references on every successful probe/remove
cycle.

Call rproc_put() in mc_remove() after rproc_shutdown().

Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/edac/versalnet_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 2cbc13d9bd00..82b6426d9a79 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -937,6 +937,7 @@ static void mc_remove(struct platform_device *pdev)
 	unregister_rpmsg_driver(&amd_rpmsg_driver);
 	remove_versalnet(priv);
 	rproc_shutdown(priv->mcdi->r5_rproc);
+	rproc_put(priv->mcdi->r5_rproc);
 	cdx_mcdi_finish(priv->mcdi);
 }
 
-- 
2.43.0

