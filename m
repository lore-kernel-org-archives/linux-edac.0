Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C582FFDEA
	for <linux-edac@vger.kernel.org>; Mon, 21 Sep 2026 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789956620; cv=none; b=C9KdVQkvfwTgklpb+rd3O842v+YgV16hso4MqzgdeguvaKpkhFZhkk0M1OOnIKgTXhn2AhIMlnRSjdacSLeI8EBm1ldV8Ar3cyw4ZzfcKqdnHuApdN/th70/McUVk6r5Sq2MvgUHHjNFLdN46DIuuc2HipVXb148zmdDjVs4/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789956620; c=relaxed/simple;
	bh=/q9jN18v9kVg0ewuIvSTRizst+QlqZDfb0J3vJ0la28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ua9ABtb6ECN5JUbO1gHo9SPgqzr+Uxbo/BG+eo2j4ZxqZ4Gw5lzx8M6Ham50NDSO6IaHtJqn9fKBYd7uWQimDc8qx4iBG2aBXakH+D3f0pcf3I3H+zort4ibZOOVj/wMr3rFhtl+UvlMn6OEynrD+ApijtoLyNnEjNg3rJo5bjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WH/f0Dfw; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WH/f0Dfw"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso1757919b3a.2
        for <linux-edac@vger.kernel.org>; Sun, 20 Sep 2026 19:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789956618; x=1790561418; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/dMNk0vzsP7lGVeV0klVmoKB3p9mxiH+9npxTdGlvQ=;
        b=WH/f0DfwBcU6+gtSvtMxETAo3e5WuK1rjhDUT7tR4MulKzBSHI3bFv4V4vmozcsR67
         71Yw+voLfWU2XmtK2G/jyTp9R83/AwKWu3Z9OW5lOxkpGaRA5xp+wGgbo9SHO05pufrK
         Wgo6QvZNuMf7+HuEyCM4Z+wQavzwl6H+fngGBOdZ2pB3fds1TOfzE2N486xQgcq7oauY
         BzoJjBPB5v98W5A2014uDBHtcADTWa0iBrOvQjwCVU2TI15anzYNU+nB/zY6qu0WRiFx
         FVGK8NXL7pwZ4j/ChVAC9RD9ca9Q2xG5oHe2HxpwXgpFicjDwRIDLCbRFxIai7Jw3w14
         g6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789956618; x=1790561418;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/dMNk0vzsP7lGVeV0klVmoKB3p9mxiH+9npxTdGlvQ=;
        b=tNauDAN1wK303It3HWfDxeP5Xd2v5aGOkUAHIpN95ur+QoSiNtBiJRKT0iAc6tWYwg
         KWhTjR1C6dYJB9x8JJNNxxEWAC7mwg5l8lLd9V9/Xr3iX82j7ij6bfasa45Aod7BkUAL
         p7a0N1sCwW/YmeS/OzRMuLwJQULCVZJTu9bnbKRZSGSOzv1Y92rgv2tUQ75JdzbLp177
         UbD9IxsMoHZoZofjz9CqnvhoxOltq9eJiSklzMCp5jbJJoQ4l1gYpp7n744FGqZ7UDBk
         C0WHNBw+Fi4ITs7S1zCJRJYLlsEcow8l+sF+DVz90lIyt200pVPf6XsyHYESCROyDou2
         XaZg==
X-Gm-Message-State: AFuF++kX6V3o4Ag9NLnazdd/cOsJ5brqJ+qjjq0dOg66Grl/S/7Xs19K
	YIBJSVz0XzPYSHMC8HKvPQUXuXtM61pjWP13AjLroDX3ftPS00OgB0V7
