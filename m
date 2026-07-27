Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6DE41A518;
	Mon, 27 Jul 2026 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158679; cv=none; b=d9ogDFonfSCfo2Q5PSqo7ByKUbp3eE5R/rTKlSKy1MoYlvLcg3yARY0D2oTLIGqdlvyaPd7h2Efa2jyovcFt4z8mncT3OWy1y6H3FJxeQO/khAJURmzA5cTKBUDZqadgUpjXZAnOTRWOSQn8HC0P2fJXIccpz0dZJghvAQUvACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158679; c=relaxed/simple;
	bh=s9+YKnSCMQsAGzxUXzCEJnePdEwGzh6Znc61U8cjwsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+5/ulllZ5YkdaMVcvLlMrGWwk+j7ngLHyo6ri3+mGN6d21K/IZVIZ5AcyeQxj2bdMqdXV2K0oCcgofytXLH5iq3jA0UF6ZMsFR7jzzo8RH8sBhcNNuSkcHlz7iAA2/WwHSqDTtVkDvORavqUN+G81vTx1QnJUZ/taYiB5hIZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY9/qMUS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY9/qMUS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D561F1F00A3D;
	Mon, 27 Jul 2026 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158677;
	bh=/qqbPPruEgVlRVz5eoHW6B4rJnsJDDf008Y9G0+8r1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NY9/qMUSC8yIHNQr533AZ6gh1EcGPvxqdGAEfTpBrsSevKspQ1FFCB4DVo5tTMba/
	 tYrcNKh0h5J9S1LaCW32sFasv6ydWupdbvM/Sl5iyx0y7NErKlNtd+SXzZRVr7A+nK
	 faS8a8UZQrq8++ee4brfICz0/RVnrga9lNwr31ncbSupUy6Wp0u8HsU8sNipmi2RQ1
	 T+L0A09ESNT3ocDaA+rGJ0d1S5dhKSfIwfrfbiMRMLv6LZhr+kvCaROeJrMFPJnOLZ
	 oTcjZWRZMfxfHMCdWlGUXYRBvxZ05bhSP6hb9Cdgwfq+V1mpPZL2YGlV7DVyzzJipI
	 +ayBQuICev4nA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] EDAC/altera: Drop __init from ECC setup paths for re-probe safety
Date: Mon, 27 Jul 2026 08:24:13 -0500
Message-ID: <20260727132416.807230-8-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260727132416.807230-1-dinguyen@kernel.org>
References: <20260727132416.807230-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sashiko reports: Does suppressing sysfs unbinding fully prevent the
execution of freed __init memory? If altr_sysmgr_regmap_lookup_by_phandle()
returns -EPROBE_DEFER, the probe is deferred until after __init memory is
freed.

The a10 EDAC .setup callbacks (sdmmc, ethernet, nand, dma, usb, qspi)
and their helpers (altr_init_a10_ecc_device_type,
altr_init_a10_ecc_block) were marked __init. These run from the probe
path, which may execute after init memory is freed -- e.g. a probe
deferred via -EPROBE_DEFER that only succeeds once a late/module
dependency appears, or a manual unbind/rebind. Calling __init code then
dereferences freed memory. Remove __init so these functions remain
valid at runtime.

Assisted-by: Cursor:claude-4.8-opus
Fixes: 788586efd116 ("EDAC/altera: Initialize peripheral FIFOs in probe())
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/edac/altera_edac.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index cd2c2d11214d4..d8d2adc9c39ac 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -946,7 +946,7 @@ static int __maybe_unused altr_init_memory_port(void __iomem *ioaddr, int port)
 	return ret;
 }
 
-static __init int __maybe_unused
+static int __maybe_unused
 altr_init_a10_ecc_block(struct device_node *np, u32 irq_mask,
 			u32 ecc_ctrl_en_mask, bool dual_port)
 {
@@ -1021,7 +1021,7 @@ altr_init_a10_ecc_block(struct device_node *np, u32 irq_mask,
 
 static int validate_parent_available(struct device_node *np);
 static const struct of_device_id altr_edac_a10_device_of_match[];
-static int __init __maybe_unused altr_init_a10_ecc_device_type(char *compat)
+static int __maybe_unused altr_init_a10_ecc_device_type(char *compat)
 {
 	int irq;
 	struct device_node *child, *np;
@@ -1350,7 +1350,7 @@ static const struct edac_device_prv_data a10_l2ecc_data = {
 
 #ifdef CONFIG_EDAC_ALTERA_ETHERNET
 
-static int __init socfpga_init_ethernet_ecc(struct altr_edac_device_dev *dev)
+static int socfpga_init_ethernet_ecc(struct altr_edac_device_dev *dev)
 {
 	int ret;
 
@@ -1380,7 +1380,7 @@ static const struct edac_device_prv_data a10_enetecc_data = {
 
 #ifdef CONFIG_EDAC_ALTERA_NAND
 
-static int __init socfpga_init_nand_ecc(struct altr_edac_device_dev *device)
+static int socfpga_init_nand_ecc(struct altr_edac_device_dev *device)
 {
 	int ret;
 
@@ -1410,7 +1410,7 @@ static const struct edac_device_prv_data a10_nandecc_data = {
 
 #ifdef CONFIG_EDAC_ALTERA_DMA
 
-static int __init socfpga_init_dma_ecc(struct altr_edac_device_dev *device)
+static int socfpga_init_dma_ecc(struct altr_edac_device_dev *device)
 {
 	int ret;
 
@@ -1440,7 +1440,7 @@ static const struct edac_device_prv_data a10_dmaecc_data = {
 
 #ifdef CONFIG_EDAC_ALTERA_USB
 
-static int __init socfpga_init_usb_ecc(struct altr_edac_device_dev *device)
+static int socfpga_init_usb_ecc(struct altr_edac_device_dev *device)
 {
 	int ret;
 
@@ -1470,7 +1470,7 @@ static const struct edac_device_prv_data a10_usbecc_data = {
 
 #ifdef CONFIG_EDAC_ALTERA_QSPI
 
-static int __init socfpga_init_qspi_ecc(struct altr_edac_device_dev *device)
+static int socfpga_init_qspi_ecc(struct altr_edac_device_dev *device)
 {
 	int ret;
 
@@ -1625,7 +1625,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	return rc;
 }
 
-static int __init socfpga_init_sdmmc_ecc(struct altr_edac_device_dev *device)
+static int socfpga_init_sdmmc_ecc(struct altr_edac_device_dev *device)
 {
 	int rc = -ENODEV;
 	struct device_node *child;
-- 
2.42.0.411.g813d9a9188

