From: Chris Metcalf <cmetcalf@tilera.com>
Subject: [PATCH] edac: say "TILEGx" not "TILEPro" for the tilegx edac driver
Date: Fri, 30 Mar 2012 18:58:37 -0400
Message-ID: <201203302301.q2UN1hj1011357@farm-0012.internal.tilera.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

This is just an aesthetic change but it was silly to say TILEPro
when booting up on the tilegx architecture.

Signed-off-by: Chris Metcalf <cmetcalf@tilera.com>
---
 drivers/edac/tile_edac.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/edac/tile_edac.c b/drivers/edac/tile_edac.c
index 1d5cf06..e99d009 100644
--- a/drivers/edac/tile_edac.c
+++ b/drivers/edac/tile_edac.c
@@ -145,7 +145,11 @@ static int __devinit tile_edac_mc_probe(struct platform_device *pdev)
 	mci->edac_ctl_cap = EDAC_FLAG_SECDED;
 
 	mci->mod_name = DRV_NAME;
+#ifdef __tilegx__
+	mci->ctl_name = "TILEGx_Memory_Controller";
+#else
 	mci->ctl_name = "TILEPro_Memory_Controller";
+#endif
 	mci->dev_name = dev_name(&pdev->dev);
 	mci->edac_check = tile_edac_check;
 
-- 
1.6.5.2
