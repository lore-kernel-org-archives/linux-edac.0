Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4089F330D4C;
	Wed, 10 Jun 2026 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112472; cv=none; b=nCkkY9P4ksUbjK0ARZwYV+MUx6xFSEJGKWQsbZtXYL0AMS1xan4ST11MugXHDR5V/Xl2oGWezJwjm6JeNaTWzjV5YXJcfDyi+fVdRsEn0zYZ9NzURlg0nu2zJ7WI9hRGi/5ua5GQQugYda4cos7+cp+MDhZqZWLCF/iJeEoPTjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112472; c=relaxed/simple;
	bh=LVVNFI45AK+e6mhSon04876jEBFgN4nDBsIBE1VKWpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfJCXbdP6WsbFoFnPyn9rXW39/lCx4WWYcaOb2Ryfn6cIcxHoUQ2WQJaVEqzQHmvjN0dQeW4Mby775puo67tbl+9J9bzKsEGtw50nwnODT2rdbQstGAwgDKxzOfRWl5FIlw44CCipLm1GTQI/12Pr/d8JpH+iYUDXREYIrJBBak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LUxmx/7g; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LUxmx/7g"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2DA4340E0177;
	Wed, 10 Jun 2026 17:27:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YtZhZAtAs2sO; Wed, 10 Jun 2026 17:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781112452; bh=oDajhi6Fb7B/9ddxwqmq7iWoEhUI/yDS71gUVky48fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LUxmx/7g1ot2UYJfOagMzE+/QlF+rCjIEFibSXjZMY1IgOripjq3PriFPKD8hgVEe
	 hVOHb4PZ+3z9LLnE2H1uh90DytaasBoqNqo9gOVjD7LpRQqtOvWZ/c3Efs3yF6yiTS
	 bfLkaZdkXn1SipnXjIT7E2JcqMrJ5BffhlJFbXCZ81GqM650cRMuocSl6T/+eOh8qc
	 ZUjiKlGgInPX9TVwp8eYc2RtdvbyWh6cvfHUWPBWECPHHZ031EBoOgaPi7JkSCJpNp
	 mRW76Z0BFo3LCOMw2KZ2MRNJB0nDudE1bVkZ1sbWYXK2Od4LIVN/EyzLXaWbSADiwT
	 hlp7PxaOENJvBhFnPrIO5KAqDQ5ElXANdli2zVaFhPI2QcErX4iUDlUYPD0gpgg5nI
	 AySi3TVbrFLDgED5dEx/dKFsKl1/iCsPpXOhWXXrH50zC3A2kLqPAlzIGVK+wnlujD
	 piq43MO4MB78oFqxAIrZX1RPrL3WjTKqWgjjCIKy+mn0bH9VRPqZZ5WpJrrtc/U6Cj
	 +Orh1qgCTzOC+dUGHcHZgap+yuxkC+7T3uobEIH15QotYnlrR8rWbv9gH2ZZsqUhXi
	 nzF9TIoAKu+LJNbaStuoTCTgF5h9l0PTCTKezM3C7vnaqgap7lw5srA8xd0jUk0kVV
	 ut39jKQXvLq9mTJtu8r92qiw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C129240E0184;
	Wed, 10 Jun 2026 17:27:25 +0000 (UTC)
Date: Wed, 10 Jun 2026 10:27:22 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Tony Luck <tony.luck@intel.com>, Michal Simek <michal.simek@amd.com>,
	linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/synopsys: Fix cleanup on injection sysfs failure
Message-ID: <20260610172722.GAaimeeuKj2aAgUJ9Y@fat_crate.local>
References: <20260605125417.2348115-1-dbgh9129@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605125417.2348115-1-dbgh9129@gmail.com>

On Fri, Jun 05, 2026 at 08:54:17AM -0400, Yuho Choi wrote:
> edac_create_sysfs_attributes() creates inject_data_error before
> inject_data_poison. If the second file creation fails, the first file is
> left behind.
> 
> The same failure path runs after edac_mc_add_mc() has registered the
> memory controller with the EDAC core. Jumping directly to edac_mc_free()
> skips edac_mc_del_mc() and leaves the registered controller state
> unwound incorrectly.
> 
> Remove inject_data_error when inject_data_poison creation fails, and
> route the probe failure through edac_mc_del_mc() before freeing mci.
> 
> Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
> Changes in v2:
> - Remove the CONFIG_EDAC_DEBUG-guarded del_mc label.
> - Call edac_mc_del_mc() inline before jumping to free_edac_mc when
>   edac_create_sysfs_attributes() fails.
> 
>  drivers/edac/synopsys_edac.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

https://sashiko.dev/#/patchset/20260605125417.2348115-1-dbgh9129%40gmail.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
