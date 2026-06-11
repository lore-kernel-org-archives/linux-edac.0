Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B39A328616;
	Thu, 11 Jun 2026 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194593; cv=none; b=bEQFLyTkkf7Ztpfglo65XDA3mMUZN4luoYLA9NdwQUMkbH4+SU1PCS3yolKBMDYYALFuPTVTP7bVS5dLu8ZkZSdo7BMhrlnwYTuhC1b1xI9sM67giu+uOQ4DjsH0V/G99jMDl4Cj15jTOqs0yx41sgRsvX6bl4NrymvCg0LM8YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194593; c=relaxed/simple;
	bh=HkDdqCLurnam9wHbqLHOimrsbn7BHfegRyN4hMPIPds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnpOSH3Gx5LlfWxrBvE6lnKi412l28CewNqU4s/41ia0/9JrmxGn573dka9TSISdqhrj7u/keaJ+SQALG9CipIT0gsqKarNuw0LCWe7etx4md/2vFmOGtgDfSK9ORDHu6+w+wHeHWoACQONqv3vpiHaGM6xAMMbVgZLjX0XeC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=YFjZ9kjB; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YFjZ9kjB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EFD2D40E0217;
	Thu, 11 Jun 2026 16:16:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MFcujzkitu4l; Thu, 11 Jun 2026 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1781194578; bh=KUtKE5XtVVw9ic7YOjXJCmgB2bvDuIfx2IluFp9q4tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFjZ9kjB9T5zXshRcHFPff6q0cgcD+Xl85Zukg7k8kiCsB18QYjrgwEwpmJd/IHqs
	 97eokc6ufKufdshDHk674WvZrhrRm4Zyuro8dLLrlaEpccTEAzF4Ey39NCf4aRjPbq
	 6613kFN8P4A7rTqw4gTxWLUOFMp0W9KFoBl5NpXDGE17knN9bIWBHPPekRUfkElw4j
	 ZNUkx/3yj8ts+N4IgMalOI0H6KeHtGmF6tvsHSk9ZxlEBgcBnTMU6HPVDjVfI34/QQ
	 PDYQGuil7TDwGuhLrNL6+FRhrPYnpuuKIqHkf35bZ9L6CKQ4lf4Gry1ID+4NGy68bQ
	 IUCLGlyxOYTKU0bjMV8Uq1BHlH497b3F45rp2YXsBflmmdYGoJVi8C8Xr5Ebnbfz1O
	 WhdpVj022IZVOI4E3MCTm1VefH0z5pVa9CH3YKXkAVysi747qzi5h+PWQQJTzcVRZD
	 mCKFEN3huyTj41SL8UNmYI52gIf3LGYDiXF0cyPye216nACV6KmJbWDnN5Lxidp68R
	 Qsvp96iqL3WurkUx5m353T4eJOliMqa2pnEThvVNtSFMIDB09wbg4LzPNeREGbo3Qw
	 lcfbSVU+NC9SUtCxxzihrABIQ4cQokYont7QU2vgOGGUqGT3SnVh8A+2pK1SNEyiXO
	 B5ghLuItu9idNj4xDreHODbI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 43B8540E01B5;
	Thu, 11 Jun 2026 16:16:13 +0000 (UTC)
Date: Thu, 11 Jun 2026 09:16:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260611161611.GBairfS4UTuG-cwKjO@fat_crate.local>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
 <20260604154856.GA1625873@yaz-khff2.amd.com>
 <20260610003516.GBaiixRCclQEMwY_9d@fat_crate.local>
 <20260610211541.GA831811@yaz-khff2.amd.com>
 <20260611012336.GHaioOGB0NBxv5BZXS@fat_crate.local>
 <20260611141138.GA978852@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611141138.GA978852@yaz-khff2.amd.com>

On Thu, Jun 11, 2026 at 10:11:38AM -0400, Yazen Ghannam wrote:
> The fake_inject fields are targets.

Uff, true story, I got confused, sorry.

/facepalm.

> Just curious, why not leave it? Do you think the bots will keep bringing
> it up?

Ok, someone tells you about a bug in the software. You do nothing?

When do you fix it if you intend to do so?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
