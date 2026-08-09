Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A832C12C534
	for <linux-edac@vger.kernel.org>; Sun,  9 Aug 2026 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786292510; cv=pass; b=hogY7AvdWAoRtC99r+FVV2Q3dE9VrS+G9g9lEvvy9zGkydJYAwoiPHWeXLIIgnjzTkZppxJJipJJhKok7XzKx+MkIz0EHqx4L9qVi44Di+MKXDuYzV+mhdUamca++L6JULcHMs+iMFohk1xJagIZK+A+yAeY3UPsZkghM6YHS74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786292510; c=relaxed/simple;
	bh=rItyiYFou1ryhuzoOy9o9g4+CMweLxuPnrev8VpGUGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vqkgp6EIkD7BEprqjoUDBh6ftB78hVaM01nRLxlCKRqjJpg57ujGgly4CmyMqVLVUvn6CO6fAA4zYZBzxjC+D3AChHdNK6aJX9THZcnLsekrQFGwQWjuPAQVNb0tFFTuGLGinrCEWM5w7ubmPA+RXQbkWwz0aZqLcr+FR6Bg1Jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leTe65rX; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leTe65rX"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso754886a34.1
        for <linux-edac@vger.kernel.org>; Sun, 09 Aug 2026 09:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786292507; cv=none;
        d=google.com; s=arc-20260327;
        b=ICW3wJCfluPuavrtmu7vfPD9cmac55C8WPipPYPGbiCUDyV7KlPb422XrvflJsL9Kl
         JTOpuDnu3AV2L5RUjhJdbPSRNOGiwmtYNZKt/ZFdOOt2A/HHBgjzGCVCc8CA965/MTa2
         3TiRaulAfLQ65La36L6Kp9hJaLNw68PJg0tBtoqSyp49nSv/3woqMTX0Ada15yZTZ0/P
         fFUiyY0gK/PcbOXVlR6NovIsiKQeywkOAT3NgWRDDsOtPtuy+R9AJdYNieROzExcBLfo
         0iwpezyWerN/+5G9DLYDHCO8jqBAx6ftXstMAcG7BUJciVUSVJRkKWnZx1Nek+MQ7Qgw
         EhGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4g+uNVEIUaafW1jVJCwJcqut7w+vaPKEHq4aK6RYbgA=;
        fh=1o5YBxP5yh0rCKC8ccINLNsKBBZIcrdSbejgBdMzOG4=;
        b=n0lWXKn72bObAEg0TNwX6zsxElqKkhcOlv8ba8DzkPM3vl3fwCwyeweCIuoTEbtxBp
         NAlv3x1YIqB6nEFweHkCn55/cqAdq0MyFlOc1j+VIK1vL9aQAqPmwd20Yd7C+u/CZQXI
         WBUpr7VgXIv680E4nWIPJOG/XVuZETUaiBqYHP/bee39K4hI/5WmQESr5WMdUXyuTBEk
         WvQgOAPYg0a2t1T+ghO+VpG6/kwQn+FUSDMlLz2IJZ+TRoHB6E5HjZunbOx7FHljK1OX
         i+3nEyx5QGHiwzfV4myK6mSaTo/LoQfA25DFu/JzOxLjDAHqnhHQpxtwmOTem8H+6xBY
         u+yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786292507; x=1786897307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4g+uNVEIUaafW1jVJCwJcqut7w+vaPKEHq4aK6RYbgA=;
        b=leTe65rXYey8eOUQp2NDBu3HmmxBXTghxY9+n6IRidrsD+/39V56qpbIfoWtbb0S0E
         dXTwWNMN5rYfhAKhuT/86b6+5SPoPs/WIkUfikWjUX9vXiS152e6er1KHllJzKnpF5jd
         0PyUYzk8TJh1jsLAyFJaRojci+4vgLOYKCSkfq+7HZKI2pAO1q2KMZYBDOBdWpXW3iSh
         hc4mmooqo1ekvesVx+fBOvMG/mK22zX23JhCrwDaCr0v7tbo0QE8iBZiX0D3QJjiqWKt
         MX3o/Ub9f/0723xL+og8miY8a2ieTMUykKBHNX8KxEnRIZ2U8hfYRSzD7mMardYzho60
         hv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786292507; x=1786897307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4g+uNVEIUaafW1jVJCwJcqut7w+vaPKEHq4aK6RYbgA=;
        b=dYgSSOREboe18dwNLB+kPje317HN2mhQAKI3bHojNSdEQGkxBHGJYDNBq4WlKYmm7y
         d4T/Mss9ZQTRSCN8kmXMw7U6hOjgAKdgZ7aOaQBEW3AebpfTAKLWqwt8rmniqqHYTxab
         8LKK5ei1iTEiC5Q0kvcISNaM254TS573ZXXIfUn+l5g+01htCN3HW3RBc532ojD3dqwi
         NXR27Ji/e6+8XPHHABXqIckgyFELqaK4P/HRkO2F2kYlzp1+z07ZCMXYo5QdmBNGoTJ7
         ZiWxThHB5cE7FsoWK2Q/UTK7LJaNqktxSTLvHq92Y7dMx2qAq7LYL2GSm01DjLuNjmKC
         OU3A==
