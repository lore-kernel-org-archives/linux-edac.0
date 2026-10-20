Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493020;
	b=pTVmSjDlOZyvP6TzBFs++P78L8RneoHaBn1vINnmA+7X+24oVxp1nM36TMm6EAj0DNOb
	 jnpsnMhf0fpiMxjYGSq+kzTq/BmijGtxzxwl7uM88t7Vlr+m+n35vxGsSxs51U3naibVC
	 PgHrWg06Kh1KvEz7J3gWO08AOvrvza05TCHZXCqD1pybTtPDWWBQWudHDs9X2mGMutyFw
	 g3o5gQwCEYSQQ8tKNWs6TeF+EO1o9H6cySXWVmRc/bJvYz0c8vUFpLvWrpaJxaAbPcMNh
	 LpQfCbtijbXN3FfZ2KHVNoYf/jRXfMd7+nDirX//8c3Fta/d8hjOklhbjsZQjD0UeHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FGqirORdiYAHpa8WKE6kkRgcY8UYqpJTtFDjbgGTNq4=;
	b=ekHy/EkItY0SxjtYqEdqhNfEe76nCA+8XThuY7dUhpoIu48bMDUnX+viphU8n6XYoT/2
	 64PaE3r8luS7eLbQMFWsUUcPKeEadyIcN2at/dwW+XHWog5EJII5/sRK3/Xq8I75Li0cE
	 dx9OpLvpbfm5fdKAcmb5zNWBMSOEud3vcxmvArgZEWr5b52rH+z15MzhhuFfLVt9d1U8O
	 ygZzN/JL3J5FI5sRStXJtDtuUNG6NR1zfWWNZJZqqohnf/OGupnzdB8p8GE7iOcCmEQlq
	 l4aUwfRjeXrmVbP32gvf4Rwk7F5vcqWM9zlqtnKvxYt0hjos+WUWKU+irIsixYQympg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DWFqZ4LO;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA260A5BE7
	for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 10:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DA260A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DWFqZ4LO
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48b060ec084so2157160f8f.0
        for <linux-edac@vger.kernel.org>; Tue, 20 Oct 2026 03:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792493018; x=1793097818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FGqirORdiYAHpa8WKE6kkRgcY8UYqpJTtFDjbgGTNq4=;
        b=DWFqZ4LO2HuDnGWPeLIZP2abG30jA4IBPhFfa5fZsaIvCmv9zRAfHnxU9gcCokAfwT
         IceWU1u3YCB85iGeLpzfEH7jwKLI1rPSROnbUPMdCnTD8ggjar9e6W1zrU9tIZ3dK4SI
         fXaX4WcGbSJFfcUrz6n1ly2NR3rYoRyFI/Pax18pnn2ZaulweOSrtqCUKRsSh9RmqgLY
         Wi5EIudVrNDtQkHmlsOXCfqFQtiP4c1I7Fggjh90f4Lgub0Iwq5xSnN95mm4FYi0/b0T
         qWXvTUJuyahPMCCWdBQF1dE5JTrlt15z6bgSOsgTOBH8n2D9ZNXrbyyqXNDHNPX/wfq9
         AD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493018; x=1793097818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGqirORdiYAHpa8WKE6kkRgcY8UYqpJTtFDjbgGTNq4=;
        b=jc+pKXi6EEQEWsODYdSRaLT7jdML4YhvN6JQtXewVjU9xOiiQ3fFLL1VZUHxkVI1oA
         3VfzbvLl8NnPoUwkuoG67h/wXU8BkbXdXjxXugpNgEMnJkztJvBV+HnoOZP0oqiI96aQ
         wUaPexRjGC28YQHK5U+aGCaUdkP/bNoNzzPhfYKkJMExmEhODzlqO7GyY4Ju+jNlTCeS
         yEgf+vIbSL3G7xE6k42wHoX1Tv8UzAY6c5tOl7rHqP/gmSwMbI1Hnasq3vhIJHLjaAOy
         ygVsvdezlzU7qC2FAXssAaZj0gvlcQ4+2y2yjAAqu/GZ1gT8SLWJEzCn7K9TTDU196v8
         PBfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPT4NLOtme2LJG6lSBhlfmTQw9k+WWgAeET6UNU65y6jbq23BRdGDRX8iK9EJA3HtoN1BzDWhwBN57@vger.kernel.org
X-Gm-Message-State: AFq9FYKELMuARYf++z2IZ043VYuiYWO59pddUxHOwR7mu7xSLkFs9whI
	01BJ8fMsXOiaBTGbvWLdUwyviGGteuTDCx14hdM7PpxGEYVOhegtF+9lK7xawihVoHc=
