Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC433B05A6
	for <linux-edac@vger.kernel.org>; Sun, 27 Sep 2026 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522358; cv=none; b=FTmDXFNKeu4wPnLwSmM2/M6kBoUud2s9LSfp0t3YzRK+ON5dsbz1PRU4tF8uyCa6mENc4RWVUsWkaJPieTr4/cJQIoqdRlCgAQw1PbkCHiUhXlzWlx67U7zL08dZsZCsLy/GlnUFNkxY3y7zo7umhf7x7hqVMJqDipALoE9P4JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522358; c=relaxed/simple;
	bh=8si9RZxezPar4+TwY5ISb2I2gRWg47WZ34xPxIIrTrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jm9EQT9V6KRCGEpiPGkhuTOq0oRzhd7tnlSahpWic16/G/ZZH+oExQ0fi+EmoVJSQlMQ00t9SJgeYiB0Vb5UhxYkgxwk8d9J6X0/ikyiI9k+cK3RdxlSRtsJtYdLX1/Yba4JU86vcQYeA6LPOr+2i6zFZVRpM0rchNY/LFaWni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com; spf=none smtp.mailfrom=adrianschlegel.com; dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b=H4E+dBi1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b="H4E+dBi1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1262392f8f.1
        for <linux-edac@vger.kernel.org>; Sun, 27 Sep 2026 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20251104.gappssmtp.com; s=20251104; t=1790522354; x=1791127154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKtijRIiV6/KSSi0SUtLMopEk8t2rvtSuKt4edIOUPc=;
        b=H4E+dBi1EuT7BBjl+lEoMEJgP/ZeqtdfMikDTALt+0aBw0br2d4vBL6MWDNS0L9awh
         jCNNSrMN1c3LcP7ZORkiam6PTaeic7qs/+3AVpqcAIPQxIiqAAPsYr1WLxzVexkwq1Ut
         yhbjS9B7qHGU1PjG2LSkbLHdsGhcQMhS0PZLk5h2CeobCEL0JSezOn5MO3np2BDVTK79
         hx0JpirrVSx3RvqK5pHRebfxz7lT9PWFfQ0w/ovllqTJwijpkVz9mmL/5/wZH7eaHSxn
         d06Y54eMjndq9fyLoAMKHymv5QfLqilYXpB93wPSjrSDHdtzIe3MZ3yb8wMPBtWt3/vx
         /JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790522354; x=1791127154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKtijRIiV6/KSSi0SUtLMopEk8t2rvtSuKt4edIOUPc=;
        b=MxF+vBobvh4+vvK2YwyL922U8m+qV/Y3FZoLel2C4U53BdqZ9Q4Kh2dS/X9vm/qlwT
         Ml7TZBbOC1vgCcX/VB2SsXz+LImpVR2N6ZkGsf9qKme0sJ68v4u8107/MmZQyTJkB4Vo
         tNMXWymmFnDFGuuNtfgkqaNP5LH8YLeZZ4TxchgMTOPaemVbO8y0CKbsshHAR4CO3DKq
         uqQcThc9tyTilfXTIRnBUKf5Dw26Psa/NkHsCRDUXg4RwqMBRVJPSyGqCy3qD7k/4AqK
         YinUXA5DdgY8Sh5F5TJLZcusLwwjAEw4DtXdcd6rysXrnDzG+/oI44QwUhr6/N/oevtz
         BAsA==
X-Gm-Message-State: AFq9FYJ8gvO5m8/Qi3F806Qe0nHHF/IYx2EMD+DnODxXCEi3vzj5WIRf
	igGu/ffUeCANu73wNiDL1JnEXEZJvQaCfCMoWNRr+uCZfq5v311Qp4GTOAtfs5NEgDp14aumAnG
	pkVMW6hfu
X-Gm-Gg: AYBFou3yBm5ItItvADPsC756RQc+eQGek/+pjTncAwrF6eeAj5RlXnYv16igPZYhdW/
	raueNW8kPODuMYZ7+KduB9p6BK6pJugbU1qnBFLDTFS7TV6KE4KFB5ZsCaBb++JWOzx8Am3gua2
	ge9eaezhV675N3NwtfOgvp4zJpwPBqxqtEuo/gcZ1h7bAksl37j6BH4XOMwpK8YOKgrj+1Cue3I
	dfOWTBFAJ95AJqbHW/4nukYNyY1UYgM/UxqW5bmCyGRrBSNiQYr1nll/wcM8bx6vPjOdtL7J8/W
	euguyTvMR/yw8cIzSl42QnehDhfnXs6E1IsXOs8oIkZZhT3f8AuhsXXkl3FF1wjd/lOCxYygWqQ
	n8qqwIZaT9umMo1my9+/ByOsjx5B5AV05K3D8aBDRAnhnApB99yaHJ6DCqmXnQE7r4IQNJf/ynJ
	G3hEgYUDoICz7I/uuCfGTBunwXYyCG1+Na4rKzSLk/M7IpmXnsKXQ0FResHGZ3HwUfpQPhWP1lb
	g/+gpROt4MC9mM+rWrjz/Br/LLsSfcbTtKgTTSSTQ==
X-Received: by 2002:a05:6000:490d:b0:488:845b:4bc with SMTP id ffacd0b85a97d-488845b065amr8917944f8f.11.1790522353472;
        Sun, 27 Sep 2026 08:19:13 -0700 (PDT)
