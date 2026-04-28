Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3F4779BC
	for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391849; cv=pass; b=IdkK6z9dA7IAqa5lNhD8YDVFqgVC0IZCd94SCqkOiG2PTUTqnwT+NvK27ciLxzXHa/mN5vAr+UfEQJLjOFZnKWi3UeLCswV95CiGfeBxK5TM+3BG14iS5pG8KkUouWLt+C4shMq3Ruzm5oXGujDiTJaf2S8RXDVCERXcPk8oCCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391849; c=relaxed/simple;
	bh=BSROUIDJHjmtrRDYjdhaAslhL1cbpFvE6gbq2EeCVqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kck5KSaj+6N1QqIJK79xbOvq5pf2+/T1Uloi/OFrT9CE3Ax7u5ihijTPvjxgEZ8+R1SUATD4FJlE6nmMtpfqZue4Z4gzllu4xEw2zLDZL7BaMXJWeMrPMyeKVSQF11H/u5mcEfOWSdiVL/DVSbOhYwPfRqvs0zoXNMPxu8c/hFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4f+/ASD; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4f+/ASD"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-656d749109cso2439016d50.3
        for <linux-edac@vger.kernel.org>; Tue, 28 Apr 2026 08:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777391846; cv=none;
        d=google.com; s=arc-20240605;
        b=iVfbKkVE08vdvKmMEL+5Bhh2iKwKhaFO68YNTyv6I8SKLH/dxXbjgr1TADg7MQri3C
         OJfpyWeNn6oNIa7n+2YSEV+4ek9y/g/JX8/rTucIcmqamxaHZKJnCeAj4I5XZJXnvXDh
         kcdPHTddFIao9X6mkJppZkz9lMG2KjTgEWYsRPl+4fdZTbbRc5oH+NEfFV3PjQWjbQdA
         f/NU5BxH6yrnDcIHNz30hBlFBLFVCD0GAVpqWAIs2zPCHBw2mD0LhUSfjLKKHOjL0EXJ
         kQG4E72U5lnT+5TahxBpLpnv1IqllAu04tpnWTHyzbdotUtXMIqOOyoFt9qgninHTWuM
         hFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KuO/RzKLteIekr6KKJ/88g0TKvJuJAUgqJrnT5JU4eQ=;
        fh=svY6XyZr7ovJXT/YuyGtGOek6QMUVD9RyjcuNx2ZHFM=;
        b=IlpFU2LzGyX8EOznzmBb6BM5FymXG9+T8n2O9RuaF2EbZwuG21jlzf3nNCto0yJU+s
         yfMbgINuUN+YIFU0WmvYfIcDb24eDX+LuVCM1mLQ+aB+57WU6ifZL4KrwAghUMMzxCAw
         GK1FSYqbDs1/jhsBA0oq/PPHjNlJ0qSd/VYqKObsPizNPNOuEKEUq1YGuw7ioAy78mVk
         GXxtRKHJCAf+7OZzNSjBHZXlmmI3pX314eSRhEDvcnkjCsteYyhDl4zFB0aoBf4c7Gc/
         yh1u6lQeXVoK51303+j0oFMwO97AXQM7y+/XAD5i/pujbLoR4fpNHMuJ11CpUpjZBvLc
         uc8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777391846; x=1777996646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KuO/RzKLteIekr6KKJ/88g0TKvJuJAUgqJrnT5JU4eQ=;
        b=k4f+/ASDhANK5CvPNOVWoQwl2k5XRmlScprs2PnoBzi0LAAYp3MWqm78flfNzDb8sO
         VRlyxTPCk7ZmmU4YGrGOm+4hj4K+NUn6DaMt2XkfOCChVbs730OFNg7PXIRCfrce+mzZ
         y0cI0mpW7nWC6owbipIGX111tD5/0sJtKJaItD/A5a+E/Ywm6xaqPWSOkCwotGIqOMtj
         Vvs7YkYoGYXTjEZcWBoQvW6dv94kHhODG0AhPWNbHtneVE7QWJ0dX1JfYH+e9n96BIao
         og3FBXxj8DQ+LDsA01vMS5aIT5GjIIaRbfN1r21glRGWIkmkCdIb5eY4rRajilBAqexT
         xmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777391846; x=1777996646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuO/RzKLteIekr6KKJ/88g0TKvJuJAUgqJrnT5JU4eQ=;
        b=nJezz9fBKO4mWOQdxDIcs0Ou+u14+LZu4TaB5LtRsmdUquKwqDmfzxW42aaDURUNX8
         qT8me3MgjG3aC1rDVSy2pSw8zzbh3ZRO5P3zxKR9GvZgx/q0DlfsJf6KQ5U+VwkndY1q
         MvWGUA7lf/O0RRMPoeNA7owGeg0mHQyWslfGOIiqtwjM4kAy52SGTOpbPsmwxi4ulM0U
         vjYOs9oU12gLRdaob5Th1ebR0dhH/+YMwDeRYJNIgunKD2c3q11DGv+A0nsVWMHScOsz
         qX1s63wxNg2757oV1UuQeZk3W5/ui8NaoXFxis3gt3HausKBJ5sw8troAfj18mfCdhCM
         lcnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Cb3cumNsuWOu8gtwnP6IsJ8BPBULfei+VLxoQmiNi5/Dw2Zbe9cCmxt7bWkfa1VtISbUcoH9pBL2h@vger.kernel.org
