From: Peter Tyser <ptyser@xes-inc.com>
Subject: [PATCH 2/4] edac: Fix mpc85xx page calculation
Date: Thu, 19 Nov 2009 18:42:27 -0600
Message-ID: <1258677749-15968-2-git-send-email-ptyser@xes-inc.com>
References: <1258677749-15968-1-git-send-email-ptyser@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <1258677749-15968-1-git-send-email-ptyser@xes-inc.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
To: bluesmoke-devel@lists.sourceforge.net
Cc: Peter Tyser <ptyser@xes-inc.com>, linuxppc-dev@ozlabs.org, djiang@mvista.com
List-Id: edac.vger.kernel.org

Commit b4846251727a38a7f248e41308c060995371dd05 accidentally broke how a
chip select's first and last page addresses are calculated.  The page
addresses are being shifted too far right by PAGE_SHIFT.  This results
in errors such as:

  EDAC MPC85xx MC1: Err addr: 0x003075c0
  EDAC MPC85xx MC1: PFN: 0x00000307
  EDAC MPC85xx MC1: PFN out of range!
  EDAC MC1: INTERNAL ERROR: row out of range (4 >= 4)
  EDAC MC1: CE - no information available: INTERNAL ERROR

The vale of PAGE_SHIFT is already being taken into consideration during
the calculation of the 'start' and 'end' variables, thus it is not
necessary to account for it again when setting a chip select's first and
last page address.

Signed-off-by: Peter Tyser <ptyser@xes-inc.com>
---
 drivers/edac/mpc85xx_edac.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/mpc85xx_edac.c b/drivers/edac/mpc85xx_edac.c
index 28d3211..ecd5928 100644
--- a/drivers/edac/mpc85xx_edac.c
+++ b/drivers/edac/mpc85xx_edac.c
@@ -804,8 +804,8 @@ static void __devinit mpc85xx_init_csrows(struct mem_ctl_info *mci)
 		end   <<= (24 - PAGE_SHIFT);
 		end    |= (1 << (24 - PAGE_SHIFT)) - 1;
 
-		csrow->first_page = start >> PAGE_SHIFT;
-		csrow->last_page = end >> PAGE_SHIFT;
+		csrow->first_page = start;
+		csrow->last_page = end;
 		csrow->nr_pages = end + 1 - start;
 		csrow->grain = 8;
 		csrow->mtype = mtype;
-- 
1.6.2.1
