Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302112CD8B;
	Mon, 15 Jun 2026 02:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781490418; cv=none; b=IkTc6eXrRGAdPm+SlFxXyUZBsOUfNaR9enA5WQKIHQs7GInyPTIUkt1pEWc7eWbiaymq6v4REGw05ePXzjWD7GHPr7VvVAtWOFK+U/4vgqdtNI37dK+uCI+vaegtAxkP4JnYyzILZNcJskqjheburvNFL1CAHS3z6tHb7UamO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781490418; c=relaxed/simple;
	bh=U2So8GmUcUWMe8Q3vHy2bQr1WKkjuYV9FoEK1qDBy4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qO0ZvK4+w281ymCvknpzWefcNz/xwO3ZiGaA/JQ90ynYHDNE+iqp3zLqMrFjssHUPRqq2PDZW8GCeQ3sA4N9Mp1d51lQjw5Vu96TGHl3ZuuSLxWyDJc5FAKibGLKRb74aObqjvfXVdtpUSPQ7dIdrdH7FV3MFUlvmkvUjnm7UUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lC/ug88v; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lC/ug88v"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BF66E40E01B5;
	Mon, 15 Jun 2026 02:26:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4Ffh2WgAw2qU; Mon, 15 Jun 2026 02:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781490393; bh=7HyDw+5kjCclJCrMXUDED8VuTOqhYAhA2XkeUQqDhaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lC/ug88vkUPz0/++ENyCHiJEi4IqqIMUOVus8UorEntyVnRJzY655ou16AAdKqOff
	 NoUzB5hP1PEZCgVx01cwWMygZwcDa+iyEdXX1RAPXeeck42DLlfSEBQ9NqSPwhC7KU
	 AsL1//tBgkdn/HyZoGX/jY2qhT8PG4o11GNfo+++qTt/ybH8zTFzxDak46yhIXLrtZ
	 K7dFSaXuV9DHl71eZnAA0c+c3SoVUQjjfEogionTBLZYknYjpX9IFx7KYJ8F8nQnys
	 hLm+mvYX4S6d89JbNTQn5/wmWinx/3ZOqJQ+5bia5tQ27rZ0UG/AisW6ZFxMYIgQpT
	 THUc1JwQqaLeZRO3rzjNuERR9c7A4ht+3zbWtDJGpngO5nC8oV0FJXxCLMtfTSfl1S
	 II1HvFi53rOZYnXqx4n6lqFtlVjDcD793w61QnkoDGlfYkWklKPmoOJzeFrPX5ekM5
	 L9GzH+4qOl0OVQ1C/GrOeyI0ijmVixRztErT2viw3m/oBELRKqYsB+8oi2/yg4sP2B
	 IXhydXdZY0ZnuMYH74CMNBBhaDAbt97kUSJ0ogkZpQKr57SPvenr/uXGmarHzPc4Pr
	 sqyvbFxkxB/aR9AAZKc4C+M9GWKdJ0C2H/qgCraDi8O9L+CMZdZGST2juPxjnib0ir
	 2oOacHRN0Bt8km+8K2H4nEU0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4701540E00C0;
	Mon, 15 Jun 2026 02:26:28 +0000 (UTC)
Date: Sun, 14 Jun 2026 19:26:25 -0700
From: Borislav Petkov <bp@alien8.de>
To: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Yi Lai <yi1.lai@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] EDAC/{skx_common,i10nm,imh}: Move MC register access
 helpers to skx_common
Message-ID: <20260615022625.GAai9i0Zb3_9TVwIRf@fat_crate.local>
References: <20260521073112.3881223-1-qiuxu.zhuo@intel.com>
 <20260521073112.3881223-2-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521073112.3881223-2-qiuxu.zhuo@intel.com>

On Thu, May 21, 2026 at 03:31:05PM +0800, Qiuxu Zhuo wrote:
> Both i10nm_basic.c and imh_basic.c use identical helpers for accessing
> memory controller MMIO-based registers. Move these helpers to skx_common.c
> to eliminate code duplication. This change also prepares for an upcoming
> patch that will move RRL(retry_rd_err_log) code from i10nm_basic.c to

For the future:

Avoid having "This patch" or "This commit" in the commit message. It is
tautologically useless.

Also, do

$ git grep 'This patch' Documentation/process

for more details.

Also, there's no upcoming patch in git history either.

So please formulate your commit messages without referencing some patches
which no one would know about when reading this commit message in the future.

Also, in all your commit messages, do not explain what the code does - that's
visible from the diff itself. Rather explain why the patch exists.

Just several of things that I noticed while preparing the pull request.

We have a bunch of good suggestions here

https://docs.kernel.org/process/maintainer-tip.html

and in Documentation/process/submitting-patches.rst

Please read them and pay attention to that stuff in your future submissions.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
