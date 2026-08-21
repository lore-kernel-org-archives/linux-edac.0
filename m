Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F3A4756D2;
	Fri, 21 Aug 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307874; cv=none; b=B1+7zuAFmc5Ep8+DoEh7zvO94h8UXm5x75LI4FqyaiaNMIyeXZnB6JCqw3+gnIftNRmqpoXJxMNhscCtf9QHUOUnMY/mU2DZWg1oQ0uETWoE6cPEHeeGX7COAne73ZLIZx1IvzNcqOF6lh2ZsQyn544FXVGT0Saw7cuazFQKYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307874; c=relaxed/simple;
	bh=xyIHTH07+xKIY0xqKbzsHLS/FThvipvksxH9hFx8Gy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bq+l1kUNK2iW1YAlUR9sPKGD9Dsxb8/4WBPtM/d7ODfADCFYxX7YmsObe1AdOI2RjB9vrFLSwTYy9rzcM8iOrDATotqDrZHNu0f532f5D0YOWP0/fk/tpyf9VgoT9GCCTJISJW7xxdC0wbhfDeFyoI5KTsULrw+jIM4i+1HA0GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=VB+4WkBG; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="VB+4WkBG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=ma/oyiZEnUiqsZRo5AgRobLf9XEFeJTg6Dx6RZ5ZKGc=; b=VB+4WkBGyndesnxF+HcCY0/c8X
	RjLSAwDHjxUqgobzOj/witm5SAIzaAsLOgr8wyeFAiu/6pa/66L//zxMSoDnG/3mzt+JtLeum/0Mj
	dEUaEuuFZzziZ6oP5g6eruGQvYa4Vffg2Pu7VIs2ux0k0TlPXO39G7yccDpYP5t0228bcWVmvBuk8
	JaYz5lNqstLWpHEhgC81DhV3VUwYitEOz/cuOm+PmSBGywt/t5oTuO+ptZ4nxhjlAaSAMwJvfRiqK
	5I0v5/s4mfFCMSEBA4VH61Y2pM2MegbwupFhvTolu11iJjwg09AKRlUex+Z0yiUsz2nfQ4prEeLjB
	9i9jYeRQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wxMQB-00BH34-2N;
	Fri, 21 Aug 2026 10:24:24 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 21 Aug 2026 03:24:08 -0700
Subject: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8343; i=leitao@debian.org;
 h=from:subject:message-id; bh=xyIHTH07+xKIY0xqKbzsHLS/FThvipvksxH9hFx8Gy0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqiCdL7QXhlwGG2CvKpvgLepna319lBoyhQ8GFF
 IG27sjGwIiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaognSwAKCRA1o5Of/Hh3
 bTyFD/wI39Ba7slTj66RduHa7D1ytc15mdQJUYKwREGR2BpTFXgOCIg0oXpvAuDJIIFJakxxsNb
 PsWVPtLmJQ0bsyAuA98DqkQzUs0ms0ErPV0ihkd+W6ZepeL+HnzVP30wxUYMC4W1MSImJBb91bH
 s7OBFURezizMWviAb3Ixzr3XoF+WLdmPoDNr2pi1C7GnUsvhRfGdeT+TRy/9rq/oKhRK7/Z44KP
 3LaXiHM8cGgH0Y0jmKKKw2NnRb3u1eHOGT4rbhz1PpEnN4xWu2FA2J/a6oeyYXGkkj4Snnjpt0t
 vNPfekz0WiN/3vZUMrkbuPQ4t0VBN+cNVK4t915nxrmHlC6lyhalGolsnvtWkh5SFThBGDQIVvN
 xinpeZO2lbm5q4Pk5B4EA5v9HG+v9HCSbcXxHFKorXjrcdxkwT4IvikrGI73D9i+dY2CaowO820
 0IYg5QxlVGEjJ3glx61FGgd43UWssh7yRh0Gp5xA+ZNXGLckrTzSpLuQOuOECp3ceQUwa8gcqyZ
 USAABOczZ6X2IIlD8AkgwMhKYLRneYU5ERYJDvdLXy24UdpdlzlWOXVPNmSeIFAOhvs3GyS+P/J
 8KPGlsoGQrlkIajmLi4BJEsEQj0FM38eV5Kn4hHY+10BFWBZNR9IP+fDGc6XIyZamuzgCt/aSNc
 spY8VpHJwT5/ZCA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

A machine check bank producing corrected errors faster than the kernel can
drain them is not a machine anyone wants to keep in service, but nothing
takes it out. mce_track_storm() throttles CMCI for the bank and the
machine stays up.

