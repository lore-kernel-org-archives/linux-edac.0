From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: [PATCH 3/3] i7core_edac: Better parse "any" addrmask
Date: Sun, 4 Oct 2009 16:43:42 -0300
Message-ID: <20091004164342.32965b3c@pedra.chehab.org>
References: <20090924192821.7fcffc80@pedra.chehab.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <bluesmoke-devel-bounces@lists.sourceforge.net>
In-Reply-To: <20090924192821.7fcffc80@pedra.chehab.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=bluesmoke-devel>
List-Post: <mailto:bluesmoke-devel@lists.sourceforge.net>
List-Help: <mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/bluesmoke-devel>,
	<mailto:bluesmoke-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: bluesmoke-devel-bounces@lists.sourceforge.net
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Ingo Molnar <mingo@elte.hu>, bluesmoke-devel@lists.sourceforge.net, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
List-Id: edac.vger.kernel.org

>From ddc7940d3a68483e750e286bfe78d52bdf9231d1 Mon Sep 17 00:00:00 2001
From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Sun, 4 Oct 2009 11:54:56 -0300
Subject: [PATCH] i7core_edac: Better parse "any" addrmask

Instead of accepting just "any", accept also "any\n"

Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
---
 drivers/edac/i7core_edac.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 94aeca0..477b62a 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -800,7 +800,7 @@ static ssize_t i7core_inject_store_##param(			\
 	if (pvt->inject.enable)					\
 		disable_inject(mci);				\
 								\
-	if (!strcasecmp(data, "any"))				\
+	if (!strcasecmp(data, "any") || !strcasecmp(data, "any\n"))\
 		value = -1;					\
 	else {							\
 		rc = strict_strtoul(data, 10, &value);		

-- 

Cheers,
Mauro

------------------------------------------------------------------------------
Come build with us! The BlackBerry&reg; Developer Conference in SF, CA
is the only developer event you need to attend this year. Jumpstart your
developing skills, take BlackBerry mobile applications to market and stay 
ahead of the curve. Join us from November 9&#45;12, 2009. Register now&#33;
http://p.sf.net/sfu/devconf
