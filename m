Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203230;
	b=ApcYiMNTiBlVOxahxInLH/LncmL7ru/BOeStC1SiM9JCp76ivsU/RbwqcZ0H06cC9YcX
	 03PiiLOmNN+bC9PbXWgUZksjpiyEGeLTW/6P37Q3SpuGMB+aKJJ+PnJeD37wxnsyO6+EL
	 7TWaxVLlKHh171EZl6lGirGWmrkt05RPuYAy3u/JyZqhvfuIq2xUs5+hx/geK3LJggqsU
	 Zl7ut76QE3PlUsEeb8Khxk0COJL/kL8xdWUDMJxzsmsXMcdE04a+sPjnLQXLnYlu+/mmN
	 0mAmczKRvjFvR3liH0PvwEhdOqW11ZqnUU30dFoyYM/hkkVfWWvnFvKUZV6MtQHkbrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=SYGSMC4mInP9yOLco1WrFx7aItxWYf+k5DNyaKookJA=;
	b=3+f1H8lDHbqztdLiI+RfeJgF6SBxgpo8qmA2SxjcDTly2qZwCoLwcN70kXBVMX+Xpdy/
	 b/Gko+J0oUiRf61zGvNqIv1Q8Toc80E2r7pVUuClDUyArR7I0VHYIk9EaT+FSdsAVrbJZ
	 OBVeIgP7K7zYNPpIILLWjKFH08N/BYxCWMjNNpLSWGIbeU+xiMp/68Xu2HnYBdre4S1lk
	 hzF9/e+RMFDFntlEioBGjtNeHUYPQpsjE3M5eBD9b5AmzmN8WFqWiqfZsW+V/OQOvzL3B
	 PyaQm+tn2NdFsgzekOkA1UlhBu680XWyj5SrnyzbHDy+cZMcq6rkW94EL3XI5J3rozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3FtwwFz;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F8606A33A
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 19:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E29F8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3FtwwFz
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-675617e81f9so1531067d50.3
        for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203228; x=1795808028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYGSMC4mInP9yOLco1WrFx7aItxWYf+k5DNyaKookJA=;
        b=N3FtwwFz3iM7xz7vRU4WcpMFssOBTe6cvavAZZZS8XsHYkzZg05v8LFs7EbyZaM/Sp
         gn2Wy9tgxJoTIC697Kv8oSH4lI4qi5DJlNgW8XtEAJwGnjqkd0MMNEskUAwjGBckt63r
         Kgc4KXX49jXmQ8GJXB0Zun1nEzVvSeL9vLyHkTu1Lej8ajbfuGflUkO3BxtR3aQItMkO
         ud9Rqqo1e/yaqBhFAqQuj2nAdCV+hOOEcBBvgAW1KkgVqrobuviKB+bqKQ+AxUqGHRjf
         xuKObxoJKAht9y9oZv8BmTP55th3ywG2f8CS2+osXcFvyUrwdf++RAHoNsivggnTyVnZ
         HZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203228; x=1795808028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYGSMC4mInP9yOLco1WrFx7aItxWYf+k5DNyaKookJA=;
        b=W1tVrFd3CqldVce8Veeb4xJIjtDNW0V6OBvq5VMuzCdP+cd2EGfStbQA5LQrrDFqFO
         fXXg41Dqf36zuDQqaAZ4aazvNkkIVkQsCZXiuVYPE7e2HGYqgg6DtKTO9TBgupPijr+5
         LJsbjCOuIfxuD0YFnlY9LtLA8YCLlNzWSLk3UBASthASqS6wwxb5GKyg+TogMNSDVBBW
         0bjX3ShjVsWEqyEtgF4Kiheqc0Lm3YC8YEDAwPJNujByeCR0mLfkzjbEKXseHqHrMxUt
         NkRQ+q3/JuAIvpD/lFRnTJrMu0FqgSaN8QNDj9ALoJnMb3UDAX2dRnPcjfk6x+wkymiB
         0hpQ==