X-Forwarded-Encrypted: i=1; AHgh+RpIJr6ktkkz3N+LPFAgqokUd3l5xNtHFWhvFEycULvA56NdwhH5QKZnu5kzwTnDYf883Bre9Zt8hkx8@vger.kernel.org
X-Gm-Message-State: AOJu0YyFbjR8B9ITvn78DLLKJVPX2+orJrZKda2IkF6d0MVkTnjj2Hyv
	qP+F6QLPGF5dw0JIXRvGM1YcWQgEQ/KyDmv2iKbLykiaUn/EV/uMEXzvIfhvxsCwYOHfohDvVfc
	+4eOjJk9IAcWSYojgYqT9jazaQi/UOy8=
X-Gm-Gg: AR+sD13MqGG3DIw0FEns6PGW81aNPKrR5EP9VmPUstxE9kD5EpdX8cHdQRUCGbG+x71
	vEtAoin3NOv85Q0tnAU6zJtpgfqQBjCCXerUDjtdb4GmcBfOWtu6HKagbXzYAxQ7S0+6cJOk5iR
	w9uMJOz/HSduBrQIs37LTIWiBtNjCkRqYJrbVIr8UrU8q3v/puUchRHPBHE9PH26mCH2kHysK1t
	NK+ssTCYkTuDWnEUpFIPyNmSypU0R7cNgsbJcYS12BIxTpzgT2bcxZEZNoRmX1Zgq1r8cDdUOsf
	fK8/P0XPRQBY/BMAikdhNrQAO+RZJQcUeavsRL9VJFwI
X-Received: by 2002:a05:6830:2b14:b0:7ee:19dc:b00 with SMTP id
 46e09a7af769-7f3690ab85bmr9122552a34.3.1786292506403; Sun, 09 Aug 2026
 09:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com> <20260807055952.GIanV0WDlB9-eP9VdV@fat_crate.local>
In-Reply-To: <20260807055952.GIanV0WDlB9-eP9VdV@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sun, 9 Aug 2026 17:21:35 +0100
X-Gm-Features: AUfX_mwLW-hapdu2hs4DMFMxwFy8InInYkZZJQTUfB_9HQ0CIhdHPAN3xmR9s3U
Message-ID: <CAG4KcRJcpLREkbmOEEw7nGD+_PNOd+fWHkODqfWo1M8hmxA_Bg@mail.gmail.com>
Subject: Re: [PATCH v23 0/2] ACPI: Add support for ACPI RAS2 feature table
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

Sorry for the late reply.
Please find my reply to Sashiko reported issues and
apologise that the replay is not in a patch friendly format.

