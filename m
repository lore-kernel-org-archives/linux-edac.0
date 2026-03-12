Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9AD37B03B;
	Thu, 12 Mar 2026 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331523; cv=none; b=ccK51xJQdnVC3N2zPtvlh8BhFlNEc+8pvE8o/bQDEZRqmQg+uOuqFLVuYWaiGQ9cNGqnaBDIscBOGhqHKTSf0GcQ1VkqgarvmuM4phEWDaIasCckKlXI2/vJTsRCMGpnHK5rbt8T/G1XHxyv7mn6asY5IdApuh7GiMuszOd/b5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331523; c=relaxed/simple;
	bh=lh5P9rA8i1/clodOl+WOUxCI9Wv4O6akYM9WVyRM238=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQwaVlhJfirv7dB9lpuW7tIkDsHMJ2pNIfzFsuel/DZAPUQEkNDttMeF3Tz29Olwccbpu7EXXOPtR/QnOGv2z/qCmQIIEGQeARaaZl+m8L8GLDZDG4aDh/TzrVi/g/PC3BlyeYg7uRYAgu31mdgG7W8GRHXrmFdwFl5AEpD+xXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ExrR0Yhg; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ExrR0Yhg"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A8E4340E01DD;
	Thu, 12 Mar 2026 16:05:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GPljehWvhZi2; Thu, 12 Mar 2026 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773331511; bh=HcoGv4LX8LsDUouhUS7IolIhlBCOMAK4Qxfm+hAhYtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExrR0Yhg6zzyJF2z6eSt1BnJ2Y6ePL7xLb8u4A4qeDZwtxBHE2p2S8STIROSWhDTo
	 dlC4HgK3fWkEPkv3p7AWmgMca1haDP9fMX2Eqc6xjrrct2CQi61EJJ0ALDhn2AyOTL
	 rpze5JV99ySxSC8YKPRNvv7xuKonm5xmkcXeA+UUOQrC/fIrX6v6BxHI79Ix6PAa+0
	 fkxooykxFc+KJ5sptXtNgui0Ni5x8i3P9FXw25BNEeADk8Z9x0u08sqGEXEh7JZHNa
	 Umkv/UfBTzT9VmzYnYgr16qmo/TcPVkGYU0xx6FCXhuh+990ihS0P1pEOFySTqEI6s
	 5IsZyJOfsYtuFyRojM48eBKUDnUKu2UNgT/uL/wJJv5cbq1o9/89RQF3w6KAMqXKcg
	 ETe5CGJTgqaz/1FgAVuOEgJ0aY6CRPUZmCVT55+8A20AF85jKX3fznIS3Xuj4remws
	 D3TXhrEJLPgu0fYn0RdW16H0ES/VyHYfSfFXAcoVV7JIPd0Nli3GOTxZcVfaka1HqU
	 ZiyVmcl2oXb2My2Sbb8MblPAyPM+BhR04LlCUS0W2PRKWqgVCJYIYn13JDTJp6JxQY
	 ys8ok1fF6FreXGndgM0wYWMHViNxJq4CMCCLfpvZJu/hKd/AYwMJytnwSLmeczxDhu
	 d/RjVXJ0AMZHl/5QkCf/oNDg=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3C46B40E01AC;
	Thu, 12 Mar 2026 16:04:59 +0000 (UTC)
Date: Thu, 12 Mar 2026 17:04:53 +0100
From: Borislav Petkov <bp@alien8.de>
To: William Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
Message-ID: <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>

On Thu, Mar 12, 2026 at 04:11:10PM +0100, William Roche wrote:
> From the kernel point of view (regardless if it is running on bare metal or
> in a VM), access to these registers registers is provided by the platform:
> either the Hardware or the emulation framework.

Except the emulation doesn't emulate the platform properly. We test on real
hw. If your hypervisor doesn't do that properly then that's not really
upstream kernel's problem.

> Errors are injected into VMs by the hypervisor when real memory hardware
> errors occur on the system that impact the VM address space.

And?

Why?

What's the recovery action scenario for having errors injected into guests?
Where is that documented? Why does the upstream kernel need to care?

Basically I'm asking you for the use case in order to determine whether that
use case is valid for the *upstream* kernel to support.

> This is not only a test, this is real life mechanism. With the fix
> 7cb735d7c0cb that has been integrated, VMs kernel running on AMD now crashes
> on Deferred errors, where it used to be able to deal with them before this
> commit.

Because we don't know of your use case. So when we do upstream development how
can we test your case?

Before that, is that case even worth testing?

I hope I'm making sense here. The MCA and other low-level hw code works on
baremetal as that's its main target. If it is supposed to work in VMs, then
there better be a proper use case which we are willing to support and we can
*actually* *test*.

If not, you can keep this "fix" in your guest kernels and everyone's happy.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
