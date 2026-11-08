Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127517;
	b=DxDAfrDrnl8gRJMQJQwizH+xWChZFoCywz33Ap2EvOOR0MEIblm8Jn4FENJnI61kE2kU
	 K1RckRMJj0taXxQjlMx1uvZkLztlg+iga6ZepPeROChM3sPAjT24bj0rlnP/zFqdcqNaB
	 V/QAhATnEpNBwlcLC7Y4YJ3Ljn073ffP4gy9hxoTlDJkJL6RN6hsBHO1dLAEWn8j3xub0
	 y6tri+dIi5g463omAxeEgOf8Khcdidb4VDaABSPvy10xlU5wvakOJhl4okDbF6KDU9RGe
	 kFkSKr/FnrmVW1mDO1pHL2ohtl8tnHSU71KPdVe8v6xa6j3n9v7FCIt3Z3j3jA60yVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127517;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=fJ2D4+UepDWKzql8BSO7qAOcZ4LOSTF9J2TAyckyQC0=;
	b=IN5Iy6+CoJe9BvI19tCkWAZoaBB50XHbaqO40HwPO3nKdMBZeNZLOeKOWdMXcXmrBVe3
	 z4rmq1ZOCfopzlwYkUgGs7n+tJFP/GJQrowTvzjtnoe/sJtSw3wGkDVq+Msf+VqlAUeVS
	 7eIPRABcEQJdfB6ZR7TXacoUfiBLNTJokZSqz3QjFwVSUWFjXiGGmoeHLKbQnNK7e4ESy
	 NPrA3pHGtQrYl4l6Rb/OPUFndsU4WldF/U1ZL+jH/diU1njsjG6rcI/1O5WkZ9029jFeW
	 XevFN57uABvUaiQPeu6GnmiW1c+yNPBCgiXA7PihKPZ7P5z8l7Z30XgTuUu4ly6byxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lmIgeCCo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1971C606A330
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lmIgeCCo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFA31F008A7;
	Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127516;
	bh=fJ2D4+UepDWKzql8BSO7qAOcZ4LOSTF9J2TAyckyQC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lmIgeCCot26vi5t6wISZcVbgp2cfazeMZDqXcE2vM2veB+N3K+qV+168S5lrKuxlQ
	 8twqpscIj+qFTPbUuWZHfRcdo6WshH295zbXB9ipCOcu4IzOsjpp6CGG8TTxCgSLNz
	 7cYTUFP6efQFLDBxZ7S8P0d+o6advvwcQSmSlQXzF0xtgyqOJtQQ1zY6DzHbLcUq93
	 qyzvbe5H4XUiF9KM6FpziPVjIi2ZtWFry8hO7kImjM4GFoSvuUo/JTmrHIGSR0xaOq
	 gtvwOlA6et107lFBamIrbNwsE//KM7lP7u9i4LXsN91749BL05nvoiQQrezwsZD5qb
	 xXolyE+4iwHKQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyWY-00000005TMn-31p0;
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
Subject: [PATCH v2 8/8] tests: add GHES tests on x86 piix4 and q35 machines
Date: Sun,  8 Nov 2026 09:45:09 +0100
Message-ID: <904d946b5130aa53779454aba43334140500159d.1794124132.git.mchehab+huawei@kernel.org>
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

Add support to test GHES on x86 using the SCI mechanism.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/qtest/bios-tables-test.c | 67 ++++++++++++++++++++++++++++++----
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 884af30d77ff..4e9eac290472 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -914,7 +914,8 @@ static uint8_t base_required_struct_types[] = {
     0, 1, 3, 4, 16, 17, 19, 32, 127
 };
 
-static void test_acpi_ghes_v2_injection(test_data *data)
+static void test_acpi_ghes_v2_injection(test_data *data, bool sci,
+                                        int notif_type)
 {
     const uint8_t cper[20] = { [0] = 2, [16] = 2 }; /* corrected GESB */
     g_autofree char *payload = g_base64_encode(cper, sizeof(cper));
@@ -923,14 +924,18 @@ static void test_acpi_ghes_v2_injection(test_data *data)
     QTestState *qts = data->qts;
     const uint8_t *ghes = NULL;
     AcpiSdtTable *hest = NULL;
+    AcpiSdtTable *fadt = NULL;
     AcpiSdtTable *table;
+    uint8_t gpe_len;
+    uint32_t gpe0;
 
     for (unsigned i = 0; i < data->tables->len; i++) {
         table = &g_array_index(data->tables, AcpiSdtTable, i);
 
         if (compare_signature(table, "HEST")) {
             hest = table;
-            break;
+        } else if (compare_signature(table, "FACP")) {
+            fadt = table;
         }
     }
     g_assert_nonnull(hest);
@@ -945,29 +950,51 @@ static void test_acpi_ghes_v2_injection(test_data *data)
         }
     }
     g_assert_nonnull(ghes);
