From: Kulikov Vasiliy <segooon@gmail.com>
Subject: [PATCH 09/19] drivers/edac: use for_each_pci_dev()
Date: Sat,  3 Jul 2010 20:04:07 +0400
Message-ID: <1278173048-11711-1-git-send-email-segooon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Doug Thompson <dougthompson@xmission.com>, Stephen Hemminger <shemminger@vyatta.com>, Jens Axboe <jens.axboe@oracle.com>, David Teigland <teigland@redhat.com>, Pekka Enberg <penberg@cs.helsinki.fi>, "Hans J. Koch" <hjk@linutronix.de>, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/edac/edac_pci_sysfs.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_pci_sysfs.c b/drivers/edac/edac_pci_sysfs.c
index c39697d..dd28a82 100644
--- a/drivers/edac/edac_pci_sysfs.c
+++ b/drivers/edac/edac_pci_sysfs.c
@@ -653,9 +653,8 @@ static inline void edac_pci_dev_parity_iterator(pci_parity_check_fn_t fn)
 	 * and while we are looking at it have its reference count
 	 * bumped until we are done with it
 	 */
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev)
 		fn(dev);
-	}
 }
 
 /*
-- 
1.7.0.4
