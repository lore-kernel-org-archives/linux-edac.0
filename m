Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6443BBA1E;
	Thu, 14 May 2026 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771330; cv=none; b=RdWUncCI4XWRVgXX0Nf7FzZFi6ua4uHFCI030Um8OeGxCjSu9VV5VdPzug4VL/iJ7an2gtgr3VvxufoVyOFQUBnLDDAKHbHbaOqnvS3jHjDAb2NQv0UUXNfs+vGj83oNO6/KL+7l2alZWFA5VfplrYH1fPOdai4KtJQg8rUYhPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771330; c=relaxed/simple;
	bh=NGudfuaOZMven1qGd8ui315qJe2tl2SMqMw/kP6u710=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NA8MzfJAeLNFc18DgpRFaRL5o2gBCYZYErwVuH2w3Qg5TFQLslLEpypc4WItQpRigQXHc87/6ZF7+in511l2hdNMfVqp2vKRuQeF4dAt5X7Syy5ge+RqaNLaivnbMjuvYYmdXCXlWbTtHQ6SVfTG80DY5rt75bfHc0lf07GSNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MxN/bzIv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MxN/bzIv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8F00440E0032;
	Thu, 14 May 2026 15:08:44 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9BUznR1TH58T; Thu, 14 May 2026 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778771316; bh=schO9yguW/2QrqA66oJ07YG+2CSwqbVqCqDGLEDrPZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxN/bzIvthdZt8tDjTUMViQHD3YxBeAtKqPqYWLXVQycKVLN+3ykgN/l9HBl9RSYN
	 Pns2cwof47kKtV9k94V7FVJD6UGPXkB0UtH5I9PUG+oJSaT7W3vTm1sexQ/fV3ePCN
	 k3kIEqbJO1RUNdGXYv1xkJLP9q1xBRE5n+RXpzrzsXHSX/DTMFH7dbM3oPteDSg1xI
	 uizxn9oXAx+huI9qx5I0h/QM2/IvjDKdaog7oHw3OFTPNoOp6OokAYhwBOagmPf/FH
	 x4JTVdhHzmiceVV+XWENDnbQRexR5l6AWDwmw493bxtOjyirxrcwiWAX2De+8ERqWv
	 xNKl0fiVBUaQq3saERnBa3gnMO6HzzwXcuuhOzE5JoHXmGoDaRi9HZKQQcR1jkQC4w
	 eSXg7W9jBrsMe0n4kb7GJkiByIIdYlnVNTFJDZJ4Cbd4SFWy41l06zR4EcwtlhhMi0
	 wcIzbOHltDh/3CHKgSLWFLkJwh3+rPSVUV7j1wbOuVg0rscV+5JlTwMzLhAYq+At7P
	 zL9wFxGbua5x9dlHVez9bfvPUuvaEEf6X+NI8iZYK70WAnsz+HzIJsdvGn/l5R5RYe
	 rjctP42QKhCDjtm2AuqJbbPlUQ4bKpa9Qo4kqTm4rJYMNvTRd1vHxpkeOvbAGH18dN
	 q5ifhwLHNwmCUxI3EZ3YZ4l4=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 3BE5540E01A1;
	Thu, 14 May 2026 15:08:31 +0000 (UTC)
Date: Thu, 14 May 2026 17:08:25 +0200
From: Borislav Petkov <bp@alien8.de>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: yazen.ghannam@amd.com, tglx@linutronix.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 00/10] EDAC/RAS: Hygon Family 0x18 UMC ECC address
 translation
Message-ID: <20260514150825.GFagXlabtyupoMqn9C@fat_crate.local>
References: <cover.1775213147.git.shiaichun@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1775213147.git.shiaichun@open-hieco.net>

On Fri, Apr 03, 2026 at 06:57:24PM +0800, Aichun Shi wrote:
> Hi all,
> 
> This is an RFC (Request For Comments) for the patch series that proposes
> Hygon Family 0x18 (models 0x4-0x8) support for UMC ECC error address
> translation, aligned with the existing AMD EDAC + AMD ATL layering in
> mainline.

Please go over all review comments and address:

https://sashiko.dev/#/patchset/cover.1775213147.git.shiaichun%40open-hieco.net

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
