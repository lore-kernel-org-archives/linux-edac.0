From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] edac/Kconfig: reenable edac_mpc85xx on MPC85xx
Date: Sat, 17 Jul 2010 03:11:28 +0400
Message-ID: <1279321888-27335-1-git-send-email-dbaryshkov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net, stable@kernel.org
List-Id: edac.vger.kernel.org

Somewhere after 2.6.32 MPC85xx got renamed to FSL_BOOKE (to include
QorIQ family of chips). However drivers/edac/Kconfig wasn't updated to
reflect this change. Fix it now.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: stable@kernel.org
---
 drivers/edac/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index aedef79..2328c95 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -209,7 +209,7 @@ config EDAC_I5100
 
 config EDAC_MPC85XX
 	tristate "Freescale MPC83xx / MPC85xx"
-	depends on EDAC_MM_EDAC && FSL_SOC && (PPC_83xx || MPC85xx)
+	depends on EDAC_MM_EDAC && FSL_SOC && (PPC_83xx || FSL_SOC_BOOKE)
 	help
 	  Support for error detection and correction on the Freescale
 	  MPC8349, MPC8560, MPC8540, MPC8548
-- 
1.7.1
