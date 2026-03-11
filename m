Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4517A586;
	Wed, 11 Mar 2026 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232924; cv=none; b=l+Fr7/QKCYcxKdUDgpyge/VujvrAlz6pF5VsCOsZUw+DPxaIOwAzhnBWPPFmKhwWU7GBF/rr6qtB1zhkP6zdcCqDQCJ55mHbVOcA3c4JKGw5Nj27El0hGXbqwHbixHIK0sfOyQxLwdssmWgLxlOVbAkowPn9KkaraRH/YNmXQVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232924; c=relaxed/simple;
	bh=bk78duPcW+wffiOe9ARl20Sc4rI3XBPHTgkW49zysEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdhYwBbVLYw92YOA5SwYP0p66FDzENoM6DHgGmMAJ2Y9xPCmtiwamU3VNxm30yNKQA7hcSdtRXLcyd1jP/S4Se6nEmqCMJR5pcmBzq8jJ78rHDUperFiTiwpuIcIPd6hKKj/coLSA6bSMLyQAo3G+pLWKUJJpa34V2WF54sbXMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Vgk0UCQi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Vgk0UCQi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 26E0740E01AC;
	Wed, 11 Mar 2026 12:41:52 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vxGtaqC2GTGD; Wed, 11 Mar 2026 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773232908; bh=XkktZoJxT/o5RmEl6XScbcjZ626IQf4x+sDSkobrzmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vgk0UCQiStTtm50flpQ2LSPQ+S7UDTexqihhg3eEUoO3aLp3VFRcIrSqUqedKwq7g
	 Tdd06w547DL2cfIgMAtHF+VEWLLR2AXKJt4G6Wcr6g3sZpQ/sFTIsxiXiG0H63EYPi
	 SLFdZ2rXkfePpIS0RkcsTA+f4QMh9gEgDZrrZTBmkw+donwH67/YJF1mpJ1TS/SDe8
	 yardMg0jXeNWzHS3hke48SmmgXe3FgrjJDhOEfcFWyYn+3hsVHoSzOiFbPk32pwSpi
	 MX6Hy79mWfajg/o9B6I36gGkdtohXc2a6okb7TUjgQwMZ0JY6JLmb82HuHgohtBN/C
	 0uyRE9yDfYlsZvb8FLFuCvGvkDCKv+UG/OOh/Io2nfw5kh9Z3FLCOzv5SBcylBfsey
	 yO/o//kSZnjvnlfrzCZ8Qc3qvuuAOX/rO7rhk6zs646F92KxApbAmbsT6uOiy+ypDX
	 mJPvESqm6pr+qeFNE3xwD0N6USuEMKZxxGwGrderELwoZfjNWoXw4wX/pqIl2XfEkg
	 N6j/dfSoJuHaG9mU1vpRgUJyaa3dM8qn7CuB3j5m2nfBuNCR4m/gVfgGOYLFxWLfNW
	 oR6LEVQIi/Pi6IfBGNKHK4SFA2QrOoN/yopPYDLwFAvkHcxqMnLILXvGn370PIEYwN
	 tRMwDg1oPv9lZ1MaZKmLbf7M=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 7FF6E40E01DB;
	Wed, 11 Mar 2026 12:41:43 +0000 (UTC)
Date: Wed, 11 Mar 2026 13:41:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v2 1/3] x86/mce, EDAC/mce_amd: Reorder SMCA bank type
 enums
Message-ID: <20260311124136.GQabFjAJgGtBdkTKQ2@fat_crate.local>
References: <20260307163316.345923-1-yazen.ghannam@amd.com>
 <20260307163316.345923-2-yazen.ghannam@amd.com>
 <20260308102046.GNaa1NfuoXza1-cB8z@fat_crate.local>
 <20260310124649.GA890303@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310124649.GA890303@yaz-khff2.amd.com>

On Tue, Mar 10, 2026 at 08:46:49AM -0400, Yazen Ghannam wrote:
> Yeah, I see your point. This didn't sit right with me at first, but it
> feels better after looking at it longer.

Ok, I hope you'll see the full usefulness soon. :-)

> Want me to send another revision?

Nah, no need.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
