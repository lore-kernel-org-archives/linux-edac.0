Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C993DABE3;
	Fri, 21 Aug 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307872; cv=none; b=Eh08uvEzdEz3gz5WDhOgfStokZiQMpMBwd4hJK/44DF0t1TxnJn6RdFO2ZvXf3gqHsHAq911LK64lOgZg/vdw73A7ODA1czEFix06pAS0u/8Bf7c+aIHgUjBx3/BFfVUrLgIMWRgnjE6haZcwxCxwX9HI5QUpr+cQhvDBgKjFQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307872; c=relaxed/simple;
	bh=gc0aPv8jRNrLG2l2U/ppz2zQ2v8zFd3jRszGDWu+atQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCLPBkfrCN5EHcO8GspCpjFXxczylGw74rH+mAtPKnplT5mcfFKxxF4OLZWKbL01r9A0fxT6iQoDuj4KxZIPufAgdYHWqHhbxwUx/+zyKhxfgxv64/FR3caoMhtLFp2l6kgzM1rIMIkTpUteSZHiWddqdug+RUoHaES1hzIPvsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=fBCypKmI; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="fBCypKmI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=6Hho0TITdQeYLfNeIBNU2j2g48FSD7UnHlK0l1sFoug=; b=fBCypKmIjZd42fyeJhdVyIosxB
	pVwkDKR+i4VPptyCpuPS5gURXkfyiQLMgkSS4xoW+Sw6NK4zNUFNugFAcVwIa4Hw/qgR+uqu/HsWy
	Z+cj5f4epC7xjVsZh/i/f+tJrdMIT2dluOyOk/3KNpu2HTdWzHXLd28qTkMfuxfzFaKO66Sc2n698
	HDa4D+UIp40CF4c++RcS7GYHOX8Z0sjy7xG50BJ8E1MsJasvs+B1c1HSBxR1eLEuVZc9glFe46Y2C
	w8I3NN4GjBVEZ4y9Lytpn0rkAGP7z4HyyY3Dma3gIZlGVAmSzWf717o+QJMy8eoHWq2Xloi07iKFD
	cWVvzgjg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wxMQ7-00BH2x-1m;
	Fri, 21 Aug 2026 10:24:19 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 21 Aug 2026 03:24:07 -0700
Subject: [PATCH 1/2] x86/mce: Rate-limit the CMCI storm transition notices
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-mce-panic-on-storm-v1-1-7a465c708d82@debian.org>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
In-Reply-To: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2317; i=leitao@debian.org;
 h=from:subject:message-id; bh=gc0aPv8jRNrLG2l2U/ppz2zQ2v8zFd3jRszGDWu+atQ=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqiCdLv7yXolgo+J/qJ8JOAfPj75qqpoEYJRxSY
 G905HDSXoaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaognSwAKCRA1o5Of/Hh3
 bbjhD/9s3YSGAhCMTBeXhV6w6f2EN1EnkJKs+1/Q2gfqrGmbqLuZ9z2JZVNcG5WTKj3tb9Aq7j1
 G1BkMApdiRXq/k9ZZD98NSt4df+/hVrsYmbu14xoxK3NirywXd77HzBx1lrT12I5EpTZYRYXQu2
 g9aGHd6zv8fJjyCjUj4/zqNS1wZhYBRwytP4Byfh4n0SyDBymJvOV0bqX2BPk2JYrpTl883DdTV
 E0D7x0K3nnP+lnFkbQ+eWdowyDxB30mtrbHh5fRTB2TPvipewR/DU9/vpCR4A1k8lpfjwnaWCWa
 a+SdA3Efl+OT8hMLYKnY7eYtVnlU1Cnhksvum9wPbCX4Fm+zwBFEO0SvOObmu18oU8WxP2BMDKy
 V+qeODl2bxoi6immx1tm0bYuWxQ740EEGBV2zzbYFyHlNFNkVdVnU6z374Evdi5KK7ytybkGC3q
 VXFBXos5MpI3TXPrRyHP0q4UyRniBLKmQCteDOP8ks5sICbp/rkLs4D/SaYnKH8pkHbnbLDz5eG
 aktKMy995lUzQ5uQxV+zWTbOIIbWeI/QFONIWmUMJHIPRMy9Y8gMyZM5H4ah++EgbqgzSqvstlV
 /Ea7k0v+IfAGthz+2/OW/HPKgACqlHORbQxzpUrwbeA6I4z+az6hz9COxmBFLSTHNQrhN5fxWYj
 Cm9vI8y9NqwAZPg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

mce_track_storm() prints a line every time a bank enters storm mode and
another every time it leaves. Neither is bounded, so the log volume
follows whatever rate the bank flaps at.

One host in our fleet logged 9970726 "CMCI storm detected" and 9970734
"CMCI storm subsided" lines for a single bank over four days, which is
a bit excessive for all monitoring purposes.

Put both transitions behind one ratelimit.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/x86/kernel/cpu/mce/threshold.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd2..8591715ce2430 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -4,6 +4,7 @@
  */
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/ratelimit.h>
 
 #include <asm/irq_vectors.h>
 #include <asm/traps.h>
@@ -111,6 +112,13 @@ void cmci_storm_end(unsigned int bank)
 		mce_timer_kick(false);
 }
 
+/*
+ * Shared by both transitions so that a bank flapping between them cannot
+ * outrun the console.
+ */
+static DEFINE_RATELIMIT_STATE(storm_rs, DEFAULT_RATELIMIT_INTERVAL,
+			      DEFAULT_RATELIMIT_BURST);
+
 void mce_track_storm(struct mce *mce)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
@@ -150,13 +158,17 @@ void mce_track_storm(struct mce *mce)
 	if (storm->banks[mce->bank].in_storm_mode) {
 		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
 			return;
-		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
+		if (__ratelimit(&storm_rs))
+			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n",
+					smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, false);
 		cmci_storm_end(mce->bank);
 	} else {
 		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
 			return;
-		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
+		if (__ratelimit(&storm_rs))
+			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n",
+					smp_processor_id(), mce->bank);
 		mce_handle_storm(mce->bank, true);
 		cmci_storm_begin(mce->bank);
 	}

-- 
2.53.0-Meta

