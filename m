Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493004;
	b=a6zar/iRdKYcgLyoyqw3AfToVYMpV2y04w4KdmdrUKbehQyc5R3MiRQwOSOBJITIVpiQ
	 OcYsuD18DWRuylumcNvWnv36AIYYWkWgKU/ybOC1Gm5RWjh+ZhqS6mnKP9VrPJbIs/Phi
	 7ejCpl+YBnj+GtH1bfF6M8UzclTfuMT8yq6lRy3wc/I2rx77wJMgyqsIyVlyxoRaUhOId
	 12h5+HiZUwG57Z4egAvc//xQFCN/OHifp6nAT7LXhpAtipzegu0CqLcFfZh6U9FKtWzA0
	 4Wkdr1M8z+c/AEDk5mIKphvtCowdPc3SJYs3my5wPljctpOX1n6DaeRhqZNkrgQUZJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lQ4MX1q3rcBPurkumbq9wX+jGqxuJWd5pa2EGbSUiwo=;
	b=Mx0Am1U5qeAF1aJnQCk4rl+MCXOdzV3F5pjWI9T8umlbDTzqJa8F8ABKwZXnlQBBOSCn
	 Zrs9cx4aD00+qQUzNRt0lrvnxLdATIAKAbNrr/oqDASwma/hOmW1uWLqEj7pSCH90rQoc
	 yoK4HK28ytoryL2pimqRX/N9a3mP/z+Yzy1pEn/vJQQ8ZLj12gOJXMpMm+a90nGxB0h5u
	 s+GpAAIGq0svoYuK8lrM9Xo51I7gLHO3yru3qh5kfWiFYdqjcmhVByR1+PjKPoR2J5pw1
	 FE1BjB7EaFVO9nWBfPOienJtN/ddeg4/TRUv6zMsSydOzgvyJBmYr+68vshClorG4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tAqvAXBD;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915E606A31E
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5915E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tAqvAXBD
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so2345232f8f.3
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493003; x=1793097803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQ4MX1q3rcBPurkumbq9wX+jGqxuJWd5pa2EGbSUiwo=;
        b=tAqvAXBDr/tOE0oK3xG+YS2QBJXWWvsH27HOWsIhflocjfg4a8C2jGn7YUazKwqFnR
         BC7zgRK8PDlLAbhcIEB6UXhWi8JWSNQjakR592BsMoSrFtssKw2BJS2u7Q21Z3IlWwU6
         9VNjTgDGmaX3Y4+iL07BFMHtDoRtfJH2JjJShzWfplttxQ2dvODPD2Ena9/6F9sG6mu6
         +c5N6A9bLNYDG1zLsjGaD3HNpMyYBovhwfCk7uB33jnWVT6D11tca6djWmWwsghvLuCr
         z5DydR0W7mWmoZyZTwFRA/ZLeeweBf4d/nxVSNIwvmPh1A+i/SqldEDsSHnvZ+kMLfCR
         6M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493003; x=1793097803;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQ4MX1q3rcBPurkumbq9wX+jGqxuJWd5pa2EGbSUiwo=;
        b=zwTOWv2vBa5eVqQ7gcTfjh9VOo8hkoQf4LfOgeFql6JaH63X8dA+0Us/OHAQHe7af6
         Wcyn9ODDElH0JmcTW3SfHAOP4ufAh5KS62JN3JRgndFhFicaaPArxueSAc/434IZZWYw
         dDLFo+jTXWLe/EiRfjC/IhMKsvTHdG3aF9/bRA/4R2MrQTQsIhsVhWOKG9OhDlKuG6IN
         c+kE9u7BqCf+S/ThPaoWGcgjGKtLO4le2G56jJgzj7/HSqPHtyQsmPPN8z2cHVZpXdEN
         BhSaNj3LGE+R6GaDIcfh1ZGDffm+ufORlB/wwps7CKvJmYYCD6xpHwl/EVoNoGeDLco4
         Ie2w==
X-Forwarded-Encrypted: i=1; AKwUvBwnZGzE+GwN0se3/cFfPT+4oM0Yg8s03X4RG5f+eFzQ+N9Dx04J6C0j3P8NTcwXpbNIbwqfMtMDHRe+@vger.kernel.org
X-Gm-Message-State: AFq9FYJsWp/Na44nvUlHlT2PDfUvrb6NNjUlknRgxXLJL7TYY/40b/Jx
	X1vWJTbwTCuvm3lJbXVUXQZnh5AJmzrYK8Eduap6eZfP+9iNA11TikrJ3ngNmSiLmFs=
