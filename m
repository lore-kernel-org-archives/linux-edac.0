Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845F387578;
	Fri,  3 Apr 2026 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775212523; cv=none; b=d2XxYvyFNdsf4CeN6nx+AtFhXexdr1aps7tpBRdLv9FthYqQGLdRV3QHavKP3DkGjDjO2ckPtT9j+2lJxWBBCvQUA9Z8pLCUA4rIe85ZLR9Qy4SpQkaxqXw5r0dgGj2gC8AgQi7goWN/X4s0EzzaAUGyVvv675nd3qutQBHoinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775212523; c=relaxed/simple;
	bh=1IcB4MvQPR6xA6uSK2MoKcotkbWetAHxyiAlBas3+KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfoA5rcYnx2Ux1UJgPMaCJVs4et3XdWRfTzLlTgA24DOrO4zzgaxwRZLlFmxLT4lxe4xFWF1QzXrYKxjqJVK80SUZsd1QwseOI6sFWtERGaM60VMLatWS+J5M/ZcWFNCjfufgU2HCm+AZmu+jLYVqS4hMvPA23K+LQexcsuIxPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FY5sWkJH; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FY5sWkJH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 438DA40E00DE;
	Fri,  3 Apr 2026 10:35:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id JNp1n2GQULQh; Fri,  3 Apr 2026 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1775212511; bh=M+Z3OnohcO0PYD47eMj2NSzLQODFYmtv17a14yjALbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FY5sWkJH1KCoEOmbp1YqIQoYaANUjL1ut9frCTkQMfKUsWOmw4LjVhYWm77W+cQMQ
	 aHduq+bhGLZGOIPCRBhhU4xzWirds/Sgj8KC7shF1nD28pvsRUmwS/1M2yf4RkrbLX
	 2e1Wn8eHV9WdDwaY9sZYiwcMrE1axjL+hcUFTw5QkHzY92gkA2IZOtjiQfOfgEZzkE
	 7P7rWxe705Ov5vOqz+8BVzheAr7sgndGlA70FsM8bLNiTGeX24M0NApLOiu+UYFUZZ
	 6aChpcWq7kKUVbmV0E1aruap54X5yr+/CfrgUVqOnmgH2KvpW2TbDpRQEUId8xuj1S
	 Zt0Ta5j3PNONky82N+RRsRTWR/e2HBtIOpKVTriLPDcM6LzktLFTYqF4W/L81zGt+h
	 K3oEoYtEXNzrZfDdSXPy+Q3mHPsXoAvDBKkro04blmKp2l0N1W8vx7Bv0+dUPOhFSD
	 HHwCgalh/DXuApQsI99R/7lotitqePDF5qg37ccBwZNz8t8CCB3raxwAgoH0pYQ8hw
	 GW+3eDznqkV3p38ls6ohZJFXTOcUDEfzXPpeW08cYfHwfr9LFJDTuYvOSqKDCY/AfG
	 4rAFM4bZVO1eJWhO4L8e2M2LmSozbhCn+Q6mXw4QP0UPsmV7QU+pTjSVHrfb5cLVh7
	 aLD+8XzTN1ycGTxS1BUzgZGE=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 50C2D40E0163;
	Fri,  3 Apr 2026 10:35:05 +0000 (UTC)
Date: Fri, 3 Apr 2026 12:34:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com,
	tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in
 mc_remove()
Message-ID: <20260403103457.GAac-X0SzsO9MtwAVE@fat_crate.local>
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260401111836.2342918-1-ptsm@linux.microsoft.com>

On Wed, Apr 01, 2026 at 04:18:36AM -0700, Prasanna Kumar T S M wrote:
> The teardown sequence in mc_remove() does not mirror the reverse of the
> initialization order in mc_probe(). In particular,
> unregister_rpmsg_driver() is called before remove_versalnet(), and
> cdx_mcdi_finish() is called after rproc_shutdown().
> 
> Reorder mc_remove() to reverse the probe initialization sequence,
> consistent with the probe error-unwind paths.
> 
> The rproc reference acquired via rproc_get_by_phandle() during probe
> is not released in mc_remove(), causing a reference count leak. Add
> the missing rproc_put() call.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>  drivers/edac/versalnet_edac.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Sashiko has found things, pls addres them:

https://sashiko.dev/#/patchset/20260401111836.2342918-1-ptsm%40linux.microsoft.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
