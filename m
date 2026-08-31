Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE51395AFE
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202554; cv=pass; b=b7cbU1uwtbj7WaR5b9gg03T3yxwI25a4X7sGg/YgWEf1pmp0NpofYppW93OofCNnj5RzJsCRJHR53ENTmzFk+FjL136ZtsBBemYoVvKv/Psoa1pdh8nvOGZdIY9/k/RkbklX2L0zKXcBhwI82m3bHMbApGgSUKNZYo/8mSgFMO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202554; c=relaxed/simple;
	bh=u87RqAAa657Hmf7s5lZFEasHBmwfl8p3xVrE6rj4W0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rCRl5BFMqfUbsImcqUnXuFzu6AWOo1ibKOcs9aZ7J/bZnV7Fm3mYOK5u3D21ERezzDwsG83PcCRcBd9jzSvTxczfpRPAlmD/uCX+CLphnYHzVaEzB9Tt7YD2E4tSvEYgfOzNm6NXNSHQzNuCIFux7gcdru1iAc3UwqUic4/ziqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PVQ3Yp25; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sYMrYLE2; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PVQ3Yp25";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sYMrYLE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788202552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJ5EPZcsW3BeU/Du4PIisPviXsXnrKzOxO6xL0idyrw=;
	b=PVQ3Yp25xZL9EFcQyi0v/NnZr3AamV+IF7A7nYiN6tBNxtHqbh27d25jTrGeq1eN3o+B7B
	j+u7OuOrwXAn9gKDGHfAQdehar06Iat7ts/3flnbuFZzY/8ZhoR9SOcBcYLEImuu0JTNxy
	Er5jHKs0UQhWm6dpsdQttaetKLsG9z0=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-yGK97X6MMvuPncBe2mov4g-1; Mon, 31 Aug 2026 14:55:51 -0400
X-MC-Unique: yGK97X6MMvuPncBe2mov4g-1
X-Mimecast-MFC-AGG-ID: yGK97X6MMvuPncBe2mov4g_1788202550
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c70bf18a1so4581940d50.0
        for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 11:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788202550; cv=none;
        d=google.com; s=arc-20260327;
        b=SzGqGm60sH5uQbTOjM0NHGqR8cK3kjggbUPEmLk5NUesMKxoOZzBnNWcTJaGwgjsCy
         ixGIrw8bw+xIQZdxKXPnJk4Z6mvhK648FVcgpSVpij0DPDvtyoJ1O83egkvGWiVooi/W
         0kJjV4yO+Xvi3WjcUpb+5fCTjPl867Uh2plmHBaLHezAmP/8S/46U98Fz9he0iVGmWF3
         v1RgPNwMA5mJZOnm3igZOsmmtXn4X7zgpJ5D56+mhBCr4cqOWcLEIIefesNgsXoJN7Bw
         s1KzwjBDGYpINY227Mp95nur1hZHRUOiR7RWqEsbte4TAQoJdpOHgWRY66WqCeti6lCh
         ju3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xJ5EPZcsW3BeU/Du4PIisPviXsXnrKzOxO6xL0idyrw=;
        fh=gCoeyAThiWiozpJfXp8ldHoi4lScsYKtG++ztQ7gH3M=;
        b=YE+WdILSBEWXEXJvBwn8n9J64fIAtvzTAXnmCFQdwcTKm7MQzrgU+Wl90pGHsqUgkB
         aVoUarukAFdRSsekRfjDSVo04Hq4elzluuTMKRO9h92f4yes5DoLsKCFc7+uZEBqO0mb
         X2P84GCvz8xsnXIy1oRt1o3Qfticw2+l+5TrDLH0aXeQXEBMWwh68VNPUX4KMplx5sUb
         JKj/tYpTG7/WHFS9sL7VTh9TFWRIA+ZM4wFUhxeTMYxlqyre5ofMf0pt5ZAkOA/g6ZYm
         x/z5k/8A1KaZSYHRWNfqeORO7Xucun2VViCoUFIrADH6ndImfhvcYE2++idPrp/YFYH7
         rpOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788202550; x=1788807350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xJ5EPZcsW3BeU/Du4PIisPviXsXnrKzOxO6xL0idyrw=;
        b=sYMrYLE2jy2o6nGt6aCJz3ofVecTdw9EInNBpFBADDtyJp8kQyYwDaewMPkPU/l7Cs
         xTFopbzIYpuw/TMMxqZwvJkTXqaDQbyzeXVUrtCsqT6CFDasYGCeABhtwbTGthGUzl2p
         kOxNuo5waQDh4LT4d3pj8GQOVsJOSEJdffM+AfXAiHma56mzTGDc/HqzJ8erwp7hDU6v
         aw1r6iCm5XuNLctRPdxToHGGQxYUlxtD3TKiL7XFChU1/104YXfG/FT64fCze7dxLMGm
         wu9ZWDDcApv6NhpIEYhtruZCh/8I+8zSRCvOY5vi7HQc70Nv0tlhiqAZ8IzviH5CDe1L
         hkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202550; x=1788807350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJ5EPZcsW3BeU/Du4PIisPviXsXnrKzOxO6xL0idyrw=;
        b=g47LOrZdbG68ymmka1xkAZlvii6nN7kmcrW8c5cK28zQEXv6VL2jiTB6QTyfA+NJn3
         NuHefMBxnD78bMjo5EBMCrCGSPmVAr7z89zrxwO5k9EN+41FFItKq6WQDYAFpuJyruyf
         P4VdzRkXMIEdUyYq2Od1ELcegs8yqpWILd4uOwm67/YyH51EFo9A9T3KOJQ86vpn+eo+
         ZYljg2qVQ9BUMKp4KRscPRbgZr5WjCVJRlk0aDFIrNE5SUZQ5jE9OnezWsSq5pbBk+Du
         wAJnmwjcxu4k75IsaoRJwiX4OCfmuzGUGPKxXvTu9H2/k9ZUBQe88R4TLa0WcbrFSYsg
         kKtw==
