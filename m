From: Kulikov Vasiliy <segooon@gmail.com>
Subject: [PATCH 1/2] edac: i5000: carefull error handling
Date: Wed, 21 Jul 2010 23:07:21 +0400
Message-ID: <1279739241-8203-1-git-send-email-segooon@gmail.com>
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
To: kernel-janitors@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-kernel@vger.kernel.org, Tamas Vincze <tom@vincze.org>, Doug Thompson <dougthompson@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

-EIO is not the only error code that pci_enable_device() may return,
also the set of errors can be enhanced in future. We should compare
return code with zero, not with concrete error value.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/edac/i5000_edac.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index 996c1bd..a5cefab 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -1482,7 +1482,7 @@ static int __devinit i5000_init_one(struct pci_dev *pdev,
 
 	/* wake up device */
 	rc = pci_enable_device(pdev);
-	if (rc == -EIO)
+	if (rc)
 		return rc;
 
 	/* now probe and enable the device */
-- 
1.7.0.4


------------------------------------------------------------------------------
This SF.net email is sponsored by Sprint
What will you do first with EVO, the first 4G phone?
Visit sprint.com/first -- http://p.sf.net/sfu/sprint-com-first