Count corrected errors per bank and add mce=panic_on_ce_count=<count>
and panic the host if we have more events than set.

Off by default, for obvious reasons.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/ABI/testing/sysfs-mce             | 12 ++++++++++++
 Documentation/admin-guide/kernel-parameters.txt | 10 ++++++++++
 arch/x86/kernel/cpu/mce/core.c                  | 14 ++++++++++++--
 arch/x86/kernel/cpu/mce/internal.h              |  6 ++++++
 arch/x86/kernel/cpu/mce/threshold.c             | 23 +++++++++++++++++++++++
 5 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-mce b/Documentation/ABI/testing/sysfs-mce
index 83172f50e27c6..02009b5d581a4 100644
--- a/Documentation/ABI/testing/sysfs-mce
+++ b/Documentation/ABI/testing/sysfs-mce
@@ -95,3 +95,15 @@ Contact:	Hidetoshi Seto <seto.hidetoshi@jp.fujitsu.com>
 Date:		Jun 2009
 Description:
 		Disables the CMCI feature.
+
+What:		/sys/devices/system/machinecheck/machinecheckX/panic_on_ce_count
+Contact:	Breno Leitao <leitao@debian.org>
+Date:		Aug 2026
+Description:
+		Panic once a machine check bank has logged this many corrected
+		errors. 0, the default, disables it.
+
+		The setting is global rather than per-CPU, and it is compared
+		against a running total kept per CPU and per bank. Lowering it
+		below a total a bank has already reached takes the machine
+		down on that bank's next corrected error.
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d55524e3b7246..d5005bfefb7be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3924,6 +3924,16 @@ Kernel parameters
 		print_all
 			print all machine check logs to the console.
 
+		panic_on_ce_count=<count>
+			panic once a machine check bank has logged this many
+			corrected errors. 0, the default, disables it.
+
+			This is a running total per CPU and per bank for the
+			life of the boot, not a rate, so a machine that logs
+			a slow trickle for long enough will reach any value
+			eventually. Pick one a failing part reaches in
+			minutes and a healthy one does not reach at all.
+
 		monarchtimeout (number)
 			sets the time in us to wait for other CPUs on machine
 			checks. 0 to disable.
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605fc893..43dcdef1a7bbe 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -261,7 +261,7 @@ static const char *mce_dump_aux_info(struct mce *m)
 	return NULL;
 }
 