X-Forwarded-Encrypted: i=1; AKwUvBzqfLGic1b0zsmJwNlT4DBA+W4f7Wkb7dl15XBPFx5xroWTaC9gtjKKhVShhbJp4TWEaW4XugW4f0mF@vger.kernel.org
X-Gm-Message-State: AFuF++kXpOKMUmaKJvbDlDTkODUAqGkLI/fkMef/Jri3anIRNEWMH7V2
	8Swh7X9u7tpcyT1qdWg1l+UmJ3Ts6UMvKeCJv1UBp6JrOypoEBkhwn6PaupQBhBIsG0DntQy8V7
	bxERiF7Oj7PP39CCAOIVGPKHt6mCqVaxAuSV5rCmAW4MFwGlgfX9T99hGBSC/6vqib7c+dl3dyS
	OsnrONGDOKlmGJbhymiWuAHpY4PFuxYs8XOoFW/A==
X-Gm-Gg: AYBFou3r9HjYLZKGT/Na2LfUVKunvgNwG35ciaG+1smtvdEmWgt4oT8/V6XhoQOtf7Z
	Fe7VB0HcqaRQVEeVxZeX8ytC0ODGry2+7t4sgmQCeXtiEXaPRkHkrmsLxGd1PDf8vxR8WgzaP3A
	uCspQYVQ6/gDRY5r6qZzkL3HdxlMUpuYvgvp13ptT8Pk1465oHLKIYneMWgsNtPvkeLPwLLu+cy
	EKU7V8rfY/4L+36
X-Received: by 2002:a53:c30f:0:b0:66f:8731:8d1 with SMTP id 956f58d0204a3-66f87311ba5mr991260d50.39.1788202550326;
        Mon, 31 Aug 2026 11:55:50 -0700 (PDT)
X-Received: by 2002:a53:c30f:0:b0:66f:8731:8d1 with SMTP id
 956f58d0204a3-66f87311ba5mr991075d50.39.1788202544932; Mon, 31 Aug 2026
 11:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826193840.2152000-1-jsnow@redhat.com> <20260826193840.2152000-32-jsnow@redhat.com>
 <877bl6e6so.fsf@pond.sub.org>
In-Reply-To: <877bl6e6so.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 31 Aug 2026 14:55:33 -0400
X-Gm-Features: AcwNN1UG_VbNhAzp5JMRR0NLbU9hcA9dfPYFAhsnI6iviTHK2XjRUfYMif3KYDc
Message-ID: <CAFn=p-Y7AO1QRXGHFsahnWtiERbDuBtFtAj0c6wphrLdZmy4_g@mail.gmail.com>
Subject: Re: [PATCH v3 31/43] qapi: convert trivial intro sections for block.json
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex@shazbot.org>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	linux-cxl@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Peter Xu <peterx@redhat.com>, 
	Eric Blake <eblake@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	zhenwei pi <zhenwei.pi@linux.dev>, qemu-trivial@nongnu.org, 
	Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
	Jiri Pirko <jiri@resnulli.us>, qemu-block@nongnu.org, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	linux-edac@vger.kernel.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ani Sinha <anisinha@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Lukas Straub <lukasstraub2@web.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 9:52=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  qapi/block.json | 41 +++++++++++++++++------------------------
> >  1 file changed, 17 insertions(+), 24 deletions(-)
> >
> > diff --git a/qapi/block.json b/qapi/block.json
> > index 46955bbb3e3..189f2e28204 100644
> > --- a/qapi/block.json
> > +++ b/qapi/block.json
>
> [...]
>
> > @@ -314,12 +310,11 @@
> >
> >  ##
> >  # @blockdev-change-medium:
> > -#
> > -# Changes the medium inserted into a block device by ejecting the
> > -# current medium and loading a new image file which is inserted as the
> > -# new medium (this command combines `blockdev-open-tray`,
> > -# `blockdev-remove-medium`, `blockdev-insert-medium` and
> > -# `blockdev-close-tray`).
> > +#     Changes the medium inserted into a block device by ejecting the
> > +#     current medium and loading a new image file which is inserted as
> > +#     the new medium (this command combines `blockdev-open-tray`,
> > +#     `blockdev-remove-medium`, `blockdev-insert-medium` and
> > +#     `blockdev-close-tray`).
> >  #
> >  # @device: Block device name
> >  #
>
> Not sure the parenthesis belongs into the intro.
>
> I'm okay with keeping this hunk anyway.

In this case, it will be fine as this is a command and the precise
split between intro and details is a lot less crucial. It can be
adjusted later at our leisure.

--js

