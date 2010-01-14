From: dougthompson@xmission.com
Subject: [PATCH 1/1] edac: i5000_edac critical fix panic out of bounds
Date: Thu, 14 Jan 2010 09:01:26 -0700
Message-ID: <4b4f3fd6.uRcykZhMm6srfB1R%dougthompson@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757074Ab0ANQK0@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tom@vincze.org, mchehab@redhat.com, gregkh@suse.de, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: edac.vger.kernel.org

From: Tamas Vincze <tom@vincze.org>

Fix for BZ#14568

EDAC MC0: INTERNAL ERROR: channel-b out of range (4 >= 4)
Kernel panic - not syncing: EDAC MC0: Uncorrected Error  (XEN) Domain 0 crashed: 'noreboot' set - not rebooting.

This happens because FERR_NF_FBD bit 28 is not updated on i5000. Due to that,
both bits 28 and 29 may be equal to one, returning channel = 3. As this
value is invalid, EDAC core generates the panic.

Signed-off-by: Tamas Vincze <tom@vincze.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
Signed-off-by: Doug Thompson <dougthompson@xmission.com>
---
 i5000_edac.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

Index: linux-2.6.33-rc4/drivers/edac/i5000_edac.c
===================================================================
--- linux-2.6.33-rc4.orig/drivers/edac/i5000_edac.c	2010-01-14 08:37:33.000000000 -0700
+++ linux-2.6.33-rc4/drivers/edac/i5000_edac.c	2010-01-14 08:41:23.000000000 -0700
@@ -577,7 +577,13 @@ static void i5000_process_nonfatal_error
 		debugf0("\tUncorrected bits= 0x%x\n", ue_errors);
 
 		branch = EXTRACT_FBDCHAN_INDX(info->ferr_nf_fbd);
-		channel = branch;
+
+		/*
+		 * According with i5000 datasheet, bit 28 has no significance
+		 * for errors M4Err-M12Err and M17Err-M21Err, on FERR_NF_FBD
+		 */
+		channel = branch & 2;
+
 		bank = NREC_BANK(info->nrecmema);
 		rank = NREC_RANK(info->nrecmema);
 		rdwr = NREC_RDWR(info->nrecmema);