X-Forwarded-Encrypted: i=1; AL+hErFA4TyBu9t4nrj4Gns2NqxoaOnxLTStMWwzIJ4VNSm8cfVEaIvY7tWOQqhksrwmpDusM6deeg6dJHjp@vger.kernel.org
X-Gm-Message-State: APuU4Z8RvA/ED7NZ9gzPAnnytkzTz5vtYZxVLKyvzu/l2cQWKh5H26y7
	Wyh+fP2YYqJjRy2AuBBNoPVmqS4Bbm4RIqo+SHzKeIwDR/1Bv3/fUEad
X-Gm-Gg: AZFdTZcr5eiDUO4dAFF09+GsO9deEVHuA+0+FzTtKfBaN11XyJhSOfXRNj/uG2Sbpem
	3qqjxSp81hO8TBQ9x2vmsu6ogEqkVNDM761sJ20NSULNOMBT1OPeIxgcZNP+LnCoOVFtTAtz1zN
	0gn+QvfSnaXJSgUfVXtkoen7XGLWeOpgLXvBuHAAc9M5ESCi1MEOjcZWULWqNCdYk3I3VJOmWOg
	RxnTo9ODWelosf7IDEW2luSywLQYt9Ntr7mUeNgV0WmwpxcbnUjbuz4IevbG6HYyfJXbIVOuvnS
	y0SRXnUML+p3HKAg6gXxd47ENpI3f5KZX5FS3ihx4QHDNN8QM807G+QiOf52fDKu3ZlF4McMp8Y
	GsRRSignnYF16AdWSMSbXez4otzlFwwdPg/Z41diVRk3rNzxOK2cJDSZ7ybkNuIOLqfo6DRUKaz
	e9M+q0xmR9puYmDFAzynaH0IlbHhT0vTH5h/FSRQ3/KC5YE+dt+QSKcgvyZkXrErElS2tQJicaB
	S3Y6dRERHhntvWv2/DUQRUDn1iIUkBTW2PSbi/aXiiSdSbTgxm3dvVQByvUIEb4YMcElc/hWquo
	PMOozoptuLshL3HBoFxiihmnWv28+JESDPr3DMUL6Wbch/h+RkSWn97yE02SL0VA4nnqOi+c9hl
	im+3wpAxxBg6sliIXDivCWktp2VLmoPBjxAzEu9NS+g==
X-Received: by 2002:a05:690e:4806:b0:67d:c29e:9446 with SMTP id 956f58d0204a3-67df43fbc09mr1155990d50.47.1795203227770;
        Fri, 20 Nov 2026 11:33:47 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33b7502sm2036571d50.20.2026.11.20.11.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:46 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:42 -0500
Subject: [PATCH 3/4] EDAC/mpc7448_l2: Add a driver for the MPC7448 L2 cache
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ppc32-l2-ecc-v1-3-98fc8e6e0a32@gmail.com>
References: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
In-Reply-To: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7077; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Jhl93cquvatpIX79cI6EiLvX4rUe9XzrZIGQXnwVAyo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFky5+oHVRmnLE5euxqTPBfKPagy5Dkx1mbvEbJLZS
 qVLn704Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaazmyG/6F8L4994G
 WX6ZkeI5Ky+PFvPXdudcbv5+fwrFsvlHdglyfDP+u37ldWmte4/TPvuuD2hXeS74yKrpgDoRET5
 26Xe8Jqxg0A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Report MPC7448 L2 errors through EDAC, with one instance per CPU.

Single-bit errors are corrected by the hardware and only counted, so
poll L2ERRCTL[L2CCOUNT] and L2ERRDET and report the count as
correctable errors.  Report the L2 machine checks counted by the arch
code as uncorrectable errors, along with any multi-bit ECC or tag parity
error found in L2ERRDET without one, since clearing L2ERRDET would
otherwise lose it.

PowerMacs have no device tree node for the L2, so bind to a faux
device.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 MAINTAINERS                    |   1 +
 drivers/edac/Kconfig           |   9 +++
 drivers/edac/Makefile          |   1 +
 drivers/edac/mpc7448_l2_edac.c | 160 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ea66ea2be2d..0d02f0a7316c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9754,6 +9754,7 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/include/asm/mpc7448_l2.h
 F:	arch/powerpc/kernel/mpc7448_l2.c
