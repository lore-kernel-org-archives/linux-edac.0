Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D744AA57B
	for <linux-edac@vger.kernel.org>; Wed,  2 Sep 2026 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369897; cv=pass; b=P0FRvbLIs6w5t6djNWGQrS5v11yVhznrwwh1YMYOMt2Xf1/HiTdQkq/Gmt3zrL64fKdUSMALh6CDLvqppl79rxy7tersHVulQ3qtNTXwKe3di7eUjKv44pz+Xuwf6iQMmlK4j/SmBKR49cHMDWEqpdOEZgejltn+GpflzAIPHH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369897; c=relaxed/simple;
	bh=N5itlC390yfvl6p6qW4Tuf3E23PRHdkct42mfOBzo6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMvh6LObqLU281O2RTHNbadtQZGKxhAF7E62MmWdTV8H4IsivIJ6ETEowp4jZesp4qiyiSMSm5vOSbRnMf8WR7RyRN8bNlMBGXiOl/VXliKk+tWdhQb4f9ml4EoIKDZJ7lyz7pT6eoR9zLdbnlPeeX2TwBx9PaUbS4YDF6EkWgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6FDsv//; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rhj9ROHr; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6FDsv//";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rhj9ROHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788369894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtfXQonqbMU0qfMOMFckgTdI7kxhGi1jaT13EBgtRUU=;
	b=i6FDsv//FDOJhBw5HQd2LhSl5NZON+ywm5Qwz8yAVJ3Y4TA/FOFtqehWCU0Bhee7++jc2Q
	0KXyoIVg9QaSJbvCYH17R0yof+U/KtsVS90Xu5J2QaZauBGQvvTwHYjApI7JnmKKKVPQbo
	+IZEC59Pdbjsg3zyKRTeNXvDvyzv19k=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-4Lr_T4iQPhurZ5-nKOa4_Q-1; Wed, 02 Sep 2026 13:24:53 -0400
X-MC-Unique: 4Lr_T4iQPhurZ5-nKOa4_Q-1
X-Mimecast-MFC-AGG-ID: 4Lr_T4iQPhurZ5-nKOa4_Q_1788369893
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66d309b367dso1187923d50.3
        for <linux-edac@vger.kernel.org>; Wed, 02 Sep 2026 10:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788369893; cv=none;
        d=google.com; s=arc-20260327;
        b=Y4YgBtSTeZvnHprp4Imk/radia9GYXMDHXGqAstqAVjhdyi4d6y16uniRzwOxLfDTR
         jWMlIIviJVzMbttoUFQoETxjjbtiXcsqlvCQSfhEsFC/UARO2Xkm2Fw5DaiGXjypZ07a
         rbaB6aOIX+h13DP6+c7A1CE4Y5x06mLrxE3d0M31/0wlL/r65ZuqjZYHCTHkjP9ARYJp
         oCXq1tJKEtAZcFaJflmp1sJOHiNMbYKFkq+NHfUNR6XDWMlVhJsH1LSSStTVYQUnwj+i
         hKuJSp19WFWFfL24eZe/v3VMpEVUJBaaJXZSetTqSX5a5kQRHxz1IDtKoseakjG1jZHM
         pTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JtfXQonqbMU0qfMOMFckgTdI7kxhGi1jaT13EBgtRUU=;
        fh=8gRkFMQizqHHqvbLEYSzv1riiZ9J/AYYO1P8wg0hAOA=;
        b=jgHMvDjYL6VMv0JGStn915ZLCUrJt6s9bscg6XqrcfhqSbn40D1XJEMKfLku+75oDs
         SMyzbTKBSxFY4OKN0z9+RHsxE9TziaB+wxmljRqMZBpw8Ub7tZiUpzvrYqCgjWBEX1EM
         ufKtQmJDkl2spYapcpyOukHKFA25g+Vzon/TQGw/vCLxDjUMN89jNiXEM/0luKzC3Ew8
         dypqXiVPhPM1GlXmR0h6zw6be+CGpgVjZuyCTidM+Ty5hACdjPk2V6smWYzftSR7Py99
         jgWyrTVEwSGv6WJr6DgvaURqIk3pvkV94D6FRJpUs/Ke7Da+NWzu9QVktvX4C1+bS2fG
         Tt0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788369893; x=1788974693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JtfXQonqbMU0qfMOMFckgTdI7kxhGi1jaT13EBgtRUU=;
        b=rhj9ROHrkLBiuyVxfJHyOyj5FMTGgyUZCIqKHtGgKwMFtrpgGM46OOJRnUM+uCTu86
         FbKpwkBtuvLysuIw6pnMU2QCTN7klp03OLpGuUPZhMgtDR28QuMZe4h51Hmws9GigT7x
         Cv8wCK2FKMPVTv1yA8Z/M0cUlC3N9cqXKdepXDfZf83MWCd29BDDJsWn7WNIj5mNlrH7
         12uHspVflDWXnnlLOzhZLrsu2adFZ7Vn8AA1m399K++EHGn+9sgF+BkgbeuEF0++jn90
         JkR+COft7+aP9vMUxyVk5ev/EWVjtrcaVPIOVQKlQC4l82buqWg5pAaMuWRXpBPhLsP8
         x5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369893; x=1788974693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtfXQonqbMU0qfMOMFckgTdI7kxhGi1jaT13EBgtRUU=;
        b=dVmJ8MEjQgkWPmeFYwZcRmXHvWcQuxazi9iXY8aMnQ3VHkZeGNPnvZyXR7kO9QFMVn
         5o3aXpw2VaKnhf2MfBtPQNH5TJYmnTU1ho63oSzTZ1siZDlJaxvsLrHNb9ZlPG6nePS9
         iV7qSqHy++mAonmXqFD2Cgx/MnlzNJfTBRzjnq5xKEBVwbWNSCqPEYKIxV+n6klt1frW
         g4Gk8E7RVk/8igjrWp777W8lyZ7Oe1MlUNjuTBsGMzYDUCn6oK/r9mJr7mPeHqps3a4S
         gacVBKhUiCqJOQ4yPVG7cLpACUROQVf+9cf6uP2NLtDCqeruzPk+LrfUvK/bQ0b7zKLT
         4BGw==
