Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203234;
	b=GHD4A+piBbiQwWAhcoPJuy4m6t3pRKkuo+OhprUMnKIo945W1nXtaJ5Uo8XZmsVXKrPL
	 0TjFRH1vMHfHkuw+RXy7LNc2nD4+NJ4bbxyj2yxDdjB2zfKOU6dIl47jKI3w0ucOAJk+e
	 JZ6timjL9c/D5DFz57xZVHUPJAO8l+sfbnDM8kdDnH1UOaOZJSgnzwkP/0Ffz9K5Vo1Kt
	 XzZKZJ73PsNVuqCFmnK32PRVgMgPBehDEXr5kHg4yZZsidG/7peK7UdPDGOL/v/YJ7roJ
	 K5sgQxvDukM5Fm4+k36CJ1BsnEkmDKQAPfD3GuyS2P4iwc9kk6iE+9DFjyMW5hgoVWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vJ6tZtEnlK9qkgGnFkn4tgGXrQ/769dDFL4QlkxqQAg=;
	b=j5/Ylm2RbLOjZzF1pDYccqvFKaCWolsDTq7eUqDsg0C/Y3sFjIm5r3s+whSbskhJrA/4
	 KQ35WYtqdTEi4Une6fJuwemdv0zv4rZz+ESkcWIAkj5+dLdeIvNeLSkKWQkrQpn3eIdpn
	 LhhOl1u7zRHvs2tqCzWkcVdGtxE9R3N2ZBWeiasSGJ5s5WPpgKlzAf5Gzhcf+mm0hdcJM
	 pBc+YMIjzVX0BK61Jn2LmcOMRGhlMfamcH9YISQfem8QfP0CvtkMw12qAMg6Q0HmLZjN2
	 VHm1jxx+3oHr2zQKW0UJzPGMTC4e9XV33hCsO8UlyNWHmMI889u6arl8Itnq4+2pFkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZacBeegc;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ABD606A6EE
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 19:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42ABD606A6EE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZacBeegc
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67be1e468a8so1277281d50.0
        for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 11:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203229; x=1795808029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJ6tZtEnlK9qkgGnFkn4tgGXrQ/769dDFL4QlkxqQAg=;
        b=ZacBeegcAhcRPIBuOiayYZjO4NJu6Ea+XThnXc3Bi0hxDffypywzA5xzGzn4WyBSgn
         h3ZysKJZEu0sbUaDVXoYYqe6sR1wYo4f1flKXieGVhxXu9tgWFuVb0NI9Ht/YuYMpp0m
         gS3RD9z3y+9xH1eYWDmQ5cYgUs4+3JxfxV5n2pa0wETu1Ux8k0OR/S8de55ti48RWM4y
         6zNZscfy1OPXw+nWNIqG1DWkn19oEk8zg9vEn2NOLESKm4AERKaKs18/wsA0IjR9QQVn
         TD8gwNwaNxhVR0eGhJ9Gw3/esl/8R2M9q8vwSj0dx7vUA8A6FhHPwJm5lQr29p/JImoR
         bEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203229; x=1795808029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJ6tZtEnlK9qkgGnFkn4tgGXrQ/769dDFL4QlkxqQAg=;
        b=cftv+epLsobrg3mzPpMcl8ktHpE+NVEnMuYuYWEGQKyWcMw+dEixmVSJpAbt9jGORJ
         GfZnT6IA3gFmqUHnZZ/L/0T6wvX2cE+d+wGSTPCktQinCZ4i67aNBjxRxrPmaffSevH4
         pPze8Ej9GWMZIbA28drzN2FEHgYyj+ClUw6wAKLgAAba3FOyhOeNgaEhW5xly5E+h7l3
         gGIv7+CiYdcDKBZQU455tfnp0EPswUpZfJXA2BKxOhdbyqtY7e/bA72Vq6U1C/M9/JxP
         RtTc5nShX3BzbavwxKWQG0bdnqmUa9cwpbl4wfkUAoo550L78nffd8mt30hpO9ywfJ0z
         ynRg==
