Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23389345ECC
	for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 22:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572977; cv=none; b=Phc/4KTMjZBs89Rd04Ky1wq/6Bt2/Cvkwik+a/AQ4VgNfvSrwlHMjUPDBlrfiBKPGjuc44r4KPchLgk6Wdef+t87oeU6HWrdh97KMVUG2VY1x6Q9LTBkoeUmJyzD9+iJerwxG8TfTOu5OAUOC/a8Z+/wLqpomNTUmRx9+lOK0tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572977; c=relaxed/simple;
	bh=JAXOCI1lXaY5SwhKMODmrNeYfP3CEvtE9+0ychwtKWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JI+QMxNuwHVUy+3epQCkOzv75xJFxQR+BO/K/nA3WPSZMIdx+rezD7gznxDwLn1AbE++R/xqJZYBp/yCgCORD+oE2KDlcH6GBoAJG+s2DsMBSkKDCTpnkQhJwmd6sxH96LLdnsAeDQuDGkKqIC1pj4Z/t7/9cdiQdVQqlUMeS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JOh9WLhj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JOh9WLhj"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fde295992so251531f8f.0
        for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 15:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1786572974; x=1787177774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2C1tHxTxuovlXYHmjDKW1q6VCxuSctc0IbqwFMRcNEI=;
        b=JOh9WLhj5ROMhST7aYGrYdCr3I5554+FqwEjAnpYI+Y1inVR683fwkv2Szk8StqGux
         SDvhjXL/klQ6a+kPFd9tJPs31ZP5H1O+iWCe+2U37yPCP8i/cc2URUpuPT0EHZJ3/oNE
         7A4AcZzC4mZts/+LQLuV4vKpbWrO3C1uqmfBGzaNrWStNJPAkVbD02OrZkcHjh5+jrAO
         hn7zQuVl0UkzyB/LYGiOuKpnVcA/sBy9/E7DdTdPJMWFBjfDOZjks8vCeKDYrU3OjP3+
         uhch51DQ1ZXz3vphkjo20suD838HqiWyqrivaIxCQQYMWVoAcFMjulwXEv4W+RBYwEVL
         uW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572974; x=1787177774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2C1tHxTxuovlXYHmjDKW1q6VCxuSctc0IbqwFMRcNEI=;
        b=X/pteWmUYNRMedPqQCBQw9ehKzPVKBOM4SeHFun4lb3zkCCP716YXd1AwrenSdiTxz
         gK3N/IW6Mu0ezhZ7OBUTHAlGL1/uGWIgV6/Slib8ySqKNhkIxyXTIUVDAiULRe1eJ9Tm
         Rjs9PG8Ox2MGgGiHFLxHbodV0waSKL4u/PFm/QNuRLSKqwHZlkEFmvcKMcK0aQ0Rpznr
         SSmZNtPgivBotxzubSQpXN+0ISvIrO7ORyPtItHfDAOqvjbcL+GCg0f+V2HGLepl+xrM
         n30DEdOE6LTbs7LfmrsWcHOdHHng7HYYk7tAy5URu/+LQVE/7g7UowveB1C78J7C63AT
         BucQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnifYCOeJMEDIj0ooLybt13/MSpVyiKom+yJWw82kTn+3BC/KhmzHtpry+YfhIEVF6jKxo+bxrb4wY@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvedZYx8t4NQXZ13VZj+d1ddHswojxyudcXs4XUZ3h0SW0yMC
	PpFtuHoZmEvX8E8kyjp4DK/CzjnDvWgBXTx49Dxl4ofa5Y8GnoQsaOHYoMMgubzKC9g=
