Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493005;
	b=h+8DkQgtptKpvArt9khXMdpWI2GJqbrfQAUv8zg6RyZhOBfFevs00+aOCDgQGlYWWJhd
	 XiYqnz8f15oPx7KRNVlsC/U0WXH0J33eHljAFFJXtODCSnhvFWgKvaGXVA/09mRjEk6ic
	 9avbaOx7S63/C3X7/dnjqZL0/spdkcOYIki8Hd2CHsL5on1mOc1yUFUXobeWlRAjTDVDH
	 h6EBieUVudYjAvZGsskq4Q2nT8KTjOoJRmqjj8v5xehrD+UkJtsaHyasU4DciP0k3yM1o
	 fHVJkJLuSjfAteOTUre0RgvKIFJQdCDLZbLzBwJ2qMY3Bi0EvkqL2vh+376bb8iZS9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EQ7gfcnpJP7Ud8+3W5PCJuKE2nJX2Z7vYXXp9omA0HY=;
	b=s6v+nvQ1fywnXEomeLciZJMKoon9HzNgvzvfZktVLQ2wGRzkSHkcyrUqRY7anPfIT9Rt
	 /kg9p4LrxwZEP/uAuJCnT84oAJobWkNat9ERAPzYCu9IXjTYVwul6NYDgYIz9yzPEDZzR
	 p7rJBxT5LYdF95A+4x2zEaP456NsjIJw85KWcUyqIku7RVbnfkWz1sPBySj+ylKC1figx
	 ph3s59uns//Fg/hgEY8uUsoX40+ZKFqSH/EVLzUfijGAL4jzCy+06fahAw1oV/p9vWmxL
	 WIssR1ZO9vpKSbHTyTp+OXFxq2/i0wkvrs7OUF7RgvjkYVYt2bzdj913h6gan+jQW9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DRoOkJDR;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48967606A330
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48967606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DRoOkJDR
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e011d370dso2515746f8f.0
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493004; x=1793097804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQ7gfcnpJP7Ud8+3W5PCJuKE2nJX2Z7vYXXp9omA0HY=;
        b=DRoOkJDRgFzpR4HTZMMJtbttWE1M6q1lQM1iGVoVztA6H66KrPWe4nXokQ9jzwU39I
         AqxH0F8MJFlrWUW1+Ommc6OSy3m8GiQ98tkHX3CNO137TUscoMwZ4VIGnUNWDDC/3pTE
         WO6qThtDAJfjMLLhouqdn8Pf2n0Z+0li8O3PGlWodlbAIPVwUfJztlsfrE/zGRCOqIF8
         zhgTO6/dv51Tj3r2MqoXc3vgTZnBuWt1EEemnyr8qzZUU6j320skgX4P0GfH3MewKLmE
         DhthAG3/US1MxJJJiLaN2PqZjWxAYRyUK4wTwITs+elCq/YdXdmz0rkWaC3ZYSC3SNk/
         muWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493004; x=1793097804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQ7gfcnpJP7Ud8+3W5PCJuKE2nJX2Z7vYXXp9omA0HY=;
        b=uRW4xaRQagb+MtuLjdlbINBDWh33GjWs/SQ9GH+SBqmIn2Q3tBkBrGWKb/avsjAaTv
         P6ijr8R82JMU0Mllxqyze8f+x0AuNpFxcPcLHbYlSH9+U2A6GV2yqkx8hq3wfgqalYJm
         fza8II2++P4Q0HsqJP/ISysAetnQWeNnS43vuvURJ/DVytIb4RRg8ylfK1U9BUg33LDM
         47ImD/pzbTnmUHMbI2bpwb9pTW54A4uSvCRzA+9MdGuQy4UuI/dyj/dLjvLQJYprD85v
         hJJipWeBQErKlYmM8i2Mzqd8g5DTgA4D3cKa5rc42SASsWaJSNjQ/D5f+rjfd0tpmsS0
         Bhyw==
X-Forwarded-Encrypted: i=1; AKwUvBxYPjLy673rVY8vr+GCwDVMbgm5dYKQwbbFenykZGLHNHvbw2iUKrKX8pM+AXOTKmnJFKM262aJB16K@vger.kernel.org
X-Gm-Message-State: AFq9FYIinlsHEU4ONSJl2MUVTQlKODCOaYKJE0VQYwKX7isVNId/r3x8
	HWvKOoBcBlp55W5PyvWmWHXJvf8h4pbwBPaQwf+FVnxb8LL+JORHVD+LWFhC/8r+lJo=
X-Gm-Gg: AYBFou0Czh3gBvk+2yROknGbKbFP6yRcROiJVGtjOIByAGFWdyx8XTdscQaterVE2ph
	zLFLTEAAECBFRURVmju3AssO+YMvvL+JUj0SkSf6rjVTbF9KpQtMFbSnIY9VuR6kxXaX5YL4ich
	3JoCOxqb2J48Yd5xIejVUwnItCY6z8p75NcoMXVU82Tq4HvI++qFRf3A5Po+mVPIQsTK4H8Y6v5
	aO1ryx3Bl7QLZZXdct4NWI8GgjohXfvio0G75F3WTN0C1BmUYcMIxEL0qVbcQmEUGUby8FZl3nz
	S9e2EkaoJggaSNOrIm31upS4BKwtaFfGpiyN8vHLcgwOeyAJrPNKbT4vHpI49/VGiwRcorXPkBp
	uI1huW0Op9jk7Z/BaEADNnEA8cp2KSlHnMKRxkOe93wrJCwCDjvNqaIik2L8J9Q3RW183XBGDdX
	nW8r5gkXzXVFdHe19LopA+61L+ULCaiwtxuzsN6iNFpFWNubFF44cY9JrzrnsO9pU+KvQqGko=
X-Received: by 2002:a05:6000:607:b0:48d:f58f:c91 with SMTP id ffacd0b85a97d-48e07bb5919mr21536746f8f.19.1792493003575;
        Tue, 20 Oct 2026 03:43:23 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820822sm5769631f8f.34.2026.10.20.03.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 92FE85F9E2;
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
Subject: [PATCH 03/23] target/ppc: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:57 +0100
Message-ID: <20261020104320.3686723-4-alex.bennee@linaro.org>
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
 target/ppc/kvm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8e89a6c665c..8e9328beeb9 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -50,6 +50,7 @@
 #include "system/kvm_int.h"
 #include "system/kvm.h"
 #include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 
 #include CONFIG_DEVICES
 
@@ -3080,17 +3081,22 @@ void kvm_arch_accel_class_init(ObjectClass *oc)
 {
 }
 
+static const KVMCPUOps ppc_kvm_cpu_ops = {
+};
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
 
     acc->cpu_target_realize = kvmppc_cpu_realize;
+    kacc->cpu_ops = &ppc_kvm_cpu_ops;
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

