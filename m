Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C5F369991
	for <linux-edac@vger.kernel.org>; Tue, 14 Jul 2026 23:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784072775; cv=none; b=RZ5DpxpM9X90ckpsY0mKxb9JuoczEe1nkQm71FMPPvVp/KuMV7qwwSHQt32CjLbJw7gb0uYTqu5WVOFFf/2+4HvAooDsbNY+H461inw+Ln6embr+AF269Gf/m7iC3W33PIN2PKqp9DJTi5qQE1ldfhKA8XSAgck7AbP5pFR2oyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784072775; c=relaxed/simple;
	bh=xz5rGf8Wc+mjpEoKjw/Hm6IDCdOr4kMxjrR6BxaTuSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kvpImVfSmf9LCd4zDcg5/bvGqTt7Z5GF/lIBfdnpi5Ep4/8pNPTqifjxrGlp3AIVyyQYnv27sSD2KhMaZl7vew2BTt8wa5EvcL8tWPYpWeFeXGYkuyygyq4QJaJXon7hI6iTh5MqxVNzLoqeJxVx/yxXRU6+5ZX5PN2lSHcvz3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKSoYHla; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKSoYHla"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1401645a12.2
        for <linux-edac@vger.kernel.org>; Tue, 14 Jul 2026 16:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784072772; x=1784677572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzUE7I1k14QX134cx6l+OWLqB5vco662yBKK277qQ00=;
        b=lKSoYHlaY9tMQ6eUeikifqhssXe19lkO3NOdAC7mX2evISKwpK9GLuJYokVuUJt+Bq
         jVzMtreCboc56NouafywD+ppOJPG1RRFU/f54xzYkn+tVyg+g0WrwJxzHrgE6DX8toIv
         VRcbOhtCKzP0CUxxhRvMZAeE6AZKG5F9LmBlIIQTH3GI/ub6LnG5NeTlvn/SzOx9mrVi
         7GepLoMyR97XnOwNdKOTtYRoOK4igeUGyo5ASB/fVhkfJ5/7Y2ZCrlEw0Jurb0rlCVqc
         LyY5rvGRyGXlkKPVqXu2ENxk2Z37mOvxPh6sMJH3yPbJpZDQt5EatGMXmjtS/jUZZof1
         45PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784072772; x=1784677572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzUE7I1k14QX134cx6l+OWLqB5vco662yBKK277qQ00=;
        b=StExLnXs1XiZCh1gzT4CH+H0wzyKdaIyLhh1vxLwC60HVTzBnZ/HGAFUmCb+K53ltO
         OpgsDLGbZ9xqI6EsGWI+0RiAhNQNgQd5I5q9SDem0MTKf7bEUALvIGL5o4tqynG/SPd2
         Fg+X69IR410nvvlRyQ5KQJuKk0r3K7yKX/55yFaMhDZ2+9Yp3vsqdspX3PC4CmMERRtS
         gXeApK6SBZagzpsd2UfKZTfkFrmrZ+rvkMiFN8iPK8quDa8slXXqmRHnlcPG2VgcJwuY
         q1SmIhq2RfsvuQVZUxRkJhlv89oTTLX+h6SE5q4sb4tQGE47eqYAFn4vMogXsKHGoDRT
         1Dmg==
X-Gm-Message-State: AOJu0Ywk5Q/Lj0RRIKHZ+05Dva9qURsxomTYd1amrAL72jpazqOdiF89
	8VktINFufwpVenh4xZWBXH4C1t1VwYiFRAU8F+/YRJPRKLpwQhbG5FurZTzKbw==
X-Gm-Gg: AfdE7cly3JjocOUhGboqEc+/kQCSHNfCkE9HR7uNXpVaXIqk57lxddSesrn/vimVivW
	niCNMH/6UlfPoFe3nuMjh6ti+Ily2mU+i7MkR6ZWid/mznfItx2KL8r6bMm0tWAA+NE9bp8cP8b
	z/2B1VjgXk/zCwsRLqlm5dYaIbkJ+XNFV2lAf84O5RjTxVMsGlwF5bmXDKKin2iGC09nzK6Lp06
	GO2VHCpB3WsaJ2RuFS42f4pIVNZxv/P1bYcbaXdwKqyDzD8T9SytAXP3EI2KYBFu2lQbIpr0/iG
	2Mnko8r2XSgbO0jbmO0l7YV9TbVfAsGf6V8szq2ddEf7l5uwuVf5KJuBMhoORvkz3oLC41rbL8V
	rwqPDy5ikVsXFqmSVVlvFycP4ADlMPzO2C4tGuF54ajg3ZU3769bMVzgaqHqmZkn+2l4orUVPQp
	QXzLR3lQbDdQNq6/NvoN4uTPkcPGRkptzy5UD5/6SI8kFZcrSs0GdVZQ9kFCU6+m5xzmBlYKS2b
	pydCWWauUVb0vKnTzBY5nLs275kUElYiX0r4Aegd8TCmzwtCUKXGGYKsoNQDHXh2Y8lx8Q9Xh/J
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1b:d0be with SMTP id adf61e73a8af0-3c110a24bb4mr17834018637.73.1784072772474;
        Tue, 14 Jul 2026 16:46:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm10988858a12.22.2026.07.14.16.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 16:46:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
Date: Tue, 14 Jul 2026 16:46:09 -0700
Message-ID: <20260714234609.902367-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 30 ++++++------------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index b27dff96aeb6..ae1d54434e38 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -22,7 +22,6 @@
 #include <linux/gfp.h>
 
 #include <linux/of.h>
-#include <linux/of_address.h>
 #include "edac_module.h"
 #include "fsl_ddr_edac.h"
 
@@ -495,11 +494,15 @@ int fsl_mc_err_probe(struct platform_device *op)
 	struct mem_ctl_info *mci;
 	struct edac_mc_layer layers[2];
 	struct fsl_mc_pdata *pdata;
-	struct resource r;
+	void __iomem *mc_vbase;
 	u32 ecc_en_mask;
 	u32 sdram_ctl;
 	int res;
 
+	mc_vbase = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(mc_vbase))
+		return PTR_ERR(mc_vbase);
+
 	if (!devres_open_group(&op->dev, fsl_mc_err_probe, GFP_KERNEL))
 		return -ENOMEM;
 
@@ -531,28 +534,7 @@ int fsl_mc_err_probe(struct platform_device *op)
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
-- 
2.55.0

