Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A2A1862;
	Sat,  8 Aug 2026 01:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150926; cv=none; b=tOGFFOrFIOwQndvchYJX2kNz5bNWMIViXPEUI8/LmCQYkxi7KdEGEAQNmGlgQjJYqM6rezclYCbZRQggwpo59jorZ37VG5FD0gVpQsuAZs4Yhnf9qBf0wJPdxVUkvQUDUb1Elfuq63fqpIN7o12apF+jYL7qyUOFJZ98DW7XLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150926; c=relaxed/simple;
	bh=jm/FXV51TEOHcdXYk4SfTNl2Wi49tb1Q0xiYF3a+6zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z20Z2p2l8VOhkZOMpna85IpSnY3xkUkY74KFK0PnKDpAo6rZHIW6c9a1eDYrrC5xIkT35bFuMzx8EoD3LWdV2FBHoNXJgO8DV7KRiOoMw27CcRu6m0GFKUf3VmvDMvdTxHVNEoQes5JbQ2bI0SroglRF6M5bSqSC2dQUp61osqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MOq7QFZw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MOq7QFZw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5B3C140E0171;
	Sat,  8 Aug 2026 01:02:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Avr3L_kIw-Cs; Sat,  8 Aug 2026 01:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1786150909; bh=ziRjw9rVdmFh3wtDehG2EJkVAUtCnmS+IGRYYw3VsWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOq7QFZwYAUs1I/NtDBY3fQvdC/OmoBq3QtZufrqL4eZ5eJkqPobzjUCkZFZDCoJk
	 nd7dSLYkf70cIu8ysgBV35uljxrSniLX8C1gJ5c8967aZ4PNcZx99EsjAjASkV0oXC
	 IyqsXByBHRXXJbd+W99pZ0F066cGa4o+K6sPmYTHgBVPNcMJH+RrtcsCRIUdH8u9KF
	 IhZ+CmBZYy31Q+LAJdWMh42CNkIM+FbQyFRFCbZqC2LRMW9sP758bTy249UKvgdVWo
	 K+h9bp0dpAozcDSJ3LoS88qdr2A+/PlxB80fB3Tn2qYg8xgCv3QxD9WSwioUUr1zgv
	 FY/ZED3AucnJifJ4O/DF4y3co9AUYOYtOgZ+SKVVoXuj5D2nWukPGaD/qCJdCYxIHi
	 ad3ORzhbx+sC7Ar1pHXvsyiSbtBftLMGcYJGimxfEepevTM4TGmX9E0Qz+0BatMsF0
	 M94dsuxHy7s4a6hgNMbB3/A+Tw3HSp9TshiMRm9vz2QWK6zmfTUH6pXcCI223KezPj
	 YMzCZ0qmdEe5upo6QlEEL7ijRsYz4GfFzaThotx6hv8Px+Ypj7i5NBmPZ0ENUQER0k
	 4BSFx20rEcfW1MO/AnJITlA1Xa/5C6hNX+SVSqsf7PGRS0OD4WT2W7MeIr38m+rodc
	 Cx0Plr5PXOsJpOGnduCYGhZo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7D6A240E00C4;
	Sat,  8 Aug 2026 01:01:41 +0000 (UTC)
Date: Fri, 7 Aug 2026 18:01:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH 1/2] EDAC/device_sysfs: Use kstrtouint for poll_msec to
 prevent truncation
Message-ID: <20260808010138.GAanZ_8rVhhc4HbtyJ@fat_crate.local>
References: <20260730145549.148229-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730145549.148229-1-inasj268@gmail.com>

On Thu, Jul 30, 2026 at 03:55:48PM +0100, Jad Keskes wrote:
> The poll_msec sysfs store uses simple_strtoul() which accepts an
> unsigned long, but the target field (poll_msec) is unsigned int. On
> 64-bit systems, a value > UINT_MAX is silently truncated when stored.
> 
> Fix the mismatch by using kstrtouint() instead. This rejects values
> > UINT_MAX at parse time, making truncation impossible. Also add a
> check for value < 1 to reject the 0-delay case, which would cause the
> poll work to spin without delay and consume 100% CPU.
> 
> Fixes: e27e3dac6517 ("drivers/edac: add edac_device class")
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> ---
>  drivers/edac/edac_device_sysfs.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Applied, thanks.

Also, I did some more trivial cleanups ontop:

Author: Borislav Petkov (AMD) <bp@alien8.de>
Date:   Fri Aug 7 14:16:17 2026 -0700

    EDAC/device_sysfs: Cleanup around edac_device_ctl_poll_msec_store()
    
    - Align function args
    - Fix comment style
    - Fixup formatting around edac_device_reset_delay_period() too
    
    The not-too-trivial change is converting the
    edac_device_reset_delay_period() msec argument to unsigned int as that
    is what the rest of the code expects.
    
    Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index cf0d3c2dfc04..638be1f47c59 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -342,14 +342,10 @@ static void edac_device_workq_teardown(struct edac_device_ctl_info *edac_dev)
 }
 
 /*
- * edac_device_reset_delay_period
- *
- *	need to stop any outstanding workq queued up at this time
- *	because we will be resetting the sleep time.
- *	Then restart the workq on the new delay
+ * Stop any outstanding workq queued up at this time because sleep time will
+ * be reset. Then restart the workq on the new delay.
  */
-void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev,
-				    unsigned long msec)
+void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev, unsigned int msec)
 {
 	edac_dev->poll_msec = msec;
 	edac_dev->delay	    = msecs_to_jiffies(msec);
diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index 6995ce039db9..6359007701ba 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -84,17 +84,15 @@ static ssize_t edac_device_ctl_poll_msec_show(struct edac_device_ctl_info
 	return sprintf(data, "%u\n", ctl_info->poll_msec);
 }
 
-static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
-					*ctl_info, const char *data,
-					size_t count)
+static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info *ctl_info,
+					       const char *data, size_t count)
 {
 	unsigned int value;
 	int ret;
 
-	/* get the value and enforce that it is non-zero, must be at least
-	 * one millisecond for the delay period, between scans
-	 * Then cancel last outstanding delay for the work request
-	 * and set a new one.
+	/*
+	 * Get the value, make sure it is non-zero, must be at least one millisecond
+	 * for the delay period between scans.
 	 */
 	ret = kstrtouint(data, 0, &value);
 	if (ret < 0)
diff --git a/drivers/edac/edac_module.h b/drivers/edac/edac_module.h
index 47593afdc234..eceef5539186 100644
--- a/drivers/edac/edac_module.h
+++ b/drivers/edac/edac_module.h
@@ -52,8 +52,7 @@ bool edac_queue_work(struct delayed_work *work, unsigned long delay);
 bool edac_stop_work(struct delayed_work *work);
 bool edac_mod_work(struct delayed_work *work, unsigned long delay);
 
-extern void edac_device_reset_delay_period(struct edac_device_ctl_info
-					   *edac_dev, unsigned long msec);
+extern void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev, unsigned int msec);
 extern void edac_mc_reset_delay_period(unsigned long value);
 
 /*

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
