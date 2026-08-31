Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FCE36B90A
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788201847; cv=pass; b=qoh/wB/tvZtfIylJBfhWLKkMjIOb09MwF0WMnCkAVeRxI08E2OxChl6hWABrNEG2Z88KMhbCkLE9Nvi0OMY+b9j4Xpta9o4lJ+nlZqQaaPhycgmFT3gVyNgefVC+GT5Z4gLb7OCtM3ZrKgvkdu4hg6YBppwDhZ1rwNdIbvT2xTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788201847; c=relaxed/simple;
	bh=vf5+09dUi2yVakE2E0JaMao3iRm+jgJ4m8tGZgpIASY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmverqgzXI8y+lP1JqFj3PR+MwzUGlq1fB4VS8v0UUZrJ9vlCfkiNCydumlGnczw+moBALeZOO1a7qUj8DVdRqe4kobOBRQejeClBOJN9ukLkN9ieuWvZMNdXQHn9cwzyRw9byc8mJOhzG0g3eb+/CW3VQ/ZdEgbq8SIQGt/dug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7ZqcO7i; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oBRMaBni; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7ZqcO7i";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oBRMaBni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788201844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iy0jZcKpecBsRYb0oiNpQgveju/GEQS8bQ6zsdRVYxU=;
	b=W7ZqcO7i+SyERvLg8JFTFRaCK0Es2NjOZfOaMNgCQf6HCHLciVSDOzKYwasUqC1BjsUgw7
	7n24ezXizgzHD6t/Z/2Emhn+4qZQdPBlGuJ6fyFfl/+R/kxeP6R1LYHEOQT8oynJ7bPxyj
	GZ6JQ7POG/5VllEfv5dnmC68E9/+Lu0=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-jkdBZJw9Myyb4tMbzLiV7w-1; Mon, 31 Aug 2026 14:44:03 -0400
X-MC-Unique: jkdBZJw9Myyb4tMbzLiV7w-1
X-Mimecast-MFC-AGG-ID: jkdBZJw9Myyb4tMbzLiV7w_1788201842
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66e50de8143so4183059d50.2
        for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 11:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788201842; cv=none;
        d=google.com; s=arc-20260327;
        b=VujQdsqq0a4C0xt47JB7gwAo1FT7rg4EIZH7x2yV/RvLoax2D1UHq2YI8hF0s/vQ6h
         NX2T26M3Nt9CtsfgTXQWq6kj+EDyOzqHhEHA4cAgtOfEIDmsN4QJj6DE6JJdliC1mbg3
         txRqlc7XGWKx6iB++VuDbuDgCte8hQUF/q6vfkC0B7wzqx61PoE78hJY/rR+Ijmo+2Zr
         6KF06HyUJY5QnzyHMCi/y03qTWdRPm0gF9vUqwh5sab9lEfPFY2SmFKEU606t8UNLCWC
         UIUoyaREwOZJi+pdqrClkU6aqE+MN1wgSXqzpCWytQScby64Rjok5nsReH9BD7hSjfWd
         RXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iy0jZcKpecBsRYb0oiNpQgveju/GEQS8bQ6zsdRVYxU=;
        fh=nk3VKrY8FfzOqMDJG4NKD6jhXBgXJtkjEeZSR63CvTw=;
        b=d6XW2vEKDkDVgO26MBAX9Daz3i3iuZg8CiZWenqXRZkMYIMLUZfebaxsXJD/Jb/d4J
         EUrx86yFrg1oqAmErvFn0nT/ABsOPWle2y1LFpADq5iaLn0tTu74ysQWqMRj5wy86X6S
         yqJ6r6YpZMj+Ij7dh6hrB2hkfWLQxwiqqm0ynTZwIKMZTeIung2xG9aZD5WOMK+TIyKG
         zEwi9I+vziO9SntmGN/Hn5eX0lJ6yS4MtdkQHcqqosjAUFVaaIscLQFKueR7NDbn1vK5
         qaEoS1KdTAQBaxPbVsRgbCA2mG1JWrFUmWAhhrQyCEAgIiLkkydN1DYbb/bjFmE8zDow
         dA6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788201842; x=1788806642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iy0jZcKpecBsRYb0oiNpQgveju/GEQS8bQ6zsdRVYxU=;
        b=oBRMaBni1xUEL7yBITfgwqNgxSZ27pVXupt+hVnBVdK/CvkzD/cFe8rlxMKEGeI8Eb
         qr0NxBA969SVrWyDPEaMv8Jn/0c36dRLnO7Pr9KuQRmJ15VaTIh/9p8aOL00Qenlek1/
         Ex7kQEKGUBD641+EdEjKmHg55noNNf5mj2Y1lbNCrnl1yT7KlHRUeMCCXhC2zrzOLFts
         Cc8amLZ5o76Y6UychRLEPvl+wsBkJMcOGnwc4WCDcziNrIlBrbcl2n5agkfqBQf8hWiY
         +BJCGwcrJaCUpZ56KUmPPzx/okwnsWGCZdsbvCDDe31+h2TWv/t1fJi0Wp7NMv3oexAU
         hK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788201842; x=1788806642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iy0jZcKpecBsRYb0oiNpQgveju/GEQS8bQ6zsdRVYxU=;
        b=a5QmlCR9Y2Ecj03IST5dOmbwayZckhsQq/NtLkZtTD/qUuv3z4FI5t8qf9tGVnnkT2
         VRA4MMVGcurz4O0L49Hhe74m2WMsgmF4rIYsYD4Y8DblDHie8x02V1UTq6K+skJoBUM5
         LtTZDmDV3wk5sw7GWW3OsLvoKm7Kif03vPZhcSQf4wtJ5i/GKW+ziAbOOYOX6B+hpaYa
         3QvnvAIRDeQiRnkrtzwcYODKg4ZFuH+SDVXijIfLpspOgsJhNycpPAKNEY9idtglqAmq
         NV5pGOnd/S63ViLELlUmJmf0xtF1u+WIwT5pgkx2NWzwgQklgE9CLyLtFo6uoba28p6R
         /zYw==
