From: Joe Perches <joe@perches.com>
Subject: [PATCH 07/11] drivers/edac/e7*_edac.c: Rename dev_info to edi
Date: Mon,  5 Apr 2010 12:05:37 -0700
Message-ID: <cde34c3008ca9ecae613c966a62845413518542c.1270493677.git.joe@perches.com>
References: <20100304232928.2e45bdd1.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20100304232928.2e45bdd1.akpm@linux-foundation.org>
In-Reply-To: <cover.1270493677.git.joe@perches.com>
References: <cover.1270493677.git.joe@perches.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Gross <mark.gross@intel.com>, bluesmoke-devel@lists.sourceforge.net, Doug Thompson <dougthompson@xmission.com>
List-Id: edac.vger.kernel.org

There is a macro called dev_info that prints struct device specific
information.  Having variables with the same name can be confusing and
prevents conversion of the macro to a function.

Rename the existing dev_info variables to something else in preparation
to converting the dev_info macro to a function.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/edac/e752x_edac.c |   18 +++++++++---------
 drivers/edac/e7xxx_edac.c |    8 ++++----
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
index 243e9aa..2d876ae 100644
--- a/drivers/edac/e752x_edac.c
+++ b/drivers/edac/e752x_edac.c
@@ -198,7 +198,7 @@ struct e752x_pvt {
 	int mc_symmetric;
 	u8 map[8];
 	int map_type;
-	const struct e752x_dev_info *dev_info;
+	const struct e752x_dev_info *edi;
 };
 
 struct e752x_dev_info {
@@ -820,7 +820,7 @@ static void e752x_get_error_info(struct mem_ctl_info *mci,
 	pci_read_config_dword(dev, E752X_FERR_GLOBAL, &info->ferr_global);
 
 	if (info->ferr_global) {
-		if (pvt->dev_info->err_dev == PCI_DEVICE_ID_INTEL_3100_1_ERR) {
+		if (pvt->edi->err_dev == PCI_DEVICE_ID_INTEL_3100_1_ERR) {
 			pci_read_config_dword(dev, I3100_NSI_FERR,
 					     &info->nsi_ferr);
 			info->hi_ferr = 0;
@@ -872,7 +872,7 @@ static void e752x_get_error_info(struct mem_ctl_info *mci,
 	pci_read_config_dword(dev, E752X_NERR_GLOBAL, &info->nerr_global);
 
 	if (info->nerr_global) {
-		if (pvt->dev_info->err_dev == PCI_DEVICE_ID_INTEL_3100_1_ERR) {
+		if (pvt->edi->err_dev == PCI_DEVICE_ID_INTEL_3100_1_ERR) {
 			pci_read_config_dword(dev, I3100_NSI_NERR,
 					     &info->nsi_nerr);
 			info->hi_nerr = 0;
@@ -966,7 +966,7 @@ static int set_sdram_scrub_rate(struct mem_ctl_info *mci, u32 *new_bw)
 	struct pci_dev *pdev = pvt->dev_d0f0;
 	int i;
 
-	if (pvt->dev_info->ctl_dev == PCI_DEVICE_ID_INTEL_3100_0)
+	if (pvt->edi->ctl_dev == PCI_DEVICE_ID_INTEL_3100_0)
 		scrubrates = scrubrates_i3100;
 	else
 		scrubrates = scrubrates_e752x;
@@ -996,7 +996,7 @@ static int get_sdram_scrub_rate(struct mem_ctl_info *mci, u32 *bw)
 	u16 scrubval;
 	int i;
 
-	if (pvt->dev_info->ctl_dev == PCI_DEVICE_ID_INTEL_3100_0)
+	if (pvt->edi->ctl_dev == PCI_DEVICE_ID_INTEL_3100_0)
 		scrubrates = scrubrates_i3100;
 	else
 		scrubrates = scrubrates_e752x;
@@ -1146,7 +1146,7 @@ static int e752x_get_devs(struct pci_dev *pdev, int dev_idx,
 	struct pci_dev *dev;
 
 	pvt->bridge_ck = pci_get_device(PCI_VENDOR_ID_INTEL,
-				pvt->dev_info->err_dev, pvt->bridge_ck);
+				pvt->edi->err_dev, pvt->bridge_ck);
 
 	if (pvt->bridge_ck == NULL)
 		pvt->bridge_ck = pci_scan_single_device(pdev->bus,
@@ -1207,7 +1207,7 @@ static void e752x_init_error_reporting_regs(struct e752x_pvt *pvt)
 
 	dev = pvt->dev_d0f1;
 	/* Turn off error disable & SMI in case the BIOS turned it on */
-	if (pvt->dev_info->err_dev == PCI_DEVICE_ID_INTEL_3100_1_ERR) {
+	if (pvt->edi->err_dev == PCI_DEVICE_ID_INTEL_3100_1_ERR) {
 		pci_write_config_dword(dev, I3100_NSI_EMASK, 0);
 		pci_write_config_dword(dev, I3100_NSI_SMICMD, 0);
 	} else {
@@ -1273,7 +1273,7 @@ static int e752x_probe1(struct pci_dev *pdev, int dev_idx)
 
 	debugf3("%s(): init pvt\n", __func__);
 	pvt = (struct e752x_pvt *)mci->pvt_info;
-	pvt->dev_info = &e752x_devs[dev_idx];
+	pvt->edi = &e752x_devs[dev_idx];
 	pvt->mc_symmetric = ((ddrcsr & 0x10) != 0);
 
 	if (e752x_get_devs(pdev, dev_idx, pvt)) {
@@ -1282,7 +1282,7 @@ static int e752x_probe1(struct pci_dev *pdev, int dev_idx)
 	}
 
 	debugf3("%s(): more mci init\n", __func__);
-	mci->ctl_name = pvt->dev_info->ctl_name;
+	mci->ctl_name = pvt->edi->ctl_name;
 	mci->dev_name = pci_name(pdev);
 	mci->edac_check = e752x_check;
 	mci->ctl_page_to_phys = ctl_page_to_phys;
diff --git a/drivers/edac/e7xxx_edac.c b/drivers/edac/e7xxx_edac.c
index c7d11cc..3b82687 100644
--- a/drivers/edac/e7xxx_edac.c
+++ b/drivers/edac/e7xxx_edac.c
@@ -128,7 +128,7 @@ struct e7xxx_pvt {
 	u32 tolm;
 	u32 remapbase;
 	u32 remaplimit;
-	const struct e7xxx_dev_info *dev_info;
+	const struct e7xxx_dev_info *edi;
 };
 
 struct e7xxx_dev_info {
@@ -432,9 +432,9 @@ static int e7xxx_probe1(struct pci_dev *pdev, int dev_idx)
 	mci->dev = &pdev->dev;
 	debugf3("%s(): init pvt\n", __func__);
 	pvt = (struct e7xxx_pvt *)mci->pvt_info;
-	pvt->dev_info = &e7xxx_devs[dev_idx];
+	pvt->edi = &e7xxx_devs[dev_idx];
 	pvt->bridge_ck = pci_get_device(PCI_VENDOR_ID_INTEL,
-					pvt->dev_info->err_dev, pvt->bridge_ck);
+					pvt->edi->err_dev, pvt->bridge_ck);
 
 	if (!pvt->bridge_ck) {
 		e7xxx_printk(KERN_ERR, "error reporting device not found:"
@@ -444,7 +444,7 @@ static int e7xxx_probe1(struct pci_dev *pdev, int dev_idx)
 	}
 
 	debugf3("%s(): more mci init\n", __func__);
-	mci->ctl_name = pvt->dev_info->ctl_name;
+	mci->ctl_name = pvt->edi->ctl_name;
 	mci->dev_name = pci_name(pdev);
 	mci->edac_check = e7xxx_check;
 	mci->ctl_page_to_phys = ctl_page_to_phys;
-- 
1.7.0.3.311.g6a6955


------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
