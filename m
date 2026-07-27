Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4737B000
	for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785154738; cv=none; b=rd04PoAm9Q3UFanvV3xm0TkuJnfa0hlo/Ddgk7pmNOglXyPHJkSbAubtfWQbuGtAf12f2r+3q6ZUlvfVxgzdlrLehcrUa4i+1BdqziGZAXBHM4IuOv6fpUNWT18SaIyAf/069V4wiA8uE2/K3mHMyYAldFmRUplOhVT0g3dRzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785154738; c=relaxed/simple;
	bh=qwk80AisqTMy0iYs4QukeX072/7dtVnb8chN7LgZcqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BcEBipZP5aW3nUOvJZLRiotNY6AXWW55QfzulddpopCOdOQoGT06E9OT67iyGSqjIsUCarHLp6WiagO0iNJGw4UeXBCauKHPmQfN/NTGzz0NOnKYpXAyy8lYoOu0Tk+rb0/lRCKm+aBthYoYR16waGqKqOc9vBvkf9wkoIvNYr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEm8+oO7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGfXr00X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEm8+oO7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGfXr00X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785154734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5dKeWNXTVrL85tSrPucpBv2NSFt9uxptmhhn9V0Ke0=;
	b=XEm8+oO7AVncKeEfSBHC0NSp/l6PAWJqgNFKTRe5xNe1shKvB5B2ksdSJL5vgKpGrT/TJG
	kokTwU7IfgDn5zHrdhChtsNW2nWOirTRi24eVyXTZkSIGfCsd6OAmOKThvvnjefktS5HMo
	ad5LotK2J7uKl8DRvj8ov4SAAcWZmsg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-PgjHocnGMcmSg4_8kvNnYg-1; Mon, 27 Jul 2026 08:18:53 -0400
X-MC-Unique: PgjHocnGMcmSg4_8kvNnYg-1
X-Mimecast-MFC-AGG-ID: PgjHocnGMcmSg4_8kvNnYg_1785154732
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4954fd771baso24071175e9.0
        for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785154732; x=1785759532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L5dKeWNXTVrL85tSrPucpBv2NSFt9uxptmhhn9V0Ke0=;
        b=PGfXr00XeuBzRjVPZOyHctm1wynvHiKyTSA9wP2JO5AM+QDB8P23nN82DW5OaZR3fw
         F0a19chqKyDO7o85v3YYHPgcfypwQFCeAvJX1iUv2vkXZPWJgbA4+nLpL+rToch92zKw
         0f+tLcA+t8XiUMvaA0zoQdkbDJ7bx7diLcFzdpWvrtFZzuSFjAtO4DIOUjPE2eoRQAqS
         nzuiEpQggUf7ovmiu3lNpJfLoA2dx68hb5129inxtuTCH4Idgntv81+uy3LgBG3VQ3jh
         PY3DNPotLluEjRlABIyTSJCteLLLkalELfeSHusg/UMgp3BOHh5MOIpVtxclts55OiMR
         EYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785154732; x=1785759532;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5dKeWNXTVrL85tSrPucpBv2NSFt9uxptmhhn9V0Ke0=;
        b=N1TamYFksLNnSy6vbXNCwMfxZXWiOYUSneY+MuUA8l7hWqEdNREOcSfU9EbHi2F6cN
         s+ZH32OTGXR/UR9kygiu5d9AfLSq7dh7ouTVRB1Gh3GO5elYqbkz8Jrd73HFT7LTttIw
         jCP4WVG9Ly8CtJ34pm6J4ezOZplm0aLmfo2akuHiRh5Qde9bxPbXLgAjKzCs4cLCMnM8
         xFIZU9hTm4G9po1Q0jbX6Wb6nK35OduX5PB1o3i6T9TU5KLgaBbJb2A3+UBv8W/XRNKa
         3ZZeCYvFtDbxyhy17HgevPuEjIO0fVqj/TxMOInE5edCAqAYPQIH1jOYumZaxAP5403r
         gFQA==
