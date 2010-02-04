From: dougthompson@xmission.com
Subject: [PATCH 6/7] edac: mpc85xx fsb ecc
Date: Wed, 03 Feb 2010 23:46:17 -0700
Message-ID: <4b6a6d39.qA/tt48S/7odhQ+i%dougthompson@xmission.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kolifer@gmail.com, bluesmoke-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, akpm@linux-foundation.org
List-Id: edac.vger.kernel.org

From: Konstantin Olifer <kolifer@gmail.com>

Patch is for Kernel 2.6.33. e752x_edac suppose that fsb ECC exist, for example, on
Celeron + 3100. That is wrong. 
ECC FSB supported only on Xeon for our vision (www.setdsp.ru) and datasheet from developer intel www. 
Fixed.


Signed-off-by:  Konstantin Olifer <kolifer@gmail.com>
Signed-off-by:  Doug Thompson <dougthompson@xmission.com>
---
 e752x_edac.c |   10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

Index: linux-2.6.33-rc4/drivers/edac/e752x_edac.c
===================================================================
--- linux-2.6.33-rc4.orig/drivers/edac/e752x_edac.c	2010-01-12 23:26:07.000000000 -0700
+++ linux-2.6.33-rc4/drivers/edac/e752x_edac.c	2010-01-12 23:26:13.000000000 -0700
@@ -1073,10 +1073,7 @@ fail:
 
 /* Setup system bus parity mask register.
  * Sysbus parity supported on:
- *   e7320/e7520/e7525 + Xeon
- *   i3100 + Xeon/Celeron
- * Sysbus parity not supported on:
- *   i3100 + Pentium M/Celeron M/Core Duo/Core2 Duo
+ * e7320/e7520/e7525 + Xeon
  */
 static void e752x_init_sysbus_parity_mask(struct e752x_pvt *pvt)
 {
@@ -1087,10 +1084,7 @@ static void e752x_init_sysbus_parity_mas
 	/* Allow module parameter override, else see if CPU supports parity */
 	if (sysbus_parity != -1) {
 		enable = sysbus_parity;
-	} else if (cpu_id[0] &&
-		   ((strstr(cpu_id, "Pentium") && strstr(cpu_id, " M ")) ||
-		    (strstr(cpu_id, "Celeron") && strstr(cpu_id, " M ")) ||
-		    (strstr(cpu_id, "Core") && strstr(cpu_id, "Duo")))) {
+	} else if (cpu_id[0] && !strstr(cpu_id, "Xeon")) {
 		e752x_printk(KERN_INFO, "System Bus Parity not "
 			     "supported by CPU, disabling\n");
 		enable = 0;
