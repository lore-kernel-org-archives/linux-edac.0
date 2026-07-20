Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF2449B09;
	Mon, 20 Jul 2026 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579617; cv=none; b=k41x+ytPW8UIAjY7fEBF7tCD4JL4ZQkMsiv8YOw/czstszluhNbdnhbbAN674O9Ap8yqf+XNMUzG3jON7ip5JNswBkSzHsXihQ9e8X6FRbwnQCIMPG5tNQcy7UaSwNJKqOd15h3GFT9niLfx50IcY9WEmImTRXx2CEIPdQaGMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579617; c=relaxed/simple;
	bh=oDHGp2go1H7tN2DnDXFDItIQMtTVKJ3fQwPAuMiHgGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOxk3EWGlTqY6Eb519brba2k5FwsLXkdvxkixTRx0yW8uceot+Gpi/wOlRdwe0a3I7hr+4Ev7GiWTd3r4u14fynBMlOSXQ0nUBb/wf44W5V8oFP/34u8HOluQXSRu7iLPSVPtId/jFgrrZuWSzFt3WSNibyUEFSEL8uCnJ2Ta18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=hoOT0BdV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="hoOT0BdV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2C54E40E00E6;
	Mon, 20 Jul 2026 20:33:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VGIGm9ynH6ep; Mon, 20 Jul 2026 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784579603; bh=hZl3fTHtLJ5//e+MljG2urE5lkwLT0MjNo/RuVoiEvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoOT0BdV5/erE+vXxP8xr9yr+pBk5Dg/L+1IB9vXIFy3s/33Al38UiJYVfuu9xFZT
	 WpxMVBPL+BdGSmo612GAXNa6HocsN/EY6BAQykfsp4NKLVFC6p1Ur81WB1Ik5XqMiu
	 tHMUk7t96aHfIkcVhS0wttTTIjZqy1677uXDH1d5aZgYdCOB3BOODY8ycCgWOVqGeE
	 m9p1+5UN+6FD+fA/4Z6cSp0176Co63Q/j3rxeDy3JaoFLwx3Fdlzmwkbu3+3uBUFLV
	 hZW/4edvDZL/9P6aepJtgre4IVcOYfLWFJEWp3rWpjr2gP4oXEgeKShNV7hoHboEkn
	 L09MxGBpdXlc3u+zApPprZXPnsPHu+A4ELsKxz0qx3/DWubOs9kMdnNYgXyjC5UwtW
	 1y5iqy4Iyz065Rj/26Xu4AFD65LHwG0ijR/EtiWNgwx1OXq0g27c/2XOimTOslFxCn
	 2ePDupFtGsJWekWjuliv0HZZRd/iGduk18h70ulAbcmR4CSfZMwXUPJ9qQ7ud39ATK
	 m7/oiZXZ+RyIV/6qgKIH8Aoq+qgmMZ96iZhWJcenkucGlEveUYsKrYqYUy+oWcS9nc
	 re5ano4sux3sS6l8a2ACgSEvZMNbZMMQeXGWGoHZlQWXvMGYVRHwKny9O9KPemqznR
	 tpbHQ/aqOF961KntuAiG/Psk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6631740E00DC;
	Mon, 20 Jul 2026 20:33:12 +0000 (UTC)
Date: Mon, 20 Jul 2026 13:33:09 -0700
From: Borislav Petkov <bp@alien8.de>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: tony.luck@intel.com, rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] EDAC/altera: Add support for Agilex5 platform
Message-ID: <20260720203309.GBal6GBexzEbw8DMPo@fat_crate.local>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720201425.1538771-1-dinguyen@kernel.org>

On Mon, Jul 20, 2026 at 03:14:21PM -0500, Dinh Nguyen wrote:
> This series add preliminary EDAC support for the Agilex5 platform.

So I'll be looking at new features to this driver only after all existing
Sashiko issues have been addressed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
