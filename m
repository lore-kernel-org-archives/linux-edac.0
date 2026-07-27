Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912842BC44
	for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 17:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172590; cv=pass; b=fFspnXx+rV5lNHLerj8O/lTlu2VQ3z8O4KDXGtkNmxkUsKylr2iyNqwEJ6GTbTb5oeeAunBAKKTkDoHpAlwWdNDiH1GV+xUoRdN2hO4Jc1PwoXWBpC4zLrG1ofXmJfAC5s7w7YKZqONTLXyHsx7SZVYbPmHSPNfb0R4GHCkm12Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172590; c=relaxed/simple;
	bh=hFH4zZBkUuQuXO51qpxPQA7VKLl2bwS5UMexaJYtPqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYmhrajQGZexsAzh1QLLeESViDps4edDIgUThQkoGaQb3XGbcwVZkX3IBizB9J4MJCvzFAB+w9IjbG5UmwTTM1CBe4Rv8A8r8NLmQWDNGobIV4SGsfS2gFM7K6Dg2k/isHq/0B1Or1YlRulR54teN6Gbl1YJi11Da5hzkZHYCnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MiReFNi/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bKEsmYq4; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MiReFNi/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bKEsmYq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785172586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3mGFXZevARNc878mJv43Auua4IFTv4YphZThywYfhE=;
	b=MiReFNi/aYFFlxbIP7VjlW6PeFOHTLjwtn4Em0sA7OSItj4X07SnBesyhGACa7zcWsnekS
	teKk27OC3ymrxpM4qSFdJ8pJ+TQHv6MHztu7TRPrqw0VQQZqCojvCvTIqVYz5Q8UOTluJ4
	jFKCoayP3IO9vkrPjWUaVJWyDk9nQuQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-1qMj7F_BMXmM_NQOPPkZ_Q-1; Mon, 27 Jul 2026 13:16:25 -0400
X-MC-Unique: 1qMj7F_BMXmM_NQOPPkZ_Q-1
X-Mimecast-MFC-AGG-ID: 1qMj7F_BMXmM_NQOPPkZ_Q_1785172585
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eddfe28b4so77349617b3.3
        for <linux-edac@vger.kernel.org>; Mon, 27 Jul 2026 10:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785172585; cv=none;
        d=google.com; s=arc-20260327;
        b=LJ5gI3r3o8GXc6Gqydh/GABY54Qjno60/Y3EVrviDbF8Y0euuDBr5UZgMTPG+CaCHP
         tGUPI1d3HJHt7sM3E822gH3TgaeTnKGZhJ3isEDVHu3Jb/cJIhdqNCnbJazRO3n8ANEQ
         eOH4o6LB4PweeuzQ5bqccNYvHP6w88ooliavFQ6Z1/hpgNxJWILfD152tJnxeMJ+2UGH
         pRhU9xr/t9L6ze0orMTlROMLCLd2iImfftQ/rkHH8lvLBbfp2jiF8MH9eickeeEpAKY9
         BCm6DnzXZOAqooTFqQ4/hQ3tSEd1ysfggLfbJCaOKAx4H7Wy3+KzqBH6D7woZs+W565p
         H8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3mGFXZevARNc878mJv43Auua4IFTv4YphZThywYfhE=;
        fh=y4qLJUh0WvXT4I72HWnwQ6p8rKboNBGV6E81ke/C1TQ=;
        b=JkVvBb3phPFF/jcY18vQhX1tSvnA8foqXWzpxb7JPUgHbGKKyDXAWRD5JXOA5HGijA
         y69FyaKVrwk8debuVrHSOdkphquY7RM7VTxysjfAJ7jYWNUQdhjgPeXwPJk/VGX70NKl
         bywblIdsyQxHBTIS/rgFp7OWZLFPuDuXah/wv6jr24Wr5xwvX5SWJCsne+UzTa209AWp
         pyX3YAz13C6ZPvN9NnHYlj7R3bNm6a6B/YHagBI3ynnxXpwQYiNquGO9wbUEcidYAHFU
         OplO2Oziac+YNgmY3bXTF0sN1954TN/EOb7whNu0BjF1c8hjM5lf/9ktymlLKDaURRnb
         rq5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785172585; x=1785777385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3mGFXZevARNc878mJv43Auua4IFTv4YphZThywYfhE=;
        b=bKEsmYq4F3e1JgtncBukv4r6LdvSk0ufBkWoDRJ/Zjh0l75+np6hlUU3OAYwxLEXa3
         kWFhiSD7SZ8bPhlmv0ZSphvnPJ1TjWMnj7OTXLZuVRs96QtFUKfm5m8wKka8YOFIekKB
         dJO4PEkZAjiBee+dhharJ7Ut+egATeH7ke0okjaGub7hxBLoOcKuWuzob48ZjLcpppdx
         CUvXmEKDR6Fo/sv5w4hPkANqK+edVYWogdNKJHy+FWUq1Plc2NMWTq8ZDnVuSl0W+RpB
         R1p8xs88eu0BxC0xuMDjZfHl5Axol3X9A3vdXwC4W6pINB7h0Fcm3/OxAG95SrZj2SeW
         PRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172585; x=1785777385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3mGFXZevARNc878mJv43Auua4IFTv4YphZThywYfhE=;
        b=MQJ/ToFscqChCogvHx4KxsI9GUhr4LGWDUE8VpKCNEvkT5qAtwBFAlwud1/V5W0fK4
         FDnPJ0wctYjd1yHoVCCeYwzkxUzhiPTP6EbrPe9f5Uh0HbO9jCirhBJBibmGgAgxDl5v
         jrdm4jw8Fu07VTTYaD7FmA784aWUW5DS+jScebFJPokqXLKt6YJqlcYrG5WR1xwK2RzG
         rhRwtDMx7swBGBYEtvVDe7S8fK1rbvNUCmGC/zmooN4eUdxB3eyqUHcb8p5wGwwRghEK
         Xlt/8/B1mmK+x4AmDysiZCbIYsMyu4WJykOY9LkH8P1AVUBdf9CRbialFcSYFxHSsOqG
         wLiw==
