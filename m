Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493013;
	b=VvWBqtqY6vkTk0bBAGBQmQRtW9MJz41FUOF4r0YxdcP6PhGtCXaHRAGKPc7cWsKqec8m
	 h2P9uG7IyJCHN8cfhwuVn4K69BEjZ8ls8HCXKeBf7awZmH8/5cmhWaDvjfRCkyzolOQZW
	 rArW7PRJOgsSVkiS/QZHvXSEFPwiU67liRv55OvCTUNcZw+zKonoPnwMVsEO4BQ/fnqMb
	 o++i5OIAZd9Tr932XPleCXnm1Fix2uEgdeEhgVnDckL549J+Tt1UtiKFxViMHskhSjjEv
	 ucAI9Dh+nyDrLCObLKDm4hs1zn7XWs18tRVTLFq+7HwCK8va/uyCR0v3SJ5KSltOQpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Pr/rnTmIAiW1szyi9rDm/oGmteEimjJL3z+DQYflDO4=;
	b=DpRVITJ+W13/9f4nnD7WYwVKaKk2MTqEaY/TCIz3En6aYvQfFzweyYrYwKYX236fCe5G
	 dt9uctR7RdmKfvNKs1Pv4Ub3cjRhN8It1yuKnSbiyzHWdovjfkyQm9uASJcEKtt7JNTqj
	 u+wPTzDsvZahQJ4Ho07ZlIeXHhkck/I4pnX4KLhmMOjaEgYR7L6U3IoUY9K14I2UA+aXs
	 Fsd77QFPWdqKPHIv4c0yG+k1voXSNS81V/kZ6pz3VF1pwKdNAkGEw8mOph5rqa7lLAir2
	 CdWYfLy7tVXa6CWOAPyjRhokkEtV83/GjnqP3sRBsy6SlyAlMnSpz7PuQbTOgiwQ3Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rIU5heL+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFE960A383A
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DFE960A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rIU5heL+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso31429285e9.1
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493007; x=1793097807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pr/rnTmIAiW1szyi9rDm/oGmteEimjJL3z+DQYflDO4=;
        b=rIU5heL+NM7YQkrSz7+m4vkxplwC96mNSrg8zym0rErF8BprEy/hWAixgjz/wPCSEz
         nf5SA54Og0sKEckOzstGeDlwveCM4NxykGk4wx068z5TudDgwF6fKT65S1T4sp+b3uup
         vw45DlkS4tth30HT7KiOdDch3+uyS1ew5PHopT2kwcVPp5U2ZE22Uv773OkJ0Q89crXj
         /OTDqEjzQ/hWa7tchtLTe+en2ba0HUzTM8o2WuHbilNifVo4YP+KI6RiLadNcTmRQk9x
         7DcGy/DFzlHHms2APjJxhqPXXzhW/zchiXpx6P6AmVZhnl2zUGa0Sld2IF2qC4JhVikW
         epTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493007; x=1793097807;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr/rnTmIAiW1szyi9rDm/oGmteEimjJL3z+DQYflDO4=;
        b=vs26xOKPWkqCEVL1Z1NeuSEdXE3CINUmuj44OF65Pow/kuwcUQftaRYG3l6AHVMU56
         niEKUFPOIk7cUmoJy7MIo9U8lBPzXIekzDlDH9FiaCiGDTG1hsBLeWNEyUONvdfz50gt
         laftgfePwhNbBoTGnVM/sFdamDQVnOha930lKq8pHB71q4gX/U1CwIB5wp1HOAnw+aQE
         IUVim+0OjQ7LJ5EoFKLx4Oh1PIBIXeeJdoQDafMgWh2NezXZO14a7NlwXOVkE7zSElvV
         tG8IZ+DoId17rlT4/guR9KCu8yBCDcg68NA9tCD+ka+tgh8aFLYiCZG29gowgg67fcrO
         +KEg==
X-Forwarded-Encrypted: i=1; AKwUvBwh/YlxgS6iZ3m8iDq075SbLwK678OR5KMlCG9/T4BFMennVlq/iWVr3DBsTjDONSHtgnnFAaIEetzR@vger.kernel.org
X-Gm-Message-State: AFq9FYIDjZ+5yXP50hquzv6thCygWt7Es/SJtrS+SeCOgg99UCxH/Pe2
	yYvVabLBBvqWmBbItxI3IcbcnB+57UbVEqoz/vSf+aE8jwOZK+/j4cJ39fkYqLRsYpM=
