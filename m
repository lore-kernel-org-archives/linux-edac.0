Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689B3CF67C;
	Fri,  6 Mar 2026 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810984; cv=none; b=rcHPGcNyLbFy+kO/iY+sdZAt3vmHP/IXcKXhC4CXiRFt0+RlsVBcAW5kBVmFcEPJgEt9nTSQ8KpLC3I4pIohRDCGWYM7+ccBcZPmcH5C8E7PSEoggTiLeA0CcFXO4ShgOfWxnZ8iaolH4TRlxkqW9JWyR6mXSA67ANVokfb7hPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810984; c=relaxed/simple;
	bh=vx8Zb9ez6ccWpYwC7oEsQigNbrUQ14FWw5HQdFPbwvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOKPpPT1iKHtOER9on1ooBgla38dQtoaD9ROVmmHrevGFV0ta8gqIk0cLbugbXCvXmMEZFkrh+FqoeU2eU50Y6cJs/xcCwihOtzytjVXSkYxh8CueDXRFA4hvSN3uyauO++ClKxLozWYmLtlK888lcgdmlsp45rsgW4RVPcDcKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RAkSERgj; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RAkSERgj"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9C39E40E01D5;
	Fri,  6 Mar 2026 15:29:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GijkFDxWpwcI; Fri,  6 Mar 2026 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1772810962; bh=yKngQ7jSd/6EpEmyKhNYol4z5EduuEenjf1Ja4xVKDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAkSERgj2Nj3pHNFV9uPtKZlfr8HwjPfjN+G2xvh9ySUfXiM/C73LR8U+ZRHrSP8n
	 AvyZusguaaQjwhVRFFd0ZDbU4tbWYq0a0a9a8PRBRtdNSbzM8Bb6QCB0wzMhLbZj9z
	 3EEj1DHRwKdqQhWqrzOjiwe+WS/EdR6IsOkGNm+x/DOms1RUBSZSUNtVu0dxD78YCW
	 nL/O5MZxYVZUs7Qrlml6h7Fp0ZN68r+JudL9LHSIKVVtoFcSRXqc4BEio5rWZUDWE6
	 7I+OA+02qZZpGLp8TMyqVnKjc1TtRTNHj08HqwkoA5HRN7Qfj4s30o2QCFLuxtV/ZV
	 2bh2XSyqwqQqfQ9gbLdrnKCHqYX6G3L6vw6MePyUyuONb14wONYtE/LhGbUKDOC/mS
	 1izlx1VqbyQ3Eaf/IryqQa/xK3gJiajhUPhzs+2z3WMuY0KlCyni3EwmgCw1stvKRS
	 oIjuUAjuMv4K4+tG5Kr/Ny9al/RV3ONeIV1Poe0vaUsijVIhLb2Zth7GM6LVZ+0Npa
	 w3ol129PFhpyfERrbvjbg/EcGIfeoLSYGoLHdA9eeVLIvo+3H/nlAC+DGoBFWxD8Fn
	 wExptFI8TP2quhocP/xEMzq9jXyW9NJCYweznRKYdgGJX4tCJ/wWnhqm39viN86Avy
	 2nAkuXeHMehhXIFsPFVUytr8=
Received: from zn.tnic (pd9530d5e.dip0.t-ipconnect.de [217.83.13.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 1343940E019E;
	Fri,  6 Mar 2026 15:29:09 +0000 (UTC)
Date: Fri, 6 Mar 2026 16:29:03 +0100
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
Subject: Re: =?utf-8?B?562U5aSNOiDnrZTlpI06IFvlpJY=?=
 =?utf-8?B?6YOo6YKu5Lu2XSBSZTogW1BBVENIXSB4ODYvbWNl?= =?utf-8?Q?=3A?= Fix
 timer interval adjustment after logging a MCE event
Message-ID: <20260306152903.GEaaryvxD9BTT7Fd10@fat_crate.local>
References: <20260113213158.GUaWa5zunSfuAzra0n@fat_crate.local>
 <20260113224152.GVaWbKMMzManQ5WwlT@fat_crate.local>
 <aWbjkAPX9a9ZlJGN@agluck-desk3>
 <20260114135034.GAaWefKm97-CkbEp4P@fat_crate.local>
 <20260207115142.GBaYcnTp7maUDVv3Nc@fat_crate.local>
 <aYobX83_0kElO3NZ@agluck-desk3>
 <20260210150117.GBaYtIPfsP0Txw7iIc@fat_crate.local>
 <3748e8c7057a4182bc2a361b44dda51b@baidu.com>
 <E4BFF14D-85CC-44FA-A217-603C102B1D66@alien8.de>
 <3431b52760444d209f8460059264cc13@baidu.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3431b52760444d209f8460059264cc13@baidu.com>

On Fri, Mar 06, 2026 at 02:38:29PM +0000, Li,Rongqing(ACG CCN) wrote:
> We anticipate potential UE issues by analyzing the volume and frequency of
> collected CE reports, enabling us to perform proactive task offloading and
> machine maintenance. However, inaccuracies in the collected data are
> currently undermining this approach, making it difficult to reliably predict
> UE incidents.

This looks like a canned AI reply to me.

I think you wanna say, you want to get *every* single error logged. Yes?

So you want to be able to decrease the polling interval if necessary?

Do you also disable the RAS CEC?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
