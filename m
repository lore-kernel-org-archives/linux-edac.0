Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493010;
	b=1NwruwOIZTEVsPfHy9xzspf/AJ0M+Q1jEht5FbcdO0iR+K0idXSUGiic85WKWoj47wLA
	 rkgpt1Lpv70HyAEKxOueo8UKzDKi+7ZkaUnu17epRI1Wz/4tyoJt+hllFyKtc8A8Ajj1O
	 4HkUcdW/5aZoyaIugDHXp6Kx93zCXcwti+CyczKd8DdBiUIbZqQIcNSXUfSmk8mx5FvjD
	 RKkosrsZK5HsTw5FKi290upehyetxTpkupMUO03WL2/sgXiIAaBMekC/JOxuaXxwdNqcf
	 1vRU524i/A25IWjPRMr2bX/cG7/cBE8C0IZKuK3ppqv6rkpqHCJT7gLD7nfgBq0fs4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/9f6mqKQKIDfPizUVF1MsoBaBzc3N5Aydnd1/G+cFzg=;
	b=WB0yJ1lZVtTP7br7AX5L4Y9raQGqJKlK9gMaytGC+MHaWDOr84prPHzL/Z1NBRLPezZa
	 ZrPIBKe9MxdX4PnyZ3PsMQrvbdmEkRz6rH+T1mjBqe0f9UoP7UaQ6cJ/eX/dZ/rbwH2uS
	 e0JAbhoiVcIkXJ0K06ortjCzqCqpK0+vt35IseYVZ9cm/3uaTWZKKR3REjl57YWiR1UZU
	 QSyTIV/Mn2NrgGhHfnvTT7RPGif+DPVdBKMnJempGhRpw46qzyFgLhIEdTOSHI6w7sMhw
	 XER3dAK4NqTmRddJ9ZZ3bmlWFpMtjVoVvmWZ1DwWi07bsaDaWDPI0Xt4bhyoC1oOBAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="wYl13/bc";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AF7606A32A
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79AF7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wYl13/bc
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2634619f8f.0
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493008; x=1793097808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9f6mqKQKIDfPizUVF1MsoBaBzc3N5Aydnd1/G+cFzg=;
        b=wYl13/bcW6h7jm0NlPFF3MGLZ97CTfX0Wpafvc9tQWepEXueLGfBdPSIJg0IraucrA
         6ybo67jpt7pHOuWwn9Tf3Y/rOD7THSA83NtwmhyyjHJUZIrAjmvAfbMgUwmuJ9lTNNa9
         haukNUa0sRQ2BPbRSD7snoKZFGOpYE+cMuVQWRijY9iqkARRx9v8N4R804OU8KAPPXzR
         tYfuBo9qUMzkEBxaZXFcS1pNZfFAbuJyste6FsZJvEbW/F9lrtT5pzUidHGNGjR5kkFI
         03ReEVhFCs4TG6Figg1nZPTTVD3PQihCuFk7xJkZAcjmsq45NjoC5OhZwqqdltCWIoV2
         M1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493008; x=1793097808;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9f6mqKQKIDfPizUVF1MsoBaBzc3N5Aydnd1/G+cFzg=;
        b=SDO271CeHMFcYJrQdUFG/edg5FbjYdcqEunMjBoIn45CSXVDm/YWQx5yXigZ3vizWe
         mR85jIFxsimTpLZ4CFO006CWCyeGbcl8OM7ypspFfHWiuD0J8irezaRciNlySXeXUJ4+
         xGDA5gpNi7Ua5cZL0PlTlcsMto59os8ytce8x6RZ39IAf8D5VxfUH7t9kHYJOMPVwQgn
         R7FFct4rJHtWKZN/my+OBckKBALMD90U74UdVtUqVoFKINXtX/l9X4Knf/FqA6tCKQRR
         dL67ncGB7MkOKYj625DhODLXWSlhnfDUrUp88lXH2SabXZ0ODZl4EqvKNbEetZTMJ5ID
         v2Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzFlhM+2PAIcfVXJ9zsCfu7daefdkfpMT2UZhVXCMs66NbFG+vICj4PipDOPbwmVYngSBghMl2qLIPn@vger.kernel.org
