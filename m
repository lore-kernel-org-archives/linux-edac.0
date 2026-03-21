Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E1817A586;
	Sat, 21 Mar 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774097221; cv=none; b=iKu+nBhmspCT/2VMAPDgFSQIwHs/eyzwTZ2SGJB615lyOeP+upBcLoPpi09lT6lrwWQXwdCbzoI+hVV3/nlZYA+e/2LoCtEP1h4Nq+jyAkRn7zCmdFCEIoF/8doMspDwGm7VxsFH2womeGYuvcDHYhzvSZzaP/onXDEXS5sgi94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774097221; c=relaxed/simple;
	bh=/iUjSooCVukT5lsMueWxHUgDUQJiDhFL6P5bzj1D97U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO9bLlzypZTbCiZgj8HzjFklY5gBkl9BhRVerX5eVD5/u2m4AgCQvnAIwP+5Pd6H7nr/dptFkeybimuP+owciO+2bvmDKnYYrhqP34+st4R0fVvp4XJazRAnwlD/UGCO7+bBWXY/el7pQDwWNYOOYxiR6dQMNi6Dp1HvKyJpACY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eOYhQyZc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eOYhQyZc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8F05C40E0174;
	Sat, 21 Mar 2026 12:46:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kHlPGqasxhFz; Sat, 21 Mar 2026 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774097213; bh=TN885gOhV5Y6UkysCxrjK0mJBqG7q0CGTtlzsQrbWmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eOYhQyZcaGGFKUirad8YisrOzqgDMuYLMEPyi8fA/KPdPx6+IfjGN/+Yn71CivC0g
	 OlyN2SFU0M3JtVomt7TADRn/ERsidWkPLBtMRb/PSkgilBYj1UdEbiH//TpzntpmhH
	 LC5+TaRu6Vv5sLFaci+YNaM6quViVYYMLdT5VLVM7F5EXh+Ho0OWdMiZG+reya+Ea7
	 mdUCeQkKoORZcn+6WyYsHtP3c+Xq3rnYmz+360kpdPdGv3G7jHTrZFW+0PnXxWO1bG
	 RpeKav00BSjfOwVDN9AI9KL9fEF02/nFFlaRxuykocNq/Kx1r4W2+xRHqBg2iX2PMy
	 qCJmFFvut1oxz4qLm/a8rjdoSONW2CaafrxkF1buFPrtG6EQSee7HDDSpxBFaHJ6Hp
	 aLbACDddfIaeNbLJfgZZtPw6FeNkc8nB03O7dZrP7blMigOY08usMvkVzc7NHsn185
	 f90MQ3fW9uvedxj5rn6tUdqkeAwA7Eljuu0xNiZrYsD3xYOI7yxNHYrGiwEqqBK/r8
	 VLIkDqx7heDfe5VzIdB6SFvzLszd5xK898G3wIGp2bhcGWnsodwpYSCE8kf64ulNXh
	 XPmtmwM/qcDSvYemINTaiTB7KUXrvrtTTdHY33HgXzfI/BNQ41AaRiKEtZt9LQu4kL
	 bjOHYmM0+EGDVvU4LJU98rL4=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3AB6740E0281;
	Sat, 21 Mar 2026 12:46:40 +0000 (UTC)
Date: Sat, 21 Mar 2026 13:46:33 +0100
From: Borislav Petkov <bp@alien8.de>
To: Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: Re: [PATCH] x86/mce: update outdated comment for refactored
 ex_has_fault_handler()
Message-ID: <20260321124633.GDab6TKZVYfziftAmq@fat_crate.local>
References: <20260321110024.8723-1-kexinsun@smail.nju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260321110024.8723-1-kexinsun@smail.nju.edu.cn>

On Sat, Mar 21, 2026 at 07:00:24PM +0800, Kexin Sun wrote:
> The function ex_has_fault_handler() was refactored into
> ex_get_fault_handler_type() by commit a05d54c41ecf ("x86/mce:
> Provide method to find out the type of an exception handler"),
> and then into ex_get_fixup_type() by commit 46d28947d987
> ("x86/extable: Rework the exception table mechanics").
> 
> The comment in do_machine_check() still referenced the old
> function and _ASM_EXTABLE_FAULT().  Update the comment to
> describe the current MCE-safe exception table mechanism
> (EX_TYPE_FAULT_MCE_SAFE / EX_TYPE_DEFAULT_MCE_SAFE) and
> the severity grading code that sets MCE_IN_KERNEL_RECOV.
> 
> Assisted-by: unnamed:deepseek-v3.2 coccinelle

You got assisted by an unnamed LLM agent to fix up a bunch of comments in the
kernel source?

> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
> ---
>  arch/x86/kernel/cpu/mce/core.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 8dd424ac5de8..fa9ab282cede 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -1713,12 +1713,12 @@ noinstr void do_machine_check(struct pt_regs *regs)
>  	} else {
>  		/*
>  		 * Handle an MCE which has happened in kernel space but from
> -		 * which the kernel can recover: ex_has_fault_handler() has
> -		 * already verified that the rIP at which the error happened is
> -		 * a rIP from which the kernel can recover (by jumping to
> -		 * recovery code specified in _ASM_EXTABLE_FAULT()) and the
> -		 * corresponding exception handler which would do that is the
> -		 * proper one.
> +		 * which the kernel can recover: the severity grading code
> +		 * has already verified that the rIP at which the error
> +		 * happened is covered by an MCE-safe exception table entry
> +		 * (EX_TYPE_FAULT_MCE_SAFE or EX_TYPE_DEFAULT_MCE_SAFE),
> +		 * from which the kernel can recover by jumping to the
> +		 * associated fixup code.

And when we change it again, there'll be more patches fixing up the comments?

I'd prefer if this comment is rewritten in a way that doesn't have to get
updated each time the code changes.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
