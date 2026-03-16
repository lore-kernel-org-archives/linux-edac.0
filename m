Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB28221265;
	Mon, 16 Mar 2026 13:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668685; cv=none; b=WYDTTNHMIo4e5yGgA2XT2wUZq+yRkIiUGprK1lzP+dm7Mc1asABkEmuSU4yf9Zd5JsaR9FFrxMBAQEI4/rsycNq2ayK5Rkbk06AzTZTPOySr+lxxK0R3csCzpzFbYEixgeRqJM9n2/qFUSxva0yvMKe6zvyYHCEhOicyRY+mfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668685; c=relaxed/simple;
	bh=+tyWsYXaMekhVjg1RUE8fwIxowpzttzk5KygLc2bvdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGtfYHMoqItxwMpGSrn3vxz6HLCVFr9KHMQ8bMxAG0Hfo1JMHIyjbbiJeLrnJ77/EACktq/eDcEYGpeT9pLfXVvcszaWZyhKOqA3Ae8NhAhg8+ir4Z4KUaMiDlHFQGnDuZNESENKwOE5npdlVPqi1ISFv42ZrdHlWEyA1rWXwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A+a1Icu3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="A+a1Icu3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 51C4540E0224;
	Mon, 16 Mar 2026 13:44:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nbblGaaw-kdP; Mon, 16 Mar 2026 13:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773668671; bh=j78lam+JY/t9OZGPKKQQwXZTSMDbwXoAIDyyPO07ib4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+a1Icu3o7l8dRacaxfioiallOV0E6k8figIwLJtaWwezisWZ8+a8eJbH+FmKFkq8
	 /SYytSP9uG/T2+f6sMWaDA/r5ClyYfNuDAkqC+ARcR8k3SYXAikJr5lMJUwgRIzQd+
	 vMCKtTeaISDkyRiuWXPuJVd6sq8eHx5UE0PfF3rE01TKBjXhgwecayQOFx/mGRR97E
	 4rkDbHqkrWC4Ba/UWVkIe4YD9tma/tvj+QDB9g/nVbReP4huwR8P5bdznj85kSRlH6
	 87rM/tczlVAIf09Ohdad4u1M/PzvCfSK3HjO6rQMDxGDwt6XcUInYwrU/hmF9/2fIV
	 6bbg0KZZoZnvhEIK/OCcwT4oQqTO5sgiIpHylUxPKNpdT7D32zBt65cSQXlUq5vRhG
	 Dh8knj4z6E4gjZAFfRmIA5UuN5T+lSuSvfmnV09vYMp+DVxfcxNHT8gP4RbLOXKMpy
	 LG+jUdzr61Ph/dskVuTMBJ0yrSSJgaHe3e3mCE0Xfb8swD9q6Y5puH0SDzIbSwf2HF
	 DVHEJ8eeHuzMBKZLC9Y8K/FsWptM1mZKDC9wYb0SQxBbE1iVcjpqNzw01vlHWEqmut
	 O1x5CdSZRXdp/M5f31Finnn5S1Yn+eJZ4T637fT42nQQDJjyASuaz0S+3SajWdBB5V
	 uzEAai/o2FmFjMp9zHzs4K80=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id F387F40E0223;
	Mon, 16 Mar 2026 13:44:17 +0000 (UTC)
Date: Mon, 16 Mar 2026 14:44:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
Cc: "Luck, Tony" <tony.luck@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
	Avadhut Naik <avadhut.naik@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IOetlA==?=
 =?utf-8?B?5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXSB4ODYvbWNl?=
 =?utf-8?Q?=3A?= Fix timer interval adjustment after logging a MCE event
Message-ID: <20260316134411.GBabgJK1RFUG3zrTrx@fat_crate.local>
References: <aWbjkAPX9a9ZlJGN@agluck-desk3>
 <20260114135034.GAaWefKm97-CkbEp4P@fat_crate.local>
 <20260207115142.GBaYcnTp7maUDVv3Nc@fat_crate.local>
 <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
 <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
 <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ee87e4cb35624a5cb85741725bfbcbd0@baidu.com>

On Sat, Mar 07, 2026 at 01:18:50AM +0000, Li,Rongqing(ACG CCN) wrote:
> CEC may not work in some cases.

I actually am saying that if you wanna look at every CE, you *want* to disable
the CEC because it consumes them. Look at

drivers/ras/cec.c

for more info.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