X-Gm-Gg: AYBFou2BnzfiAakLcR12iKI4Hsuxaz4j2QBai4eEGKuCKt7yxA7ZqjXKZwcN9VuuYmS
	yvdUSHwlrCt40WMIeecZZQFghZM1XmrBQZW6tw31xrql8NzThfANeLDVhrjLqrZj4AjknjsoBEO
	1f8i2ll9BUXkEe4C0yZNQCAuzPryNppFIaqXmNnoeTODX7sLvPB7jB78nsqDTd+BPT6vppWtvp3
	zSp1RzagEMSukzA1Tj4BnQ3qZZHvBezqbDsqFYBOZ7DXOJAynKqNTlYmKoLn49rKzYpycWeJQDx
	BhJQZMROg7phjTOA0i8Qg9XP/AugT2Xe2bhc/vWd1VFMLFlLXbcRj96rM+PhqSwxsR0BK/VsK+F
	Xx9qHo25krVYlhCwEhtAmJWRUl6xgkOK67ugzfjMkF4H0vmSIhpj8AEPEBa6uouTpS28Ydq8Iz8
	2aUeYrht+J7LbLUgHvh/EL/QjIlnAG6o69SUjHYdynucOiIrt9yldt9xSi+i3kw8S63WtR5gdW9
	NmIgxxKsCjk3LbwoBcABmYsXXFbXWHFhKkfHBub
X-Received: by 2002:a05:6a21:1343:b0:3dd:85a9:55a2 with SMTP id adf61e73a8af0-3dd8c5be2damr15381203637.36.1789956618331;
        Sun, 20 Sep 2026 19:10:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3844:3355:5928:66ce])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331ad266sm14562856eec.23.2026.09.20.19.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:10:17 -0700 (PDT)
Date: Sun, 20 Sep 2026 19:10:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>, 
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC/amd64: Stop allocating ECC settings separately
Message-ID: <arCC5ukNvN11l1aj@google.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There is no reason to allocate and manage ECC settings separately when
struct ecc_settings can be embedded directly into the driver-private
struct amd64_pvt.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Resending this standalone cleanup that was originally posted back in
2015 as part of an async-probe RFC series [1] and got lost in the
broader driver model discussion. Since amd64_edac has long moved away
from pci_register_driver() to probing nodes directly in
amd64_edac_init(), patches 2 and 3 from that series are obsolete, and
this patch has been rebased onto the current code.

[1] https://lore.kernel.org/all/1426726150-983-2-git-send-email-dmitry.torokhov@gmail.com/


 drivers/edac/amd64_edac.c | 40 ++++++---------------------------------
 drivers/edac/amd64_edac.h | 27 ++++++++++++++------------
 2 files changed, 21 insertions(+), 46 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 475235c402e8..6931b7e61652 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -30,9 +30,6 @@ static inline u32 get_umc_reg(struct amd64_pvt *pvt, u32 reg)
 	return 0;
 }
 
-/* Per-node stuff */
-static struct ecc_settings **ecc_stngs;
-
 /* Device for the PCI component */
 static struct device *pci_ctl_dev;
 
@@ -3999,19 +3996,12 @@ static int probe_one_instance(unsigned int nid)
 {
 	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
 	struct amd64_pvt *pvt = NULL;
-	struct ecc_settings *s;
 	int ret;
 
 	ret = -ENOMEM;
-	s = kzalloc_obj(struct ecc_settings);
-	if (!s)
-		goto err_out;
-
-	ecc_stngs[nid] = s;
-
 	pvt = kzalloc_obj(struct amd64_pvt);
 	if (!pvt)
-		goto err_settings;
+		goto err_out;
 
 	pvt->mc_node_id	= nid;
 	pvt->F3 = F3;
@@ -4042,7 +4032,7 @@ static int probe_one_instance(unsigned int nid)
 		} else
 			amd64_warn("Forcing ECC on!\n");
 
-		if (!enable_ecc_error_reporting(s, nid, F3))
+		if (!enable_ecc_error_reporting(&pvt->ecc, nid, F3))
 			goto err_enable;
 	}
 
@@ -4051,7 +4041,7 @@ static int probe_one_instance(unsigned int nid)
 		amd64_err("Error probing instance: %d\n", nid);
 
 		if (boot_cpu_data.x86 < 0x17)
-			restore_ecc_error_reporting(s, nid, F3);
+			restore_ecc_error_reporting(&pvt->ecc, nid, F3);
 
 		goto err_enable;
 	}