X-Forwarded-Encrypted: i=1; AHgh+RplBdAcEgWziCoIkyzVJNLrDiQdmjiB+TJY29PWJXTMw2O51mdrEUzM5AxZiCrX6ta8o/hDXntCmhF4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vSZvKPj0Rl4UlIJAyGYMotAWFezyKbi5rzsQYYF3yx609xyI
	zEWx2MA4Fz8S/VVCme6fPMyWLk3RkTp4mjrvkKS8ukACz1U4qe0twPOwAlVPitfxBYzwAHfXSF6
	QcW5XuDoJde53rJnnoXRG3gbvVIakgVCcgcHh/xtqOXImCTe0c02DZhiz65QKJNk=
X-Gm-Gg: AR+sD12LrCT20eXDQ1Btw4e4B8jcN8Fm9Gd1BMHNDFnQmjQmt/11bV1SLaMoMQsMaNM
	5PVlDKbINxFj7ytqbshD4x24BJkCknvjcqgTlJkylhKCHEwJR8HsH+HI145rlqMO8pErNk5qie1
	pOdS2gBLfSqZ5Lf8SZ0G8IopVUCJjONFYjdAPqznVUnXMUksebFTc5gA23jEBNycDSsmv12LhDM
	vRt99+Hu6IqVAbi3YDByThcteqrVxFtyXUo6NlnqjEj3Z66sfp35pujwGMRX0vuchia5VEgcS0h
	Ug8lzKHIXxN5bf18nrpnBaULo2e+kzpYIA3MfGEiAC01QjQSbZ6jAxI1Lfk7
X-Received: by 2002:a05:600c:4444:b0:495:6b4c:fccc with SMTP id 5b1f17b1804b1-496b5c7182amr99174485e9.10.1785154731992;
        Mon, 27 Jul 2026 05:18:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4444:b0:495:6b4c:fccc with SMTP id 5b1f17b1804b1-496b5c7182amr99174075e9.10.1785154731608;
        Mon, 27 Jul 2026 05:18:51 -0700 (PDT)
Received: from imammedo ([213.175.37.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b388d5b4sm162922435e9.3.2026.07.27.05.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:18:50 -0700 (PDT)
Date: Mon, 27 Jul 2026 14:18:48 +0200
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
Subject: Re: [PATCH v2 16/44] qapi: convert trivial intro sections for
 acpi.json
Message-ID: <20260727141848.5cc56eb2@imammedo>
In-Reply-To: <20260723044805.527643-17-jsnow@redhat.com>
References: <20260723044805.527643-1-jsnow@redhat.com>
	<20260723044805.527643-17-jsnow@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Jul 2026 00:47:37 -0400
John Snow <jsnow@redhat.com> wrote:

> (Trivial)
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  qapi/acpi.json | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/qapi/acpi.json b/qapi/acpi.json
> index 906b3687a55..291a04a7ea4 100644
> --- a/qapi/acpi.json
> +++ b/qapi/acpi.json
> @@ -81,10 +81,9 @@
>  
>  ##
>  # @ACPIOSTInfo:
> -#
> -# OSPM Status Indication for a device.  For description of possible
> -# values of @source and @status fields see "_OST (OSPM Status
> -# Indication)" chapter of ACPI5.0 spec.
> +#     OSPM Status Indication for a device.  For description
> +#     of possible values of @source and @status fields see "_OST (OSPM
> +#     Status Indication)" chapter of ACPI5.0 spec.
>  #
>  # @device: device ID associated with slot
>  #
> @@ -107,9 +106,8 @@
>  
>  ##
>  # @query-acpi-ospm-status:
> -#
> -# Return a list of `ACPIOSTInfo` for devices that support status
> -# reporting via ACPI _OST method.
> +#     Return a list of `ACPIOSTInfo` for devices
> +#     that support status reporting via ACPI _OST method.
>  #
>  # Since: 2.1
>  #
> @@ -126,8 +124,7 @@
>  
>  ##
>  # @ACPI_DEVICE_OST:
> -#
> -# Emitted when guest executes ACPI _OST method.
> +#     Emitted when guest executes ACPI _OST method.
>  #
>  # @info: OSPM Status Indication
>  #

