Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203229;
	b=XPWwBQ4fNoHLPBxLlHQ657hhOYAgJ1ADI63Ejh1/5+l2z5L1cR8aL6EBC6w/q+lgVDc7
	 2mipml9qrX+MepfH3mYme2P8m10M22z9/tULnozvi/eM6gQ3IKV/lM+EFAIyj/Y28OTT6
	 pwK1lyU7js0RdoVYMuI4TPyiJ+ixXs86HhT8QpQfrwGZAgw5rExV4y4e5ngKZ99+g/+O6
	 zUIaAI5STG97dNVXh5zZqkceLy6xzYmLivZ46sVUlD6wfYg0zJGZF6WB6HkG2Sn50cvxw
	 tYcqgLCIlxiqj//3eap95gGirsvE4gLDnF1FteMCHiGbr8FlqAfSdu0g1jD1qzVNe8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=CbEMQyFndEQPpa9CfnVe3JHR8goha/OLm3NFkyD+X70=;
	b=3PkTs4iMJi+S4ZDqdFw+DmvQgVeWktZm6BWyD5t0nHKsrn1jWNo0W0n8Fy3Fa88Aqv63
	 mMRhEDwaMqGaHj78j4UUKtU2vbE4oUKQtHW2Ijub668l0oTMaoSvwgFg5HToEKI53nSwt
	 bqu+atWhXwAIoicmQKFvHcxEJ7DzK7xyUHk4BsU3YUNO2ERdyG4FeWg8HWXoFiuVDqx0b
	 XXQhhN/1x1pGVy6vD6uQLxJUMOUBCAeobeRl03nDhSIi0J3n5/YP4NSHga6IKWJ5DVe4v
	 KXT3icp+YWi+GOfnQXrz7xwHt/copofdtPgWmxSHm8Tp3Owusj8GJ0Qq/fmqsHsL7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYz9wkit;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BAC606A6DF
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 19:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BAC606A6DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYz9wkit
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b503e2a87bso13944287b3.3
        for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 11:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203225; x=1795808025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbEMQyFndEQPpa9CfnVe3JHR8goha/OLm3NFkyD+X70=;
        b=DYz9wkitjKu8+ehJ+L+PeaKc1T1nAXAI53L57Co/nwm5HiLJb/0LrjVFxGqbdsF/vE
         72WKpQwLn5hdJbjNWeeoiTH8mySwWP8OA2zeNTkDKZ6gOB3ax8WCUgfZ8hL1yyR+Ga7h
         ZvvwEeSE/VCspVZMEDaYpYV8f2SmhUZ8qiRjWINwLGG2f5fLWTJTpHAK3+OATLTe9t0a
         0zTxUC2K5P4lCX6gv2o1tEBVngC5+bkHv9Y1QD1bKWqpMjrKvfmEwieHxmi45ZmljrDc
         iYRqG8At941qXAbC0YffTquwYPJg8zo+Q/X9I017ouQCEt4tCGUH0L3Tyqk8BHjToLSj
         YVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203225; x=1795808025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CbEMQyFndEQPpa9CfnVe3JHR8goha/OLm3NFkyD+X70=;
        b=00euP4FJFdojPYmuC2WhLC1yoAGElIKrbGJQRZlyA2RL9Zs62MvBtW4z7sS4xNJj+D
         Atsk+CtwZVNKxqAJvRTXdiKjw1qkz/BzWzHdYjRH6Gz0Q1QlFaUU2hexbvjvse6W+76P
         WiXEznLuxHYl7b5l1AcxhjscXgY7rBm49rgsPG2JJ87ZBOEol/dZFD5J5M6v/p7KY+4a
         z+aG6Hi9evhN1H90M1o/LGKgC9iY2eNR3fKe+r4b2aS6fcn6iBkYJScL763UKwapsuGb
         vQhI+BotdY4P39uYGfBWBfBPbqU/r4w8k2lAf3GfMkSnf7+4pqMwLWYDya2+2n1kMxzl
         T+QA==
X-Forwarded-Encrypted: i=1; AL+hErHoEOnBqaWaAVmJCFvhhCLOfqtNSAcrYORGQYqKw0fH4ED7LOG06IVk+zTQJVtBCpSmjbYkg8uwmuzr@vger.kernel.org
X-Gm-Message-State: APuU4Z9RSvbU/SVjkZxWde/ZfhGsoQ9afOIQqlFA8D4ureAmySYw/cBE
	a8WCuSP2qWYdsacyB2CDta0ECc8SIetxoL4HFljc1Hf6wmGS0b2RJqCI
