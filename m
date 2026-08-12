Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A6345ECC
	for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 22:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572970; cv=none; b=jUXWHPLEjS27RWkGt3JLB2+adsclGRwkmhe4Xq4hiM1E2Mlq7tcEW9Y1FN3+AePbw/rG3MslFpBdEZbRVeavkpSpA6tZbj7jV7WIv8j5xklgMqgxIKx+Mkmg9/vxRznUKs8FyWog30i5PxR4QIayNPubYA8Efl0SW6Pk/RWJ4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572970; c=relaxed/simple;
	bh=Xg/ZVWJu5SHTCV2UtojhxPC9NTEnwJ819NPQcAqkhwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkTruHJDf5SLVLMkxMhOxpja7v7yyW58LyOl67SC+YSV/QlzpaDFXt1S1NQuPvWs7vKvu7jRSeXp6Gk2RNcZXF831cwSaUMy/jmyK2Ml+QBQTcXJJSIMQty9beVMN9WYNTUN+4jTMb0zTgW9lZwE3DRFk+xhOmC0sHhmkTmrQXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Vd86fPR4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Vd86fPR4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-476a130c138so1204290f8f.0
        for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 15:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1786572965; x=1787177765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fgBN8P4tceUSpvKSwr7G8MgQI97K6qSQbnm76IzBHM=;
        b=Vd86fPR4EnIwEwoX9tt6XGeXM2G5DlPMJ9um9m9PmHIJMdMRg3brl8r9Yl5reaOd5R
         K3uHZp56i+Qfixl1dvIYl6gkZYtvmSdiTTVfLjVi25jsXXMHqWVFrbX66r7hvJHlYZMU
         eeg8pizgzVQ8Sj0IT+NGJFKcG1st/4W0Y5jiNXmCD2g2afJGx1SSRvB+3FvfAUOuGiS/
         Wz6nHOy4REmwJcQjmDhaemolgWJpwX9sA6gBRmGeti0i2LXvjsI6REf1n/gU86SfcGOD
         gvhpkqqdkV0RrsmZ+Yn/kFSFEvJl2ykStsznT0BVQBheFlCwtrfJ8Pwq+ZtlfHplyT+G
         EGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572965; x=1787177765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fgBN8P4tceUSpvKSwr7G8MgQI97K6qSQbnm76IzBHM=;
        b=d+cuIrhi32UhqwYDL9/qmYeiEXfnhYWY62ufsvnQgt7WnMOuWJF0x1u1p/HN4Hp0wl
         8f7L5TkLOE8AU9Mg24Xxv/Rrryb/l93kgkl6g52FQZ+x9Y8fUfNhiGkTK9IzW+fJlxg4
         sk+n7fKl5EquQgLoKgDGvLQ7M+Y0Q7RaMWpvYnbNPx5NoC3td1ZLQawKwGHmroIISdXe
         fH5+I4J64i6F5KEl/lceiq51lSKcfp0z8NYgh7MBr5xftTlB949n7uaXUxM5BmEMtAgg
         drFldHAIVwFjrJU9dpIpvDV64UIMSr3xE56L7v7Hx0eEn3bl/1LBhdjae9eSxueyj+JB
         mGlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4NFLtq/znmoH7sdXYUrs9m6dhYVjo2qWdvdEYS2eRJJP6rLehsizi3mJjZ3B3X9iVFXVVgLtElrIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhg1aD4fmDTBYAM0hnJar2XsCIXyDj0R+RyUNcA11q28aIEGZ
	+B9RJXn71QFt18HF85cNX+tznzauRwtZX7RxhrkGlJ8Jr+owZ6fe1dzFjGHr5HsuzL8=
X-Gm-Gg: AR+sD12LSerqZd2TOJfvkOyxpc9Ecq8vNtH8IwbckAgXJb1jrFExSrHoxkLH08k6ibr
	iM3/c7HA1AY0mjxWOXwzglZ5UQbzWgHA9WGPmwOTzW+tjaiFUjFExoyPoKmCRYF5M0i96Gpw3MV
	fJ+cjqcajTiLEjANQDKTV8rhX//Q6i/LplYJaOgzojVVs0ZWONYXUZC7573ML05hQWe0YmopiM+
	gkDitOIG187jNkrgZT/pFgeCQi1bH8NbUll3qcmAWkfBrFHLTYtGb5oyWue3vB632Y/X1+stMPj
	wsDu71xf9J9DPG1Ny67woi6TnbhTIq+Z/5SaxzEYtMeOa9Y8bsDHTbvEQ6dVyl64mr+m4uqAWXi
	8U9baK+hO04uWVQDWn17hPhYYmpSOgersIM0O+ekQF3bA0Ohhj0qHzj+dIq+8bAyiePHCslStYE
	vm7NSprCsLA1RASU/G8K+sDXJ2t8wS+3hOICXjJfGOwtzkhnQ9xNU4ccjyytwuIHMBIveQn52OP
	NIrkhKGpK0YGCE=
X-Received: by 2002:a05:6000:25f0:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-48159ca949amr1645090f8f.7.1786572965632;
        Wed, 12 Aug 2026 15:16:05 -0700 (PDT)
Received: from dev-jrangi.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815a569ab3sm933792f8f.11.2026.08.12.15.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:16:05 -0700 (PDT)
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
Subject: [PATCH v2 1/2] x86/mce/amd: Fix inverted interrupt enablement during storm handling
Date: Wed, 12 Aug 2026 16:15:13 -0600
Message-ID: <20260812221514.598842-2-jrangi@purestorage.com>
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

mce_amd_handle_storm() currently does the opposite of what storm
handling needs: it enables threshold interrupts when a storm is detected
and disables them when the storm subsides.

In addition, machine_check_poll() -> clear_bank() -> amd_clear_bank() ->
amd_reset_thr_limit() will unconditionally enable threshold interrupts,
which undoes storm mode behavior.

Fix this by disabling interrupts when storm mode is entered and enabling
interrupts when storm mode is cleared. Also make amd_reset_thr_limit()
enable interrupts when the bank is not in storm mode and disable
interrupts when the bank is in storm mode.

Fixes: 5c4663ed1eac ("x86/mce: Handle AMD threshold interrupt storms")
Cc: stable@vger.kernel.org
Signed-off-by: Jasjeet Rangi <jrangi@purestorage.com>
---
 arch/x86/kernel/cpu/mce/amd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 36e0df4d1342..04accdee6aab 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -864,12 +864,15 @@ static void amd_deferred_error_interrupt(void)
 
 void mce_amd_handle_storm(unsigned int bank, bool on)
 {
-	threshold_restart_bank(bank, on);
+	threshold_restart_bank(bank, !on);
 }
 
 static void amd_reset_thr_limit(unsigned int bank)
 {
-	threshold_restart_bank(bank, true);
+	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
+	bool intr_en = !storm->banks[bank].in_storm_mode;
+
+	threshold_restart_bank(bank, intr_en);
 }
 
 /*
-- 
2.50.1

