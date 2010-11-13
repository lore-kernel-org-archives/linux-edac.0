From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] edac: use BIT_64() to eliminate warnings
Date: Sat, 13 Nov 2010 08:44:26 -0800
Message-ID: <20101113084426.b26f1d88.randy.dunlap@oracle.com>
References: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: Doug, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Building for X86_32 produces shift count warnings, so use
BIT_64() to eliminate the warnings.

drivers/edac/mce_amd.c:778: warning: left shift count >= width of type
drivers/edac/mce_amd.c:778: warning: left shift count >= width of type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Doug Thompson <dougthompson@xmission.com>
Cc: Borislav Petkov <borislav.petkov@amd.com>
Cc: bluesmoke-devel@lists.sourceforge.net
---
 drivers/edac/mce_amd.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20101112.orig/drivers/edac/mce_amd.c
+++ linux-next-20101112/drivers/edac/mce_amd.c
@@ -776,8 +776,8 @@ int amd_decode_mce(struct notifier_block
 
 	if (c->x86 == 0x15)
 		pr_cont("|%s|%s",
-			((m->status & BIT(44))	? "Deferred" : "-"),
-			((m->status & BIT(43))	? "Poison"   : "-"));
+			((m->status & BIT_64(44)) ? "Deferred" : "-"),
+			((m->status & BIT_64(43)) ? "Poison"   : "-"));
 
 	/* do the two bits[14:13] together */
 	ecc = (m->status >> 45) & 0x3;

------------------------------------------------------------------------------
Centralized Desktop Delivery: Dell and VMware Reference Architecture
Simplifying enterprise desktop deployment and management using
Dell EqualLogic storage and VMware View: A highly scalable, end-to-end
client virtualization framework. Read more!
http://p.sf.net/sfu/dell-eql-dev2dev
