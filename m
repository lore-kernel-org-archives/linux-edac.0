Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C751E42668B
	for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777372995; cv=none; b=jvIWzejhdyHs53hoQys+tm8jORqXfHKzEKcbNEdyRuRVnSwCwgtNtSpR36NKtYWZYbwUsYhQoOmRgi5NUkieXzTGYEmp65L2aFrNH89G1NBB5hYgVqP5baJcviZZI4M/xSloz703SpNHnoCf+y/D7RNlXeMhnyh1E5HpSG0R45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777372995; c=relaxed/simple;
	bh=WxXSWxmWXwdUNan+VHkz3dWw4BZDVTZs4INx2i53XSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DaunGQRrHnAyALbQMTVQvdgZpPGto5v87wHjFpwX90H4fUWtEB4o2ruf0lrJAa/FL5Gm6IpJWFrCJtDkfCsUKA5gIGRw1C7rqpMkujrguoZB+WBgQ0bhlPjY7v1E5bXlTWHKtTzCZXQncNkZkISSPDTdvzRjomtqmtSwHtEmhGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=tC6efx08; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=tC6efx08; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="tC6efx08";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="tC6efx08"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 249B86A7E7;
	Tue, 28 Apr 2026 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777372991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9IrLsDCAmoXACUImote1xfxxj8upchE1dwh4FHRCjY=;
	b=tC6efx08L/J/2AEXi7iwql1raaz6dRAqVwQD7KiCS95cAvbUOTA1p1H8JvjzOqIYoO2KwP
	lUrMkLB4CXUzLXwG1di4PGx+UawGR2R9f/Q0/AlImAcbvgddPBJJ2RA909Dsjy2meudfhd
	Tf000QmZqvieF5VupzjlErCDSy1k/II=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tC6efx08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1777372991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9IrLsDCAmoXACUImote1xfxxj8upchE1dwh4FHRCjY=;
	b=tC6efx08L/J/2AEXi7iwql1raaz6dRAqVwQD7KiCS95cAvbUOTA1p1H8JvjzOqIYoO2KwP
	lUrMkLB4CXUzLXwG1di4PGx+UawGR2R9f/Q0/AlImAcbvgddPBJJ2RA909Dsjy2meudfhd
	Tf000QmZqvieF5VupzjlErCDSy1k/II=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC975593B0;
	Tue, 28 Apr 2026 10:43:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MFfCND6P8GnBPgAAD6G6ig
	(envelope-from <jgross@suse.com>); Tue, 28 Apr 2026 10:43:10 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-edac@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RFC 11/11] x86/cpu/mce: Switch code to use 64-bit rdmsr/wrmsr() variants
Date: Tue, 28 Apr 2026 12:42:05 +0200
Message-ID: <20260428104205.916924-12-jgross@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428104205.916924-1-jgross@suse.com>
References: <20260428104205.916924-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 249B86A7E7
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Switch the x86 MCE code to use the new 64-bit variants of rdmsr(),
rdmsr_safe(), wrmsr() and wrmsr_safe().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kernel/cpu/mce/amd.c     | 95 ++++++++++++++++---------------
 arch/x86/kernel/cpu/mce/core.c    | 18 +++---
 arch/x86/kernel/cpu/mce/inject.c  | 28 ++++-----
 arch/x86/kernel/cpu/mce/intel.c   | 32 +++++------
 arch/x86/kernel/cpu/mce/p5.c      | 16 +++---
 arch/x86/kernel/cpu/mce/winchip.c | 10 ++--
 6 files changed, 100 insertions(+), 99 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 580e90e74e9e..0a462e5952a4 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -280,11 +280,11 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 	u8 *bank_counts = this_cpu_ptr(smca_bank_counts);
 	const struct smca_hwid *s_hwid;
 	unsigned int i, hwid_mcatype;
-	u32 high, low;
+	struct msr val;
 	u32 smca_config = MSR_AMD64_SMCA_MCx_CONFIG(bank);
 
 	/* Set appropriate bits in MCA_CONFIG */
