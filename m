Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E521B67E;
	Tue, 18 Aug 2026 00:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787012487; cv=none; b=AfYyWCM7HhLTLhdLknv0Ktxa0jdoKmH8aOh5s6Jc9IhN8Q/LRKYRwXzw7bsLvFLHb2UHU2SgO+sNo2jq7NH90LGi2U1Qmr+koLlV/SXFmg/1woDMos0n551ZwPhhLMHmk9R9vcOpz2leIXeFR1ofwlpkfP6J7GVSZqhc+XciMPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787012487; c=relaxed/simple;
	bh=feo0Gt5tygQkGlxcxg97JEolChzti89stcvzgv+Svyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZ8O+3xCxobWFzMJF8IPLbNI4XBSJChS1RGDJl/6Ajk+BzpZdZh0Ubf3MA3Tr030xRNUQ4cozUH6Yc7nDKSS11GJF6D6a9xgiwiQ+Q2DJ4L0hiEQhMgnAxuuAAFBhKuoS7tzQ4yKyYEG9z3lz2R/mld7EhsPXtcq4t5HLbHsRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gX6KJmTn; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gX6KJmTn"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 07EF840E01CC;
	Tue, 18 Aug 2026 00:21:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id K_sui3iNTcE8; Tue, 18 Aug 2026 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787012474; bh=nRnqMdg/LaJs7mgUcYS3flSD/4VocuvdxTaR7wrnQhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gX6KJmTnzqvmEv+G7cgVtDZMO95yd3BMCW5ZEFpflJaAhCnD1/di8y2qTQasyc+m5
	 RziD4X5Q1agY42x+O7XZl11s7cvaMCiG7tHXwpAWpslBxxOKLmnACpWg8zbfNIouDQ
	 UQFN7Rc7vn0sLr358JdPmuzp2EGrFhY6kkxeTTKDiere00J2xoYkSTgyE+DfhWwbvs
	 +2sciErRrb+C0EPMru2xlPLGW5RAN/eSKbwSDP3RuXJXEQl1mWEOmsdO4+vfGKlKgI
	 a1wV9W5G9vDgjs/hh1gmfN44o43mDpplM1AMZtd2N8RfYQIQ5gnkR6nfpbVrTNV5zw
	 vqIi/AWs0RY/eekLv2D8dvb4PqIzbFcAAs8uhodilcI+pt25Ao/zwCkIrK/HQ+dAYn
	 8NvYgAWBLt0zPclMzivC/eC+ps7YzY3SVw/y7rOhXISzsRhPNOz5UUdLt7oaiKj3Z9
	 pu5bIqLGgeXpgQg+GUZ/s4tdC6U8xs9rdNfJaaoNwLt8aiBX5ggp9BtgF4flbFdb2q
	 CQMIUZXpdNkwLpMfNqsenV4+E6jtEeIdLa2tluQ9mN1iVcXyoenoldgVPY7rQjtYp3
	 xbijMRMmEmCIIiM2K0+1rKn/W7y8rlatBhTU3wbaag1VuF502+VIGxk46rQ6hNazSE
	 8BKRRHHMi2wAfHieZRaeXqXo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8F71B40E014C;
	Tue, 18 Aug 2026 00:21:06 +0000 (UTC)
Date: Mon, 17 Aug 2026 17:21:03 -0700
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in timers_dead_cpu
Message-ID: <20260818002103.GCaoOlb67Vt2jYVaA7@fat_crate.local>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
 <87fr0cl7ky.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fr0cl7ky.ffs@fw13>

On Tue, Aug 18, 2026 at 12:12:45AM +0200, Thomas Gleixner wrote:
> On Mon, Aug 17 2026 at 23:14, Thomas Gleixner wrote:
> > The below quick hack, which I'm not proud of, cures it. I let the MCE
> > wizards think about the underlying design problem and let them come up
> > with a hopefully nicer solution.
> 
> After talking to Borislav briefly, I came up with less ugly one.

Yap, LGTM.

Lemme try to unify the whole MCE percpu gunk as we spoke.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
