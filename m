Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E953A1E81;
	Mon, 24 Aug 2026 08:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560210; cv=none; b=orNOhyfsENOFSJUJjZoT+tv1uqtQMROtFutcJ+jk0bXKUxHjYFLaEl6zkUctx8DtuzUncu3001cuzBlUseL6qblixK2XjHRhKNb0uohJysAXhkx3E0zkwUztIW/TyVefNQuyU93OvJvxfgt0AYfsrGQ5/dpswC2JeAqcn8hIq1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560210; c=relaxed/simple;
	bh=EmNcUE6ntNjDi9vw4ZAjOwbHBEykjJu5SLby3HaW7nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSjC50JWzHzOSL/8V1Ejun72rClJhWeDe51djxfleu/z1ib2cU+WlL5isg6hB7zFFsOH0xx/IwxjpmioYTzSSn7qdCFXc7YGVcLJ06c2jKpwKwwQdWlqOeFT/PwX8SoXbW7s6VBIeJ4FPZcumNSM6TGLdxfhXbdAPwnO6Elx9XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=mrh4Gxi5; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="mrh4Gxi5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qihzHf9kJxwgDVSR87wX0TBc1uAoNiY+X4mEXiuFwvs=; b=mrh4Gxi5n0gvWw077NNmIjkvVT
	+9WoTCxxeXJrHfArbcpfZxahbSUVFfwTH+aavWPNAOUL1E2ziu/JfAwFXTptrUIHj2wLV0LwM00uV
	PG/57jPkfHG/a9P+RbZyDTtLWnqXsIVouGgG4bhN5mZhgqoMxxpVVHJ86dKwdrkOr69d7E37M2fls
	eHiCiwfXMViNqNwJrIGbXZ5Ac4ICh9KVpgy468obekxAZ92h9/6j3lP9v0l7xMWiSxLmQe8KApAED
	tyJwmuML0cwxvbBQN+/SMXrVFmEbC44m01YhR5TAC55z4/vSJI0Qtlgt6n7GgYRNllC9jJ2X3lqKj
	zRMMMf4A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wyQ3Y-00DXEa-2h;
	Mon, 24 Aug 2026 08:29:25 +0000
Date: Mon, 24 Aug 2026 01:29:18 -0700
From: Breno Leitao <leitao@debian.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <aowABmagul44ENde@gmail.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoiBy3vg9eSvGhIu@agluck-desk3>
X-Debian-User: leitao

On Fri, Aug 21, 2026 at 09:50:19AM -0700, Luck, Tony wrote:

> > Count corrected errors per bank and add mce=panic_on_ce_count=<count>
> > and panic the host if we have more events than set.
> 
> FYI. I don't think this needs to be fixed, but you should be aware and
> perhaps document the shared bank details.
> 
> This won't count accurately for banks that are shared by multiple logical
> CPUs (you've inherited this from the storm detection code that introduces
> this problem).
> 
> E.g. a machine check bank reporting L2 errors is shared by both logical CPUs
> on a core on P-core systems, and by all cores on a module on E-core systems.

Good point, thanks. I had not thought about the shared bank case.

I will document it in v2, roughly like this under panic_on_ce_count=
in kernel-parameters.txt:

        The count is kept per CPU and per bank. A bank shared by
        several logical CPUs -- an L2 bank is shared by the SMT
	siblings, for instance -- has its errors split across those
	CPUs.

plus a line in the changelog noting that the count inherits the
<per-CPU,per-bank> granularity of the storm tracking. Thus, there may be
more errors logged than you expect before your panic fires. Would it be better?

One question while I am here: is the approach itself something you are
willing to take, or, just a just send patch [1/2]?

Thanks for the review,
--breno
