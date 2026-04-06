Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9083932FF;
	Mon,  6 Apr 2026 22:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775515783; cv=none; b=eaC+9FGVv7FyySgNct45+M3toy94m7iubXggfEHFv8MqpS9mpbJclEBxG5jrnt2OH32+iVlzRG+k2utCy2H8E85q4w4hNBqx1s3TsAjhQEcGxrCi8qEaVrWey9XBFlh9RMGH1qfLdWLpOdAuVz1poO1P9xofLmWUw1XknY4U4CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775515783; c=relaxed/simple;
	bh=XuMEsKc3iXtk2XE7thl4ropCAzWgO0S/tpgRcS2cZZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLoRNdZsBm5GOmM+kXZxo1nAWSQfhhUTfWZcqDxt+IrE1F7mbHfjIYfEXNNsMcNCWFp7EO7sy6+0aghcueJUQCcOnm70rE+Yqy/s0QgPiiW9JFGKsCQ0F+ASeLBDQFpoS9vYgUXKmXaVxcvRHpTVqaxg4ta6JMaUaJzTKxLwiPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=caBvKlLV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="caBvKlLV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CE35E40E015B;
	Mon,  6 Apr 2026 22:49:38 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IAtttYKce_6E; Mon,  6 Apr 2026 22:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1775515774; bh=iATATMcDqkXJZ/0n2nmc3UCJ5A0/C3BDpfWx6O1Bu7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=caBvKlLV1HMjsjugFEQoMJlTheLGykQlFCIIyZOwl3Sc4dhcxJJHCbNgpVnyuaAPE
	 GjyaNk35oIzDQNSFkn9CzKcaz5m2IlalEzHV5TSPz0SsCYVodoUAwT57bXrM4l+Z2h
	 2o7+Nml7rUJ9y9MGnstfdimrP8PEYIvQ61wSfqpo6Nanonxq2u3D0+0sFq8PfiKjnC
	 s7yIYBqLralq16jm0IKrOAwjfAcdTIgnDff9o/Fca7UC3vtRgcRgy+Xun7qvvBiUgt
	 05NVtt+L29yNWrrspLoy/Jay4okzj/hObkgjxR0QErQpItF0+muPlxsc76/GsnPi+d
	 5WI0YBjJL8OcQSTAPBZe+VAyMDWUJ30ROMIRSZacxy6pcyNmezH/l+6cYojNmUGSsZ
	 83yZYNHlzYaDazbQHn080g6WCCxF61ZBjPqEjTtZ8jsb/ZJagi9coTaerc4eYAorft
	 lfYrxRC5QX5EO4XwSImsQCnlRDO5+/ML4tZl1Qlw7qvy4oqwIBqkh+Lsq9JsSB5fKb
	 driNsqTYUonlCXx/8Dcz7LIEeatJQk1R3ll2Yr+qLn3QtU0cSFBWAnYR8jf7mXgu/X
	 OJfdZstzILqf+8Txr2Lt3BQRIZ4QDH5JAk6nr/J48PMm4va/4d8O/mXbp3ZKuQvl6T
	 XkqPlgXCvsbBnqx/1p+R8J6U=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 9A56140E00DC;
	Mon,  6 Apr 2026 22:49:21 +0000 (UTC)
Date: Tue, 7 Apr 2026 00:49:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
References: <20260114135034.GAaWefKm97-CkbEp4P@fat_crate.local>
 <20260207115142.GBaYcnTp7maUDVv3Nc@fat_crate.local>
 <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>

Ok,

finally. :-\

Pls run it to make sure it DTRT for you too.

Thx.

---
From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Mon, 16 Mar 2026 16:12:00 +0100
Subject: [PATCH] x86/mce: Restore MCA polling interval halving

RongQing reported that the MCA polling interval doesn't halve when an
error gets logged. It was traced down to the commit in Fixes: because:

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

So do that.

Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
Reported-by: Li RongQing <lirongqing@baidu.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/r/20260112082747.2842-1-lirongqing@baidu.com
---
 arch/x86/kernel/cpu/mce/core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 8dd424ac5de8..d18db7d8d237 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -90,7 +90,6 @@ struct mca_config mca_cfg __read_mostly = {
 };
 
 static DEFINE_PER_CPU(struct mce_hw_err, hw_errs_seen);
-static unsigned long mce_need_notify;
 
 /*
  * MCA banks polled by the period polling timer for corrected events.
@@ -595,7 +594,7 @@ static bool mce_notify_irq(void)
 	/* Not more than two messages every minute */
 	static DEFINE_RATELIMIT_STATE(ratelimit, 60*HZ, 2);
 
-	if (test_and_clear_bit(0, &mce_need_notify)) {
+	if (!mce_gen_pool_empty()) {
 		mce_work_trigger();
 
 		if (__ratelimit(&ratelimit))
@@ -618,10 +617,6 @@ static int mce_early_notifier(struct notifier_block *nb, unsigned long val,
 	/* Emit the trace record: */
 	trace_mce_record(err);
 
-	set_bit(0, &mce_need_notify);
-
-	mce_notify_irq();
-
 	return NOTIFY_DONE;
 }
 
-- 
2.51.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
