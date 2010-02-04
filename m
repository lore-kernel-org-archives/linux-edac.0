From: dougthompson@xmission.com
Subject: [PATCH 2/7] edac: mpc85xx fix build regression by removing unused debug code
Date: Wed, 03 Feb 2010 23:46:17 -0700
Message-ID: <4b6a6d39.ot3a2HM9dIQ1VQuk%dougthompson@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ptyser@xes-inc.com, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: edac.vger.kernel.org

From: Peter Tyser <ptyser@xes-inc.com>

Some unused, unsupported debug code existed in the mpc85xx EDAC driver
that resulted in a build failure when CONFIG_EDAC_DEBUG was defined:

  drivers/edac/mpc85xx_edac.c: In function 'mpc85xx_mc_err_probe':
  drivers/edac/mpc85xx_edac.c:1031: error: implicit declaration of function 'edac_mc_register_mcidev_debug'
  drivers/edac/mpc85xx_edac.c:1031: error: 'debug_attr' undeclared (first use in this function)
  drivers/edac/mpc85xx_edac.c:1031: error: (Each undeclared identifier is reported only once
  drivers/edac/mpc85xx_edac.c:1031: error: for each function it appears in.)

Signed-off-by: Peter Tyser <ptyser@xes-inc.com>
Signed-off-by: Doug Thompson <dougthompson@xmission.com
---
 drivers/edac/mpc85xx_edac.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

Index: linux-2.6.33-rc4/drivers/edac/mpc85xx_edac.c
===================================================================
--- linux-2.6.33-rc4.orig/drivers/edac/mpc85xx_edac.c	2010-01-13 00:15:32.000000000 -0700
+++ linux-2.6.33-rc4/drivers/edac/mpc85xx_edac.c	2010-01-13 00:15:49.000000000 -0700
@@ -892,10 +892,6 @@ static int __devinit mpc85xx_mc_err_prob
 
 	mpc85xx_init_csrows(mci);
 
-#ifdef CONFIG_EDAC_DEBUG
-	edac_mc_register_mcidev_debug((struct attribute **)debug_attr);
-#endif
-
 	/* store the original error disable bits */
 	orig_ddr_err_disable =
 	    in_be32(pdata->mc_vbase + MPC85XX_MC_ERR_DISABLE);
