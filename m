Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD2F19E7F7;
	Thu, 23 Apr 2026 12:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948620; cv=none; b=iVRR8Wka4hnluiCQegGxbRTGKh6jd5sjdcD6b1iKE4cTjVURU6WmGWO/VHifLoC4lFsFF3v4rfWxQ5HSxJOVkuidIQAjWQV2aNMeZhQMAirl8RcM13BP77iqiW8xUfysCUEvcm/9cK4GBp8zS/M8pwjMhEhqbS2ciFkQErPYxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948620; c=relaxed/simple;
	bh=r9w83KNh3AQFB1bKdm7FxFcF2yqR++4b9FeeGSNIRkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOcQRAM7D2HyxvpPcX2oLLHqWJffJkofvvAcRE/C+nZYRaQhi6zyuAgzrDn2WFETM7H8cpnWcALnX/n+u2UYAQVrBo5YQmqyHOF2HJhLLzpSu5juJVcTlSXiP1WiT4BupBsNeEvcg3rnzKWfcWgazbzC0PbEM4RxI7U3xaBKY14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OAcAUJo5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OAcAUJo5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B894B40E00C4;
	Thu, 23 Apr 2026 12:50:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FX81PvxiceCE; Thu, 23 Apr 2026 12:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776948604; bh=0YrNM0okvohDVdEuW6CeELIQ6dFysSAYzg1dIUZ0s/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAcAUJo5PuZ3fJdYWvEIhFWCUGxcXoWsZmhZZ1bGlHVBAyKP+zpKU+xtkQNYtLhtf
	 BRlSfnjVb0lsDxyXIsYhwpdH64OHcx+tkozILIR5EjJbCq5pEGiPNjAD/ub9hNxUr4
	 Z6PpuXHP1n1NYteZsva+i95Z7iAGDOKzKFU93btmIcvIEO0mjuk0ZjM5uoqtV8y/Rg
	 mjRSNI550F6hmM+ATSAmu2EFRdbZk4ubzqlJw0jDOcE64XK4C0kVuGyr260vTOgq9i
	 SLOrUQbuMjPa/5IJ78v3BknEmn1fS3wIvqj2nlKbHAyTa86yD7t9dsK3E14aiE4T3k
	 Qz/E+aMfyeP2JrGQhvnBBGt22bjjRriwXMFZ5osZE6uvtA9wWiyPqtL/C0LfzZVTFD
	 SetX40+dqhacSiTY+gzLjZKysWScGfsfJQqPiy5ARjEm9cbneXor4rjQrm0ho/SWK0
	 OWmVKUf/WtL1HOODwPeWHoQLU9tBLnULy4P4rVTxaxAmY7sFtS5fz4n+m9fEYlUFNB
	 emythTUOA7SEaI07IjGhnN5rdgl05UMAQH1feZWturTDmdHL5Z+bizGDWIFKlkdp6j
	 NUGattbTkLj2jGlTt3KQ57Pz+Z3DZnoecKDHxVmGcvJAgJJb+ujYpEYSSfosAWCOdh
	 va6JKRWsVJfBmv3ZTnzQguf0=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 977E840E00BA;
	Thu, 23 Apr 2026 12:49:51 +0000 (UTC)
Date: Thu, 23 Apr 2026 14:49:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260423124945.GAaeoVacCrmWjZ6AcZ@fat_crate.local>
References: <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
 <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
 <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260415200203.GBad_uu1gC_V_LFH0u@fat_crate.local>
 <20260417115001.GCaeIeaU8eS_EMNq6G@fat_crate.local>
 <CY8PR11MB71343373617F535A8EC5A2C0892F2@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260421120516.GDaedn_OTOE2Agrl59@fat_crate.local>
 <CY8PR11MB7134949131A571C48A6A5C3E892C2@CY8PR11MB7134.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CY8PR11MB7134949131A571C48A6A5C3E892C2@CY8PR11MB7134.namprd11.prod.outlook.com>

On Tue, Apr 21, 2026 at 03:49:06PM +0000, Zhuo, Qiuxu wrote:
> Yes, I think so. 
> 
> So, to me, the current rough and simple method for catching frequent error cases is a good
> trade-off between accuracy and complexity.
> 
>   Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com> 
>   Tested-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com> 

Thanks!

I have this now - I will hammer on it some more before I queue it.

---
Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Mon Mar 16 16:12:00 2026 +0100

    x86/mce: Restore MCA polling interval halving
    
    RongQing reported that the MCA polling interval doesn't halve when an
    error gets logged. It was traced down to the commit in Fixes:, because:
    
      mce_timer_fn()
      |-> mce_poll_banks()
      |-> machine_check_poll()
      |-> mce_log()
    
    which will queue the work and return.
    
    Now, back in mce_timer_fn():
    
            /*
             * Alert userspace if needed. If we logged an MCE, reduce the polling
             * interval, otherwise increase the polling interval.
             */
            if (mce_notify_irq())
    
    <--- here we haven't ran the notifier chain yet so mce_need_notify is
    not set yet so this won't hit and we won't halve the interval iv.
    
    Now the notifier chain runs. mce_early_notifier() sets the bit, does
    mce_notify_irq(), that clears the bit and then the notifier chain
    a little later logs the error.
    
    So this is a silly timing issue.
    
    But, that's all unnecessary.
    
    All it needs to happen here is, the "should we notify of a logged MCE"
    mce_notify_irq() asks, should be simply a question to the mce gen pool:
    "Are you empty?"
    
    And that then turns into a simple yes or no answer and it all
    JustWorks(tm).
    
    So do that and also distribute the functionality where it belongs:
     - Print that MCE events have been logged in mce_log()
     - Trigger the mcelog tool specific work in the first notifier
    
    As a result, mce_notify_irq() can go now.
    
    Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
    Reported-by: Li RongQing <lirongqing@baidu.com>
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
    Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
    Tested-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
    Link: https://lore.kernel.org/r/20260112082747.2842-1-lirongqing@baidu.com

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
