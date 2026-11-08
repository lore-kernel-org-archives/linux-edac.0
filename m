Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127517;
	b=zzwkmhzyzkMaxEMoOGvbMySH9sa55YQGHJfm10FcocS8sguo/qgD8Ojw6+18UW5zW5/9
	 5NKmpO6dW/LT8G1wR8IrG0tvGTE9b/rHh6j6oIYMo2vq2fPiHfyO7UdhRrZRzcZX1EbvC
	 aVW6adaHpZLXnbAJClcRip3v1HsMYzx0rhSWw4uLO6kVMVnDll8GTMvQqLrsWFGcR4rh1
	 xdvUyXFrjOLBL/1ZUqI3ah03vob7eMKzftNPSSDz+A5QIjS4RIN+iztUuHHgE6/bN3mR2
	 FZfS/1IdO5/4odkbCZQtPfwxFvB+k/TwB2lzgCVXrI6elN2Sxea5S6fCXgu6yy0yyvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127517;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=dtj/JRYxHWgoRtzy0x5ktxY1NkPyMJTom3ccS1vcjsA=;
	b=Ob7mYCQeK9LTkS+JboLTCcPgDmwNz7e0wDj7jvDsPQy4QJWpTfpr4oSiQmHUzTtFpceu
	 tTDw+zDa8q/fYd8LYeoI/6kLCEqTyMJWFne3OGYWXqDytGq45Ogbf3aQCYE9sCgY4cu5w
	 EtX46tUyeTZJUN0NAloCFx34TO/VYTz7iXBP+AWbqB3CazUc44NpPu2dIJNB5CGnEi/x3
	 88X1PdhMfTx5k7TUA+jqGLja0JWtWqtjTo5vrbmoLIQEKypctXIcPUuw8zykdGXByWx7k
	 m1bxNA4Ypld/+VUCezd37jbgOVFSyzxZeBafav3orvz3W60Wq0L+skvmzswXe1Gjblg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPj6395R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195EE606A32A
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iPj6395R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEAB1F008AB;
	Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127516;
	bh=dtj/JRYxHWgoRtzy0x5ktxY1NkPyMJTom3ccS1vcjsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iPj6395RmOlKm9HvPCW+J4JuYZtVTUt1oJSBplNAAKS5WHP5bQazVOpIACBpz7SlN
	 XdEjYA6WfSe+VPKc/8hinxVbJRQUFbNn2Z6KKxstXmrha+337DmoomecysecmB8xYB
	 x9rGdPo7SaRvyRyWnnJGbs4+Akx+4wnfLt5Xnoe0p+gOhYlqRCKC9pddNjrTnpOGST
	 qrKpsS5BKY/O4PVMQnSTh0cLku2OC4Ti2OmgJJbyZzx8VKCI+u1k+V2aHinypspOa+
	 0EXaDxeAuVOYEYtX6DDbjAn8nL2CRiSAw2k++JsiuvpOpiayvFPOSs/0g6RvUs02xX
	 kYmEDPWAXLViA==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyWY-00000005TMX-2bfH;
	Sun, 08 Nov 2026 09:45:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Ani Sinha <anisinha@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 4/8] hw/i386: add GHES support at ICH9 and PIIX4 PM
Date: Sun,  8 Nov 2026 09:45:05 +0100
Message-ID: <bd61e2e8fe67bb592e67477416d436285967dcd0.1794124132.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794124132.git.mchehab+huawei@kernel.org>
References: <cover.1794124132.git.mchehab+huawei@kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
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
index 91a22a8e9480..39303e681406 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -223,6 +223,24 @@ static const VMStateDescription vmstate_pcihp_state = {
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
@@ -245,6 +263,7 @@ const VMStateDescription vmstate_ich9_pm = {
         &vmstate_tco_io_state,
         &vmstate_cpuhp_state,
         &vmstate_pcihp_state,
+        &vmstate_ich9_hest,
         NULL
     }
 };
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index a7d5356340be..854a1008deff 100644
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
@@ -561,6 +580,11 @@ static void piix4_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
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
@@ -617,6 +641,7 @@ static void piix4_pm_class_init(ObjectClass *klass, const void *data)
     hc->is_hotpluggable_bus = piix4_is_hotpluggable_bus;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
+    adevc->get_ghes_state = piix4_get_ghes_state;
 
     object_class_property_add_uint16_ptr(klass, ACPI_PCIHP_IO_BASE_PROP,
                                          offsetof(PIIX4PMState,
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index b55b5136a385..f321c2d6e95f 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -833,6 +833,11 @@ static const Property ich9_lpc_properties[] = {
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
@@ -900,6 +905,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, const void *data)
     hc->is_hotpluggable_bus = ich9_pm_is_hotpluggable_bus;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
+    adevc->get_ghes_state = ich9_get_ghes_state;
     amldevc->build_dev_aml = build_ich9_isa_aml;
 
     object_class_property_add_uint8_ptr(klass, ACPI_PM_PROP_SCI_INT,
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 6956b2b9c9a2..67db16d93523 100644
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
2.56.0

