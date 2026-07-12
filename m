Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DF11C68F
	for <linux-edac@vger.kernel.org>; Sun, 12 Jul 2026 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783823940; cv=none; b=ufIBujVdzIAjhB7HeKdxkkUn8nUUi3im9TTew1hCpZmWTbUYbND3QzSqWOiI+CFIdlYu8LWp0zj0UZ0Sk/OC28u5oTYJHLSnbG8Eyon1VbIJrQT+pSTc57b6YF0bUiPkFEGmrMQAhaZ5sPP3fo1tZAjV34UgLwX0wQ+SDiU92+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783823940; c=relaxed/simple;
	bh=Fl8V3sUrXOHeB7pM28Y7qyT1WVjgm8vAThA1kmh+ito=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcMR+oExThnRjjofkHRfTB6xeAZ0xJe7eiMTl1Om7FDXKX7FeNh4EeiL6I0ySuyq52NTj3Ro8zWE24R8nVVsClyWOTRIvP9HUDlAMR3aIRzPlymzco7/QzczrZaef85oUjQ4CmMiwkGcW3BzB3xWmqRJ1BNTLvxAHFU168okBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LaOyCvhl; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LaOyCvhl"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BCA1640E00C0;
	Sun, 12 Jul 2026 02:38:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id daq_BGUEDH29; Sun, 12 Jul 2026 02:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783823925; bh=O5MmcUte0SpWQV6FAfri+A9a0Osaf0V6B7LcRbZSUlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LaOyCvhltw4EUzEcw8S/kT+iN39elUHSECf/J5yqYEgoT59+AQDQVm2afkI1MoH6l
	 refvUOuNru3fcHU6987kanVFHvf3XsiKfyLIlKVpX9AlTd2lcgf3UHztGr8YHIBLcH
	 4eunQuGJeRsoASoq/mNpVUhM9vHTFTA1lfoMrB1alN+kFctN0y6w7fc/RjA4IWAUc9
	 0HjvdwzhNBtERB7DfF/m4J5UymCFQmOtL3lruOOT62TUOqMqO3LA/eTV6x9rnJEnX9
	 AvTswUiS7HBMKNtt1pd6znqdhrKf8+KG0Z8KZ4hYPKYiVy20B/gs29nVC28qZvT8cu
	 iMN9uEz886S7SxUbP2p1UE2RirxDuSCRhPNvF7t74P1h+6gB/2tViq/WPQJH2Y3FVj
	 genVFadTxj7kuOUM1K5OyPkP92Z6G3lUSib01Q+W3VSGP8il9KMzGNSh3fGrX8W9Dd
	 WKpmtIuBMBGVQKngu7nLG0RKM94SAfgai9yQdnqbjhw+E2WMlTugP6qKDF3VPtjX7M
	 Mtk/LkY/2YtI0bTpBeG2BqIe7I5yClhAI7aUHsupyA9X+WzkTIe4rupAUNxacPhUq/
	 3vnfYrud6zl+pjJ2JtIFMio920kUyqxuXnJ6+lzViwwBR2H4XbFnuI1jkVesrG/w7M
	 LO/VNyuI5G9pb1fLr5JW6t+M=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 269A440E029F;
	Sun, 12 Jul 2026 02:38:43 +0000 (UTC)
Date: Sat, 11 Jul 2026 19:38:39 -0700
From: Borislav Petkov <bp@alien8.de>
To: Hugo Whitaker <hugo4zelda@gmail.com>
Cc: linux-edac@vger.kernel.org
Subject: Re: Fwd: HTML message rejected: MCE Errors and Crash/Reboot on Fresh
 Fedora Linux 44
Message-ID: <20260712023839.GDalL-L5pDdUxSKcsd@fat_crate.local>
References: <1783821137-14654-mlmmj-7f2b267c@vger.kernel.org>
 <CAMVs2dRX5z-zOrrSCuhcP8=CNJO_8Xe8tf8yqA+aTRopn6RcCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMVs2dRX5z-zOrrSCuhcP8=CNJO_8Xe8tf8yqA+aTRopn6RcCg@mail.gmail.com>

On Sat, Jul 11, 2026 at 07:55:36PM -0600, Hugo Whitaker wrote:
> hugowhitaker@fedora-mbv:~$ sudo journalctl -b 0 -p 3 | grep "CPU:1. (19:44:1)"
> [sudo] password for hugowhitaker:
> Jul 11 11:38:20 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
> MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
> 0xdc20400001010135
> Jul 11 12:09:05 fedora-mbv kernel: [Hardware Error]: CPU:11 (19:44:1)
> MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
> 0xdc20400001010135
> Jul 11 12:09:05 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
> MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
> 0xdc20400001010135
> Jul 11 12:11:37 fedora-mbv kernel: [Hardware Error]: CPU:11 (19:44:1)
> MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
> Jul 11 12:11:37 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
> MC0_STATUS[Over|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]:
> 0xdc20400001010135
> Jul 11 12:12:54 fedora-mbv kernel: [Hardware Error]: CPU:10 (19:44:1)
> MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135

This tells me that your RAM is generating correctable ECC errors. I.e., it
might be going bad.

You don't see them on Windoze because it probably doesn't report them there
- it doesn't mean that they don't happen. But I have no clue what Windood
  does.

You can check whether you have 

[    1.419829] RAS: Correctable Errors collector initialized.

in your dmesg - that thing collects ECCs and does not report them until they
become fatal. When they do, the machine will freeze and I don't think the OS
matters in this case.

You could send a full dmesg from the latest upstream kernel and I could take
a look but it needs to be the upstream kernel - for Fedora kernels you need to
go talk to them.

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
