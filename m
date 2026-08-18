Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92D017993;
	Tue, 18 Aug 2026 00:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787012347; cv=none; b=Y+Nd94ro0P7Wq0RZFBZd4fz5UKrRpIXZSaYPXl7MtNMMpkbjLDbfRyymm6fTWeB2DC5HRBdYO4XnmFyP84V3MuziNmAjF5Imwx3N2uYsAEQUVNlU7s7UEFQlUozerRjgEifQJaM5rlbTrRw7iPM7GmPWW1R5HpQDO13oL9pAJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787012347; c=relaxed/simple;
	bh=3HrY+PjKJXHch8TNAiOLm1hnUsmAoT7fd/5wjhHjyMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TauqwjMrhCVImedY5wPCwLXV5Gd6IgrQbc8bWysm++0pl5qJ+jj1Q8xJp0K6Knq3g+aSnZJiEBl22j3bGxd6UdL7vZvTSWA8Y9e4n5ERaqHxEE5bYr7NA+TbQbrPNAfLHu56g4fOWPB8awvYvks5QBoQWLj+iOltEZwFWzeS2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CyutX08k; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CyutX08k"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AA42040E016C;
	Tue, 18 Aug 2026 00:19:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4a451MmkpaaR; Tue, 18 Aug 2026 00:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787012331; bh=CtzhV0KBmyJGG82DJ7evX9I+2sytGXJUW5KonFC6SaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyutX08k4itOc5bHlLT0cSS3V9fbChOJBhBTSR/nic/qGo0qTv9s4LEMsH6Jf2XWo
	 LH7af9aDtuFzZIi+xvNp1A8tpjUlihlyGislq/m77SpeiQo/JAIv+nD+NCql8MVjoI
	 ULM040okxFM6o2CPidOoOr8Ch9T+JDHnv732vCMYoLUziux3QQcre+lUYlY3XeXk8Z
	 M03Ua073tJG9TDAvFwEqzytI2JjxErgqohPdH0xylQ3Zkc/safXATS5gmadrepY+Hp
	 jUtHv38UPiFrAEHgkgx7oBvXBIv+jRy4tTZ+lzAHhhdp2uN+J9V6DlWtUeh5rNXGtr
	 nON3HwcXws/T52YCBTMQP0EezGdwWdFHep+DDdlIpnFrFeb17XffM/JXToSW26EBhT
	 m8OK+qJiVSqIIdrEo8dzehBkIWavq1bvp8IWkKBoE6ufhgjSfnrDOZHMyJt1RQT1x+
	 wbcGEhzfvDeY/esr+tCum9w3UTZubdUU1qhtRuGMRPbvs7ye4LFtJy8xruzdmQLaO1
	 uKqPLDjnKHJK54H0fYCndvxa/Hy3TbPt+BodR5X97V4/A9oPCallryU14OKw8698FW
	 XeQ71xmgvT5zaP15FV0nei7d/qICPz5DaNk8JIFQSGdlcbHnaxH3jmFevLVJ1Uh/+u
	 e3R8TL0UYI2Hc9EjaWBVK144=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 21B8940E014C;
	Tue, 18 Aug 2026 00:18:44 +0000 (UTC)
Date: Mon, 17 Aug 2026 17:18:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in timers_dead_cpu
Message-ID: <20260818001840.GBaoOk4Mz_mmZYK2rK@fat_crate.local>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
 <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>

On Mon, Aug 17, 2026 at 04:55:53PM -0700, Borislav Petkov wrote:
> On Mon, Aug 17, 2026 at 11:14:35PM +0200, Thomas Gleixner wrote:
> >  timers_dead_cpu()
> >    migrate timer to CPU0
> >    
> >    // Migrates the MCE timer of CPU1, which is a bug in itself
> 
> Stupid question: can we prevent this?
> 
> As in, this timer is not migratable, do not migrate it.
> 
> But then what do you do with a timer which is not migratable and its CPU goes
> offline?
> 
> Perhaps cancel it...
> 
> It won't matter in the MCE case, that's for sure.
> 
> Anyway, just some musings from reading this...

Hmm, the down path does timer_delete_sync() so I guess I'm missing an aspect
here about the timer migration.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