X-Forwarded-Encrypted: i=1; AHgh+RpQCsQE2P0BPBSGShEWKq4t+eiIsh28zTHQuOz+r1wmBr3c0+iRz19C85nd7ElzPPbevuH/xgfdJcJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUbHh/pwov+bnnCNqO3R58FNIkbMgZwPwBzk8IeKQGBlpTi4f
	EbNB3IY+AfKE3AwmgnqjTXpCYwokzUEJnE/3xD4urOETe2eHAjmVIBHdcoorQqAeG52g2e+kds/
	jg/OTopLckRD81k6HaeNO+9VjxWgKfJZAzD34LsKxd4TqsCqt594GZt2Si0MqkJ7JAKwgywWw8n
	Lr89o1A4ItirkSMOHKm3jzcmw6vJ6QxMxVXupcGw==
X-Gm-Gg: AR+sD12eqcBSpMa9KpD0SPiXAHikGiR0pvi4i3t/OXqeSyzRF6tPkg/Skedjwf0nntB
	KFUuGONM684cplO5XS5U4K94g69iXN86tjAxVRczHPLnTMCHNTgizBgkKBs1vFot7mwaOrsVTOY
	lkm7q7DyrrvfJMURoMLnMKNKuYI9bckwFfqGF9rObaMAxzoDSTlbpq5MzNULNdv+FOYT4nqzo3K
	wfqgEZfSyMQltG6
X-Received: by 2002:a53:d94e:0:b0:667:af58:8d68 with SMTP id 956f58d0204a3-668ffdf6f05mr48348d50.61.1785172584838;
        Mon, 27 Jul 2026 10:16:24 -0700 (PDT)
X-Received: by 2002:a53:d94e:0:b0:667:af58:8d68 with SMTP id
 956f58d0204a3-668ffdf6f05mr48336d50.61.1785172584382; Mon, 27 Jul 2026
 10:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723044805.527643-1-jsnow@redhat.com> <87ik65g8xm.fsf@pond.sub.org>
 <87h5lobypc.fsf@pond.sub.org>
In-Reply-To: <87h5lobypc.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 27 Jul 2026 13:16:13 -0400
X-Gm-Features: AUfX_mxQww8G_sDN4rPtGqGYLANzGPwYtpBIHqm73aQVX56k63-nE7PKd7bUCQA
Message-ID: <CAFn=p-Z0Ys6FoUqRPY7d5CaN4YfHE4DUN6VLtMeWRJgUk3Khkg@mail.gmail.com>
Subject: Re: [PATCH v2 00/44] qapi: convert trivial intro sections
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Lukas Straub <lukasstraub2@web.de>, 
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, Zhao Liu <zhao1.liu@intel.com>, 
	Laurent Vivier <laurent@vivier.eu>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Alex Williamson <alex@shazbot.org>, zhenwei pi <zhenwei.pi@linux.dev>, Hanna Reitz <hreitz@redhat.com>, 
	Ani Sinha <anisinha@redhat.com>, qemu-block@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	linux-cxl@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, Fabiano Rosas <farosas@suse.de>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
	Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-edac@vger.kernel.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, qemu-trivial@nongnu.org, 
	Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 4:04=E2=80=AFAM Markus Armbruster <armbru@redhat.co=
m> wrote:
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> [...]
>
> > Converting single first paragraps is mechanical.  For it to be correct,
> > this single paragraph must actually be the overview, and not some other
> > crap.  I expect it to be almost always overview.  Not sure how to best
> > look for the exceptions.
>
> The separation truly matters only when the inliner inlines the doc
> comment.  It potentially matters when it would inline it if the type was
> used differently.

It also (potentially) matters for auto-generated docs, such as
undocumented members, return types, features*, errors*. The break
point is where these fields get inserted.

(*Not currently performed. Not asserting that it will be performed, or
that it is necessarily valuable to do so. Just fleshing out the
category.)

>
> If I remember correctly, the inliner inlines doc of struct / union base
> type, union branch type, command / event argument type.
>
> Argument can only be struct or union.  Base and branch can only be
> struct.
>
> We talked about maybe inlining return types some day.  This would be
> struct, union, or array of struct or union.
>
> So, for anything other than struct and union, the inliner doesn't get
> involved, and separating the overview cleanly is just a matter of
> writing style.  I'm not sure we care.  Even if we elect to care,
> cleaning it up is hardly this series' business.  In short, your
> mechanical conversion of single first paragraphs to overview syntax
> should be fine even where a paragraph's contents isn't clearly overview.

Except in cases where stub positioning matters, see also the former
"TODO:" syntax used to delineate intro/details.

>
> Structs and unions, however, could use an eye-over.
>
> [...]
>

