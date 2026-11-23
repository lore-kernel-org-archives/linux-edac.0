Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795431341;
	b=ukGp4dQzxVBxcFRHp0aYP2u2DJX5oHh/k3ni32RuwTq4BSP2MGJAkjoEHBZqQinSvue6
	 NrqPF8zdnrx5+GphXOBEV5ExDsno7z2H9gLHF459LCB8ETYL9JM0upUKUnSZu80GNEvC+
	 0TRtuSFBw3K3D+eJifmkrOnYmFHroHtnEqJz5obcsTjBlHLDqY46Q6BOSLRzeBWYeswUe
	 UvxggEzxTDrsetAe0o9cWmVQBty8fWhpgrPo+UQNKKRkXG0n7FerdpanBhX7k+vVHhFZ6
	 30vvbKFbg0iIVW2ZQ/CrfC5oGGLJml20bGtUTpzMLhCjniQ/qGSqlg18EH27s0PibkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431341;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OHPurr6k9FoQrxkS/sSnGfsG+S8cHXcbjJO/f1mmfMk=;
	b=Cn4qs3hGVxtz65vuLCobfPXhvYlqOPkuy/qDUNmKfeVshERzUwh58cuHQVreZZorTnf6
	 9E1uIEr5xWAOStOq6vsK7A4IJos8u0kgKwPVY24eR9z1w8reZ8Zaakgwff9U1QFkUpVRE
	 0HtvecE6oLwjw6O4vTZxjsdBc03tR4j5y1Tr70/gLQ1HEhK32kjhsMFpXPoftd7TXNyme
	 fW0ugsFPc0yx8RH9KJ3Oole+c6VsWL7ycA17uF7cudDjJ/e5GK7M64o7R70ECzd0lf8ql
	 j4MjNJAGGeOlR0DoFDS5tqZZwDDzslx2RTPIWTcxV8XX4HSO1lIAF9inKJMOLB17b4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhhKTrwI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C216606A31A;
	Mon, 23 Nov 2026 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhhKTrwI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795431340;
	b=l3nck/fX1QHUqwlynsyQT088QiH99g1NU7vgCAMTCYFDSJqL9lKvo4Yxus5FdlDqvIC+
	 XekX9YlZHFcQmnEVUNUMf7wQUgOEtF3jlNDSs7cR6QUw1kwuEjE+IvVkn4SyspeBKEF7l
	 kQMRh64Ubq30qNNhiDqysiiNgSmNs8gJjY3SIj6YN9wkmtpagjbq8SZiT1dRMISwG9mJL
	 6+bohoFuh/tGkUwPoQ/ka6Qdl66SBkaaOjrbBs+cTmWau+I8PBA4sIQBLuq2s3I3KJ/eV
	 8aQ7lRs9QLB+JLsLzsMM/Me03Zs37CLpslGDaYZLCcuKvb84pMeauGFyKc7aJD5FQiw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795431340;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OHPurr6k9FoQrxkS/sSnGfsG+S8cHXcbjJO/f1mmfMk=;
	b=pNOlBGd6WwlF3EPl0JhIO0aajq53jqPGMFit85WQbRX4LPDXLyURlnMW/F18OolgIywR
	 xqf0FKp5JSzS9l6mlWU8LnKKXfF0GdYb+54oelHAMFGfnAgmRsi4xR/Oyrgl7SyUOHgwC
	 LSlI0byiag5yQY7wUe050F2BFMMcx+Qjs35FQgQzotDIZtair2WkIpjbju603n7JjDFMg
	 ps6WM97ygQWAv4Ln0AciImSuHmyHFIds7lVcwyZbq8W+aZsLcEIJVOMZR6sPo+b61hAEI
	 jQTPaKwaXNPBCjQCCsXlzRssbTa/SYkrPWjVaY6tB7ACviwbfbaBFbPvlspNY6yNfbQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7092D1F000CF;
	Mon, 23 Nov 2026 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431340;
	bh=OHPurr6k9FoQrxkS/sSnGfsG+S8cHXcbjJO/f1mmfMk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=BhhKTrwIz7AILx3MLCgPQ8PXicrbGGrKWZanOmkPNetq3e6QrVmHodDNtkyoy68QW
	 H5tQ8XcCRZNoQNpAh+6H94VJyE17zkoeXE/hGmKSvGVlnR2noeeTXIdwA2tVwG9Saz
	 s62qwFC+zWwXfUuFKm6/TpQxjxYIXgTQljWcA5r0NlAqdxxhuXnk0kMA3s3nVzkc/C
	 ON9VBuxYw7N3ed/ZLDo7SueeNyksx7GaOruRW6Dur3LEpnMMpCcnKnlRgztU8QRPer
	 ik7kqu3BYkhYRYNbz6Drdyh/QLDYQhKDZ8Z65RgP4EmV43U/yrUYPdJ6HBC/5/lwhM
	 g1q9lJSrneQtA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F24CB4C423;
	Mon, 23 Nov 2026 10:55:33 +0000 (UTC)
