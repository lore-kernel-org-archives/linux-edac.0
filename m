Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177228DC4;
	Wed, 10 Jun 2026 00:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781051739; cv=none; b=egIADMM6V6G5oxReSh1mFbg9oMfNAQyL4UtAAKysNwMKvsGEjQO07dHu34dJbvX88ceN7QM3kSFGzQqviZTcsMzkErPcsLIsVok5j7JmHOHxdV1usuULOislZPlDUmbOHu/c200HuTP/vMwp4+7xfbEXWp7NXcPGFgufndW9aWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781051739; c=relaxed/simple;
	bh=2UWdUmXT4WvjSaXFGaejvhkzwTN/ehm8aLf9q5y4Qko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKVkJ7a7PRN4W/294QinaSG/Dn8L6kVZFgzLmz639DwnEv8KNealoiCbJO6gr1gsvIJQPcEqaozsnLkD922juzPKPEY1LsMuInYkewuuxM7r9aI9a0yqCcJ4UvT9bEFj1q2De3sCpQ8sPlvEaRRy4nt5nE9s8f8VUYI3lbFxZ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MsXKf971; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MsXKf971"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CD9B240E0214;
	Wed, 10 Jun 2026 00:35:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Jni2vtQ42GkI; Wed, 10 Jun 2026 00:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781051724; bh=ZIWbYrxMg/UnC9hMcQQWZ/+FqI4xYCoaJf0jX8wJwWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsXKf97120rzTZWYXQ8CnfATGLF8r52E651R2SFbr9fEEwKrmde3SegrovYlT69t7
	 91+e8YDLmbaoLT/+Id6IY95ZVK9F4YrYcpLpU0alYt4ymm2+8GwwbwixdAZ4c4eskX
	 CNsKvGopnnnXt6ZjaKOvLOuk3kz+MFc0laeYxJKGQ0UP+6IMvKUhgEG3id1FnaeKGE
	 qXb3CnSq7hYo57xlgAiqevstLx7r8BJYcj1sG13HsZtYLLmiDgAMIywLiHa22+q/35
	 oU8CkNHs+T2s4IFLk3XziUAJAz+djUgRB8+Pai2ywFY1CpXvy02PXXCnozF4xxLyfN
	 mTxneuXIyKmHSZIawnSej8UMtPspoCneBFx4t9I6SxaDdg1swV9Ho6IB4sxJ4wlX0k
	 0rm5gClv9sDnUTgSH0rhvrzP2/BUeMx3IGdH6vnVlhPbcoZi7Ozhayh1SSKlEr1GDi
	 wfKUrEkPbTAmXfsa+Z2U/ws86ctUp7PumH8MMQX0eD8gjafuLPLgYWSX/hxsJyTVaN
	 JNwka8XQhhuru7d/yQRuHx+q1VFBSsGMcMM8GDXOSp1VXVwsbtoTiWoacIn7Lo4peo
	 d/E/+W2elKu1tk0rDUyjMO37a6XW6HNhojfgeV1HPk7Ll8llaAU51oHWBQ15iPTt1E
	 F7+IXNvOqFDufneI9PpEd/QI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 48F6B40E01B5;
	Wed, 10 Jun 2026 00:35:20 +0000 (UTC)
Date: Tue, 9 Jun 2026 17:35:16 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260604154856.GA1625873@yaz-khff2.amd.com>

On Thu, Jun 04, 2026 at 11:48:56AM -0400, Yazen Ghannam wrote:
> I think the issue is having concurrent updates to mci->error_desc. EDAC
> assumes a single owner for the MCIs. The fake_inject interface basically
> acts as a second module/owner.

Ok, something like this. Ugly but it should show the intent. It probably needs
more auditing whether we have copied all the fields we need down the
edac_mc_handle_error() path...

diff --git a/drivers/edac/debugfs.c b/drivers/edac/debugfs.c
index 8195fc9c9354..034b9b3f9cf5 100644
--- a/drivers/edac/debugfs.c
+++ b/drivers/edac/debugfs.c
@@ -14,28 +14,38 @@ static ssize_t edac_fake_inject_write(struct file *file,
 	struct mem_ctl_info *mci = to_mci(dev);
 	static enum hw_event_mc_err_type type;
 	u16 errcount = mci->fake_inject_count;
+	struct mem_ctl_info *imci;
+
+	imci = kmalloc(sizeof(struct mem_ctl_info), GFP_KERNEL);
+	if (!imci)
+		return -ENOMEM;
+
+	/* use a local copy and copy the struct */
+	*imci = *mci;
 
 	if (!errcount)
 		errcount = 1;
 
-	type = mci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
-				   : HW_EVENT_ERR_CORRECTED;
+	type = imci->fake_inject_ue ? HW_EVENT_ERR_UNCORRECTED
+				    : HW_EVENT_ERR_CORRECTED;
 
 	printk(KERN_DEBUG
 	       "Generating %d %s fake error%s to %d.%d.%d to test core handling. NOTE: this won't test the driver-specific decoding logic.\n",
 		errcount,
 		(type == HW_EVENT_ERR_UNCORRECTED) ? "UE" : "CE",
 		str_plural(errcount),
-		mci->fake_inject_layer[0],
-		mci->fake_inject_layer[1],
-		mci->fake_inject_layer[2]
+		imci->fake_inject_layer[0],
+		imci->fake_inject_layer[1],
+		imci->fake_inject_layer[2]
 	       );
-	edac_mc_handle_error(type, mci, errcount, 0, 0, 0,
-			     mci->fake_inject_layer[0],
-			     mci->fake_inject_layer[1],
-			     mci->fake_inject_layer[2],
+	edac_mc_handle_error(type, imci, errcount, 0, 0, 0,
+			     imci->fake_inject_layer[0],
+			     imci->fake_inject_layer[1],
+			     imci->fake_inject_layer[2],
 			     "FAKE ERROR", "for EDAC testing only");
 
+	kfree(imci);
+
 	return count;
 }
 


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
