Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA83016E0;
	Tue, 30 Jun 2026 05:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782797640; cv=none; b=fsG9qE5+GwZc+3dZS6fdCwjD1pYgvyQx7fJ+HAYsZeXDv/m72qzYxQ/q+W0XJKvc0eZf4ayiWyCBzDMa3LnD+HEUHHn2ny7ghET3h6zKjJk5Uh8fE04eastEyuX7w9trSIEQHdnByq3aQDuprZl9gCL9vuR4hnaYjoBmgPISzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782797640; c=relaxed/simple;
	bh=s9qcyhqV/0UyN9vYELtFieTi949dgQ4sSb6Ri48MpTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zf4xbfzi1KbCBPNq6BZReiX+rN9VSguCPApjN5UydpAaXWhiEi7UqKfcRy7ofas3zqCX1/fatxd6eOY32ySa9chKk+zQ1PBbBMayc/hhLiV5ZypZNJAtYnWgtyX4md+xxu48CeWLlWxMisJzj/+gIF0DP+eDVSXno8LJ8ZcSFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Io6zhmSx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Io6zhmSx"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1055440E01CE;
	Tue, 30 Jun 2026 05:33:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gcYY9wDcNcM2; Tue, 30 Jun 2026 05:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782797626; bh=IwSEsgUCCOHd8wOQDgk59T1Fqu/AS4zEKtlCXUlipbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io6zhmSxJUemPjO7+TwakMNchN1akEPiI3bBersO3aMK8K2ghXhEy8mUXWaLgC8CB
	 WkPr4BXCY7rWPchXtBc9GOACUbdC+E432R8JRQ3IfSXhkCxPPPmyJFRnUY60pnFrvJ
	 +uOh3GZTmV56SxnFHK0hUeNesTTR7nr/xaa4v4JBJeE+pK7MXPsi4aXFr053Gj8NHA
	 PDQQcAAKdGL1sBwpr1oVdPvNrSdgBKDklrg8ZNETvI9B/iSmeqMDmM5vqfc0lR5bBY
	 KWn+AO6Cb/LGHy0yGgj/io7VibQr/+EBsuln6UmuTbjSRGRMC02K/f0TR9GmAgz9k6
	 dweTmbZk3aaN3ZJzaBpsh8hc/Y4mLWWaqt4WJ8fWrialwiFqghWkHIwlB8Jd1os8Yl
	 IHNaBz4Rl4OpHgfzETw9qfe2RUKPt3V/LfKVPeb+DX+UmbqEXxFUebNjNz0KdAxIaV
	 VQeDVSU6VmUC4O+sOoFsHShz5a8KwXWQt3eDa/KIn9HG6SM66xlbM0QNCS1skXwChw
	 y98L45IEb2qEI0GVA0LVVr1ZyS7IGUlknlX8G70rX1dseTWWiTRgi5lg10DZXT1u2p
	 XUDKRxnYPMqMCT4kl7SSTWzKuOh+wqS2Kegus+JfL2Jo14/11FIzqTzcmmk3mBs36Y
	 VPaMQPvRJ6qqpSNNn2h0tpNo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5817940E00BA;
	Tue, 30 Jun 2026 05:33:42 +0000 (UTC)
Date: Mon, 29 Jun 2026 22:33:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v6 2/3] RAS/AMD/ATL: Translate UMC normalized address to
 DRAM address using PRM
Message-ID: <20260630053339.GEakNVM7XFpJobZQQ-@fat_crate.local>
References: <20260629150731.1009605-1-yazen.ghannam@amd.com>
 <20260629150731.1009605-3-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629150731.1009605-3-yazen.ghannam@amd.com>

On Mon, Jun 29, 2026 at 11:07:30AM -0400, Yazen Ghannam wrote:
> @@ -210,7 +210,8 @@ static int __init amd_atl_init(void)
>  
>  	/* Increment this module's recount so that it can't be easily unloaded. */
>  	__module_get(THIS_MODULE);
> -	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr);
> +	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr,
> +				 convert_umc_mca_addr_to_dram_addr);

This thing with passing in a function pointer from mce_amd was a hack back
then. Now we're doing this here and we're passing in another pointer too.
Yeah, let's rip it out and have users of the decoding library call the library
directly.

Oh, and let's shorten those function names somewhat:
amd_convert_umc_mca_addr_to_dram_addr is an unreadable mouthful.

Diff ontop:

---

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index 3d622e6a6cc5..96189915b47e 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -192,6 +192,18 @@ static const struct x86_cpu_id amd_atl_cpuids[] = {
 };
 MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
 
+unsigned long amd_convert_umc_addr_to_sys_addr(struct atl_err *err)
+{
+       return convert_umc_mca_addr_to_sys_addr(err);
+}
+EXPORT_SYMBOL_GPL(amd_convert_umc_addr_to_sys_addr);
+
+int amd_convert_umc_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr)
+{
+       return convert_umc_mca_addr_to_dram_addr(err, dram_addr);
+}
+EXPORT_SYMBOL_GPL(amd_convert_umc_addr_to_dram_addr);
+
 static int __init amd_atl_init(void)
 {
 	int ret;
@@ -210,24 +222,12 @@ static int __init amd_atl_init(void)
 
 	/* Increment this module's recount so that it can't be easily unloaded. */
 	__module_get(THIS_MODULE);
-	amd_atl_register_decoder(convert_umc_mca_addr_to_sys_addr,
-				 convert_umc_mca_addr_to_dram_addr);
 
 	pr_info("AMD Address Translation Library initialized\n");
 	return 0;
 }
 
