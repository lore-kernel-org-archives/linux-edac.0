Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03CA32AADE;
	Fri, 17 Apr 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426640; cv=none; b=oFoYxoWqvebDsssRk7YRCJJIinAHDU1KNJ/c2W862RO9JoEiIo/D+ItgitVsXcXNs5T8P8keImXjVNXvwDJbKfW9BI1abMrUs/MB0Xle5PQ7TOFxiHrzN0AaRGDAblOfttn/ilZfRhlf/W2yjlpAN5/q17NjHaQlDjw0ySunCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426640; c=relaxed/simple;
	bh=+tPmb0dtq8uKXzGCAool0c8BG8oXz996aXuO8gP1mlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOxh5MiW4sl4+gB4pOAgG/HZd2blP91WuT47RiQszLMZ8EteaV5p7hsKfvwEVrx0O5FwcSf2BCmP+X1GC82cU+6c3JybCIKglXiENDaFq9LHJ2famABz3E93R9WoLKPzkJ9Ec2FrJ63vtybdFpS2OQBak5W48xeDjsPO8hmPVIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YGnvDLJY; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YGnvDLJY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2A6AF40E00C2;
	Fri, 17 Apr 2026 11:50:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id POULon0gcONB; Fri, 17 Apr 2026 11:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776426621; bh=A6G7+VV9+9TEjKF6lPyXDZUbFqZpfiDqMxe26H1bFYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YGnvDLJYdgei1QHaEzM7MO5wlsNO3VKkOqaTyN8b9DN5b9TTuD1vLc+FFSgrsUlTV
	 fyray+ZRODYdc3pk0qp+lodAZ61o3BUPzrD7+WqUwkbkjHHK9p6bz+rOHCbRDTAl8Z
	 iez31pHa3H9muRZ7w6W/TNI+gIvOP1QwYAnPcfrR1sASeFJkh3r5EdPcCaT1lDreCR
	 TQG0SAQr4KKPDGUdmmzsBFsXOHXLE7xe2gVAz/np5+r1CM+24l9TIV39p540lepSps
	 1nXPF0CqDcPE02GVWwaCXzVnIFEAee9vEIu75we1FNd+K4yJqN2sChofCR2WZRxoxV
	 EN0Xf9d34hgIRWUWGtOw+4cNoTxU8TGeEaAnLkriUStzUhUItdOcLg7qhExOlLolbd
	 6l4N9ZzA8juHKHL2awMah9u2OMwFDzKoptYTlRucw99DBI2cee6N5SJzQTAfwqjvEV
	 d5qYWDfxhU7w67MdPsEqUKOdpSxqlclf2yFxVDmn0H9RO6JN+w8BPyiVsX5tz4D92X
	 3aaprbn5bjD+hv3x7fAu9/3Xpn7B6Tmn4ft4uU4I9NrTA+THlKYhOBRiG5VJ/My88G
	 o+ATejbdFf4tYkP2+LnFPeWFz3vWjjUu6OcErLAc6KWxMhwLCiabqOcwUe9v1iUIcr
	 DJePLyqPmlOswdayNwEy0u5w=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 62A5240E00BF;
	Fri, 17 Apr 2026 11:50:08 +0000 (UTC)
Date: Fri, 17 Apr 2026 13:50:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>,
	"Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>
Cc: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260417115001.GCaeIeaU8eS_EMNq6G@fat_crate.local>
References: <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
 <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
 <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260415200203.GBad_uu1gC_V_LFH0u@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415200203.GBad_uu1gC_V_LFH0u@fat_crate.local>

On Wed, Apr 15, 2026 at 10:02:03PM +0200, Borislav Petkov wrote:
> Lemme think about how to restructure this patch of mine...

Ok, totally untested. This is only to show the idea. I've basically went and
distributed the functionality where it fits best: the pr_info logging at
mce_log time and the work trigger in the notifier. It ended up like below.

I'll run it but I'd let you folks check it first, whether I've missed an angle
conceptually.

Thx.

---
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 8dd424ac5de8..f3a793e3a6c8 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -90,7 +90,6 @@ struct mca_config mca_cfg __read_mostly = {
 };
 
 static DEFINE_PER_CPU(struct mce_hw_err, hw_errs_seen);
-static unsigned long mce_need_notify;
 
 /*
  * MCA banks polled by the period polling timer for corrected events.
@@ -152,8 +151,10 @@ EXPORT_PER_CPU_SYMBOL_GPL(injectm);
 
 void mce_log(struct mce_hw_err *err)
 {
-	if (mce_gen_pool_add(err))
+	if (mce_gen_pool_add(err)) {
+		pr_info(HW_ERR "Machine check events logged\n");
 		irq_work_queue(&mce_irq_work);
+	}
 }
 EXPORT_SYMBOL_GPL(mce_log);
 
@@ -585,28 +586,6 @@ bool mce_is_correctable(struct mce *m)
 }
 EXPORT_SYMBOL_GPL(mce_is_correctable);
 
-/*
- * Notify the user(s) about new machine check events.
- * Can be called from interrupt context, but not from machine check/NMI
- * context.
- */
-static bool mce_notify_irq(void)
-{
-	/* Not more than two messages every minute */
-	static DEFINE_RATELIMIT_STATE(ratelimit, 60*HZ, 2);
-
-	if (test_and_clear_bit(0, &mce_need_notify)) {
-		mce_work_trigger();
-
-		if (__ratelimit(&ratelimit))
-			pr_info(HW_ERR "Machine check events logged\n");
-
-		return true;
-	}
-
-	return false;
-}
-
 static int mce_early_notifier(struct notifier_block *nb, unsigned long val,
 			      void *data)
 {
@@ -618,9 +597,7 @@ static int mce_early_notifier(struct notifier_block *nb, unsigned long val,
 	/* Emit the trace record: */
 	trace_mce_record(err);
 
-	set_bit(0, &mce_need_notify);
-
-	mce_notify_irq();
+	mce_work_trigger();
 
 	return NOTIFY_DONE;
 }
@@ -1804,7 +1781,7 @@ static void mce_timer_fn(struct timer_list *t)
 	 * Alert userspace if needed. If we logged an MCE, reduce the polling
 	 * interval, otherwise increase the polling interval.
 	 */
-	if (mce_notify_irq())
+	if (!mce_gen_pool_empty())
 		iv = max(iv / 2, (unsigned long) HZ/100);
 	else
 		iv = min(iv * 2, round_jiffies_relative(check_interval * HZ));

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
