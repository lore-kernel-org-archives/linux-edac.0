Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1C03FADE2;
	Wed,  6 May 2026 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081118; cv=none; b=CMIr2bwAJl3Qz2tK/De70HY/8ppuB9I5QF0lCIrQWmHW+Tp3wSvM1kBm2l5ngEKfnonEKHJlBULO3F3kbpxyaqCPb+5wK+Qolk1WSNRIrfCpLD877NzuMXOWbY+UzKjv83TdCTbXA0eVeT3sGe3knBVIjTLpyjW3yi2+EedFQAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081118; c=relaxed/simple;
	bh=4VrYcRpn9VGYO8HwkRvdqOxhGI+TydwwWTs4eLwiEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUFND1VcvEVSIDsvTmcj+fLAxmwz09uXIJkSrcpnA5MTEquPimg44LnBTwHmdvwyxytNCtep51TmJmwuLnBVzkBopRgn1rnnMpaUItzEwc7KpZzBjaAHCs0Y/SO3NQGiPbe20SgOQPLMIlcjl/fe6VDRGTs1vfyR4f5ZPsawp7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DHclSgDV; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DHclSgDV"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3969040E01A1;
	Wed,  6 May 2026 15:25:13 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Pdn5omoWlwWW; Wed,  6 May 2026 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778081103; bh=PWVzRdLok39AF+oLGjH4JhkU6wah33PkQwVtgxUZtnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DHclSgDV56bfMse7f0+eX3HvvlcBLjZW3opIdnjyWR1B2vM0BOLQS4YNyOD+bq0/X
	 Mk+lNdic0WSoXFTmMnjuRqnH/iRlSBPdRkekIdkwjTBIAFt2rbCU/fTfykZqiomAEj
	 xxwnGTppTYz7fZ0ZXJy4j8+ntLTM4SvvVBx7+5r++TNcX/bUHaP80ki6RqxRMAM2u+
	 p7iaRM0sFAcaxWzy/zikF4g1mw3sfi8sk7B+r7AKBTLDmM1Fq7Go3/klq+jMUQSPW0
	 7INfuWbAHSDggiLQha05yPxkKxsiSm36peoVzyWMhL1x5sSUWeXlbYuSmqMM8iKh7j
	 CgKoXTihKUxXmMYZk7rkEIoxH5T9zrWViVdNZwcW/XFGvI3TMuTvSk2jVfLZPCHXRx
	 Vv1tG6H0CPnUQ19zwVdBboSXwbW2JPakRHqEa2G0TdOoreWbuvBGKqMY9Y0ikvnLf5
	 bQ24MMZzDNond3+j7XTmhAOQ98bJjf96gDlzfnkj77NuX7oXjXDam6wRegtwm12Do5
	 smctXGym0Sdka5wDfYjnJYXzR4LHlavqoEd0KMGbZrz7buxDZqICpQT8+oMXrB94WT
	 H/tNO3B2G+GVqxy1xnUC8+rQiffpKaCcL2NdThdwFJfiLGID7bvE/IJpxvk/8Mrfez
	 ei2zauDmihLBnmyELyVrvQ68=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 5140F40E0140;
	Wed,  6 May 2026 15:24:58 +0000 (UTC)
Date: Wed, 6 May 2026 17:24:45 +0200
From: Borislav Petkov <bp@alien8.de>
To: Aichun Shi <shiaichun@open-hieco.net>
Cc: yazen.ghannam@amd.com, tglx@linutronix.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/mce_amd: Fix Hygon UMC ECC error decoding with
 logical_die_id
Message-ID: <20260506152445.GCaftdPZII0lqBYxLK@fat_crate.local>
References: <20260216203211.GB420258@yaz-khff2.amd.com>
 <20260301142609.242124-1-shiaichun@open-hieco.net>
 <20260504175554.GCafjdqoMgM7k87tjU@fat_crate.local>
 <79948d2b-341f-4059-9268-c9b391073795@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79948d2b-341f-4059-9268-c9b391073795@open-hieco.net>

On Wed, May 06, 2026 at 09:13:01PM +0800, Aichun Shi wrote:
> From what I can see, this is the only spot where we need to sprinkle an "if
> Hygon" check to enable error decoding in mce_amd.c for Hygon platforms.If
> any other similar checks are required in the future, I will move them into
> mce_hygon.c.

Ok, sounds like a ok plan to me.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
