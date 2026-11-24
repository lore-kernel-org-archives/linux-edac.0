Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795483301;
	b=afgbqTF2LEtccEdKgxAsaRanU7OlY7PnHr0wMLleVHS7UQSOwQKov9xbexuIlt3sqx2q
	 fPkBJfe+L41nXUSk4XWEq+kjbUFAztgQwPnsGkh6IVGGRQGoOHgmgXMOAtUOSFzV+zQo4
	 RgxaY9N9u50RbGiZjwgYtRMU5QF/m5Qov5R+H4K9++RGsmcBnwv2Nx2zWx/yMwjACYA9y
	 pwn2sNcirgVL8cxMvzHOHUHuVsWxNuDOAy+ZYcTz3g81yEd6R7kvTZMzBZlAkwQaIywa5
	 FAJvcN0AsBkfT3J207JcIaCld2L+8f7TrIFREvRArHllMKJoKQ9z53dlw3N+nvf7L3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483301;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NPiHqCBzSMigGGhv6hcRBn033WAiMIBFt3pZgWFWluk=;
	b=IDRRD8twGVzAA5Wg98uOQCUQIlEPceYhPKfzoPZw/h/u/AdkKZ3rH8TW81ytr5SLvk9I
	 OYgDgh3QW41rFqbSiwTymT7pIHhJRDGoKIUUrrPCHh4/oZdP5m/gBo6ZMPzxsoJ8BrAtW
	 HXbn4e8XezVK8FNOoPoXN4cz8V3lo6hSl04J8fbJsf0X1jQydIXasfNjW35ejXiKHs6yN
	 15XzYpr7aJ2W6bCk3QOjOC9PKYd+nS0MytMNtkAKxEnw38QVW+XANtjanyjU+PfVIXzF5
	 +79u/loXB8O1aiV6yZ9x9NfXjN5I5YoEDryqTXDOHwOMNKLoIRnr6pJ/43mWvMC8lGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoouS4HH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1597606A322;
	Tue, 24 Nov 2026 01:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QoouS4HH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795483301;
	b=mOUOJrXXfzRElqVigakKMBoqfg7waoDu3dfyERmdLrLqgVE/4gLv2ntq7t+Cb+lAdaX6
	 TSLNNPS1rnTeth+1H3/HSiB7A33cIRsoJEFEgXYjwD6sQNqi/cWaYVcE4UxjhkMDrt5+7
	 1ja0CPp9tSTkSCYV7Jx/oyyV5I15OJZVqvzVfj9E9gHaXkT5MNcNm8JrCK8M0T/oW5/jS
	 D9QukS0qZo2fnbYzVpz6kA0/yo2O5EjvV6x2jZVbe5KhtrMwMVaG9lbCWir3rm4dNkkTQ
	 SKvCdlCg6wAcKqh7QujT0vkwvlCRcOzITxPOxoxgrL3mp60aUnECpcHFvKxGhG+9T6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795483301;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NPiHqCBzSMigGGhv6hcRBn033WAiMIBFt3pZgWFWluk=;
	b=CVx8P+vsO2TaptsNFiL86mVdVlAzU6Ux+gFbC/uA2cd9IUs8ZdrYtJD2K3jIu9oSKI8J
	 unvjiIjr+CAMLzVt8/ejHZCo1khgfIqoJcjXEJwhNqfzz3whxP8QLyGeFd4sVghgdoEBi
	 m9pQGApufwTubCqm1GarfoJZDB7TzuSNGh38b+DGNiSa65nREa4Cmsxe9u6aXxs+C55h1
	 zuI7zsiIDKYFqZNXq5MKO2cmU5zNk3aRtLTNhYwXbPsCln/uKISznpHuWZd7UeHMRHmET
	 G/RGeXZ6lrRfZzaFWCmMSxHvUKX4YJuBSG+s7qcrP8Mfobbx95iF/JcTMwWfS3YxydQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0AA51F000E1;
	Tue, 24 Nov 2026 01:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483301;
	bh=NPiHqCBzSMigGGhv6hcRBn033WAiMIBFt3pZgWFWluk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=QoouS4HHDYzuyY1de5Ee3HxNQfplE9BwnuEx0b956GSNyZ0TFaD4gbBZ3/5lkBX+z
	 8Rp0ptoQDArRRtoCPsbv1H/Orafk5opf59/CRkPNOgtzPEw3/f/zMqMHV01nre6+C1
	 R3ezNxspO5YYr+mNWi487FRxrbCPfoo29fY89Cw5Ak2nQIqnEPZyPI0iXPrmLHUUUH
	 izJHseP4Q4xVIazTRALSMiL1Pey7x1SZs85QF7aWylwvJNn6ngoxHaHKis3n333xh5
	 Xo2HGPNHJIZTKAtvoNWhlW+BvzkQ5FL8QPFfuePh5bDooWE3MfTBoQV+v2HVqT07YY
	 5xSWjkS6KZEbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5EC224C809;
	Tue, 24 Nov 2026 01:21:31 +0000 (UTC)
From: Ahmed Abdelfattah via B4 Relay <devnull+me.ahmedabdelfattah.dev@kernel.org>
Date: Tue, 24 Nov 2026 03:21:26 +0200
Subject: [PATCH v3] EDAC/mc: Convert the poll period to jiffies when it is
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
Message-Id: <20261124-edac-mc-poll-msec-jiffies-v3-1-a377fda35aed@ahmedabdelfattah.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NzQ6CMBAE4FchPbuGLoLWk+9hPJR2V0r4MS02G
 sO7W/TiReNxkplvHiKQdxTEPnsIT9EFNw4pFKtMmEYPZwJnUxaYYyWlVEBWG+gNXMaugz6QgdY
 xJwK43rLCiqVEI9L+4ond7WUfT+8crnVLZlrApdG4MI3+/jqPcun98xMlSGAqUKlixzpXB930q
 V5b6lhPk27WlqJYLiN+oFj8QjGh+SbfGlNiWVb2CzrP8xPdgyVnNAEAAA==
X-Change-ID: 20261119-edac-mc-poll-msec-jiffies-fb7f926f112c
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: Qiuxu Zhuo <qzhuo@nvidia.com>, linux-edac@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795483290; l=5834;
 i=me@ahmedabdelfattah.dev; s=20261106; h=from:subject:message-id;
 bh=jADiePoQwyKWlx1hQxkiCPwJnWF2b74pDalVFuubc6A=;
 b=htkZo4cGp+F7yGqN7zcLryOPbYzkS2swJeQ6vfLfbw8eiEE749i5oOFyGaUw710BqC9tC/qGr
 zo16EuLMSWYBJSYz8tj24bq+yLDTh1KPZDeqNHKMfiyDybSxoSHzA+b
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
Changes in v3:
- Dropped Qiuxu's Reviewed-by: he gave it for the one-line conversion
  in v1, and v2 added the argument renames on top of that (Borislav).
- No code changes.
- Link to v2: https://patch.msgid.link/20261123-edac-mc-poll-msec-jiffies-v2-1-0407cc52556d@ahmedabdelfattah.dev

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