X-Gm-Message-State: AOJu0YyKpDjPAE0feLKd4en2YH0FSaxZurMLocPrO6Du6L102B0KY2S8
	5FFaDL47TxN0u4SSnXQNr1ylJgu3WatN0sUdxvsIlnZIFSvZQZ3DUOVPm3EYY1bHq5alqzAkpLQ
	BvJCtM9pPehjjd7RShUji7SYlq2TdExf7IvoyUaxLTCuH
X-Gm-Gg: AeBDietEdzqZuPE4aCTYCm2K1OK3afmW4qeULjdg656s1zMGRf8vivX583cUM2Yimuz
	17QDJBHMiDvyn80LzfuxQYZZaqA7dxoHY22Lb2RXz9uNltoqVrP+Vu1gbWqixHnsy0qRuI6QFpD
	uG3pV40Dds3EeB/h8ljeEE4/mFZjwt6RkIe2s7Q3ypk7WE8TxpMIAI12RXVvB9z2imGYkSD3pW7
	UNiJGPS8ful6fcxBIo9NvGWpVuGakwT2qpbmHABEPGPas/Bm2PV6jMPdZjipQN/U09Uxw6pmXKb
	8YyfuH1S1lsrSsYm4STj
X-Received: by 2002:a05:690e:4007:b0:651:9544:fe1b with SMTP id
 956f58d0204a3-65beee3e902mr3461346d50.35.1777391846418; Tue, 28 Apr 2026
 08:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428130608.368025-1-lgs201920130244@gmail.com> <CY8PR11MB71349EE6FB5C056ED1EAD0D589372@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB71349EE6FB5C056ED1EAD0D589372@CY8PR11MB7134.namprd11.prod.outlook.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 28 Apr 2026 23:57:19 +0800
X-Gm-Features: AVHnY4Li2_VaTSgFQkgiiFULLmXehAD0Shw99w_mpOC1aYbaQ8gqArgd2BaSV8Y
Message-ID: <CANUHTR9MD2A3a2s6y2sp40xeHGUWzECNc=hma17ownfUqiXE+A@mail.gmail.com>
Subject: Re: [PATCH] EDAC/sysfs: Fix UAF in edac_device_register_sysfs_main_kobj()
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
Cc: Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>, Qiushi Wu <wu000273@umn.edu>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Zhuo,

Thanks for reviewing.

On Tue, 28 Apr 2026 at 22:33, Zhuo, Qiuxu <qiuxu.zhuo@intel.com> wrote:
>
>
> This looks incorrect  - the flag is marked true on failure ???
>
> [...]

Yes, you're right.

The flag is intended to track whether kobject_init_and_add() has been
called, not whether the function is about to take the error path.

I'll move the assignment to immediately after the kobject_init_and_add()
call, inside the dev_root branch, so the error path only calls
kobject_put() when the kobject has actually been initialized.

Thanks for catching this.