X-Gm-Gg: AZFdTZfGBzGRE1OhBIeF0qoMMHjMZfNudmEScJjBl3G67Ew6I8ZDlCBM0WvN9m39uMw
	x5vTNFsTXNcPUn42UpBwMn6X3ie5UPeQw9SpSEALeBNdSD7M8rcG08OX9o2sbGQogHYrpWzAqD1
	uF4IMNpTGraK4EtKkKKuHz2lCdXWupkoPmHjQyZ/bflmwbhYZFRV4d+jBOd6YWd2pbhZYm7B/Ag
	iKH/iMAd/AgUIFUGJiJ+t8AJuvT5zhKGcbNeGDY6XsK+MXuJ3lAOWtmmVfhjSS/8wTR/PKfUyqT
	pRPOZNBe3vS7gJ4raQ/w30J/aXeYzxuPaYDp46r1yP19xpQFZ0b7npWvujJ00EQQBnNI9+734Gu
	d5l1i5Ga/6zQiRscFwY5wrhgefRupdeS0XkSzTJZpDo6obNQ8lg4AuP3GKfV9vyb5uCTWhdiH9F
	rf8iDT/qrnLQWGTUWwqpuVB8XLHV7fBWDxuz86InYD8w5Z9vBfqUoNOOMiQxXsar4zk0vfWHDBF
	UcBtva4/UG6iIzZ7fsmGWHZ9Bc14h3G2KOORaKSKaYJyy9LASFU3febgst51WbUBk2F8pPdPpuJ
	Dqi0ED4hNSHH9AyilGop7AkVDffC3RwqSaVr6ulqiVP5Y6lqRHrCqByxYr/uPsa22ky0pP1rpIy
	QYaZ67Z4huqFNu+1XCqH/eol1ISh0H9Snhxu+dgiKKg==
X-Received: by 2002:a05:690c:dc5:b0:8b3:4122:f464 with SMTP id 00721157ae682-8b5204f191bmr23190407b3.55.1795203224695;
        Fri, 20 Nov 2026 11:33:44 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202b085bsm17631997b3.16.2026.11.20.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:43 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:40 -0500
Subject: [PATCH 1/4] powerpc/32: Decode MPC745x L2 and L3 cache machine
 checks
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ppc32-l2-ecc-v1-1-98fc8e6e0a32@gmail.com>
References: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
In-Reply-To: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7638; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=VRO/XG2kWpmnUT7mAvBKhs8RiHjgk1isVl1A350JWDY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFkyxdpOVVbIvCupavdxTcu6K5KtLb2x/29Fn/HK9q
 iN7j1ZuxwcWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFwTf4uR4eSC4yvlz7
 591b5m+dPbm+dsz3YWzDla9mnOxl1T36qvXfeJ4ceGt511zyKV2yJMnVZsCmTffXRX8go/Dr4ya
 b286B0v2AA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

On the 745x, SRR1[MSS] means the memory subsystem detected an error, and
MSSSR0 says which: L2 tag or data parity, MPC7448 L2 ECC, or L3 tag or
data parity.  machine_check_generic() reports these cache errors as "L2
data cache parity error" and never clears MSSSR0, whose bits are sticky.

Add machine_check_745x(), which decodes and clears the MSSSR0 cache
error bits, and use it for every 745x.  Machine checks without one of
those bits still go to machine_check_generic().

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/include/asm/cputable.h       |  1 +
 arch/powerpc/include/asm/reg.h            |  5 +++++
 arch/powerpc/kernel/cpu_specs_book3s_32.h | 22 +++++++++++-----------
 arch/powerpc/kernel/traps.c               | 28 ++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index a3be81c47df3..8445533c946b 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -34,6 +34,7 @@ extern int machine_check_e500(struct pt_regs *regs);
 extern int machine_check_47x(struct pt_regs *regs);
 int machine_check_8xx(struct pt_regs *regs);
 int machine_check_83xx(struct pt_regs *regs);
+int machine_check_745x(struct pt_regs *regs);
 
 extern void cpu_down_flush_e500v2(void);
 extern void cpu_down_flush_e500mc(void);
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 541a493e13bf..82a85d44776e 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -729,6 +729,10 @@
 
 #define SPRN_MSSCR0	0x3f6	/* Memory Subsystem Control Register 0 */
 #define SPRN_MSSSR0	0x3f7	/* Memory Subsystem Status Register 1 */
