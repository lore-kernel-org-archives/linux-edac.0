Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489B62931E5
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788630815; cv=none; b=EMUywwnvKLj8tACZECwQTXqHtxrPwo1Un2xSpUGoEkAZdMNeA8wBgupRwoXnRUjQnkKAeXz8l0Qb9o+VQi0P47MZ79PF09lgB5CCsrxOpwXbSUC3hlHd7sYrth4/3JxiNZCyhMjpTw62baISuOiUAzAKasVdCYte2d2ZVffvnq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788630815; c=relaxed/simple;
	bh=kzhy6xfu8LQQZVbjT2Dn3/A4J8FYYFhB4NI7o1tJe+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pjRP5WVXHdCGR6OgZSzYU/4XwhW0PYflk6ccaa4ocM+wCLl4z99vB7VL/q/ZRcaxWj4EiXNIHtzaWeD9WSv3u8/XKUq69dxtYzGN2FRTY803jppq1AV0qYX+XKBwjNI84myxde5GiEYQ8t8Pehzk7Y/b7oQF4W4pso1fbw0OPF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lN5bpN34; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lN5bpN34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB64B1F00ADE;
	Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788630812;
	bh=ai+qCKVGooyNyHPnec0n28qWkLpI/YR341Xh8tbfMVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lN5bpN34Vo4ZAjzpDJ8XyoAHg0R12di3aeGoDmYSR1uNMg+dtCNlLTgUrNtd8YIPe
	 2WpsMTS14ojzZLeS1CmZqnaLxFGZot8AVJ7M8rhYuq86EnLwzvqpx4Evudl4G+kFCC
	 YGGwz651Gc/i6DaVGvEvYbAcMyeZ6gsJEGhljnR6FTNipPl33381EoVTiGzG9KOLlf
	 fSZ6AsFs5g9Vnr6XgXEFr8aMLXLmKplW1TlnRRZsPmip+ftojTLV+RJEPE1mYhl5F4
	 0uPC1rm7CoSY3MwjfWbXrNhFqjnXl7SUkg8tutiLmbQ9WZLROo4E2/y/flrdZRsxjg
	 kq3qyyzyfpZpA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x2ua2-0000000Bkrt-3BWb;
	Sat, 05 Sep 2026 19:53:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Ani Sinha <anisinha@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 4/8] hw/i386: add GHES support at ICH9 and PIIX4 PM
Date: Sat,  5 Sep 2026 19:53:24 +0200
Message-ID: <b8649bce2afeef273880bac6c7a1dc4fa2d947d1.1788630333.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788630333.git.mchehab+huawei@kernel.org>
References: <cover.1788630333.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Enabling GHES support on x86 means that both PIIX4 and ICH9
PM controllers need to expose ghes state.

Implement that, as suggested by Igor.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250530164134.6c666b2e@imammedo.users.ipa.redhat.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ich9.c          | 19 +++++++++++++++++++
 hw/acpi/piix4.c         | 25 +++++++++++++++++++++++++
 hw/isa/lpc_ich9.c       |  6 ++++++
 include/hw/acpi/ich9.h  |  2 ++
 include/hw/acpi/piix4.h |  2 ++
 5 files changed, 54 insertions(+)

diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 5e8f8a7eafa3..7e2199891431 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -222,6 +222,24 @@ static const VMStateDescription vmstate_pcihp_state = {
     }
 };
 
+static bool ich9_hest_needed(void *opaque)
+{
+    ICH9LPCPMRegs *pm = opaque;
+
+    return pm->ghes_state.hest_addr_le != 0;
+}
+
+static const VMStateDescription vmstate_ich9_hest = {
+    .name = "ich9_pm/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = ich9_hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(ghes_state.hest_addr_le, ICH9LPCPMRegs),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_ich9_pm = {
     .name = "ich9_pm",
     .version_id = 1,
@@ -244,6 +262,7 @@ const VMStateDescription vmstate_ich9_pm = {
         &vmstate_tco_io_state,
         &vmstate_cpuhp_state,
         &vmstate_pcihp_state,
+        &vmstate_ich9_hest,
         NULL
     }
 };
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 9b7f50c7afac..48fa833c66ef 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -224,6 +224,24 @@ static bool vmstate_test_migrate_acpi_index(void *opaque, int version_id)
            !s->not_migrate_acpi_index;
 }
 
