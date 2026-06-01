Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D33358C4;
	Mon,  1 Jun 2026 20:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345422; cv=none; b=IqqT6nIgfo9Y21I7PDWUUYzWywihnuARmFz5fEGlUROm8veH3QYcwPnt+gH4oSsErayA9hcBszeyjueMFH83DxikJYpyDGMykVMtVGxiXncd6p3mUbu/0fFL1RyeoRWyWvA2WoPLR9ttXBGWwQZfoK/7E6+P1muYvdL6eUINhXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345422; c=relaxed/simple;
	bh=g0V3mw7Wodi3InIMw3+fUdWHWpSRoicfkPN/OHeyBL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXeTDUYfA0x2V6u1dNDlAj9II06t8j8xHhizkA3tYsoy+QWhhrBKL2pT94Tg3izXSLYJvwCNQ3aUAovoidIa1BdBE8Dv72EyXwFMK+hODPezAW1kNE2gyQPlzYsPy5qxYb5X+IsRB4XCkCIOvKBr2jl0AdIObZQl7QObAxZo4qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Yap2VJzW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Yap2VJzW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3BEA040E01B3;
	Mon,  1 Jun 2026 20:23:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DmB7TzQmDRX3; Mon,  1 Jun 2026 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780345408; bh=Y/iyZpoMjA5b4LYT1pj3Id8nAgAozhiJVOSWHli0pKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yap2VJzW/6S50mZY1RG+g+vzumYr9+eYa+T1qrdaLqhki2RMBRlUQz+ASQRUHPUEP
	 OW7QzjNT8vuLqj/1AVOd484wKWyW3JKSE0qKNHrvqPTm/v1Zw3CZckXmHmN3QJ7MMz
	 iIcHxiOqj3OrbaakIZO20e6OvlidJG07r4k3ZnnHv0TKjuLGpgOITFXKaGyKqi78jA
	 ExzRrS937dma0ckUVFhsY0JjDyDokDblE7ZJhmfUmy5rNHUFqDM4DRVgbBhd8tMwj+
	 9tWx18lp/dzE6aEZTvXaFP45HxTw9xgYW7Mfevu25S4Eqev2yETAY9cobavy/enp+P
	 +npTXbedqX5K8yhEx3dKC3ts0u2RumiWloK7Qcor2F9XdbpTIuMzp/BZUiZ4k8oP4H
	 crS4jhtG2qEymnJuJyB8U+ymSoPSCRQB72zIgG+jtI177q7e4qd2a4di30HXH06Kob
	 FAZptAcJJYC3elkkjihWdhguLf/z8ASSiDPhVU2GJJ+n58lr0Ef4VHcmhM2Vpt5FwY
	 Qj9wYcUg0YEqtdUC560yJL2CpeD0TqaIw62YiZEY+BCY+yDa0PCbe0dovTuI1iLfvT
	 v5iv/RaQ21RkAQ1TmdJ/XlvR6RcuMvIY5+MKsQxDo6PW1sLosxQdBucX3XQwp8mDIe
	 yn0idUWdxfhNaLNaMncCcMPY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 94EA040E00BA;
	Mon,  1 Jun 2026 20:23:20 +0000 (UTC)
Date: Mon, 1 Jun 2026 13:23:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>,
	Doug Thompson <dougthompson@xmission.com>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] EDAC/sysfs: Fix kobject cleanup after
 kobject_init_and_add() failure
Message-ID: <20260601202311.GEah3qL5tqLUxon7vh@fat_crate.local>
References: <20260502080647.522511-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260502080647.522511-1-lgs201920130244@gmail.com>

On Sat, May 02, 2026 at 04:06:47PM +0800, Guangshuo Li wrote:
> If kobject_init_and_add() fails, the initialized kobject should be
> released with kobject_put(). Otherwise the kobject may leak resources
> associated with it.
> 
> Some EDAC sysfs error paths currently drop the parent kobject reference
> directly after kobject_init_and_add() fails. However, the corresponding
> release callbacks of the child kobjects already drop those parent
> references. Call kobject_put() on the initialized child kobject instead,
> so the release callbacks can unwind the references properly.
> 
> In edac_device_register_sysfs_main_kobj(), kobject_put() may call
> edac_device_ctrl_master_release(), which drops the module reference and
> frees the edac_device_ctl_info object. The error path then calls
> module_put(edac_dev->owner). This dereferences edac_dev after it may have
> been freed, causing a possible use-after-free, and also drops the module
> reference twice.
> 
> Track whether kobject_init_and_add() has actually been called. If it has,
> rely on the kobject release callback to drop the module reference;
> otherwise, drop the module reference directly.
> 
> Also handle the EDAC PCI top-level kobject setup carefully: if
> kobject_init_and_add() was called and failed, use kobject_put(); if it
> was never called, free the allocated kobject directly.
> 
> These issues were found by a static analysis tool I am developing.
> 
> Fixes: 17ed808ad2431 ("EDAC: Fix reference count leaks")
> Fixes: b2ed215a3338 ("Kobject: change drivers/edac to use kobject_init_and_add")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Move kobj_initialized assignment to the kobject_init_and_add() call
>     site so it records whether the kobject has actually been initialized.
> v3:
>   - Fix similar kobject_init_and_add() error paths under drivers/edac/.
>   - Fold in the previous edac_device_create_instance() cleanup fix.
>   - Put the initialized child kobject instead of the parent kobject.
>   - Avoid calling kobject_put() on edac_pci_top_main_kobj if
>     kobject_init_and_add() was not called.
> 
>  drivers/edac/edac_device_sysfs.c | 12 ++++++++----
>  drivers/edac/edac_pci_sysfs.c    | 11 +++++++++--
>  2 files changed, 17 insertions(+), 6 deletions(-)

The artificial analysis tool found this:

https://sashiko.dev/#/patchset/20260502080647.522511-1-lgs201920130244%40gmail.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
