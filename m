Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C0E39659A;
	Thu, 30 Jul 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444227; cv=none; b=oUvWIidMmmgICryD+YSe4aZ/R8qH03FR3K06HfSxJKiRYC33ysvVWmG9SDpOXUcYXQ+es16xNHRcnWeo4NoOE+p0kBchEllsy8qJhkq6OLzGJTWC78HkbAea1f0QO6BAJtFdTZONwHLmduK/GTPkyl/3hmSncjhzN08mWyKThUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444227; c=relaxed/simple;
	bh=wVnbiwOgRnwRBuyk8DDsR0NtjXgFZjDK44N707tHdJs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=WGGTO+e/CcaSpoi5fYAtIgrhqC6dujADAjdgGqn7vL0LDSsAiaG1TvTdjNrTf2u1EoDJEJ+OsXyRqN1UjGsuPJBPkarC8SOtLz4YKpREDJHIWs3W47hOZ5rnDzWsj3oh9eedLWDaNt1WuZMjjxiyttbNlST5uYWAzfPstPPCUk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A6AAE9D;
	Thu, 30 Jul 2026 22:35:21 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 22:35:20 +0200
Message-Id: <DKC6Z5YGBF2O.TAJAN566BN0L@kernel.org>
Subject: Re: [PATCH RESEND] powerpc/configs: enable CONFIG_RAS to fix EDAC
 support
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Nicholas Piggin" <npiggin@gmail.com>, "Christophe
 Leroy" <chleroy@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Janusz
 Krzysztofik" <jmkrzyszt@gmail.com>, "Takashi Iwai" <tiwai@suse.de>, "David
 Heidelberg" <david@ixit.cz>, <linux-edac@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Borislav Petkov" <bp@alien8.de>
X-Mailer: aerc 0.20.0
References: <20260730105546.3658570-1-mwalle@kernel.org>
 <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>
In-Reply-To: <20260730185620.GDamueVIGV-8iIzozX@fat_crate.local>

On Thu Jul 30, 2026 at 8:56 PM CEST, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 12:52:18PM +0200, Michael Walle wrote:
>> Before commit e3c4ff6d8c94 ("EDAC: Remove EDAC_MM_EDAC") EDAC_MM_EDAC
>> selected RAS, after that commit, EDAC depends on RAS, but nobody enables
>> it. Enable it in the config again.
>
> I have no clue what you're trying to do but forcing RAS=3Dy in that confi=
g
> better have a real good reason why.

I don't get what you are trying to say. CONFIG_EDAC_MPC85XX is
enabled in the that config already. It's just that the mentioned
commit broke it because it removed the "select RAS", while
EDAC depends on it. So yeah, up to that commit it was always
enabled in that particular config.

> Oh and we cannot support CONFIG_EDAC_MPC85XX anymore due to lack of hw:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git/commit/?h=3De=
dac-misc&id=3D749c5102487b558cc7d73961a6d0da2fceaa022d

Still, it's already enabled in that config and it somewhat recently
got IMX9 support, so I guess NXP is interested in keeping it.

That being said, I have the hardware, but right now I don't have
much time personally. The best I could do is "Odd Fixes". (I also
have two pending patches for that edac driver, yet to be posted to
the ML).

-michael