X-Forwarded-Encrypted: i=1; AKwUvByDpI9SAEDIt7c3iungqHqInwewX+FT6mxRjPkLNUaLav4q19ibIvcwD5rwkJ9lumVyWVMZGUUCk7XN@vger.kernel.org
X-Gm-Message-State: AFuF++ngQ7d1iUgdq6RGG8D5MUtKyLL/F+P0/sOj5tNDOwA+u6l2feFq
	E9tJtmqcu55Xy5Xo4o8GhhiSdTkxYLxuCDEK6iGfGsGThbWNKtA70RyRCEj/38Gasty3TLkeajZ
	pMvgPmRHjg3NtUUDBSKgqMG/siz/r2vCbm8JjqBnLLxVzs8yVpQ4EAsOAx8NnvHoaNgp1pkpqhL
	kMkhJA1iEqjXaZ+nhnKP2Fe2il7R9KVNcJhpGCaA==
X-Gm-Gg: AYBFou1arRTGyNOMDegzYtdEBVx9dgmhFTehrj7fO057nTa12ESzC504FNlTIvsVRss
	HaIXw0dMjV/ztsX/bw9YjcONRE9DsFselYNAsD06VA8mAfgtjEregPz2fCDZ99693UHSZ0trO1c
	J9fpFQIw6s1BF2G1x7oRipUJGA3nzCUJWSD+z4yZ5CJwP8MO7rj2T534pT9oOiqj2Mw3DfHKmyz
	wK+e1p6zyMf81Sf
X-Received: by 2002:a53:e031:0:b0:66b:b123:edf7 with SMTP id 956f58d0204a3-66e4c7640a7mr7909077d50.41.1788201842218;
        Mon, 31 Aug 2026 11:44:02 -0700 (PDT)
X-Received: by 2002:a53:e031:0:b0:66b:b123:edf7 with SMTP id
 956f58d0204a3-66e4c7640a7mr7909044d50.41.1788201841638; Mon, 31 Aug 2026
 11:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826193840.2152000-1-jsnow@redhat.com> <20260826193840.2152000-2-jsnow@redhat.com>
 <ao_-_38raHK0rWkX@redhat.com> <87jypb90c0.fsf@pond.sub.org> <apA-CzGqrlFNfjp5@redhat.com>
In-Reply-To: <apA-CzGqrlFNfjp5@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 31 Aug 2026 14:43:50 -0400
X-Gm-Features: AcwNN1U7U_H0llO6PbcP2SiDomkf5aFXIboSJ6KTmuVOJVPeh4fAMV8BIicxfUc
Message-ID: <CAFn=p-bUTApw73Ddz-tH1FzY97Ct5rfFZ=domFhm-OO3G8COug@mail.gmail.com>
Subject: Re: [PATCH v3 01/43] qapi: convert trivial intro sections for error.json
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
	Alex Williamson <alex@shazbot.org>, linux-cxl@vger.kernel.org, 
	Michael Tokarev <mjt@tls.msk.ru>, Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Peter Xu <peterx@redhat.com>, 
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

