Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493006;
	b=R1fon32knGQz0gVx/17ySqM4oSkE5VJDfV7tQO6lr4dI4Bj2SYOBpsOWDkFQ5cL10Msh
	 VCjtrL3GkKo63zn8q5HbVKEC0qmXPE1Yw5dZdt8GkRfoLZ2tazA4TEcp+rbzzdvev/zRE
	 Xzgk2qgtoDVfucel75mFSFtO+oU6zbaym516tABLo+lC6XIXJty77SX9wjBKoEGeh5Sdz
	 /cpu+d8394fVkvVJjFNvuKsizeF+vd64kOK/zZpnuxoNgc63zPWNVhzJeleSJ0QRj4wzL
	 iSE71LG8H/crg7y8XOLv9FQOZuAWrrv8HDWaY7es12AOxNBWnDLFakJbXp6W1UwVPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=W1YwD7IMkeAO6OcLReHpxRqQRfDPA/W1esQDN17JAFU=;
	b=fbTcAeM/zQyoa1XO2avZsooPuSOhKc1eHL1bgcJFouwXEm+xGWrQn1RUUPOuLhsGvxX1
	 9v17/mFJauqu1DjdgEws9eh52YKfRNNMZDszgwGETtduetDuJq+xgOdLbSCKfTxaRds48
	 F43dpiOZzfgVF9qNZpnaAoZPWzWbm7ioIuNveoy4Y27we5z0W+xh9Lg1XwbG0SlxXvIk9
	 uTShs8nefI5ZwDDXRelb9rKGlPTbgAxUJifiX9Qe2k9OKzxMvxHlTAzVM9aVIrcxgocDh
	 n5LiGOCMrFVvMNqXcE7K2gQ218Gr2xnH4/MKAOMz8SLK29gs/zdJwI0W9qtGP9NTvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="qZM4G/5F";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7760A2600
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE7760A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qZM4G/5F
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2205982f8f.0
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493004; x=1793097804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1YwD7IMkeAO6OcLReHpxRqQRfDPA/W1esQDN17JAFU=;
        b=qZM4G/5FfFiYqI3Zl8+wv61PamEQz1bh9Tf1xQ4U8zlaurI/j97gARE8Sps/bNQYVz
         8fY1XG8bA10fbmxbuqa6kBxbs4yUYGW4D6yHdEfkCA9fWRfe6MoZ2GjWpQwExsyFIttD
         EU3gg4rmUDocEyfDc3KOlrs0FiPpElF8C4ySLSXjYRzJl2lxul+SnBcDNVl9sM+EXpDJ
         YRnLqqMLQj3snHDy/IStiHag4S6g0Qw9ckgXgjgYe2mRdiC2Rsa+05S4K1mHeMMP4g5+
         YAJR6lylWJURnDa5az7cKbppE/dkmPja9v4UDVXDn9lhOSUsppTcyrRftbRQevKkFO/Y
         ow6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493004; x=1793097804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1YwD7IMkeAO6OcLReHpxRqQRfDPA/W1esQDN17JAFU=;
        b=bMv0OjWj+83A0j8ZVDXD7fSjt+5S6xqzo2qINMhl4k+6bd8FsanQb4xH8FW1KjKi7G
         rDX3ljk+1PE5ISkfjaiv2q5eOmLRqXxnzZ+tWKMWU0H+FdkI7wri/+KvBeFfV3hs3F8c
         MXDN3eVcOf9cY52BYR7UDtqag0EKc2+do8+UAznx8uT1gAgbjOEIZUIt9yST4iMdBrTM
         Lf8i60FtA33exGKiZb0cTAFfuhM4AFqkysNJvdniFjQLekKYxrJ64WPhaX4fOzh/xvXg
         6mxrZZYXnR7T1b4R9GqLNkYmCHowGLkB+yn5EsXywUewSVHVOpo7P9rKzF4Ly2VbkE16
         C2+g==
X-Forwarded-Encrypted: i=1; AKwUvBznmBWRTlsZKdLIS3WKLqSr7D9U6A8SAVfX1pvfxbTS2QYWbVMCDtFXFTNIYF6lmPN7xFWHQFZn0HUh@vger.kernel.org
X-Gm-Message-State: AFq9FYJi1l/jIGyRLGtVyg6y4n15Pcy83Tz+wItp5gWaWkcwYPut+T48
	aUMPH8WnJSODwz8IEgXENFdhZFCfOhPscfGW/58XLMn3QMYgqPdJjQd0NgxL7go403Q=
X-Gm-Gg: AYBFou3bQERYndg8jYrj3IEqWYQtsMcX8RnyTCUACx5LN+x3v2UJho5q1nqyht1Mmgc
	XpmOfUAhw5WlLooY5OPCndkpT1Y1xUImIRCzTpWvzyYA3tUT8AGSba869FndXqAC7+CYu6b1Rpk
	Or3nlCQY/yemAz8jJbb4/qRN9PsWldRCO7+oWWfQ1PYeYfb130am/rjlPfcxrmqffabDek6H3rF
	gdBSB/poIZRgElCOIFo6jOttawdLZlf1gnoeFfGEpvS+fv01AzXQdLbz2srxiJA/GHl22GCV03o
	/GhNBnC6mgNRd6Q2BIYNXXNoFrWlJPRGADncZvj6IPFwTzRg3jy4f7S3Jc3nYq+cLKLd7em5++0
	pELs+qH/IXL2p6f5D9ezeMrrN7DeZjq1thrN4uED+89+GMY4xr3pM7TOE1vV+EM8drCJdNCu9lu
	haubQ2CLu6XITRSyN4K0Tx0ruuqmOT5fSMafc4y9vp7b0Sa+NAY0jh1jijWmqi+pTOw90oPg==
X-Received: by 2002:a05:600c:8b6f:b0:4a1:d307:d578 with SMTP id 5b1f17b1804b1-4a1d75e6d1amr197176025e9.11.1792493004251;
        Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c9e9c3sm56999645e9.3.2026.10.20.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B08A65FA43;
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
Subject: [PATCH 04/23] target/riscv: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:58 +0100
Message-ID: <20261020104320.3686723-5-alex.bennee@linaro.org>
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

We will fill in the functions in future commits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/kvm/kvm-cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 45ad5e1525a..b3fa0548c8a 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -33,6 +33,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
@@ -2195,18 +2196,23 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
 
+static const KVMCPUOps riscv_kvm_cpu_ops = {
+};
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
 
     acc->cpu_instance_init = kvm_cpu_instance_init;
     acc->cpu_target_realize = kvm_cpu_realize;
+    kacc->cpu_ops = &riscv_kvm_cpu_ops;
 }
 
 static const TypeInfo kvm_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("kvm"),
 
-    .parent = TYPE_ACCEL_CPU,
+    .parent = TYPE_KVM_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
     .abstract = true,
 };
-- 
2.47.3