1)
> diff --git a/drivers/ras/acpi_ras2.c b/drivers/ras/acpi_ras2.c
> new file mode 100644
> index 0000000000000..51adfcddfa99a
> --- /dev/null
> +++ b/drivers/ras/acpi_ras2.c
[ ... ]
> +static int ras2_update_patrol_scrub_params_cache(struct ras2_mem_ctx *ra=
s2_ctx)
> +{
[ ... ]
> + if  (ioread32(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING) {
> + ras2_ctx->od_scrub =3D true;
> + ras2_ctx->base =3D ioread64(&ps_sm->params.actl_addr_range[0]);
> + ras2_ctx->size =3D ioread64(&ps_sm->params.actl_addr_range[1]);
> + } else {
> + ras2_ctx->od_scrub =3D false;
> + }
> +
> + return 0;
> +}
Does this logic misidentify a pre-existing background scrub as a demand
scrub?
If the platform firmware has background scrubbing enabled prior to driver
initialization, ioread32() will read RAS2_PS_FLAG_SCRUB_RUNNING. Because
the driver's internal bg_scrub state is initialized to false, this assumes
the active scrub is a demand scrub and sets od_scrub =3D true.
Would this prevent the user from controlling hardware memory scrubbing via
sysfs, since writing to enable_background might return -EBUSY and
writing to enable_demand might return -EOPNOTSUPP?

Shiju:  This is not a valid comment.
Please find a description from the spec.ACPI spec 6.5 RAS2
Table 5.87: Parameter Block Structure for PATROL_SCRUB:
Flags (OUTPUT) : The platform returns this value in response to
GET_PATROL_PARAMETERS:
Bit [0]: Will be set if memory scrubber is already running for address
range specified in =E2=80=9CActual Address
Range=E2=80=9D.Bits [31:1]: Reserved, must be zero.

 ioread32(&ps_sm->params.flags) & RAS2_PS_FLAG_SCRUB_RUNNING
 ACPI spec 6.5 RAS2 Table 5.87: Parameter Block Structure for PATROL_SCRUB
  Field: Flags (OUTPUT): bit[0] - returns status for demand scrub only,
  and thus this condition still be false for the demand scrub as well
even background
  scrub is enabled prior to driver initialization.

2)
> +static int ras2_hw_scrub_set_enabled_od(struct device *dev, void *drv_da=
ta, bool enable)
> +{
[ ... ]
> + /*
> + * The validity checks for the address range to scrub need to be updated
> + * with (base + size) > (mem_base + mem_size) check in the future once a
> + * proper method for determining the NUMA node memory range is available=
.
> + */
> + if (!ras2_ctx->size || ras2_ctx->base < ras2_ctx->mem_base) {
> + dev_err(dev, "%s: Invalid address range, base=3D0x%llx size=3D0x%llx\n"=
,
> + __func__, ras2_ctx->base, ras2_ctx->size);
> + ret =3D -ERANGE;
> + goto enable_bg_scrub;
> + }
Could this permit passing oversized physical memory requests to the ACPI
firmware?
The driver checks if the size is zero and if base < mem_base, but explicitl=
y
skips checking if the requested memory range exceeds the NUMA node
boundaries (base + size > mem_base + mem_size).
Since mem_base and mem_size are initialized in ras2_mem_drv_probe(), would
it be possible to add the boundary check here to prevent out-of-bounds
physical memory accesses?

Shiju: The suggested check for NUMA node upper boundaries is unable to be a=
dded
          at present because of the reason given in the comment added
         (proper method for determining the NUMA node memory range is
not available now).

3)
> + goto enable_bg_scrub;
> + }
> +
> + ras2_ctx->od_scrub =3D enable;
> +
> + /*
> + * May need to return the error code from below function call to the use=
r
> + * if the below function fail to update current scrub parameters even th=
e
> + * demand scrubbing has started successfully.
> + */
> + ras2_update_patrol_scrub_params_cache(ras2_ctx);
> +
> + if (ras2_ctx->reenable_bg_scrub && ras2_ctx->driver_active && !ras2_ctx=
->thread) {
Can this allow hardware state modification during driver teardown?
Sysfs attributes are unregistered during the devres phase, which executes
after the auxiliary driver's remove() callback completes. If a sysfs write
to enable_demand hits this path during teardown, the command is sent to the
firmware before checking driver_active.
If driver_active is false, it skips creating the monitor thread, leaving th=
e
hardware stranded in demand scrub mode.

Shiju: This is not true. Scrub sysfs attributes are attached with the
edac device and
          are added when the edac device is registered for acpi ras2
in edac_dev_register(),
          where the edac device is the child of this auxdev->dev. Thus
auxiliary driver's
          remove() callback would be called only after the
edac_dev_release(), and
           edac_dev_unreg() are called, where scrub sysfs attributes
are unregistered.
         Also both ras2_mem_drv_remove() and ras2_hw_scrub_set_enabled_od()
         are protected against race condition using pcc_lock.

4)
> + /*
> + * If kthread_run() is called before sending the command for demand scru=
bbing,
> + * the thread may determine that demand scrubbing is not running, attemp=
t to
> + * restart background scrubbing, and then exit. This can occur because t=
he
> + * thread function may start running before demand scrubbing starts.
> + */
> + ras2_ctx->thread =3D kthread_run(ras2_scrub_monitor_thread, ras2_ctx,
> + "ras2_scrub_nid%d", ras2_ctx->sys_comp_nid);
> + if (IS_ERR(ras2_ctx->thread)) {
> + ret =3D PTR_ERR(ras2_ctx->thread);
> + ras2_ctx->thread =3D NULL;
> + /*
> + * If kthread_run() fails and the demand scrubbing has started running,
> + * re-enabling background scrub will fail. Thus admin/firmware may need
> + * to re-enable background scrub after demand scrubbing has finished.
> + */
> + goto enable_bg_scrub;
> + }
Does this return an error to userspace despite a successful hardware state
change?
If kthread_run() fails due to memory pressure, the driver returns the
resulting PTR_ERR to userspace. However, the driver has already successfull=
y
sent the RAS2_START_PATROL_SCRUBBER command to the ACPI firmware.
The rollback attempt to re-enable background scrub via
__ras2_hw_scrub_set_enabled_bg() might silently fail with -EBUSY because th=
e
demand scrub is already running.

