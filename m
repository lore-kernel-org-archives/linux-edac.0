Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525D3BBA1E
	for <linux-edac@vger.kernel.org>; Mon, 30 Mar 2026 23:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774912353; cv=none; b=kO4wBwt9SKjUrl7MbsMUZpYy2W72j3UBHdXBDMmGX5hE8ivNiDx+rJ/HeFclRj/kXu1k5OvdXK0FKSKlrEugsMtAog+qKWz7grstQTATwZGOTaalljuXxK26gjKdDJqw7vG1lR8zvEzPgTNszgycySD4jIBTIU2/ffypIBX7oRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774912353; c=relaxed/simple;
	bh=7L0mgsvwHoUqAMQ9KokAjNvhHB97N4gQcnU1B6pU/ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdnpNUEVv7f4vbKV4Sh/cML3XsjuOOnPXb68C6VVxF6JgVhq41fw6KoaSQdJrGVYwrU2vWwwM3q53V8BOkg7BCscNOKfPLDoTpcc9EpB5jWvccSffT2gfv5zzdBtZg8avNPVoACIaztJEdieQYZiNR/zg41QRsykOconZxomwvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IIZs9CSv; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IIZs9CSv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6D43440E0299;
	Mon, 30 Mar 2026 23:12:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kh5cIdHtQZUk; Mon, 30 Mar 2026 23:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774912345; bh=FCnUUB2+DAqT+o/1g7gA+zUY+cg7Z6xOES+3lpfZA9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IIZs9CSvchXOzab0zUf3WxMoMNtJnxznmt0ndqjTIvrf0JerhION4s2U+5PbFwPut
	 WdkCiZ3wpWV+U8v14xZj9XBHm5fsCMJ6aQzack9x+CvlsyWwhuvsMSbnt7hQYeX4fd
	 kj7+8EKBXIR7p7ywUS0npoPIPQPsVmEu5Sq2cjFbgx038ND1s8gwzjwbePHZZvUint
	 w79n0jrYVL22dBjlXM03kBiikT9TmYeWshf0LHdjUBnjn1UTIwk7UzdNelJQuEzJEv
	 Urx4kefR05uGcVXY4mrcByQzwkiu+pSVlq+VFNys0tZ+PgRE6/un0SajmGZENdD9Im
	 ukm+07V/HDgKtvHapkAzzQyaOnmWDK3st+eQu9Mp2WkNyaUOu4xeVWOoTTXiZEQYXA
	 Ydh2c7Dy6PJFtFfFJV+ItNLZWnSZd4zBvul71o/dgYD0XrxGSPf0lVEJNBBQSt3TMx
	 bHondP69opT0FVfs7PqjX2jrcJVKOnsNyQOOewc43EMEJ6JucG6MLQWqzO4AHzNjKi
	 fuXQKO4sRgE9ANHzvEi/bsHbx5Bpg1ouWKCOV27eZQnjDg7Nin2ijEBOmygLW8svaj
	 SWCMlGWWF0FZaxVf11PaJ2L7oCFoiuoWBJO5ewimX4xB9OrWCRazS+FJTgD43qBEEk
	 CS47+OdyH9+MW10JxeeYqgww=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 22E0A40E016E;
	Mon, 30 Mar 2026 23:12:21 +0000 (UTC)
Date: Tue, 31 Mar 2026 01:12:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kristian Mide <kristian@mide.dk>
Cc: linux-edac@vger.kernel.org, avadhut.naik@amd.com
Subject: Re: AMD SMCA: L3 cache scrubber deferred errors flood logs on Zen 3
 after 6.19 polling changes
Message-ID: <20260330231221.GMacsDVVrBmOXSH0t5@fat_crate.local>
References: <CAKFB093B2k3sKsGJ_QNX1jVQsaXVFyy=wNwpzCGLOXa_vSDwXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKFB093B2k3sKsGJ_QNX1jVQsaXVFyy=wNwpzCGLOXa_vSDwXw@mail.gmail.com>

Hi,

On Sun, Mar 22, 2026 at 12:53:27PM +0100, Kristian Mide wrote:
> First off, thank you for the continued work on the AMD MCA/SMCA
> subsystem.
> 
> I'm writing to report what I believe is an unintended side effect of
> the SMCA polling changes that landed in 6.19. Since upgrading, my
> system logs are flooded with deferred L3 cache errors every 300
> seconds (the mce_poll interval), which I believe are routine scrubber
> findings that were previously not surfaced.

Just to let you know that we're looking into it - it simply takes a while
until we figure out what we wanna do here exactly.

So thanks for the patience.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