-/*
- * Exit function is only needed for testing and debug. Module unload must be
- * forced to override refcount check.
- */
-static void __exit amd_atl_exit(void)
-{
-	amd_atl_unregister_decoder();
-}
-
 module_init(amd_atl_init);
-module_exit(amd_atl_exit);
 
 MODULE_DESCRIPTION("AMD Address Translation Library");
 MODULE_LICENSE("GPL");
diff --git a/drivers/ras/amd/atl/umc.c b/drivers/ras/amd/atl/umc.c
index b48c0fe97bf2..f8470d74a9b0 100644
--- a/drivers/ras/amd/atl/umc.c
+++ b/drivers/ras/amd/atl/umc.c
@@ -318,7 +318,7 @@ static void _retire_row_mi300(struct atl_err *a_err)
 		a_err->addr &= ~MI300_UMC_MCA_COL;
 		a_err->addr |= FIELD_PREP(MI300_UMC_MCA_COL, col);
 
-		addr = amd_convert_umc_mca_addr_to_sys_addr(a_err);
+		addr = amd_convert_umc_addr_to_sys_addr(a_err);
 		if (IS_ERR_VALUE(addr))
 			continue;
 
diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 582aa2b93e81..011de2c257b1 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -10,51 +10,6 @@
 #include <linux/ras.h>
 #include <linux/uuid.h>
 
-#if IS_ENABLED(CONFIG_AMD_ATL)
-/*
- * Once set, this function pointer should never be unset.
- *
- * The library module will set this pointer if it successfully loads. The module
- * should not be unloaded except for testing and debug purposes.
- */
-static unsigned long (*amd_atl_umc_na_to_spa)(struct atl_err *err);
-
-static int (*amd_atl_umc_na_to_dram_addr)(struct atl_err *err, struct atl_dram_addr *dram_addr);
-
-void amd_atl_register_decoder(unsigned long (*f1)(struct atl_err *),
-			      int (*f2)(struct atl_err *, struct atl_dram_addr *))
-{
-	amd_atl_umc_na_to_spa = f1;
-	amd_atl_umc_na_to_dram_addr = f2;
-}
-EXPORT_SYMBOL_GPL(amd_atl_register_decoder);
-
-void amd_atl_unregister_decoder(void)
-{
-	amd_atl_umc_na_to_spa = NULL;
-	amd_atl_umc_na_to_dram_addr = NULL;
-}
-EXPORT_SYMBOL_GPL(amd_atl_unregister_decoder);
-
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err)
-{
-	if (!amd_atl_umc_na_to_spa)
-		return -EINVAL;
-
-	return amd_atl_umc_na_to_spa(err);
-}
-EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_sys_addr);
-
-int amd_convert_umc_mca_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr)
-{
-	if (!amd_atl_umc_na_to_dram_addr)
-		return -EINVAL;
-
-	return amd_atl_umc_na_to_dram_addr(err, dram_addr);
-}
-EXPORT_SYMBOL_GPL(amd_convert_umc_mca_addr_to_dram_addr);
-#endif /* CONFIG_AMD_ATL */
-
 #define CREATE_TRACE_POINTS
 #define TRACE_INCLUDE_PATH ../../include/ras
 #include <ras/ras_event.h>
diff --git a/include/linux/ras.h b/include/linux/ras.h
index 1e82a94b0db0..ce2327229515 100644
--- a/include/linux/ras.h
+++ b/include/linux/ras.h
@@ -52,18 +52,14 @@ struct atl_dram_addr {
 } __packed;
 
 #if IS_ENABLED(CONFIG_AMD_ATL)
-void amd_atl_register_decoder(unsigned long (*f1)(struct atl_err *),
-			      int (*f2)(struct atl_err *, struct atl_dram_addr *));
-void amd_atl_unregister_decoder(void);
 void amd_retire_dram_row(struct atl_err *err);
-unsigned long amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err);
-int amd_convert_umc_mca_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr);
+unsigned long amd_convert_umc_addr_to_sys_addr(struct atl_err *err);
+int amd_convert_umc_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr);
 #else
 static inline void amd_retire_dram_row(struct atl_err *err) { }
 static inline unsigned long
-amd_convert_umc_mca_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
-static inline int amd_convert_umc_mca_addr_to_dram_addr(struct atl_err *err,
-							struct atl_dram_addr *dram_addr)
+amd_convert_umc_addr_to_sys_addr(struct atl_err *err) { return -EINVAL; }
+static inline int amd_convert_umc_addr_to_dram_addr(struct atl_err *err, struct atl_dram_addr *dram_addr)
 {
 	return -EINVAL;
 }

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
