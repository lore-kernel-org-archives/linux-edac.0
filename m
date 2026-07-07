Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F112480947;
	Tue,  7 Jul 2026 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461190; cv=none; b=gYz8r1W2D7NhsKxzjMc63Bp0MYfAGNUSano6HWWZuBGwCQv8CXVGVQclpXYOpPeNxkK0a1vI6k9fFwdH5lGztgFndMzwCKNXs+EAxJNpJnmWxD0J5JbAGmKoD4ByDwLceGJErTxFPIiXCqDXwjgOApqbF2I1e0LHeIEFTMNlS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461190; c=relaxed/simple;
	bh=hql0nGutKLKqPYW8hgD7HLIzSbVNAESM2UtuzdeUYa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bpucw9EvZwovPvoLRKcj31YNiy5fI3/VcxdkDimKjzpAklx3E/3rQ5BENgm7yoeSSxRYojM2WSUkuSe7gST68Aoq43hdCYJ+j84UWA5y8bR1K8tJBni22U8LNUALdGVXVGpE/aV81IMXgkkMhVgkCqdYJZ2EAE/kQRU4Bp+wkEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhZ3ngdJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhZ3ngdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC8A1F000E9;
	Tue,  7 Jul 2026 21:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783461189;
	bh=EReJH6JU8KJUB4XX0GWeW+oXFBmobufr2irI8YwuCo0=;
	h=From:To:Cc:Subject:Date;
	b=GhZ3ngdJnBtLB9p772PfS4fvhJdLP+lkgmkh5Msv/dMzK5diwy/pUU7Qzkoh4tEQa
	 /xXyq/llSmLAs0nIiRHyrlSVFDZ92qK5bvvCdDDIQBMEowDNROna79YgceuNSQgeTV
	 v7LebhJ+1Bzdm3G0Dlp9JqrlLYyA84ZhVVYaPRSqAO+h62e55KrP8khFkkNSGtQwvA
	 TuOZQ/547bBcOWhB8O8Wh7BKCXBZGaLwUpzTrlWVfb2LuJREsAUWNnbBNxsW3ZSQ80
	 VtMBLWsfAUoxlgncI0qFLH9HtfX+Ptl2CLdg6sK6e2YYu50FXOwy8fpZjQD+3qnxlD
	 Cybuu4/ttBvfQ==
From: Borislav Petkov <bp@kernel.org>
To: Tony Luck <tony.luck@intel.com>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] EDAC/dummy: Add a dummy EDAC driver
Date: Tue,  7 Jul 2026 14:53:07 -0700
Message-ID: <20260707215307.396571-1-bp@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

A dummy EDAC driver is useful for testing purposes in a VM when one
doesn't have all the hardware needed to test aspects of the EDAC
subsystem code.

Assisted-by: Claude:Sonnet-5
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/edac/Kconfig      |   9 ++
 drivers/edac/Makefile     |   3 +-
 drivers/edac/dummy_edac.c | 193 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 drivers/edac/dummy_edac.c

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index a44b85c440ca..a8914baa5f7e 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -581,4 +581,13 @@ config EDAC_VERSALNET
 	  and other system errors from various IP subsystems like RPU, NOCs,
 	  HNICX, PL on the AMD Versal NET DDR memory controller.
 
+config EDAC_DUMMY
+	tristate "Dummy EDAC driver"
+	default n
+	help
+	  A dummy EDAC driver is useful for testing purposes in a VM when one
+	  doesn't have all the hardware needed to test aspects of the EDAC
+	  subsystem code.
+
+	  You definitely wanna say N here.
 endif # EDAC
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index a37534300ab9..92f8d03dad30 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_EDAC_I7300)		+= i7300_edac.o
 obj-$(CONFIG_EDAC_I7CORE)		+= i7core_edac.o
 obj-$(CONFIG_EDAC_SBRIDGE)		+= sb_edac.o
 obj-$(CONFIG_EDAC_PND2)			+= pnd2_edac.o
