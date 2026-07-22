Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08E33DCDB1;
	Wed, 22 Jul 2026 07:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784704598; cv=none; b=tdl+nCxfYMD1GFzkJUl+ZBUJTlCTHRSGhwHzfKTw+oSn5TExHUJyuv3P/ZLAUPDHlo/BkRFqlg7+V0gEHo0PEzHXkuzZtEvcUCQX62iNn4l3FMnOh9dpThinrnNQydWVpVvYEQ1PxRIzynBlLvPbAWur5G8B2tFrhZrXiJ9HBEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784704598; c=relaxed/simple;
	bh=K9/chxFPPa22IO8qa27xxpbmwA43QsAQuqs/BaliX5M=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NS+xTGULSqXw+NUb3QvVjhe6Ktieq5YZyqCJ54bEXW1o4KgzhlHNygZ/S/sp16Whl6seR7rt5wqnH0vNyTMu40i2wB4MUM8tl0KMMocc+HJkIbyukzsHjAUqXYGPvyILDA5jz7RG3DSow21+qRxNWg9qtittonmp+ztic6hvwEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=IjLWOwwF; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="IjLWOwwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784704594;
	bh=K9/chxFPPa22IO8qa27xxpbmwA43QsAQuqs/BaliX5M=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=IjLWOwwF+Vkg/0/TOKB9y0d4L/1Iimn/gdWdnmdiBRcqFsYOQd7ZSO6YumYjqsIEk
	 SUQyAUcHyTsJ3QMKaVP51PuvnDeST0/SLcVuMDBdq90V5+xSPv03yBwW/+Jl7+Ti9K
	 pGCmPPKpfJ8MFlYthmoutoBPPmSyM1eaxVkfdb3YC/6ciK2vb+ydDf7mh3nTk6KyCv
	 3pUIMAo39htGVcsv1BlbVy266/QaimoBFpgmoHmffolwDc0I+dy5oRqNfGUqADgGKw
	 CI0s39eiWAhPuvoVCZxOtNo3FirpFBedm0e04+EtRsZKqDw0rPv7Wf5ML0KqqbGg3J
	 AmBAvWONOVvhw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7810065B37;
	Wed, 22 Jul 2026 15:16:32 +0800 (AWST)
Message-ID: <e3e3d647b9194b7ea4b88241a37df184bbdb307c.camel@codeconstruct.com.au>
Subject: Re: [PATCH] EDAC: Remove redundant dev_err()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Pan Chuang <panchuang@vivo.com>, Talel Shenhar <talel@amazon.com>, 
 Borislav Petkov
	 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Stefan Schaeckeler
	 <sschaeck@cisco.com>, Joel Stanley <joel@jms.id.au>, Andre Przywara
	 <andre.przywara@arm.com>, Robert Richter <rric@kernel.org>, Khuong Dinh
	 <khuong@os.amperecomputing.com>, "open list:EDAC-CORE"
	 <linux-edac@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
	 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT" <linux-aspeed@lists.ozlabs.org>
Date: Wed, 22 Jul 2026 16:46:32 +0930
In-Reply-To: <20260713131510.332386-1-panchuang@vivo.com>
References: <20260713131510.332386-1-panchuang@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-07-13 at 21:15 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
> =C2=A0drivers/edac/al_mc_edac.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 =
++----------
> =C2=A0drivers/edac/aspeed_edac.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 =
+---

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au> # aspeed
