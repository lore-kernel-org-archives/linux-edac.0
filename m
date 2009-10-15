From: dougthompson@xmission.com
Subject: [PATCH 1/2] edac: i5400 fix missing CONFIG_PCI define
Date: Thu, 15 Oct 2009 17:16:45 -0600
Message-ID: <4ad7ad5d.bbMDMCOY1LPNMc5Q%dougthompson@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: kmannth@us.ibm.com, iws@ovro.caltech.edu, jroberson@jroberson.net, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: edac.vger.kernel.org

From: Ira W. Snyder <iws@ovro.caltech.edu>

When building without CONFIG_PCI the edac_pci_idx variable is unused,
causing a build-time warning. Wrap the variable in #ifdef CONFIG_PCI, just
like the rest of the PCI support.

Signed-off-by: Ira W. Snyder <iws@ovro.caltech.edu>
Signed-off-by: Doug Thompson <dougthompson@xmission.com>
---
drivers/edac/mpc85xx_edac.c |    2 ++
1 files changed, 2 insertions(+), 0 deletions(-)

Index: linux-2.6.31/drivers/edac/mpc85xx_edac.c
===================================================================
--- linux-2.6.31.orig/drivers/edac/mpc85xx_edac.c
+++ linux-2.6.31/drivers/edac/mpc85xx_edac.c
@@ -26,7 +26,9 @@
 #include "mpc85xx_edac.h"
 
 static int edac_dev_idx;
+#ifdef CONFIG_PCI
 static int edac_pci_idx;
+#endif
 static int edac_mc_idx;
 
 static u32 orig_ddr_err_disable;

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
