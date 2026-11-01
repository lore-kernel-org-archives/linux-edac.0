Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793541227;
	b=5EZ7K+dKNfRBwUVuqCuMkgls3p1HTeiUUAO58lxNwpDuPqiyxXB1PlJG83VTSQcvAdbK
	 c6aF9t3Z1lP9vn8JVFIQfD9VpMEyjS5P1HMsbhJljiglRCppvCm1bNQ7bQKs36nWCrny3
	 2oUx45LJnxneJfzHyKO/BBQ9sSFUbS2y9Y4qzMlhGqghFA2FDRkjrluj67qyi5QY6QbH0
	 xlC+5qgM4Uzrx+dSJIokeEhzFyHQWQr/xA4bNSowK8M9HMjW8/bQaRqiXNa1aH4ZspXK1
	 pTzKs/erGp5zJpj0u+7yDaSt3VkZV/fJrUAVVhsDoAlnbxYlxwqA7M2qC/+k62G6Cuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793541227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ByU4pbijH13SuxZHyk54Q+BWYd7sxBxb/2grL4zMyno=;
	b=HN87Rx4wfxyXiszuILhP1qTruJF1nt6x++5RSmfDq7tKLtWdx0OAwLMGbFwBUlTZIEZv
	 u3SD/EtCaEGGXGPS5nZvGaLSsibmF3Rf9NTidm8Y1gWfjq8ZgRiXWupA0NktZM3ywbgoy
	 pJ8JiZAeIJ/taexdX61BzXCCFjL40il86g0r/AIbPPXVCkSCO46R8C85yEXOyDlmKwct1
	 O0apLPYPI6kQAa9dvAuiHv9WPSZZiokKGZshW1pncxXFjsXtFDdhBzZUrWsuPuTHdb1Tc
	 JaAP3Nn64liioYeApGnZRQxYPjLZITD+XIy45iSTODRctPcBKchfX6NNz8zlcHlN0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b="kOnu/8id";
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE2E606A324
	for <linux-edac@vger.kernel.org>; Sun,  1 Nov 2026 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECE2E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=kOnu/8id
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso16648227b3.2
        for <linux-edac@vger.kernel.org>; Sun, 01 Nov 2026 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793541226; x=1794146026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ByU4pbijH13SuxZHyk54Q+BWYd7sxBxb/2grL4zMyno=;
        b=kOnu/8idxgf3nP98EBTacEr1UKbx35BwxgnGtNollZ1aNL6n5dpEi5sWp/f/dSodtl
         WnC4uMqpd3Pa1wbIw//Q5UaXZ4jNzcrwsWcyOtDN35s1zbY4nEGGHX+VixqCaGX63erO
         +D6bNiV3WNGOa5sU5oy1y9z1kw3J9ZAEYTHDZZf8QaEsS0iYi5zCfOZDkgg0FXJG9qlj
         w7IWfLlonBAG0RgmP0T0VnUHO2Z/2SKpm/CzJFo+cys8vCRcw3D9aFbtnhgLw/OPUnM9
         ReygVKilCXDpSlvP7wOa4QUioxS7utjQSIo+Tn2AH7h7vtMFDcc1xnzIaiVUap9tttZZ
         ILuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793541226; x=1794146026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByU4pbijH13SuxZHyk54Q+BWYd7sxBxb/2grL4zMyno=;
        b=Q18XNE8Px40wKXV7XZAR9vOTKlBE29H2LvygPnd8rt85cnId8/LDH07QYfo9oCrliy
         7NWX7ZDo85SzhwhIMxRS/HEpBxF6iDQH9XDMQ3IL+DfB4jd/utbXpqFwgwF7+2nEmGuW
         gZSUFlQqAtpSEpMJtsog+wHPEX1UPvfPxIthCXVgpOvrAFDlTj04S7VdJOjjV2LDrwun
         rII8CDmpogViLt9dI/x0InCTtkjmfH/FyEn/BNlFA7QEYIZFDXtghrPtl2MbLXNd9fV4
         SynJ/lNbMcS3PXbfgnMOPn46aMO6wla9xdeqpaQrFcwhDM6wAyLUcGtI0GJ24pApHfr0
         h0lw==
X-Gm-Message-State: APuU4Z9ryPo1bwvNXo6W/VjsQ4/z0hTpSBiaIKH58FSRfb8vmdLmZcTH
	ZUJMiirVzVrHK7qYOOVWmvQH1iLiF9akxY+BNPgWGroXiiN6QltqltrpLvGxngz+bw==