X-Gm-Gg: AYBFou0ZzvFreD/H0WEVt3bgBzGfUiAXvKVsRp1G9vxq/Q6IAAa/S5CWDEj7Xfe74oO
	8FPBoGjUEMnLQGPNw1LFuJDC5lAdvw5e704idb/tFUUr7YLr6kHOVfsX+NwhLcoBD2E006AI7Wu
	XVHD78B7zTHVoVacyYL2jXzrlXApgI/DrAu2TfbcwbjLXr+k4nVocZyW4Q/ihivfXUebkIy4dEX
	GXbLZDExkbAgXMOo0fyFTywUXgmt73SroVLOIi3c7/GQaiGdqas2k8P4taiSgxB2RUX1jdSPz+d
	beIo32zh07sxGeY75pox8XX/P/cP4UOYfDHUL8ReoBSiEgKbudXb+jt5oI8T8VNLF0vjingNrBZ
	KGE4mOdsYiKDqN1a1TJSNs/EWpwsSVXKockBTe7gkXizqRqM6Jd3wb1qwVinMPA+ZGgQdtyjknJ
	8d4+ud9np1ySiQxzQGFCHv9Bn58aD7eYO+b00mp7r4wvd43I3Sn5jCwTMjClL3wF1g7O28ow==
X-Received: by 2002:a05:6000:186e:b0:48d:ee0d:8b3d with SMTP id ffacd0b85a97d-48e07f9d49fmr23637520f8f.28.1792493018396;
        Tue, 20 Oct 2026 03:43:38 -0700 (PDT)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a338sm5303864f8f.59.2026.10.20.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:43:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B49C25FF9E;
	Tue, 20 Oct 2026 11:43:24 +0100 (BST)
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
Subject: [PATCH 23/23] accel/kvm: remove redundant ops checks for kvm_get_cpu_ops
Date: Tue, 20 Oct 2026 11:43:17 +0100
Message-ID: <20261020104320.3686723-24-alex.bennee@linaro.org>
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

We assert that we should always be able to retrieve KVMCPUOps on an
initialised system so remove the redundant checks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/kvm/kvm-all.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 041113ed9b5..8b719d6eb44 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -455,11 +455,7 @@ static void kvm_create_vcpu_internal(CPUState *cpu, KVMState *s, int kvm_fd)
 unsigned long kvm_vcpu_id(CPUState *cpu)
 {
     const KVMCPUOps *ops = kvm_get_cpu_ops(cpu);
-
-    if (ops && ops->vcpu_id) {
-        return ops->vcpu_id(cpu);
-    }
-    return cpu->cpu_index;
+    return ops->vcpu_id ? ops->vcpu_id(cpu) : cpu->cpu_index;
 }
 
 static int kvm_rebind_vcpus(Error **errp)
@@ -3190,7 +3186,7 @@ static int kvm_handle_internal_error(CPUState *cpu, struct kvm_run *run)
         bool stop = true;
 
         fprintf(stderr, "emulation failure\n");
-        if (ops && ops->stop_on_emulation_error) {
+        if (ops->stop_on_emulation_error) {
             stop = ops->stop_on_emulation_error(cpu);
         }
         if (!stop) {
@@ -4004,7 +4000,7 @@ void kvm_remove_all_gdbstub_breakpoints(CPUState *cpu)
     QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
         int ret = -ENOENT;
 
-        if (ops && ops->remove_sw_breakpoint) {
+        if (ops->remove_sw_breakpoint) {
             ret = ops->remove_sw_breakpoint(cpu, bp);
         }
         if (ret != 0) {
@@ -4021,7 +4017,7 @@ void kvm_remove_all_gdbstub_breakpoints(CPUState *cpu)
         QTAILQ_REMOVE(&s->kvm_sw_breakpoints, bp, entry);
         g_free(bp);
     }
-    if (ops && ops->remove_all_hw_breakpoints) {
+    if (ops->remove_all_hw_breakpoints) {
         ops->remove_all_hw_breakpoints(cpu);
     }
 
@@ -4116,7 +4112,7 @@ int kvm_on_sigbus(int code, void *addr)
     assert(code != BUS_MCEERR_AR);
     assert(first_cpu);
     ops = kvm_get_cpu_ops(first_cpu);
-    if (ops && ops->on_sigbus_vcpu) {
+    if (ops->on_sigbus_vcpu) {
         ops->on_sigbus_vcpu(first_cpu, code, addr);
         return 0;
     }
-- 
2.47.3

