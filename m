Return-Path: <linux-edac-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95361C54EBE
	for <linux-edac@archiver.kernel.org>; Mon, 16 Jan 2023 20:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjAPUJo (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Mon, 16 Jan 2023 15:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjAPUJo (ORCPT
        <rfc822;linux-edac@vger.kernel.org>); Mon, 16 Jan 2023 15:09:44 -0500
X-Greylist: delayed 479 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 16 Jan 2023 12:09:42 PST
Received: from lobo.ruivo.org (lobo.ruivo.org [173.14.175.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB656EE
        for <linux-edac@vger.kernel.org>; Mon, 16 Jan 2023 12:09:42 -0800 (PST)
Received: by lobo.ruivo.org (Postfix, from userid 1011)
        id C235052D81; Mon, 16 Jan 2023 15:01:41 -0500 (EST)
Received: from jake.ruivo.org (bob.qemu.ruivo [192.168.72.19])
        by lobo.ruivo.org (Postfix) with ESMTPA id 1F65A52993;
        Mon, 16 Jan 2023 15:01:24 -0500 (EST)
Received: by jake.ruivo.org (Postfix, from userid 1000)
        id 7AA0E22003B; Mon, 16 Jan 2023 15:01:23 -0500 (EST)
Date:   Mon, 16 Jan 2023 15:01:23 -0500
From:   Aristeu Rozanski <aris@ruivo.org>
To:     Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc:     linux-edac@vger.kernel.org, aris@redhat.com
Subject: [RFC PATCH] mce: prevent concurrent polling of MCE events
Message-ID: <Y8WtE7BNJ0gTrqIS@cathedrallabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org

I've considered creating an array so there'd be one lock per package but
that'd add excessive complexity for something that happens by default every
5 minutes. Thoughts?

---------

Error injection in modern HP machines with CMCI disabled will cause the
injected MCE to be found only by polling. Because these newer machines have a
big number of CPUs per package, it makes a lot more likely for multiple
CPUs polling IMC registers (that are shared in the same package) at same time,
causing multiple reports of the same MCE.

Signed-off-by: Aristeu Rozanski <aris@ruivo.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org

--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1597,6 +1597,7 @@ static unsigned long check_interval = INITIAL_CHECK_INTERVAL;
 
 static DEFINE_PER_CPU(unsigned long, mce_next_interval); /* in jiffies */
 static DEFINE_PER_CPU(struct timer_list, mce_timer);
+static DEFINE_RAW_SPINLOCK(timer_fn_lock);
 
 static unsigned long mce_adjust_timer_default(unsigned long interval)
 {
@@ -1628,7 +1629,9 @@ static void mce_timer_fn(struct timer_list *t)
 	iv = __this_cpu_read(mce_next_interval);
 
 	if (mce_available(this_cpu_ptr(&cpu_info))) {
+		raw_spin_lock(&timer_fn_lock);
 		machine_check_poll(0, this_cpu_ptr(&mce_poll_banks));
+		raw_spin_unlock(&timer_fn_lock);
 
 		if (mce_intel_cmci_poll()) {
 			iv = mce_adjust_timer(iv);
