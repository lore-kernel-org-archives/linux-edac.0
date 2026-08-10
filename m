Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0B276038;
	Mon, 10 Aug 2026 03:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786332432; cv=none; b=EE/XofTJgL/u5R1U2xEBfHdI+eogWuvZWc7TmWVUoP8BQxF5V9xO6leGbOsxckKWuqo5dLvK7jY/uS50cF2QESTSil2tcOj1pYQ7S5uKNhcuvReovUMVuaWsSLI1+fn2XMSDBdj8Gf1PSi5GoO8HOnR+ww83E2P4nTa3YtnjIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786332432; c=relaxed/simple;
	bh=AtIQCXTH+DVdRXtX+i2f1YWXHSxSuaVFdcD4yv5gmlQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WHN2Me2jxLlH/RFV9o6sYZjLujS02ZAuk5JuPhbFqzJkWU312atWS7+uw/qiGR1NsTxy4YWU/Tj37enP8Q5FkU34TNo3Bxs3NVHxqP3upzFx8VF3zchHskbULQQJXi/J1xOHSKp3CYbk/S0C+PNG1lpU4AP+UzYp8sTLYo7ret0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kwCg8hci; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kwCg8hci"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 41BAC40E019E;
	Mon, 10 Aug 2026 03:27:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6VVuAlzvv2ss; Mon, 10 Aug 2026 03:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786332409; bh=45ZbIZbdiTV8hK5isCO8rwhcsD946XLfURbbeNG46Q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kwCg8hciS+JDti46ly0QRlvEZcPyCz6+LQGLO8HDEAp+js1SqYnOooTlpmbAzVggt
	 TudABp9kDyQDk3NKcUnNtE4cl/w0E6UIGHynQbxkVLo8oBwsjDq/4LEEyPGJBwF/B9
	 nMtq0h0D1k455+EGS8laLysHGz3kXz3X7lhchILWJsxMG/d9hF33jq5Atmjv6Rzc1N
	 USrx/8BJ+OXkCftY9K/4rLXP3zlPPNV+jsJ7LqRwT17g3jnpP0wo6SJ5fGoWDT3CUe
	 KP34EjsYAaWXFDq6IIvgBM53An/kYDbSBgO4/d6pbQFBStV6Dyg1F0AAAdL51B6sXU
	 4KM3VEG18zkXoHqRhzrOX0UqYtcMefogyl2+rujLQWvDgeI2mNR34K+B/KVe6OQ00T
	 8UuCC9481nTsJyhw6aG/QuOx6csJwq8018yyyDHQcbEiU+Nz8xj1DWCyvEt0LeCz49
	 /Wc9b+BPsf919QTUfnksFyHJbEd2Sk1czR92J1NsZ7gP/a64LIzYlI7CUv4GUqXzzJ
	 bfDBxSMfxj+X3zMEC+O4tAVctIScZbA079gw5SUO7t34HDaS6eJD90ES98CBCc6OKC
	 odekKyJ5RGc01eNlaLzfE9CeCH7xETbZJdNevrfSYcU9iQ4WKOL2h86O8mH3zjh+qk
	 QCZ3b9D5QpS0iw3WYw7LTl1o=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BA6EF40E019C;
	Mon, 10 Aug 2026 03:26:41 +0000 (UTC)
Date: Sun, 9 Aug 2026 20:26:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH] EDAC/device: Serialize poll_msec updates against device
 teardown
Message-ID: <20260810032638.GCanlE7p8fVnUCYLEK@fat_crate.local>
References: <20260808223903.16768-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808223903.16768-1-inasj268@gmail.com>

On Sat, Aug 08, 2026 at 11:39:03PM +0100, Jad Keskes wrote:
> The poll_msec attribute was writable on interrupt-driven controllers,

Controllers?

> where the value is meaningless, and a write racing with device removal
> could re-arm the polling workqueue after it had been stopped and the
> ctl_info freed -- use-after-free.
> 
> Restrict the attribute to controllers that are actually polled: _show()
> and _store() now return -EPERM unless the controller is in the
> OP_RUNNING_POLL state.
> 
> That check alone is not sufficient against the teardown race: _store()
> can pass it and then be preempted by a concurrent del_device() that sets
> OP_OFFLINE, stops the workqueue and frees the ctl_info once the store
> completes.  So re-check the state inside reset_delay_period()
> under device_ctls_mutex -- the same lock under which del_device()
> updates op_state -- making the check atomic with the re-arm.  The mutex
> is taken only around the check and re-arm, never across the stop/teardown
> path, so it cannot deadlock against other pollers queued on the shared
> EDAC workqueue.
> 
> Reported-by: Borislav Petkov <bp@alien8.de>

This is not how this tag should be used. Please take the time to read up on
the development process before submitting more patches:

https://www.kernel.org/doc/html/latest/process/development-process.html

This too:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Also, how much of this patch has been done with the help of LLM?

We have a tag for that - Assisted-by:

> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/edac/edac_device.c       | 11 +++++++++++
>  drivers/edac/edac_device_sysfs.c |  8 ++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
> index 361dc985497b..519d1c6d0930 100644
> --- a/drivers/edac/edac_device.c
> +++ b/drivers/edac/edac_device.c
> @@ -392,10 +392,21 @@ static void edac_device_workq_teardown(struct edac_device_ctl_info *edac_dev)
>   */
>  void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev, unsigned int msec)
>  {
> +	mutex_lock(&device_ctls_mutex);
> +
> +	/* Don't re-arm the workqueue once teardown has begun or when the
> +	 * controller isn't polled; this check must be atomic with the
> +	 * re-arm below so it can't race a concurrent del_device().
> +	 */

This is not the right comment format.

> +	if (edac_dev->op_state != OP_RUNNING_POLL)
> +		goto out;
> +
>  	edac_dev->poll_msec = msec;
>  	edac_dev->delay     = msecs_to_jiffies(msec);
>  
>  	edac_mod_work(&edac_dev->work, edac_dev->delay);
> +out:
> +	mutex_unlock(&device_ctls_mutex);
>  }
>  
>  int edac_device_alloc_index(void)
> diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
> index e12122b2f42e..821a80806086 100644
> --- a/drivers/edac/edac_device_sysfs.c
> +++ b/drivers/edac/edac_device_sysfs.c
> @@ -83,6 +83,10 @@ static ssize_t edac_device_ctl_panic_on_ue_store(struct edac_device_ctl_info
>  static ssize_t edac_device_ctl_poll_msec_show(struct edac_device_ctl_info
>  					*ctl_info, char *data)
>  {
> +	/* Interval is only meaningful while running under polling */

An LLM usually slaps meaningless comments like that.

> +	if (ctl_info->op_state != OP_RUNNING_POLL)
> +		return -EPERM;
> +
>  	return sprintf(data, "%u\n", ctl_info->poll_msec);
>  }
>  
> @@ -93,6 +97,10 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
>  	unsigned int value;
>  	int ret;
>  
> +	/* Only meaningful when the device is running under polling */

Here too.

> +	if (ctl_info->op_state != OP_RUNNING_POLL)
> +		return -EPERM;
> +
>  	/*
>  	 * Get the value, make sure it is non-zero, must be at least one
>  	 * millisecond for the delay period between scans.
> -- 
> 2.55.0
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