Received: from Adrian-Arch ([2a02:168:96c6:1:452b:38d5:263b:6319])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6470b7sm21231770f8f.27.2026.09.27.08.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:19:12 -0700 (PDT)
From: Adrian Schlegel <me@adrianschlegel.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Schlegel <me@adrianschlegel.com>
Subject: [PATCH] RAS/CEC: Only count corrected DRAM errors on Intel
Date: Sun, 27 Sep 2026 17:19:04 +0200
Message-ID: <20260927151904.30524-1-me@adrianschlegel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cec_notifier() is meant to consume only correctable DRAM errors, as its
comment says, but it relies on mce_is_memory_error() for that. On Intel
and Zhaoxin, mce_is_memory_error() also accepts cache hierarchy errors
(MCACOD 000F 0001 RRRR TTLL) and generic cache hierarchy errors
(000F 0000 0000 11LL). That check was added in fa92c5869426 ("x86, mce:
Support memory error recovery for both UCNA and Deferred error in
machine_check_poll") for uncorrected errors, where a cache error with a
valid address can point at poisoned memory.

For corrected errors this does not hold. A corrected cache hierarchy
error means a bit flipped in the cache and was fixed there. The reported
address only names the line that happened to be cached. Counting these
in the CEC makes it soft-offline healthy DRAM pages, and with the Intel
action threshold of 2 from d25c6948a6aa ("RAS/CEC: Reduce offline page
threshold for Intel systems"), two such errors on the same page are
enough.

This was observed on an i9-9900K without ECC memory and with a faulty
core. Bank 3 on CPU 1 reports thousands of corrected cache errors
(MCACOD 0x0135, 0x0151, 0x0179, ...) with addresses spread over the
whole physical address space. Within one hour the CEC made 502
soft-offline attempts on 159 distinct pages. 453 failed because the
page was in kernel use, the others took healthy pages offline:

  RAS: Soft-offlining pfn: 0x100250
  mce: [Hardware Error]: TSC c43a09e330 ADDR 1002504c0 MISC 2514285
  Memory failure: 0x100250: unhandlable page.

  RAS: Soft-offlining pfn: 0x24f6c8
  mce: [Hardware Error]: CPU 1: Machine Check: 0 Bank 3: cc5ffdc000100151
  mce: [Hardware Error]: TSC 21903b589a2 ADDR 24f6c85c0 MISC 2516485

This affects any Intel system with CONFIG_RAS_CEC=y and a core that
repeatedly reports corrected cache errors, with or without ECC memory:
healthy RAM is lost until reboot and HardwareCorrupted keeps growing,
pages that cannot be offlined are retried over and over because the CEC
drops the element after each attempt, and the messages point at failing
DRAM while the defect is in the CPU.

AMD already restricts this to DRAM ECC errors since c6708d50f166
("x86/MCE: Report only DRAM ECC as memory errors on AMD systems"). Do
the equivalent for Intel and Zhaoxin, limited to the CEC.

Add a helper cec_is_dram_error() to drivers/ras/cec.c and use it in
cec_notifier() instead of mce_is_memory_error(). On Intel and Zhaoxin
it only accepts memory controller errors, i.e. MCACOD matching
000F 0000 1MMM CCCC, which is the first of the three checks in
mce_is_memory_error(): (status & 0xef80) == BIT(7). For all other
vendors it falls back to mce_is_memory_error(), so AMD and Hygon behave
as before.

Corrected cache hierarchy errors are no longer counted by the CEC.
cec_notifier() returns NOTIFY_DONE for them, so they still reach the
default notifier and are logged as before. mce_is_memory_error() itself
is left unchanged because other users, like the nfit driver, rely on it
for uncorrected errors. The action threshold and the handling of
uncorrected errors are not touched.

Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected
cache error (status 0xcc5ffc0000100179) is no longer counted and its
page stays online. A corrected memory controller error (status
0x8c0000000000009f) is still counted and its page soft-offlined.

Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
---
 drivers/ras/cec.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c..aa3fa633a 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -531,6 +531,24 @@ static int __init create_debugfs_nodes(void)
 	return 1;
 }
 
+/*
+ * Only corrected errors reported by the memory controller say something about
+ * the health of a DRAM page. Corrected cache hierarchy errors originate in the
+ * cache itself, their address only names the line that happened to be cached.
+ */
+static bool cec_is_dram_error(struct mce *m)
+{
+	switch (m->cpuvendor) {
+	case X86_VENDOR_INTEL:
+	case X86_VENDOR_ZHAOXIN:
+		/* Memory controller errors: MCACOD 000F 0000 1MMM CCCC */
+		return (m->status & 0xef80) == BIT(7);
+
+	default:
+		return mce_is_memory_error(m);
+	}
+}
+
 static int cec_notifier(struct notifier_block *nb, unsigned long val,
 			void *data)
 {
@@ -540,7 +558,7 @@ static int cec_notifier(struct notifier_block *nb, unsigned long val,
 		return NOTIFY_DONE;
 
 	/* We eat only correctable DRAM errors with usable addresses. */
-	if (mce_is_memory_error(m) &&
+	if (cec_is_dram_error(m) &&
 	    mce_is_correctable(m)  &&
 	    mce_usable_address(m)) {
 		if (!cec_add_elem(m->addr >> PAGE_SHIFT)) {
-- 
2.55.0

