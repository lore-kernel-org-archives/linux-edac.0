From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/2] mpc85xx_edac: change to use new definitions for PCI EDAC
	regspace
Date: Thu, 22 Jul 2010 04:03:12 +0400
Message-ID: <1279756992-29543-2-git-send-email-dbaryshkov@gmail.com>
References: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <1279756992-29543-1-git-send-email-dbaryshkov@gmail.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: linuxppc-dev@ozlabs.org
Cc: Doug Thompson <dougthompson@xmission.com>, Dave Jiang <djiang@mvista.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

Currently (as mpc8540-pci) devices are not created on of_platform bus,
mpc85xx_edac can't probe to them. Follow the change to dts trees to bind
not to the main mpc8540-pci node but to special mpc85xx-pci-error nodes,
present on soc bus.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/edac/mpc85xx_edac.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 52ca09b..d5a61b8 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -236,9 +236,6 @@ static int __devinit mpc85xx_pci_err_probe(struct of_device *op,
 		goto err;
 	}
 
-	/* we only need the error registers */
-	r.start += 0xe00;
-
 	if (!devm_request_mem_region(&op->dev, r.start, resource_size(&r),
 					pdata->name)) {
 		printk(KERN_ERR "%s: Error while requesting mem region\n",
@@ -328,12 +325,15 @@ static int mpc85xx_pci_err_remove(struct of_device *op)
 }
 
 static struct of_device_id mpc85xx_pci_err_of_match[] = {
-	{
-	 .compatible = "fsl,mpc8540-pcix",
-	 },
-	{
-	 .compatible = "fsl,mpc8540-pci",
-	},
+	{ .compatible = "fsl,mpc8536-pci-error", },
+	{ .compatible = "fsl,mpc8540-pci-error", },
+	{ .compatible = "fsl,mpc8541-pci-error", },
+	{ .compatible = "fsl,mpc8544-pci-error", },
+	{ .compatible = "fsl,mpc8548-pci-error", },
+	{ .compatible = "fsl,mpc8555-pci-error", },
+	{ .compatible = "fsl,mpc8560-pci-error", },
+	{ .compatible = "fsl,mpc8568-pci-error", },
+	{ .compatible = "fsl,mpc8572-pci-error", },
 	{},
 };
 
-- 
1.7.1


------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