X-Forwarded-Encrypted: i=1; AL+hErHL5WU7sPNCHz0IhOo0eDBC2GkVDY5GG41L6mLNRupktcEdKEScGxG7fZtzjk5FbYpvHSL296KhNGn+@vger.kernel.org
X-Gm-Message-State: APuU4Z9V5+v6hxvKvEHWOjSmH0qN0B8m9fc+nx2oe33EomQtZRCUSL4T
	yDjb1VMENfJuo9o9+xmmDc+GdJj8IAA+UyLOKGANsyNP6sL5F2mpd4Iz
X-Gm-Gg: AZFdTZcAHHOfliL84ni7N1CSNelcl1gTETtPXdMQEmrSd9XJexiipQfuHZiMHQ4NXst
	nptontnh9jIviSahqBq1nmH0+OdOtfcfDnLF4M119f/4SsrAaFJLoL8P3/SjnYz1DA+Ed27xevS
	fBxGcgA5P/vhFyYWoc6WdfJJV7ehtcA/02t+UNrc6y22WqetLfp2QryGcYjA+knbZWbZiOlQGuG
	Ee30nLZeuWvDa5q84VCRg8D3nu3734DYLKbbk1LR7cf7BdsYDdpi9cZKTaW41dixlS6ByCz/qzO
	htPqPRhEfKCs0l4Oa3V+LZ3Rk72wFo2Zm3fct32HDRFWsTRtNDDp3F+rsAsxQHu9NYHZc74WODT
	8a2Q5xsOSufyTgIrjuqOooVROroXAQjaqsS/68J266U4dhCFGcbv92b99KZfxKC0O6WCO0WtOum
	skII+Ul6mERs+JjIlw1vTnZOoRmFughw2E9cTc370nDulrUbvaCuvunZZFW4URC0ja3OjjkRrau
	Kbdi0Cmvvncy9UjFFJ8etJnppDe+TdqO2Z2hWDSbFCPYT4b12gEgzDhp4lsC0oSnI0teoxfVIG9
	y0bv5ZHJQtfy6Zjz2UjM7KEAmnjhuFTep6SXdwC5CtBGPK2pEg40IIT7ka7gxi4j1APIsqZwyWZ
	JNFVAGWUuQ1aPBytvtnCOinxveDVUMAGVfIYCpZi7BSA=
X-Received: by 2002:a05:690e:1187:b0:67d:ba3f:a9a6 with SMTP id 956f58d0204a3-67df43ce269mr1734293d50.21.1795203229219;
        Fri, 20 Nov 2026 11:33:49 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330bfb1sm2149725d50.6.2026.11.20.11.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:48 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 20 Nov 2026 14:33:43 -0500
Subject: [PATCH 4/4] EDAC/mpc7448_l2: Add error injection
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
Message-Id: <20261120-ppc32-l2-ecc-v1-4-98fc8e6e0a32@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10492; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=XNCxMKgi+jdMDTi3VczwwKddmdxn919Rql+cTqKYU2o=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFkwJVOA03ix1b+0mh8z5HzWuKqjr3Tpac0XtzaxfJ
 usqPxqXdXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1/swM/wynzjju9y
 F7m/Xil7N0tzyZMr9M8erChXxfeJlYg+aylQgx/I8Sefvp4+eZiWf7uT8wTp39an61zt/aTIn9h
 lFtTFbrJHgA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Expose the L2 error injection registers as inject_data_hi,
inject_data_lo and inject_ctrl.  Writing a CPU number to inject_trigger
injects the error into a private buffer on that CPU and reports what
was detected.

L2 machine checks are not recoverable, so machine check reporting is
masked while the injected errors are consumed.  Tag injection is not
offered: it corrupts the tags of unrelated lines too, and hung the
machine in testing.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/include/asm/reg.h |   1 +
 drivers/edac/mpc7448_l2_edac.c | 284 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 284 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 2f4adf5a606e..15c97ff8b12a 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -760,6 +760,7 @@
 #define L3CR_PMSIZ		0x00000001	/* L3 private memory size */
 
 #define SPRN_MSSCR0	0x3f6	/* Memory Subsystem Control Register 0 */
