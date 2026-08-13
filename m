Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD538F929;
	Thu, 13 Aug 2026 06:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786601829; cv=none; b=N2V/B5Dzp0kWGCGNq8an+c9bFCPSdXulmxB1D3xmPV7trAwxo7DY601YI6T6cmCiSGQf3Su7PZl55R76aqkX8975bGzFbEDe6PG6RP2nkma66h5/TaDGBrY1IgHU0fO6scIATIewG/lMS1vbga/0pLwWYufEaqVGNjiYcQOKyjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786601829; c=relaxed/simple;
	bh=v/MmQFVXEjCUzgwAoZJlQdt1lco9qn8cmzeuMX+xprc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X65m0AjAwZ+dMXzuLIgf9dEiEzmxojrU7/vUPpaexaXN+Nbr+6ItHzppn921GT9UAsD3FFzamHY23LDctXh/SBYugl/mPRTxVwCw8m9jB/vwtswplReId/t4c9CrPO//0giv3AwAr0HKD4NZ/uE90j+EGmByBeY8zu79fn4LSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QpXxnqMP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QpXxnqMP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8E15C40E01CE;
	Thu, 13 Aug 2026 06:17:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kvUMEhmT0mdi; Thu, 13 Aug 2026 06:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786601814; bh=aG0TMUZ73YslIVcpg13GSDnZZHaeatcPmfAfeTZBxvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpXxnqMPOQnTHvXexZxLhtHCuZGbLHyUaw5pgg2/B1h5zAUI4xkROtiymjRiwbicI
	 yVc3nD2rVrNA7ncRh7rhr6VOUcTOC1jwMKiwPRNPMsbOWzr8q+MV5gZZzuD+1UjqVq
	 hKsJfK9wjgpjcLqRY7IuKt3aGXKWx9czbkIgbdmEesD6rOnFwWGDgJGkDu1pIoegqK
	 ZUBr8UQ9LyPGd9iXzKosw5ex0im4dtfyb+y3n29fRtzNXpNxY9NkJseN71D0yKeIV9
	 7lt9gzCVrJwY8axs+a4NMk27YJ6nENAjnhaeXdw9hCEeGMqHi971+T6v/olweJSDhF
	 IHeQ9wSbO6R+NVJngxJj/QQGxCP8WpN9nMKBVSIyqGOtZrrBJw0cC8uqYw3XekfV3B
	 PfwZ6zvlXKuk0jC4MRdj0zlQ0IHGDgUnb+YgtAFLmKGTXUh7HY/9KdHyPWQHq5Brne
	 VGScUBuo8vBRex6L5N2HPuxrH6ExmZPwe89M7sk+IZP9tEDScGgXUrSYImOF5vkS0A
	 MXzGSYJh7pO6GZB3FV9PtYmLDofhfO646pTAVeQVsY7fSLWi2u8/l+0tZbFqdKwr8u
	 2g6lqUJb3c4+jkiDqGHr7nUt1NvK3IZFiu0Wtg5yPV1C5dCoNIbhXfVkvTth3LehK2
	 mhu/zsM24yx3Zs9J+JZEJvt0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2026240E019C;
	Thu, 13 Aug 2026 06:16:48 +0000 (UTC)
Date: Wed, 12 Aug 2026 23:16:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/device: Fix double free on sysfs registration
 failure
Message-ID: <20260813061645.GAan1hTeUc5N4-7odJ@fat_crate.local>
References: <20260714121113.1488956-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714121113.1488956-1-lgs201920130244@gmail.com>

On Tue, Jul 14, 2026 at 08:11:13PM +0800, Guangshuo Li wrote:
> edac_device_alloc_ctl_info() allocates dev_ctl and passes it to
> edac_device_register_sysfs_main_kobj() to initialize its embedded
> kobject.
> 
> If kobject_init_and_add() fails, the helper calls kobject_put(). The
> final reference invokes edac_device_ctrl_master_release(), which calls
> __edac_device_free_ctl_info() and frees dev_ctl for the first time.

So far so good.

> After the helper returns an error, edac_device_alloc_ctl_info() jumps
> to its free label and calls __edac_device_free_ctl_info() on the same
> object again, resulting in a double free.

This is where you lost me.

Because:

/* Free the actual struct */
static inline void __edac_device_free_ctl_info(struct edac_device_ctl_info *ci)
{
        if (ci) {
	^^^^^^^^^^

Otherwise, we would've caught the double-free a bunch of times now.

I do like the cleanup in edac_device_register_sysfs_main_kobj() though. This

        dev_root = bus_get_dev_root(edac_subsys);
        if (dev_root) {
                err = kobject_init_and_add(&edac_dev->kobj, &ktype_device_ctrl,

is an antipattern and needs to go and I like how you're doing

	if (!dev_root)

so I'd take that cleanup gladly.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