+#define   MSSSR0_L2TAG	0x00040000	/* L2 tag parity error */
+#define   MSSSR0_L2DAT	0x00020000	/* L2 data parity/ECC error */
+#define   MSSSR0_L3TAG	0x00010000	/* L3 tag parity error */
+#define   MSSSR0_L3DAT	0x00008000	/* L3 data parity error */
 #define SPRN_LDSTCR	0x3f8	/* Load/Store control register */
 #define SPRN_LDSTDB	0x3f4	/* */
 #define SPRN_LR		0x008	/* Link Register */
@@ -801,6 +805,7 @@
 #define   SRR1_PROGTRAP		0x00020000 /* Trap */
 #define   SRR1_PROGADDR		0x00010000 /* SRR0 contains subsequent addr */
 
+#define   SRR1_MCE_MSS		0x00100000 /* 745x memory subsystem error (MSSSR0) */
 #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interrupt */
 #define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses 64-byte boundary */
 #define   SRR1_PREFIXED		0x20000000 /* Exception caused by prefixed instruction */
diff --git a/arch/powerpc/kernel/cpu_specs_book3s_32.h b/arch/powerpc/kernel/cpu_specs_book3s_32.h
index 3714634d194a..90ca26405c1d 100644
--- a/arch/powerpc/kernel/cpu_specs_book3s_32.h
+++ b/arch/powerpc/kernel/cpu_specs_book3s_32.h
@@ -426,7 +426,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7450 2.1 */
@@ -442,7 +442,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7450 2.3 and newer */
@@ -458,7 +458,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7455 rev 1.x */
@@ -474,7 +474,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7455 rev 2.0 */
@@ -490,7 +490,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7455 others */
@@ -506,7 +506,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447/7457 Rev 1.0 */
@@ -522,7 +522,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447/7457 Rev 1.1 */
@@ -538,7 +538,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447/7457 Rev 1.2 and later */
@@ -554,7 +554,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7447A */
@@ -570,7 +570,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* 7448 */
@@ -586,7 +586,7 @@ static struct cpu_spec cpu_specs[] __initdata = {
 		.num_pmcs		= 6,
 		.pmc_type		= PPC_PMC_G4,
 		.cpu_setup		= __setup_cpu_745x,
-		.machine_check		= machine_check_generic,
+		.machine_check		= machine_check_745x,
 		.platform		= "ppc7450",
 	},
 	{	/* default match, we assume split I/D cache & TB (non-601)... */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3a8f5416e3f6..4fb1610baa51 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -788,6 +788,34 @@ int machine_check_generic(struct pt_regs *regs)
 	}
 	return 0;
 }
+
+#ifdef CONFIG_PPC_BOOK3S_32
+#define MSSSR0_CACHE_ERR	(MSSSR0_L2TAG | MSSSR0_L2DAT | MSSSR0_L3TAG | MSSSR0_L3DAT)
+
+/*
+ * On the 745x, SRR1[MSS] means the memory subsystem detected an error, and
+ * MSSSR0 says which.  The MSSSR0 bits are sticky, so clear them.
+ */
+int machine_check_745x(struct pt_regs *regs)
+{
+	unsigned long reason = regs->msr;
+	unsigned long msssr0 = mfspr(SPRN_MSSSR0);
+
+	if (!(reason & SRR1_MCE_MSS) || !(msssr0 & MSSSR0_CACHE_ERR))
+		return machine_check_generic(regs);
+
+	mtspr(SPRN_MSSSR0, msssr0 & ~MSSSR0_CACHE_ERR);
+
+	pr_err("Machine check in kernel mode.\n");
+	pr_err("Caused by (from SRR1=%lx, MSSSR0=%lx):%s%s%s%s\n",
+	       reason, msssr0,
+	       msssr0 & MSSSR0_L2TAG ? " [L2 tag parity]" : "",
+	       msssr0 & MSSSR0_L2DAT ? " [L2 data parity/ECC]" : "",
+	       msssr0 & MSSSR0_L3TAG ? " [L3 tag parity]" : "",
+	       msssr0 & MSSSR0_L3DAT ? " [L3 data parity]" : "");
+	return 0;
+}
+#endif
 #endif /* everything else */
 
 void die_mce(const char *str, struct pt_regs *regs, long err)

-- 
2.56.1

