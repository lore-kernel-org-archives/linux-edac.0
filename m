Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60AE34FF45;
	Thu,  6 Aug 2026 16:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786032664; cv=none; b=l3zv2hcK2Rvyx79oVOWbAj9TZn6dah/4dw14+IEPxYXmpJZmPcLg6AzKF92R6fsL10rCHOimDRawdiIUKGqaUPLRzNokpByHE28xYWLvHciL8WGXMcvt8XiDZ4hKQGYoy/XG5AcrH57Gqz0aAoCyEapwLtKjMg/sL0v6O5tXPBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786032664; c=relaxed/simple;
	bh=sPblxr5uX6QGqmFrfXUDkDtlANGRlDpCit5HRsqemYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bwmqsq6/kxei6lIAcv7bol4bGnI5IHGQVXTX18bNYrYgdFdRHWJ/0t45p3tHMGmcIOlZqNoynDzg/VIBtUUqx6G+8YW5SmBl62dQuHJV2dctA6RHJkR8lluFhOMoOTM1LwKbKH4uK+1uVVTjvIOZC17SrQAm3/9uN2VhuMRmKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uzf4KCfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uzf4KCfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130331F000E9;
	Thu,  6 Aug 2026 16:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786032663;
	bh=5Qv6daTJfUgPgWJyAJQGssFe0wXtGoksEKGtyo/GXFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uzf4KCfhGMktuSY/BjF4m2n0Jvt2syy8+vQFYh0bJvhMk7MDeTaOgITocfCOEBxyp
	 +mcUdwWMtCfroIHJP4JOsWarrGiEMpQ9qzX0PAhc2/KT3jigdHqdZ5xKddVNGt6sEg
	 AkPCv6yRyTudgqgEoDn/7pTZSdv8b2QFn9PQEHPoJRZwswVOIwvLOiar06v0FziD0R
	 xdCEymdt04QHLbmjIlNqD4Sd9Y37Yl2OYzUqQeWznHvSZ6mj5qS8RbC7K4+Zgfrz17
	 n6BbxVTxmXPJSCccC5fW0D9O+UImFOZki8Wsgr3hEsIsvJzczsIh0PAlhemTDbyLR0
	 s823UUJWdLwEw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] EDAC/altera: Guard against NULL of_node pointer dereference
Date: Thu,  6 Aug 2026 11:10:55 -0500
Message-ID: <20260806161055.1520446-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260806161055.1520446-1-dinguyen@kernel.org>
References: <20260806161055.1520446-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are many sashiko reports on this driver because it is using an
unusually high amount of functions that dereference an of_node pointer.
While you can guard the NULL pointer dereference in every function, it
would be much simpler to guard it during probe functions. This edac driver
is static, meaning it cannot add/remove nodes during runtime.

So it's best to use dev_of_node() in the probe functions, so if the of_node
is NULL, the driver would simply fail to load.

Closes: https://sashiko.dev/#/patchset/20260719211238.589402-1-rosenp%40gmail.com
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/edac/altera_edac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 68846f583eeef..f449bd45c5098 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -290,7 +290,7 @@ static int altr_sdram_probe(struct platform_device *pdev)
 	unsigned long mem_size, irqflags = 0;
 
 	/* Grab the register range from the sdr controller in device tree */
-	mc_vbase = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+	mc_vbase = syscon_regmap_lookup_by_phandle(dev_of_node(&pdev->dev),
 						   "altr,sdr-syscon");
 	if (IS_ERR(mc_vbase)) {
 		edac_printk(KERN_ERR, EDAC_MC,
@@ -507,9 +507,12 @@ MODULE_DEVICE_TABLE(of, altr_edac_of_match);
 
 static int altr_edac_probe(struct platform_device *pdev)
 {
-	of_platform_populate(pdev->dev.of_node, altr_edac_device_of_match,
-			     NULL, &pdev->dev);
-	return 0;
+	int ret;
+
+	ret = of_platform_populate(dev_of_node(&pdev->dev), altr_edac_device_of_match,
+				   NULL, &pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver altr_edac_driver = {
@@ -2184,7 +2187,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 						 altr_edac_a10_irq_handler, edac);
 	}
 
-	for_each_child_of_node(pdev->dev.of_node, child) {
+	for_each_child_of_node(dev_of_node(&pdev->dev), child) {
 		if (!of_device_is_available(child))
 			continue;
 
@@ -2193,7 +2196,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_EDAC_ALTERA_SDRAM
 		else if (of_device_is_compatible(child, "altr,sdram-edac-a10"))
-			of_platform_populate(pdev->dev.of_node,
+			of_platform_populate(dev_of_node(&pdev->dev),
 					     altr_sdram_ctrl_of_match,
 					     NULL, &pdev->dev);
 #endif
-- 
2.42.0.411.g813d9a9188

