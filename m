Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C58421EF3;
	Tue, 26 May 2026 18:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820888; cv=none; b=S9cQ4/RLHnVkLZdZuchXHSqWahtBv3GZbzcgG9seRpD9BOoMlKcLR079AjjwwYWUMhcRExkqcqjQyQrx1P8UVCX1fIyWFgFnq1zHY7/0lt2EnJZ1byWExt9/aR8MlW12wzY0xxtZS1z7OSE7xpE6nrwLWwdQ3q5tCTw+wX8Sx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820888; c=relaxed/simple;
	bh=2SRbCbcXR53S4eTb+MvidBaVbQ3oMuiIzaZGwKIDDYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2iVOyI5fqzisf52xV/lNiISJXCH++E1eN0aArLqwttzNHxME1s7zkqM+tcRtxIR6e602ZMV6shTK3M4TWkOLWnd0qKHqkxjf2c9k5BKRsnxrV1nZlOIq4snOEc7N8SMcoXWuSttCKzyDmSgyQN4flPrDHpijHYxVC7zQ9SYEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jtgjFw4g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jtgjFw4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F231F000E9;
	Tue, 26 May 2026 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779820886;
	bh=rbxp5gHuJrWwEJEoYUSkBTYBQtdh3EBXIsBn5MxUArQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jtgjFw4gCJa/pmQ/o6ujH+iol1BmS0ldajdPzyylTrVTl9DdWetcj6OSLmDNHxLuz
	 rciF+e3NZ/0n8k1iNiVb+giWweZHLozJsCeQ14gJinO282geYBRbmqMoriqBEQbVTx
	 7tnBIyLaPwZSMpw9LMPSGj2dRuewxyIX8b99YZq4=
Date: Tue, 26 May 2026 14:41:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Prabhjot Khurana <prabhjot.khurana@intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Tony Luck <tony.luck@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Drop Mark Gross
Message-ID: <20260526-arrogant-lime-ibis-3cf01c@meerkat>
References: <20260526173806.3227828-2-ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526173806.3227828-2-ukleinek@kernel.org>

On Tue, May 26, 2026 at 07:38:06PM +0200, Uwe Kleine-König wrote:
> Sending mail to Mark's kernel.org address results in the intel mail
> server rejecting the mail. So drop him from all maintainer entries.

Looking at the mailforward configuration on our side, I see that there are
actually two destinations for markgross@kernel.org. I've removed the one that
goes to his obsolete Intel address. 

I suggest we actually keep Mark in the MAINTAINERS file for the time being,
but change his INTEL KEEM BAY OCS ECC CRYPTO DRIVER entry to use his
kernel.org address as well.

-K

