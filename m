Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460325;
	b=x0tInyQwopOXjwFUdTrWAfaI8Y8B5exYHa185Q3GpH7DVRUPF83Ie9p5hOEP1apOn36L
	 KaMMg7l0kghzKXFJrsvVsaczAos1pq4KOwP5RAdpuCxtOUw4nmSAQAuO1GL5RSENi1UKa
	 FDeUaVGgK4pNwAK1Xlw5f6g+yWhHWu6TFkigHlgP7MMdvo6Ib/pjoCjypChJqe0UbAjNg
	 nJqJR8atNrVpl9tIRDBC4SQWYSt7pImgMovwWiz9P48xufQBMU0OtxSxKyy56nZB2oQqt
	 y+2WApjrfPChQ7uyhLmHpUMkQAj/PKv8/0FxVG2GS8/wfbkKgK8cKQg7zxlYxHCZ8NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460325;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PnhFeaDAx5cJv/4+vjN1xzPqNadqUwHGIHWrxGIv/XU=;
	b=OWY+WXCbC10SAgMf+Db4lNOb/uFWI+pDd3q1yIKOb1P8GO1uRfM7B+VpYzXrJEJgwd0b
	 ADErclOuWXD/qUW//eH+zOYWxCHaQZqnJ9Lz5SftD9bx28CIS5S+6yYxBwppM/DtPsIrl
	 lgC39RvjR1j7OjkLLhWSrg8SrjjiKUmsV8KZG6o+rMCGyQiQxch0qjmty6iU3f3LoYq7h
	 7auAJq1QGSMd/rvDmn1wYSpQ3mixJGynkIAnFOkg3qP2fYQg6TNlD0s2mEhxgQDYbSaCt
	 Bt5zFkwaLJIAq72MVZeck7QwnP6Xk/Fm2iUrf8mAg+wkIJVkQRyNFiG8WOw6puBLvPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KlBXJNAy;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53091606A31A;
	Mon, 23 Nov 2026 18:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53091606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=KlBXJNAy
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5D95140E02B5;
	Mon, 23 Nov 2026 18:58:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9HmK-X4lwo5t; Mon, 23 Nov 2026 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795460320; bh=PnhFeaDAx5cJv/4+vjN1xzPqNadqUwHGIHWrxGIv/XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlBXJNAy7U29DTlzGqs41P9pVfYIO1NrsdOl9ZRMfxLYQifDHTN/LNnWEeQxBBIKz
	 LSP+UqDHE7GO4bTS4rahJVnGiDKfX+c7t7LKBlZFvfrGtqi3wDKy7iHnbxPEV2L3kU
	 eFb8yLxe+qiRQRsoCS3kQjj7dgVdG/Wr6FI4DmAP6zsB4nVKaQHG3j7LP5mPqJSveq
	 1/RG6Kp74t1K5RX5Ni067jguVextKAcc5pNTJ48uJhZFbD5LvOpDFH+SsA83NaNM86
	 WGYd/3si6J2tEDzFerOOpfgV9psbBMcrXDcdeWjupOhEivx1ljX3Pu6LgubMRQHQz9
	 x8pPqwWXoPs8QEWXY9Co5fI1nM+ngIwcl4wcXt9Ui0npGlTiixVqh7cta6tZQb0YQP
	 A/XUHJqacrz45/QnGfKPGFAlJ9qAks4DWKv4EEtLhzNyCe6IRbUCdWSmxDf3EZyOMs
	 pbfvKgNWnLtr4VVF4X7uKVuIuwjgR883mOBf7QlF0Zh7r8k3214nVY9e/XfpYq/CRo
	 H3DDpRzON3Vfi3/id5q7tz/5aGnF/xrLkwl5pjsrc8MKLp8noYqCg+5q+7ZuRBQNar
	 nOMAqay4QJRtj5Ppdf4czMir0QHFbHLxxN4XnXW9Uh9bvf5ZyRf7LGY4+Wt6sVQb5D
	 6l6/rS76K5sWOKoqfJEN7m+s=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7B2D840E02AC;
	Mon, 23 Nov 2026 18:58:34 +0000 (UTC)
Date: Mon, 23 Nov 2026 10:58:31 -0800
From: Borislav Petkov <bp@alien8.de>
To: me@ahmedabdelfattah.dev
Cc: Tony Luck <tony.luck@intel.com>, Qiuxu Zhuo <qzhuo@nvidia.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/mc: Convert the poll period to jiffies when it
 is changed
Message-ID: <20261123185831.GBawSM1xcZErfS1dNH@fat_crate.local>
References: <20261123-edac-mc-poll-msec-jiffies-v2-1-0407cc52556d@ahmedabdelfattah.dev>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123-edac-mc-poll-msec-jiffies-v2-1-0407cc52556d@ahmedabdelfattah.dev>

On Mon, Nov 23, 2026 at 12:55:29PM +0200, Ahmed Abdelfattah via B4 Relay wrote:
> From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
> 
> Writing edac_mc_poll_msec at run time re-arms every polled memory
> controller through edac_mc_reset_delay_period(), which passes the new
> value to edac_mod_work() as it is. mod_delayed_work() takes jiffies, so
> the first poll after the write comes that many jiffies later, not that
> many milliseconds: at HZ=300, writing 2000 puts the next poll 6.7 s
> out. edac_mc_workq_function() re-arms with msecs_to_jiffies(), so only
> that first poll is off.
> 
> Before commit c4cf3b454eca ("EDAC: Rework workqueue handling") this
> path converted the value through edac_mc_workq_setup(), and
> edac_device_reset_delay_period() still does. Convert it here as well.
> 
> All other callers of edac_mod_work() and edac_queue_work() already pass
> jiffies. Name the arguments after the unit they are in: "jiffies" for
> the two workqueue helpers, and "msec" for edac_mc_reset_delay_period(),
> as edac_device_reset_delay_period() has it.
> 
> Fixes: c4cf3b454eca ("EDAC: Rework workqueue handling")
> Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>

You cannot retain a Reviewed-by tag when you change a patch considerably.

Before you submit more patches, I think you should go and read some of our
documentation first:

https://docs.kernel.org/process/development-process.html
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