+#define   MSSCR0_L2PFE	0x00000003	/* L2 prefetch engines */
 #define SPRN_MSSSR0	0x3f7	/* Memory Subsystem Status Register 1 */
 #define   MSSSR0_L2TAG	0x00040000	/* L2 tag parity error */
 #define   MSSSR0_L2DAT	0x00020000	/* L2 data parity/ECC error */
diff --git a/drivers/edac/mpc7448_l2_edac.c b/drivers/edac/mpc7448_l2_edac.c
index a62c7a2e7147..157f6ff99cf6 100644
--- a/drivers/edac/mpc7448_l2_edac.c
+++ b/drivers/edac/mpc7448_l2_edac.c
@@ -11,12 +11,17 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cache.h>
 #include <linux/cpu.h>
 #include <linux/device/faux.h>
 #include <linux/edac.h>
+#include <linux/gfp.h>
+#include <linux/io.h>
+#include <linux/kstrtox.h>
 #include <linux/module.h>
 #include <linux/smp.h>
 #include <linux/sprintf.h>
+#include <linux/sysfs.h>
 
 #include <asm/mpc7448_l2.h>
 #include <asm/reg.h>
@@ -25,6 +30,32 @@
 
 #define DRV_NAME	"mpc7448_l2_edac"
 
+/*
+ * Injection buffer layout.  The target line is followed by aliases one
+ * L1 way (4 KB) apart, which map to the same L1 set and evict the target
+ * from the 8-way L1 into the L2.  With the L1's PLRU replacement, eight
+ * misses evict the target when nothing else touches its set; INJ_NALIAS
+ * is twice that.  The L2 is filled in 64-byte lines of two 32-byte blocks.
+ */
+#define INJ_STRIDE	4096
+#define INJ_NALIAS	16
+#define INJ_ORDER	get_order((INJ_NALIAS + 1) * INJ_STRIDE)
+#define INJ_PATTERN	0x12345678
+
+/*
+ * Tag injection (L2ERRINJCTL[TERRIEN]) is not offered: it also corrupts
+ * the tags of unrelated lines sharing the L2 sets that are written while
+ * injection is enabled, which hung the machine in testing.
+ */
+#define INJ_CTL_MASK	(L2ERRINJCTL_ECCMB | L2ERRINJCTL_DERRIEN | \
+			 L2ERRINJCTL_ECCERRIM)
+
+struct mpc7448_l2_pdata {
+	u32 inj_hi;
+	u32 inj_lo;
+	u32 inj_ctl;
+};
+
 static struct faux_device *mpc7448_l2_fdev;
 
 struct mpc7448_l2_poll {
@@ -98,11 +129,261 @@ static void mpc7448_l2_check(struct edac_device_ctl_info *edac_dev)
 	cpus_read_unlock();
 }
 
