Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004284457D0;
	Wed, 22 Jul 2026 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784745993; cv=none; b=bBqCwDgO2iAwRlYjcRSv+OnaUszkjKYgUWiXpaxyI7kGDQURhQbJ0FFuIpSmsS4MqFepXdBiN/0llJDJXi7nh7GLa5Um8lu1sThPOa2Z8gDgoJ1a+mvE7ZBwAmWpo2XDNy5aEPKRZiIit4PeTrnxDFU4x2RPTP/x8vaoWuGLs9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784745993; c=relaxed/simple;
	bh=ylSzHqIMCu/5zLi7ZTVQsDsN9sKSMXP5Lt16kbnlt/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hejvf95SZEmw0s0qjCugNJw/OjUfrAXqOKEJZdD9GCDKfC9lx1ZZhCXmukvf+8tcgu2vMwWBC6CkitwJhgkzyT4kp5Rp4gCYrBsTNScgXRhMuiEKaGqPSHm7WyJDKn+JzcPzla9TKzGwMGjzbagpFe9WaOUsGHo7exJ9qtWwpf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OHQf74H3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OHQf74H3"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 05C8640E00C4;
	Wed, 22 Jul 2026 18:46:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AGPEzJubC_fI; Wed, 22 Jul 2026 18:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1784745980; bh=MJDW+j72EU1AcYvlahkUfdED0jJZLTHFe46cGGwnkJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHQf74H3L7pzBrF2KPorxWjf58QKVuqjPRTndQJAqeovn7Jh/34dPFJ4y7G5D3Ud0
	 67zdnyGmFmGdXwQwJnv5x853DN291sKLG86sRWCfKh1S6iL9WaC7FzeEQd0A9xq2ip
	 lM27SEO0L1EH4F1vGxSffJZkncHurNGwK6+l2Af54AK4rqs9RI6T9jgK4ioIkbwL9Q
	 W1/IWO1cf1O1pZ75/dgAvqjlFNLN+oBt6jIzOZ92k5taR3GqyRdarARU9DVhvc/tEw
	 RqT2NheySX4LOJXjY6nP0ytxAgRWVOGHLGCsk2Ev2x2t69WRMfTSahLNXZxXvh3y99
	 6QwsTQKKUAjbwyy6iyEL5yIBtSZkcL+ljl24Nl/0CJfoehDlse3rBlppQkgROeIT52
	 RJEx9G9LEI0VbYyDp1Stkp/ozZtxrcFopwytIB7/aqxnaSR7z7hzbFbcKUAoDRhOnO
	 gZE2OrdJgy4rgvhNv/Sah0RnJJYnzYHNAaQwNprMWbJjqarjQcohV/yWDO1ZKyCmk1
	 FVQTX2c9AarLA0zn8UQu0xva13mNtiS7HzYD1ClB1jYiDOTkaFbrsWwmBevqyXl1WW
	 iRESfpvhLKDB+kDIbzAh1+wUvGC7/3CtMQsrIjUunm2tQJ3VHP8A5bT9fDyNs/Q4iI
	 TAXv2eA4USi4qcd8/4/kyq3I=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B979340E027F;
	Wed, 22 Jul 2026 18:46:12 +0000 (UTC)
Date: Wed, 22 Jul 2026 11:46:09 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	"Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Message-ID: <20260722184609.GDamEP8Z2v9GgRXw1u@fat_crate.local>
References: <20260511103529.1853270-1-shubhrajyoti.datta@amd.com>
 <DS2PR12MB98216A090070FB54A63BAD3781FD2@DS2PR12MB9821.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DS2PR12MB98216A090070FB54A63BAD3781FD2@DS2PR12MB9821.namprd12.prod.outlook.com>

On Fri, Jul 10, 2026 at 01:12:17PM +0000, Datta, Shubhrajyoti wrote:
> I have reviewed all the Sashiko comments and identified the valid ones
> (details below).
> 
> Finding 1: Missing null check for
> 
> Comment is accepted will send a patch.

Where is that patch?

> Finding 2: Uninitialized ueinfo when CE and UE flags set simultaneously -- Mostly a false positive
> 
> Looking at rpmsg_cb, CE (error_id 18) and UE (error_id 19) arrive as separate rpmsg messages with distinct error_id values.
> The memset(p, 0, ...) at the top of each case clears the entire ecc_status
>   struct, and p->error_type is set to exactly one of MC5_ERR_TYPE_CE or MC5_ERR_TYPE_UE.
> The get_ddr_info() function then uses if/else if on ISR bits, but the ISR comes from the firmware message for
>   that specific error_id, so only one type should be populated per invocation.

Ok, you can put a comment above get_ddr_info() explaining that it is ok to
alternate between the error severities.

>   Finding 3: memory_failure() with MF_ACTION_REQUIRED from async context
> 
> 
> Sent below patch.
> https://lore.kernel.org/all/20260701095040.4139675-1-shubhrajyoti.datta@amd.com/

Fixes: tag?

Does it need to go to stable?

Also, you'd need to send me fixes for the issues reported there.

> Regarding the context: rpmsg_cb is a virtio rpmsg callback. Looking at the virtio rpmsg transport, these callbacks run from
> a workqueue (virtio_rpmsg_bus.c uses rpmsg_recv_single() from
>   rpmsg_recv_done() which is a virtqueue callback typically dispatched via a workqueue),
> so it's not hardirq context. memory_failure() does take mf_mutex which can sleep, and this should be fine from a
>   workqueue.

Ok.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
