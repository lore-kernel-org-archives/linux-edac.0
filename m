Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07F282F30;
	Mon, 17 Aug 2026 23:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787010987; cv=none; b=RlNip85QbYR0VI9+jD6m53Gn1lo5kVE3ddq8pWzNeF+2BcsUvOlCZMHNai/bioqwZEbiWWJiOyBMNziRCtofdaM94utjdXMPiTKSpFB+L+wk1Q28AAkD6A+l3Qyf9fztdD1x86rSj0QoODMibfjzYJtNZMjP1UJKnvjwGCkgM8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787010987; c=relaxed/simple;
	bh=dN1Og6Adj8ZcMCTgxhMwMyGlz2f03aFFEk9+tz0aXg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmI7/znCICPPiFLim89Cy4dd6RwQyQT9fxYHZrUYP4nUylFAnEDMtU6jWpyyVMawoOnpcPjUGp49QD20ThZlMVaOfRBXEbVMM0+ubzwBte/cpRyRWB+cE09agaDaScBqMRfeG8FX/6/X/DJWB7M9ExCmbBRQD4CtbAXxWm19Pjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=k/izSB+I; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="k/izSB+I"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DE42740E016C;
	Mon, 17 Aug 2026 23:56:14 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1_-ulCVJ_7u0; Mon, 17 Aug 2026 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787010964; bh=PopSNSZCcBemZintnm6kzev59nEEyKVxQ1+d6w22Eqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/izSB+IqifpuCxPktQ6wL1SfjV2en3fZxGlcWQ73VfOWfz3IBLDw9lQ+2H8drXq7
	 GXxZPKqE6WGWq/af65yaWNHjOCgvduS2aCWiB3QIHqX2HZyoExMHQeE7SdEPmiCtrQ
	 gZxas8u8WFqltLdcy4wZnEFetJL1BozaABRuaXm5vtvh9ftWd7cjYBefqlUsWfyEl9
	 Cn8kO3U5P8sjp62tud+YVpPf09/ok8cvX5Z34eumhHeLiF1kN9jvulBrwuVwLBBje+
	 sc/F5iWHnvY3LwheZWhPgxhTqk3DdVQXlbFQ79cYLBZ6zlZs6E4DavgpoAuKB5nU0p
	 G1imK8nRybS0p2qvQdYzS4qsuriJOTmrJY/jyRaoFDq71uhCwEUAwamKl/ka59e5md
	 AD07WpArS3b94RCoiAnVC+DJaV7AKGWON3g7ZjDWkYTpziOl+zsY8mlj2fcUNA7Umc
	 Jgzkh2JfRBImChRwvCs3oxh3Ssn6vlvWbZthGNNLxgjS9BLPtzlqLI0xqfw9Y0vGYe
	 gCaYYLZAKYMIkhuHqvDscKXeljUJKCpuMJMZNUN4Dw/5Wf/lcRwjCv81GyNiIwmeoO
	 HF4YOH0c+cLHTlJyK1INTWxk/f59t4hy/O34eYfBpxGndlyugoKx1/uaaVuC/YIAL6
	 A9NTmEvtqnH/+j1xv8Qe5/A8=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2F32340E01CC;
	Mon, 17 Aug 2026 23:55:57 +0000 (UTC)
Date: Mon, 17 Aug 2026 16:55:53 -0700
From: Borislav Petkov <bp@alien8.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: syzbot <syzbot+74de56995244fe32ffe2@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, peterz@infradead.org,
	syzkaller-bugs@googlegroups.com, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Subject: Re: [syzbot] [kernel?] general protection fault in timers_dead_cpu
Message-ID: <20260817235553.GAaoOfieqJBZTsAn3N@fat_crate.local>
References: <6a7ec39f.5b0d2c79.2ef4ef.0002.GAE@google.com>
 <87ik58la9w.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ik58la9w.ffs@fw13>

On Mon, Aug 17, 2026 at 11:14:35PM +0200, Thomas Gleixner wrote:
>  timers_dead_cpu()
>    migrate timer to CPU0
>    
>    // Migrates the MCE timer of CPU1, which is a bug in itself

Stupid question: can we prevent this?

As in, this timer is not migratable, do not migrate it.

But then what do you do with a timer which is not migratable and its CPU goes
offline?

Perhaps cancel it...

It won't matter in the MCE case, that's for sure.

Anyway, just some musings from reading this...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
