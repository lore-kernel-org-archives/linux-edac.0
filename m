Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56023D531;
	Tue, 23 Jun 2026 00:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782175831; cv=none; b=SPw1p37fzoy400lL0V9RE9ZpoDJwAEW5h7KO0Xh/Bb+EJFMVC0WVkwROT7XdfM7UywBCEsGVpawDdNS/iIgUiPyVQALOj1dCh1xCARLsLApM9YZusht+0Cz8rxhp0wP3or4B0g0mzoIOMyOUOl0fH6Iw7M83gEdR8BNVKBfov54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782175831; c=relaxed/simple;
	bh=82Rx0L2lKKJIWGlT/cc2UfDE13fGGiIrtmgn2VBlP2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlO55hT/h/ZZyblwh0c9XcPM/FYq2o5W6yRG/UJaCdreG30h1xJq91tKdFPvJ6lWh/OrFxUmBwOC/iObntAnji/Gk49dTEaTxfTrMs9g9cn5ypUSybGCLR4sEjW74qwbyUzXcgMxX8A9wGxoQPdOE+8a4gslxT9xmD+i74zjONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iIipvhpW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iIipvhpW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1B9540E01CE;
	Tue, 23 Jun 2026 00:50:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tYJVGYmAlekC; Tue, 23 Jun 2026 00:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782175809; bh=EfKHhJAjqEB84G7CNPRGjR3wI2oAp9AyGGok1eoa/QE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iIipvhpWHDU2pWh43pEx6ij64z9XjZLNvS373HOYEnu4KKieN0QfuYZQFI4CIs4qj
	 EVUz2QDqZU353J/FWxJmq6xS42KUQedLUUDo0e8GQvBFE1J/fkNjyka1SCyG97QVLH
	 x3UhtmG3RHUpNnb1rp1mzqFSuTbD/G2svEqad8KGKbrcWGeAHKDa5ILiYiUAZWLAG9
	 7fti2qPrph7OqWaZ7/ifmwwcHQ1SBMkD+lZ8SN1++2vyIterucKPvziC576pCVI4Pw
	 cK+sY/EwjiIHi0oILJBYzfe/QbfvLjlw1nG8osiljUgkRlFTtRBBUNTYx+NG02Snar
	 9apj/An/EFlweQCqJqKolZliJ7S2VQTFqPAcGh4Qs/bQNoIw3N+t7EKBHuFuRmQUEG
	 tZ3cuf+4a2UEmvSMk+jdQy6qEUBIYEPde5nkeQsigniVLC7lTIQbvU3jmtTNOmHQL+
	 prSvE/YkkBW8E/IGOEyYyEIXlI4m+hwDDabtpc9usJPasyNO3R9B+pZ6VDLvhZLNBF
	 7XCWHLCyuOOP033I9dxXiRtIXrUKKtNHnAFezGfiagLYne86RJk+uQOtsOSaRkySOE
	 keY1VQwJGswa71s4WCB1T+ELH7y3mhoIKRTCy4GsZjibOjnExD6WlfC3+bwHVOB/gC
	 l2kuvhLWOFui/M1ohHcTQf5Q=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 823B340E0140;
	Tue, 23 Jun 2026 00:50:02 +0000 (UTC)
Date: Mon, 22 Jun 2026 17:49:59 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Phineas Su <pohaosu@google.com>, tony.luck@intel.com,
	muralidhara.mk@amd.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/amd64: Only translate Node ID if GPU nodes are
 present
Message-ID: <20260623004959.GAajnYN-WCJ8GRWMHh@fat_crate.local>
References: <CAHGR-A+kTAcFpBE0wH5WYraUUq3=st+hXMjnF6Zcj8OGqOBJwQ@mail.gmail.com>
 <20260614150618.696249-1-pohaosu@google.com>
 <20260622170717.GA1571@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622170717.GA1571@yaz-khff2.amd.com>

On Mon, Jun 22, 2026 at 01:07:17PM -0400, Yazen Ghannam wrote:
> I do agree, in principle, about hardening against possible new
> configurations.

Are those configurations going to happen?

If so, we can harden when that happens. We don't do hypothetical coding yet.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
