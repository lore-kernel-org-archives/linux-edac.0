Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE648033C;
	Fri, 14 Aug 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720295; cv=none; b=Fh/qpzLoRBrqR1BYywVBZLnot1JF7QY36k3rNAwQB1tXKlsG2s06zOC6nGqn3inY/gn5s8nb9whNgdvcH4t7k5dSP6u7rb/8XGl2pTP3qKtuKnAm5G0pf1/HH26pELJGHiNysZHmv85Tp7w87rHclrl+WdFfl5WWzePw0KsRMB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720295; c=relaxed/simple;
	bh=/igzb0NZ30HuFYi5fcYgQd7xA4fkGF2oAJNdKrs/Ook=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQPz4Ynes+5Q28DER1wARBHvNzUNKAp1XB+ys/ORRQkXGV5edOlIbsJkChbP76cRxW3wOSd//2TsuvP5i0HjsidQsS6puDhzmMtIW0Ai177AiixPy9Vr6pIyGPQ8Tp4KuLCMp76ficSut4uVY7YX+gogLJhXz92VZ54XtLpqkjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bXpoy1zp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bXpoy1zp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AEA2A40E02DD;
	Fri, 14 Aug 2026 15:11:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wY05Ao9vFpxJ; Fri, 14 Aug 2026 15:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786720276; bh=6eoG+GAgs2/TE4InBjiLHDdbooMvWLwMt1zLEo2FST4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXpoy1zpN7d4+DzS6B82jyu++zD3OJ1hCADiphwaOKzllu/zI9FDZJMDW8SjtOS5P
	 x7koj02Ke3gzFO4O8mMyLMAD8FfeUUp4lPX8ZUM6PTX6KPGL9b5Qg/SOjiAYN3B3M9
	 mdyldKgluJLieHdl5jZpd4nGvL5G8GzIMDOg7A1WV1nY4FU605GoSdSTF/zePTW/yg
	 W6mSX/1frTkAgU2t4kscsrsr41cNysr7r/yzMUYqpMiPen2jOy7TAxOMUJFqSFX7/X
	 MKDKcXeQCKTjMmtlArS4PfbUYowJz03GSu4CYTJOoSHQoT5kqLK6A5KN7qkHGkyuYr
	 CyWWIcXU73ydMy95ec1BTxL2LPdzz6e+o3V4e0gKpGod8w3nHSfRktu+6U9Xoi42m4
	 cBe1MqTBznc9q+zfpJrhvYZ+RfEKsIsBFxuLnENYS2R8y2uMgbefSifHFZMNDqgdHg
	 qlFMDulF3a+AQHTTfdiRkXGd8wleoGiV+ye1HZc2NzjC9CGoMFPAyZVuMjpK02I5WO
	 e180LVcONQg9ap3n3+SXvOL3QLplco+vgomamvDUe/an2k6/hRkY8DBw0ltaYjoQyv
	 qSmgKoNUnpYM5QwdwyYHDtm8SwhvB0cNxHqKbpbIdMK5RO6+7kEJbCWt9uV4sVg548
	 yapbC8o4BirCB6GiJUJnHzZk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 25E5640E019C;
	Fri, 14 Aug 2026 15:11:10 +0000 (UTC)
Date: Fri, 14 Aug 2026 08:11:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>,
	Borislav Petkov <bp@kernel.org>,
	linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260814151107.GAan8wC4jjCPlNHHxg@fat_crate.local>
References: <20260712031648.486110-1-bp@kernel.org>
 <20260713184402.GA364094@yaz-khff2.amd.com>
 <20260713232219.GAalVzK0UQ9rxlIWmT@fat_crate.local>
 <alYPZGTBJUDR936n@csail.mit.edu>
 <20260714130455.GB364094@yaz-khff2.amd.com>
 <20260812235839.GDan0Ir1Cx8KEu-0TM@fat_crate.local>
 <20260814134307.GA1650@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814134307.GA1650@yaz-khff2.amd.com>

On Fri, Aug 14, 2026 at 09:43:07AM -0400, Yazen Ghannam wrote:
> The delimiter would need more thought. There are a few strings with
> spaces like "Ext. Error Code", etc. Though maybe you mean we can use
> extra spaces like double-space between strings?

That's a good point. I probably should use an explicit delimiter like ';' or
so.

> I like the idea but I'm not familiar with the concepts. It'll take me
> some time to figure it out, so I don't have cycles to do it now.

Ok, lemme take a stab it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