From: Ahmed Abdelfattah via B4 Relay <devnull+me.ahmedabdelfattah.dev@kernel.org>
Date: Mon, 23 Nov 2026 12:55:29 +0200
Subject: [PATCH v2] EDAC/mc: Convert the poll period to jiffies when it is
 changed
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-edac-mc-poll-msec-jiffies-v2-1-0407cc52556d@ahmedabdelfattah.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0K6dgxTErSuvIdhUdoZKeEvbW00h
 Ltb8AIuX/K+960ikHcUxK1YhafkgpunDPJUCNPp6UngbGYhS1kjogKy2sBoYJmHAcZABnrHnBP
 A7YWVrBlRGpH3iyd276P9aH4cXm1PJu7B3ehciLP/HOcJd++fn4SAwFRJpaor61LddTdmvbU0s
 I5Rd2dLSTTbtn0BMlh3w98AAAA=
X-Change-ID: 20261119-edac-mc-poll-msec-jiffies-fb7f926f112c
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: Qiuxu Zhuo <qzhuo@nvidia.com>, linux-edac@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431333; l=5584;
 i=me@ahmedabdelfattah.dev; s=20261106; h=from:subject:message-id;
 bh=n19gK6o3sRSWNb0gfAuZ8xCRhx7uWKCKrQY4JcoU+gA=;
 b=0HNrLZac5Wok4Ed+BV8WQnGeuQmK9bBXzryHZYf+2dHsC0ouws/cJBZ719etCXuW5BnVk7XzW
 woVv7MJl0ncCEtBPGOjIprNAN3K6kA2LQ6F8oqENhFFuAKBFIzDHcIp
X-Developer-Key: i=me@ahmedabdelfattah.dev; a=ed25519;
 pk=DHEHKU4PddrkJ/iYMZpwyyXsFyIQ6ySjTttKLrt9YqI=
X-Endpoint-Received: by B4 Relay for me@ahmedabdelfattah.dev/20261106 with
 auth_id=1438
X-Original-From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
Reply-To: me@ahmedabdelfattah.dev
Content-Transfer-Encoding: 7bit

From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>

Writing edac_mc_poll_msec at run time re-arms every polled memory
controller through edac_mc_reset_delay_period(), which passes the new
value to edac_mod_work() as it is. mod_delayed_work() takes jiffies, so
the first poll after the write comes that many jiffies later, not that
many milliseconds: at HZ=300, writing 2000 puts the next poll 6.7 s
out. edac_mc_workq_function() re-arms with msecs_to_jiffies(), so only
that first poll is off.

Before commit c4cf3b454eca ("EDAC: Rework workqueue handling") this
path converted the value through edac_mc_workq_setup(), and
edac_device_reset_delay_period() still does. Convert it here as well.

All other callers of edac_mod_work() and edac_queue_work() already pass
jiffies. Name the arguments after the unit they are in: "jiffies" for
the two workqueue helpers, and "msec" for edac_mc_reset_delay_period(),
as edac_device_reset_delay_period() has it.

Fixes: c4cf3b454eca ("EDAC: Rework workqueue handling")
Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
Signed-off-by: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
---
I noticed this while timing ie31200_edac's polls in a KVM guest: the
first poll after a write to edac_mc_poll_msec came late.

