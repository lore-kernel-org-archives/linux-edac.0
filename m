From: Cong Wang <amwang@redhat.com>
Subject: [PATCH 13/62] edac: remove the second argument of k[un]map_atomic()
Date: Sun, 27 Nov 2011 13:26:53 +0800
Message-ID: <1322371662-26166-14-git-send-email-amwang@redhat.com>
References: <1322371662-26166-1-git-send-email-amwang@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1322371662-26166-1-git-send-email-amwang@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, Cong Wang <amwang@redhat.com>, Doug Thompson <dougthompson@xmission.com>, bluesmoke-devel@lists.sourceforge.net
List-Id: edac.vger.kernel.org


Signed-off-by: Cong Wang <amwang@redhat.com>
---
 drivers/edac/edac_mc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index d69144a..08dff48 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -621,13 +621,13 @@ static void edac_mc_scrub_block(unsigned long page, unsigned long offset,
 	if (PageHighMem(pg))
 		local_irq_save(flags);
 
-	virt_addr = kmap_atomic(pg, KM_BOUNCE_READ);
+	virt_addr = kmap_atomic(pg);
 
 	/* Perform architecture specific atomic scrub operation */
 	atomic_scrub(virt_addr + offset, size);
 
 	/* Unmap and complete */
-	kunmap_atomic(virt_addr, KM_BOUNCE_READ);
+	kunmap_atomic(virt_addr);
 
 	if (PageHighMem(pg))
 		local_irq_restore(flags);
-- 
1.7.4.4
