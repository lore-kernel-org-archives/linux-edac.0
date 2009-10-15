From: dougthompson@xmission.com
Subject: [PATCH 1/3] edac: i5100 fix initialization code
Date: Thu, 15 Oct 2009 17:16:45 -0600
Message-ID: <4ad7ad5d.115Y8SyVFKWEfV/O%dougthompson@xmission.com>
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

From:  Keith Mannthey <kmannth@us.ibm.com>

Allow csrows to properly initialize when the topology only has active
channels on 2 and 3.  This new check allows proper detection and
initialization in this topology.  Only checking the first mrt that
represented channels 0 and 1 is not sufficient. 

I also fixed up the related debug information path. I can submit as a
2nd patch if needed. 


Signed-off-by:  Keith Mannthey <kmannth@us.ibm.com>
Acked-by: Aristeu Rozanski <aris@ruivo.org>
Signed-off-by:  Doug Thompson <dougthompson@xmission.com>
---
 i5000_edac.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

Index: linux-2.6.31/drivers/edac/i5000_edac.c
===================================================================
--- linux-2.6.31.orig/drivers/edac/i5000_edac.c
+++ linux-2.6.31/drivers/edac/i5000_edac.c
@@ -1173,7 +1173,7 @@ static void i5000_get_mc_regs(struct mem
 			pci_read_config_word(pvt->branch_1, where,
 					&pvt->b1_mtr[slot_row]);
 			debugf2("MTR%d where=0x%x B1 value=0x%x\n", slot_row,
-				where, pvt->b0_mtr[slot_row]);
+				where, pvt->b1_mtr[slot_row]);
 		} else {
 			pvt->b1_mtr[slot_row] = 0;
 		}
@@ -1232,7 +1232,7 @@ static int i5000_init_csrows(struct mem_
 	struct csrow_info *p_csrow;
 	int empty, channel_count;
 	int max_csrows;
-	int mtr;
+	int mtr, mtr1;
 	int csrow_megs;
 	int channel;
 	int csrow;
@@ -1251,9 +1251,10 @@ static int i5000_init_csrows(struct mem_
 
 		/* use branch 0 for the basis */
 		mtr = pvt->b0_mtr[csrow >> 1];
+		mtr1 = pvt->b1_mtr[csrow >> 1];
 
 		/* if no DIMMS on this row, continue */
-		if (!MTR_DIMMS_PRESENT(mtr))
+		if (!MTR_DIMMS_PRESENT(mtr) && !MTR_DIMMS_PRESENT(mtr1))
 			continue;
 
 		/* FAKE OUT VALUES, FIXME */

------------------------------------------------------------------------------
Come build with us! The BlackBerry(R) Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9 - 12, 2009. Register now!
http://p.sf.net/sfu/devconference