X-Gm-Gg: AR+sD11r0L0dz5rxeYrJQ6EDoq7RiT+SRF7XZZc8q3+746DJZfReOw3BBmVZ4UJDsGZ
	l1TWGNqNV6OIKkeXt35ld5T03mo0VtzgXINpqY7JJolEvZqHSWymCcpfdBOIhw9e4Yyhs78U3yj
	A4HaYx/dZFc7YlZvDYyN/rqBxpgq9927FSrzpwY7aRc5jh7A/m98rH2ND+xpBTAKdZyslCVnqRd
	g3aJUQvODbjCjyO62m5ubBelOuhUQhg7cc6UoJu2PUX9vfVcRw9XB64ZpiFzdpwPOrtxARG0Aou
	H24zjLo4V85kKfZ0fcIcVM9sYCfIpfzXqjEOO0G8o3+kovddZd7rI1IB30z+HAKY7NIeXJFuRB0
	VNynYNjjbPdSaY2r7pTQYyxIEcnjJRy7Z/UlAeRJQjwvV5pXL2RaPdSwfzI8tSo60LN54Z+SjM1
	da/azKj+DBp7ruMr7DTvG2swh0QGHiRwZ85F+NrDKyVQvdVedkNZanq38G8hywYnq1wlEePXiMD
	ZZPMX2vFXhNcHlYKR5PFJ/K6XQ=
X-Received: by 2002:a05:6000:2c0e:b0:481:314b:b041 with SMTP id ffacd0b85a97d-4815a5c9325mr982738f8f.7.1786572974446;
        Wed, 12 Aug 2026 15:16:14 -0700 (PDT)
Received: from dev-jrangi.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815a569ab3sm933792f8f.11.2026.08.12.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:16:13 -0700 (PDT)
From: Jasjeet Rangi <jrangi@purestorage.com>
To: x86@kernel.org
Cc: jrangi@purestorage.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-edac@vger.kernel.org,
	stable@vger.kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	yazen.ghannam@amd.com,
	msaggi@purestorage.com,
	rjethwani@purestorage.com,
	rhan@purestorage.com,
	dgiani@purestorage.com
Subject: [PATCH v2 2/2] x86/mce: Rename MCE storm handler parameters for storm mode
Date: Wed, 12 Aug 2026 16:15:14 -0600
Message-ID: <20260812221514.598842-3-jrangi@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812221514.598842-1-jrangi@purestorage.com>
References: <20260812221514.598842-1-jrangi@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function parameter "on" doesn't make it clear what exactly is being
turned on. This parameter is set to true when storm mode is activated.
On AMD, storm mode disables the bank's threshold interrupt. A value of
"on" actually means "interrupts off."

Rename mce_handle_storm(), mce_intel_handle_storm(), and
mce_amd_handle_storm() parameter "on" to "in_storm_mode" to disambiguate
its meaning.

Signed-off-by: Jasjeet Rangi <jrangi@purestorage.com>
---
 arch/x86/kernel/cpu/mce/amd.c       | 4 ++--
 arch/x86/kernel/cpu/mce/intel.c     | 4 ++--
 arch/x86/kernel/cpu/mce/internal.h  | 8 ++++----
 arch/x86/kernel/cpu/mce/threshold.c | 6 +++---
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 04accdee6aab..46880af61fd0 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -862,9 +862,9 @@ static void amd_deferred_error_interrupt(void)
 	machine_check_poll(MCP_TIMESTAMP, &this_cpu_ptr(&mce_amd_data)->dfr_intr_banks);
 }
 
-void mce_amd_handle_storm(unsigned int bank, bool on)
+void mce_amd_handle_storm(unsigned int bank, bool in_storm_mode)
 {
-	threshold_restart_bank(bank, !on);
+	threshold_restart_bank(bank, !in_storm_mode);
 }
 
 static void amd_reset_thr_limit(unsigned int bank)
diff --git a/arch/x86/kernel/cpu/mce/intel.c b/arch/x86/kernel/cpu/mce/intel.c
index 4655223ba560..3e3cbdc4fedd 100644
--- a/arch/x86/kernel/cpu/mce/intel.c
+++ b/arch/x86/kernel/cpu/mce/intel.c
@@ -147,9 +147,9 @@ static void cmci_set_threshold(int bank, int thresh)
 	raw_spin_unlock_irqrestore(&cmci_discover_lock, flags);
 }
 
