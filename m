Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279D42E06E4;
	Tue, 25 Aug 2026 13:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666154; cv=none; b=Y61XZ27p/kVB32gQCpXuqCwECpb1MFYFMtOBK9jgb8HMpe59YnlxEp/niPLEslK91bgsv9QIfGNcBKAj/jd45W63gvKOjF9ndODPIg0G17OOo1Op9WhsZzCc36zPciFHk8WORKNx3+j/utW9aUSrhxyGAKRO2doaEwdXpL7C6lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666154; c=relaxed/simple;
	bh=WV7ZKfc57R1h07KEujcR3VBJsySVYK9ucjdfQOxMXbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntUC7GwFfvTSEU85+kYbTfmq1gCplDxQGCRlLfHOLFJNzgq0jwN9ChMK5SkmsbJ6PWI7Txu4nyX4dh41o1AffPnpJ4UfQ4oqgEVVNyHSjCdrAXFdrxgd21VMItBffNI4FDBvaktKMOytlFHtEI/J1wTomj5LWZDRVnFBvI8rrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=GiZ30reH; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="GiZ30reH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TjjqjEpzxYB01UoCtPgF1I9EB9x/HHgMY1vNhU0Lf64=; b=GiZ30reH8cnGvbwx7GtBcob2zb
	b/IlDL7lpHzvXb8yjG+YNK81QIcirrlcnsc3FdClPXFYgI8HV/CNxKbnYYN3mhhiZFjvap8mqYGyJ
	pszJxT/As15PSSEzps2snsuH9rE/S6r9IQ3EZ+wHpu05+YiIM3izk8V1mOxnF5HcQIiL/xG625RKz
	vnLYBhgFvykijc/UggwDUFDeFcouLoo74HRGu15+MI6Vi+iMdYfw6gSuPlBUYSdQDIcV0coSSOHv7
	/K6PIbI99MYQQJWs2yLGsxJH7JWMHHeNs+PXYTfHxvRQIKunkTAgBpljE8tFmkFwAyQ6BQjGmF7Nc
	WsVuybmw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wyrcX-00EU9Y-2E;
	Tue, 25 Aug 2026 13:55:21 +0000
Date: Tue, 25 Aug 2026 06:55:15 -0700
From: Breno Leitao <leitao@debian.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] x86/mce: Add mce=panic_on_ce_count to panic on a
 corrected error flood
Message-ID: <ao2eT0TWS9EaA28N@gmail.com>
References: <20260821-mce-panic-on-storm-v1-0-7a465c708d82@debian.org>
 <20260821-mce-panic-on-storm-v1-2-7a465c708d82@debian.org>
 <aoiBy3vg9eSvGhIu@agluck-desk3>
 <aowABmagul44ENde@gmail.com>
 <aoxxxmM-xIpyAE_Z@agluck-desk3>
 <aoynhOsTCcapwRbl@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoynhOsTCcapwRbl@agluck-desk3>
X-Debian-User: leitao

On Mon, Aug 24, 2026 at 01:20:20PM -0700, Luck, Tony wrote:
> > > One question while I am here: is the approach itself something you are
> > > willing to take, or, just a just send patch [1/2]?
> > 
> > Boris is the maintainer here. So he has the final decision. My
> > opinion is that this is a bit niche for the kernel. Maybe this
> > could be handled by some user agent (mcelog? rasdaemon?) to
> > raise awareness to system operators about high rates of corrected
> > errors.
> 
> I chatted with someone internally. They'd be very interested in being
> able to see these running counts via some /sys files.
> 
> Perhaps your use case would be better for that too? Rather than:
> 
> "Everything is fine"

Sounds good, I will restructure v2 that way: export the running counts
first, and add the panic on top as a separate patch.

The count is already kept per CPU and per bank in struct storm_bank, so
the natural fit is one read-only file per bank, next to the existing
bank<N> knobs:

      /sys/devices/system/machinecheck/machinecheckX/ce_count<N>

Is this the right approach?

Thanks
--breno
