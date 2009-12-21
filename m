From: Darren Jenkins <darrenrjenkins@gmail.com>
Subject: drivers/edac/ move a kfree() to after last use
Date: Mon, 21 Dec 2009 15:38:26 +1100
Message-ID: <1261370306.11354.52.camel@ICE-BOX>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753165AbZLUEin@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kernel Janitors <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dougthompson@xmission.com, borislav.petkov@amd.com
Cc: bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org


Move a kfree() below the last use of the memory

Coverity CID: 13142

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index df5b684..15b8b3c 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2925,10 +2925,10 @@ static void __devexit
amd64_remove_one_instance(struct pci_dev *pdev)
 
 	amd64_free_mc_sibling_devices(pvt);
 
-	kfree(pvt);
 	mci->pvt_info = NULL;
 
 	mci_lookup[pvt->mc_node_id] = NULL;
+	kfree(pvt);
 
 	/* unregister from EDAC MCE */
 	amd_report_gart_errors(false);
