Received: from mail.venturex.pl (mail.venturex.pl [141.95.86.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA7C32AAB7
	for <linux-edac@vger.kernel.org>; Fri,  6 Feb 2026 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.86.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366681; cv=none; b=AKyeG7cXu6k0uYo0sY6ml4X2mYMw4g69aDIDhPG51MPChfHYuNGWDmRL88NjKCG5NJ2AlfxkFXqNaj9NCylQqpNFhbeZuJPcufD2k4eGjHYgMiUMV8/MPPj2SRLYdKCSapSFNEUdNgTmtB3Zc/PzYwsjdUBnncXqTqaInOPav5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366681; c=relaxed/simple;
	bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=Gw7rlC2QR516euF90CjvNp0PLWnX+yVZyyNnlvgOqB17fnP0NafixLH7qKVP+r5N8UwpTKYpewqIO1WIXrd/hJjOgyU3Ql10bDyR7klfRUCkpSTRyL54yXXhBz7wpdZrssfXQrsawYajxP8aH2Inh5tDEOWCJDh1dIku5qs2HKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl; spf=pass smtp.mailfrom=venturex.pl; dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b=e8DLHKGb; arc=none smtp.client-ip=141.95.86.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=venturex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b="e8DLHKGb"
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id E01BA21BA4; Fri,  6 Feb 2026 09:31:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1770366678; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=e8DLHKGbt0va0SgIJkekFA+wxFsYOVutmgjE+ZEncBP/hEHsayE1pnpsuIdZROUSR
	 0Q1pz3tZv9AvInaYIij4Ihs6US76BStrE5WI5NfvjVR/TXZ+gMOqpsIwFlg5VjShdn
	 3DiSUtEi3kvn09BG8crBz6JE2o2iK+QuM9rXjCs26kZvM2qRVwnT7Mftfnj2NWB+Ij
	 GNvJLbBSDJjyoZcFydC8JL1et9BKAimeKPNVbJXRLaZehaCM3uRGmpv3VbwY/uaf/0
	 7JLzc2anj3YLvNBTrbyLKtY3jHEoU6UQ4HGlg4IV9n0V+WYoEu8ZmBVkfQDD+BJa14
	 OlLDbMdB9wiwQ==
Received: by mail.venturex.pl for <linux-edac@vger.kernel.org>; Fri,  6 Feb 2026 08:31:06 GMT
Message-ID: <20260206085537-0.1.cj.2jvl1.0.c8cu60i6em@venturex.pl>
Date: Fri,  6 Feb 2026 08:31:06 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-edac@vger.kernel.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Szanowni Pa=C5=84stwo,

czy byliby Pa=C5=84stwo zainteresowani rozmow=C4=85 o mo=C5=BCliwych rozw=
i=C4=85zaniach dla swojej firmy i rodziny?

Nowelizacja ustawy o Fundacjach Rodzinnych otwiera przed przedsi=C4=99bio=
rcami zupe=C5=82nie nowe mo=C5=BCliwo=C5=9Bci ochrony maj=C4=85tku i plan=
owania sukcesji. Fundacja Rodzinna pozwala oddzieli=C4=87 aktywa od ryzyk=
 biznesowych, prawnych i podatkowych, a jednocze=C5=9Bnie zachowa=C4=87 k=
ontrol=C4=99 nad swoim maj=C4=85tkiem i zadba=C4=87 o jego trwa=C5=82o=C5=
=9B=C4=87 dla kolejnych pokole=C5=84.

Co istotne, po up=C5=82ywie 10 lat od wniesienia aktyw=C3=B3w do fundacji=
, roszczenia o zachowek przestaj=C4=85 obowi=C4=85zywa=C4=87. Ustawodawca=
 przewidzia=C5=82 r=C3=B3wnie=C5=BC liczne zwolnienia podatkowe obejmuj=C4=
=85ce m.in. dochody z dzia=C5=82alno=C5=9Bci gospodarczej czy wynajem nie=
ruchomo=C5=9Bci.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99, czy chcieliby Pa=C5=84s=
two pozna=C4=87 mo=C5=BCliwo=C5=9B=C4=87 stworzenia Fundacji Rodzinnej?


Pozdrawiam
Miko=C5=82aj Rak
