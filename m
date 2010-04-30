From: Borislav Petkov <bp@amd64.org>
Subject: [GIT PULL] EDAC, MCE fix for v2.6.34-rc7
Date: Fri, 30 Apr 2010 16:10:31 +0200
Message-ID: <20100430141031.GB7287@aftab>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86 <x86@kernel.org>, edac-devel <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Hi Linus,

please pull^Wapply the following patch for .34-rc7. Yeah, I would
normally send you a pull request but master.kernel.org seems to be in
maintenance mode and I can't login. It's a good thing the patch is only
a small two-liner though :).

Thanks.

--
From: Borislav Petkov <borislav.petkov@amd.com>
Date: Fri, 30 Apr 2010 15:19:02 +0200
Subject: [PATCH] edac, mce: Fix wrong mask and macro usage

Correct two mishaps which prevented reporting error type (CECC vs UECC)
and extended error description.

Cc: <stable@kernel.org> # 32.x,  33.x
Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
---
 drivers/edac/edac_mce_amd.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/edac_mce_amd.c b/drivers/edac/edac_mce_amd.c
index f5b6d9f..97e64bc 100644
--- a/drivers/edac/edac_mce_amd.c
+++ b/drivers/edac/edac_mce_amd.c
@@ -294,7 +294,6 @@ wrong_ls_mce:
 void amd_decode_nb_mce(int node_id, struct err_regs *regs, int handle_errors)
 {
 	u32 ec  = ERROR_CODE(regs->nbsl);
-	u32 xec = EXT_ERROR_CODE(regs->nbsl);
 
 	if (!handle_errors)
 		return;
@@ -324,7 +323,7 @@ void amd_decode_nb_mce(int node_id, struct err_regs *regs, int handle_errors)
 		pr_cont("\n");
 	}
 
-	pr_emerg("%s.\n", EXT_ERR_MSG(xec));
+	pr_emerg("%s.\n", EXT_ERR_MSG(regs->nbsl));
 
 	if (BUS_ERROR(ec) && nb_bus_decoder)
 		nb_bus_decoder(node_id, regs);
@@ -374,7 +373,7 @@ static int amd_decode_mce(struct notifier_block *nb, unsigned long val,
 		 ((m->status & MCI_STATUS_PCC) ? "yes" : "no"));
 
 	/* do the two bits[14:13] together */
-	ecc = m->status & (3ULL << 45);
+	ecc = (m->status >> 45) & 0x3;
 	if (ecc)
 		pr_cont(", %sECC Error", ((ecc == 2) ? "C" : "U"));
 
-- 
1.7.1.rc1


-- 
Regards/Gruss,
Boris.

--
Advanced Micro Devices, Inc.
Operating Systems Research Center

------------------------------------------------------------------------------