X-Gm-Gg: AYBFou2KLWzHmKs+oW5dqh0ApXqMFj2rbu2y27DAStoqhdipn/0TxG3st9c4GBYfpF9
	+TRH97DqbiWroiqU3Ycd3oA/1u+SLajjRnJagiNxdH+LDC2qIccBtvuaL7hlVxTCGEh9qTdxQOj
	TDJj9ZfDL2GVTYoiGdjPF7pU/jocp29tdV24w2pbbRIO3+0dEz4iXSH2X0LUJBVtPlJaVr3tcGc
	cmimgNb6eGh62IWRz/WICqcRTCXyD9QwhpPvN0iWgfuFvOL/7XoXmNvQfSJBCxajYi3pCqmeTKk
	++asU1yKRldVTogocm9wl459lLZkBtFneUUi1t7QOtN0c82UtDThJvBTCvBysUkUZoclmMcV1xB
	L4r3w5zjib50P6+TXYck+DqmKepnfZP8l6d2aG/Adw51KbMAK496dokPnb8SSIOXzM7rkw7/AXO
	pr/BAlLICRcZkoHE2JdMILDrsOBZ2zB9LAK97fi5i4uHFzI0jO40rZO6bg+iCDmJB6q/tiGdIdy
	GLqTn4XaFiEPwImEsCYkb0UM79JM86GEemDZVw1DhWNv4FES8t/yU6sVAwWQPCFJDePhH0=
X-Received: by 2002:a05:690c:e243:20b0:8ab:b98b:b77f with SMTP id 00721157ae682-8b2b67497aamr30646777b3.40.1793541225974;
        Sun, 01 Nov 2026 05:53:45 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7125371sm36327097b3.11.2026.11.01.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 05:53:44 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH RESEND] RAS/CEC: Drop unneeded debugfs_create_*() return value checks
Date: Sun,  1 Nov 2026 22:53:40 +0900
Message-Id: <20261101135340.2197888-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_create_dir() and debugfs_create_file() return an error pointer
on failure, never NULL. Per commit ff9fb72bc077 ("debugfs: return error
values, not NULL"), callers do not need to check the return value.

Drop the dead NULL checks in create_debugfs_nodes() along with the now
unused err label and local variables. Converting them to IS_ERR()
instead would have exposed a regression: on a real debugfs failure
(notably CONFIG_DEBUG_FS=n) the function would return -1, causing
cec_init() to abort the entire CEC subsystem.

The ras_get_debugfs_root() NULL check is kept; that helper has a
NULL-returning fallback and is the legitimate "RAS debugfs root
missing" gate.

This patch supersedes an earlier proposal that converted the checks
to IS_ERR().

Link: https://lore.kernel.org/all/20260514193202.2397348-1-ingyujang25@korea.ac.kr
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
Resending, as there has been no response since 2026-05-19.
Rebased onto current mainline; no other changes.

 drivers/ras/cec.c | 39 +++++++--------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c8efd..32c1be97bbd0d 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -480,7 +480,7 @@ DEFINE_SHOW_ATTRIBUTE(array);
 
 static int __init create_debugfs_nodes(void)
 {
-	struct dentry *d, *pfn, *decay, *count, *array, *dfs;
+	struct dentry *d, *dfs;
 
 	dfs = ras_get_debugfs_root();
 	if (!dfs) {
@@ -489,46 +489,21 @@ static int __init create_debugfs_nodes(void)
 	}
 
 	d = debugfs_create_dir("cec", dfs);
-	if (!d) {
-		pr_warn("Error creating cec debugfs node!\n");
-		return -1;
-	}
 
-	decay = debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
-				    &decay_interval, &decay_interval_ops);
-	if (!decay) {
-		pr_warn("Error creating decay_interval debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
+			    &decay_interval, &decay_interval_ops);
 
-	count = debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
-				    &action_threshold, &action_threshold_ops);
-	if (!count) {
-		pr_warn("Error creating action_threshold debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
+			    &action_threshold, &action_threshold_ops);
 
 	if (!IS_ENABLED(CONFIG_RAS_CEC_DEBUG))
 		return 0;
 
-	pfn = debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
-	if (!pfn) {
-		pr_warn("Error creating pfn debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
 
-	array = debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
-	if (!array) {
-		pr_warn("Error creating array debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
 
 	return 0;
-
-err:
-	debugfs_remove_recursive(d);
-
-	return 1;
 }
 
 static int cec_notifier(struct notifier_block *nb, unsigned long val,
-- 
2.34.1

