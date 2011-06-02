From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 1/2] ppc/85xx: create a platform node for PCI EDAC device
Date: Thu,  2 Jun 2011 16:25:02 +0400
Message-ID: <1307017502-3965-1-git-send-email-dbaryshkov@gmail.com>
References: <20110601114823.2e57c691@schlenkerla.am.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20110601114823.2e57c691@schlenkerla.am.freescale.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: bluesmoke-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
List-Id: edac.vger.kernel.org

As a device for pci node isn't created, create a special platform_device
for PCI EDAC device on MPC85xx.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 arch/powerpc/sysdev/fsl_pci.c |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 68ca929..0e37259 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -381,6 +381,39 @@ int __init fsl_add_bridge(struct device_node *dev, int is_primary)
 	return 0;
 }
 
+int __init fsl_add_pci_err(void)
+{
+	struct device_node *np;
+
+	for_each_node_by_type(np, "pci") {
+		/* Only PCI, not PCI Express! */
+		if (of_device_is_compatible(np, "fsl,mpc8540-pci")) {
+			struct resource r[2];
+
+			r[0].parent = NULL;
+			r[1].parent = NULL;
+
+			if (of_address_to_resource(np, 0, &r[0])) {
+				printk(KERN_WARNING
+						"Can't get register base for PCI EDAC!\n");
+				continue;
+			}
+			r[0].start += 0xe00;
+
+			if (of_irq_to_resource(np, 0, &r[1]) == NO_IRQ) {
+				printk(KERN_WARNING
+						"Can't get irq for PCI EDAC!\n");
+				continue;
+			}
+			platform_device_register_simple("mpc85xx_pci_err", -1,
+					r, ARRAY_SIZE(r));
+		}
+	}
+
+	return 0;
+}
+device_initcall(fsl_add_pci_err);
+
 DECLARE_PCI_FIXUP_HEADER(0x1957, PCI_DEVICE_ID_MPC8548E, quirk_fsl_pcie_header);
 DECLARE_PCI_FIXUP_HEADER(0x1957, PCI_DEVICE_ID_MPC8548, quirk_fsl_pcie_header);
 DECLARE_PCI_FIXUP_HEADER(0x1957, PCI_DEVICE_ID_MPC8543E, quirk_fsl_pcie_header);
-- 
1.7.4.4


------------------------------------------------------------------------------
Simplify data backup and recovery for your virtual environment with vRanger. 
Installation's a snap, and flexible recovery options mean your data is safe,
secure and there when you need it. Data protection magic?
Nope - It's vRanger. Get your free trial download today. 
http://p.sf.net/sfu/quest-sfdev2dev
