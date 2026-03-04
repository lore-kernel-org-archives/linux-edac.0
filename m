Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D592D8DA8;
	Wed,  4 Mar 2026 20:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772655911; cv=none; b=UDSOrqkX7uy1mdeT+8I5tQOyOT2R+maoO12niWQBRS0Do99eNKw8si9UdQV0ibS9qsz+ANYhyuL6KLZI/6Ho36WyKAfYHNV1LlLKl+GodlCGVF5PsEDLTolB5vrLSEJqMx4ETyeYgAKMGLx5q7fRi4YOh85VpwIMMmOA0B7H/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772655911; c=relaxed/simple;
	bh=vq3+5zNddjH4wQ3hoZEAsGJnjY8zRB2Vt837onfZiFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smXZZAAHXwbC9GpdSYOC++bk7A1BLt95X+UI7KVNWmk63xueSaiFUl4Tir/mBTAIwg3FQ2vWJ1ApdAn0BGUXfHw2sez0ttpulbeqLTGgT84TXAGA0If22JNZqxAXdXXNtsxG7mv1iqWSvHrTaIEYfYK9oP4RJGAlPrygHufJzRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=fbRsiW1F; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="fbRsiW1F"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1630840E0198;
	Wed,  4 Mar 2026 20:25:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EpfkwXb4Z6jo; Wed,  4 Mar 2026 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1772655903; bh=n/86SkTo8cC1brYHctDhv6B4FlHVD1zjjScvYG6/oS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbRsiW1FpUAtL7kj0DtZlObxr5SLZVzJyVGES/9LTHf8TSOEbVV7+9MzTc9PS05Kv
	 9r6LMaUjBXCAteYuEoedhqvnF2XCb34n6a84wawVdlofysJl7t9l3ZxiybsLprE/J/
	 27kz+0PEyP7oHBwB+dLxorm1wVWHfbPm6UzOKdqiA8W/CjYzgawRGdzY8JBVn32FdV
	 SRTpl1TuUjyHxGAljtPNd8kCpKYkEJheEslRAnbWTSW0HzX+jxfItVfMrCdLqn1W1Y
	 2Ltj8kW9mjyPDJENRPRK5xS1JRvnDEQlw0k+t6/JKAOCXEnyTvPaGCYbHDB5JoIEhI
	 RCPpihd8A6aMPuvVlQ7X8n3/B9SzAiIKfDZgN/ykLJf/ERLdMj21655CVk28bLVNPL
	 HPMwB/z4R3tvP5Bfx6B4Shk8r8mdH1nJ8OFZIDy3oyJSbJ8zLblBI1bS4MfV4YTgFD
	 BrpxJUmA5mj+AUC3M6KYed3Rvg9SjgFkMFDXd5SwXCFCRf8dnBarO+bfgNxNRvJU2l
	 /Cw1M6PhycNYHYE5kjvfYNXWJgIx9G17vTyy+IudH9HUq3R2KbEG17GA7M/7qKWz6C
	 5D8mvH0J/f4DRzV6UVHzX2sLs6Jq+snuW2IaWcDWDcc31SDZa+KcFY4EWVw6rQ3Ihx
	 QpQ+SEvDgl4cZ4ZwMArj/8vc=
Received: from zn.tnic (pd9530d5e.dip0.t-ipconnect.de [217.83.13.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 618B940E00DE;
	Wed,  4 Mar 2026 20:24:58 +0000 (UTC)
Date: Wed, 4 Mar 2026 21:24:52 +0100
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH] x86/mce/amd, EDAC/mce_amd: Add new SMCA bank types
Message-ID: <20260304202452.GCaaiVFDSSQbb4Zyfy@fat_crate.local>
References: <20260202172158.2455749-1-yazen.ghannam@amd.com>
 <20260228150447.GCaaMED_7sbC3OvDsL@fat_crate.local>
 <20260302142255.GA145106@yaz-khff2.amd.com>
 <20260303153814.GAaacAZrUnFNBhPq1K@fat_crate.local>
 <20260304150402.GA807247@yaz-khff2.amd.com>
 <20260304163953.GAaahgWQIZ5QuxLDP5@fat_crate.local>
 <20260304180220.GA980523@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304180220.GA980523@yaz-khff2.amd.com>

On Wed, Mar 04, 2026 at 01:02:20PM -0500, Yazen Ghannam wrote:
> Though maybe you mean "sorting based on HWID/McaType" is not important?
> I agree.

Yeah, we can sort by IP name and not care of the numeric groups.

> Okay, I'll work on it.

Thanks!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
