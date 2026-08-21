Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81B73672AA;
	Fri, 21 Aug 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787330172; cv=none; b=rWpG79T0GAIo+rt8s9M6Ow6Fd4Sixhf5gRXr6r+SDMnudblY69Pd+H64GTH8xojKeq1K9mWZVRePKxoi1WhzzKZfxrfeYIpdpdIu+SGkSEI6LPGHImO6PNfQ9Nxg+qc0SLmakUKaQyFUtfMK7eIyxBdmcuPvrl5kMVO42yoBX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787330172; c=relaxed/simple;
	bh=t0vgIUmO7V7Z4TtdqrdzWnTtdwykRpMc4ltwW+/BbWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWXVjvMKPR4v6i5Wz84muie6Mep5isTlKl+QvmFCdkTYFNxuBqSc6bTxp6whOy4B450pOD3KpZ9g2aCIgC08jCcHEam0nmo6sc37hFJhhfC50suOPyv2MkkbTSRA/mc1qW1C/nDiyoy4AvPvHHkHxV3iy00pKTbtd3QqdVdpY1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=q93paEyH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="q93paEyH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l3yNC94Cm9wddYxLLChDf9YPWE7aQABP7D8fFb9doj8=; b=q93paEyHB68FpJLNrPxtXWmUaB
	4xhfs0sUXElDO+4XCcwO302AwpaTH7YwtDWuv6+Xt5eMk9dV6qHxdXU0h+VsC1fn/esoX1E5jyPFA
	gMUKJe9vbRX3t79Ab41k9KGxzuUr35tazNJV4jGZIkA761x8esvSNk6ZHS0QyrvazSTlpb2CBrEJa
	DA/8w3VbYbdNa05DLMfsZvi7aGHcXiA5Oua2KKg4ENlTqGoZVdBV/WuKniWGIIjFCVCCRtbzrTeJV
	DVA+8AYl1QHDbhr6gSyFHmCUcGRbd3GTSHjqLumGq+fSk0jcnrciNnKvMqd/W9B7y4uleVKoSkeyN
	rnVHa8fA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wxSDT-00BTQ7-0g;
	Fri, 21 Aug 2026 16:35:39 +0000
Date: Fri, 21 Aug 2026 09:35:34 -0700
From: Breno Leitao <leitao@debian.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 1/2] x86/mce: Rate-limit the CMCI storm transition notices
Message-ID: <aoh-Pn8GH8VFMXEJ@gmail.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-1-7a465c708d82@debian.org>
 <SJ1PR11MB6083DE19F9E5E6BADF22A237FCA32@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083DE19F9E5E6BADF22A237FCA32@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Debian-User: leitao

On Fri, Aug 21, 2026 at 04:18:42PM +0000, Luck, Tony wrote:
> > One host in our fleet logged 9970726 "CMCI storm detected" and 9970734
> > "CMCI storm subsided" lines for a single bank over four days, which is
> > a bit excessive for all monitoring purposes.
> 
> Marvelous use of understatement!

lol. There are benefits not using LLMs for everything :-)
