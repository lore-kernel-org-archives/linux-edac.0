Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90E43101CE;
	Mon,  4 May 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900370; cv=none; b=bBAH+t63aZ3dNbSLxFKH8kq+O67h2fMQm9bAzloa+XRcduHBHD6Bcp6P2fPq3Bwe4B0s0DK7AYE3Xv/yAZumr9nMBy991ZB+EmNRjYbNSgsyIsbOGMgYGE5c7wgM3sKdlsAtVYJsUBoBd8ELuJlbmubi7gdZSkE1L3peZoIM8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900370; c=relaxed/simple;
	bh=tkeKAMXLm3dXe2J484W0CBIeyeFPknokgoXU4pex2VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuZF4Y2qSy4YhGshIIGhTYtXn9IFRjI6jw5Ue9WrFEtCu0SU2wntU3ioYj1KljwR4lUEwx3Cmt9Tc2Haqz0446gOb/qtbHxyCfJZwq5YEQYylDGcOOIJtBKdJeGJUJrys4EmJGoNm3udtsKzdZZ7T0/qUlnkUDp+kZO8ZHoeM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SF9Al2ur; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SF9Al2ur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1ECC2BCB8;
	Mon,  4 May 2026 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777900370;
	bh=tkeKAMXLm3dXe2J484W0CBIeyeFPknokgoXU4pex2VM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SF9Al2ur/kMvk4STmiO3qcRrRuQn0RWXDWDGr4UKJBDeBXfWMx44IEOUmvs4H7Mtb
	 k+UFJXaxfMAhROTov5z0PtBx6hQPED+9qOeTKIBWEnSGmjGTU7slpOSOemLgklaEcP
	 dnClM8OSJM//I1AKgtWBIYJjPiVR0+8Ng8E1P2wnp2PnO4N5K5MM6BAyD4FqVje4fP
	 tElTzIMqdhAk3dE9VhMIuDDgQpSm+VuJfaZNGlp5rUXp1xU9YKjPUTK/Bwl/P6Aq76
	 UntEAuJYdhYqmWkAIvLm3FNA4kPxcxV/AKE28OmhG2sn9Jh0NVqUuWMVID2OjfuxLm
	 xCebxK+PIpSWw==
Message-ID: <44606936-0667-41fa-ae8b-76a7e9890b52@kernel.org>
Date: Mon, 4 May 2026 08:12:47 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EDAC/altera: Fix SDMMC PortB OF node reference leak
Content-Language: en-US
To: Yuho Choi <dbgh9129@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260503212558.2811480-1-dbgh9129@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260503212558.2811480-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/3/26 16:25, Yuho Choi wrote:
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

I think you need the

Cc: stable@vger.kernel.org

But other than that:

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Thanks,
Dinh
