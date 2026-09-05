Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B9361DC1
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788630814; cv=none; b=d9kYbrfJHD+7/UWBl/c2qfYI4iFTS5qiHyD7gvxc36iv1m2b7Y2MuFL2+rTUD/ieuhtu7fkYQWUqIc+81wEOMA/jYU9eMiMXK4PsunjpXFvbaqptGxM1Z4cGb9g4k0IufGuUYhIvTFj4LZbZmjLtzCKeR+1eXDY+DvzolzT1vjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788630814; c=relaxed/simple;
	bh=1FPbUc6PMkKLqM7iP42LBmesZwUGcyiOS6hukwV3Rqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmzaCoaecCbLcw5F707+Zmf3eg1kCcQFxCMVhZG0hOv5GHoLD16KUdMkUSg4rNANhjxwRSwdtTY3xVSlL/AQAISUzM7gi7nbHgObV/DO9AH53FO6IHgDEDefl70fccI0b7dblm9lh6NzGOEFqBbIx3X/2rMCIOuXG8j3us47yE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HdFSPVFF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HdFSPVFF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D53F1F00A3D;
	Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788630812;
	bh=nXZSXnMuGsLcEv+yuUu6nqHWYxfBU+FXG7tpegXc2q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HdFSPVFFh7WCXCORzRQ3WCtc+dEnY72RJI1VWbHZf0dmNc3/iqN40ZptjFT/F1fuS
	 BXSXI41qgKXQwDH3n4f34Jn9jW8CPGCRcB5KEZ4G91TTaw+KwNwy5tDEb+Ypgn5VIS
	 8M/KZaRI6MpQSsOaxpwrvQDKjcWPp9yLqkhFK/EXtHtcUMWCDVkA8WuYpGo7yhTaM6
	 wyBh4pIuV9wHJpYjN9zxqgce6YVjTMW/HDwNaxxuUJoC2OATqLw+vRmNd/uFbBqhv4
	 DSxdMh4qDXjf8x4gvh0tpE9BkRScQtcGPlRPl6B1DPqy/lTHXP+uL4SRYB16rbCZ/P
	 8iWredpcXujgw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x2ua2-0000000Bkrh-2r4n;
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
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH 1/8] acpi_dev_interface: a ghes support state at AcpiDeviceIfClass
Date: Sat,  5 Sep 2026 19:53:21 +0200
Message-ID: <28339fd62574150afe924b93c81f62bfaacb54b6.1788630333.git.mchehab+huawei@kernel.org>
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

For x86, we'll need to have a way to detect if GHES is
supported inside ICH9 and PIIX4 PM.

Add an ancillary method at acpi_dev_interface to share
information if ghes is supported on a common arch-independent
place.

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
index 9e9416d4067d..2c5abe2a54f5 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -322,6 +322,11 @@ static void acpi_ged_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
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
@@ -608,6 +613,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
 
     adevc->ospm_status = acpi_ged_ospm_status;
     adevc->send_event = acpi_ged_send_event;
+    adevc->get_ghes_state = acpi_ged_get_ghes_state;
 }
 
 static const TypeInfo acpi_ged_info = {
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
2.55.0

