From: dougthompson@xmission.com
Subject: [PATCH 5/7] edac: mpc85xx use resource_size instead of raw math
Date: Wed, 03 Feb 2010 23:46:17 -0700
Message-ID: <4b6a6d39.DE4ItdPPoue1qlHX%dougthompson@xmission.com>
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
To: ptyser@xes-inc.com, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: edac.vger.kernel.org

From: H Hartley Sweeten <hsweeten@visionengravers.com>

Use resource_size() instead of arithmatic.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Doug Thompson <dougthompson@xmission.com>
Acked-by: Dave Jiang <djiang@mvista.com>
---
 mpc85xx_edac.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

Index: linux-2.6.33-rc4/drivers/edac/mpc85xx_edac.c
===================================================================
--- linux-2.6.33-rc4.orig/drivers/edac/mpc85xx_edac.c	2010-01-13 00:18:21.000000000 -0700
+++ linux-2.6.33-rc4/drivers/edac/mpc85xx_edac.c	2010-01-13 00:18:23.000000000 -0700
@@ -239,16 +239,15 @@ static int __devinit mpc85xx_pci_err_pro
 	/* we only need the error registers */
 	r.start += 0xe00;
 
-	if (!devm_request_mem_region(&op->dev, r.start,
-					r.end - r.start + 1, pdata->name)) {
+	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
+					pdata->name)) {
 		printk(KERN_ERR "%s: Error while requesting mem region\n",
 		       __func__);
 		res = -EBUSY;
 		goto err;
 	}
 
-	pdata->pci_vbase = devm_ioremap(&op->dev, r.start,
-					r.end - r.start + 1);
+	pdata->pci_vbase = devm_ioremap(&op->dev, r.start, resource_size(&r));
 	if (!pdata->pci_vbase) {
 		printk(KERN_ERR "%s: Unable to setup PCI err regs\n", __func__);
 		res = -ENOMEM;

------------------------------------------------------------------------------
The Planet: dedicated and managed hosting, cloud storage, colocation
Stay online with enterprise data centers and the best network in the business
Choose flexible plans and management services without long-term contracts
Personal 24x7 support from experience hosting pros just a phone call away.
http://p.sf.net/sfu/theplanet-com