+F:	drivers/edac/mpc7448_l2_edac.c
 
 EDAC-MPC85XX
 L:	linux-edac@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729b0d3a..c3256da3d6fd 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -320,6 +320,15 @@ config EDAC_MPC85XX
 	  Support for error detection and correction on the Freescale
 	  MPC8349, MPC8560, MPC8540, MPC8548, T4240
 
+config EDAC_MPC7448_L2
+	tristate "Freescale MPC7448 L2 cache"
+	depends on PPC_BOOK3S_32
+	help
+	  Support for error detection and correction on the L2 cache of
+	  the Freescale MPC7448 processor.  Correctable errors are found
+	  by polling the L2 error counter, and uncorrectable errors are
+	  reported by the machine check handler.
+
 config EDAC_LAYERSCAPE
 	tristate "Freescale Layerscape DDR"
 	depends on ARCH_LAYERSCAPE || SOC_LS1021A
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 4020ea60738a..06c951d680f7 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_EDAC_PASEMI)		+= pasemi_edac.o
 
 mpc85xx_edac_mod-y			:= fsl_ddr_edac.o mpc85xx_edac.o
 obj-$(CONFIG_EDAC_MPC85XX)		+= mpc85xx_edac_mod.o
+obj-$(CONFIG_EDAC_MPC7448_L2)		+= mpc7448_l2_edac.o
 
 layerscape_edac_mod-y			:= fsl_ddr_edac.o layerscape_edac.o
 obj-$(CONFIG_EDAC_LAYERSCAPE)		+= layerscape_edac_mod.o
