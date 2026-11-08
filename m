Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127517;
	b=4N8weEQPxyyVbEC76u7MoMWYk+/gnXYlKLgdvL6b9rWytXzWdCsnu+AwRHuesb4b4DQt
	 4IDA95nQ+vRUWve+s6C7oynangmQ9kvpyirjVm/tYdS+dR7+bblElRRnSG+r/xolPBlZB
	 joRoXZZIhuyRwxoAWCoV5olBPfifxdQ5XkHWcM5FMJ3fiq1sNRi36IGNXzfGVYMwefUKx
	 7Maja6cps8Or8MrrWuToSOYHdLzLxNjL9yLHA24y3F5wRgrfI8l6fWs/kl19m17ZLylua
	 DNXpKCBColvw4bbr1BoY7SemG2wSRoiQIYQK9Ct3JJ5IWXFfGN8AXu+k9iSEZJkgSwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127517;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=I2XLjCfdJI80b8H8+Sz+cjBAZ3Uf9N57rJCQ1mkeRFY=;
	b=tr9LupbYfLp+3kt33k7DZHJ49UJgj2K/pSA1zerLFDANoCU+InYgGoNXso0uSfhDOKjz
	 U2IbyfnnILH6/qC4bcTRuDl+SzJ4B7SO8EvPp2nqD2T08T1rEk4GmwcpMHxJloc0ptNo3
	 kP/Fq3+NxQQp4hVa8JoQgtkLkmOM+0u7uaahPkye1d+E9ISVmu+Jnj1f2PB9eK5JEivVI
	 mand/tZz8obwIXSRFjaX8uZEJnzmZ2RNpHGRgF0dX5rJt5KQ+uC9itcz4ME4Wj7MMemgd
	 O5F5FjRqmDk75Hxa431nC004bLo0CldzR7SihV79s4w2/14lFcO+8IqNdUme9IK4vVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkEwYqRn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADE8606A321
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkEwYqRn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F681F008A5;
	Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127516;
	bh=I2XLjCfdJI80b8H8+Sz+cjBAZ3Uf9N57rJCQ1mkeRFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bkEwYqRneVmNYXtB3rLc60BWxDoJpumJvbX1cIq5XWXl5bpwvdgfCTg5oByUl6Me7
	 bzOrgq84BkGZd1lHb/FfD+Hww7epXpMXni6XIJWiEQNO8HGvxtMwcQvSBWodUMNHei
	 HRhDFX0LG4JLigYBvlevzKJEYHaZ6X/0vq5rcKwVgvKhNMOjaGSxfGAUmO3UUoYcF0
	 DmA2x6ZzewLF1Ju358uKSaItUrRIKGistOSk0Rggw0BLFYc1NpMsiqTDAMsb7NnUNT
	 SciaW+TF2gm4r+yHPPyM6kD6Mvdm+M4lVfEToSmkxtnYIKfa05kuX4awxe7GhJ8pV/
	 CWuahAN8qwbaA==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyWY-00000005TML-2HQ4;
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
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v2 1/8] acpi_dev_interface: add ghes support state at AcpiDeviceIfClass
Date: Sun,  8 Nov 2026 09:45:02 +0100
Message-ID: <aff323aeeb5b315266cede9213112b053325c66d.1794124132.git.mchehab+huawei@kernel.org>
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

Currently, ghes.c assumes that GHES support can be checked by
looking at GED. This is valid only for aarch64. As we're now
adding support for other architectures, this needs to be done
on a different way.

For instance, on x86, it needs to detect if GHES is supported
inside ICH9 and PIIX4 PM.

Add an ancillary method at acpi_dev_interface to share
information if ghes is supported on an arch-independent way.

It should be noticed that, with this change, there's no need to
include anymore hw/acpi/generic_event_device.h, as this were the
aarch64-specific GED interface sits and the code is now generic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/acpi_interface.c             |  7 +++++++
 hw/acpi/generic_event_device.c       |  6 ++++++
 hw/acpi/ghes.c                       | 30 +++++++++++++++++-----------
 include/hw/acpi/acpi_dev_interface.h |  6 ++++++
 4 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/acpi_interface.c b/hw/acpi/acpi_interface.c
index a44679017ead..bf11acfbb54b 100644
--- a/hw/acpi/acpi_interface.c
+++ b/hw/acpi/acpi_interface.c
@@ -3,6 +3,13 @@
 #include "hw/acpi/acpi_aml_interface.h"
 #include "qemu/module.h"
 
