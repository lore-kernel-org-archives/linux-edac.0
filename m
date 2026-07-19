Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F67113A3ED
	for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 21:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784496938; cv=none; b=YL0lhfqRdKUOGi85C4x52wTOnAsxSZDmM0O0eWOGp5srUDXD7PHWV7F0cGY1u7Elh/18z+frIdpNwbbsFhiVT8vfOK2//ohgXBGOVGZbKbejC+fmyYKeUYa0z89ETBImdm/m6MSV+r1Mvcoa6B/CVIWP1BiH2rWiOU+QHaR0hrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784496938; c=relaxed/simple;
	bh=esUOiMasj4ZHEuYo63Aye+NAP8L6S4TDhw4yuUZNZSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLdq3tr2VpU9g3aEwEhqmdlpV+0C4qb/GNQjYs/EkStFUjG/6RPUfRpq0LpZnc5efQSDxi686Vhj+/x61QGgrrxf39tintwEA4uIz4sIcEnaTVDEBVANqz25ho64Lx5eJxY4uooHSYV1azeNy0IytJ7AxL/OlwN1OnUjYaES/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a8wHlqsH; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a8wHlqsH"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacf197759so101980275ad.2
        for <linux-edac@vger.kernel.org>; Sun, 19 Jul 2026 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784496935; x=1785101735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgYgNn21iMfT90MYm2UMdq21JQLGfcBKlRVJ7r9wOUQ=;
        b=a8wHlqsHI56URF+sD2+2UhzibaiJG28kkggW3jg4qaB+/BrE/o1/2/f5HygKVDtgy6
         9j5qM7B6744vsqfBbDR9umZ6AIm89AeIAFaiELZs4meVV4zrN7Fm3MIQmgkPrLDIQuPE
         FaTS6yGD+gYeJw6ECpqz8/3CT3HL5xmWqqh2lz6czSwXeU1vQ1nmJUn3xtIZywkQxqm/
         UvC0lM+3iJgZAbheWoEVvpexswZ8lSv9MB4G1fhsv7PYmi8yTgIhy/EKiQ0Br5KGYJnQ
         3kgJqMYhtAw0vdki9LtAiJV8J+6ehis0havam+Cidti6xTBLHjiciesY0/7TZUa67WB3
         4AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784496935; x=1785101735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgYgNn21iMfT90MYm2UMdq21JQLGfcBKlRVJ7r9wOUQ=;
        b=hcrFiAcXVVxlXU9vpvRbszZbsJzo9uOkJDaq9eXLYTTOaihd1cjyaNqf5v0tV5GA9i
         0qJiqM7nw7bSHrP2MK0Y8w3xAkHyiwTwZycOXgPxl5QAwMEktlw4KDzyUgh52Y/6ukLm
         9/5O+h7gLHhvrz+n00Ld9uxQbT/mJmpVQVVpXK9jdqwgUs65Xouk3EQD92dxT15C6h0T
         BqodSffj2kDEPhO/5NDFpNOrh4OpuY19OiXW8RTZdASDc4qqyPJ/riRs1QKPG8JG5JoL
         CFhEttvBB/Kfnmn0H3kvzaKkwmVV7oRsU1FB3eQHkGPjd+lBTD10CRUbuZYWWc3D/iEm
         L+2Q==
X-Gm-Message-State: AOJu0Yyo/s4IHn1W5g1NdZBhE0q7wIeasHn2G9pLkvHCNfDu8WsBnrLb
	u3vnC9awF1kftVIc6uyvnJUGLdqILBdnyeBoEuWbe3BScALLauchdfSUGnqvhQ==
X-Gm-Gg: AfdE7cml4f2Sj+uJMTj7HUrTx9CujXMsmyMmMhwpX1c6ymdcjffnzZc0hzRMwmsIaKb
	26IiSNY6QcBFXdj4VJQgGWTafMMgWyos8gdCK2Y+cY8NUofSp056uPdO5Eqtc4XbZy8Z3KIEeuA
	8nHIN3++fI1yojR6j5xoDNvHC4aIbNU4eUkTWPM8WA5QqbJS3iHO3fvof3NWuAkj3vq5N9sKCXA
	tFtC1NnnTWb4Ovdlgo8BA62RA0yk/T2NqLcRfjKQON605TQ0tI8ALM/+fJnP5+8UOZfqg2kA5vy
	OQ70SyH0remMC8HCOGTymizFTT+RLXyX4SNbG2mhbTDXDUHc64kFsBR4Kwf+W5aBlMDESQVCVtt
	Kr8V32RvUFy6w8c3V8qHOKslB8Gb6pZoUnn9PzIJWBKLd6NDKjW9yE8UHc68hSTmW/Tbd6Z4Rjx
	qp0V814kpPXgY8A1MkX/g4WWA42i7BZw7f639aF1j5RqojCriQMjuTLv8x/bFxxHfdblB1BYVqA
	tH5P7jKLSInA5j1FMSGw+DBFy84CCN0KtHT+SUw2CYjpmVLN0NCN2c=
