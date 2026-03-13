Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957FE391E48;
	Fri, 13 Mar 2026 12:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404294; cv=none; b=kfCYK+CqPTWiL6oMOVN/XrsZSiBzK82xe74QzyQknVEkSI7w66L3P9vH4b7sbt7YdYXwct3g6eUfh3U+7EEfZTv0ERWsZ2CDLAI03YV7w1pulOWk2ZjzEkmsrfFLs0uNvhbdOiVEOA+Zsiffb9TD+AbeTt9JcKAWuVV/CI2cU4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404294; c=relaxed/simple;
	bh=h6GduIVRbh9EzeatHldmu4GsjhUxeSaoq+YdObHz9U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFBce5Z2TgjiS7x1q2+LG5OF4v9/kBlkS7xluG/mu5SiZM8bOaFX1Vq7/srTOXzWXH+74ZpIFZa8EQ/ifg9jwg5efZ4lNjcN9QO/CG9AjFO/7Kw3RpkP3X0w3NhBdS+8IxmDJAdTXMUzLk3muTFNRqdWDSFPz/wmtVJ2oBnqBw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=PHg6sAqa reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="PHg6sAqa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C148240E0163;
	Fri, 13 Mar 2026 12:18:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gCURxL_-JMc2; Fri, 13 Mar 2026 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1773404282; bh=DMTxuJqbVKjPQkvElcstwKhL1Nt9Q5psxqB8UV3nLas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHg6sAqaj1OMK4XfRz4jrK9vhWVq+Cu4s1AWiIslGEVRoBqeWpebduOo/oQ3cKGjc
	 ne99WqKnUdfjYHkk521bl159Zm7xGqBk9GpP1VXHgH577u/PVzSsNC/9pVfLPkEKZ0
	 cx46fN1hj2oGN5jbxdZh2WAj4MtbjwE2hM0quSlalKhcrnf7L0RgJt9Ui6tdt9ji9P
	 pr4hR9lDjlcna6pY8vzX2N0jK0Brc3e0Sv9YrUE+CQoEfonNsGuCehHkMEGzH6RJzM
	 5/+nHUdwvcdG44GeaKgPV36ssHY7uUTla59oaVJliKx4riJWzTeTbDu4LNI5gcTuP6
	 qM4ZXokURRkw6ujwBo6sg02Px5XT8pllQv/VOL8X/+cy41mpDJRd8xTVrgLcfqeEz/
	 aw7WpIj8eJrlxz5IiFlQy+j4m/O9LyouRrgVxiL4OfCJkpYsBVR4SOkW8Q8t5R2PH9
	 qbjM4FPu+MQBGx8IOY8lwfz8SjhM6N9dRReVMOwZs95hK+/6ZDdcQsgK9lqLCoimSU
	 qhDghoKnJyqJiNhwB1bCl5k3leEoM2bGz5cZvJjNqjnFoGQOxqDzt1HgN2Z9+szLFg
	 rZvd2gGpMxwHaA1K7rCCi1jWeX5kggbpYw6z+KeBilivDpUpqDbqtZsZ+4UsI9ji3I
	 vU/l1R+29cmBdOZsaUrPYmTI=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id E6B1440E01DB;
	Fri, 13 Mar 2026 12:17:55 +0000 (UTC)
Date: Fri, 13 Mar 2026 13:17:48 +0100
From: Borislav Petkov <bp@alien8.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Johannes Thumshirn <morbidrsa@gmail.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] EDAC: Sysfs attribute constification and some
 cleanups
Message-ID: <20260313121748.GTabQAbDvjzA4tUHLJ@fat_crate.local>
References: <20260223-sysfs-const-edac-v1-0-3ff0b87249e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-sysfs-const-edac-v1-0-3ff0b87249e7@weissschuh.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 10:16:27PM +0100, Thomas Wei=C3=9Fschuh wrote:
> Move the sysfs attribute to read-only memory and perform some trivial
> cleanups.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (7):
>       EDAC/altera: Drop unused field eccmgr_sysfs_attr
>       EDAC/device: Drop unused macro to_edacdev_attr()
>       EDAC/device: Drop unnecessary and dangerous tasks of attributes
>       EDAC/device: Constify info sysfs attributes
>       EDAC/pci_sysfs: Constify instance sysfs attributes
>       EDAC/device: All addition of sysfs attributes
>       EDAC/mpc85xx: Constify device sysfs attributes
>=20
>  drivers/edac/altera_edac.h       |  1 -
>  drivers/edac/edac_device.h       |  2 +-
>  drivers/edac/edac_device_sysfs.c | 24 ++++++++++--------------
>  drivers/edac/edac_pci_sysfs.c    | 10 +++++-----
>  drivers/edac/mpc85xx_edac.c      |  2 +-
>  5 files changed, 17 insertions(+), 22 deletions(-)
> ---

All queued.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
