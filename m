Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493007;
	b=TpKMJ741iXa8zxKvTPuvjf6fyEf74dcmiw6zeFfOgeydV12R4lzbtly/SyHO2AHWt327
	 0oWWzlgR1Gi/rXLcEOm3e+LxFrOvJZKdgPsfYZcARYGT0V77SYbhvytQbx6NF6/hS6bnN
	 bSjKTvqHmuTyRBInlfzCIeprrLFctGfrqQURmObZbhgQsa7sxRG2WF0I/nUTKJgBkHYOK
	 UpajXoMmauO/hL2TjX1miEBzwD8zK+X2cGk/Cm2y6uE9GbzN9ZT2zkddhXgtgdtmpvfKa
	 WfJ8rmCA118/Y4PVcWH1eNgIdr0ie+2isJsWiKsI5A5QNkEMgi9mY6Rc+fgsbocCFYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=clY0Exi/Fk2cbqeICRgpqzcE6k7M0cr1lXEHsMtE1Ok=;
	b=Tk1F/O+Dw48luMzgKIOGzMtBc3NpoNd2CjYcRQEIFEjbrk336YR33LJLzvVKIRWlsbEO
	 NuZ7kHDOatgaqWlmp0NUmh+tAunERjyVH9sHOFAFGGaeA4g4rFA6Rd+tx5EttKqyuRLZw
	 VKW4lHAdCxAAgFHI4WYwGCmEF+NRbUv0IEFxoTJX0rXVSYjBzf+i1r8aMPWulrHQmXAkB
	 9UFkT6ymdaiZLknwue9SIgibn5pGbZl11N8vyEN8b4goN9cUndiP6b96oFV8BoibgS1we
	 APfnDjqMNi0oU8B9mLXMRz/fzupHkUUjuOW9iKgMLWWSlMEt4Mb9dEtFh3lKgORe5GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FcuRUPpw;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3060A2611
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D3060A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FcuRUPpw
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so21504575e9.3
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493005; x=1793097805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clY0Exi/Fk2cbqeICRgpqzcE6k7M0cr1lXEHsMtE1Ok=;
        b=FcuRUPpwx2+HLMhUTJDbV+mwJ67egmBifbmTT6KVKS/dVEC/yxvulpEIe3WyG7g5iy
         Dtbio+pgy3tsg0gwQbxBez07+z645Ycoj2ySMABaujiG/kzCAME1WyLys/0Y+bWy3Dzt
         v+tFMJwAhnKFFZxb6MTSzZPR7uj99YfV6u6vQLxqs62mU6alQyL4RlDJ/m69m0wkbbfr
         dcq2ADQDR2mQ5Zm3KW0mW0AZFpKdOLjMvSFQ5SP3xuzB6jKzU5fQ2GZO+UBNGxSZTFy0
         Mj/GnfT9oxWlhjTIng/6uyVMywryY0Sihw7Yq999fy/7FaQZ20XFchvrkcHoJHGAy237
         8JTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493005; x=1793097805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clY0Exi/Fk2cbqeICRgpqzcE6k7M0cr1lXEHsMtE1Ok=;
        b=U6YPQvLtdCeV4XKBtkojKwZk4VtyAQeMxTWG7WfNmv/SyZ5A6RGJb60FPweEXPhOzd
         fjKTeo5IQCU1irqneIrGVuxj9T3flN/3qZie9XZbmXHsnB9tAapaa6lAV325GyVOEeD2
         7eOVyEkYCDYTCjaxoY0Bz2F4zh0VI7RTzE7yy5X90nEv6UJc0nH3JRQVdoaUZYnttOJC
         CQAUIWQwSLLr1yCIMggub6OaJY8XWx29vMVVq/FtOeKiZ6LsCq9rDERjHTIo6su+mF2s
         5vTX6Y6QijaYT9sEpLuZHSn/Y3Nm8R/gjJRroAHwmISF5aFjjJWk5/RrpDb2R4S9z5uN
         Lo4A==
X-Forwarded-Encrypted: i=1; AKwUvBwTF9sVFwOdBnmL0JzgG9hK9HRvYe3Qe+fAYE1lyKnJUdmFMOJvV3Folem3sBdh+CARjDipC2NgMzkq@vger.kernel.org
X-Gm-Message-State: AFq9FYK9SYde5rtU3viKKVJXeuXgUv6ZEJs0gGgncmqhfWotLLQs3Djo
	/K+5MFWMNakBQl3hiLZ1D9Gg1Pg/eriOQmjWsjqiPseN+NQCDXldyfwv7CkwKXvxt5k=
X-Gm-Gg: AYBFou2NgoTHajUvTgHUc6Eec+o72r3GtKG3kconDTOhMoAdg6rzRid1wWHexzG62C1
	tG7XCeII94aqb+Wh8f76e6r+YFueqQiAs7kntYGOXtOcvk9889BSoOQmIFPfvTuJC4vBA2CXXyj
	trmPztyGZxnIlHsq5c06MlgAY2JnL2pPUylHADk5HYC7Oyao6KdPIK6q5GjrLJoQQrtZQRYIWsN
	OdLH7kwP7IJQChN9kMC59HJgh9Hje7pHxN8N+2g9jn0jgMB0RP7OF5mzVesbyG6s4fJOdS7X32q
	yJRIXjFP4q3PhcNXolmOobnz9yUYl3b+wnTgBYx3Nt2u9DkHMGH1bbq3enL3DQKey5n3S1KxD5x
	0gA/eFUNS0kULFgZqEBZpZgH/TPI8h1bV2MgQqRvCyDC8WZ4DXG3HQwl952qVIZOeq7rSEna3Hv
	q8qsLfUezcmHHXu8I3fx9LEqzrl6lDmgiY+TgEMCQB2lO48cg1ZrEtbU6RoX/U9XV+cbH1KA==
X-Received: by 2002:a05:600c:3513:b0:4a1:a39b:e75b with SMTP id 5b1f17b1804b1-4a1d7607560mr224796055e9.21.1792493005376;
        Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm64722745e9.8.2026.10.20.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EA3605FAB3;
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
Subject: [PATCH 06/23] target/s390x: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:43:00 +0100
Message-ID: <20261020104320.3686723-7-alex.bennee@linaro.org>
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
 target/s390x/kvm/kvm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index dc67e848864..69e49b7d151 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -52,6 +52,8 @@
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/s390-hypercall.h"
 #include "target/s390x/kvm/pv.h"
+#include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 #include CONFIG_DEVICES
 
 #define kvm_vm_check_mem_attr(s, attr) \
@@ -2655,3 +2657,26 @@ int kvm_s390_topology_set_mtcr(uint64_t attr)
 void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
+
+static const KVMCPUOps s390x_kvm_cpu_ops = {
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
+{
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
+
+    kacc->cpu_ops = &s390x_kvm_cpu_ops;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+    .parent = TYPE_KVM_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+type_init(kvm_cpu_accel_register_types);
-- 
2.47.3

