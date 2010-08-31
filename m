From: Stephen Hemminger <shemminger@vyatta.com>
Subject: [PATCH] edac: make inst_grp_ops const
Date: Tue, 31 Aug 2010 15:24:02 -0700
Message-ID: <20100831152402.22b5e897@nehalam>
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
To: Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@redhat.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

This sysfs_ops should be const like all the others in the kernel.

Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

--- a/drivers/edac/edac_mc_sysfs.c	2010-08-31 15:10:29.692381171 -0700
+++ b/drivers/edac/edac_mc_sysfs.c	2010-08-31 15:11:24.072859199 -0700
@@ -764,7 +764,7 @@ static void edac_inst_grp_release(struct
 }
 
 /* Intermediate show/store table */
-static struct sysfs_ops inst_grp_ops = {
+static const struct sysfs_ops inst_grp_ops = {
 	.show = inst_grp_show,
 	.store = inst_grp_store
 };

------------------------------------------------------------------------------
Start uncovering the many advantages of virtual appliances
and start using them to simplify application deployment and
accelerate your shift to cloud computing.
http://p.sf.net/sfu/novell-sfdev2dev