+struct mpc7448_l2_inj {
+	u32 *buf;
+	u32 hi;
+	u32 lo;
+	u32 ctl;
+	u32 val;
+	struct mpc7448_l2_poll poll;
+};
+
+static u32 *inj_alias(u32 *a, unsigned int i)
+{
+	return (u32 *)((char *)a + i * INJ_STRIDE);
+}
+
+/* Flush the L2 lines of aliases first to last from the L1 and L2 */
+static void inj_flush(u32 *a, unsigned int first, unsigned int last)
+{
+	unsigned int i;
+
+	for (i = first; i <= last; i++) {
+		dcbf(inj_alias(a, i));
+		dcbf((char *)inj_alias(a, i) + 32);
+	}
+	mb();	/* wait for the flushes to complete */
+}
+
+/* Change a mode SPR with no cache operations or stores in flight */
+#define inj_mtspr(rn, v)					\
+do {								\
+	mb();	/* complete earlier accesses first */		\
+	mtspr(rn, v);						\
+	mb();	/* and the SPR write itself */			\
+	isync();						\
+} while (0)
+
+/*
+ * Every L2 write while injection is enabled is corrupted, so keep the
+ * window short: modify the target in the L1, enable injection, cast the
+ * target out to the L2 by loading its aliases, and disable injection.
+ * The aliases are filled into the L2 during the window and take the error
+ * too.  Then flush the aliases, read the target back, and flush it.
+ */
+static noinline u32 mpc7448_l2_inject_window(u32 *a, u32 hi, u32 lo, u32 ctl)
+{
+	unsigned int i;
+	u32 val;
+
+	inj_flush(a, 0, INJ_NALIAS);
+
+	/*
+	 * A castout that misses in the L2 goes to memory, so load the target
+	 * to allocate its L2 line before modifying it in the L1.
+	 */
+	READ_ONCE(*a);
+	WRITE_ONCE(*a, INJ_PATTERN);
+	mb();	/* modify the target before injection starts */
+
+	mtspr(SPRN_L2ERRINJHI, hi);
+	mtspr(SPRN_L2ERRINJLO, lo);
+	mtspr(SPRN_L2ERRINJCTL, ctl);
+	mb();	/* start injection before the castout */
+
+	for (i = 1; i <= INJ_NALIAS; i++)
+		READ_ONCE(*inj_alias(a, i));
+	mb();	/* wait for the castout and the alias fills */
+
+	mtspr(SPRN_L2ERRINJCTL, 0);
+	mtspr(SPRN_L2ERRINJHI, 0);
+	mtspr(SPRN_L2ERRINJLO, 0);
+	mb();	/* stop injection before anything else reaches the L2 */
+
+	inj_flush(a, 1, INJ_NALIAS);
+	val = READ_ONCE(*a);
+	inj_flush(a, 0, 0);
+
+	return val;
+}
+
+static void mpc7448_l2_inject_cpu(void *info)
+{
+	struct mpc7448_l2_inj *inj = info;
+	u32 inten = mfspr(SPRN_L2ERRINTEN);
+	u32 msscr0 = mfspr(SPRN_MSSCR0);
+	u32 *a = inj->buf;
+
+	/* The prefetch engines would fill (and corrupt) other lines */
+	if (msscr0 & MSSCR0_L2PFE)
+		inj_mtspr(SPRN_MSSCR0, msscr0 & ~MSSCR0_L2PFE);
+
+	/*
+	 * A dry run without injection leaves only the buffer in the
+	 * target's L1 set and the window's code in the L1 instruction
+	 * cache, so nothing else is cast out to the L2 during the window.
+	 */
+	mpc7448_l2_inject_window(a, 0, 0, 0);
+
+	/* L2 machine checks are not recoverable, so poll for these errors */
+	inj_mtspr(SPRN_L2ERRINTEN, 0);
+
+	inj->val = mpc7448_l2_inject_window(a, inj->hi, inj->lo, inj->ctl);
+	mpc7448_l2_poll_cpu(&inj->poll);
+
+	inj_mtspr(SPRN_L2ERRINTEN, inten);
+	if (msscr0 & MSSCR0_L2PFE)
+		inj_mtspr(SPRN_MSSCR0, msscr0);
+}
+
+static ssize_t inject_show(u32 val, char *data)
+{
+	return sysfs_emit(data, "0x%08x\n", val);
+}
+
+static ssize_t inject_store(u32 *val, u32 mask, const char *data,
+			    size_t count)
+{
+	u32 v;
+	int ret;
+
+	ret = kstrtou32(data, 0, &v);
+	if (ret)
+		return ret;
+	if (v & ~mask)
+		return -EINVAL;
+
+	*val = v;
+	return count;
+}
+
+static ssize_t inject_data_hi_show(struct edac_device_ctl_info *edac_dev,
+				   char *data)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_show(pdata->inj_hi, data);
+}
+
+static ssize_t inject_data_hi_store(struct edac_device_ctl_info *edac_dev,
+				    const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_store(&pdata->inj_hi, ~0U, data, count);
+}
+
+static ssize_t inject_data_lo_show(struct edac_device_ctl_info *edac_dev,
+				   char *data)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_show(pdata->inj_lo, data);
+}
+
+static ssize_t inject_data_lo_store(struct edac_device_ctl_info *edac_dev,
+				    const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_store(&pdata->inj_lo, ~0U, data, count);
+}
+
+static ssize_t inject_ctrl_show(struct edac_device_ctl_info *edac_dev,
+				char *data)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_show(pdata->inj_ctl, data);
+}
+
+static ssize_t inject_ctrl_store(struct edac_device_ctl_info *edac_dev,
+				 const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+
+	return inject_store(&pdata->inj_ctl, INJ_CTL_MASK, data, count);
+}
+
+static ssize_t inject_trigger_store(struct edac_device_ctl_info *edac_dev,
+				    const char *data, size_t count)
+{
+	struct mpc7448_l2_pdata *pdata = edac_dev->pvt_info;
+	struct mpc7448_l2_inj inj;
+	struct page *page;
+	unsigned int cpu;
+	int ret;
+
+	ret = kstrtouint(data, 0, &cpu);
+	if (ret)
+		return ret;
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	page = alloc_pages(GFP_KERNEL, INJ_ORDER);
+	if (!page)
+		return -ENOMEM;
+
+	inj.buf = page_address(page);
+	inj.hi = pdata->inj_hi;
+	inj.lo = pdata->inj_lo;
+	inj.ctl = pdata->inj_ctl;
+
+	cpus_read_lock();
+	if (cpu_online(cpu))
+		ret = smp_call_function_single(cpu, mpc7448_l2_inject_cpu,
+					       &inj, 1);
+	else
+		ret = -ENXIO;
+	cpus_read_unlock();
+
+	if (!ret)
+		edac_device_printk(edac_dev, KERN_INFO,
+				   "cpu%u: injected ctl 0x%08x data 0x%08x_%08x at 0x%llx: read 0x%08x (wrote 0x%08x)\n",
+				   cpu, inj.ctl, inj.hi, inj.lo,
+				   (unsigned long long)virt_to_phys(inj.buf),
+				   inj.val, INJ_PATTERN);
+
+	__free_pages(page, INJ_ORDER);
+
+	if (ret)
+		return ret;
+
+	mpc7448_l2_report(edac_dev, cpu, &inj.poll);
+	return count;
+}
+
+static const struct edac_dev_sysfs_attribute mpc7448_l2_sysfs_attributes[] = {
+	{
+		.attr = { .name = "inject_data_hi", .mode = 0600 },
+		.show = inject_data_hi_show,
+		.store = inject_data_hi_store,
+	},
+	{
+		.attr = { .name = "inject_data_lo", .mode = 0600 },
+		.show = inject_data_lo_show,
+		.store = inject_data_lo_store,
+	},
+	{
+		.attr = { .name = "inject_ctrl", .mode = 0600 },
+		.show = inject_ctrl_show,
+		.store = inject_ctrl_store,
+	},
+	{
+		.attr = { .name = "inject_trigger", .mode = 0200 },
+		.store = inject_trigger_store,
+	},
+	{
+		.attr = { .name = NULL },
+	},
+};
+
 static int mpc7448_l2_probe(struct faux_device *fdev)
 {
 	struct edac_device_ctl_info *edac_dev;
 
-	edac_dev = edac_device_alloc_ctl_info(0, "cpu", nr_cpu_ids, "L", 1, 2,
+	edac_dev = edac_device_alloc_ctl_info(sizeof(struct mpc7448_l2_pdata),
+					      "cpu", nr_cpu_ids, "L", 1, 2,
 					      edac_device_alloc_index());
 	if (!edac_dev)
 		return -ENOMEM;
@@ -112,6 +393,7 @@ static int mpc7448_l2_probe(struct faux_device *fdev)
 	edac_dev->ctl_name = "MPC7448_L2";
 	edac_dev->dev_name = dev_name(&fdev->dev);
 	edac_dev->edac_check = mpc7448_l2_check;
+	edac_dev->sysfs_attributes = mpc7448_l2_sysfs_attributes;
 
 	if (edac_device_add_device(edac_dev)) {
 		edac_device_free_ctl_info(edac_dev);

-- 
2.56.1

