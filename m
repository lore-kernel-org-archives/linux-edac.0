From: "Ira W. Snyder" <iws@ovro.caltech.edu>
Subject: [PATCH] edac/mpc85xx: fix unused variable warning
Date: Thu,  7 Apr 2011 10:32:48 -0700
Message-ID: <1302197568-31725-1-git-send-email-iws@ovro.caltech.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: "Ira W. Snyder" <iws@ovro.caltech.edu>, Kumar Gala <galak@kernel.crashing.org>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Commit a94d7b35067ab403485a1ea06b7a3d0172d1a1ba introduced an unused
variable warning when CONFIG_FSL_SOC_BOOKE is not defined. Fix it.

Signed-off-by: Ira W. Snyder <iws@ovro.caltech.edu>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: bluesmoke-devel@lists.sourceforge.net
---
 drivers/edac/mpc85xx_edac.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 38ab8e2..6002657 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -1154,7 +1154,9 @@ static void __init mpc85xx_mc_clear_rfxe(void *data)
 static int __init mpc85xx_mc_init(void)
 {
 	int res = 0;
+#ifdef CONFIG_FSL_SOC_BOOKE
 	u32 pvr = 0;
+#endif
 
 	printk(KERN_INFO "Freescale(R) MPC85xx EDAC driver, "
 	       "(C) 2006 Montavista Software\n");
-- 
1.7.3.4