X-Forwarded-Encrypted: i=1; AKwUvBxzSvE88mcoBOgHuSxdJdCpPd72scFl3lwYALcDhM09mosXUQf6hc2e6Af7BChsu6V8+MnCU+WaSyww@vger.kernel.org
X-Gm-Message-State: AFuF++nB01c0zTmxQACWouDBpaG3LiX6bkTIYR+tyqRR+F9qHMiNSkba
	hNJzGNe8q1pa/xWgHyZzyPFeEJ+beM++2iYh4fq97xuMc03CUaDF+cV5ibuvh71fvcNkVE+irNs
	tf1Svt91H4sfXtQw0Aud8Y7o8w8Ky6h4wIdwOz1v3cw189hgf9ltkIxxHsTHn2R95gM9dn5uP19
	c6lvUWC0VABYIO3hFvxBoxqSdK3Rhj0zgiLfPvKg==
X-Gm-Gg: AYBFou2aIQ1ICxuCeep7f3kInHfYcLipd+t4H+h9HUjqyqSgk6Cb1kNlQgP0L/bfEGR
	+lh0j1NL/5x3nY87CTBwAWfAiRVxx7+ayw0e3C9/pKoa2mI4QPcsagKAZvNDKe0m9Ho5q0VrZd9
	ch5XeJdqcoQX2S8HYciEKBJw4KZDYnG7HCtY5eYTXq9cMs8MNl0KyGRNzNZjq0zptwPdZz78H1H
	nxcgKmahJSKvcM9
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f9b6c6c7emr1993915d50.0.1788369888112;
        Wed, 02 Sep 2026 10:24:48 -0700 (PDT)
X-Received: by 2002:a53:c051:0:20b0:66d:2c09:fb70 with SMTP id
 956f58d0204a3-66f9b6c6c7emr1993889d50.0.1788369887644; Wed, 02 Sep 2026
 10:24:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831201945.287730-1-jsnow@redhat.com> <871pbd9qpy.fsf@pond.sub.org>
 <CAFn=p-YBpsxy-3tr0SZ0CBfXUYnb6eg6AxNWpwUQmsuY5ZuykA@mail.gmail.com> <874ig7539j.fsf@pond.sub.org>
In-Reply-To: <874ig7539j.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 2 Sep 2026 13:24:36 -0400
X-Gm-Features: AcwNN1XBjb54T3mVZMsXOfq2ujX90-DJwsczseD1fmwpMjm1p4yXf5IyvbishUI
Message-ID: <CAFn=p-ZMj03qA0tvLU34FHLcwBJjU0c2q2Ex1p06FJfZpwyuJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/43] qapi: convert (very) trivial intro sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Lukas Straub <lukasstraub2@web.de>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, zhenwei pi <zhenwei.pi@linux.dev>, 
	Jonathan Cameron <jic23@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Jiri Pirko <jiri@resnulli.us>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	qemu-block@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, linux-cxl@vger.kernel.org, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Alex Williamson <alex@shazbot.org>, Stefan Berger <stefanb@linux.vnet.ibm.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>, linux-edac@vger.kernel.org, 
	Michael Tokarev <mjt@tls.msk.ru>, Fabiano Rosas <farosas@suse.de>, Zhao Liu <zhao1.liu@intel.com>, 
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, Eric Blake <eblake@redhat.com>, 
	Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-trivial@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 6:58=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > On Tue, Sep 1, 2026 at 7:05=E2=80=AFAM Markus Armbruster <armbru@redhat=
.com> wrote:
> >>
> >> Series
> >> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> >>
> >
> > Thank you for your suffering :)
>
> You're welcome; it's my job[*]!
>
> > So, I think there's actually no real problem in checking in a partial
> > conversion as the infrastructure was coded specifically to allow it,
> > however you're the maintainer so I will follow your lead. I'm more
> > interested in moving forward than telling you how to do your job ;)
> >
> > The series will eventually enforce strict ordering, so there is no
> > chance we will miss anything. If we send a PR now, we also don't have
> > to keep rebasing the partial series against master. If you don't want
> > to submit a PR, please create a branch I can track and submit patches
> > against, and please periodically rebase it against origin/master.
>
> I worry a bit that having intros split about half between two styles
> would cause confusion and friction.  I'd much prefer to get to >90%
> fairly quickly.  If we think that's possible, I'm happy to queue up
> things in my tree, and take care of the rebasing.

Everything up until the "convert multi-paragraph intros" patch (#44 in
my pending work) is approximately 87% of the total volume of
conversions. In the most recent off-list mail I sent you, that's
Sections 1-7 -- which is essentially all of the stuff that was
factored out as "semi-trivial"/"simple", plus the "TODO" conversions.
I believe these are pretty trivial to burn through, but would require
a bit of dedicated time. We could probably do it in a week if we
really pushed ...

Existing volume of what you have reviewed and accepted is 55%.

Well, either way, I just don't want to have to juggle so many patches
in the interim, so I am pushing a bit to just merge it to make
subsequent series easier to rebase and juggle so that e.g. I don't
have to have increasingly long "based-on" tags.

(Makes sad, pouting noises.)

>
>
> [*] Some days my compensation is compensation for suffering ;)
>

