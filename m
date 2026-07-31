Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993512D661C
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460896; cv=none; b=NxlbmUJG8ALyjYnnZ671Z9rM24RIMzay2hiovToVFdugS/dyEEfV9005UKoKdz2wxeQ+lBvYVULRfcezIhp/zss07lcgqdH8JGyFADApjOkDaYHd0/QNGOtySEnTeDfEhTVm15SaRxWAoZiYHs3NOPypmjrhZkCSzf7gwFaRQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460896; c=relaxed/simple;
	bh=Z+gXpVeOJerXPn7c/pQ3zs2SIaak8eHO0YCv426HccM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/AmW/+TxbN6ptGS7QNrcF9G/MVSom/ihKzznCsTJSS3ZaBc59g2d4S8cKvspaFCaV/305SqoWtD2NIHsnd3YAZLru/IHpBAp0X78/ZJ/IzaAUMrhru5ba+7QowzSGLpL6N/RjY9ggsnCsP28Ef0crnbbr+X2AvmFOhyCkGjTeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO81/YHE; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO81/YHE"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so222922a12.1
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 18:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460894; x=1786065694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=druBUrLqgbBhWVJNiJbBH4EBtzUPbfrjGd0lGlIkkSY=;
        b=iO81/YHE024tE1IyMPIhEPwu0TpYri+74AuzM7d5aVdmKQrhYQywP7+YoxBfB4EkNi
         i4DtDV+y4QNnBFV3SJt63w6bfp9nDnfZGbYiGs8VzZxHNFUWEDYrOOhSmdYjsPZAbKph
         OPQVm0MGR9AOtf2yDg6JilhwHXUOIbvwzNTXjtBaqSuBYGqKaqnIAQiJa/8Nsa9Du9C7
         IJRAvryGqbcquOJIP5BZ5T6EYhG86amqNsPbbPRhuhSFzuNDafJ0BGKfh/ZRNSn8FrDx
         TbglgvBrLdCbYHvUaJ9eGDmnBQey6KbQxxhegvAp24OchTIGiChAsTHmF2pw+9osr+rh
         QJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460894; x=1786065694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=druBUrLqgbBhWVJNiJbBH4EBtzUPbfrjGd0lGlIkkSY=;
        b=XC/8RuKqlF51M7bzR4U7Ekyn3lbfGVNlIIUwPlPjJYMfhlkNPqYPyoo51oSY5lfLgs
         WUmI/fPlaCUag0LaWXfP0VzHxE6V/NiML6OLwFdnIpc7s506uFrC2BbFoXD84iw0EQaA
         1/ZHJTE95pbNwbWYjuxq+5Fl3aZ2EtapQzlka2foPdRujJuaMDWFilT7i82zwevXxH99
         JNXe2SbQCSKlxBlnrWMyxSlTjOFTdfYxMu0EfyDwfL1qqh9weIlcG9HltDhsI9WQmoqf
         0HHWYCpxSPBTt4HFTx6nWTQxPG8+4Ld63BODXJ4UtBAx46H3nb88RFtqeCwGnDfEsnc6
         lq+A==
X-Gm-Message-State: AOJu0YySWAR3qvuVuKSnv97otCPtqproxjaKphZeD8mXra65QPn3yHd7
	cXpW2JuQUbK7W6P7tgvYIGvSqiVSk3mE63oPX6f+CEwLIKPGfwK4YX1pmYlBrw==
X-Gm-Gg: AR+sD12lJl8ng9zi1pD4RFwM2aztlTNo2/PWy8Q4HOzhUsbjH/FvUfMGdTSlyaIBKil
	jZIZBT9odDKswcVKiuxFMAz0SFU0hMwxSol79YCBbT1F4lehxqJciVIacMO7BujXSCbY+4XDEaR
	nIDgcB7KX1SRMnipe1e6zDfkhxbA3my12oIwImr+dh/Af4KCe7wjQdi3tsUA81GxX5iCbcUfp47
	DoPnfS6wiwPKuU60qPity7Zrw8zlXfnFSmmud+myA2Er1hrWcWcRNJsootaRURhjFK++Q7CEDtG
	j/VhyRFav8ZQ77Vhj+Wzk/sjLy6rq7QFulhrRRD80MiiN5JJtyR3ghRkolgkYoqOBXjWgkBgjOj
	mPnUfqbpPU2qAAzrQR77LbqBDnqmlb58TNb6bmq9acqtgRr17WmGz5MPlBM3ClEZbOUHHfZj6Zx
	Azak0Yk7wsLx0RqiSWd2RcY8eYmrlDUEY8DVn8432MF5LS4e+sy3w5MkHffETYan3WiFxxrYUYn
	BHFJ0xF/u03CPnNBmbu+jJBiYAI4uRbo3bygtnCQCvwKSbYVNyqyCLB+RuNCLeO0dnEt90h3gG2
	Sol2uDlaL9l2hFcPWrkiosQZqSNuC4Ufth6F8Q==
