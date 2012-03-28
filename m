From: Masanari Iida <standby24x7@gmail.com>
Subject: [PATCH] [trivial] edac: Fix document URLs
Date: Wed, 28 Mar 2012 23:16:36 +0900
Message-ID: <1332944196-18524-1-git-send-email-standby24x7@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bluesmoke-devel@lists.sourceforge.net, linux-edac@vger.kernel.org
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org, Masanari Iida <standby24x7@gmail.com>, Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@redhat.com>
List-Id: edac.vger.kernel.org

URLs for Memory controller's datasheet are "page not found".
Fix them to correct URLs.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>

Cc: Doug Thompson <dougthompson@xmission.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
---
 drivers/edac/i5000_edac.c |    2 +-
 drivers/edac/i5100_edac.c |    2 +-
 drivers/edac/i5400_edac.c |    2 +-
 drivers/edac/i7300_edac.c |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index a2680d8..9656802 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -10,7 +10,7 @@
  * This module is based on the following document:
  *
  * Intel 5000X Chipset Memory Controller Hub (MCH) - Datasheet
- * 	http://developer.intel.com/design/chipsets/datashts/313070.htm
+ *     http://www.intel.com/content/dam/doc/datasheet/5000x-chipset-memory-controller-hub-datasheet.pdf
  *
  */
 
diff --git a/drivers/edac/i5100_edac.c b/drivers/edac/i5100_edac.c
index 2e23547..13b0c2f 100644
--- a/drivers/edac/i5100_edac.c
+++ b/drivers/edac/i5100_edac.c
@@ -7,7 +7,7 @@
  * This module is based on the following document:
  *
  * Intel 5100X Chipset Memory Controller Hub (MCH) - Datasheet
- *      http://download.intel.com/design/chipsets/datashts/318378.pdf
+ *      http://www.intel.com/content/dam/doc/datasheet/5100-memory-controller-hub-chipset-datasheet.pdf
  *
  * The intel 5100 has two independent channels. EDAC core currently
  * can not reflect this configuration so instead the chip-select
diff --git a/drivers/edac/i5400_edac.c b/drivers/edac/i5400_edac.c
index 67ec962..41560c1 100644
--- a/drivers/edac/i5400_edac.c
+++ b/drivers/edac/i5400_edac.c
@@ -16,7 +16,7 @@
  * This module is based on the following document:
  *
  * Intel 5400 Chipset Memory Controller Hub (MCH) - Datasheet
- * 	http://developer.intel.com/design/chipsets/datashts/313070.htm
+ *     http://www.intel.com/content/dam/doc/datasheet/5400-chipset-memory-controller-hub-datasheet.pdf
  *
  */
 
diff --git a/drivers/edac/i7300_edac.c b/drivers/edac/i7300_edac.c
index 3bafa3b..48ffe3b 100644
--- a/drivers/edac/i7300_edac.c
+++ b/drivers/edac/i7300_edac.c
@@ -10,7 +10,7 @@
  * Red Hat Inc. http://www.redhat.com
  *
  * Intel 7300 Chipset Memory Controller Hub (MCH) - Datasheet
- *	http://www.intel.com/Assets/PDF/datasheet/318082.pdf
+ *     http://www.intel.com/content/dam/doc/datasheet/7300-chipset-memory-controller-hub-datasheet.pdf
  *
  * TODO: The chipset allow checking for PCI Express errors also. Currently,
  *	 the driver covers only memory error errors
-- 
1.7.10.rc2.19.gfae9d
