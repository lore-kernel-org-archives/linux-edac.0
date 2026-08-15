Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8C33859C3
	for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786790887; cv=pass; b=AXySnisDLX+vFaNeFY/IItnQHVC1rTlesvXfUgg/VUYl1baH/cFdGS+9g19VXBIvmvKDXSCJhc9WWlK85uowrRI/cs+sjk7Ich5cjS0GvyBgvT0ZXIhgwZFYnyfFNVoC+lpCs7K/q6Q7BZ/DYawu46MvrKOGdpXjaf4vtL6Tb14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786790887; c=relaxed/simple;
	bh=HhH2CD9z+1fTH9XEMDO90O2SUu6r4lhY/R9m+e+d1Bc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULDAR9Hm8wZADT6k1gM54qrdSVR+/ZZlhxWoOWj1dq1tmu8ShRwD2/NbBJra4GDMRsGkdsk5Tdjdq1ASlpiWoSYV2hOea3Oz9IPj/Ppjsc7Fg/NHLOsaU0ToJmytOh4HYuG3AByn3xxs/fm5bT6w8MhlVCEY4dykmTEEw63UB1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqKwDgBT; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqKwDgBT"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c4e9769bdso1984716d50.0
        for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 03:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786790885; cv=none;
        d=google.com; s=arc-20260327;
        b=A17oOO1/9rtYKAY299wH5BIkG1bJkCjtT1fNtfLYbX13PcZFyDGS9GeHW80fGWCtAT
         gieiy0HYD4WNe6zhHOLBimlvILf61juFMP7Ptp0juH9f3FCf2qVt5EA+lxS+DTYHW4ZE
         MxvlzqrjXlE2OGyk4dhPC6o0oAlerFLyVHzweK0lpBP72w3m1+bD4+4LmC2uQyWEeMNC
         /rW4En2K8Sk17tlh3wg1iw9no5UJ4tGANy3EdUY3oYzpgddlmRqwPkSavFULDLUsplsY
         UA2VMy8B44sg/l/BQ/tu/eToz1GcJY07TrXw/gIDjNM/fJp4K0Yl3+Srj/qfMKD+4GMx
         jCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0+CJLS9SnUXiC5H4fZKkbvi2JzkyJybPPqVXGjFx2RU=;
        fh=rY0ai5srqXZX3kP1IlgZa5s25CFXt0Vp+fizO45tiTQ=;
        b=h6waERVBrtEg03I6KK0KK4cRTM7FwhM9duZ66O4kG6FNe3lhRHcydNuShNc913EQt1
         SEfI4YW1K2A/Rh08FmQH4J2o3LluLiBC1kIT0cRuIFDZrkk2HTKzCEVu8uvsbmLz7TR5
         kC7nqiC/i17QQ3mGFhVkegiKHNvb0eII26bf2+2+o6PN4z+o5p9IFAZKXqilHxVkQG0W
         LMkbruMhi96VabQwJmIXO7eyYYO5BLKTkwu0DP/TqIabcicY7QPBOujgLpcgQAsXhC3k
         e9hejpdLnONVGPo2p3c/i7N98oS06Ts6EZEgX3XkExJ28cJ9u4yUW2jdF0xtVHaYHlSC
         qEEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786790885; x=1787395685; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+CJLS9SnUXiC5H4fZKkbvi2JzkyJybPPqVXGjFx2RU=;
        b=sqKwDgBTmAnPr7zeTavjHklb4MYkwAqhakob18LxKiF5Iu/SnCrIvTM6hQnEdow2ZN
         nKnYbNt6KHalHGI9dOBiBW+wB9SN2/iZMFRzWYdsgRzwVww6k7e9wp1OdXKuqMp6XT9L
         RaTHbpWWABU5DBjtjHy0itDUyIFwWDajXHVWqhd6ovwKWjbOQO9jh4WRqnxTvsSYMNWA
         TG2AwNGRC4x/EIK4MdDDCqjAom6/4YnBOqPwpUAnZQhKeAAnjQM79lOx1Y/KSPb2Q0Lx
         CcWfJ46CM3JWwZoTrBxWm566NCyG27kBoBV36sNUrNv7InAoKoiixblnuoiOyQr4G1+v
         kWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786790885; x=1787395685;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0+CJLS9SnUXiC5H4fZKkbvi2JzkyJybPPqVXGjFx2RU=;
        b=mmOhJkh6YFY2paHEzS3thqveRfeCJbSzpft/yr4bqqFwXioBq3XJyBLexI90BIjVnB
         +lzFr2MofGgHHrjiP8LY16gVv38921mJXxA5CQyI4Cxrtxji+ElZUt21inyb5IYKI4qB
         cWn+smD5yz4Enw/MG3dtP5sWhrnR/ZmU7ypdWbSEYG0k7kcHYxKWIG8R7NRqkYhcRTnh
         cntNVG63Gho9Ng0ukPBgEm6MSiGYyiOnSfG2oDu2Erl5BFhUfV3HG64mL543tSoReCNZ
         wNLtYkCXl2DH/qnIr2N2tAeOrZCEGQJIjIbP+dMcvIri+CeQAEcjHqo1gJ5VhuIeNsIQ
         xgOg==