-void mce_intel_handle_storm(int bank, bool on)
+void mce_intel_handle_storm(int bank, bool in_storm_mode)
 {
-	if (on)
+	if (in_storm_mode)
 		cmci_set_threshold(bank, CMCI_STORM_THRESHOLD);
 	else
 		cmci_set_threshold(bank, cmci_threshold[bank]);
diff --git a/arch/x86/kernel/cpu/mce/internal.h b/arch/x86/kernel/cpu/mce/internal.h
index a31cf984619c..3f709faa7f1c 100644
--- a/arch/x86/kernel/cpu/mce/internal.h
+++ b/arch/x86/kernel/cpu/mce/internal.h
@@ -41,7 +41,7 @@ struct dentry *mce_get_debugfs_dir(void);
 extern mce_banks_t mce_banks_ce_disabled;
 
 #ifdef CONFIG_X86_MCE_INTEL
-void mce_intel_handle_storm(int bank, bool on);
+void mce_intel_handle_storm(int bank, bool in_storm_mode);
 void cmci_disable_bank(int bank);
 void intel_init_cmci(void);
 void intel_init_lmce(void);
@@ -49,7 +49,7 @@ void intel_clear_lmce(void);
 bool intel_filter_mce(struct mce *m);
 bool intel_mce_usable_address(struct mce *m);
 #else
-static inline void mce_intel_handle_storm(int bank, bool on) { }
+static inline void mce_intel_handle_storm(int bank, bool in_storm_mode) { }
 static inline void cmci_disable_bank(int bank) { }
 static inline void intel_init_cmci(void) { }
 static inline void intel_init_lmce(void) { }
@@ -269,7 +269,7 @@ void mce_prep_record_per_cpu(unsigned int cpu, struct mce *m);
 #ifdef CONFIG_X86_MCE_AMD
 void mce_threshold_create_device(unsigned int cpu);
 void mce_threshold_remove_device(unsigned int cpu);
-void mce_amd_handle_storm(unsigned int bank, bool on);
+void mce_amd_handle_storm(unsigned int bank, bool in_storm_mode);
 extern bool amd_filter_mce(struct mce *m);
 bool amd_mce_usable_address(struct mce *m);
 void amd_clear_bank(struct mce *m);
@@ -302,7 +302,7 @@ void smca_bsp_init(void);
 #else
 static inline void mce_threshold_create_device(unsigned int cpu)	{ }
 static inline void mce_threshold_remove_device(unsigned int cpu)	{ }
-static inline void mce_amd_handle_storm(unsigned int bank, bool on)	{ }
+static inline void mce_amd_handle_storm(unsigned int bank, bool in_storm_mode)	{ }
 static inline bool amd_filter_mce(struct mce *m) { return false; }
 static inline bool amd_mce_usable_address(struct mce *m) { return false; }
 static inline void amd_clear_bank(struct mce *m) { }
diff --git a/arch/x86/kernel/cpu/mce/threshold.c b/arch/x86/kernel/cpu/mce/threshold.c
index 6c370d5af5bd..ca19b5b7ffce 100644
--- a/arch/x86/kernel/cpu/mce/threshold.c
+++ b/arch/x86/kernel/cpu/mce/threshold.c
@@ -70,14 +70,14 @@ void mce_set_storm_mode(bool storm)
 	__this_cpu_write(storm_desc.poll_mode, storm);
 }
 
-static void mce_handle_storm(unsigned int bank, bool on)
+static void mce_handle_storm(unsigned int bank, bool in_storm_mode)
 {
 	switch (boot_cpu_data.x86_vendor) {
 	case X86_VENDOR_INTEL:
-		mce_intel_handle_storm(bank, on);
+		mce_intel_handle_storm(bank, in_storm_mode);
 		break;
 	case X86_VENDOR_AMD:
-		mce_amd_handle_storm(bank, on);
+		mce_amd_handle_storm(bank, in_storm_mode);
 		break;
 	}
 }
-- 
2.50.1

