Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AAC490BFE
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185274; cv=none; b=n05gBN5VqIfQ7QcruOeDS1bDtB7mCJZkAivZUg+PBCsb6+pdBMX98IInk2HRNSCSia/f6s2CDbToQoDt0OA+Eq46Drgq1NWRdUXGkIUfvKLW+mu7zW5xDYp5CiSMYru+186gF8DOOFTdwawO+lxODEaon/BwA0CVecrjkCp1N14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185274; c=relaxed/simple;
	bh=u1BAQ3FAEvU2JGSTuxjTM+PckZ2nrw+iI0nrk7y7Ruc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKxcKzOI1F5shOJKTBWthB5XJzwNuOej9Nngwvl9+qD6H41nbMjCftxV+vPjwf1oTfA6p/aNreNY1GJORE8OHbJi/6GnCeh0TyA+TnOglNhPdXdyLmfrxDNOmllD9k0ucZ/KzSZYuEzqsB0c1EnLbtwubut/EtZ7igjC2Hcd97w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QCRXxBd7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nJg/LScN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QCRXxBd7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nJg/LScN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788185272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zw6an/2EhhJ5W4wnSO5Y4YLVwQ7GrB0FsgM2E6YvV0o=;
	b=QCRXxBd7vPDyN0mzPCfb2ym0oOZaXDs7qjg17Ra3fjIEicyGcY84mAg0cTL7gEY3x3yWR8
	3hy+1b2IG8zMfDnEzgw5DGQCK0uAONkyGN0Vx4vgkeVL+4bnvLyeQU4m8dkFCRfAsn8El7
	1aVnH4beA85lgtgvbd2paCWFnQbS7QI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-gMkafQiZNEGbjZ_SGx6pwQ-1; Mon, 31 Aug 2026 10:07:50 -0400
X-MC-Unique: gMkafQiZNEGbjZ_SGx6pwQ-1
X-Mimecast-MFC-AGG-ID: gMkafQiZNEGbjZ_SGx6pwQ_1788185269
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c213d5fb55aso352495866b.1
        for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 07:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788185269; x=1788790069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zw6an/2EhhJ5W4wnSO5Y4YLVwQ7GrB0FsgM2E6YvV0o=;
        b=nJg/LScNfwCYmnWevCmtBtl7A4wBz+ZfdEgZJY6vwKnYYiQfEQSeudowBePo7UpMZr
         CMo+TWwUlV8mPwNWHLsnjYDcZSvEjUVdFbitMZ6BpansOdnPLHc+TbLkJZFoIngPwcFk
         7YeSMQmA00UDzMziZ55TAXgGxhv/rHujnrUznlE/EjYpXJFoSdMBEoF1fpngmZe5HvNM
         dvglXsfeRcVEZasTX3YyGxVyMUtWQmq7ATpIusuGT3b7nP2T/3PN9C8MGUNkWVwAmb8C
         W9KDNLuY+oQoJHwOO76GWQ5Hz9HCfNmc+6VOgcr08kaddfn0aZNL3AzrQerJ2t1+iUkC
         C0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185269; x=1788790069;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zw6an/2EhhJ5W4wnSO5Y4YLVwQ7GrB0FsgM2E6YvV0o=;
        b=RVzVRUOziNEagz3mHU8vXRy52zdv6gYhAJG5aohPGrIoCA5kKe/7v4Yfs2t0HFqFsG
         Ck9inwvlX5dBoEdXYaFq10rBL7DCUYy5Mq8wX4nrhfus/8zvjnX8c7M612hsd5bQoYn4
         tmuq3aaGjBV5wX8xNdsiq8xf3HXZXaFT3f6WyNhGgPpm4wksBYYWUUvmMVLmR88NY/f6
         DqVUgF755OSQ5MnAr6LBpXASqbA6X8ZpKUcHt+qF52/gm7RQXDSBrlReq5BqUs91eWqG
         X56c90A+IJFPGX6CdaDZTQUx6dfYv5KIGlx7enPxALr2DqYGUm9FOV6ZrSxQbVH71XJh
         Eo1g==
