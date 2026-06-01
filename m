Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14452F39B9;
	Mon,  1 Jun 2026 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347972; cv=none; b=Tnx8gY4SFrjysveRV9gpwngJSQovfiZPJ5DkRVRukXZyqEUve8DurYlAXku4/iO8zbb2ZoYsg4oIwOqKRJisOzoCTn8BCaytPqYK1X1GlaJZ7ykS0laXNV+eMQXW4IZIFQAz+qqCFUeQXALmhs3chIksBeD//xrrRfHPDxxe/vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347972; c=relaxed/simple;
	bh=VacLc+Rjaqh7ML1qtcDVfifKXJ1dQ6yyY723gs1pvzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NsczGSMoPlY5ZwMZuquUUSvmo4CLpPzGRvPRHhVVzYpIO1NSziI2NReO0zrWl/mxN0Ak/CkSbwVWJ5sIce1VxvqMR1lwvLmuMcM1eBR839Vpr1lN0vv6doL+gbH7s/bpjmpZ0+zVSGt6n5lPUHZLtfUitiXls73lXe19oIHAdMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JItPfWXH; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JItPfWXH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C486040E0032;
	Mon,  1 Jun 2026 21:06:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id m1rVIos30J6m; Mon,  1 Jun 2026 21:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780347958; bh=Fc1q9nOWY7pOEVKGYEWPZLIoMny5HJxwesxWeH9s2EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JItPfWXH5RhYketUASv7xVB7eIGf/6l3QbquKhCvhmJX9QapprrX84/UgxgMygrY0
	 /yHzTl2xz8Ts4+aqjnhdXJmqjDGQFZp5Nh6fsQFXwIDRTBoEtfCwJ9+pphO3IWm7Bo
	 4XsVIdZD+rsDJeM8ROQyC+M9StuzRSFe0inzFUTrUb/U5MsIU8jXpFZlrEuPONH32C
	 kChiyDyCFRGRgNU6viQPe5bJ+eRsfqRkOp2oF46MVyXi+/gEdYmAMIfvD8lqm/cbXL
	 H0qUUwmI8wpxfgtagHDcMkzG8YkGL47cJXmkrfhnfYyIaTa4Isa1pEMkzS2wuJ4cWr
	 /5p93TirV8hHhhp+IhEMzKXXwc1c1LPKM4GYIJ3Eky1xZlosHfQCghtFnpX+ZogaI4
	 JUIRy5zqEgzL6xLxXLqTmQXDVGwf2dHvjrVFtLtHM/XLscnxv5hX7VCRBIs1ZxluDy
	 QDoqfZGzDZx12KRD0JpAuHgvhldCpdVGsYcWeoTjm+XbZWHenx5pyQnicV8weDSZ6j
	 zqNUW1uuu+OAHkZVSWpciCmhGWjUEWH0IV5Qtb6r0MqpWoDgS/li5NOJxisbEX24P1
	 lR/1/tjtc7e6+eu9hauhVMqZtigRv099AdaPRC++8qEsDI6x8+VCk4ykGhdMW0fExp
	 5+jeYZLvLUoTGUZKjWEo5gvI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3906F40E0140;
	Mon,  1 Jun 2026 21:05:54 +0000 (UTC)
Date: Mon, 1 Jun 2026 14:05:43 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601184100.GA4547@yaz-khff2.amd.com>

On Mon, Jun 01, 2026 at 02:41:00PM -0400, Yazen Ghannam wrote:
> The fake_inject thing looks like it could happen with all EDAC modules.
> 
> But it seems unlikely because CONFIG_EDAC_DEBUG needs to be enabled to
> enable fake_inject. Plus a user would need to use it at the same time as
> a real DRAM ECC error occurs.
> 
> We could add a mutex to the mci struct and hold it during
> edac_mc_handle_error().
> 
> What do you think?

TBH, I'm wondering if this thing is even used and whether we should simply
kill it...

Meh:

452a6bf955ee ("edac: Add debufs nodes to allow doing fake error inject")

it probably is useful.

How about instead of passing silly ptrs around, we copy the string to a buffer
local to edac_mc_handle_error() and avoid stupid locking? In a pre-patch
perhaps...

This whole thing is itching me to axe it off but meh...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