Shiju: In my opinion it is correct to return the error to the
user/admin instead of silent error,
          to indicate that the background scrub will not be enabled
automatically by the driver.
         This enables user/admin can check the status of the demand
scrub by reading
         the sysfs attribute 'enable_demand' periodically and
re-enable the background scrub
         when the demand scrub is finished.

5)
> +static void ras2_mem_drv_remove(struct auxiliary_device *auxdev)
> +{
> + struct ras2_mem_ctx *ras2_ctx =3D container_of(auxdev, struct ras2_mem_=
ctx, adev);
> +
> + if (!ras2_ctx)
> + return;
> +
> + mutex_lock(ras2_ctx->pcc_lock);
> + ras2_ctx->driver_active =3D false;
> + if (ras2_ctx->thread) {
> + /*
> + * Prevent the thread's `task_struct` from being freed if the
> + * thread function exits.
> + */
> + get_task_struct(ras2_ctx->thread);
> + mutex_unlock(ras2_ctx->pcc_lock);
> + kthread_stop_put(ras2_ctx->thread);
> + ras2_ctx->thread =3D NULL;
> + return;
> + }
> + mutex_unlock(ras2_ctx->pcc_lock);
> +}
Can this cause a use-after-free or Oops during driver removal?
In ras2_scrub_monitor_thread(), when the thread finishes, it sets
ras2_ctx->thread =3D NULL, unlocks pcc_lock, and gracefully exits:
ras2_scrub_monitor_thread()
...
if (ras2_ctx->driver_active)
ras2_ctx->thread =3D NULL;
mutex_unlock(ras2_ctx->pcc_lock);
return 0;
If ras2_mem_drv_remove() runs concurrently, it takes pcc_lock, sees
ras2_ctx->thread is NULL, and returns without calling kthread_stop() to wai=
t
for the thread to fully exit.
This would allow the module memory to be freed while the kthread is still
executing its epilogue, which could result in a page fault.

Shiju : Sashiko specified that the thread function gracefully exits.
Thus calling kthread_stop(), as it suggested, in a kernel thread that
has already
fully exited on its own, risks a use-after-free or invalid pointer
dereference, which
Sashiko likely to complain next.

Thanks,
Shiju

On Fri, Aug 7, 2026 at 7:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrote=
:
>
> On Sun, Jul 26, 2026 at 10:28:10PM +0100, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > Add support for ACPI RAS2 feature table (RAS2) defined in the
> > ACPI 6.5 specification, section 5.2.21 and RAS2 HW based memory
> > scrubbing feature.
> >
> > ACPI RAS2 patches were part of the EDAC series [1].
> >
> > The code is based on linux.git v7.2-rc2 [2].
>
> You're probably going to hate Sashiko by now but there's more issues agai=
nst
> patch 2:
>
> https://sashiko.dev/#/patchset/20260726212812.89266-1-shijujose2008%40gma=
il.com
>
> Please sanity-check them if they even make sense. If they don't, you can =
say
> why and we can ignore.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