-static noinstr void mce_panic(const char *msg, struct mce_hw_err *final, char *exp)
+noinstr void mce_panic(const char *msg, struct mce_hw_err *final, char *exp)
 {
 	struct llist_node *pending;
 	struct mce_evt_llist *l;
@@ -813,6 +813,10 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
 		barrier();
 		m->status = mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
 
+		/* The boot time poll replays errors from before this boot. */
+		if (!(flags & MCP_QUEUE_LOG))
+			mce_track_ce_count(m);
+
 		/*
 		 * Update storm tracking here, before checking for the
 		 * MCI_STATUS_VAL bit. Valid corrected errors count
@@ -2326,6 +2330,7 @@ void mce_disable_bank(int bank)
  * mce=nobootlog Don't log MCEs from before booting.
  * mce=bios_cmci_threshold Don't program the CMCI threshold
  * mce=recovery force enable copy_mc_fragile()
+ * mce=panic_on_ce_count=<n> Panic after n corrected errors on one bank
  */
 static int __init mcheck_enable(char *str)
 {
@@ -2349,7 +2354,10 @@ static int __init mcheck_enable(char *str)
 		cfg->print_all = true;
 	else if (!strcmp(str, "ignore_ce"))
 		cfg->ignore_ce = true;
-	else if (!strcmp(str, "bootlog") || !strcmp(str, "nobootlog"))
+	else if (str_has_prefix(str, "panic_on_ce_count=")) {
+		str += strlen("panic_on_ce_count=");
+		get_option(&str, &cfg->panic_on_ce_count);
+	} else if (!strcmp(str, "bootlog") || !strcmp(str, "nobootlog"))
 		cfg->bootlog = (str[0] == 'b');
 	else if (!strcmp(str, "bios_cmci_threshold"))
 		cfg->bios_cmci_threshold = 1;
@@ -2617,6 +2625,7 @@ static ssize_t store_int_with_restart(struct device *s,
 }
 
 static DEVICE_INT_ATTR(monarch_timeout, 0644, mca_cfg.monarch_timeout);
+static DEVICE_INT_ATTR(panic_on_ce_count, 0644, mca_cfg.panic_on_ce_count);
 static DEVICE_BOOL_ATTR(dont_log_ce, 0644, mca_cfg.dont_log_ce);
 static DEVICE_BOOL_ATTR(print_all, 0644, mca_cfg.print_all);
 
@@ -2641,6 +2650,7 @@ static struct device_attribute *mce_device_attrs[] = {
 	&dev_attr_trigger,
 #endif
 	&dev_attr_monarch_timeout.attr,
+	&dev_attr_panic_on_ce_count.attr,
 	&dev_attr_dont_log_ce.attr,
 	&dev_attr_print_all.attr,
 	&dev_attr_ignore_ce.attr,
diff --git a/arch/x86/kernel/cpu/mce/internal.h b/arch/x86/kernel/cpu/mce/internal.h
index a31cf984619ca..7ebf87f6ca346 100644
--- a/arch/x86/kernel/cpu/mce/internal.h
+++ b/arch/x86/kernel/cpu/mce/internal.h
@@ -37,6 +37,7 @@ struct llist_node *mce_gen_pool_prepare_records(void);
 
 int mce_severity(struct mce *a, struct pt_regs *regs, char **msg, bool is_excp);
 struct dentry *mce_get_debugfs_dir(void);
+noinstr void mce_panic(const char *msg, struct mce_hw_err *final, char *exp);
 
 extern mce_banks_t mce_banks_ce_disabled;
 
@@ -64,6 +65,7 @@ void mce_timer_kick(bool storm);
 void cmci_storm_begin(unsigned int bank);
 void cmci_storm_end(unsigned int bank);
 void mce_track_storm(struct mce *mce);
+void mce_track_ce_count(struct mce *mce);
 void mce_inherit_storm(unsigned int bank);
 bool mce_get_storm_mode(void);
 void mce_set_storm_mode(bool storm);
@@ -72,6 +74,7 @@ u32  mce_get_apei_thr_limit(void);
 static inline void cmci_storm_begin(unsigned int bank) {}
 static inline void cmci_storm_end(unsigned int bank) {}
 static inline void mce_track_storm(struct mce *mce) {}
+static inline void mce_track_ce_count(struct mce *mce) {}
 static inline void mce_inherit_storm(unsigned int bank) {}
 static inline bool mce_get_storm_mode(void) { return false; }
 static inline void mce_set_storm_mode(bool storm) {}
@@ -83,12 +86,14 @@ static inline u32  mce_get_apei_thr_limit(void) { return 0; }
  *			represents an error seen.
  *
  * timestamp:		Last time (in jiffies) that the bank was polled.
+ * ce_count:		Corrected errors logged since boot.
  * in_storm_mode:	Is this bank in storm mode?
  * poll_only:		Bank does not support CMCI, skip storm tracking.
  */
 struct storm_bank {
 	u64 history;
 	u64 timestamp;
+	u64 ce_count;
 	bool in_storm_mode;
 	bool poll_only;
 };
@@ -183,6 +188,7 @@ struct mca_config {
 	bool ignore_ce;
 	bool print_all;
 
+	int panic_on_ce_count;
 	int monarch_timeout;
 	int panic_timeout;
 	u32 rip_msr;
diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 8591715ce2430..208dd6c8a5b18 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -119,6 +119,29 @@ void cmci_storm_end(unsigned int bank)
 static DEFINE_RATELIMIT_STATE(storm_rs, DEFAULT_RATELIMIT_INTERVAL,
 			      DEFAULT_RATELIMIT_BURST);
 
+/*
+ * A bank that keeps reporting corrected errors is repairing them faster than
+ * anything acts on it. Count them and let the admin put a ceiling on it.
+ */
+void mce_track_ce_count(struct mce *mce)
+{
+	struct storm_bank *bank = &this_cpu_ptr(&storm_desc)->banks[mce->bank];
+	int limit = READ_ONCE(mca_cfg.panic_on_ce_count);
+
+	if (limit <= 0)
+		return;
+
+	if (!(mce->status & MCI_STATUS_VAL) || !mce_is_correctable(mce))
+		return;
+
+	if (++bank->ce_count < (u64)limit)
+		return;
+
+	printk_deferred(KERN_EMERG "CPU%d BANK%d logged %llu corrected errors\n",
+			smp_processor_id(), mce->bank, bank->ce_count);
+	mce_panic("Too many corrected errors", NULL, NULL);
+}
+
 void mce_track_storm(struct mce *mce)
 {
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);

-- 
2.53.0-Meta

