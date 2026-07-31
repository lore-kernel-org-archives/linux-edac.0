Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E1C369207;
	Fri, 31 Jul 2026 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522258; cv=none; b=XSWwmq0j5tjgkUhoxWXC8ZhGpdBwBX2qoYUBokrZljcQASpwRWNbl+7wYynj+LigmImxRXvT0RP46ec/pidhiOAqCJ0/csWsjaV61oCq2isUS+mAGF8WULQPGX0xAk//ZopOYnaDD7Fv2l8MjY8uOsJ5QU69ZXI30RTOySHwVPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522258; c=relaxed/simple;
	bh=vKK7RcqYvs/YKCqmGun1rKRLwNACa56gte9ScHu92RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj5gijcaply4pohtQKRsUCulZeucVWGfO3KTuWstFkz8dgwL4oNu5W4w4yZhuYFD9D+2thcJQVwxGtVf7FpEwcQNdSs+WonufszXRSWW5ZwcXxBjzvmg1jrUka9Sb6WA9l+SQ43RvWjcGMRwSnu3rkDQHSKxct1UQeHosjxtP4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=TNeVNeln; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="TNeVNeln"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D060640E02D8;
	Fri, 31 Jul 2026 18:24:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0ExZcF4oZvWY; Fri, 31 Jul 2026 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785522244; bh=cTufGRYHlRCIpr3Fqe33PobWyViopM08j/qNBJwC1rQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNeVNelnYjBrCHaMgEKJtZj3SKrwr158nghs+JkFaoVcrMD+XSqiRCnHgo4Lx200e
	 HRHZv69avKFPLEZ7hrt1hx7Fw0Kdy9aDNkKkkIDVDImJ0n6LxlRqc/hMftdqTJCI1x
	 2Aa8aT3kJx6K73peQTLmEZ9vm9uoMyISR1qhJSDG0XDacf8hIs8b+635HAHdrGJyNR
	 8XlJDQik4LrShWYK9inQIaJbRJbdieXpxntG83V0rEVRNiiMcd9TzZ27pFMZMw/qpe
	 76Dw2DdDOgoR7Dbb6Jb2JskeZxzmorYWEfh4N12Q2W01ENJlKb7tWBF6vk4jqwW8Mw
	 JdeVEX5mcf5BFdF8nUV36w6456tsH7ggYHmC9nTmhqVP5XE2b/LTxHamb/9uzEOXC3
	 IN4sXnS60ZLbwy1bnPMxDIRtDaTPoTy3d/Bb0BFBAjG8wcbWDI81iP7JJ/sYeyhTj/
	 olw01p2AfvbCgONHyfqwXxWrYwINmnOx9APuVIV5yYQve7FyaZsHFhVKW9sVTfLyHK
	 StR3skoAMTRpXLliuwmGPd+fU9qWmOpdDwY+MHvf69J7jO4cYNvyAU+mgvJs25YbOD
	 dc1mofxlMRWbA624+KZXhAs3K30rF/Y724mERaBvQcKJ38okrpY3Fiz61nY4rFVk7x
	 bIVwwzWMCmFyY9ZZr4GCFp/c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6F37D40E00B8;
	Fri, 31 Jul 2026 18:23:53 +0000 (UTC)
Date: Fri, 31 Jul 2026 11:23:50 -0700
From: Borislav Petkov <bp@alien8.de>
To: syzbot <syzbot+9d17de59c48d71bd6824@syzkaller.appspotmail.com>
Cc: dave.hansen@linux.intel.com, hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	syzkaller-bugs@googlegroups.com, tglx@kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [syzbot] [edac?] WARNING in mce_timer_fn
Message-ID: <20260731182350.GBamzoNvMDPVloghNW@fat_crate.local>
References: <6a6cd87b.2d659fcc.1d46f5.019c.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6a6cd87b.2d659fcc.1d46f5.019c.GAE@google.com>

On Fri, Jul 31, 2026 at 10:16:43AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714

$ git checkout cc2b5f627e8c
error: pathspec 'cc2b5f627e8c' did not match any file(s) known to git

Looks like a report from 2 weeks ago.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
