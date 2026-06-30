Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79D136C9E4;
	Tue, 30 Jun 2026 18:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845737; cv=none; b=ElFiFDxpe7UksKtbwsyG6yYx8+/zpvJzC4kmrwNYgWUjzulxABaMCZgz2i0QQ9hTyro+KhVqPAai/LJfAPqJw65V422iAqHdOSG95kAmrtRzxEAnTSSSNKwQ4FKKTKYfFPnIeT8hA3GKunIAi4YUhBoHC1sT9FV94W//hwfC8OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845737; c=relaxed/simple;
	bh=CaZftNXyxsymjRgZKqgoTTdkw4f4pItMRLytjVrzC00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnUeY91Aix7tnuvFxr2gypVetIiRkgPTv/yjNCQKTAxVg+U6snxb5McR49IuqW8HkwaUmosMa5EbRT6ufOqU/jyGIlgep9omHCZzbuWAETBEuJMopzPsQgJlBLVtSHdw1YrC/h6c4qjdMsiPFOnXfMs+gfuK3AnIBNv1IYZbpT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Ug+6yVbq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Ug+6yVbq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7BF5840E01D8;
	Tue, 30 Jun 2026 18:55:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VxyqGz-Eh69j; Tue, 30 Jun 2026 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782845720; bh=lxWA54b3do7IQKMULQtgd7AbY/YHH+Y0SlE0azy2vA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ug+6yVbq3ZiEGZlUO4hAZGtDLJIAEWC0xGYHekwmR0ZMbYjGNR9UpDy86mk+Z2oH2
	 ukCn9aKzk9Yvigv1LTD3pHbDrO83yGcidswNL8ztQWUqykKBhn7ElZ8NKMRY4dZW28
	 XxKOJ+cDzPpphTGYAHMR5ZwWxQTYhY3zMtAc4+SFC9O9+aVFeUv4celyWOdppo2S3h
	 xlfbgWI0cmSVYh3ZwFeG+YegUeoC7OXiMO3Ybl56lUzsgyItGKXDvEpL+tPQwZ/666
	 MfUKLEnobJYeTMVf4YgfBHzm1YqWl0hDtmPU2VzlA4qIqHFx1dGkoDuXWZGK0eUuhn
	 WOQJGP6rX/83V9y3Hw1NKcTxbGoc0tAHDEcLSgtvkiIwxU00R6xFhRoDD9OtZQN4E8
	 5hU/JMkFKzwBZLmtFBvm/dg/71+iLV+gF93QJ6Qdk4TNfIUMO9ikgZ1b6kJbk+0RRZ
	 bkaaKy2M6spIiZBD0MzT3DTRppY5U4VG7ZnFqalULUV5rpxhx+hCuQETchE4qtUzYf
	 LBO0fz0gWs93Dg6afzjuCjhkPpeITpcZ3Rbu52/KqgZ7kdOeB7tmoZe1KVLjz4LflU
	 xlHbCUeMr870wcAMYpxttlj41HXt89IdwGfcYlHfOZ47gLrUDnn+mVhvtcN+tc+w9y
	 P8bHF66Zik4HuRbZIH4pxevI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1FCBF40E00BF;
	Tue, 30 Jun 2026 18:55:15 +0000 (UTC)
Date: Tue, 30 Jun 2026 11:55:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v6 2/3] RAS/AMD/ATL: Translate UMC normalized address to
 DRAM address using PRM
Message-ID: <20260630185512.GAakQRELNdl6b3ycMn@fat_crate.local>
References: <20260629150731.1009605-1-yazen.ghannam@amd.com>
 <20260629150731.1009605-3-yazen.ghannam@amd.com>
 <20260630053339.GEakNVM7XFpJobZQQ-@fat_crate.local>
 <20260630144829.GA4322@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630144829.GA4322@yaz-khff2.amd.com>

On Tue, Jun 30, 2026 at 10:48:29AM -0400, Yazen Ghannam wrote:
> There are some minor formatting and build issues. I can send a v7 with
> those fixed.

Thanks, that was just to show the idea.

Pls split it into a pre-patch or two which remove the current gunk and then
rebase the others ontop.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
