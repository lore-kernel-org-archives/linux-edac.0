Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756C2010EE
	for <linux-edac@vger.kernel.org>; Sun, 12 Jul 2026 03:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826261; cv=none; b=LHirClPujuAUuP6HWhCSTWZUqzpjStFx7NYegKNkiUnbsHpkIzICngJQKcZ+/sQ5Gs4JMPCMAimNHbU4WWnXHYZufv+SbqdrvwxerokpTLn1xJlf0ZT8kGmYynN+NCwGxsBOyKuNAiMarVvdIV2P60ESzhkywQLTPelqyFG19qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826261; c=relaxed/simple;
	bh=KCLf3OHDmMnoJ/DroQtkxpWDBx1/pAjdkOhEcvHsqC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueYE4QodmIMlu3jvPIYT6RVR7CrPkbIpUCiVHvtzs1Oc4HJOw1IXrVDk7GR4x2cAl7uaarYiI6wbLzk4FQ2OyGoDXjiRq8S1rMB4mamK88FzkU+787bDYvsmY3LHxxL8WdkNz0wGIj6WE5hUcfih9kgEs0NULZgf4Y6bRxvwMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EmYemnYk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EmYemnYk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A6DA540E00C0;
	Sun, 12 Jul 2026 03:17:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IZ_J0mMLrSzi; Sun, 12 Jul 2026 03:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783826247; bh=m4TCtJEQYGAHhp1xyoWhx5ejBzfI2kj+5n1LbkX3/IY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmYemnYkwSW4J7zHqWBXS0Zl5h0M94JMmWoaSfdUjnrxBU5VhZI0Gc4k5sN/lDLLG
	 82khOaeSh0tcGLWsrPluz3CrWo7mU7irJxFYB1N8FWGlhMvkZrsquoaZpkNwmAJV5a
	 HrvIG4tuIc0cf8QhFF71j/Vpig1OmHr6u0Te5PGXUG3dxE1wWJh21svP+cTxBVRl2h
	 Zpr5FklHKMGYBw7g5VAPRujrY5rTWaaxgb3lSGqGFDUVGIDbhKU85Mxwi6dHFMgY4L
	 faw6IkW76PmoFD2gnnhqHUHYPGgNqkDZT5wGYA2GBBUN6t1b7Ao03mFoqxKWbk6/0K
	 kkzB2ecoE5xBz1aGve1iGNYSG/k2Abu6CzDYxqFjd4faIlEGFN/6K2y1DpQYRVPAcs
	 BZY8JlxlfiXDVl6139ft2LfTikWaeuMrTSLCtctzm8u6dyVX3pAVVBQZolF6Eq3t4T
	 OZ9+gZtsxxHy+NERFXfdeXW/2N+DDEpCP1mrD3mNPyWjjRYcty3yUsxwEz7VA7alrg
	 XzGIESNKnE7CqPJjAnW4Dr2xI3S1HQeFeqJaN9WuVo7ZxW9f+EMHVyUwTq6hTNxoFW
	 WKx2RViUsowQx60QBrQRGgos5ubzNDvPwwtWXNurTnH8Ph0MBL322+3KARZ1cCQjfT
	 UmWV5cSTdtWRw2fykQqEFCcQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2967D40E00C3;
	Sun, 12 Jul 2026 03:17:24 +0000 (UTC)
Date: Sat, 11 Jul 2026 20:17:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Hugo Whitaker <hugo4zelda@gmail.com>
Cc: linux-edac@vger.kernel.org
Subject: Re: Fwd: HTML message rejected: MCE Errors and Crash/Reboot on Fresh
 Fedora Linux 44
Message-ID: <20260712031721.GFalMHQaNHoywdjVAY@fat_crate.local>
References: <1783821137-14654-mlmmj-7f2b267c@vger.kernel.org>
 <CAMVs2dRX5z-zOrrSCuhcP8=CNJO_8Xe8tf8yqA+aTRopn6RcCg@mail.gmail.com>
 <20260712023839.GDalL-L5pDdUxSKcsd@fat_crate.local>
 <CAMVs2dQZYrc3ZeUZsWH64qPyg49eAJT8Vq6Bp3qqvr8i=Pb-hw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMVs2dQZYrc3ZeUZsWH64qPyg49eAJT8Vq6Bp3qqvr8i=Pb-hw@mail.gmail.com>

On Sat, Jul 11, 2026 at 08:56:38PM -0600, Hugo Whitaker wrote:
> Thank you for the quick response Boris! I will upload the dmesg
> attached here. I will also include the commands I ran in case I
> misunderstood anything. I believe I'm on the upstream kernel right
> now.

Yeah, it is something vanilla-ish, let's see.

> hugowhitaker@fedora-mbv:~$ sudo dmesg | grep -i "RAS: Correctable"
> [sudo] password for hugowhitaker:
> [    0.803882] RAS: Correctable Errors collector initialized.

Yeah, looking at your dmesg, you're getting errors of this type:

[29783.564575] [Hardware Error]: Load Store Unit Ext. Error Code: 1

and they're not caught by the RAS CEC because they're not DRAM but correctable
errors in the CPU.

Lemme ask around...

> hugowhitaker@fedora-mbv:~$ uname -r
> 7.2.0-0.rc2.260711.dd3210c4.322.vanilla.fc44.x86_64
> hugowhitaker@fedora-mbv:~$ sudo dmesg > ~/dmesg-full.txt

Btw, pls do not top-post but put your reply under the text you're replying to
like I do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
