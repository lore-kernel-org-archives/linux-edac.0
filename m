Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1383F3382FC;
	Tue, 25 Aug 2026 22:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787698358; cv=none; b=lcfQ8W/4aH65wuVdOoc1BkNaCXsSPqKxTNKRab0qSBju9j2jmm2x5g8pHNi42tbzMBX5QpFIMRx2Jje18XdxHtxJ/Isgi7AKQYAl60sLy63IRKg3KsfAtsiPQi1R9Keqp+H9J7nZRMBUpuHnjrLQsZXvry5LCAx1Obv1cuqW4Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787698358; c=relaxed/simple;
	bh=+vzHyHwPNUXpdIO/2avPc8O/CEHeA7S8PpkY6LssKbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yek28/wTWiGw3i+krsMJGfZMcu82O87QxNlXEmcep840LiJEhSVDYizZvsNb5onMZpPpLyiDRbONWlsNLwysxrJpnbmL+7IOJOiOC7Tk6HIXdVxRhZawHzKAkoOtTimCO4GUgIV+hXGBJ1NR1fBFLZeLmEQHVtSJ8xo7eqg426o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c6BNbRvi; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c6BNbRvi"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6710E40E016E;
	Tue, 25 Aug 2026 22:52:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6anpS2ZUvwqn; Tue, 25 Aug 2026 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787698343; bh=Cpcfty0KKgGuEWDvGCUTxCGjFZid09/XF6xtxHcrqB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6BNbRvid9zi28mcdE6YpOPF7RZXRmMVYFbHiIX3Y8NjsNAexmLmWecJqtq07LKXU
	 k8BQinqapmEIxgpb/W9S4uKNpAcXptVT0pIOnFWyF4m7+7wLLR74M93UwObmg6SD1f
	 DBziKUjyux2jHpnppze4Wu0VXMlQoeDjdf1DWgHp2YGWR2FZWzhCyL+s3cGkc+Ueu+
	 KvztPguLg+ybeEDFNsyyliyFCioMyEb5sio4fsCgAfZ8fxavzhCFqV/XK7B0s6JTwB
	 Kzc8EO12q+fQ910uZEfcDDPyJgpJXnPhlwjO+v/FiaqBO/py9UwvWsCvA8H+7KVGqh
	 u+BbGe5OmlshCKCBWdblZk35NiiHgTLvkbhrZ19NdQDH8khD0Wua0FqD92rbgxjviJ
	 YT5umYXFoFFepsfT3Xw8MvWgnbZRAt6qhmSdKavYPsHnFAFyiLy+8oFKk7I+s+N6NM
	 fm6hLZU6a50f06OxPjUtn6w8BFl5lBsHin84F9eWL80CATYvb1edm/p4GThrXN3mCg
	 PZlZ+iclc16LPRTeMvbmqCLKh5Bgtfy0BJYL8ktJ3Q75FLrvqfWu4NymMbE4pL3L5h
	 g6G1k1HGFIRsIk9OelvI4tl8EPc9J5xyyE5aLuzqOf9i6XgrT6jFkgDl8HbmAQBahR
	 1t+KcDrLgd0KJP7CCANi7zuc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C896040E01DA;
	Tue, 25 Aug 2026 22:52:08 +0000 (UTC)
Date: Tue, 25 Aug 2026 15:52:02 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Breno Leitao <leitao@debian.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <20260825225202.GEao4ckknyv8nRc8Dh@fat_crate.local>
References: <aoiBy3vg9eSvGhIu@agluck-desk3>
 <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3>
 <aoynhOsTCcapwRbl@agluck-desk3>
 <ao2eT0TWS9EaA28N@gmail.com>
 <SJ1PR11MB60837D32B5D89336C87280A3FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825161625.GAao2_2d3U7xQFgHrw@fat_crate.local>
 <SJ1PR11MB60839657B965AC3FDA53C186FCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260825191555.GCao3p63v3fXzwa7E7@fat_crate.local>
 <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB608315809B99B7194D167D8EFCAF2@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Tue, Aug 25, 2026 at 08:01:23PM +0000, Luck, Tony wrote:
> L3 on Intel is shared by the whole socket. So you'd lose 50% of cores for an L3 cache
> issue on a typical two socket system

Would panicking the whole system be better?

> (plus we'd have to bring back offline of CPU 0 if you want this to work for
> socket 0).

As long as you offline whatever you can and cordon off the accesses to the
faulty area as much as possible...

> Taking cores offline likely needs a bunch more plumbing outside of the kernel.
> Bare metal systems sometime isolate critical workloads on specific cores. VMM
> systems may bind guests to specific cores to provide consistent performance.

Well, nothing's free, right? If you want to run with degraded performance, you
should put that into the list of testing scenarios.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