X-Received: by 2002:a17:903:380f:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2cf348456ecmr124912865ad.12.1784496935365;
        Sun, 19 Jul 2026 14:35:35 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm45278195ad.3.2026.07.19.14.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:35:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC/cpc925: manage mci lifetime via devres and simplify ioremap
Date: Sun, 19 Jul 2026 14:35:32 -0700
Message-ID: <20260719213532.695530-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() +
devm_request_mem_region() + devm_ioremap() sequence with the single
helper devm_platform_ioremap_resource(), dropping the redundant -ENOENT
and -EBUSY error paths.

Register an edac_mc_free() callback via devm_add_action_or_reset()
immediately after edac_mc_alloc() so the mem_ctl_info is owned by devres
and freed automatically on both probe failure and device removal. Drop
the explicit edac_mc_free() from the probe error path and
cpc925_remove(); the now-redundant devres group open/release calls are
removed as well.

Built for powerpc (CONFIG_EDAC_CPC925) with LLVM=1;
drivers/edac/cpc925_edac.o compiles cleanly and passes checkpatch
--strict.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/cpc925_edac.c | 56 ++++++++++++--------------------------
 1 file changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/edac/cpc925_edac.c b/drivers/edac/cpc925_edac.c
index 9c9e4369c041..e4384ddece08 100644
--- a/drivers/edac/cpc925_edac.c
+++ b/drivers/edac/cpc925_edac.c
@@ -903,6 +903,13 @@ static int cpc925_mc_get_channels(void __iomem *vbase)
 	return dual;
 }
 
+static void cpc925_edac_free(void *data)
+{
+	struct mem_ctl_info *mci = data;
+
+	edac_mc_free(mci);
+}
+
 static int cpc925_probe(struct platform_device *pdev)
 {
 	static int edac_mc_idx;
@@ -910,37 +917,14 @@ static int cpc925_probe(struct platform_device *pdev)
 	struct edac_mc_layer layers[2];
 	void __iomem *vbase;
 	struct cpc925_mc_pdata *pdata;
-	struct resource *r;
 	int res = 0, nr_channels;
 
 	edac_dbg(0, "%s platform device found!\n", pdev->name);
 
-	if (!devres_open_group(&pdev->dev, cpc925_probe, GFP_KERNEL)) {
-		res = -ENOMEM;
-		goto out;
-	}
-
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
+	vbase = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vbase)) {
 		cpc925_printk(KERN_ERR, "Unable to get resource\n");
-		res = -ENOENT;
-		goto err1;
-	}
-
-	if (!devm_request_mem_region(&pdev->dev,
-				     r->start,
-				     resource_size(r),
-				     pdev->name)) {
-		cpc925_printk(KERN_ERR, "Unable to request mem region\n");
-		res = -EBUSY;
-		goto err1;
-	}
-
-	vbase = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!vbase) {
-		cpc925_printk(KERN_ERR, "Unable to ioremap device\n");
-		res = -ENOMEM;
-		goto err2;
+		return PTR_ERR(vbase);
 	}
 
 	nr_channels = cpc925_mc_get_channels(vbase) + 1;
@@ -955,10 +939,12 @@ static int cpc925_probe(struct platform_device *pdev)
 			    sizeof(struct cpc925_mc_pdata));
 	if (!mci) {
 		cpc925_printk(KERN_ERR, "No memory for mem_ctl_info\n");
-		res = -ENOMEM;
-		goto err2;
+		return -ENOMEM;
 	}
 
+	if (devm_add_action_or_reset(&pdev->dev, cpc925_edac_free, mci))
+		return -ENOMEM;
+
 	pdata = mci->pvt_info;
 	pdata->vbase = vbase;
 	pdata->edac_idx = edac_mc_idx++;
@@ -988,7 +974,7 @@ static int cpc925_probe(struct platform_device *pdev)
 
 	if (edac_mc_add_mc(mci) > 0) {
 		cpc925_mc_printk(mci, KERN_ERR, "Failed edac_mc_add_mc()\n");
-		goto err3;
+		goto err;
 	}
 
 	cpc925_add_edac_devices(vbase);
@@ -996,17 +982,10 @@ static int cpc925_probe(struct platform_device *pdev)
 	/* get this far and it's successful */
 	edac_dbg(0, "success\n");
 
-	res = 0;
-	goto out;
+	return 0;
 
-err3:
+err:
 	cpc925_mc_exit(mci);
-	edac_mc_free(mci);
-err2:
-	devm_release_mem_region(&pdev->dev, r->start, resource_size(r));
-err1:
-	devres_release_group(&pdev->dev, cpc925_probe);
-out:
 	return res;
 }
 
@@ -1022,7 +1001,6 @@ static void cpc925_remove(struct platform_device *pdev)
 	cpc925_mc_exit(mci);
 
 	edac_mc_del_mc(&pdev->dev);
-	edac_mc_free(mci);
 }
 
 static struct platform_driver cpc925_edac_driver = {
-- 
2.55.0