X-Gm-Gg: AYBFou3kjBCfGchylozfsY0Qq64ZY2Ioz4yN70AYwZAqyVH/QDfq1DA3OmmoujOTRwX
	SGBkNk5AtPnbxEJUGf29o4rClr6D/yj+NHi9xk0Rx3KSCby5ri1FrLWpPplQCcUkPYkahl2a2A2
	kJg1PtBgiv1uqew42ZvenralL2sqg0NTFMzTaDfpNtB+SE86zzVv0yusgz6/Hs4Nh/i+ZhmT4cL
	PJn2U1E09Xqoy9VS0gbjkMGDiY3C8razuioGTMcux+M1w+l51Qf03hyMDzKNOA0qpIM0deA4MRW
	DmVNpFhsfbl6usgU5YR0KXbkmYBdYn+hBMP1XFmWMZGWKwmPc0YoCPO8E88oNgwGxHTur8Qj01B
	eieIP8/jvsEAg+kbelWDuf0DfbT4YrqXnBV+A0iB/VtPNe8qkq8hO3+LUt4xAjxfLQgI5ohC+N0
	KBvGdNwoNHGONVYvGKk2YKE5QHYe18zCAPLDxIToX1NzskRtW5YcZRTvYHCGGvUmtD88yZU6U=
X-Received: by 2002:a05:600c:8b43:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a1d75ad072mr215240945e9.1.1792493006718;
        Tue, 20 Oct 2026 03:43:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm57351065e9.3.2026.10.20.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4DE6B5FB4A;
	Tue, 20 Oct 2026 11:43:21 +0100 (BST)
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
Subject: [PATCH 08/23] accel/kvm: port kvm_arch_pre_run to KVMCPUOps
Date: Tue, 20 Oct 2026 11:43:02 +0100
Message-ID: <20261020104320.3686723-9-alex.bennee@linaro.org>
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

Port our first function. As a number of arches don't do anything at
this point they become nops and the call becomes optional.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/accel/kvm/cpu-ops.h | 11 +++++++++++
 include/system/kvm.h        |  1 -
 target/i386/kvm/kvm_i386.h  |  1 +
 accel/kvm/kvm-all.c         |  7 ++++++-
 accel/tcg/cpu-exec.c        |  2 +-
 target/arm/kvm.c            |  3 ++-
 target/i386/kvm/kvm-cpu.c   |  1 +
 target/i386/kvm/kvm.c       |  2 +-
 target/loongarch/kvm/kvm.c  |  4 ----
 target/ppc/kvm.c            |  4 ----
 target/riscv/kvm/kvm-cpu.c  |  4 ----
 target/s390x/kvm/kvm.c      |  4 ----
 12 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/accel/kvm/cpu-ops.h b/include/accel/kvm/cpu-ops.h
index 662d0c553c7..2c04fa5adf5 100644
--- a/include/accel/kvm/cpu-ops.h
+++ b/include/accel/kvm/cpu-ops.h
@@ -13,10 +13,19 @@
 #include "hw/core/cpu.h"
 #include "accel/accel-cpu-target.h"
 
+struct kvm_run;
+
 /**
  * struct KVMCPUOps - Target-specific per-vCPU operations for KVM
+ *
+ * @pre_run: Optional callback executed immediately prior to entering the
+ *           KVM_RUN ioctl in the vCPU thread loop. Used by architectures
+ *           that need to inject pending events (e.g. x86 NMI/SMI) or verify
+ *           injected exceptions (e.g. ARM external data aborts).
+ *           May be NULL if the target does not require pre-run handling.
  */
 typedef struct KVMCPUOps {
+    void (*pre_run)(CPUState *cpu, struct kvm_run *run);
 } KVMCPUOps;
 
 #define TYPE_KVM_ACCEL_CPU "kvm-accel-cpu"
@@ -25,6 +34,8 @@ typedef struct KVMCPUOps {
  * struct KVMAccelCPUClass - KVM-specific accelerator CPU class
  *
  * @parent_class: The parent #AccelCPUClass
+ * @cpu_ops: Target-specific KVM operations table. Must be non-NULL when
+ *           KVM acceleration is initialized for the target CPU.
  */
 typedef struct KVMAccelCPUClass {
     AccelCPUClass parent_class;
diff --git a/include/system/kvm.h b/include/system/kvm.h
index d29624034cb..e9d7b86ea4a 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -333,7 +333,6 @@ extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
 
 void kvm_arch_accel_class_init(ObjectClass *oc);
 
-void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run);
 MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);
 
 int kvm_arch_handle_exit(CPUState *cpu, struct kvm_run *run);
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
index 2b653442f4d..218ae8f09ce 100644
--- a/target/i386/kvm/kvm_i386.h
+++ b/target/i386/kvm/kvm_i386.h
@@ -33,6 +33,7 @@ bool kvm_hyperv_expand_features(X86CPU *cpu, Error **errp);
 
 int kvm_get_vm_type(MachineState *ms);
 void kvm_arch_reset_vcpu(X86CPU *cs);