X-Forwarded-Encrypted: i=1; AHgh+RoEdH9zlgZrao/NUkfixwSTstKdjXg8vMsTh5nQtMON53+cYfNEqVXrUjowAGSdsOROmssbWTwrqBJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxClqg45P0eg/RH/735YlvxeosNX+eyU2hV6pLyBXrmoiGJcC
	aQGBb7rhS3YX3rwASaPKvVgRsqB2N99HvCKZJqsHTRoK0mm4lgHOdvxh7EWLD8AFXHHx658CLKv
	u0LUqf/sJfi1xLv5piMlvKrGvn4seecAUwtNL7Ro=
X-Gm-Gg: AR+sD13lpWjsyFP5gyb7+tpPy5iHHQPWNZyORxyp68x6Vm08F8MEw76/RIcdUSRJqps
	xyaibmsieelKSXWCsQ9uiMgHickrumW0U6iVHCD6WRMLq4qVl2F/eRjTfvICiGrkNrgPr/E1kSJ
	vkykKESGtGkf3rDILjNS232BiunAxiMWLKnzrbbpzmnI/ATWhFzVISxiiS12kV1H6s6pC4mGEP6
	7aYrogGfVeDU464q58t3mM1b8iqBBNUVwnzdrfq2lvCFUkyDlD9wVy+tPkwdij2LutAujHwpAbg
	aesSEBEiHophbgFhX3FsilBN7rdCiLpVy3W3EA15EUmjwk8=
X-Received: by 2002:a53:cb43:0:b0:668:97f3:d58 with SMTP id
 956f58d0204a3-66c72e95ee8mr3529490d50.52.1786790884631; Sat, 15 Aug 2026
 03:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714121113.1488956-1-lgs201920130244@gmail.com> <20260813061645.GAan1hTeUc5N4-7odJ@fat_crate.local>
In-Reply-To: <20260813061645.GAan1hTeUc5N4-7odJ@fat_crate.local>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 15 Aug 2026 18:47:53 +0800
X-Gm-Features: AUfX_mzZCobLINlGtH_q88gVQZPis33JOXHgsaHAW8lllL1ScQutd6m4j3qGdes
Message-ID: <CANUHTR-FO79oRneKQMXHFDa2q=7R97PkMsHXcjHdzxNXzMbeow@mail.gmail.com>
Subject: Re: [PATCH] EDAC/device: Fix double free on sysfs registration failure
To: Borislav Petkov <bp@alien8.de>
Cc: Tony Luck <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Borislav,

Thanks for the review.

On Thu, 13 Aug 2026 at 14:17, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Jul 14, 2026 at 08:11:13PM +0800, Guangshuo Li wrote:
> > edac_device_alloc_ctl_info() allocates dev_ctl and passes it to
> > edac_device_register_sysfs_main_kobj() to initialize its embedded
> > kobject.
> >
> > If kobject_init_and_add() fails, the helper calls kobject_put(). The
> > final reference invokes edac_device_ctrl_master_release(), which calls
> > __edac_device_free_ctl_info() and frees dev_ctl for the first time.
>
> So far so good.
>
> > After the helper returns an error, edac_device_alloc_ctl_info() jumps
> > to its free label and calls __edac_device_free_ctl_info() on the same
> > object again, resulting in a double free.
>
> This is where you lost me.
>
> Because:
>
> /* Free the actual struct */
> static inline void __edac_device_free_ctl_info(struct edac_device_ctl_info *ci)
> {
>         if (ci) {
>         ^^^^^^^^^^
>
> Otherwise, we would've caught the double-free a bunch of times now.
>
> I do like the cleanup in edac_device_register_sysfs_main_kobj() though. This
>
>         dev_root = bus_get_dev_root(edac_subsys);
>         if (dev_root) {
>                 err = kobject_init_and_add(&edac_dev->kobj, &ktype_device_ctrl,
>
> is an antipattern and needs to go and I like how you're doing
>
>         if (!dev_root)
>
> so I'd take that cleanup gladly.
>
> Thx.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

The if (ci) only checks whether the pointer is NULL; kfree() does not
clear the caller's pointer. If kobject_put() drops the last reference,
edac_device_ctrl_master_release() frees edac_dev, so the following
module_put(edac_dev->owner) already accesses freed memory, and the
allocator may later free the same dev_ctl again.

Thanks,
Guangshuo
