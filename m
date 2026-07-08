Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20C3BB13B
	for <linux-edac@vger.kernel.org>; Wed,  8 Jul 2026 05:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489236; cv=none; b=AAp7W44bPj02y6jwPNiCiuTqDaaOLVqDX99htXV3ddWn9xRIMHcKMoITBM7k2lBi5tJEkYVfZt28wzRJ/JCroqbMkJk42fSVuj2WiXToaaQF+zxVTz+a0EZ+WhW9bz1n+9UBI/zAJ8H8utBX03z9NKDZcfVZHa/PjO9nhQQRpTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489236; c=relaxed/simple;
	bh=1PWmD83lypK0k6kJrHF/KOoqgNP/sI8Z7InIcG97/tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oj8nNnsHLakeA5OeL5LZBjo+hzB7r9qRypXyqlqF3fH0p1xoLVuOOL6eZum+58kHF9Udx4HRYRRWmnfuyFjuxyamXLBwn653XX+w2OZ8CLQiaNDG4FQSJ9/VruL78O1nthQzk6+fRPeeW7jS3I7AfTrLw0akV8r1SFQkbPoboVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VUqOb7RX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VUqOb7RX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0BAAD40E0163;
	Wed,  8 Jul 2026 05:40:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XmNMq1YzNoO1; Wed,  8 Jul 2026 05:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783489222; bh=gFbgLTXHOT3ELVc1B+XSrwuQk92YV1VcPMzJW5AOkgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUqOb7RXpjC2xIM4ZMv5ou509/fi+domckvWume+nu1c9XHXgqSNVsHzlw3I8sk+E
	 MgTpjFgnm3k9sMozoS779r/gJLTW04Eeb1rUQPEEuvYYGWRZCKmF3iNu332dB2XlRE
	 2D+AO0Y5PPqF58ccrbCs9YnwkPQEc0AlkomuNE/+p9r7Ld+qUzgKKwCxiDZZPkOb+S
	 X+He6uUUVNHup87NgN3DbqqX+gNRUl/zqifyUTrPEdW3EOFwdhqjMT46OvlB8M6Gh6
	 4pCTiPVBpxC277PfbEVnxILgEl4CPHkwU81DRp1yQoLsRMYVIrnJtjieaox06sIYFq
	 Bz00VcW5/Ev2R4Tk1P0uYxlq/KXN0O/WveykV6IjfnM7DRUJ7K8BfDbh6dTULw9olF
	 +McYT9tWhO5DaE6n9EH3Z+fBcSAGbP2+OOVwTfy6bJCyC7JdStfu6Thm5B7VnOHFB2
	 BN/bMiL/b3aEE/71fsCK7Xm2PfARD41QLoQBYoqNb8Y//7eMbESZHIV5uFbjDK8GJP
	 gQymNOgnq5W4ss6xHSQ0mVrwEWLySKnvBBuJ5StBbXl9B3kgTQGC+V8TF/R+0f+m34
	 FpwZzMqKxwGcGcNrvw1MY2tF8oRbDRqT2ElUjEx1HLK+a2OUQbxT0B2BknfT+Tpw0X
	 6nc+/pLzjo0pqp9ORL0U+9Wg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CE33E40E016E;
	Wed,  8 Jul 2026 05:40:16 +0000 (UTC)
Date: Tue, 7 Jul 2026 22:40:13 -0700
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: yazen.ghannam@amd.com, Tony Luck <tony.luck@intel.com>,
	Deskhmukh Shrirang <Shrirang.Deskhmukh@amd.com>,
	linux-edac@vger.kernel.org
Subject: Re: [PATCH v2] RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed
Message-ID: <20260708054013.GJak3ivcTJhj9G8FU_@fat_crate.local>
References: <20260706212116.1221949-1-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706212116.1221949-1-mario.limonciello@amd.com>

On Mon, Jul 06, 2026 at 04:21:15PM -0500, Mario Limonciello wrote:
> From: Yazen Ghannam <yazen.ghannam@amd.com>
> 
> The AMD Address Translation Library (ATL) will attempt to load on all
> AMD Zen/SMCA systems.
> 
> However, only systems with DRAM ECC enabled will use the library. Other
> systems will fail to load the library and produce an unnecessary message
> to the user.
> 
> Remove the ATL module dependency table to prevent autoloading. Request
> ATL to load from EDAC once all system checks are complete.
> 
> Fixes: 3f3174996be6 ("RAS: Introduce AMD Address Translation Library")
> Reported-by: Mario Limonciello <mario.limonciello@amd.com>
> Closes: https://lore.kernel.org/20260305154528.1171999-1-mario.limonciello@amd.com
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Tested-by: Deskhmukh Shrirang <Shrirang.Deskhmukh@amd.com>
> Link: https://lore.kernel.org/all/20260307144910.GA113343@yaz-khff2.amd.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>  * use request_module_nowait() (Boris)
> ---
>  drivers/edac/amd64_edac.c  | 2 ++
>  drivers/ras/amd/atl/core.c | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