On Thu, Aug 27, 2026 at 9:39=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Aug 27, 2026 at 03:09:35PM +0200, Markus Armbruster wrote:
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >
> > > On Wed, Aug 26, 2026 at 03:37:58PM -0400, John Snow wrote:
> > >> Signed-off-by: John Snow <jsnow@redhat.com>
> > >> ---
> > >>  qapi/error.json | 3 +--
> > >>  1 file changed, 1 insertion(+), 2 deletions(-)
> > >>
> > >> diff --git a/qapi/error.json b/qapi/error.json
> > >> index 54cb02fb880..a53b13e55c9 100644
> > >> --- a/qapi/error.json
> > >> +++ b/qapi/error.json
> > >> @@ -9,8 +9,7 @@
> > >>
> > >>  ##
> > >>  # @QapiErrorClass:
> > >> -#
> > >> -# QEMU error classes
> > >> +#     QEMU error classes
> > >
> > > Where is this need for indent coming from ?  From the POV of someone
> > > writing comments, the need to indent the introductory text like this
> > > feels very counter-intuitive, an exception from any other inline
> > > docs syntax I've typically used. Is there any way we can avoid this ?
> >
> > The cover letter explains the need:
>
> Yes, I just didn't see the connection from that, to the use
> of indent.
>
> >
> >     This is being done primarily for the benefit of the forthcoming
> >     "inliner", a feature for the rendered HTML QMP documentation that
> >     seeks to "inline" QMP command argument documentation into the argum=
ent
> >     list for each command.
> >
> >     There are two main motives here:
> >
> >     (1) We want the split between the "introduction" and "details"
> >         sections to be mechanically obvious, so that auto-generated or
> >         inlined documentation has a well-defined, obvious spot to go.
> >
> >     (2) We do not want to inline irrelevant, introductory text describi=
ng
> >         structures to be copied into command documentation.
>
> So IIUC, you're saying that we are going to rely on indentation
> to distinguish introduction from details ?
>
>
> > Note that the inliner elided Netdev's Intro "Captures the configuration
> > of a network device."
> >
> > However, when Intro and Details bleed together, the inliner elides more
> > than it should.  I consider that a fairly serious issue.
> >
> > I'm afraid forgetting to mark the end of Intro with "Details:" would be
> > a common mistake, easy to miss in review.  So I explored possible
> > alternatives:
> >
> >     Subject: Re: [PATCH v2 00/10] qapi: enforce section ordering
> >     Date: Wed, 15 Apr 2026 11:43:45 +0200
> >     Message-ID: <87zf341ru6.fsf@pond.sub.org>
> >     https://lore.kernel.org/qemu-devel/87zf341ru6.fsf@pond.sub.org/
> >
> > John is working towards "3. Make the end of intro syntactically obvious=
"
> > always, specifically "3c. Indent intro like descriptions and tagged
> > sections" with the ultimate goal to reject unindented Intro.  That way,
> > we cannot write an Intro with an unclear end.  John, correct me if I'm
> > accidentally misrepresenting your work.
> >
> > Questions?  Better ideas?
>
> As an author, how substantive is "Intro" expected to be? I guess on
> QAPI docs I've written I've not ever been aware of there even being
> a distinct concept of Intro vs Details to think about. It is all just
> some lines of prose to me.

In most cases, not very substantial. For commands and events, it *can*
be quite a bit more substantial. For structs, enums, etc it is almost
always laughably trivial.

When the syntactical delineation of intro is complete, further QAPI
parser changes will make it even more obvious: any free text that
exists between the intro and the other sections will be flagged as an
error, where you will be urged to move any detail text to below the
metadata fields. This physical relocation will help suggest to the
documentation author what goes "above the fold" and what goes "below
the fold", so to speak.

>
> My only alternative idea to indentation would be to declare that the
> "Intro" is always the 1st paragraph of text and anything beyond that
> is the "Details". That might match up with the way that contributors
> naturally write text where the 1st paragraph conveys the key idea,
> such that they dno't need to think about Intro vs Details as a
> concept.

Yeah, that's roughly the idea; and some prototypes used this idea in
the past - but Markus wanted an explicit, obvious delineation
precisely to *force* documentation authors to think about the split.
It has implications for what gets generated into the documentation and
in which scenarios.

I do usually try to make my upgrades "invisible" to the user, but in
this case I believe we are erring on the side of "explicit is better
than implicit" because of the implications of the text not always
being copied in a precisely straightforward manner to the HTML docs.

I will address the subtleties of this issue when the inliner is being
merged by updating a documentation writer's guide that covers what
goes where and why. For now, we are just trying to do the bulk
conversion.

>
> With regards,
> Daniel

--js

