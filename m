Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493007;
	b=gM01uvRR+SlsQH1iZFmMRzDDWE1uehwKVGX7qkRftS4Wm6C8igANXysw0AhThltC8yKw
	 1FahnVpRKF33wuuJd3bqSBU6Rwab1VVbgrzBRI3ulaeCKug3ip3OZ+Azd06kn8qLuXDNW
	 0bli/MgIg2ldl3SD9pNlCtR7+er+uaWJGXERQxUVswEXuERr6JyDS9DyosPWT1VIOclHb
	 8EtVyaU+Rsrkl96nZUvd3nX6N/e14c9hy4WbsjQ/eRRw1mxMI19lqWp3nwiUdyW4a4cww
	 1Nml0m8ouiN/puHeoj0nsXh8ax9FINu4Bi/CJooaGBYJNakj7is034ajXpAjj/fmjpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=xpvK8hxiiby7P5GAABphDAJ86oAgF7lyRnWJr7JT/sM=;
	b=mKxizouTnVWMXWtBmujwLWsLJwz0x3b+ihqms7PMYmqipIn2cq6ggXy/4bctZ9QnrXpm
	 OCDRXqsogRV7AB1Xy868Qm8kUOhnTVkxa3dD9scmqRDbz9uVZqq9qbwMFEkjACEQj8hRg
	 9a2QFhV+g/Mgux7rnN+nnfwAuV5AXCiJSQdPjQUjvUZDGTZ7t8UElNvQLOUmQOFTcMg/f
	 vzipHeVkG0fVIKSy2OB1b1K885NsCB+OzEq9iyoW3Nt+fhmmeP1NWq/DsyTyRaT0TPfhw
	 Otk0RYIVW3KcHeqYsG28WNpvay5CubueLQG09Yv1ZTTVvYfW+5JiHfrfsbo7sqJXW+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pfert0Wh;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93DB60A2614
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A93DB60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Pfert0Wh
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1960196f8f.1
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493005; x=1793097805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xpvK8hxiiby7P5GAABphDAJ86oAgF7lyRnWJr7JT/sM=;
        b=Pfert0Whzua5hnm67pqr6YPC0mwWkJwmcvWKLgbCqVMG3ksf2Q8vDW9wZ6LChAIYg3
         0DSk4vxe2edLEJMp0iiS1CTRap1wmBVgSEU/bUN8wWGAKLDzIrcxlKk8HiShahwZ4xbT
         AOCyDpZuiMeQpZR/tbekm0g3mFqVDTJTx7KHxcuEsdS1W2Qw+sTTUCxaoBCdMfxCoLVQ
         bDwSuVzZjpnANTjZZqPWTSfsmI8Ob48tY36UE/kXaH7uSBZozaxORjgpL0ehVQK3aPsh
         TUJ34LcgbWmg2hhw27VffgohZkhtxqS2gy6Lk5x0SyUfAMtqmA74vwgG/P8G5RlmOlJ0
         5vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493005; x=1793097805;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpvK8hxiiby7P5GAABphDAJ86oAgF7lyRnWJr7JT/sM=;
        b=vU6eD2vGBEwOuqKsrMEqZxgBQZT9Te7gP06H+Fp1e/3QjLD3xK7UZav5lYdQOIaMZU
         y0PTzgR84ZyM2LOeyFzNVsHxuXscMHfuzPJc/klRs03dZ9Oqfs9eeDYr5Sy6xviKS66u
         p4rkBjJPyAFADDyPV84EHIt0K407rXjyY4iKho0Pn8fvsJXa7zxUPrkmJ35xI/vnUwkS
         /nv5wg68A5S/f6CdYPsTWF2PQMfEL9B0EBB/WJ6hghkpov8AzBdQf65X44SgTDoj2hi+
         F5StDXg4FY/A4OgJSeduEt2oH2RJrUbJD0hnNP4FjA3xOBa5ajuEsDsaDieJmfaYYC0f
         7Ivg==
X-Forwarded-Encrypted: i=1; AKwUvBzaj/R9I0abHbP84KGKNut9d4+s8BVPEGkkAcpB6eI9vGCzHkpDbxtafhOz9KsM5CkRd4oD9EmNHMiq@vger.kernel.org
X-Gm-Message-State: AFq9FYKwYNqBf6ySYK6TtuD9T3BpBUYSTevmDa5CCqQNRyF2QhwOuA0U
	O/bM8QdGSZzZSabdmWxT006sETFCNkwe/LIbKsgRkWSJfzEwGXFVXxf0mlEJxDzBgWA=
X-Gm-Gg: AYBFou3cXC8/kUGaDi7zYpHsvwLAPM4jgCQbRKunv7uHuUzYc+AY5XLj6WE6GftI4mv
	0RFHFHs/N+k21qqqoriD3sVr/b1lOXTRZRcc1WP4JAbA+0fdh9sJFPlRoz8SUgiOuCZXLE1cTkY
	4ocDnDvrHiEhUHy8utDhN9Ycog13ZCmiBimUEvJ0Wkg1I1+qX/ypjoml9O/NR9fZZgP2qE5eVyg
	32dmRgyVzudR2T7aHpAKxzaRe0Lle5IuY37bKUKZxW4fFI2paIXuKUsU94pUeKTShejUrgKkBHf
	O+jd4l4s8kpFYA9Uav7Xu6cpwpHn5Rol6Zgvwjk99SCMIu9YWUZ2vXcAinqYQ6TDqTtgiNwjIkb
	PZVy7nAFswXFVz2FWhHj+UDainCS7l/8Ehdmok+epXegbCeDYTuBv0ekk4C/T6n8FcvBOQ037is
	4VHoDVOA7THKZaDzS+z20UnJtyHqtOOg6QCmeAiiejHytiFSKGfsti+65qUYe0UaddtYzCOh4=
X-Received: by 2002:a05:6000:2388:b0:48d:dec7:974c with SMTP id ffacd0b85a97d-48e07985764mr20442510f8f.7.1792493005061;
        Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818237sm5338778f8f.27.2026.10.20.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CBA755FA65;
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
Subject: [PATCH 05/23] target/arm: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:59 +0100
Message-ID: <20261020104320.3686723-6-alex.bennee@linaro.org>
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
 target/arm/kvm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3d905f8565d..7a3c957c3a5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -42,6 +42,8 @@
 #include "hw/acpi/ghes.h"
 #include "target/arm/gtimer.h"
 #include "migration/blocker.h"
+#include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_INFO(DEVICE_CTRL),
@@ -2662,3 +2664,26 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 }
+
+static const KVMCPUOps arm_kvm_cpu_ops = {
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
+{
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
+
+    kacc->cpu_ops = &arm_kvm_cpu_ops;
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