X-Forwarded-Encrypted: i=1; AHgh+RpLe56gm7qF8ha5+pvkkSnt9wwOTDwhYULC3CwNn6+PL+A3MtGmuslc06oXFXEfhLB2eL9jcFkrads6@vger.kernel.org
X-Gm-Message-State: AFuF++lzoC36JQLWe/5fpjTjtpfn/3RCDM/iZXkixbHFmn5u9ufuNA00
	LtVn++h/uw9ZiVw35xjQLOlzzNUlyvrEHb6T1wKi2MiHK3ZEBmIcbjzadGxDJYV3tG9jFAhdfKW
	S6tem2SQY+5E+4uD9Ew2QbqEOnHIMFySBEIT+JTomJoOI/kDWHnFf6N6SJ+MlZpQ=
X-Gm-Gg: AR+sD11kllNcDhfo5z8N/pOX2GbO/qUHSSVa7UCPthX9F6zTvTTowKb2KiM/PAPIAlK
	KnGxqev7acNwRadhwfThvIajNCVTuDPrXBwcveDTR1YXeMVZk+faizOrqt3OzehJrSQyeaOZYF4
	IjO+etXElNBTn3jFf25kPYxKqj8lGcLp99UEcC2DBOcvYxzQZtmEXRHz4lE0VCByrBTzmcsJ+Br
	BiKvk8yPnGJzmytK60parziuESNo4O598pmIb7FbfARsuIy5m1Wr3J54S9ftpd31pcjIQcaQ6DE
	0ps//0Uwr09TrPYL0hOPiFUVRuK/kKHLygfLsfU4jVdIsw/ic+rEaZJASoOnWazAz3oW7kgIFrf
	1lAc6C8CYj12jBCG4U09eh24rbk5snaPKKxIZ1/E=
X-Received: by 2002:a17:907:97c4:b0:c25:6e17:9b4 with SMTP id a640c23a62f3a-c256e170a28mr1236353666b.24.1788185269308;
        Mon, 31 Aug 2026 07:07:49 -0700 (PDT)
X-Received: by 2002:a17:907:97c4:b0:c25:6e17:9b4 with SMTP id a640c23a62f3a-c256e170a28mr1236346666b.24.1788185268714;
        Mon, 31 Aug 2026 07:07:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:2cd2:7ace:8238:f7f4? ([2a01:e0a:280:24f0:2cd2:7ace:8238:f7f4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm466979166b.6.2026.08.31.07.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:07:47 -0700 (PDT)
Message-ID: <fadc5ecd-f939-4258-841a-e80f488c080e@redhat.com>
Date: Mon, 31 Aug 2026 16:07:44 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/43] qapi: convert trivial intro sections for
 vfio.json
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex@shazbot.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 linux-cxl@vger.kernel.org, Markus Armbruster <armbru@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 zhenwei pi <zhenwei.pi@linux.dev>, qemu-trivial@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, linux-edac@vger.kernel.org,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowangio@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Lukas Straub <lukasstraub2@web.de>
References: <20260826193840.2152000-1-jsnow@redhat.com>
 <20260826193840.2152000-6-jsnow@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Language: en-US, fr
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260826193840.2152000-6-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/26/26 21:38, John Snow wrote:
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   qapi/vfio.json | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/vfio.json b/qapi/vfio.json
> index 17b60468712..3d61fc38ecd 100644
> --- a/qapi/vfio.json
> +++ b/qapi/vfio.json
> @@ -49,8 +49,8 @@
>   
>   ##
>   # @VFIO_MIGRATION:
> -#
> -# This event is emitted when a VFIO device migration state is changed.
> +#     This event is emitted when a VFIO device migration state is
> +#     changed.
>   #
>   # @device-id: The device's id, if it has one.
>   #

Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

