Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3967C2F8EAD
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 06:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782713153; cv=none; b=Y0AS0OteY5WunfGPioci7RgK1/sUvVY1MmsyxjvJnoRr2zK60GPoVuo6Wi4IqGS/+ccBvpXkv8PYqvGvRdtRP+boI+2lS/vlzOWGFUQQYO7ZXsstJ0PfrX4Os9krTwobIcsdtIe+ZoaGIn8VpuHC3qYKNQGvGtz23CLCS2ssxQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782713153; c=relaxed/simple;
	bh=Udjrce0ntNUiZRm7qVcMlCLwzefwQZmIiguxNQwJGxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RG90BGHaWyzdcyaa/QmPpQeVvjkQdybhxB/jty7wFkKKx0qXKhmUt2b9GmFZeRpoeDajo8Y+PmTX/kIlsYTltF0HyZ7xr972erkcTlNOJAmUJSA+4lVEYEQDUEWoVGGmuKBGXp4rriP6ErqIJlU+tDFR7qWMbF3XU/MlH3yJa7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=D99xD75M; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=rQWRWV0S; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="D99xD75M";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="rQWRWV0S"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4B5F572F03;
	Mon, 29 Jun 2026 06:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782713150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ff5TCH8bvOPvNqKOvid4fHgRtluvh4xCG7ToLbgY8Wg=;
	b=D99xD75MwDTu7N+o/8fZsKJVpIvtReaCSttLAEpeCgOpS6moTkFWsPBGCQ9F3mqCK37YgK
	TtHyvHkCubJwbHIU2fvtGXxaZNtBYh061JUCQyugyo6yyTKulLfOyKzJ17RbW93sd8bxYw
	uiArZJ9MTZ21zwC525ta90vWpqp1pno=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1782713149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ff5TCH8bvOPvNqKOvid4fHgRtluvh4xCG7ToLbgY8Wg=;
	b=rQWRWV0SrJkTBpLz6oHB1KwptowK8EfGcbUVnZCKy22HaP3sjO3jx5zkI+inJBZipeJd+w
	s8RBdUb3k34U5IBjU5Njk0xOs57yN1HYcLEM4Ha662yFxTt3FNaK3J4GGvpTAq4DSsNkyB
	ArsgNxcYqB0ae+1foLnBdtAs5q0IHTM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0F5A6779A8;
	Mon, 29 Jun 2026 06:05:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EwIzAj0LQmrCEQAAD6G6ig
	(envelope-from <jgross@suse.com>); Mon, 29 Jun 2026 06:05:49 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-edac@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jason Baron <jbaron@akamai.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH 03/32] edac: Stop using 32-bit MSR interfaces
Date: Mon, 29 Jun 2026 08:04:54 +0200
Message-ID: <20260629060526.3638272-4-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629060526.3638272-1-jgross@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLabb87wq1t34j1pwfzcynq9ta)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -6.80

The 32-bit MSR interfaces rdmsr_safe() and wrmsr_safe() are planned to
be removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/edac/ie31200_edac.c | 10 +++++-----
 drivers/edac/mce_amd.c      |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index e3bd6436669b..94ab80197c2e 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -261,11 +261,11 @@ static void ie31200_clear_error_info(struct mem_ctl_info *mci)
 	 * the ECC error log registers in all memory controllers.
 	 */
 	if (cfg->msr_clear_eccerrlog_offset) {
-		if (wrmsr_safe(cfg->msr_clear_eccerrlog_offset,
-			       cfg->reg_eccerrlog_ce_mask |
-			       cfg->reg_eccerrlog_ce_ovfl_mask |
-			       cfg->reg_eccerrlog_ue_mask |
-			       cfg->reg_eccerrlog_ue_ovfl_mask, 0) < 0)
+		if (wrmsrq_safe(cfg->msr_clear_eccerrlog_offset,
+			        cfg->reg_eccerrlog_ce_mask |
+			        cfg->reg_eccerrlog_ce_ovfl_mask |
+			        cfg->reg_eccerrlog_ue_mask |
+			        cfg->reg_eccerrlog_ue_ovfl_mask) < 0)
 			ie31200_printk(KERN_ERR, "Failed to wrmsr.\n");
 
 		return;
diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index bd252cb3c38e..7aee57a25b68 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -806,7 +806,7 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 	struct mce *m = (struct mce *)data;
 	struct mce_hw_err *err = to_mce_hw_err(m);
 	unsigned int fam = x86_family(m->cpuid);
-	u32 mca_config_lo = 0, dummy;
+	u64 mca_config = 0;
 	int ecc;
 
 	if (m->kflags & MCE_HANDLED_CEC)
@@ -826,9 +826,9 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 		((m->status & MCI_STATUS_PCC)	? "PCC"	  : "-"));
 
 	if (boot_cpu_has(X86_FEATURE_SMCA)) {
-		rdmsr_safe(MSR_AMD64_SMCA_MCx_CONFIG(m->bank), &mca_config_lo, &dummy);
+		rdmsrq_safe(MSR_AMD64_SMCA_MCx_CONFIG(m->bank), &mca_config);
 
-		if (mca_config_lo & MCI_CONFIG_MCAX)
+		if (mca_config & MCI_CONFIG_MCAX)
 			pr_cont("|%s", ((m->status & MCI_STATUS_TCC) ? "TCC" : "-"));
 
 		pr_cont("|%s", ((m->status & MCI_STATUS_SYNDV) ? "SyndV" : "-"));
@@ -863,7 +863,7 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 
 		if (m->status & MCI_STATUS_SYNDV) {
 			pr_cont(", Syndrome: 0x%016llx\n", m->synd);
-			if (mca_config_lo & MCI_CONFIG_FRUTEXT) {
+			if (mca_config & MCI_CONFIG_FRUTEXT) {
 				char frutext[17];
 
 				frutext[16] = '\0';
-- 
2.54.0

