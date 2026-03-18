Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75136E465;
	Wed, 18 Mar 2026 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773865508; cv=none; b=oiU5bU4wyDQ4cAgobm6Nv5AiK7upE58HgTJ/ZL5YEIE762/djeprSll3K9LQ90SCaq8xT1eNg6iX8k7ksSgyZPwmZStVZUMSBvf41hzlVND8uYs4i9Msvcns7U4AfHgVD48DqB97KPy12fQkFhbKE+mGa8NbqRIky2PimW/EyaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773865508; c=relaxed/simple;
	bh=xQ9YGDdJD3k1dqkBVgU+a4RTP9J8ucljyFOuI8Da1ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1YKvY86n7mOFm0yyK1t49h+ix2EsrlDwkPPEylBF8c2UBg150r1MVFqfw20x4E1PeVZsBvrtSBL8HGbFKlCAyWxaR0sskIRG0OUs2pFSU+VO5aPtz4I62Z1UQr7zskn7C8IyTCaUt7n5XvdobD9FVCVu36/40lwy4/+mgD0qEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VzHdycWT; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VzHdycWT"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A70F240E0223;
	Wed, 18 Mar 2026 20:25:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GdkVk7CSpgJQ; Wed, 18 Mar 2026 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773865498; bh=NxOUAXPrvXCYhEd9UL4IOuUwsXcR0/N7iIFHcVPuXDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VzHdycWTmp/esaOQvFFnYklw7/zaHAIopC7H/3HMpJGjmKxJZJdFR8ApR0J1ITZbc
	 dC2vOqxoOiI70r4Izob5x/pyijLpPc74r3T4PweGc42uyc2Md1YldehrGxeMk+UatU
	 p9/fx5HozP4k6KrBLHIUrf14UJveQLRjy+Lu/dgGo0bIdRavMfNRIaMR5LNguOScvl
	 hPrVzNA7Nh3jsAsqfumakrIqDE7Ft3Wy3TqU2ysUeDfP7/2cxzXbB/EitFaxDjqcSR
	 Pt1D8QWoijxX3SPJfOKQCInR13qQ6Ta7c8fWeThyzpcHalVwl6jfZKXJa5isAbTd0V
	 HKw/Q2IHt1azdaOFODwxgvbin6hcWS4Lgl1FtNWYL4woLyD1aTd3dTH1lbd5vrioS7
	 sGtq0B+8Y6e68lrpWxyJmRmV5KGnuJE/G2rjla2O6iRpk7KUh+AS0HbROxmWXi7kMH
	 oankuSTG3uiBWhR81czGVQWRxlg6H2vxi3mqpbSZQAJqQYm4KK8rKnKm0J3XuKN6AW
	 hRErno8GhTrpYKImLOWhw0s6HggfXiwHVW7Z+0e71Djbd2MB4IyMvrPQ/JOV5UjWMM
	 WXZ68tKOgznU5EhByyF4DikuZt1yT4XBmBGEDtzOWhhPyWtf4Qfidobq+U2MRnXGmy
	 LNy0B0v7MqZHwYaCiz1JYghQ=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4B62940E0140;
	Wed, 18 Mar 2026 20:24:46 +0000 (UTC)
Date: Wed, 18 Mar 2026 21:24:40 +0100
From: Borislav Petkov <bp@alien8.de>
To: William Roche <william.roche@oracle.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA
 machines
Message-ID: <20260318202440.GDabsKCJgemrC2MR4H@fat_crate.local>
References: <20260317103810.2492661-1-william.roche@oracle.com>
 <20260317103810.2492661-2-william.roche@oracle.com>
 <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
 <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
 <20260317181731.GDabmau8-FycDqbzZ4@fat_crate.local>
 <6b62becb-f323-47d9-97d1-b1f8c7da41f4@oracle.com>
 <20260317202414.GGabm4bu6rDjVcspDH@fat_crate.local>
 <34ffc43b-bb11-49a7-8c64-3f4abc0d4bb3@oracle.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34ffc43b-bb11-49a7-8c64-3f4abc0d4bb3@oracle.com>

On Tue, Mar 17, 2026 at 10:52:50PM +0100, William Roche wrote:
> The physical address of an uncorrected memory error (if/when it can be
> identified) can give a chance to a kernel reaction depending on the state
> (and type) of the impacted memory -- as implemented in mm/memory-failure.c
> with error_states[], me_pagecache_clean() or try_memory_failure()...
> 
> The Kernel can try to "deal" with the error. The process case (with its
> SIGBUS) is probably the most common one, but a few kernel memory pages
> impacted by a memory error could be isolated (poisoned) without requiring a
> kernel crash. Free memory pages or clean page cache pages could be an
> example of that, they are poisoned and should not be used by the system
> after that. The kernel can also return EIO error on poisoned page cache
> failed access attempt, etc...
> 
> These mechanisms are implemented for the bare-metal running kernel, but what
> is really interesting when relaying the error to a VM is that its kernel
> can, in some cases, also benefit from these mechanisms. And having a chance
> (even small) to avoid a VM crash is a significant gain for virtualized
> workload.
> 
> Just giving my point of view on why we care about VM relayed memory errors
> :)

Ah, you want to be able to handle an error belonging to a guest, regardless of
which part it hits. As in, the guest memory hit could be pagecache, free
memory, etc... anything that would prevent the guest from dying unnecessary
death.

Ack, makes sense.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
