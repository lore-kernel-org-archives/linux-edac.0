From: Borislav Petkov <borislav.petkov@amd.com>
Subject: [GIT PULL] edac_mce_amd fix for 2.6.34-rc3
Date: Mon, 22 Mar 2010 16:33:22 +0100
Message-ID: <20100322153322.GF6336@aftab>
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
Cc: Doug Thompson <norsk5@yahoo.com>, edac-devel <bluesmoke-devel@lists.sourceforge.net>
List-Id: edac.vger.kernel.org

Hi Linus,

please pull the following small fix.

Thanks.

The following changes since commit 220bf991b0366cc50a94feede3d7341fa5710ee4:
  Linus Torvalds (1):
        Linux 2.6.34-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git for-linus

Borislav Petkov (1):
      edac, mce: Filter out invalid values

 drivers/edac/edac_mce_amd.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

---
diff --git a/drivers/edac/edac_mce_amd.c b/drivers/edac/edac_mce_amd.c
index 8fc91a0..f5b6d9f 100644
--- a/drivers/edac/edac_mce_amd.c
+++ b/drivers/edac/edac_mce_amd.c
@@ -316,7 +316,12 @@ void amd_decode_nb_mce(int node_id, struct err_regs *regs, int handle_errors)
 		if (regs->nbsh & K8_NBSH_ERR_CPU_VAL)
 			pr_cont(", core: %u\n", (u8)(regs->nbsh & 0xf));
 	} else {
-		pr_cont(", core: %d\n", fls((regs->nbsh & 0xf) - 1));
+		u8 assoc_cpus = regs->nbsh & 0xf;
+
+		if (assoc_cpus > 0)
+			pr_cont(", core: %d", fls(assoc_cpus) - 1);
+
+		pr_cont("\n");
 	}
 
 	pr_emerg("%s.\n", EXT_ERR_MSG(xec));

-- 
Regards/Gruss,
Boris.

-
Advanced Micro Devices, Inc.
Operating Systems Research Center


------------------------------------------------------------------------------
Download Intel&#174; Parallel Studio Eval
Try the new software tools for yourself. Speed compiling, find bugs
proactively, and fine-tune applications for parallel performance.
See why Intel Parallel Studio got high marks during beta.
http://p.sf.net/sfu/intel-sw-dev