-    g_assert_cmpuint(ghes[32], ==, 7); /* GPIO notification */
+    g_assert_cmpuint(ghes[32], ==, notif_type);
     status_addr = qtest_readq(qts, ldq_le_p(ghes + 24));
     ack_addr = ldq_le_p(ghes + 68);
     g_assert_cmphex(status_addr, !=, 0);
     g_assert_cmphex(ack_addr, !=, 0);
     g_assert_cmpuint(qtest_readq(qts, ack_addr), ==, 1);
 
+    if (sci) {
+        g_assert_nonnull(fadt);
+        gpe0 = ldl_le_p(fadt->aml + 80);
+        gpe_len = fadt->aml[92];
+        qtest_irq_intercept_in(qts, "ioapic");
+        qtest_outb(qts, gpe0, 0xff);
+        qtest_outb(qts, gpe0 + gpe_len / 2, 0x80);
+    }
+
     for (unsigned i = 0; i < 3; i++) {
+        if (sci) {
+            g_assert_false(qtest_get_irq(qts, 9));
+        }
         qtest_qmp_assert_success(qts,
             "{'execute': 'inject-ghes-v2-error', 'arguments': {'cper': %s}}",
             payload);
         g_assert_cmpuint(qtest_readq(qts, ack_addr), ==, 0);
         qtest_memread(qts, status_addr, actual, sizeof(actual));
         g_assert_cmpmem(actual, sizeof(actual), cper, sizeof(cper));
-
-        /* GED converts the GPIO notification into an Error event. */
-        g_assert_cmphex(qtest_readl(qts, VIRT_ACPI_GED_BASE), ==, 0x20);
-        g_assert_cmphex(qtest_readl(qts, VIRT_ACPI_GED_BASE), ==, 0);
+        if (sci) {
+            g_assert_cmphex(qtest_inb(qts, gpe0) & 0x80, ==, 0x80);
+            g_assert_true(qtest_get_irq(qts, 9));
+        } else {
+            /* GED converts the GPIO notification into an Error event. */
+            g_assert_cmphex(qtest_readl(qts, VIRT_ACPI_GED_BASE), ==, 0x20);
+            g_assert_cmphex(qtest_readl(qts, VIRT_ACPI_GED_BASE), ==, 0);
+        }
 
         /* A second injection must wait for OSPM's acknowledgement. */
         qobject_unref(qtest_qmp_assert_failure_ref(qts,
             "{'execute': 'inject-ghes-v2-error', 'arguments': {'cper': %s}}",
             payload));
+
+        if (sci) {
+            /* Emulate OSPM clearing the edge GPE. */
+            qtest_outb(qts, gpe0, 0x80);
+            g_assert_false(qtest_get_irq(qts, 9));
+        }
         qtest_writeq(qts, ack_addr, 1);
     }
 }
@@ -987,7 +1014,28 @@ static void test_acpi_aarch64_virt_ras(void)
 
     test_vm_prepare("-cpu cortex-a57 -machine ras=on", &data);
     process_acpi_tables_noexit(&data);
-    test_acpi_ghes_v2_injection(&data);
+    test_acpi_ghes_v2_injection(&data, false, 7);
+    qtest_quit(data.qts);
+    free_test_data(&data);
+}
+
+static void test_acpi_x86_ras(const void *opaque)
+{
+    test_data data = {
+        .machine = opaque,
+        .arch = "x86",
+        .variant = ".ras",
+    };
+
+    test_vm_prepare("-machine ras=on", &data);
+    process_acpi_tables_noexit(&data);
+    test_acpi_ghes_v2_injection(&data, true, 3);
+    free_test_data(&data);
+
+    /* Check if fw restored error buffer, then write back HEST on reset. */
+    qtest_system_reset(data.qts);
+    process_acpi_tables_noexit(&data);
+    test_acpi_ghes_v2_injection(&data, true, 3);
     qtest_quit(data.qts);
     free_test_data(&data);
 }
@@ -2883,6 +2931,8 @@ int main(int argc, char *argv[])
         }
         if (qtest_has_machine(MACHINE_PC)) {
             qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
+            qtest_add_data_func("acpi/piix4/ras", MACHINE_PC,
+                                test_acpi_x86_ras);
             qtest_add_func("acpi/piix4/oem-fields", test_acpi_piix4_oem_fields);
             qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
             qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
@@ -2921,6 +2971,7 @@ int main(int argc, char *argv[])
         }
         if (qtest_has_machine(MACHINE_Q35)) {
             qtest_add_func("acpi/q35", test_acpi_q35_tcg);
+            qtest_add_data_func("acpi/q35/ras", MACHINE_Q35, test_acpi_x86_ras);
             qtest_add_func("acpi/q35/oem-fields", test_acpi_q35_oem_fields);
             if (tpm_model_is_available("-machine q35", "tpm-tis")) {
                 qtest_add_func("acpi/q35/tpm2-tis", test_acpi_q35_tcg_tpm2_tis);
-- 
2.56.0

