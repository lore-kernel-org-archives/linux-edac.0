Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7B63431F8;
	Thu,  2 Jul 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987357; cv=none; b=b1VGaSSB8lH6eCbGwE78t82Lwm/o2NY0Tqjz64oT8mQlFKnHl0myE+p2xxgt9Zfo/+GYxncoT1oq2/h5ssJ+0E4L3X7exBRb79wy7ZqM10K/P3NPFe1ZWJx4Nd5FZMvjkMFxUu8z5cmrndEC4SNcnfv4kGJSHe9AS5jw4Di4TRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987357; c=relaxed/simple;
	bh=o4LpXog2zqRIrPH4NcCxoI4vRBM8n74V72cgXQC/L7A=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=mPJe4R3AhHwqKU8k5LkUO712GF3cKjkxXKK5pD0eW3SNqKi6Y6r0ffNN8/j9mRsh6iB+Xf8oew7+MZj4apR05qv+PzK2KzsDZfteOhni57gcS+zTO4sAj1VpU0MI72DQal2KWPyCEwUXPHeWlEoGg1vIULsmYuA5e/+83ylSpSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kayD/MiV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HgWab+hm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kayD/MiV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HgWab+hm"
Date: Thu, 02 Jul 2026 10:15:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782987355;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFcZvsJGrv9N19r7t347baDgZjPO+Oh2bAW7UKLlXIA=;
	b=kayD/MiVbZnsqpauhprbcA5Aos8q1k55CfgI21VeC3Q1OhLF+6H1OlnT81nV7yyGYfUZfV
	oP5hEFLPL2k+jxIaJnJdrsfXKLaCsvRH7Cp4d+7eviLan1XBObcw+Ay/pwFBtHSRslvQdC
	Nxm71Ohtuucy7XyzJBLMCaEKD9y847hcE2PvYnmVboznD5Y1V7ymE3SY2BngjQfEBVEgjc
	zML2q1xm0gwqQMZNj5CQY9K4E9+4PKvUp1ddbkGeHRUUiWzG1k3Hgvq8gr9Ew16bB+T7FQ
	QXZwov5KDtM4M18IN9awvvnQ9MFoEaCkskyJpdDv629EwkpOcyBLDhB9jj8Lyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782987355;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFcZvsJGrv9N19r7t347baDgZjPO+Oh2bAW7UKLlXIA=;
	b=HgWab+hmd+g4WTdHf2ddnC1EBPQ8E5QcLcz5KlcAmtEJ+f4eynWFVccNzJ8Q1N/Y5duE/t
	jNZQN52iVqFbOkBw==
From: "tip-bot2 for Juergen Gross" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/msr] EDAC: Stop using 32-bit MSR interfaces
Cc: Juergen Gross <jgross@suse.com>, Ingo Molnar <mingo@kernel.org>,
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>, Jason Baron <jbaron@akamai.com>,
 Tony Luck <tony.luck@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
 linux-edac@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260629060526.3638272-4-jgross@suse.com>
References: <20260629060526.3638272-4-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178298735351.3843924.11285073253559273689.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/msr branch of tip:

Commit-ID:     3e8ca6691e9d6695e36cafa84217bb8b955face1
Gitweb:        https://git.kernel.org/tip/3e8ca6691e9d6695e36cafa84217bb8b955=
face1
Author:        Juergen Gross <jgross@suse.com>
AuthorDate:    Mon, 29 Jun 2026 08:04:54 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 02 Jul 2026 11:54:53 +02:00

EDAC: Stop using 32-bit MSR interfaces

The 32-bit MSR interfaces rdmsr_safe() and wrmsr_safe() are planned to
be removed. Use the related 64-bit variants instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: Jason Baron <jbaron@akamai.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org
Link: https://patch.msgid.link/20260629060526.3638272-4-jgross@suse.com
---
 drivers/edac/ie31200_edac.c | 10 +++++-----
 drivers/edac/mce_amd.c      |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c
index e3bd643..94ab801 100644
--- a/drivers/edac/ie31200_edac.c
+++ b/drivers/edac/ie31200_edac.c
@@ -261,11 +261,11 @@ static void ie31200_clear_error_info(struct mem_ctl_inf=
o *mci)
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
=20
 		return;
diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index bd252cb..7aee57a 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -806,7 +806,7 @@ amd_decode_mce(struct notifier_block *nb, unsigned long v=
al, void *data)
 	struct mce *m =3D (struct mce *)data;
 	struct mce_hw_err *err =3D to_mce_hw_err(m);
 	unsigned int fam =3D x86_family(m->cpuid);
-	u32 mca_config_lo =3D 0, dummy;
+	u64 mca_config =3D 0;
 	int ecc;
=20
 	if (m->kflags & MCE_HANDLED_CEC)
@@ -826,9 +826,9 @@ amd_decode_mce(struct notifier_block *nb, unsigned long v=
al, void *data)
 		((m->status & MCI_STATUS_PCC)	? "PCC"	  : "-"));
=20
 	if (boot_cpu_has(X86_FEATURE_SMCA)) {
-		rdmsr_safe(MSR_AMD64_SMCA_MCx_CONFIG(m->bank), &mca_config_lo, &dummy);
+		rdmsrq_safe(MSR_AMD64_SMCA_MCx_CONFIG(m->bank), &mca_config);
=20
-		if (mca_config_lo & MCI_CONFIG_MCAX)
+		if (mca_config & MCI_CONFIG_MCAX)
 			pr_cont("|%s", ((m->status & MCI_STATUS_TCC) ? "TCC" : "-"));
=20
 		pr_cont("|%s", ((m->status & MCI_STATUS_SYNDV) ? "SyndV" : "-"));
@@ -863,7 +863,7 @@ amd_decode_mce(struct notifier_block *nb, unsigned long v=
al, void *data)
=20
 		if (m->status & MCI_STATUS_SYNDV) {
 			pr_cont(", Syndrome: 0x%016llx\n", m->synd);
-			if (mca_config_lo & MCI_CONFIG_FRUTEXT) {
+			if (mca_config & MCI_CONFIG_FRUTEXT) {
 				char frutext[17];
=20
 				frutext[16] =3D '\0';
