Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3104369A;
	Sat, 11 Jul 2026 02:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783737352; cv=none; b=iYNhGfcNjf7UAuCkVA9mzzV2kMCw/XaltDulobpcN4VeH3vepN45q8KKO6StljxbDN3lJB0UpdWMSmJ3hoWckSEPMElWTbsRjBGGOlHCR5SQp+prcV1tHcPt5/8LNiNoFlMOcp0QOpacTL27rhUf+9RZYy253baNX5wpSyX2a78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783737352; c=relaxed/simple;
	bh=7rkKizTNFdx354ngEYxnf/lT8kPO4HrYHqDzPUkZodQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNfBwkVA5KwERHywJ6OtU0Zwo4JvC8veuimQkj43Wfj04tQyE+JGhPSYAxbPNNXLwrDQTiNIPHYMHxsRo3RjlZ2pbjV5UNYwC8N3Az1V+Gx8m9CZl6Q4/A/gjis8m1lU7kXlsBnlp7wo0hnmwm+rBHdIuAegnxvCpsy54YbmmIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FADcE49H; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FADcE49H"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D2B9140E00C0;
	Sat, 11 Jul 2026 02:35:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9bACJhFrU-5O; Sat, 11 Jul 2026 02:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783737336; bh=A4MXgorkWGe1Wrt5htyix/AGvs0YZUHCF0cVy/5MmLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FADcE49H+1TZcFHYx7YkQY7RxuS6qfVaJBWyECOtlGEHhX1hua757+JcMkM0Uf9lA
	 bXb5tzdn5X7aHz7v5GSnRwfDkgrWjifvtuCDa8qX+4OiuMFdVipkzUvdQYWJucNdwv
	 OeGosEMVSSpB41v2t5zfS0u0qe6z32OcvcD6QWKQiRJoqizoR93jdInmsh9cSS6MVO
	 vcncihew3qikzHcO8WKj/NY+B75oB2TC6SOm4K4um4tnjzwR1IyM1xlCdudIP1v/66
	 pbzhnwuXhAnRJUc9K7Bkf7zZzhC6YcnxByXtX1Qi3ZpeTmVEjIx6hoEvwHGtS8UfG8
	 d02y22kyBmZQ6MdyT9y5DjWMku95d9ozQkR0XyAvV/qZNVnFDXa9I0zDBpBZfFJplO
	 1aJsJappa8LSGncJsyv5qDa9ltrKptcWo9gyqdJ/CC2esRAcaCherzM6PJf4KxuCRL
	 L8IgQhTAzw/jY0ZCzVVAiIUv0NltY1xQ675u2cV8O0MeDUY4oh0j6NpN2ZuzXcNKoc
	 +Bzh8cWgtW/T2tKw3Um5hAnjnxpKO0aTFZL3A0c+Bcxb5XiRVnJb0j9vJvrXgrZFAW
	 bAFv2VvKgDSMYttBIVozAS33Jk5uqR08WmuOVTgwDvEu3u8QDhvjzh/iSxjbwUef79
	 MK3RXZ+RpbGGs/AizpDOyBYc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6208040E02B0;
	Sat, 11 Jul 2026 02:35:31 +0000 (UTC)
Date: Fri, 10 Jul 2026 19:35:27 -0700
From: Borislav Petkov <bp@alien8.de>
To: Rounak Das <rounakdas2025@gmail.com>, dinguyen@kernel.org
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
Message-ID: <20260711023527.GEalGr7yqKN65ftvjF@fat_crate.local>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260708091135.94114-3-rounakdas2025@gmail.com>
 <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local>
 <CAPYTKoMLXheN9HjQEPNtvK_JCJfZY6HabrC27UGVnHzC2zDbGw@mail.gmail.com>
 <20260711010038.GDalGVtqJ6MDh6fYxV@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711010038.GDalGVtqJ6MDh6fYxV@fat_crate.local>

Ok,

all queued:

Please check my merge resolution:

https://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git/commit/?h=edac-for-next&id=0e95b82c43b27ab225173f13cd230642c5b371ec

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
