Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22F2571A9
	for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154840; cv=none; b=bCpoZ0GhwvQocWf60wfQ+MTo/WoR4vdlT6AknQ3vGP12QDcAP98u2BlqYfRzR0kQJoGIxWO6R3rkNNxHBf+vJ4qAFBBByxcafAAFEXzl9gDBt0bSIo7Dn/3W43uuDNFnAjdG0yufrUTkP9qOzs4c2F1E0+B7Mj3FfivENZ5A1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154840; c=relaxed/simple;
	bh=uskVNlkyvxprPb9BLZPWseweM4Ai4Fom+LaRXS4DDOw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sUe4KH4sx1ga+Gdrg1wSdZNxjUUxs/nHC5ROrbddXSrp1IWta0miNOFBp+EVMUgFBxX/XjFVxHKP0lZW7vhqKrAB3LtaPu2bQSGc1fbUyGGI0ze1Ya0v0dM+1YK4MTcsySK8VKWWg8BZQw6N6HefIcGquj2GEHtk22cDFdgZuoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TuSNLT3L; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XqRYBk7q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TuSNLT3L";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XqRYBk7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785154835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89NzTzSellfW3qMr8dN8sAksaWWUoRY5Hxr3im1aqv4=;
	b=TuSNLT3LS3lnF+kPEkA90Zaq0l7ELWxS1cdLwjyG3sDfD7TIto9O++BIr74WJUbgVj0gY1
	vRvoAmpbbVkvox4VWa9IOxbhe3cy8FnplqhvU74NvxUqwtjK3X82FpxJFT39HDXh58mLIS
	nIzUJAp4l+tPItSDOR6M0Pe9opR4ivM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-6EoWRzxOOvi_VB5XZs2BAQ-1; Mon, 27 Jul 2026 08:20:34 -0400
X-MC-Unique: 6EoWRzxOOvi_VB5XZs2BAQ-1
X-Mimecast-MFC-AGG-ID: 6EoWRzxOOvi_VB5XZs2BAQ_1785154833
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c160b9c0676so203577666b.0
        for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785154833; x=1785759633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89NzTzSellfW3qMr8dN8sAksaWWUoRY5Hxr3im1aqv4=;
        b=XqRYBk7q7yxamyuNoSO4H/eVJhXqPwEz7LlgHeONkaQoBcQiSdftR/wJs0irPPljKu
         iuJ6XQNGH4WBHOGOEj18/HC2A3b3daX2Sy50eyt3hGWweoNnZdcRipPbUjg3uWJHsd4s
         EnluxORWZ+3UQRbf3K6Wc7hS4Fw9Srl4ovKLpoZA3ck+LK2pv9V3Yt3Innk3OAiuYHNV
         TABqgVwwVofR4YQtLZMr2tsWYDBIHmUSRiBHQcExwFmpayzH608CuvBy3XMu5/uQ2J8A
         IbFHeBRe8hyHJv1UBcpbaCiPv6Zcw0m0c7vvUfcdR4+UGE1sirlPNvMdSfKM5qNn+al2
         vx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154833; x=1785759633;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89NzTzSellfW3qMr8dN8sAksaWWUoRY5Hxr3im1aqv4=;
        b=JF92bhxKsJ69Exmze6HTkj5yec1GYj0Zcz4ysl0UXk4VvqHUGbFgFHYg0C2U2qsNc9
         fHvn0cUHJ3Yd/hBuooBO635e6E8wXQRtP6S/9rE28un863tM2hwdh0ra0jaVtJ2NgQ/1
         5ZyPbuj9tlnod8NrcgJ2ppKUFipXrV1BAwqEEdfr3UATOeDXVvenlbdVWWk27krJP4uD
         zSmkDh0MNIC2WDImYvwm7+jHc57NGbfrJQ5ZBDJ7iY+lcHIYQ+f/22e7Eg1fYD2zELxs
         nYaP2+ouliVpK1HLCguoW8af9I0zbPydT1etF8NO+oZsLQT5qwHeF69Fj6h8Vzunl9Nc
         /bQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrQVKjK0GOxvT3dvMVGGLxoCGv9uSkP3j2xyCGexhfta2ShXPehIKJWDUnW1wP2w0x+ktg8cmbCLU7@vger.kernel.org
X-Gm-Message-State: AOJu0YxtcODjUFwtRbRXxyhvP3IqqabrNa2O1leYoAnNGrPrIj7cgcSX
	in1pXSkoKBSjaqmTtVropuMaewTsNL1LQvncSzC96olZcFP7rTVeoBV9dI/XAo03CbNaFgdUfOY
	kpMLcOVZbFjQDDO+y3jMcOv/FQ1dw1uHJRPbEsVjv2v/s2jLOfRJgB7clpF2LZuI=
