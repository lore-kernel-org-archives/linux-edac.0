Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493004;
	b=qhApAj+mFfgl3HBS8eLPAtEt9DbnBFedhpcLE46DUrOKiTuJZzWzXJnzk37vXi7gR9Xk
	 Johu/No6YyMyPP/lKNfD8Z/UEw8FpHnmkvA7m23Qus41NixnArir0Z1BU9/tRDldBWDNv
	 3PjX5UT5MXrEu0HScfLsgDa4jCz6/8WP+WLG7GuMOYkXOoikhhHALxBKzhPz49ietPOQH
	 QpJrAAM9gMTfmq+fhORZv/++ZrrJ2Nl/BvyBauZS9HUyuMj5vWmKO1zzhxwtl6v3c/JOz
	 Hagcqrq2pNAd1AR/h9L355xpcmMkJKGu6zZHHh+Kw0nDAO8s+rT8YHii8CAEwe17GqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=GObncgmEUBUSeoRmmw6cdeZcoKrwnIqxlNvyYUwUu+A=;
	b=Pn9K7ay2UG3RMIjE2W1QcyviKpA2m3NKsY/PcaCZ5DgxkHmPfIbtv5k02l3AlvfZ0wpT
	 +f/MmoRImuA0XzrZJnDCNjafCU1XqakhJVhl5DpRia52ZAOl4Y7EuT29uM0Tf4g9b+KWP
	 +6OhOwg1X81CkWLf3Q6n5XpYVfam9An8Fidsyqs+63EdMyucoANQGtQ1n1EWKo1WoXB9E
	 1SHGzr16UEWesXoJmV6BlQzt6j0KemT0MN8pIjMP7RCp7oQ3M7sAVJ8VExKxyxiRbEsNo
	 TPDmYNBaJ1c8vsf2eJ6cGIx/QRTwrPQVGzLsCsplzixt1zYUVP/cdF3434YDswb+zaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SQfeOoZZ;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1689606A31E
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1689606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SQfeOoZZ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso14528195e9.1
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493002; x=1793097802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GObncgmEUBUSeoRmmw6cdeZcoKrwnIqxlNvyYUwUu+A=;
        b=SQfeOoZZfH+0OxpDoCwSYb0malqlpMFLo5DrWncfJA79uYTuW+qspWYKUz1XPv1mnK
         OGOwY+FN42Oegke3uA8Tb22NcJAakOvfvp0HaLE8XuT6SajXmLxYvK8vnA1cK4hHyR+T
         3sRX0hrIYLVmp96Zj0ti+ylkGMUDMC7YwlhWeAOaBoFcXt61uPio+o5dQOZ0jaI4pQUK
         D4dWdQfagpVeilmq5sx1GW3YDud8ndHuWQNkAph/fm5Dr/v5UFPMJg+gB6VSR7sBZd1j
         BYKJHQuIJv0n7t0wX/b761/tiBDmM//mqwjKMxwiCj3zoweU7PURh3Ukd/OLjQsWz8se
         ABtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493002; x=1793097802;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GObncgmEUBUSeoRmmw6cdeZcoKrwnIqxlNvyYUwUu+A=;
        b=a1L7vSMiXgN7RxIyaway4BwRj2I3tvtyqhaAnUsK6rQI9imizEqqBCdkMZfbFOK22h
         bKToc+rW2TMG0rxzJUMQ25LTyK7ZL5yb62lh+Z74nGA9x7vsVGnMRJWijmkw6W8HdMNS
         eA544PBGvbKfp08ltKs7Wq04l0M9oDPMq3sqsfPCqQxj01E+iSdF+iyL76sazYtAuNeV
         eX1UM/C91ZM/TmczxPrayzcbTYW4Mg+dK2Cy8vf27XfwWNLZo7QL/aAWhJMx/3hWuZTw
         TlPTSjUFX8YRudf3641jzUQcCdbtV7Y4aFS5vp/W6mNfRdmSgQoZjxf2CIgvnGdr9hGN
         ziUg==
X-Forwarded-Encrypted: i=1; AKwUvBxWKyULZjj2BGsbWcqEMfrqqBEYw1XTzqx5GLVts230+F2Aq22aCXZwW1ERnYiCVsxtaVcw+recWWGj@vger.kernel.org
X-Gm-Message-State: AFq9FYKEXPCEvXZEHtgGmF2OKxdO8O7DrBjv/m3H3ZIT1Bh/Ces4yEy5
	SCicQ0noAKKlnJoG1eq4y1xIdkSs2f+UF9grukB58CVyGQUG0WGuqMbDniNnByc1FZg=
X-Gm-Gg: AYBFou14lrR8QtDuSjWLj2drgnhi1pkZLPjdsgaJYGlX1RtJ4eZVAwhiO2TW8RyOZbW
	BbQmHxCsQJqHeQgQXxZv4PfrSzIdcxRuzvU7yTdJ0SuJVZw4MWRt59NKimZd90pG5YOf4zekc6O
	aBxj8u+a1NdNQzEY6h19xkekWElP6T7A54NRlvOapA9uP5f/ymJXW6RvLmW7qbIf5RzgPXUJpyd
	zk4hjh4MEY8aiyQKxsI/4xHHN6u1S3bDaBEXa+4YXuN5OB8+qxWWlDi6kGB6HTbGF/dvNj/c3qd
	LrZ1Pa09WC4aiAULPCvS723h3qDTbvdmn9mytcsuLdbJYRcyatwNZN99zXxibyPxv2oUFqnlb9z
	k/a4VbiWRpvyJTiUefHDNI/U7Y+Zyyxwpc/NSB/+NSnd3jZEQDYmkgFz6RuzwXQs6qT4hPw6rmK
	AOcS6ugH8iajAFlYKP01JjtnJ0GPZP2cmseEOme7kM68xiwTYG5IRP1NER50XViN5iD3QLhwXGQ
	iGLl/nR
X-Received: by 2002:a05:600c:c0c7:b0:4a1:d743:77f1 with SMTP id 5b1f17b1804b1-4a1d7bc2e33mr147348455e9.24.1792493001951;
        Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc8e98sm67312705e9.9.2026.10.20.03.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 743535F957;
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
Subject: [PATCH 02/23] target/i386: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:56 +0100
Message-ID: <20261020104320.3686723-3-alex.bennee@linaro.org>
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
 target/i386/kvm/kvm-cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index da8d77ade06..9de107a18d5 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -17,6 +17,7 @@
 
 #include "kvm_i386.h"
 #include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 
 static void kvm_set_guest_phys_bits(CPUState *cs)
 {
@@ -233,17 +234,22 @@ static void kvm_cpu_instance_init(CPUState *cs)
     kvm_cpu_xsave_init();
 }
 
+static const KVMCPUOps x86_kvm_cpu_ops = {
+};
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
 
     acc->cpu_target_realize = kvm_cpu_realizefn;
     acc->cpu_instance_init = kvm_cpu_instance_init;
+    kacc->cpu_ops = &x86_kvm_cpu_ops;
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