@@ -4067,10 +4057,6 @@ static int probe_one_instance(unsigned int nid)
 	hw_info_put(pvt);
 	kfree(pvt);
 
-err_settings:
-	kfree(s);
-	ecc_stngs[nid] = NULL;
-
 err_out:
 	return ret;
 }
@@ -4078,7 +4064,6 @@ static int probe_one_instance(unsigned int nid)
 static void remove_one_instance(unsigned int nid)
 {
 	struct pci_dev *F3 = node_to_amd_nb(nid)->misc;
-	struct ecc_settings *s = ecc_stngs[nid];
 	struct mem_ctl_info *mci;
 	struct amd64_pvt *pvt;
 
@@ -4089,10 +4074,7 @@ static void remove_one_instance(unsigned int nid)
 
 	pvt = mci->pvt_info;
 
-	restore_ecc_error_reporting(s, nid, F3);
-
-	kfree(ecc_stngs[nid]);
-	ecc_stngs[nid] = NULL;
+	restore_ecc_error_reporting(&pvt->ecc, nid, F3);
 
 	/* Free the EDAC CORE resources */
 	mci->pvt_info = NULL;
@@ -4149,13 +4131,10 @@ static int __init amd64_edac_init(void)
 	opstate_init();
 
 	err = -ENOMEM;
-	ecc_stngs = kzalloc_objs(ecc_stngs[0], amd_nb_num());
-	if (!ecc_stngs)
-		goto err_free;
 
 	msrs = msrs_alloc();
 	if (!msrs)
-		goto err_free;
+		goto err_ret;
 
 	for (i = 0; i < amd_nb_num(); i++) {
 		err = probe_one_instance(i);
@@ -4195,10 +4174,7 @@ static int __init amd64_edac_init(void)
 	msrs_free(msrs);
 	msrs = NULL;
 
-err_free:
-	kfree(ecc_stngs);
-	ecc_stngs = NULL;
-
+err_ret:
 	return err;
 }
 
@@ -4218,11 +4194,7 @@ static void __exit amd64_edac_exit(void)
 	for (i = 0; i < amd_nb_num(); i++)
 		remove_one_instance(i);
 
-	kfree(ecc_stngs);
-	ecc_stngs = NULL;
-
 	pci_ctl_dev = NULL;
-
 	msrs_free(msrs);
 	msrs = NULL;
 }
diff --git a/drivers/edac/amd64_edac.h b/drivers/edac/amd64_edac.h
index 1757c1b99fc8..a93e0214143c 100644
--- a/drivers/edac/amd64_edac.h
+++ b/drivers/edac/amd64_edac.h
@@ -322,6 +322,19 @@ struct amd64_family_flags {
 	      __reserved	: 63;
 };
 
+/*
+ * per-node ECC settings descriptor
+ */
+struct ecc_settings {
+	u32 old_nbctl;
+	bool nbctl_valid;
+
+	struct flags {
+		unsigned long nb_mce_enable:1;
+		unsigned long nb_ecc_prev:1;
+	} flags;
+};
+
 struct amd64_pvt {
 	struct low_ops *ops;
 
@@ -372,6 +385,8 @@ struct amd64_pvt {
 	/* place to store error injection parameters prior to issue */
 	struct error_injection injection;
 
+	struct ecc_settings ecc;
+
 	/*
 	 * cache the dram_type
 	 *
@@ -441,18 +456,6 @@ static inline u8 dct_sel_interleave_addr(struct amd64_pvt *pvt)
 
 	return	((pvt)->dct_sel_lo >> 6) & 0x3;
 }
-/*
- * per-node ECC settings descriptor
- */
-struct ecc_settings {
-	u32 old_nbctl;
-	bool nbctl_valid;
-
-	struct flags {
-		unsigned long nb_mce_enable:1;
-		unsigned long nb_ecc_prev:1;
-	} flags;
-};
 
 /*
  * Each of the PCI Device IDs types have their own set of hardware accessor
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
Dmitry
