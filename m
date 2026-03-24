Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A2A1E515;
	Tue, 24 Mar 2026 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354636; cv=none; b=ko74GN7OUIOPtAqD8vRXqioehOtCM9ultHKmHW31j1FSs/A+JX/hf3MsC06qDOE4WZzGrFnT3Z6l+/PF9MZPraQPFuaAbVN7NxV+8SX06hTWu7XDzW5khBsLUHZhh7F7RJrKXFrXxpZWxDKkik8kuBXen6cWwFvWiArDLT5/Wps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354636; c=relaxed/simple;
	bh=4M3oxfdAtS7h61TDbbWg2JNnqbSWA0PCWoJ0L7gkFZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ev7PxGiUND7tq0Zm7j0sdfW+W01kSmZxdT5WJw5zPUUXL3vKCVDGgyYZPGT3t0yBq5nEyX3vG5dCZ9AeVAQBDLVcclZmRQOuKUgTZpfgrkfZYzwjhNeaVSuV5MrtRuLSYOpEW0LTBforp5Y6AHlO+W/oqWtsUs5keQ+KAgj3BJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cF8pe+nS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cF8pe+nS"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C91A40E01B5;
	Tue, 24 Mar 2026 12:17:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dnFVETy27CCn; Tue, 24 Mar 2026 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774354629; bh=KYK9YHZVuVlAzOOhH+MTz621Hkr2RYOMLkdngylRUAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cF8pe+nSTbYOwxaFJul2bqxHO3uvgIgItLoiUX8wIYsEqhN6tdF3fFY8JyD9QlFPi
	 cPkLYZSC6hmwgA5cTbDn56AVHXKZj3qYJiHzY6c3YWo+d9mDuGv8+CaSymsQP5YI6d
	 lxkovFIQr85rZER8zPYQ73rWloZiN8CP35Tl6L9QKY8fpfe+mtIljuIu1GGr0kY4ru
	 vahO3urod84G6ztAkBOUsNDV4wQ9C7cfvFvFPmIimmEbGCjhgBbAUdt9rSHtAoo9NJ
	 M+X+g7dPq8SUJKK7XHzsXMEkJF5HRxQ426ejsCvI7tHaVGRVy6SPBgxbfzVzvgi2su
	 CIYAY1ipCpXshcNevFwq7Suvy6gjA5EFdFPcpWy5dm0ACr4BI6G/EZAV3hbDxY6NoW
	 1U0fAxdFq34wRGJjfdbuKTj0yJW3qEtNRQiBwnI1QIMPQLfdY3Ti+os4d3YUr78c+7
	 wg9RjDFYmdBgtdZvoE6+R+Ert+RNV3N8BKYvxWkCPGDTNddin9THhsVI6g6OMcDoHt
	 n/ycVMoB1XmUv65hHWfX0zxX0ADEIsECXjauTxCfuRL8q9FhkhL4WWIBfdzEY68LIw
	 RoHkRAtXlve5hnjTEr9qbJQgMROPF/oGqz4bL7Ihlj9W0E39DXoUV8BZD8tcuyEu7V
	 C5rk4M1CaVQmiMlXTUY0ZVt0=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id CBFEF40E0194;
	Tue, 24 Mar 2026 12:17:02 +0000 (UTC)
Date: Tue, 24 Mar 2026 13:16:56 +0100
From: Borislav Petkov <bp@alien8.de>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: shubhrajyoti.datta@amd.com, tony.luck@intel.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 4/5] EDAC/versalnet: Fix device_register() error handling
 in init_one_mc()
Message-ID: <20260324121656.GAacKAuPpPt9bjj15q@fat_crate.local>
References: <20260322131107.1684647-1-ptsm@linux.microsoft.com>
 <20260322131145.1684744-1-ptsm@linux.microsoft.com>
 <20260322161052.GAacAUjFGWFwPle6c9@fat_crate.local>
 <84ae7198-b755-4dde-b97c-978958d27b4b@linux.microsoft.com>
 <20260324112312.GKacJ0IEL2iD7JZnSk@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324112312.GKacJ0IEL2iD7JZnSk@fat_crate.local>

On Tue, Mar 24, 2026 at 12:23:12PM +0100, Borislav Petkov wrote:
> So let's do it another way (totally untested ofc):

AI found a couple of issues, here's v2:

---
diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index b87fe57aa842..953f96c8fd6f 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -772,12 +772,11 @@ static void remove_one_mc(struct mc_priv *priv, int i)
 	edac_mc_free(mci);
 }
 
-static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i)
+static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, struct device *dev, int i)
 {
 	u32 num_chans, rank, dwidth, config;
 	struct edac_mc_layer layers[2];
 	struct mem_ctl_info *mci;
-	struct device *dev;
 	enum dev_type dt;
 	char *name;
 	int rc;
@@ -802,7 +801,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	}
 
 	if (dt == DEV_UNKNOWN)
-		return 0;
+		return -EINVAL;
 
 	/* Find the first enabled device and register that one. */
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
@@ -817,14 +816,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
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
 
 	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
@@ -856,8 +851,6 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
-err_dev_free:
-	kfree(dev);
 err_name_free:
 	kfree(name);
 
@@ -866,18 +859,26 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 
 static int init_versalnet(struct mc_priv *priv, struct platform_device *pdev)
 {
-	int rc, i;
+	int rc = -ENOMEM, i;
 
 	for (i = 0; i < NUM_CONTROLLERS; i++) {
-		rc = init_one_mc(priv, pdev, i);
-		if (rc) {
-			while (i--)
-				remove_one_mc(priv, i);
+		struct device *dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+		if (!dev)
+			goto free;
 
-			return rc;
+		rc = init_one_mc(priv, pdev, dev, i);
+		if (rc) {
+			kfree(dev);
+			goto free;
 		}
 	}
 	return 0;
+
+free:
+	while (i--)
+		remove_one_mc(priv, i);
+
+	return rc;
 }
 
 static void remove_versalnet(struct mc_priv *priv)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
