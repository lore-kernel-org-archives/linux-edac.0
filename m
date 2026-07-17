Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ECA34EF0E;
	Fri, 17 Jul 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784280516; cv=none; b=suJFotj8IW7OQZKm+mPBmXoSgDOEXHlYyFijRDtEiaZ9dF3oqeuKzwn7cR9LeqfssDkPOxnWNQ4nIUxirHa5JY55VIr0/4noWvfqA9V5e4D0ZVWYP0DUO/z26W+09m6GcxaCM/XRYfwSfmk786WGawobu4LvosF4vU7Yp9IhlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784280516; c=relaxed/simple;
	bh=IHBspCysPUtYqi+2bDoQnkpznWIEcJl19F13ZI+IV2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdfYo7hY47oozn06FofCbe6FAgWdf5r1vhMbTTT+BYa2NIP9ON9HKBPAaZ5Gcu88TNbT7R2qDP+UUSoUR6tGxXYP+iccbuIplV1az1TND9hNiTQsPh9gcPtBwJpciuwD7/k9kwd1qWwKXIhFA+k6XsSj+gY+YmXA32jeGOfNG0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2S1sY8V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2S1sY8V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4DA1F000E9;
	Fri, 17 Jul 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784280515;
	bh=ldWV/mrvHHD/4IUtkfXlrXsurM9A6sjW5APSd3rFF4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G2S1sY8VlV54rf/Lb6Eqj0IR7B9oa8hctiq9fxAgqwiv1XI21t7l0WQe+4AOfmCCV
	 DK66qHWVe04cjmIAf7K6EHhrh8HtxYBY9BQPhNZ92p+lUNbh6/acB6sHiOo2zSHkJu
	 Z+2swnALEwGPCJPSuzfnmgwMOpPB180d5xTLsTlCJW8nniIY8RUZgcvrOaLMZckWZV
	 bg4VJRr6NHuyzFd8ZTKzSp3dumiKbEt0LBfVdK0JNVQSAij5WbEfuQnJT7767o0/Fw
	 Q2VEz+ng4OqTRiYxIvmAJtaELofSGJXoAVeoAgScfsMCGQDZjeD5znDyvwbqzI3S1j
	 NpyO0VT8ayLow==
Date: Fri, 17 Jul 2026 11:28:29 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] x86/mce: Fix build warning after MSR-interface switch
Message-ID: <aln1vdH7dPKmh0kl@gmail.com>
References: <20260629060526.3638272-9-jgross@suse.com>
 <20260703105555.1758819-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703105555.1758819-1-jgross@suse.com>


* Juergen Gross <jgross@suse.com> wrote:

> The recent switch to 64-bit MSR interfaces introduced a build warning.
> 
> Fix it.
> 
> Fixes: cff219368bd0 ("x86/mce: Stop using 32-bit MSR interfaces")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607031726.ZOwu4snu-lkp@intel.com/
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Said patch is in tip only right now, so this patch could either be added
> on top or be folded into the original patch.
> ---
>  arch/x86/kernel/cpu/mce/p5.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/p5.c b/arch/x86/kernel/cpu/mce/p5.c
> index eb99f384d747..3c2b6cc918b1 100644
> --- a/arch/x86/kernel/cpu/mce/p5.c
> +++ b/arch/x86/kernel/cpu/mce/p5.c
> @@ -44,7 +44,7 @@ noinstr void pentium_machine_check(struct pt_regs *regs)
>  /* Set up machine check reporting for processors with Intel style MCE: */
>  void intel_p5_mcheck_init(struct cpuinfo_x86 *c)
>  {
> -	u64 q;
> +	u64 __maybe_unused q;

Could we just fix the API to always assign 'q', instead of this
ugly & vague annotation?

Thanks,

	Ingo