X-Received: by 2002:a17:90b:1d8d:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38fb121ee39mr128591a91.14.1785460893844;
        Thu, 30 Jul 2026 18:21:33 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 1/3] EDAC/fsl_ddr: use devm_platform_ioremap_resource()
Date: Thu, 30 Jul 2026 18:21:28 -0700
Message-ID: <20260731012130.1212640-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded of_address_to_resource() plus devm_request_mem_region()
and devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
the resource lookup, region reservation and mapping into one step and returns
an ERR_PTR checked with IS_ERR()/PTR_ERR().

Behaviorally equivalent with respect to region reservation: the driver
already reserved the region, so the non-overlapping reg requirement was
already satisfied. Drop the now-unused linux/of_address.h include.

Remove devres stuff. Not needed. devm is already used.

Fix a mistaken return code of -ENOMEM when PTR_ERR should be used.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 39 +++++++------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index 2a545e5812e7..3745eec67335 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -22,7 +22,6 @@
 #include <linux/gfp.h>
 
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include "edac_module.h"
 #include "fsl_ddr_edac.h"
 
@@ -495,13 +494,14 @@ int fsl_mc_err_probe(struct platform_device *op)
 	struct mem_ctl_info *mci;
 	struct edac_mc_layer layers[2];
 	struct fsl_mc_pdata *pdata;
-	struct resource r;
+	void __iomem *mc_vbase;
 	u32 ecc_en_mask;
 	u32 sdram_ctl;
 	int res;
 
-	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
-		return -ENOMEM;
+	mc_vbase = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(mc_vbase))
+		return PTR_ERR(mc_vbase);
 
 	layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
 	layers[0].size = 4;
@@ -511,10 +511,8 @@ int fsl_mc_err_probe(struct platform_device *op)
 	layers[1].is_virt_csrow = false;
 	mci = edac_mc_alloc(edac_mc_idx, ARRAY_SIZE(layers), layers,
 			    sizeof(*pdata));
-	if (!mci) {
-		devres_release_group(&op->dev, fsl_mc_err_probe);
+	if (!mci)
 		return -ENOMEM;
-	}
 
 	pdata = mci->pvt_info;
 	pdata->name = "fsl_mc_err";
@@ -531,33 +529,12 @@ int fsl_mc_err_probe(struct platform_device *op)
 	 * Default is big endian.
 	 */
 	pdata->little_endian = of_property_read_bool(op->dev.of_node, "little-endian");
-
-	res = of_address_to_resource(op->dev.of_node, 0, &r);
-	if (res) {
-		pr_err("%s: Unable to get resource for MC err regs\n",
-		       __func__);
-		goto err;
-	}
-
-	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
-				     pdata->name)) {
-		pr_err("%s: Error while requesting mem region\n",
-		       __func__);
-		res = -EBUSY;
-		goto err;
-	}
-
-	pdata->mc_vbase = devm_ioremap(&op->dev, r.start, resource_size(&r));
-	if (!pdata->mc_vbase) {
-		pr_err("%s: Unable to setup MC err regs\n", __func__);
-		res = -ENOMEM;
-		goto err;
-	}
+	pdata->mc_vbase = mc_vbase;
 
 	if (pdata->flag == TYPE_IMX9) {
 		pdata->inject_vbase = devm_platform_ioremap_resource_byname(op, "inject");
 		if (IS_ERR(pdata->inject_vbase)) {
-			res = -ENOMEM;
+			res = PTR_ERR(pdata->inject_vbase);
 			goto err;
 		}
 	}
@@ -637,7 +614,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 		       pdata->irq);
 	}
 
-	devres_remove_group(&op->dev, fsl_mc_err_probe);
 	edac_dbg(3, "success\n");
 	pr_info(EDAC_MOD_STR " MC err registered\n");
 
@@ -646,7 +622,6 @@ int fsl_mc_err_probe(struct platform_device *op)
 err2:
 	edac_mc_del_mc(&op->dev);
 err:
-	devres_release_group(&op->dev, fsl_mc_err_probe);
 	edac_mc_free(mci);
 	return res;
 }
-- 
2.55.0