X-Gm-Message-State: AFq9FYLORs+Qb527zSw34wRla5xXh05qnxjZW9hLdq+W8MsXIPi8LTHT
	vzQVZEkXwDvvdFBIeldoU3t1q723XejaJ37PRsz2Gj/rFSFJ6+G2Y5tbnOnFVjGhA/4=
X-Gm-Gg: AYBFou2uaninzI2LM+FHR62dAti55s6jHd0zlKGPzSouHt7fiQAlhJnCUpfJKDXHv+R
	XVo7VudF9GUYRfeFrMNUBhqsGOtjoCPtrvGr7PfZwjJHgVE5fBINJoUWWrhoKOlbCTz2y5dN/IO
	CAHPjS+BJTThwE0w+y5/Rb+kA/MTjAaIaO3Bc0daYtV0aDDbkRDkEpVEvtEqEL2ACQOu8h6FOUu
	smch6ehM2oQ+TroTJlqkEsL4evlvQHmYxtiazvFAySJPB53Lhe6ta+oTNYiZ37Nq7R7I5eiw3/Q
	dTXF4E8KE8zAt9yht3RK7S/Mq5YWfwIfSjxTAPAFKxJWiVNivqdFo7rXAP5h8FlNW4EXgIYCLL3
	7svGhP6GO8/LdcGRWUps8M5d5c1jZ96hzGlnM7VAnEOeeqKJOVvvkuVJ63FG/6MjKI2G7yWUjcH
	9YfkD7A5PWVkb6f9dSJu9stA3EAWEL5mlRTLJPr5txSSUgsdsY9lLP9K0ihI6UPUTOxvWk+g==
X-Received: by 2002:adf:f806:0:b0:48d:f99d:a0cf with SMTP id ffacd0b85a97d-48e07bbe7b8mr15132244f8f.16.1792493007847;
        Tue, 20 Oct 2026 03:43:27 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm5154655f8f.31.2026.10.20.03.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 08ED15FCBC;
	Tue, 20 Oct 2026 11:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Song Gao <17746591750@163.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Bernhard Beschow <shentey@gmail.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Walk?= <bwalk@linux.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	David Woodhouse <dwmw2@infradead.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-ppc@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	linux-edac@vger.kernel.org,
	Glenn Miles <milesg@linux.ibm.com>,
	Chao Liu <chao.liu@processmission.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Gautam Menghani <gautam@linux.ibm.com>,
	Xianglai Li <lixianglai@loongson.cn>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Chinmay Rath <rathc@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Amit Machhiwal <amachhiw@linux.ibm.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 11/23] accel/kvm: port kvm_arch_process_async_events to KVMCPUOps
Date: Tue, 20 Oct 2026 11:43:05 +0100
Message-ID: <20261020104320.3686723-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The most complex async handling is for x86 which checks for various
exceptions and if the irqchip is not handled in the kernel for
interrupts. Most of the others just reflect if cs->halted has been
set.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/accel/kvm/cpu-ops.h | 9 +++++++++
 include/system/kvm.h        | 2 --
 target/i386/kvm/kvm_i386.h  | 1 +
 accel/kvm/kvm-all.c         | 2 +-
 target/arm/kvm.c            | 5 -----
 target/i386/kvm/kvm-cpu.c   | 1 +
 target/i386/kvm/kvm.c       | 2 +-
 target/loongarch/kvm/kvm.c  | 3 ++-
 target/ppc/kvm.c            | 3 ++-
 target/riscv/kvm/kvm-cpu.c  | 5 -----
 target/s390x/kvm/kvm.c      | 3 ++-
 11 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/include/accel/kvm/cpu-ops.h b/include/accel/kvm/cpu-ops.h
index 8b2aabd3c2f..cbd3935ba4d 100644
--- a/include/accel/kvm/cpu-ops.h
+++ b/include/accel/kvm/cpu-ops.h
@@ -35,11 +35,20 @@ struct kvm_run;
  *               (or unhandled sub-cases of KVM_EXIT_SYSTEM_EVENT).
  *               Returns 0 to continue execution, or an EXCP_* code (or negative
  *               error code) to exit the CPU execution loop.
