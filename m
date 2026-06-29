Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1594A30EF64
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 23:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782774515; cv=none; b=hh8n45KaD40bMlOYhoPXL5PEiOlBduCjoxnYSJmx0Q48T+9JIaZeBaXw/6y2Bmost5I7GgXtlOwvYapkCXwAtpykCfvuUKsfkJEd1PGET4HGcfV8OzW9HGoki0+WfFW1Md/z7GDeTamHZXWMLxrlkV/UpzdmQwcpEViGQl7u+pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782774515; c=relaxed/simple;
	bh=/HydkJBDInt2xLs/NkcZ1aGYBWwYdwB3M5cl8wNnyEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tX60GYRDOHGBLIvJ90DGQOMRmu/ZAuuZH+CZ2RrJGw+gXNX8sCzS0Neeb01WelL4pyoz47bQLVKVBlfC9y4ZX/bxZ1qMK9UMwolTp6RpQEiqMrqrH1QayjJ7iMfPY/LdnPrtOeuOWXvlgegirm/CCJMw7dDQSRRJUrS7PisSi7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=O94K/Hd+; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="O94K/Hd+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6A8A740E00B8;
	Mon, 29 Jun 2026 23:08:29 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AXHmSM-qeycv; Mon, 29 Jun 2026 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1782774498; bh=UeIaK4vbx8U5hKEeuwHcmKvq00Qb2plMGIJAQwLE5vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O94K/Hd+nP2J+j9V3I6ztKEjTYtQga5ziVBmwz3Xz5mvwNb+vsGFFw+kgxq2F/0lc
	 XXDVixfurRJIkyJNwIBaDLCJZMQo0OiSBRODB+kr465XqQM7oqb0gpGjyfll9UFhwn
	 r/7z/PsK5mmVUqH4PFuFlsP1KRYzFYKxROUKD0y1CBe/HFgzFDyuPGTAi4xZh8IQCj
	 lel1+4oQG/XKgMgzd4qaHZPpaq2EHTZbHH7tNrmxhoVoyr3UIdmJgSz4wwUHOlD93Y
	 HXPtbCtSMUrCl3To9ztq7dYVpmB0D4ZXy6OIR2nUbjKUSL1V/Z6UETxJmOijkvN6j+
	 UcVwEPOBlzWJqj2Sp/l7KFkdlnunFaSK3M9LQW47ShycOQSofddz+BqOMp3Uw7HbiQ
	 l+/qS2QDMSM6iySOg4/H8vTC8AYOMo/RC4JyjlqgSyPRfWu+2TGMZyfe+El/peBjRU
	 jEeqs+0FgiBPuldqwKYp6kX/suSUtmYWslG3Asj681NNIpDXmr6WdWHVaHBiD76orv
	 L+h7EK0cpPRceU+7uApm9rnaMiMlCz++MBsKos3jMiXLlI+jOxeWUT81fNZV72Lpy4
	 awPkx7oSYsG82L+jl+WKTavMzA/wQQ/kDsc88pkKeKhUVrAlXBylNTlTP/owx5TBH6
	 Kzj3ISPW8+E+67Y7l+YQ4eNI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 01D6840E00BA;
	Mon, 29 Jun 2026 23:07:59 +0000 (UTC)
Date: Mon, 29 Jun 2026 16:07:56 -0700
From: Borislav Petkov <bp@alien8.de>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 00/14] qapi: convert to explicit intro section syntax
Message-ID: <20260629230756.GCakL6zDDd_g8DIeGD@fat_crate.local>
References: <20260629213624.936258-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629213624.936258-1-jsnow@redhat.com>

On Mon, Jun 29, 2026 at 05:36:10PM -0400, John Snow wrote:
> GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/2638342206
> 
> Hi, this patchset converts some of the most trivial modules to use the
> new explicit intro syntax. This particular patchset does not
> differentiate between "trivial" conversions and those that take
> slightly more liberty in refactoring, but there are (debatably?) no
> such cases in this patchset.
> 
> John Snow (14):
>   qapi: convert intro sections for error.json
>   qapi: convert intro sections for acpi-hest.json
>   qapi: convert intro sections for ebpf.json
>   qapi: convert intro sections for uefi.json
>   qapi: convert intro sections for compat.json
>   qapi: convert intro sections for vfio.json
>   qapi: convert intro sections for trace.json
>   qapi: convert intro sections for misc-arm.json
>   qapi: convert intro sections for cryptodev.json
>   qapi: convert intro sections for machine-common.json
>   qapi: convert intro sections for accelerator.json
>   qapi: convert intro sections for authz.json
>   qapi: convert intro sections for yank.json
>   qapi: convert intro sections for replay.json
> 
>  qapi/accelerator.json    | 18 ++++++----------
>  qapi/acpi-hest.json      |  4 ++--
>  qapi/authz.json          | 21 +++++++------------
>  qapi/compat.json         |  9 +++-----
>  qapi/cryptodev.json      | 18 ++++++----------
>  qapi/ebpf.json           | 14 ++++++-------
>  qapi/error.json          |  3 +--
>  qapi/machine-common.json | 19 +++++++----------
>  qapi/misc-arm.json       | 24 +++++++++------------
>  qapi/replay.json         | 45 ++++++++++++++++++----------------------
>  qapi/trace.json          | 12 ++++-------
>  qapi/uefi.json           |  5 ++---
>  qapi/vfio.json           | 19 ++++++++---------
>  qapi/yank.json           | 28 ++++++++++---------------
>  14 files changed, 94 insertions(+), 145 deletions(-)

Why is this thread CCing linux-edac?

I don't see any relation here...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
