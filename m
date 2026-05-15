Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77D429818;
	Fri, 15 May 2026 10:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839299; cv=none; b=NEG1ISJ8qsUCup4NILuCWvqx8tqG5EliNW9sLJSH5NOm6kXkYy8JhoGdjxm3G1X9KMjgjlT5x0V7Wll8/Qu2AwxOtn6UaeyUyKl48Yd+OLESpLj0NNz9ArtipkJm/FyJ/7V9Y6hbYHI6Cc8kqz3yu6VYJbTo/u5l95bJQwUdYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839299; c=relaxed/simple;
	bh=yj2JXReRNUAFff1od98tH+8X11lshwXinwECHwX2Bkg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=o+dmTyCz35V0ILW9Pf/tMws1MUO6il+ouDg4FYCNi7rPeS0nznReoxlSX/bwCBNqtL5DT139/Ffoq8/9eOv3KV4BQY9PCZDJ2Gy84kV+eWj6K+BhvjprKcjrsOqfmVrxKrm+3bhNKwKsf0jf8/sp8n2HBqtnl32fLuafuF6MFCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fwOVb6XQ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fwOVb6XQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8CF1940E01A9;
	Fri, 15 May 2026 10:01:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6glyfywoEx_7; Fri, 15 May 2026 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778839282; bh=yj2JXReRNUAFff1od98tH+8X11lshwXinwECHwX2Bkg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=fwOVb6XQxT8bWodGe7Z6ObER7RFzBCyH9Nsbnl+vjsPKk3ojqs1nvvW9zAorLY6PX
	 glOuTx/442TTFCOitebuSsn5dO4T4wka4sgnAkUWAP1GJfOZLmeFNBVY766td+2+9p
	 jbIxdg05KdR4wl3vrk4qQ1fJdGMW6d5UgQYzGzd2BSSzLaOtSpA/s4yEeqOHKKvVbf
	 WLcOAU9XmCeC0BYmH/MRZcIKk9+Ic7TqvmxAHwqr36G8ypw4x2x/sxj6QMvSgSmdQ5
	 9X62SGblyDZUT0v7lJIoUBUb9ktg/LQg0Ore5A8NLhk88O72LtwjhcWDo9MsK3u5hY
	 MQr1yy4XI39uzv7446j9K6Yu3l9819VpWace790Xczmz2zpbAOJpCk+me66t+RXVN1
	 r3+si0lDymW8zMd7lUGGdgKi1yLN4vKnnZz6idfvV2SzT2FP61w3swHIq1QtkOzj0M
	 0U22XsXHpfh4/c9+xKo+9UPX3ZDxRXRzloanWq0dG5avVTI2O/dFxHk5c1Sg12siqc
	 m1/X47GPLWYIueQrb6Av5hjHxePS1JD8ex1znePSmWHfMhajpnnBPL8erysGsiENrx
	 T/iSUJXtFgVZMjG/7TAFQurGUjBhf75E1G1/1JtTHrR9hK+y59qbdnmDPhGYDCMGBY
	 h+C3c3ov+ORVdyx6Yd7h6NSY=
Received: from ehlo.thunderbird.net (unknown [IPv6:2a02:3038:21b:7a52:602d:1dcd:6beb:1e83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E160E40E00BF;
	Fri, 15 May 2026 10:01:17 +0000 (UTC)
Date: Fri, 15 May 2026 10:01:13 +0000
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
CC: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v4 2/2] EDAC/amd64: Include DRAM address in output
User-Agent: K-9 Mail for Android
In-Reply-To: <20260514194904.GA11459@yaz-khff2.amd.com>
References: <20260316125324.396889-1-yazen.ghannam@amd.com> <20260316125324.396889-3-yazen.ghannam@amd.com> <20260514113147.GCagWyowfypCcZ0fUo@fat_crate.local> <20260514194904.GA11459@yaz-khff2.amd.com>
Message-ID: <76D277BE-7654-4C50-B176-F3611045A405@alien8.de>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 14, 2026 7:51:31 PM UTC, Yazen Ghannam <yazen=2Eghannam@amd=2Ecom> w=
rote:
>This is a reasonable suggestion=2E Shall I send another revision?

What would be the alternative?=20

--=20
Small device=2E Typos and formatting crap
