Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422470808;
	Wed,  8 Jul 2026 02:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783476033; cv=none; b=Tr85uuDjy335vR+CyZNlAsOt0T93q6MnFpYpSO+UjYcyr9UVoEL/1RH2A15BTw2V5ogOmzCjb7PNDul3Lrcy/ntWb56xPozJe4w50W1i3Yj/QrEIRM4Iy4dC0RmrU+9ya3M9wyxbKOMLqcfZKXWRvSe69ujHEpZQRoDmAfJK2Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783476033; c=relaxed/simple;
	bh=41gsJlBxZAgOuHi34v+CZKW56Fx8wVvTryGUgrQp3VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mh8/+6lh1SHUAGEYN8W7iCBifc+3GbwMSdP3NoMmHROtRFct173XpXDbuUKaWX5JKnnSPwey2NT8aCBGcpAUxN4/9/kzKOu9o6/ucJNf1/No0mcmxKDWvYxqLDCRNxDYLeFZkIUr2ZzZc/WL3G2htP9cBebd4zr7034EoKPQBA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HJT9XZqj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HJT9XZqj"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3A28A40E00DC;
	Wed,  8 Jul 2026 02:00:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4s64QORXz4ab; Wed,  8 Jul 2026 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783476019; bh=ovZJ4gWta7lp5T4ruf6yAKxZjq55maF4AOTuNtMecos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJT9XZqjf993QfNHGVlmUh/53ndHqvygJWGkbeCSGy3LLL06iNpSC6mF9swbRkmFC
	 g+7OY6EtmOag4RMHA1Ed1KT3TatKo6ugQrpPmVTmlmK436qUbYAxau2WYBA9xK4ikg
	 C5prGqdtoiPQtMvHAbUGhJmMToE3PqXeGtfcRjro24kYgltiSfVxGJQlbsiUP/6FLt
	 qUfDjyyZhjFDIIocfbRjz3U3LGIQnZKmVdYsk26hQX5+wGim0skXe0u9NyOunmLa/V
	 lnvLWtBRl6HSL7sUMDPBQ5xRspEBBNPORtjaY4/jK+h/0FxeGGsB0+DYe7zL2H2GPG
	 DsSwM62SqZDxUO+4qTpT80BqCPCW/8KN0Speoom6ezLjXnNXZZXvw1CaAQJ6f1Mvci
	 yfTYCj5jY6OfxMHnF5jVwnKycZQ4yaHgXBURpJqdqB4RRbzhl+ny+ZWiSHaef3Txnk
	 /ago3wEpSuP1g9m+qpTkQZIhLl0Tu8hdUO9QcxKOzEONZssSt05H8mj0VdLPIqLtg8
	 dmzO6ON6AoytxxzqFpy6B49wy+11qvZqj76O07i59arjkygpIxca3sroy4k45GBbjL
	 iLQVJRGgku5BD+Y1g7FDUEjxJv1nPfJ0P1aVsfviuaslIv+YoNk3Ac0Rpz+iofa1qJ
	 EUdenPZkXvEQXFcvKuv+BzyU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F0F7D40E0031;
	Wed,  8 Jul 2026 02:00:14 +0000 (UTC)
Date: Tue, 7 Jul 2026 19:00:12 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v7 3/3] EDAC/amd64: Include DRAM address in output
Message-ID: <20260708020012.GIak2vLPUZixpS9l3e@fat_crate.local>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
 <20260630210640.680758-4-yazen.ghannam@amd.com>
 <20260707003735.GBakxKT4r7efMzoszz@fat_crate.local>
 <20260707140208.GB1382082@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707140208.GB1382082@yaz-khff2.amd.com>

On Tue, Jul 07, 2026 at 10:02:08AM -0400, Yazen Ghannam wrote:
> There is a one handler per operation. But we can wrap them however we
> want. I'll add an AMD_ATL helper to do both translations in one call.

Yeah, sounds better.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