Tested on v7.4-rc3+ (4405c18c95d2) at HZ=300, with ie31200_edac bound
to a QEMU model of the Kaby Lake host bridge (a local device model, not
upstream QEMU), timing edac_mc_workq_function() with a kprobe. Without
the patch the first poll came 6.76 s after writing 2000 and 3.51 s after
writing 1000, with the polls after it every 2.13 s and 1.01 s. With the
patch the first poll comes 2.11 s and 1.02 s after the write, in line
with the ones after it. Writes below 1000 are still rejected.
---
Changes in v2:
- Went through the callers of edac_mod_work() and edac_queue_work(). The
  others already pass jiffies: edac_device keeps msecs_to_jiffies(msec)
  in edac_dev->delay, edac_pci and the other edac_mc callers convert at
  the call. So the fix is the same as in v1.
- Renamed the "delay" argument of both helpers to "jiffies" (Borislav).
  The "value" in the v1 hunk is edac_mc_reset_delay_period()'s argument
  and is in milliseconds, so that one is now "msec". As an argument name
  "jiffies" shadows the global one, which only W=2 complains about; I
  can call it something else if you prefer.
- Added Qiuxu's Reviewed-by and retested.
- Link to v1: https://patch.msgid.link/20261119-edac-mc-poll-msec-jiffies-v1-1-fe329938fa09@ahmedabdelfattah.dev
---
 drivers/edac/edac_mc.c     | 6 +++---
 drivers/edac/edac_module.h | 6 +++---
 drivers/edac/wq.c          | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index fd70caa85574..6feb0809a959 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -483,12 +483,12 @@ static void edac_mc_workq_function(struct work_struct *work_req)
 }
 
 /*
- * edac_mc_reset_delay_period(unsigned long value)
+ * edac_mc_reset_delay_period(unsigned long msec)
  *
  *	user space has updated our poll period value, need to
  *	reset our workq delays
  */
-void edac_mc_reset_delay_period(unsigned long value)
+void edac_mc_reset_delay_period(unsigned long msec)
 {
 	struct mem_ctl_info *mci;
 	struct list_head *item;
@@ -499,7 +499,7 @@ void edac_mc_reset_delay_period(unsigned long value)
 		mci = list_entry(item, struct mem_ctl_info, link);
 
 		if (mci->op_state == OP_RUNNING_POLL)
-			edac_mod_work(&mci->work, value);
+			edac_mod_work(&mci->work, msecs_to_jiffies(msec));
 	}
 	mutex_unlock(&mem_ctls_mutex);
 }
diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index eceef5539186..762a331a5708 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -48,12 +48,12 @@ extern void edac_device_remove_sysfs(struct edac_device_ctl_info *edac_dev);
 /* edac core workqueue: single CPU mode */
 int edac_workqueue_setup(void);
 void edac_workqueue_teardown(void);
-bool edac_queue_work(struct delayed_work *work, unsigned long delay);
+bool edac_queue_work(struct delayed_work *work, unsigned long jiffies);
 bool edac_stop_work(struct delayed_work *work);
-bool edac_mod_work(struct delayed_work *work, unsigned long delay);
+bool edac_mod_work(struct delayed_work *work, unsigned long jiffies);
 
 extern void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev, unsigned int msec);
-extern void edac_mc_reset_delay_period(unsigned long value);
+extern void edac_mc_reset_delay_period(unsigned long msec);
 
 /*
  * EDAC debugfs functions
diff --git a/drivers/edac/wq.c b/drivers/edac/wq.c
index ad3f516627c5..edeb7bbd3d68 100644
--- a/drivers/edac/wq.c
+++ b/drivers/edac/wq.c
@@ -3,15 +3,15 @@
 
 static struct workqueue_struct *wq;
 
-bool edac_queue_work(struct delayed_work *work, unsigned long delay)
+bool edac_queue_work(struct delayed_work *work, unsigned long jiffies)
 {
-	return queue_delayed_work(wq, work, delay);
+	return queue_delayed_work(wq, work, jiffies);
 }
 EXPORT_SYMBOL_GPL(edac_queue_work);
 
-bool edac_mod_work(struct delayed_work *work, unsigned long delay)
+bool edac_mod_work(struct delayed_work *work, unsigned long jiffies)
 {
-	return mod_delayed_work(wq, work, delay);
+	return mod_delayed_work(wq, work, jiffies);
 }
 EXPORT_SYMBOL_GPL(edac_mod_work);
 

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261119-edac-mc-poll-msec-jiffies-fb7f926f112c

Best regards,
--  
Ahmed Abdelfattah <me@ahmedabdelfattah.dev>