diff --git a/drivers/edac/mpc7448_l2_edac.c b/drivers/edac/mpc7448_l2_edac.c
new file mode 100644
index 000000000000..a62c7a2e7147
--- /dev/null
+++ b/drivers/edac/mpc7448_l2_edac.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * EDAC driver for the MPC7448 on-chip L2 cache.
+ *
+ * Single-bit ECC errors are corrected by the hardware and only counted in
+ * L2ERRCTL[L2CCOUNT], so they are found by polling.  Multi-bit ECC and tag
+ * parity errors raise a machine check (arch/powerpc/kernel/mpc7448_l2.c)
+ * and are reported here at the next poll, if the system survived it.
+ * Errors latched in L2ERRDET without a machine check are reported as
+ * uncorrectable too.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cpu.h>
+#include <linux/device/faux.h>
+#include <linux/edac.h>
+#include <linux/module.h>
+#include <linux/smp.h>
+#include <linux/sprintf.h>
+
+#include <asm/mpc7448_l2.h>
+#include <asm/reg.h>
+
+#include "edac_module.h"
+
+#define DRV_NAME	"mpc7448_l2_edac"
+
+static struct faux_device *mpc7448_l2_fdev;
+
+struct mpc7448_l2_poll {
+	struct mpc7448_l2_err err;
+	u32 ctl;
+	unsigned int mce_ue;
+};
+
+static void mpc7448_l2_poll_cpu(void *info)
+{
+	struct mpc7448_l2_poll *p = info;
+
+	p->ctl = mfspr(SPRN_L2ERRCTL);
+	if (p->ctl & L2ERRCTL_L2CCOUNT)
+		mtspr(SPRN_L2ERRCTL, p->ctl & ~L2ERRCTL_L2CCOUNT);
+
+	mpc7448_l2_err_capture(&p->err);
+
+	p->mce_ue = mpc7448_l2_mce_take();
+}
+
+static void mpc7448_l2_report(struct edac_device_ctl_info *edac_dev,
+			      unsigned int cpu, const struct mpc7448_l2_poll *p)
+{
+	unsigned int ce, ue;
+	char msg[64];
+
+	ce = FIELD_GET(L2ERRCTL_L2CCOUNT, p->ctl) ?:
+	     !!(p->err.det & L2ERR_SBECCERR);
+	if (ce) {
+		if (p->err.det & L2ERR_SBECCERR)
+			snprintf(msg, sizeof(msg), "single-bit ECC at 0x%09llx",
+				 mpc7448_l2_err_paddr(&p->err));
+		else
+			snprintf(msg, sizeof(msg), "single-bit ECC");
+		edac_device_handle_ce_count(edac_dev, ce, cpu, 0, msg);
+	}
+
+	/* Errors latched without a machine check */
+	ue = !!(p->err.det & L2ERR_MBECCERR) + !!(p->err.det & L2ERR_TPARERR);
+	if (ue) {
+		mpc7448_l2_err_print(&p->err);
+		snprintf(msg, sizeof(msg), "%s at 0x%09llx",
+			 p->err.det & L2ERR_TPARERR ? "tag parity" : "multi-bit ECC",
+			 mpc7448_l2_err_paddr(&p->err));
+		edac_device_handle_ue_count(edac_dev, ue, cpu, 0, msg);
+	}
+
+	/* The machine check handler has already printed the details */
+	if (p->mce_ue)
+		edac_device_handle_ue_count(edac_dev, p->mce_ue, cpu, 0,
+					    "machine check");
+}
+
+static void mpc7448_l2_check_cpu(struct edac_device_ctl_info *edac_dev,
+				 unsigned int cpu)
+{
+	struct mpc7448_l2_poll p;
+
+	if (!smp_call_function_single(cpu, mpc7448_l2_poll_cpu, &p, 1))
+		mpc7448_l2_report(edac_dev, cpu, &p);
+}
+
+static void mpc7448_l2_check(struct edac_device_ctl_info *edac_dev)
+{
+	unsigned int cpu;
+
+	cpus_read_lock();
+	for_each_online_cpu(cpu)
+		mpc7448_l2_check_cpu(edac_dev, cpu);
+	cpus_read_unlock();
+}
+
+static int mpc7448_l2_probe(struct faux_device *fdev)
+{
+	struct edac_device_ctl_info *edac_dev;
+
+	edac_dev = edac_device_alloc_ctl_info(0, "cpu", nr_cpu_ids, "L", 1, 2,
+					      edac_device_alloc_index());
+	if (!edac_dev)
+		return -ENOMEM;
+
+	edac_dev->dev = &fdev->dev;
+	edac_dev->mod_name = DRV_NAME;
+	edac_dev->ctl_name = "MPC7448_L2";
+	edac_dev->dev_name = dev_name(&fdev->dev);
+	edac_dev->edac_check = mpc7448_l2_check;
+
+	if (edac_device_add_device(edac_dev)) {
+		edac_device_free_ctl_info(edac_dev);
+		return -ENXIO;
+	}
+
+	faux_device_set_drvdata(fdev, edac_dev);
+	return 0;
+}
+
+static void mpc7448_l2_remove(struct faux_device *fdev)
+{
+	struct edac_device_ctl_info *edac_dev = faux_device_get_drvdata(fdev);
+
+	edac_device_del_device(&fdev->dev);
+	edac_device_free_ctl_info(edac_dev);
+}
+
+static const struct faux_device_ops mpc7448_l2_ops = {
+	.probe = mpc7448_l2_probe,
+	.remove = mpc7448_l2_remove,
+};
+
+static int __init mpc7448_l2_edac_init(void)
+{
+	if (PVR_VER(mfspr(SPRN_PVR)) != PVR_VER_7448)
+		return -ENODEV;
+
+	opstate_init();
+
+	mpc7448_l2_fdev = faux_device_create(DRV_NAME, NULL, &mpc7448_l2_ops);
+	if (!mpc7448_l2_fdev)
+		return -ENODEV;
+
+	return 0;
+}
+module_init(mpc7448_l2_edac_init);
+
+static void __exit mpc7448_l2_edac_exit(void)
+{
+	faux_device_destroy(mpc7448_l2_fdev);
+}
+module_exit(mpc7448_l2_edac_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MPC7448 L2 cache EDAC driver");

-- 
2.56.1

