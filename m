Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAF821146C;
	Mon,  1 Jun 2026 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780321662; cv=none; b=gYGDgnaCG/yZz3s66UEd0oJOmrrIzheA9+W+8LielI07WlUMBi+QmqwTMLW4OO69nM2xhNcITKofsaTb4v+De450aD0FMhcJ2gOWfsMoJKN6RpCceB1dr6iVb13CoGKtHQPrdc+ShTzaCXqSnyMD2gFwCRrPkyfqal0KGYl/K5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780321662; c=relaxed/simple;
	bh=3uAVFt4ukFRq9R6+j/fKC/rbTrkXd/os8Xjx1TAfVEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLD4XaY/9CzItQsd5Q76uxtMsBiQEsIJPyfBRYRrrIpJhgiwk27PE028PI3YUzeCAnFabktM2rud+3cdCcZ2qNIDIpbt+s51Qi1jDXsvGsvtIh8oEPCpTKNt5FZ9+LZG57FwwrY2Ea4egiMDGF0mwJL/LebqlQjiWG1PBPbggo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OuQ5A+MW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OuQ5A+MW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B932640E01F9;
	Mon,  1 Jun 2026 13:47:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2tl-sXTxupzQ; Mon,  1 Jun 2026 13:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780321643; bh=Jn+cEzQ762jpg7Bgrn1rOZFpjh/BIyai3RgtDwaF/DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OuQ5A+MW1A+Hap/q5Qc3Y0bQsWHSw55ZwiG2FjVZHh/fBmt9i7SI59B2Y+UQ3qIn0
	 xnRMBZyJlyDfzhQmY994XhpxP1Joonzc+pBvy+zZDPNolu6kdw2A5bb5AhzcLBlPZ8
	 sGGcsGVib7E8mTPuxxEgt+H63kgO7nS6xSlt0bERvDWBgIwCGmWdmLbg9Tpe0Ft/Uz
	 FjydU0sD2RwGNPVzzYfSssCwjAnmH6/X4/vSVG7DPf/E8QY+yRCy5Xq/vq60sqUG3J
	 So0wHSIoADzgrurMyO1Qs+LC0jrCyM0aFBW+8qT1S/s8X4/RJVkORCk03niUmcPEwO
	 KixGskcqaF1TG1VHdTg6F2FwaqPz5cJcN1r/X3E5VMjhbmQLLQlJatnjHPGMRTj24P
	 QhrfYAmkD+3+bAflZYUvCp2xa908FwNI3IkHvIVlFGMN3OcdBjLQk6mk8OhczH1c1d
	 38dVNZYHm2A6TxmQ2FuaJ9b/DMlWR1sFXI3KwPHYMxPud+8c2JEI2F3iNLhAj+ejVm
	 v5TieyNSC9LccYX50v1ODOs9SFyEeI12koI56wNA8dmYC5SovZ12Juqcrmdtv/A3UE
	 Plj3F0wru64VWmUDLvVoTJf9X3YIYL7+sBUkZesHkhOQOV152kILJIOitu4mYnxS8K
	 iju6+NU1aKgccGJE8V5WaASo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 02FF040E00BA;
	Mon,  1 Jun 2026 13:47:17 +0000 (UTC)
Date: Mon, 1 Jun 2026 06:47:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/altera: Fix SDMMC PortB OF node reference leak
Message-ID: <20260601134707.GAah2NW2u5c4cyzklQ@fat_crate.local>
References: <20260503212558.2811480-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260503212558.2811480-1-dbgh9129@gmail.com>

On Sun, May 03, 2026 at 05:25:58PM -0400, Yuho Choi wrote:
> of_find_compatible_node() returns a device node with its refcount
> incremented. altr_portb_setup() looks up the SDMMC ECC node but does
> not drop that reference on error paths or after successful setup.
> 
> Route those exits through an of_node_put() cleanup path. Also free the
> EDAC control info if devres_open_group() fails after dci has been
> allocated, and release the devres group before freeing dci because
> altdev is stored in dci->pvt_info.
> 
> Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes since v1:
> - Free the EDAC control info when devres_open_group() fails after dci
>   has been allocated.
> - Release the PortB devres group before freeing dci so altdev->ddev
>   remains valid during devres cleanup.
> - Keep the !dci failure path limited to dropping the OF node reference.

https://sashiko.dev/#/patchset/20260503212558.2811480-1-dbgh9129%40gmail.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
