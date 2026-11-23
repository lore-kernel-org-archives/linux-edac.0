Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410504;
	b=lf8YW6XwHD70NakBdKTvjhS6dvv9fQ8YewqXxKkfTddDBYya3fbVSdPrRmRcSzaIJYAF
	 qz1u523jlsVyagXGNkl0pyoWivE1uflzb2G5j24MuZTibLHqYVpsl6iCaPAFCytsjRyUp
	 +g6in4u14zAFu3ChwDUfFPO/FZ41GGiz6bylpAUZn9SadHn/IIxPPWv3BuDuLo7TRcevN
	 DPtUwVagwy5wKETxGFXh1ODuuJxmqtzdZbYxBRLTffPNTDDrLs/w1PuoyalknrkihBg6L
	 2g9A35QXOSk5OU8i8XYIkDxyjtBo9N95Jpi25zIQnlwN/bdSR831MDYol67wFiy1Bwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410504;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pG3RbMD1S2Y3gZ5p/GavYtpXKJVsH9ua8D7+Nx6kh6s=;
	b=FuFvoXLCs3FbgUtizIrX+/gE4ZxLq139oA5liWQWvvZ3aP4Z2QjADEdPvOsCKC+iji5x
	 SCRQUH0MSaoEO9ePgvSq0bQ3SoErssZjum5cZ64BzxuksescH7GyXvnA7ErMH1fEHSkDC
	 UA2W912xxOFPnXcy3TWo9kMxvdkrQfJEPV459/z6buG7B+e8IqvWeh+FjEOHqadldSmXg
	 pCaa8UGeZomHBJwg80V9HslCSsAPL/i3qxi1oUp4tD7sTqiWOhm6iPqM6Z+DNxsUM1pV9
	 LrCiY1JvZIx1QuhUNtXZIi9hKc5VhQlGbuR3af0R7qeQFTWybSixyUxnIROsUlfnRVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=PeZdS3gk;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3E606A31A;
	Mon, 23 Nov 2026 05:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76D3E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=PeZdS3gk
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7ECD540E0240;
	Mon, 23 Nov 2026 05:08:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7bckj3GvgYyG; Mon, 23 Nov 2026 05:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795410498; bh=pG3RbMD1S2Y3gZ5p/GavYtpXKJVsH9ua8D7+Nx6kh6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PeZdS3gkDamgWXNvp12TUrnxPGx7CuLMqSLfKrk6NtRZTv//44qtbqxLJc4zHFdVJ
	 ztpEVXY8d1G73N2ZSsCIIW/HoJOvxGwaFVhudzWET9pwMyUWUXZNTV1UMpeC163qKN
	 qJ0zghMjXWRej6OxB4LGs9+Z+Qgc050Aflcwj4IWkc/FWmWsJUSulD14NclP/zlJeX
	 PfPl/gwDV9jR+o5EfwjjZyx2I6CET+SlJMn177vJ/oHm8MWix8VQXmUM2b6HKDX+Qr
	 y2HQ169A27haQ7Y0AsysEeEQQS5m9r9AbUH/ccH8gR8ZKehr4ufEqEYqQPocR5MASO
	 be3Mjy7zM4LMh+hNDxprDJ2i7OvcDHLRbKu5MdRDmSugUcsqRZOwkZNcQYApkCI99f
	 0VXcSxmfHRBlGRclYEi+zmt/2mol43QGEZ6ZnLekFK4gph8BCh/tgzZOD4oUgpa6zM
	 j/osnsZfUysqNexz9uODmyBfK+jWeXTRE6yuLsVu4d5hEoaD3oOZ1GKrs9YXf/GbHI
	 cy93NKeU02RUIkltNZh6dkHIUDrZwwlvDB0+wBsY4zfnGkeloobEGXpoZ0L839ZY07
	 N/hUP24EkifmHMEegq67NSWN1ellHov78x/0+CrNGkoGRzt7XTESQcDsZkJkKSI4MZ
	 Tw34Et69C0JKmK2vgydzHeaQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E48B940E01F4;
	Mon, 23 Nov 2026 05:08:13 +0000 (UTC)
Date: Sun, 22 Nov 2026 21:08:10 -0800
From: Borislav Petkov <bp@alien8.de>
To: me@ahmedabdelfattah.dev
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/mc: Convert the poll period to jiffies when it is
 changed
Message-ID: <20261123050810.GGawPKOuhvLRFtlMIx@fat_crate.local>
References: <20261119-edac-mc-poll-msec-jiffies-v1-1-fe329938fa09@ahmedabdelfattah.dev>
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
In-Reply-To: <20261119-edac-mc-poll-msec-jiffies-v1-1-fe329938fa09@ahmedabdelfattah.dev>

On Thu, Nov 19, 2026 at 08:22:07PM +0200, Ahmed Abdelfattah via B4 Relay wrote:
> diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
> index fd70caa85574..787bef803ef0 100644
> --- a/drivers/edac/edac_mc.c
> +++ b/drivers/edac/edac_mc.c
> @@ -499,7 +499,7 @@ void edac_mc_reset_delay_period(unsigned long value)
>  		mci = list_entry(item, struct mem_ctl_info, link);
>  
>  		if (mci->op_state == OP_RUNNING_POLL)
> -			edac_mod_work(&mci->work, value);
> +			edac_mod_work(&mci->work, msecs_to_jiffies(value));

Ok, pls go through all callers of edac_mod_work() and make sure they all pass
in jiffies. Then rename its argument from "value" to "jiffies" so that it is
clear what it receives.

This would be a complete fix then.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
