Return-Path: <SRS0=vHQJ=UH=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E1AC28CC5
	for <linux-edac@archiver.kernel.org>; Sat,  8 Jun 2019 15:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 150022146E
	for <linux-edac@archiver.kernel.org>; Sat,  8 Jun 2019 15:28:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="tEvBOCMW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfFHP2b (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Sat, 8 Jun 2019 11:28:31 -0400
Received: from terminus.zytor.com ([198.137.202.136]:50071 "EHLO
        terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbfFHP2b (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Sat, 8 Jun 2019 11:28:31 -0400
Received: from terminus.zytor.com (localhost [127.0.0.1])
        by terminus.zytor.com (8.15.2/8.15.2) with ESMTPS id x58FSFKJ3028605
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 8 Jun 2019 08:28:15 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 terminus.zytor.com x58FSFKJ3028605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
        s=2019051801; t=1560007696;
        bh=c9Lj03tdATnTc0fKIKCyjddlW6NedJjqHOO2I4x8uWk=;
        h=Date:From:Cc:Reply-To:To:Subject:From;
        b=tEvBOCMWE5qFqQmF6CPjQZMi1UiUWA5WzP+hBkgptc8AoFCUvc2E4z7cc4RpvaAtC
         R2G4vV/RUbuEL+D2z5eyNZcAaVN+suuGkrB9MVFePAZwKifhdNwAU2fAo5rlMHMX5E
         C9kAg0fEo8xlsEYa98M9K3T85w3xyveiHLkf0b2QWmjPCqiuI5APjQcCpMyDRmTDA+
         WAO66wsfpqDgB0y/EFuQk9HeiSpENQI93rvMsAWQi02PGGcIz0y0dbEgWxO72zeMKE
         B5zqI6BouTHNjFs5gSPX0BnOa0SwgdVyDg19/+zjpViDH1nVyCBYJV7P3qt6C/Dcpk
         3m2lyDSVJmJEw==
Received: (from tipbot@localhost)
        by terminus.zytor.com (8.15.2/8.15.2/Submit) id x58FSEai3028600;
        Sat, 8 Jun 2019 08:28:14 -0700
Date:   Sat, 8 Jun 2019 08:28:14 -0700
X-Authentication-Warning: terminus.zytor.com: tipbot set sender to tipbot@zytor.com using -f
From:   tip-bot for Borislav Petkov <tipbot@zytor.com>
Message-ID: <tip-f3c74b38a55aefe1004200d15a83f109b510068c@git.kernel.org>
Cc:     linux-edac@vger.kernel.org, tglx@linutronix.de,
        xiyou.wangcong@gmail.com, bp@suse.de, mingo@kernel.org,
        hpa@zytor.com, stable@vger.kernel.org, tony.luck@intel.com
Reply-To: linux-edac@vger.kernel.org, bp@suse.de, tglx@linutronix.de,
          xiyou.wangcong@gmail.com, mingo@kernel.org, hpa@zytor.com,
          stable@vger.kernel.org, linux-kernel@vger.kernel.org,
          tony.luck@intel.com
To:     linux-tip-commits@vger.kernel.org
Subject: [tip:ras/urgent] RAS/CEC: Fix binary search function
Git-Commit-ID: f3c74b38a55aefe1004200d15a83f109b510068c
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot.git.kernel.org>
Robot-Unsubscribe: Contact <mailto:hpa@kernel.org> to get blacklisted from
 these emails
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

Commit-ID:  f3c74b38a55aefe1004200d15a83f109b510068c
Gitweb:     https://git.kernel.org/tip/f3c74b38a55aefe1004200d15a83f109b510068c
Author:     Borislav Petkov <bp@suse.de>
AuthorDate: Sat, 20 Apr 2019 13:27:51 +0200
Committer:  Borislav Petkov <bp@suse.de>
CommitDate: Fri, 7 Jun 2019 23:18:26 +0200

RAS/CEC: Fix binary search function

Switch to using Donald Knuth's binary search algorithm (The Art of
Computer Programming, vol. 3, section 6.2.1). This should've been done
from the very beginning but the author must've been smoking something
very potent at the time.

The problem with the current one was that it would return the wrong
element index in certain situations:

  https://lkml.kernel.org/r/CAM_iQpVd02zkVJ846cj-Fg1yUNuz6tY5q1Vpj4LrXmE06dPYYg@mail.gmail.com

and the noodling code after the loop was fishy at best.

So switch to using Knuth's binary search. The final result is much
cleaner and straightforward.

Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Tony Luck <tony.luck@intel.com>
Cc: linux-edac <linux-edac@vger.kernel.org>
Cc: <stable@vger.kernel.org>
---
 drivers/ras/cec.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 88e4f3ff0cb8..dbfe3e61d2c2 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -183,32 +183,38 @@ static void cec_timer_fn(struct timer_list *unused)
  */
 static int __find_elem(struct ce_array *ca, u64 pfn, unsigned int *to)
 {
+	int min = 0, max = ca->n - 1;
 	u64 this_pfn;
-	int min = 0, max = ca->n;
 
-	while (min < max) {
-		int tmp = (max + min) >> 1;
+	while (min <= max) {
+		int i = (min + max) >> 1;
 
-		this_pfn = PFN(ca->array[tmp]);
+		this_pfn = PFN(ca->array[i]);
 
 		if (this_pfn < pfn)
-			min = tmp + 1;
+			min = i + 1;
 		else if (this_pfn > pfn)
-			max = tmp;
-		else {
-			min = tmp;
-			break;
+			max = i - 1;
+		else if (this_pfn == pfn) {
+			if (to)
+				*to = i;
+
+			return i;
 		}
 	}
 
+	/*
+	 * When the loop terminates without finding @pfn, min has the index of
+	 * the element slot where the new @pfn should be inserted. The loop
+	 * terminates when min > max, which means the min index points to the
+	 * bigger element while the max index to the smaller element, in-between
+	 * which the new @pfn belongs to.
+	 *
+	 * For more details, see exercise 1, Section 6.2.1 in TAOCP, vol. 3.
+	 */
 	if (to)
 		*to = min;
 
-	this_pfn = PFN(ca->array[min]);
-
-	if (this_pfn == pfn)
-		return min;
-
 	return -ENOKEY;
 }
 
