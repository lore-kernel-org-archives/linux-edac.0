Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B129BD95;
	Thu, 21 May 2026 00:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325095; cv=none; b=nX7Lb9Qiqu3lgb5WObZxf0EawAZFpkrq2QC524yDkntgJxcJ/CwRZp+Ao9/mRZBgCqaemFMkHSUu7cE9dWI2LhMYurWZRJQZkw3JhVHqXwF9AEtfBEsLfeDEhkxuRxg9xzdlLBkUo0PpZhJJgi1lUEPob0iekE65A1S20zEBAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325095; c=relaxed/simple;
	bh=POgT8j+NMwPKPI4n69t9rj4dgiIs8Y2AHD/DURxW0ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvqs6qpR8AMR/kA+zA+bp9vQskm2wACRQ78OAFrzXVfcflgb220BQ8xEQuOJc00t+n0sujfHlkmTvUcW51LlCq8cT4RyT/vgEiHnSYeFdsG6nw9dwfPhBE4zXdUDcy+bK395/cLid/s9ctzu3q4Jg5G8pCIC1ZDJS9yzNTHJrqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XOU0PrcE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XOU0PrcE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E581440E01B3;
	Thu, 21 May 2026 00:58:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qWaYbsGn_w7h; Thu, 21 May 2026 00:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1779325078; bh=BVyd0gL9Thj+kItplNEPanKSSeIPeV4tP7vzxMqrhgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOU0PrcEIkyANXHMt6+YlFhViQcriPp2gzZyf7fiyWd3jWCexlZLxMxnsK5EEZ+AE
	 arpiCOonMrgKuUHU0IuUs/ZkU9iijWDzJ+69kRYjAOic7WEHfEVhSdrGlAA0DyQRq8
	 8u7g0gXPOQp5TyFE390KeTvONBEL1FzVh2xzu0ecNI7/33lit71YEyrsrANcQsH0/n
	 xUgYBYmySCHxr/xQe0bIqHkL71FznB/LiV5pJ/5T27R8kdSnp0htNJ/A7mA7ilePIL
	 CLlef549c/260xHM4rDgsFYR2Qs27bhujpZOEMhWN+6QtnWMa0CCEI4iL6HhCiju84
	 IQoHgqc6IxosvAo2VgGiZcSeIrvJeFOu+b08jlWpAwFlYlKn0oWpfHTRksLYLYQCHx
	 FvD0BPt6wbLufeJpnccF1SLCOnhppsbQ6YFUc5tOzzAPLrhlMxJtroKUGny/6B+86e
	 HQrFZ5CHA55mKRgvEf5AS3ewdeQTPj2ZBuR2eT1/3mtqedi/cb6Gta2BgNoje5FkUS
	 mTtiJAosSPLIsEg2cKpBPFlIrM4Fes8MMMV1GtyQD0YcqZlvFvqUZsRqS/qhllY/CT
	 b24D06tdwCCvS1j0PV1nUuGZRDmpk6XWqrKiF+8dzMxxXROuFyqbY8+fSW6fJSnRqJ
	 pnB5szhRF/5cFsYfGhlmuZTM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00:b8a3:f58e:8829:9ca6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D2F7A40E0140;
	Thu, 21 May 2026 00:57:53 +0000 (UTC)
Date: Wed, 20 May 2026 17:57:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518160716.171578-1-yazen.ghannam@amd.com>

On Mon, May 18, 2026 at 12:07:14PM -0400, Yazen Ghannam wrote:
> Hi all,
> 
> This revision addresses a comment from Sashiko in patch 2. The decision
> to print the DRAM address will be independent of other decoding results.

https://sashiko.dev/#/patchset/20260518160716.171578-1-yazen.ghannam%40amd.com

Meh, gemini still finds stuff. Some of it is meh, the fake_inject thing
probably needs fixing tho as I can see the concurrent f*ckup happening...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