+AcpiGhesState *acpi_device_get_ghes_state(AcpiDeviceIf *adev)
+{
+    AcpiDeviceIfClass *klass = ACPI_DEVICE_IF_GET_CLASS(adev);
+
+    return klass->get_ghes_state ? klass->get_ghes_state(adev) : NULL;
+}
+
 static void register_types(void)
 {
     static const TypeInfo acpi_dev_if_info = {
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 65a5d1612fa4..c0913d458ff5 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -324,6 +324,11 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
     acpi_cpu_ospm_status(&s->cpuhp_state, list);
 }
 
+static AcpiGhesState *acpi_ged_get_ghes_state(AcpiDeviceIf *adev)
+{
+    return &ACPI_GED(adev)->ghes_state;
+}
+
 static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 {
     AcpiGedState *s = ACPI_GED(adev);
@@ -610,6 +615,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
 
     adevc->ospm_status = acpi_ged_ospm_status;
     adevc->send_event = acpi_ged_send_event;
+    adevc->get_ghes_state = acpi_ged_get_ghes_state;
 
     object_class_property_add_uint16_ptr(class, ACPI_PCIHP_IO_BASE_PROP,
                                          offsetof(AcpiGedState,
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b2d5e3499320..3989fd4d7e91 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -24,7 +24,7 @@
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/aml-build.h"
 #include "qemu/error-report.h"
-#include "hw/acpi/generic_event_device.h"
+#include "hw/acpi/acpi_dev_interface.h"
 #include "hw/nvram/fw_cfg.h"
 #include "qemu/uuid.h"
 #include "exec/cpu-common.h"
@@ -587,21 +587,27 @@ bool acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
                                    source_id, errp);
 }
 
-AcpiGhesState *acpi_ghes_get_state(void)
+static int acpi_ghes_find_state(Object *obj, void *opaque)
 {
-    AcpiGedState *acpi_ged_state;
+    Object *adev = object_dynamic_cast(obj, TYPE_ACPI_DEVICE_IF);
     AcpiGhesState *ags;
 
-    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
-
-    if (!acpi_ged_state) {
-        return NULL;
+    if (!adev) {
+        return 0;
     }
-    ags = &acpi_ged_state->ghes_state;
-
-    if (!ags->hw_error_le && !ags->hest_addr_le) {
-        return NULL;
+    ags = acpi_device_get_ghes_state(ACPI_DEVICE_IF(adev));
+    if (!ags || (!ags->hw_error_le && !ags->hest_addr_le)) {
+        return 0;
     }
+    *(AcpiGhesState **)opaque = ags;
+    return 1;
+}
+
+AcpiGhesState *acpi_ghes_get_state(void)
+{
+    AcpiGhesState *ags = NULL;
+
+    object_child_foreach_recursive(object_get_root(), acpi_ghes_find_state,
+                                   &ags);
     return ags;
 }
diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
index 65debb90a8d4..644e0006ff6a 100644
--- a/include/hw/acpi/acpi_dev_interface.h
+++ b/include/hw/acpi/acpi_dev_interface.h
@@ -26,6 +26,7 @@ DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
                      TYPE_ACPI_DEVICE_IF)
 
 typedef struct AcpiDeviceIf AcpiDeviceIf;
+typedef struct AcpiGhesState AcpiGhesState;
 
 /**
  * AcpiDeviceIfClass:
@@ -33,6 +34,7 @@ typedef struct AcpiDeviceIf AcpiDeviceIf;
  * ospm_status: returns status of ACPI device objects, reported
  *              via _OST method if device supports it.
  * send_event: inject a specified event into guest
+ * get_ghes_state: returns the controller's GHES state, if supported
  * madt_cpu: fills @entry with Interrupt Controller Structure
  *           for CPU indexed by @uid in @apic_ids array,
  *           returned structure types are:
@@ -50,5 +52,9 @@ struct AcpiDeviceIfClass {
     /* <public> */
     void (*ospm_status)(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
     void (*send_event)(AcpiDeviceIf *adev, AcpiEventStatusBits ev);
+
+    AcpiGhesState *(*get_ghes_state)(AcpiDeviceIf *adev);
 };
+
+AcpiGhesState *acpi_device_get_ghes_state(AcpiDeviceIf *adev);
 #endif
-- 
2.56.0