X-Gm-Gg: AR+sD13xMXDXL0kWkvutabXEXod12XlVM+1WD4bH0Np1Ff33cvaeVMsMQ3VdzGXdMt9
	zkdgnR6k6SVgWiusnF1/qs8tBmui7ckyEOxdvWE/B1n9Q9ilh+lGlUP+5eNisBFK8Tf0Yo/jLzT
	SjKXfi5es5yvcgYXweDRB+URY149KO5lY1HIhbMhU7lmlLVWqyZTwv5UOarKJCGKz/K3kpZFEfg
	IwbShTCz3VI/TIZIBVj5Lu68WsWh5RbFNKdERCQirAFSfmdwEBqX8Apla498lJkbRmpno9lA7/v
	+kNRq0hIElk/3D4XM4jDmJ8BcQ+mQkTEuM8TIS297shW0SQq05keWRz3uTTL
X-Received: by 2002:a17:907:72cb:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c1f1ea08253mr325684966b.6.1785154832941;
        Mon, 27 Jul 2026 05:20:32 -0700 (PDT)
X-Received: by 2002:a17:907:72cb:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c1f1ea08253mr325680866b.6.1785154832520;
        Mon, 27 Jul 2026 05:20:32 -0700 (PDT)
Received: from imammedo ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f19c57sm626106066b.58.2026.07.27.05.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:20:32 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:20:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Lukas Straub <lukasstraub2@web.de>, Vladimir
 Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Zhao Liu
 <zhao1.liu@intel.com>, Laurent Vivier <laurent@vivier.eu>, Markus
 Armbruster <armbru@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@mailo.com>, Alex
 Williamson <alex@shazbot.org>, zhenwei pi <zhenwei.pi@linux.dev>, Hanna
 Reitz <hreitz@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Xu
 <peterx@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 linux-cxl@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>, Fabiano Rosas <farosas@suse.de>, Stefan
 Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, "Michael
 S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, linux-edac@vger.kernel.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Jason Wang
 <jasowangio@gmail.com>, qemu-trivial@nongnu.org, Jonathan Cameron
 <jic23@kernel.org>
Subject: Re: [PATCH v2 26/44] qapi: convert intro sections for pci.json
Message-ID: <20260727142028.3206f9e7@imammedo>
In-Reply-To: <20260723044805.527643-27-jsnow@redhat.com>
References: <20260723044805.527643-1-jsnow@redhat.com>
	<20260723044805.527643-27-jsnow@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 00:47:47 -0400
John Snow <jsnow@redhat.com> wrote:

> (Trivial)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  qapi/pci.json | 27 +++++++++------------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/qapi/pci.json b/qapi/pci.json
> index 694c741e420..a6a79f91afc 100644
> --- a/qapi/pci.json
> +++ b/qapi/pci.json
> @@ -13,8 +13,7 @@
>  
>  ##
>  # @PciMemoryRange:
> -#
> -# A PCI device memory region
> +#     A PCI device memory region
>  #
>  # @base: the starting address (guest physical)
>  #
> @@ -26,8 +25,7 @@
>  
>  ##
>  # @PciMemoryRegion:
> -#
> -# Information about a PCI device I/O region.
> +#     Information about a PCI device I/O region.
>  #
>  # @bar: the index of the Base Address Register for this region
>  #
> @@ -51,8 +49,7 @@
>  
>  ##
>  # @PciBusInfo:
> -#
> -# Information about a bus of a PCI Bridge device
> +#     Information about a bus of a PCI Bridge device
>  #
>  # @number: primary bus interface number.  This should be the number of
>  #     the bus the device resides on.
> @@ -80,8 +77,7 @@
>  
>  ##
>  # @PciBridgeInfo:
> -#
> -# Information about a PCI Bridge device
> +#     Information about a PCI Bridge device
>  #
>  # @bus: information about the bus the device resides on
>  #
> @@ -94,8 +90,7 @@
>  
>  ##
>  # @PciDeviceClass:
> -#
> -# Information about the Class of a PCI device
> +#     Information about the Class of a PCI device
>  #
>  # @desc: a string description of the device's class (not stable, and
>  #     should only be treated as informational)
> @@ -109,8 +104,7 @@
>  
>  ##
>  # @PciDeviceId:
> -#
> -# Information about the Id of a PCI device
> +#     Information about the Id of a PCI device
>  #
>  # @device: the PCI device id
>  #
> @@ -128,8 +122,7 @@
>  
>  ##
>  # @PciDeviceInfo:
> -#
> -# Information about a PCI device
> +#     Information about a PCI device
>  #
>  # @bus: the bus number of the device
>  #
> @@ -161,8 +154,7 @@
>  
>  ##
>  # @PciInfo:
> -#
> -# Information about a PCI bus
> +#     Information about a PCI bus
>  #
>  # @bus: the bus index
>  #
> @@ -174,8 +166,7 @@
>  
>  ##
>  # @query-pci:
> -#
> -# Return information about the PCI bus topology of the guest.
> +#     Return information about the PCI bus topology of the guest.
>  #
>  # Returns: a list of info for each PCI bus.  Each bus is
>  #     represented by a json-object, which has a key with a json-array