-	if (!rdmsr_safe(smca_config, &low, &high)) {
+	if (!rdmsr_safe(smca_config, &val.q)) {
 		/*
 		 * OS is required to set the MCAX bit to acknowledge that it is
 		 * now using the new MSR ranges and new registers under each
@@ -294,7 +294,7 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 		 *
 		 * MCA_CONFIG[MCAX] is bit 32 (0 in the high portion of the MSR.)
 		 */
-		high |= BIT(0);
+		val.h |= BIT(0);
 
 		/*
 		 * SMCA sets the Deferred Error Interrupt type per bank.
@@ -307,9 +307,9 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 		 * APIC based interrupt. First, check that no interrupt has been
 		 * set.
 		 */
-		if ((low & BIT(5)) && !((high >> 5) & 0x3) && data->dfr_intr_en) {
+		if ((val.l & BIT(5)) && !((val.h >> 5) & 0x3) && data->dfr_intr_en) {
 			__set_bit(bank, data->dfr_intr_banks);
-			high |= BIT(5);
+			val.h |= BIT(5);
 		}
 
 		/*
@@ -324,33 +324,33 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 		 * The OS should set this to inform the platform that the OS is ready
 		 * to handle the MCA Thresholding interrupt.
 		 */
-		if ((low & BIT(10)) && data->thr_intr_en) {
+		if ((val.l & BIT(10)) && data->thr_intr_en) {
 			__set_bit(bank, data->thr_intr_banks);
-			high |= BIT(8);
+			val.h |= BIT(8);
 		}
 
-		this_cpu_ptr(mce_banks_array)[bank].lsb_in_status = !!(low & BIT(8));
+		this_cpu_ptr(mce_banks_array)[bank].lsb_in_status = !!(val.l & BIT(8));
 
-		if (low & MCI_CONFIG_PADDRV)
+		if (val.l & MCI_CONFIG_PADDRV)
 			this_cpu_ptr(smca_banks)[bank].paddrv = 1;
 
-		wrmsr(smca_config, low, high);
+		wrmsr(smca_config, val.q);
 	}
 
-	if (rdmsr_safe(MSR_AMD64_SMCA_MCx_IPID(bank), &low, &high)) {
+	if (rdmsr_safe(MSR_AMD64_SMCA_MCx_IPID(bank), &val.q)) {
 		pr_warn("Failed to read MCA_IPID for bank %d\n", bank);
 		return;
 	}
 
-	hwid_mcatype = HWID_MCATYPE(high & MCI_IPID_HWID,
-				    (high & MCI_IPID_MCATYPE) >> 16);
+	hwid_mcatype = HWID_MCATYPE(val.h & MCI_IPID_HWID,
+				    (val.h & MCI_IPID_MCATYPE) >> 16);
 
 	for (i = 0; i < ARRAY_SIZE(smca_hwid_mcatypes); i++) {
 		s_hwid = &smca_hwid_mcatypes[i];
 
 		if (hwid_mcatype == s_hwid->hwid_mcatype) {
 			this_cpu_ptr(smca_banks)[bank].hwid = s_hwid;
-			this_cpu_ptr(smca_banks)[bank].id = low;
+			this_cpu_ptr(smca_banks)[bank].id = val.l;
 			this_cpu_ptr(smca_banks)[bank].sysfs_id = bank_counts[s_hwid->bank_type]++;
 			break;
 		}
@@ -432,50 +432,50 @@ static bool lvt_off_valid(struct threshold_block *b, int apic, u32 lo, u32 hi)
 static void threshold_restart_block(void *_tr)
 {
 	struct thresh_restart *tr = _tr;
-	u32 hi, lo;
+	struct msr val;
 
 	/* sysfs write might race against an offline operation */
 	if (!this_cpu_read(threshold_banks) && !tr->set_lvt_off)
 		return;
 
-	rdmsr(tr->b->address, lo, hi);
+	val.q = rdmsr(tr->b->address);
 
 	/*
 	 * Reset error count and overflow bit.
 	 * This is done during init or after handling an interrupt.
 	 */
-	if (hi & MASK_OVERFLOW_HI || tr->set_lvt_off) {
-		hi &= ~(MASK_ERR_COUNT_HI | MASK_OVERFLOW_HI);
-		hi |= THRESHOLD_MAX - tr->b->threshold_limit;
+	if (val.h & MASK_OVERFLOW_HI || tr->set_lvt_off) {
+		val.h &= ~(MASK_ERR_COUNT_HI | MASK_OVERFLOW_HI);
+		val.h |= THRESHOLD_MAX - tr->b->threshold_limit;
 	} else if (tr->old_limit) {	/* change limit w/o reset */
-		int new_count = (hi & THRESHOLD_MAX) +
+		int new_count = (val.h & THRESHOLD_MAX) +
 		    (tr->old_limit - tr->b->threshold_limit);
 
-		hi = (hi & ~MASK_ERR_COUNT_HI) |
+		val.h = (val.h & ~MASK_ERR_COUNT_HI) |
 		    (new_count & THRESHOLD_MAX);
 	}
 
 	/* clear IntType */
-	hi &= ~MASK_INT_TYPE_HI;
+	val.h &= ~MASK_INT_TYPE_HI;
 
 	if (!tr->b->interrupt_capable)
 		goto done;
 
 	if (tr->set_lvt_off) {
-		if (lvt_off_valid(tr->b, tr->lvt_off, lo, hi)) {
+		if (lvt_off_valid(tr->b, tr->lvt_off, val.l, val.h)) {
 			/* set new lvt offset */
-			hi &= ~MASK_LVTOFF_HI;
-			hi |= tr->lvt_off << 20;
+			val.h &= ~MASK_LVTOFF_HI;
+			val.h |= tr->lvt_off << 20;
 		}
 	}
 
 	if (tr->b->interrupt_enable)
-		hi |= INT_TYPE_APIC;
+		val.h |= INT_TYPE_APIC;
 
  done:
 
-	hi |= MASK_COUNT_EN_HI;
-	wrmsr(tr->b->address, lo, hi);
+	val.h |= MASK_COUNT_EN_HI;
+	wrmsr(tr->b->address, val.q);
 }
 
 static void threshold_restart_bank(unsigned int bank, bool intr_en)
@@ -658,12 +658,12 @@ static void disable_err_thresholding(struct cpuinfo_x86 *c, unsigned int bank)
 		return;
 	}
 
-	rdmsrq(MSR_K7_HWCR, hwcr);
+	hwcr = rdmsr(MSR_K7_HWCR);
 
 	/* McStatusWrEn has to be set */
 	need_toggle = !(hwcr & BIT(18));
 	if (need_toggle)
-		wrmsrq(MSR_K7_HWCR, hwcr | BIT(18));
+		wrmsr(MSR_K7_HWCR, hwcr | BIT(18));
 
 	/* Clear CntP bit safely */
 	for (i = 0; i < num_msrs; i++)
@@ -671,7 +671,7 @@ static void disable_err_thresholding(struct cpuinfo_x86 *c, unsigned int bank)
 
 	/* restore old settings */
 	if (need_toggle)
-		wrmsrq(MSR_K7_HWCR, hwcr);
+		wrmsr(MSR_K7_HWCR, hwcr);
 }
 
 static void amd_apply_cpu_quirks(struct cpuinfo_x86 *c)
@@ -710,7 +710,7 @@ static void smca_enable_interrupt_vectors(void)
 	if (!mce_flags.smca || !mce_flags.succor)
 		return;
 
-	if (rdmsrq_safe(MSR_CU_DEF_ERR, &mca_intr_cfg))
+	if (rdmsr_safe(MSR_CU_DEF_ERR, &mca_intr_cfg))
 		return;
 
 	offset = (mca_intr_cfg & SMCA_THR_LVT_OFF) >> 12;
@@ -726,7 +726,8 @@ static void smca_enable_interrupt_vectors(void)
 void mce_amd_feature_init(struct cpuinfo_x86 *c)
 {
 	unsigned int bank, block, cpu = smp_processor_id();
-	u32 low = 0, high = 0, address = 0;
+	struct msr val = { .q = 0 };
+	u32 address = 0;
 	int offset = -1;
 
 	amd_apply_cpu_quirks(c);
@@ -746,21 +747,21 @@ void mce_amd_feature_init(struct cpuinfo_x86 *c)
 		disable_err_thresholding(c, bank);
 
 		for (block = 0; block < NR_BLOCKS; ++block) {
-			address = get_block_address(address, low, high, bank, block, cpu);
+			address = get_block_address(address, val.l, val.h, bank, block, cpu);
 			if (!address)
 				break;
 
-			if (rdmsr_safe(address, &low, &high))
+			if (rdmsr_safe(address, &val.q))
 				break;
 
-			if (!(high & MASK_VALID_HI))
+			if (!(val.h & MASK_VALID_HI))
 				continue;
 
-			if (!(high & MASK_CNTP_HI)  ||
-			     (high & MASK_LOCKED_HI))
+			if (!(val.h & MASK_CNTP_HI)  ||
+			     (val.h & MASK_LOCKED_HI))
 				continue;
 
-			offset = prepare_threshold_block(bank, block, address, offset, high);
+			offset = prepare_threshold_block(bank, block, address, offset, val.h);
 		}
 	}
 }
@@ -1083,24 +1084,24 @@ static int allocate_threshold_blocks(unsigned int cpu, struct threshold_bank *tb
 				     u32 address)
 {
 	struct threshold_block *b = NULL;
-	u32 low, high;
+	struct msr val;
 	int err;
 
 	if ((bank >= this_cpu_read(mce_num_banks)) || (block >= NR_BLOCKS))
 		return 0;
 
-	if (rdmsr_safe(address, &low, &high))
+	if (rdmsr_safe(address, &val.q))
 		return 0;
 
-	if (!(high & MASK_VALID_HI)) {
+	if (!(val.h & MASK_VALID_HI)) {
 		if (block)
 			goto recurse;
 		else
 			return 0;
 	}
 
-	if (!(high & MASK_CNTP_HI)  ||
-	     (high & MASK_LOCKED_HI))
+	if (!(val.h & MASK_CNTP_HI)  ||
+	     (val.h & MASK_LOCKED_HI))
 		goto recurse;
 
 	b = kzalloc_obj(struct threshold_block);
@@ -1112,7 +1113,7 @@ static int allocate_threshold_blocks(unsigned int cpu, struct threshold_bank *tb
 	b->cpu			= cpu;
 	b->address		= address;
 	b->interrupt_enable	= 0;
-	b->interrupt_capable	= lvt_interrupt_supported(bank, high);
+	b->interrupt_capable	= lvt_interrupt_supported(bank, val.h);
 	b->threshold_limit	= get_thr_limit();
 
 	if (b->interrupt_capable) {
@@ -1124,13 +1125,13 @@ static int allocate_threshold_blocks(unsigned int cpu, struct threshold_bank *tb
 
 	list_add(&b->miscj, &tb->miscj);
 
-	mce_threshold_block_init(b, (high & MASK_LVTOFF_HI) >> 20);
+	mce_threshold_block_init(b, (val.h & MASK_LVTOFF_HI) >> 20);
 
 	err = kobject_init_and_add(&b->kobj, &threshold_ktype, tb->kobj, get_name(cpu, bank, b));
 	if (err)
 		goto out_free;
 recurse:
-	address = get_block_address(address, low, high, bank, ++block, cpu);
+	address = get_block_address(address, val.l, val.h, bank, ++block, cpu);
 	if (!address)
 		return 0;
 
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 8dd424ac5de8..6f684df5db36 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1871,7 +1871,7 @@ static void __mcheck_cpu_cap_init(void)
 	u64 cap;
 	u8 b;
 
-	rdmsrq(MSR_IA32_MCG_CAP, cap);
+	cap = rdmsr(MSR_IA32_MCG_CAP);
 
 	b = cap & MCG_BANKCNT_MASK;
 
@@ -1890,9 +1890,9 @@ static void __mcheck_cpu_init_generic(void)
 {
 	u64 cap;
 
-	rdmsrq(MSR_IA32_MCG_CAP, cap);
+	cap = rdmsr(MSR_IA32_MCG_CAP);
 	if (cap & MCG_CTL_P)
-		wrmsr(MSR_IA32_MCG_CTL, 0xffffffff, 0xffffffff);
+		wrmsr(MSR_IA32_MCG_CTL, ~0ULL);
 }
 
 static void __mcheck_cpu_init_prepare_banks(void)
@@ -1919,10 +1919,10 @@ static void __mcheck_cpu_init_prepare_banks(void)
 		if (!b->init)
 			continue;
 
-		wrmsrq(mca_msr_reg(i, MCA_CTL), b->ctl);
-		wrmsrq(mca_msr_reg(i, MCA_STATUS), 0);
+		wrmsr(mca_msr_reg(i, MCA_CTL), b->ctl);
+		wrmsr(mca_msr_reg(i, MCA_STATUS), 0);
 
-		rdmsrq(mca_msr_reg(i, MCA_CTL), msrval);
+		msrval = rdmsr(mca_msr_reg(i, MCA_CTL));
 		b->init = !!msrval;
 	}
 }
@@ -2240,7 +2240,7 @@ void mca_bsp_init(struct cpuinfo_x86 *c)
 	if (mce_flags.smca)
 		smca_bsp_init();
 
-	rdmsrq(MSR_IA32_MCG_CAP, cap);
+	cap = rdmsr(MSR_IA32_MCG_CAP);
 
 	/* Use accurate RIP reporting if available. */
 	if ((cap & MCG_EXT_P) && MCG_EXT_CNT(cap) >= 9)
@@ -2420,7 +2420,7 @@ static void mce_disable_error_reporting(void)
 		struct mce_bank *b = &mce_banks[i];
 
 		if (b->init)
-			wrmsrq(mca_msr_reg(i, MCA_CTL), 0);
+			wrmsr(mca_msr_reg(i, MCA_CTL), 0);
 	}
 	return;
 }
@@ -2776,7 +2776,7 @@ static void mce_reenable_cpu(void)
 		struct mce_bank *b = &mce_banks[i];
 
 		if (b->init)
-			wrmsrq(mca_msr_reg(i, MCA_CTL), b->ctl);
+			wrmsr(mca_msr_reg(i, MCA_CTL), b->ctl);
 	}
 }
 
diff --git a/arch/x86/kernel/cpu/mce/inject.c b/arch/x86/kernel/cpu/mce/inject.c
index 2d75098211b3..63ecbda3554e 100644
--- a/arch/x86/kernel/cpu/mce/inject.c
+++ b/arch/x86/kernel/cpu/mce/inject.c
@@ -476,27 +476,27 @@ static void prepare_msrs(void *info)
 	struct mce m = *(struct mce *)info;
 	u8 b = m.bank;
 
-	wrmsrq(MSR_IA32_MCG_STATUS, m.mcgstatus);
+	wrmsr(MSR_IA32_MCG_STATUS, m.mcgstatus);
 
 	if (boot_cpu_has(X86_FEATURE_SMCA)) {
 		if (m.inject_flags == DFR_INT_INJ) {
-			wrmsrq(MSR_AMD64_SMCA_MCx_DESTAT(b), m.status);
-			wrmsrq(MSR_AMD64_SMCA_MCx_DEADDR(b), m.addr);
+			wrmsr(MSR_AMD64_SMCA_MCx_DESTAT(b), m.status);
+			wrmsr(MSR_AMD64_SMCA_MCx_DEADDR(b), m.addr);
 		} else {
-			wrmsrq(MSR_AMD64_SMCA_MCx_STATUS(b), m.status);
-			wrmsrq(MSR_AMD64_SMCA_MCx_ADDR(b), m.addr);
+			wrmsr(MSR_AMD64_SMCA_MCx_STATUS(b), m.status);
+			wrmsr(MSR_AMD64_SMCA_MCx_ADDR(b), m.addr);
 		}
 
-		wrmsrq(MSR_AMD64_SMCA_MCx_SYND(b), m.synd);
+		wrmsr(MSR_AMD64_SMCA_MCx_SYND(b), m.synd);
 
 		if (m.misc)
-			wrmsrq(MSR_AMD64_SMCA_MCx_MISC(b), m.misc);
+			wrmsr(MSR_AMD64_SMCA_MCx_MISC(b), m.misc);
 	} else {
-		wrmsrq(MSR_IA32_MCx_STATUS(b), m.status);
-		wrmsrq(MSR_IA32_MCx_ADDR(b), m.addr);
+		wrmsr(MSR_IA32_MCx_STATUS(b), m.status);
+		wrmsr(MSR_IA32_MCx_ADDR(b), m.addr);
 
 		if (m.misc)
-			wrmsrq(MSR_IA32_MCx_MISC(b), m.misc);
+			wrmsr(MSR_IA32_MCx_MISC(b), m.misc);
 	}
 }
 
@@ -742,15 +742,15 @@ static void check_hw_inj_possible(void)
 		u64 status = MCI_STATUS_VAL, ipid;
 
 		/* Check whether bank is populated */
-		rdmsrq(MSR_AMD64_SMCA_MCx_IPID(bank), ipid);
+		ipid = rdmsr(MSR_AMD64_SMCA_MCx_IPID(bank));
 		if (!ipid)
 			continue;
 
 		toggle_hw_mce_inject(cpu, true);
 
-		wrmsrq_safe(mca_msr_reg(bank, MCA_STATUS), status);
-		rdmsrq_safe(mca_msr_reg(bank, MCA_STATUS), &status);
-		wrmsrq_safe(mca_msr_reg(bank, MCA_STATUS), 0);
+		wrmsr_safe(mca_msr_reg(bank, MCA_STATUS), status);
+		rdmsr_safe(mca_msr_reg(bank, MCA_STATUS), &status);
+		wrmsr_safe(mca_msr_reg(bank, MCA_STATUS), 0);
 
 		if (!status) {
 			hw_injection_possible = false;
diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..98990c0a7a42 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -94,7 +94,7 @@ static bool cmci_supported(int *banks)
 	if (!boot_cpu_has(X86_FEATURE_APIC) || lapic_get_maxlvt() < 6)
 		return false;
 
-	rdmsrq(MSR_IA32_MCG_CAP, cap);
+	cap = rdmsr(MSR_IA32_MCG_CAP);
 	*banks = min_t(unsigned, MAX_NR_BANKS, cap & MCG_BANKCNT_MASK);
 	return !!(cap & MCG_CMCI_P);
 }
@@ -106,7 +106,7 @@ static bool lmce_supported(void)
 	if (mca_cfg.lmce_disabled)
 		return false;
 
-	rdmsrq(MSR_IA32_MCG_CAP, tmp);
+	tmp = rdmsr(MSR_IA32_MCG_CAP);
 
 	/*
 	 * LMCE depends on recovery support in the processor. Hence both
@@ -123,7 +123,7 @@ static bool lmce_supported(void)
 	 * WARN if the MSR isn't locked as init_ia32_feat_ctl() unconditionally
 	 * locks the MSR in the event that it wasn't already locked by BIOS.
 	 */
-	rdmsrq(MSR_IA32_FEAT_CTL, tmp);
+	tmp = rdmsr(MSR_IA32_FEAT_CTL);
 	if (WARN_ON_ONCE(!(tmp & FEAT_CTL_LOCKED)))
 		return false;
 
@@ -141,9 +141,9 @@ static void cmci_set_threshold(int bank, int thresh)
 	u64 val;
 
 	raw_spin_lock_irqsave(&cmci_discover_lock, flags);
-	rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
+	val = rdmsr(MSR_IA32_MCx_CTL2(bank));
 	val &= ~MCI_CTL2_CMCI_THRESHOLD_MASK;
-	wrmsrq(MSR_IA32_MCx_CTL2(bank), val | thresh);
+	wrmsr(MSR_IA32_MCx_CTL2(bank), val | thresh);
 	raw_spin_unlock_irqrestore(&cmci_discover_lock, flags);
 }
 
@@ -184,7 +184,7 @@ static bool cmci_skip_bank(int bank, u64 *val)
 	if (test_bit(bank, mce_banks_ce_disabled))
 		return true;
 
-	rdmsrq(MSR_IA32_MCx_CTL2(bank), *val);
+	*val = rdmsr(MSR_IA32_MCx_CTL2(bank));
 
 	/* Already owned by someone else? */
 	if (*val & MCI_CTL2_CMCI_EN) {
@@ -232,8 +232,8 @@ static void cmci_claim_bank(int bank, u64 val, int bios_zero_thresh, int *bios_w
 	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
 
 	val |= MCI_CTL2_CMCI_EN;
-	wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
-	rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
+	wrmsr(MSR_IA32_MCx_CTL2(bank), val);
+	val = rdmsr(MSR_IA32_MCx_CTL2(bank));
 
 	/* If the enable bit did not stick, this bank should be polled. */
 	if (!(val & MCI_CTL2_CMCI_EN)) {
@@ -324,9 +324,9 @@ static void __cmci_disable_bank(int bank)
 
 	if (!test_bit(bank, this_cpu_ptr(mce_banks_owned)))
 		return;
-	rdmsrq(MSR_IA32_MCx_CTL2(bank), val);
+	val = rdmsr(MSR_IA32_MCx_CTL2(bank));
 	val &= ~MCI_CTL2_CMCI_EN;
-	wrmsrq(MSR_IA32_MCx_CTL2(bank), val);
+	wrmsr(MSR_IA32_MCx_CTL2(bank), val);
 	__clear_bit(bank, this_cpu_ptr(mce_banks_owned));
 
 	if ((val & MCI_CTL2_CMCI_THRESHOLD_MASK) == CMCI_STORM_THRESHOLD)
@@ -430,10 +430,10 @@ void intel_init_lmce(void)
 	if (!lmce_supported())
 		return;
 
-	rdmsrq(MSR_IA32_MCG_EXT_CTL, val);
+	val = rdmsr(MSR_IA32_MCG_EXT_CTL);
 
 	if (!(val & MCG_EXT_CTL_LMCE_EN))
-		wrmsrq(MSR_IA32_MCG_EXT_CTL, val | MCG_EXT_CTL_LMCE_EN);
+		wrmsr(MSR_IA32_MCG_EXT_CTL, val | MCG_EXT_CTL_LMCE_EN);
 }
 
 void intel_clear_lmce(void)
@@ -443,9 +443,9 @@ void intel_clear_lmce(void)
 	if (!lmce_supported())
 		return;
 
-	rdmsrq(MSR_IA32_MCG_EXT_CTL, val);
+	val = rdmsr(MSR_IA32_MCG_EXT_CTL);
 	val &= ~MCG_EXT_CTL_LMCE_EN;
-	wrmsrq(MSR_IA32_MCG_EXT_CTL, val);
+	wrmsr(MSR_IA32_MCG_EXT_CTL, val);
 }
 
 /*
@@ -460,10 +460,10 @@ static void intel_imc_init(struct cpuinfo_x86 *c)
 	case INTEL_SANDYBRIDGE_X:
 	case INTEL_IVYBRIDGE_X:
 	case INTEL_HASWELL_X:
-		if (rdmsrq_safe(MSR_ERROR_CONTROL, &error_control))
+		if (rdmsr_safe(MSR_ERROR_CONTROL, &error_control))
 			return;
 		error_control |= 2;
-		wrmsrq_safe(MSR_ERROR_CONTROL, error_control);
+		wrmsr_safe(MSR_ERROR_CONTROL, error_control);
 		break;
 	}
 }
diff --git a/arch/x86/kernel/cpu/mce/p5.c b/arch/x86/kernel/cpu/mce/p5.c
index 2272ad53fc33..619d92d56136 100644
--- a/arch/x86/kernel/cpu/mce/p5.c
+++ b/arch/x86/kernel/cpu/mce/p5.c
@@ -23,16 +23,16 @@ int mce_p5_enabled __read_mostly;
 /* Machine check handler for Pentium class Intel CPUs: */
 noinstr void pentium_machine_check(struct pt_regs *regs)
 {
-	u32 loaddr, hi, lotype;
+	struct msr addr, type;
 
 	instrumentation_begin();
-	rdmsr(MSR_IA32_P5_MC_ADDR, loaddr, hi);
-	rdmsr(MSR_IA32_P5_MC_TYPE, lotype, hi);
+	addr.q = rdmsr(MSR_IA32_P5_MC_ADDR);
+	type.q = rdmsr(MSR_IA32_P5_MC_TYPE);
 
 	pr_emerg("CPU#%d: Machine Check Exception:  0x%8X (type 0x%8X).\n",
-		 smp_processor_id(), loaddr, lotype);
+		 smp_processor_id(), addr.l, type.l);
 
-	if (lotype & (1<<5)) {
+	if (type.l & (1<<5)) {
 		pr_emerg("CPU#%d: Possible thermal failure (CPU on fire ?).\n",
 			 smp_processor_id());
 	}
@@ -44,7 +44,7 @@ noinstr void pentium_machine_check(struct pt_regs *regs)
 /* Set up machine check reporting for processors with Intel style MCE: */
 void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
 {
-	u32 l, h;
+	u64 val;
 
 	/* Default P5 to off as its often misconnected: */
 	if (!mce_p5_enabled)
@@ -55,8 +55,8 @@ void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
 		return;
 
 	/* Read registers before enabling: */
-	rdmsr(MSR_IA32_P5_MC_ADDR, l, h);
-	rdmsr(MSR_IA32_P5_MC_TYPE, l, h);
+	val = rdmsr(MSR_IA32_P5_MC_ADDR);
+	val = rdmsr(MSR_IA32_P5_MC_TYPE);
 	pr_info("Intel old style machine check architecture supported.\n");
 
 	/* Enable MCE: */
diff --git a/arch/x86/kernel/cpu/mce/winchip.c b/arch/x86/kernel/cpu/mce/winchip.c
index 6c99f2941909..58942ad98fca 100644
--- a/arch/x86/kernel/cpu/mce/winchip.c
+++ b/arch/x86/kernel/cpu/mce/winchip.c
@@ -28,12 +28,12 @@ noinstr void winchip_machine_check(struct pt_regs *regs)
 /* Set up machine check reporting on the Winchip C6 series */
 void winchip_mcheck_init(struct cpuinfo_x86 *c)
 {
-	u32 lo, hi;
+	struct msr val;
 
-	rdmsr(MSR_IDT_FCR1, lo, hi);
-	lo |= (1<<2);	/* Enable EIERRINT (int 18 MCE) */
-	lo &= ~(1<<4);	/* Enable MCE */
-	wrmsr(MSR_IDT_FCR1, lo, hi);
+	val.q = rdmsr(MSR_IDT_FCR1);
+	val.l |= (1<<2);	/* Enable EIERRINT (int 18 MCE) */
+	val.l &= ~(1<<4);	/* Enable MCE */
+	wrmsr(MSR_IDT_FCR1, val.q);
 
 	cr4_set_bits(X86_CR4_MCE);
 
-- 
2.53.0