+ * @process_async_events: Optional callback executed at the start of
+ *                        kvm_cpu_exec() while holding the BQL to process
+ *                        pending asynchronous events (such as interrupts,
+ *                        resets, or MCEs). Returns non-zero (typically
+ *                        cpu->halted) if the vCPU should not run and should
+ *                        return EXCP_HLT, or 0 if execution can proceed.
+ *                        May be NULL if the target does not require event
+ *                        processing before execution.
  */
 typedef struct KVMCPUOps {
     void (*pre_run)(CPUState *cpu, struct kvm_run *run);
     MemTxAttrs (*post_run)(CPUState *cpu, struct kvm_run *run);
     int (*handle_exit)(CPUState *cpu, struct kvm_run *run);
+    int (*process_async_events)(CPUState *cpu);
 } KVMCPUOps;
 
 #define TYPE_KVM_ACCEL_CPU "kvm-accel-cpu"
diff --git a/include/system/kvm.h b/include/system/kvm.h
index 82d18d79dc0..8c705d21f79 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -333,8 +333,6 @@ extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
 
 void kvm_arch_accel_class_init(ObjectClass *oc);
 
-int kvm_arch_process_async_events(CPUState *cpu);
-
 int kvm_arch_get_registers(CPUState *cpu, Error **errp);
 
 typedef enum kvm_put_state {
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 5bcc9b51214..bff587a56de 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -36,6 +36,7 @@ void kvm_arch_reset_vcpu(X86CPU *cs);
 void x86_kvm_pre_run(CPUState *cpu, struct kvm_run *run);
 MemTxAttrs x86_kvm_post_run(CPUState *cpu, struct kvm_run *run);
 int x86_kvm_handle_exit(CPUState *cs, struct kvm_run *run);
+int x86_kvm_process_async_events(CPUState *cs);
 void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 33fa47bddf0..e8a26a9f067 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3459,7 +3459,7 @@ int kvm_cpu_exec(CPUState *cpu)
 
     trace_kvm_cpu_exec();
 
-    if (kvm_arch_process_async_events(cpu)) {
+    if (ops->process_async_events && ops->process_async_events(cpu)) {
         return EXCP_HLT;
     }
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 914f8e3b089..06b133ebf53 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1619,11 +1619,6 @@ bool kvm_arch_stop_on_emulation_error(CPUState *cs)
     return true;
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
-{
-    return 0;
-}
-
 /**
  * kvm_arm_hw_debug_active:
  * @cpu: ARMCPU
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 6b75eb038e1..163d60a1060 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -238,6 +238,7 @@ static const KVMCPUOps x86_kvm_cpu_ops = {
     .pre_run = x86_kvm_pre_run,
     .post_run = x86_kvm_post_run,
     .handle_exit = x86_kvm_handle_exit,
+    .process_async_events = x86_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index dfc70eac3db..83c4451cf31 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -6040,7 +6040,7 @@ MemTxAttrs x86_kvm_post_run(CPUState *cpu, struct kvm_run *run)
     return cpu_get_mem_attrs(env);
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+int x86_kvm_process_async_events(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index b23031007c2..600903a2280 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -1517,7 +1517,7 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+static int loongarch_kvm_process_async_events(CPUState *cs)
 {
     return cs->halted;
 }
@@ -1644,6 +1644,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
 static const KVMCPUOps loongarch_kvm_cpu_ops = {
     .handle_exit = loongarch_kvm_handle_exit,
+    .process_async_events = loongarch_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 25aaefd7649..e52f0b84ee3 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1336,7 +1336,7 @@ int kvmppc_set_interrupt(PowerPCCPU *cpu, int irq, int level)
     return 0;
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+static int ppc_kvm_process_async_events(CPUState *cs)
 {
     return cs->halted;
 }
@@ -3074,6 +3074,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
 static const KVMCPUOps ppc_kvm_cpu_ops = {
     .handle_exit = ppc_kvm_handle_exit,
+    .process_async_events = ppc_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 8944961a939..a5333083765 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1635,11 +1635,6 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
-{
-    return 0;
-}
-
 bool kvm_arch_stop_on_emulation_error(CPUState *cs)
 {
     return true;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 967706a87e1..420703f7683 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -984,7 +984,7 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
     }
 }
 
-int kvm_arch_process_async_events(CPUState *cs)
+static int s390x_kvm_process_async_events(CPUState *cs)
 {
     return cs->halted;
 }
@@ -2651,6 +2651,7 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 
 static const KVMCPUOps s390x_kvm_cpu_ops = {
     .handle_exit = s390x_kvm_handle_exit,
+    .process_async_events = s390x_kvm_process_async_events,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
-- 
2.47.3

