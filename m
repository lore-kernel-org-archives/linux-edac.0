Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5931309DAF;
	Sat, 21 Mar 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090837; cv=none; b=S4x4lSWpaeTWyeAoknalLwtckkoOZ+s5e3k16JxF+F7nXLePJ5iMnZN8fg6DyhZVpPH9pGJnhCMbS1GCM4L/7Osn7gWHMkSLW4pxqjZFcQsrTVyIxfBrU+qoYXhHmFzpKpPUEAN15Dkl/jz5dfgJI9q04xAvBoqUmZ/qCg0UxPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090837; c=relaxed/simple;
	bh=EuMqjgkVnzlucQmTRNJ9/hTEgHLYZjQVLk2IZXqdpqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ir7PMvQr76eQkRQOJgrnqxm4UYZmy5IpFLzVR3UaABbK0Ik1wU/9qGDcwaEsrn1uzwWgf2syBx0SXgm0jkgLs14ekSs26TkPPfE8bhaY0D2V99POV2gMhMXIFjILkF+WTUxA4ly6xs9vSgydVw5xAw/tZ+hoivoOS3bl2Gy8oa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=E/FnFvfd; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="E/FnFvfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090831;
	bh=7udKxhngGIBCAe9kf+WBxACbKNETrgGhIxMkfEP+XP4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=E/FnFvfdUOcW+XHXhKktb7Uc8oGxVjjDiG9/v2+5S51BTRbRzC3JANagHltQp9YNN
	 w/OG6PhXR7rZPrPGjKBa/Gaan68ZEcw59YQvpHzuFynhIoNAfEiBtzXOhdAvNEVJVq
	 bN0j69VCm8GZq+l7NEIoR5OUMkSuWx4ocF4QQrAs=
X-QQ-mid: zesmtpgz5t1774090827tabf25563
X-QQ-Originating-IP: QH2kvZ89uUrjilpXh60MoZtlxbdDB8lDxBfmA6lh1C8=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 19:00:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 127575036279744496
EX-QQ-RecipientCnt: 14
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] x86/mce: update outdated comment for refactored ex_has_fault_handler()
Date: Sat, 21 Mar 2026 19:00:24 +0800
Message-Id: <20260321110024.8723-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: MsVBbRzZvhHACsp5ElSAFp8wFBDbrBU+iS2n+LXzxlIJsz+Pt+mgpzbI
	Zwaq//ujX5BxWLcW81VwgOZ/mR55ywWJRrAfJByQ5z7P0pMaLH7uIlJ6wXqxWe1H6LTBRl+
	rOolV4aiMN/qvju7lJITpepFclv/P1msMdyQxG2801GHd8DADno/DskYAa4R7hv08wY2T0p
	RYGo9tEmevl6TKF1sa9792MqKN4wu3aCETv479VVSCE7eCRcVP9jDkkgfIYutljZP+F+cmw
	H48QsdoNfCqDU5HncXI1gYPW7cm+AtUaAvQI0jUV7dCAYnhN4GTOZISRG+neh5OSblKS+Md
	kj0ZpiI8vL7iHb8fXFRcSqvtT/esNew7/8/FErBFhhYCAVNTR4dhqiHfATDv81c9+1Fizim
	+LPiZ6hJ0rnEM0KK1zE1NtpGhgPe3CvhUjuWrloSsd7aiUkMANacvdBWcxHf+l08FSepX4x
	0wzaiNBV+2ydjZhoEUTIXSZ+XfoewtgmloMnf8Xk5OulVMGn5RV4Mjyti2dUWBPh2FMA9nU
	aiUPRHXJ6I4Vz5mmVEP+u/s4aOn6PcmkMQKSTgWZJVwYBwdPBYeED5wD6O1tXRfoghFeI0E
	Ht+6wmhRwiLAmE9IQz19R7ACdDvxQylK6Huo4hQLxYxJsnU840Qx0POHTyGCs9XKBtNEf2y
	DuLFVzndJrz7mD2f3kub8lFcqqJFUIi8GJC2w6ca1jSuEy9vG+8f7QeE3ekNE4qLfiLRUF/
	TGeyPbSIwUddoO/T2JHMzP4/7amOQ1m4Lf5RYBJoRrxfe0OvjhvVF2TUjIqeq/T9/V9o5yp
	C4eUeqqoO+HNTqo3N0d+e5eqEAauPI/jh/kYJZCsp0nUq91R7/WFzJoyW+CeIEGj7PGEZ3p
	huGk7sMnqHrCz9/nyvGPHJHIDknjUdhFMHb90JSRkVxqAf3aYic31AAN5WXgLYUuhCGgI8Y
	sAHAMlFOE9lRjrlQqnnXshIkK3ew+ipxuFxRvU9KjkS3e8INZccUalaimXjTwxJ2AEqTTAw
	katC/1c/+g/7DYfB861IiW9Iqbav5/Ay9RElSF9zum43tjPmQ2muo69JTx0lgQMOLaYXtmJ
	g9JeDYu4/a1Bw5EfSyeiMM=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The function ex_has_fault_handler() was refactored into
ex_get_fault_handler_type() by commit a05d54c41ecf ("x86/mce:
Provide method to find out the type of an exception handler"),
and then into ex_get_fixup_type() by commit 46d28947d987
("x86/extable: Rework the exception table mechanics").

The comment in do_machine_check() still referenced the old
function and _ASM_EXTABLE_FAULT().  Update the comment to
describe the current MCE-safe exception table mechanism
(EX_TYPE_FAULT_MCE_SAFE / EX_TYPE_DEFAULT_MCE_SAFE) and
the severity grading code that sets MCE_IN_KERNEL_RECOV.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 arch/x86/kernel/cpu/mce/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 8dd424ac5de8..fa9ab282cede 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1713,12 +1713,12 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	} else {
 		/*
 		 * Handle an MCE which has happened in kernel space but from
-		 * which the kernel can recover: ex_has_fault_handler() has
-		 * already verified that the rIP at which the error happened is
-		 * a rIP from which the kernel can recover (by jumping to
-		 * recovery code specified in _ASM_EXTABLE_FAULT()) and the
-		 * corresponding exception handler which would do that is the
-		 * proper one.
+		 * which the kernel can recover: the severity grading code
+		 * has already verified that the rIP at which the error
+		 * happened is covered by an MCE-safe exception table entry
+		 * (EX_TYPE_FAULT_MCE_SAFE or EX_TYPE_DEFAULT_MCE_SAFE),
+		 * from which the kernel can recover by jumping to the
+		 * associated fixup code.
 		 */
 		if (m->kflags & MCE_IN_KERNEL_RECOV) {
 			if (!fixup_exception(regs, X86_TRAP_MC, 0, 0))
-- 
2.25.1