+void x86_kvm_pre_run(CPUState *cpu, struct kvm_run *run);
 void kvm_arch_after_reset_vcpu(X86CPU *cpu);
 void kvm_arch_do_init_vcpu(X86CPU *cs);
 uint32_t kvm_arch_get_supported_cpuid(KVMState *env, uint32_t function,
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index db8fba53f33..4dca5467f4a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -55,6 +55,8 @@
 
 #include "hw/core/boards.h"
 #include "system/stats.h"
+#include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 
 /* This check must be after config-host.h is included */
 #ifdef CONFIG_EVENTFD
@@ -3451,6 +3453,7 @@ out_unref:
 
 int kvm_cpu_exec(CPUState *cpu)
 {
+    const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
     struct kvm_run *run = cpu->kvm_run;
     int ret, run_ret;
 
@@ -3474,7 +3477,9 @@ int kvm_cpu_exec(CPUState *cpu)
             }
         }
 
-        kvm_arch_pre_run(cpu, run);
+        if (ops->pre_run) {
+            ops->pre_run(cpu, run);
+        }
         /* Corresponding store-release is in cpu_exit. */
         if (qatomic_load_acquire(&cpu->exit_request)) {
             trace_kvm_interrupt_exit_request();
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5b4bca5084f..4d2a0aefe89 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -758,7 +758,7 @@ void tcg_kick_vcpu_thread(CPUState *cpu)
      * Ensure cpu_exec will see the reason why the exit request was set.
      * FIXME: this is not always needed.  Other accelerators instead
      * read interrupt_request and set exit_request on demand from the
-     * CPU thread; see kvm_arch_pre_run() for example.
+     * CPU thread; see KVMCPUOps::pre_run for example.
      */
     qatomic_store_release(&cpu->exit_request, true);
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 7a3c957c3a5..4475fd1a9d9 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1377,7 +1377,7 @@ static bool kvm_arm_verify_ext_dabt_pending(ARMCPU *cpu)
     return false;
 }
 
-void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
+static void arm_kvm_pre_run(CPUState *cs, struct kvm_run *run)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -2666,6 +2666,7 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
 }
 
 static const KVMCPUOps arm_kvm_cpu_ops = {
+    .pre_run = arm_kvm_pre_run,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 9de107a18d5..eab5ab46d45 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -235,6 +235,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
 }
 
 static const KVMCPUOps x86_kvm_cpu_ops = {
+    .pre_run = x86_kvm_pre_run,
 };
 
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index da922f72d71..e9bcda70dac 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5898,7 +5898,7 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
     return ret;
 }
 
-void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
+void x86_kvm_pre_run(CPUState *cpu, struct kvm_run *run)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
     CPUX86State *env = &x86_cpu->env;
diff --git a/target/loongarch/kvm/kvm.c b/target/loongarch/kvm/kvm.c
index 4bc08f195ed..b8fb2094062 100644
--- a/target/loongarch/kvm/kvm.c
+++ b/target/loongarch/kvm/kvm.c
@@ -1517,10 +1517,6 @@ int kvm_arch_irqchip_create(KVMState *s)
     return kvm_check_extension(s, KVM_CAP_DEVICE_CTRL);
 }
 
-void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
-{
-}
-
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     return MEMTXATTRS_UNSPECIFIED;
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8e9328beeb9..17b16e33881 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1336,10 +1336,6 @@ int kvmppc_set_interrupt(PowerPCCPU *cpu, int irq, int level)
     return 0;
 }
 
-void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
-{
-}
-
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     return MEMTXATTRS_UNSPECIFIED;
diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index b3fa0548c8a..8575e673811 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -1640,10 +1640,6 @@ int kvm_arch_process_async_events(CPUState *cs)
     return 0;
 }
 
-void kvm_arch_pre_run(CPUState *cs, struct kvm_run *run)
-{
-}
-
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     return MEMTXATTRS_UNSPECIFIED;
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 69e49b7d151..827816e5b98 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -984,10 +984,6 @@ void kvm_arch_update_guest_debug(CPUState *cpu, struct kvm_guest_debug *dbg)
     }
 }
 
-void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run)
-{
-}
-
 MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
 {
     return MEMTXATTRS_UNSPECIFIED;
-- 
2.47.3