+static bool piix4_hest_needed(void *opaque)
+{
+    PIIX4PMState *s = opaque;
+
+    return s->ghes_state.hest_addr_le != 0;
+}
+
+static const VMStateDescription vmstate_piix4_hest = {
+    .name = "piix4_pm/hest",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = piix4_hest_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(ghes_state.hest_addr_le, PIIX4PMState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 /* qemu-kvm 1.2 uses version 3 but advertised as 2
  * To support incoming qemu-kvm 1.2 migration, change version_id
  * and minimum_version_id to 2 below (which breaks migration from
@@ -259,6 +277,7 @@ static const VMStateDescription vmstate_acpi = {
     .subsections = (const VMStateDescription * const []) {
          &vmstate_memhp_state,
          &vmstate_cpuhp_state,
+         &vmstate_piix4_hest,
          NULL
     }
 };
@@ -551,6 +570,11 @@ static void piix4_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
     acpi_cpu_ospm_status(&s->cpuhp_state, list);
 }
 
+static AcpiGhesState *piix4_get_ghes_state(AcpiDeviceIf *adev)
+{
+    return &PIIX4_PM(adev)->ghes_state;
+}
+
 static void piix4_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     PIIX4PMState *s = PIIX4_PM(adev);
@@ -607,6 +631,7 @@ static void piix4_pm_class_init(ObjectClass *klass, const void *data)
     hc->is_hotpluggable_bus = piix4_is_hotpluggable_bus;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
+    adevc->get_ghes_state = piix4_get_ghes_state;
 }
 
 static const TypeInfo piix4_pm_info = {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index edf9783ec8d4..00d940f16314 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -847,6 +847,11 @@ static const Property ich9_lpc_properties[] = {
                      pm.periodic_timer_enabled, true),
 };
 
+static AcpiGhesState *ich9_get_ghes_state(AcpiDeviceIf *adev)
+{
+    return &ICH9_LPC_DEVICE(adev)->pm.ghes_state;
+}
+
 static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
@@ -911,6 +916,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, const void *data)
     hc->is_hotpluggable_bus = ich9_pm_is_hotpluggable_bus;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
+    adevc->get_ghes_state = ich9_get_ghes_state;
     amldevc->build_dev_aml = build_ich9_isa_aml;
 }
 
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 30990fcef53f..772f1a8937d7 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -27,6 +27,7 @@
 #include "hw/acpi/memory_hotplug.h"
 #include "hw/acpi/acpi_dev_interface.h"
 #include "hw/acpi/ich9_tco.h"
+#include "hw/acpi/ghes.h"
 #include "hw/acpi/cpu.h"
 
 #define ACPI_PCIHP_ADDR_ICH9 0x0cc0
@@ -38,6 +39,7 @@ typedef struct ICH9LPCPMRegs {
      * PM1a_CNT_BLK = 2 in FADT so it is defined as uint16_t.
      */
     ACPIREGS acpi_regs;
+    AcpiGhesState ghes_state;
 
     MemoryRegion io;
     MemoryRegion io_gpe;
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index 863382a814ad..8732574e9c03 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -29,6 +29,7 @@
 #include "hw/i2c/pm_smbus.h"
 #include "hw/isa/apm.h"
 #include "hw/acpi/cpu.h"
+#include "hw/acpi/ghes.h"
 
 #define TYPE_PIIX4_PM "PIIX4_PM"
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4PMState, PIIX4_PM)
@@ -43,6 +44,7 @@ struct PIIX4PMState {
 
     MemoryRegion io_gpe;
     ACPIREGS ar;
+    AcpiGhesState ghes_state;
 
     APMState apm;
 
-- 
2.55.0

