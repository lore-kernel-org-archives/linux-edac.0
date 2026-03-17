Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99AA386457;
	Tue, 17 Mar 2026 20:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779081; cv=none; b=fAKVm0gB4kh3afHLcp11eZnDHRSSebHrHkD5qmNLayXFaSBIDGKpqfBlWUWqews1S5/+Qd0oqwVDC1kiTJlCS109KZXGfnm9AbREEk4MDdKnVMd5/ppN2M1s1l5NWbfpFdEzftYpEWMXd0s+K4FjwNhtYgs7GzlGOTTzM3zp+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779081; c=relaxed/simple;
	bh=o40es9mQcUh7jcrU3s027xtkUw/tYY19eBxGNWwI08k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsQwc8Fl/s4zxYwGfy8jJNKEcHkxkONGKhqpkm8Fth5WHPZasOvkFszr9QJj4J6sy88xcE4IdoNNmRWLM/XAOyYnrN4K+EaOKPAZKE4RzxymsGBpmDVOQ6fkTmQ7jgHYml9K/zzHSCmReUr+kAOqoiOG18ovWQ6mErI3q1G3zh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ATri8JHP; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ATri8JHP"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9B51340E0223;
	Tue, 17 Mar 2026 20:24:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ahxUkdukJRwQ; Tue, 17 Mar 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773779072; bh=mXAHwr9hFD0yu2WjhxbgWReeoIkVfSWfNqd6oOtekos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ATri8JHPhdeEIIKOQXLYxrvE6wIuvcyAX/Qy7KInGGRIHCRLHpolONu+7HkdxvtAM
	 2PZRsQRXisKdaNa1n2Wa5Xi5CPcWrfFMhqYNkiNVxpc48YCjNT5HdjpneaHjkHSqUf
	 XMyd0jPqNA6Qv+li4XfUcI7uuiEVE/Dq03h/W6tH9pSOOOixFaTT68NqZdWhGfw9e7
	 UFaEJSjzDpup3KjnIQDO+z2VWI8+d5RluOa3JZrYIekywurnI2aoNQEbIeRCYkWs+7
	 ofnX4+q7sK9yNeKOMzc4AxH8/WHzQwFMQZ9LYyWjU98EN0NNrMMRqcZPPjk/oAs359
	 kyElXESoZkXvTwOyxe/fjMbSs2+r8B7WS8Tc29FSqSRD6/oGAj2vexPRvmDpJM7XFI
	 wi2hjM2BFdbIP8vhZSXbW2FPCbGArcwvdwEeY3kNuODumQy+RKcYkY61mK09USdZnA
	 qHlKZi8HMGjolBnCvgtBbF5OoVHz8NzCRhFibZYc3SRucmkU/Q/sBSEogs/39qvDEs
	 tVO6FaEqmUeUdFfm9haBouD2cc+CNgcbtzYPL7tgN4Or8N5YhYA4Ongk2t+n+KCADK
	 ouqhb+bMXVC3aRVbzYZH4woB+tRHSW2BbNTKhj0wVtSY9wT8U+PszwXcLhro80Z4f2
	 CZa79EISSJXDNcCTtJ07W5fw=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5BCD340E0222;
	Tue, 17 Mar 2026 20:24:20 +0000 (UTC)
Date: Tue, 17 Mar 2026 21:24:14 +0100
From: Borislav Petkov <bp@alien8.de>
To: William Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA
 machines
Message-ID: <20260317202414.GGabm4bu6rDjVcspDH@fat_crate.local>
References: <20260317103810.2492661-1-william.roche@oracle.com>
 <20260317103810.2492661-2-william.roche@oracle.com>
 <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
 <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
 <20260317181731.GDabmau8-FycDqbzZ4@fat_crate.local>
 <6b62becb-f323-47d9-97d1-b1f8c7da41f4@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b62becb-f323-47d9-97d1-b1f8c7da41f4@oracle.com>

On Tue, Mar 17, 2026 at 09:06:54PM +0100, William Roche wrote:
> Relaying the error to the guest doesn't only have a value to target a VM
> process but also deal with free memory or clean file cache memory impacted
> etc... Cases where a memory error may not crash the kernel can benefit to
> the VM too

I don't understand - what do you mean with "free memory or clean file cache
memory"?

> There is also a small typo in "pinpoint"

Ack, fixed.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
