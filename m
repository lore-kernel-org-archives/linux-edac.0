Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83C21CC4F;
	Wed, 15 Apr 2026 20:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776283353; cv=none; b=QejjHtX/92O6i/eeESfHUvy1AO0bt5GK3oyQzH+JAKi4VYFj1MAqD7UOhsYV6QA3P4Ybsz3hjhNNInYF7w6lxdsutKU+mMJFE4ljLALnGm4PVFgiJFGd6z1RYvNM06qy2nY1hOcVIEIjB+0BQ71APcXPoQmM2GbI9vNcvRcdcl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776283353; c=relaxed/simple;
	bh=hSIF4uqwgtOjMaCqQJ3c86MTyGKpzTGcI+pLBCSoGOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1C/iwJZyFUEwTgqn3KRXy9HfjWKN7DoKfy3w9vDsCTSw0bjaomuv91Lkrp5md0hyzKziddoAc3jUCfY9H8RnC7pf4joKeTKAE0OUrmhqJV3NRfldL6yJI5Z/EU+DR4e2uLQ68m/c3YyNIbjdcAWxBv8UKN2Hr6A8HjCNszc1ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YqRD2fIr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YqRD2fIr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5474C40E00BA;
	Wed, 15 Apr 2026 20:02:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HJ9DFyL3ZSjD; Wed, 15 Apr 2026 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1776283345; bh=but3AQJRLpwAxn+S49XU4QbFEc+NQaVQlaGBArdR+Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YqRD2fIrJwPpbk3yNXzDJPBEl72/Tm8ns9shi3zd/BBTs7qHBtsYJIl8FmCWRkYOn
	 MRKC+nulUzb3t5iwfkb40Xt2ltmtLpms2J9uGuCwwuhx/BjBvtX+u426HKgDnEshoT
	 sTkc+6GwMxhlGQYSp8AIq/ydVPJuDFtc9bqIpJNf5MhYikL0wvk+dBDKo7LuWq/T+n
	 05V7hWShQp3lPxnozIK2DB56sPDX06zCgrBBbbRZlOwjlCqGPocKdy5k+k4ENAe9rR
	 JqnPgrm4zGrAAfLizBeMLABLQA2pSNEOweiwQcq9PbVtPgGfPGoF2/2u+PB5mtod8M
	 cuEZOhUtcBU4LyanVPU2+8Sq2RpfCE/FR9608ApHmP4dz1c3/Fm5IKEG1tvvRXrdVN
	 glnLrcq744fpup6jlGqn7LK2GXv50NjB4/MItGMeCSDGENl4LMv5OY32evWxgKYJu1
	 0TeXNRlgn2d6p9RwgRYHYjSd0VEaRMo5X1ZK2p7bbe0uO9w2iSZ+Mao814uEkrnLNA
	 P58RNwmbQmumT2b3KFWKTK7g/o+RPuiTOTe0FGllxgCGqvSccpwkkkaBvXVQVIJb+8
	 LgRw5E+5F0+YlqLYsbM64Yp0sGg63NyhW17jddHNzHtEdKGzDXSdmmKeGzzTzwUhAj
	 FLObhXFy3HVHGS/REgg1H5Xw=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 85CBE40E00B8;
	Wed, 15 Apr 2026 20:02:12 +0000 (UTC)
Date: Wed, 15 Apr 2026 22:02:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
	"Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: [PATCH] x86/mce: Restore MCA polling interval halving
Message-ID: <20260415200203.GBad_uu1gC_V_LFH0u@fat_crate.local>
References: <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
 <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
 <20260406224915.GAadQ4azQ7IRsTjnXD@fat_crate.local>
 <CY8PR11MB7134050BCAA8B14BFFD8168D895AA@CY8PR11MB7134.namprd11.prod.outlook.com>
 <20260414211803.GFad6vC9LSYxGScTNH@fat_crate.local>
 <ad6-H5eihazhqsmC@agluck-desk3>
 <20260415192723.GAad_mm7YFTi7ypK5I@fat_crate.local>
 <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083E24844911D87A89BCBA0FC222@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Wed, Apr 15, 2026 at 07:53:58PM +0000, Luck, Tony wrote:
> It is documented here: https://github.com/andikleen/mcelog?tab=readme-ov-file#readme
> 
> Three ways to invoke mcelog (cron job, trigger, daemon). That doc describes
> trigger as "a newer method", but git blame shows that is part of the original version of the
> README,md from 2016. So "new" some time more than 10 years ago.
> 
> That doc recommends daemon mode. Also, there's a geologically slow trend moving
> from mcelog to rasdaemon.
> 
> Maybe we can drop it, but with the caveat that we'd need to revert if anyone ever
> complains about breakage to user interface (to avoid the wrath of Torvalds).
> 
> I could update the mcelog document to say trigger mode supported in kernel version
> <= 7.0

Or simply deprecate it...

I mean, the savings are nothing earth-shattering to even do the effort here so
pls do whatever's the easiest.

Lemme think about how to restructure this patch of mine...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
