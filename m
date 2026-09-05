Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030212F5498
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788630814; cv=none; b=UAs8m4tbtx6uo/W2+85gEmIkIwjZrJKEPNj7LYXOTsPhULXGrVb8qWUZ5zmrX42d+eZzvXL2hGIm3r93zPlMq0eFJP4gt5nVao7K3Mofvug3OsdFkO+x0LK3W2w/cep9CWYrTDNNys1FZaHwh7O5BZAn8lruAB26JqX1DT63jnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788630814; c=relaxed/simple;
	bh=oQOWy4YqE8jWdnHa7Lg0rIniFTXUqFCPPBEvSrUCnQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3RGQf5S3I7LAkXZgd6VbQB1OH3LvBjWGIhD6/0GoNqtelpHJI79vZr1iWvjZNtUcDGwgvGA0k8bRiIPUgkNY4CprfxxQ9CQutd9e5FtuONCUAOVMDu4e9fnP2WGoQJQgz8q5bhr50o5YymMJ7ewb4Q7rja7kXzh7fEK8eofqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtMpxe9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtMpxe9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36041F00AC4;
	Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788630812;
	bh=jHK8n1qrvOc4Q7942MjOL/+nZI/aby+kUuZA3CrS3NM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DtMpxe9Tf/6MaeBUcaiX7p83EidvSXpc//F9xrdJ67NUvJM2B6RHiPWGNOhRibykW
	 C0hwHR27yRNPX327s+uy0Z9nVFM7ovJEMyaZrm5zVX6QXOqh/Ehdwqr9pH+5UQ0apb
	 EhAqAQl7anPVubtiyY6Q1E0qcDuGYKhZ4L+1RB7ge+YG+AF88BX8ZvUdBhXqClkUqy
	 7vkas/LTfe2l4J3IimKDNzOAAnalXveRknnCyQBxSA+EVN33hPM/+P/WoQ39S2XlcS
	 jExOHZHjOyB57hc/BkAl8dNKW1OJ67z2HZbkG9OQF+wwvOmCVCkjTqLqRPt19OV+Na
	 XEifN6nb6Kb3w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x2ua2-0000000Bks5-3Vr1;
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
Subject: [PATCH 7/8] tests: test GHES notifications on arm64 virt machine
Date: Sat,  5 Sep 2026 19:53:27 +0200
Message-ID: <16e6d6155893f3facb9f258103eea6f9ba4c4818.1788630333.git.mchehab+huawei@kernel.org>
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

QEMU has support for HEST table since version 9.2. Yet, it currently
lacks a test to check if the HEST table is working.

Add tests for arm64 error inject mechanism, implemented at
QEMU version 10.2.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/qtest/bios-tables-test.c | 80 ++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 5cc526510ac1..5582b1dd72e4 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -68,6 +68,7 @@
 
 #define MACHINE_PC "pc"
 #define MACHINE_Q35 "q35"
+#define VIRT_ACPI_GED_BASE 0x09080000
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
@@ -913,6 +914,84 @@ static uint8_t base_required_struct_types[] = {
     0, 1, 3, 4, 16, 17, 19, 32, 127
 };
 
+static void test_acpi_ghes_v2_injection(test_data *data)
+{
+    const uint8_t cper[20] = { [0] = 2, [16] = 2 }; /* corrected GESB */
+    g_autofree char *payload = g_base64_encode(cper, sizeof(cper));
+    uint64_t status_addr, ack_addr;
+    uint8_t actual[sizeof(cper)];
+    QTestState *qts = data->qts;
+    const uint8_t *ghes = NULL;
+    AcpiSdtTable *hest = NULL;
+    AcpiSdtTable *table;
+
+    for (unsigned i = 0; i < data->tables->len; i++) {
+        table = &g_array_index(data->tables, AcpiSdtTable, i);
+
+        if (compare_signature(table, "HEST")) {
+            hest = table;
+            break;
+        }
+    }
+    g_assert_nonnull(hest);
+
+    for (unsigned i = 0; i < ldl_le_p(hest->aml + 36); i++) {
+        const uint8_t *entry = hest->aml + 40 + i * 92;
+
+        g_assert_cmpuint(lduw_le_p(entry), ==, 10); /* GHESv2 */
+        if (lduw_le_p(entry + 2) == 1) { /* QMP source */
+            ghes = entry;
+            break;
+        }
+    }
+    g_assert_nonnull(ghes);
+    g_assert_cmpuint(ghes[32], ==, 7); /* GPIO notification */
+    status_addr = qtest_readq(qts, ldq_le_p(ghes + 24));
+    ack_addr = ldq_le_p(ghes + 68);
+    g_assert_cmphex(status_addr, !=, 0);
+    g_assert_cmphex(ack_addr, !=, 0);
+    g_assert_cmpuint(qtest_readq(qts, ack_addr), ==, 1);
+
+    for (unsigned i = 0; i < 3; i++) {
+        qtest_qmp_assert_success(qts,
+            "{'execute': 'inject-ghes-v2-error', 'arguments': {'cper': %s}}",
+            payload);
+        g_assert_cmpuint(qtest_readq(qts, ack_addr), ==, 0);
+        qtest_memread(qts, status_addr, actual, sizeof(actual));
+        g_assert_cmpmem(actual, sizeof(actual), cper, sizeof(cper));
+
+        /* GED converts the GPIO notification into an Error event. */
+        g_assert_cmphex(qtest_readl(qts, VIRT_ACPI_GED_BASE), ==, 0x20);
+        g_assert_cmphex(qtest_readl(qts, VIRT_ACPI_GED_BASE), ==, 0);
+
+        /* A second injection must wait for OSPM's acknowledgement. */
+        qobject_unref(qtest_qmp_assert_failure_ref(qts,
+            "{'execute': 'inject-ghes-v2-error', 'arguments': {'cper': %s}}",
+            payload));
+        qtest_writeq(qts, ack_addr, 1);
+    }
+}
+
+static void test_acpi_aarch64_virt_ras(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .arch = "aarch64",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * MiB,
+    };
+
+    test_vm_prepare("-cpu cortex-a57 -machine ras=on", &data);
+    process_acpi_tables_noexit(&data);
+    test_acpi_ghes_v2_injection(&data);
+    qtest_quit(data.qts);
+    free_test_data(&data);
+}
+
 static void test_acpi_piix4_tcg(void)
 {
     test_data data = {};
@@ -2922,6 +3001,7 @@ int main(int argc, char *argv[])
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg && qtest_has_device("virtio-blk-pci")) {
             qtest_add_func("acpi/virt", test_acpi_aarch64_virt_tcg);
+            qtest_add_func("acpi/virt/ras", test_acpi_aarch64_virt_ras);
             qtest_add_func("acpi/virt/acpihmatvirt",
                            test_acpi_aarch64_virt_tcg_acpi_hmat);
             qtest_add_func("acpi/virt/topology",
-- 
2.55.0