-obj-$(CONFIG_EDAC_IGEN6)			+= igen6_edac.o
+obj-$(CONFIG_EDAC_IGEN6)		+= igen6_edac.o
 obj-$(CONFIG_EDAC_E7XXX)		+= e7xxx_edac.o
 obj-$(CONFIG_EDAC_E752X)		+= e752x_edac.o
 obj-$(CONFIG_EDAC_I82875P)		+= i82875p_edac.o
@@ -91,3 +91,4 @@ obj-$(CONFIG_EDAC_VERSAL)		+= versal_edac.o
 obj-$(CONFIG_EDAC_LOONGSON)		+= loongson_edac.o
 obj-$(CONFIG_EDAC_VERSALNET)		+= versalnet_edac.o
 obj-$(CONFIG_EDAC_CORTEX_A72)		+= a72_edac.o
+obj-$(CONFIG_EDAC_DUMMY)		+= dummy_edac.o
diff --git a/drivers/edac/dummy_edac.c b/drivers/edac/dummy_edac.c
new file mode 100644
index 000000000000..00b4fee3fc8d
--- /dev/null
+++ b/drivers/edac/dummy_edac.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Dummy EDAC driver
+ *
+ * A minimal EDAC device driver that registers its own platform device
+ * unconditionally, so it probes successfully on any system -- including
+ * VMs and guests that have no real ECC-capable cache/memory hardware
+ * exposed to them. Useful for exercising the EDAC core, sysfs interface,
+ * and userspace tooling (edac-utils, mcelog, etc.) without needing the
+ * physical hardware the "real" drivers depend on.
+ *
+ * Modeled after drivers/edac/a72_edac.c (Cortex A72 EDAC L1/L2 cache
+ * error detection), but with all of the hardware-specific bits (system
+ * register reads, SMP cross-calls, devicetree compatible matching)
+ * replaced by a software-only error source that can be poked from
+ * debugfs or left to generate nothing at all.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/debugfs.h>
+#include <linux/slab.h>
+#include <linux/cpu.h>
+
+#include "edac_module.h"
+
+#define DRVNAME		"dummy-edac"
+#define MESSAGE_SIZE	64
+
+/*
+ * Simulated "error syndrome". In real hardware drivers this would be
+ * read out of a per-CPU system/MMIO register. Here userspace (via
+ * debugfs) or nothing at all drives it, which is exactly the point:
+ * the driver has no dependency on any physical error source.
+ */
+struct dummy_edac_priv {
+	struct dentry *debugfs_dir;
+	/* pending correctable error to report */
+	atomic_t inject_ce;
+	/* pending uncorrectable error to report */
+	atomic_t inject_ue;
+};
+
+static void dummy_edac_check(struct edac_device_ctl_info *edac_ctl)
+{
+	struct dummy_edac_priv *priv = edac_ctl->pvt_info;
+	int cpu = raw_smp_processor_id();
+	char msg[MESSAGE_SIZE];
+
+	if (atomic_xchg(&priv->inject_ce, 0)) {
+		snprintf(msg, MESSAGE_SIZE,
+			 "simulated correctable error on CPU %d", cpu);
+		edac_device_handle_ce(edac_ctl, cpu, 0, msg);
+	}
+
+	if (atomic_xchg(&priv->inject_ue, 0)) {
+		snprintf(msg, MESSAGE_SIZE,
+			 "simulated uncorrectable error on CPU %d", cpu);
+		edac_device_handle_ue(edac_ctl, cpu, 0, msg);
+	}
+}
+
+/*
+ * debugfs knobs so you can drive the driver from userspace inside the
+ * guest, e.g.:
+ *   echo 1 > /sys/kernel/debug/dummy-edac/inject_ce
+ *   echo 1 > /sys/kernel/debug/dummy-edac/inject_ue
+ */
+static int inject_ce_set(void *data, u64 val)
+{
+	struct dummy_edac_priv *priv = data;
+
+	if (val)
+		atomic_set(&priv->inject_ce, 1);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(inject_ce_fops, NULL, inject_ce_set, "%llu\n");
+
+static int inject_ue_set(void *data, u64 val)
+{
+	struct dummy_edac_priv *priv = data;
+
+	if (val)
+		atomic_set(&priv->inject_ue, 1);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(inject_ue_fops, NULL, inject_ue_set, "%llu\n");
+
+static int dummy_edac_probe(struct platform_device *pdev)
+{
+	struct edac_device_ctl_info *edac_ctl;
+	struct dummy_edac_priv *priv;
+	struct device *dev = &pdev->dev;
+	int rc;
+
+	edac_ctl = edac_device_alloc_ctl_info(sizeof(*priv), "cpu",
+					      num_possible_cpus(), "L", 1, 1,
+					      edac_device_alloc_index());
+	if (!edac_ctl)
+		return -ENOMEM;
+
+	priv = edac_ctl->pvt_info;
+	atomic_set(&priv->inject_ce, 0);
+	atomic_set(&priv->inject_ue, 0);
+
+	edac_ctl->edac_check = dummy_edac_check;
+	edac_ctl->dev = dev;
+	edac_ctl->mod_name = dev_name(dev);
+	edac_ctl->dev_name = dev_name(dev);
+	edac_ctl->ctl_name = DRVNAME;
+	/* Poll fairly slowly; this is a software source, not real hardware. */
+	edac_ctl->poll_msec = 1000;
+	dev_set_drvdata(dev, edac_ctl);
+
+	rc = edac_device_add_device(edac_ctl);
+	if (rc)
+		goto out_dev;
+
+	priv->debugfs_dir = debugfs_create_dir(DRVNAME, NULL);
+	debugfs_create_file_unsafe("inject_ce", 0200, priv->debugfs_dir,
+				    priv, &inject_ce_fops);
+	debugfs_create_file_unsafe("inject_ue", 0200, priv->debugfs_dir,
+				    priv, &inject_ue_fops);
+
+	return 0;
+
+out_dev:
+	edac_device_free_ctl_info(edac_ctl);
+
+	return rc;
+}
+
+static void dummy_edac_remove(struct platform_device *pdev)
+{
+	struct edac_device_ctl_info *edac_ctl = dev_get_drvdata(&pdev->dev);
+	struct dummy_edac_priv *priv = edac_ctl->pvt_info;
+
+	debugfs_remove_recursive(priv->debugfs_dir);
+	edac_device_del_device(edac_ctl->dev);
+	edac_device_free_ctl_info(edac_ctl);
+}
+
+static struct platform_driver dummy_edac_driver = {
+	.probe = dummy_edac_probe,
+	.remove = dummy_edac_remove,
+	.driver = {
+		.name = DRVNAME,
+	},
+};
+
+/*
+ * No devicetree/ACPI match table, and no scan of CPU nodes for a "compatible"
+ * + enable property: simply register a platform device unconditionally so
+ * probe() always runs. There is nothing here that depends on the underlying
+ * platform actually exposing the corresponding hardware, so it loads fine
+ * under QEMU/KVM, containers-with-a-kernel, or any other guest environment.
+ */
+static struct platform_device *dummy_pdev;
+
+static int __init dummy_edac_driver_init(void)
+{
+	int rc;
+
+	dummy_pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
+	if (IS_ERR(dummy_pdev)) {
+		pr_err(DRVNAME ": failed to register dummy platform device\n");
+		return PTR_ERR(dummy_pdev);
+	}
+
+	rc = platform_driver_register(&dummy_edac_driver);
+	if (rc) {
+		platform_device_unregister(dummy_pdev);
+		return rc;
+	}
+
+	pr_info("Loading %s\n", DRVNAME);
+
+	return 0;
+}
+
+static void __exit dummy_edac_driver_exit(void)
+{
+	platform_driver_unregister(&dummy_edac_driver);
+	platform_device_unregister(dummy_pdev);
+
+	pr_info("Removing %s\n", DRVNAME);
+}
+
+module_init(dummy_edac_driver_init);
+module_exit(dummy_edac_driver_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Dummy EDAC driver for testing without real ECC hardware");
-- 
2.53.0