X-Gm-Gg: AYBFou0knkMlCX1dWRf7vlSAggxPSa0GywiGeKtWz7yjqHLsUtt+P//9mJoeXqSyFHJ
	0GbeOtOXwr2eGgGiA0UXttyKw6Tv7YchPDRtBjuVoU94/OrYffS+f1X8hZgMEeVRfwSLbgI0BGi
	7+mopEZAEeOPGk6j5FZw4hxKqZKfgdwmUqdBk9K+udauLvBuXYS2IXjKRemQ5iD7CiSayuzl7Po
	NqRHeONVQE8+w8Qnvn/dvCqyojADs3LQen6k1mJ+yBZ+NqZjtAX9Tg3Fz/RX9fgpgmYju7bW89i
	vsyTFLO0srXppQEOi7AAm9PXN0foPfnc9SIQru8vnkkN9m7WReghzkKt9oTzFPPabpQNSj6kszQ
	behLk5k7McLOla+U5yB5WxwqRh0fU+sNR+GWQAGFvCLkVOemhTfq5q3eAkYPav0e+cDQ9VP9+7S
	kXCrSb8+KDpfR5gdeD7bSjSgeF5bqthcuWa0LEiCW/lzWZqes0oKBBMgl4iiVrV3LhSMr8Fw==
X-Received: by 2002:a05:6000:46cd:b0:48d:f014:63ee with SMTP id ffacd0b85a97d-48e07bbc7d5mr13979635f8f.20.1792493002522;
        Tue, 20 Oct 2026 03:43:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fb69sm4788951f8f.18.2026.10.20.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 57CA35F915;
	Tue, 20 Oct 2026 11:43:20 +0100 (BST)
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
Subject: [PATCH 01/23] accel: introduce KVMAccelClass and KVMCPUOps
Date: Tue, 20 Oct 2026 11:42:55 +0100
Message-ID: <20261020104320.3686723-2-alex.bennee@linaro.org>
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

Introduce a new class derived from AccelCPUClass. It only exists to to
contain the new KVMCPUOps which will allow for a QOM-ified access to
what was previously kvm_arch_foo direct linking. This anticipates a
world where we have a KVM interface capable of launching multiple
architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/accel/kvm/cpu-ops.h | 53 +++++++++++++++++++++++++++++++++++++
 accel/kvm/kvm-accel-ops.c   |  9 +++++++
 2 files changed, 62 insertions(+)
 create mode 100644 include/accel/kvm/cpu-ops.h

diff --git a/include/accel/kvm/cpu-ops.h b/include/accel/kvm/cpu-ops.h
new file mode 100644
index 00000000000..662d0c553c7
--- /dev/null
+++ b/include/accel/kvm/cpu-ops.h
@@ -0,0 +1,53 @@
+/*
+ * KVM CPU-specific operations
+ *
+ * Copyright 2026 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_KVM_CPU_OPS_H
+#define ACCEL_KVM_CPU_OPS_H
+
+#include "qom/object.h"
+#include "hw/core/cpu.h"
+#include "accel/accel-cpu-target.h"
+
+/**
+ * struct KVMCPUOps - Target-specific per-vCPU operations for KVM
+ */
+typedef struct KVMCPUOps {
+} KVMCPUOps;
+
+#define TYPE_KVM_ACCEL_CPU "kvm-accel-cpu"
+
+/**
+ * struct KVMAccelCPUClass - KVM-specific accelerator CPU class
+ *
+ * @parent_class: The parent #AccelCPUClass
+ */
+typedef struct KVMAccelCPUClass {
+    AccelCPUClass parent_class;
+
+    const KVMCPUOps *cpu_ops;
+} KVMAccelCPUClass;
+
+DECLARE_CLASS_CHECKERS(KVMAccelCPUClass, KVM_ACCEL_CPU, TYPE_KVM_ACCEL_CPU)
+
+/**
+ * kvm_get_cpu_ops - Retrieve the KVMCPUOps table for a CPU
+ * @cpu: The #CPUState
+ *
+ * Returns: A pointer to the active #KVMCPUOps, or NULL if the CPU class does
+ *          not have an attached KVM accelerator class.
+ */
+static inline const KVMCPUOps *kvm_get_cpu_ops(const CPUState *cpu)
+{
+    if (cpu->cc->accel_cpu) {
+        KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(cpu->cc->accel_cpu);
+        return kacc->cpu_ops;
+    }
+    return NULL;
+}
+
+#endif /* ACCEL_KVM_CPU_OPS_H */
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 47244d33f7d..445d7d7f545 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -18,6 +18,7 @@
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
 #include "accel/accel-cpu-ops.h"
+#include "accel/kvm/cpu-ops.h"
 #include "system/kvm.h"
 #include "system/kvm_int.h"
 #include "system/runstate.h"
@@ -121,8 +122,16 @@ static const TypeInfo kvm_accel_ops_type = {
     .abstract = true,
 };
 
+static const TypeInfo kvm_accel_cpu_type = {
+    .name = TYPE_KVM_ACCEL_CPU,
+    .parent = TYPE_ACCEL_CPU,
+    .class_size = sizeof(KVMAccelCPUClass),
+    .abstract = true,
+};
+
 static void kvm_accel_ops_register_types(void)
 {
     type_register_static(&kvm_accel_ops_type);
+    type_register_static(&kvm_accel_cpu_type);
 }
 type_init(kvm_accel_ops_register_types);
-- 
2.47.3

