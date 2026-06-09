Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C82331EBD
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 18:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030679; cv=pass; b=dTp8lP8cqandU4vhKQP/l7h2pVCwbJMhEJCt9P4ZrB9s98F6Z8RF5QaRG5xQS2exvj2MMjhZTG5CBdawU1ayWEX1dMKuhtPUR5iwDCYZrAkhJn6xJmqBoYWUx+RfTP8GWb0pzRard1DwPXzAaQT4EzcEJAbrLsXDrb1WQnu/PEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030679; c=relaxed/simple;
	bh=PQHa6J9RHaoFwBOM901OvbBP1ZZJZSdipGO8+IgeUTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8Gj8ZwaM51Am36XpLymJW8VWSNM/8S8LBQHPSz2fBYulribPsE11FLIaj5wdRnivigEc2dmk5gNwSdQZjMHVzKXTW82NRAEMV91Qxleo7Ot/pi/8iF6ChzV7zxfCSJ0p642yuWRprsJKYVeP21WWlKT/U77EXAJjnZTRx7naso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YG9MsLm3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rgfq7tYD; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YG9MsLm3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rgfq7tYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781030677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AByx2FtauF+8eI0JWwoZcYoW1uS/7f+DmdO9izDp8ZI=;
	b=YG9MsLm39+bAlGdtVs/cESnsl6HBWvqLV014FRnOH3oGLLN12ABwBaigrtO8hRdOkWwc45
	LDnEYWC41gg5tqjfIF1ROpaad5BrneBxltr0v2UQz8yJvZOgmPxalJHv5oJMJum04RF+2g
	hYcpG7KeIhiA4XQvwfLV7PQCcl/jogc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-xXt1w-bvP5mRCSBqidnAwQ-1; Tue, 09 Jun 2026 14:44:35 -0400
X-MC-Unique: xXt1w-bvP5mRCSBqidnAwQ-1
X-Mimecast-MFC-AGG-ID: xXt1w-bvP5mRCSBqidnAwQ_1781030675
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-914c8954923so464083985a.1
        for <linux-edac@vger.kernel.org>; Tue, 09 Jun 2026 11:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781030675; cv=none;
        d=google.com; s=arc-20240605;
        b=hJlUrlqDS8vRJJb3q9bGe84fAJehmYQfNbQOUizsAjSQl8GOL+1zsPXu9N0MVpUDB9
         onJdJiDfsoNxhlkGMFpDUCkUvYbM2lSgGm2t6g5U3tE/xqitML3L+HXJaiGp2P+EVIwE
         e0AbaouxtQQUGQLbvBo5/XPEkdanw9yk43B1BFiTjz8/ftmXKNnahiM/MVvrfo6ffrxq
         vyQG4qVl/xyH0jIwScQTzbZbXwyZeQNES+iBJLx1riYT6yUBgI/5EtTD0nA5fJ7j/dFN
         7JfSUCzN9c9SSNEmAOdXWF58RJZl5nueG6EHwH9dKOFfLSMlhHPnfE2/qAsLaOqfA3a7
         Amww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AByx2FtauF+8eI0JWwoZcYoW1uS/7f+DmdO9izDp8ZI=;
        fh=jt0kNQRBQOpHzGnVjDmOJO9THsJXKv3w0Hiyvhc5ODI=;
        b=hWbJTSgyA26BYrAaXThUElLQV9HUBhWcjl3OWttHHWzaVyVU04ZCV0iHqFidr4qa97
         Qu45GBuYi7FbZZva6nU3PBLp0LUgcYD7JPaq8sfWCfyemXeeI+VsJKHwN2PrjCSE54e/
         ynnOAtU1ZJb0X9bgTj7tOcuRea49Dduuuj2uMO0dyAw/r+AbCAF25EKkuZoh87DW+Y+I
         wJd0SxTv1mr08gvRxG7mAAfP6Jg0RoFC+t4YwMnlbQpw3uPH/alzJjdm0wcOuTipX0oc
         ogOVaJBz420jqKgK0tWm4ZQNsQunzmSCZ7VST4MIqLP/n/kDDvX757nz5c1bkfvuvGz/
         R1/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781030675; x=1781635475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AByx2FtauF+8eI0JWwoZcYoW1uS/7f+DmdO9izDp8ZI=;
        b=Rgfq7tYDIdEAI+ybP6g0vgbNzeMvXatIUHqFHdEOHThtLAwGxQuuoPegRakYV4Mhsh
         3aAxPX7quneOVleetqdHSFUuD0DWK5JDJ64XKcrURp+7Hc6DVmXzSxaphbuH52GIAb2O
         qsYU3GTJLadYGWCJN7oAcs8LrT5MuptzYzwCPjiS6/cQNMl6h3dxF7RWTXdwzG1jd47x
         bH1uWy17O/ZyIPGg1ftua3bCSajb2qw6MVWn5M55DAw7RheRWSfbQh6rMndKRb9W2lYu
         62+yr+LdXtQz0AriSchvGXIgKEmUi11JLR6pJ6EnD2b1BXyNIw+KUt+uxD3FL710r8/M
         AeMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030675; x=1781635475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AByx2FtauF+8eI0JWwoZcYoW1uS/7f+DmdO9izDp8ZI=;
        b=izSZ5V/+mliA1WETsAUOOZrg4BdQ6BXwSLDSKghnUxF9Zw185tqLJ2y+roG2/+6eN3
         KNUSs8aUPKSatoyt9z7FuRlyvtElZObss9IaSXmzHHbC57baJT7SBUGi7PKL7PKLAS58
         vYepiKn10wz0Ie/iWJ3LP6n3gC+VMCVIkWoFLQpGBuYziZPG8q+8CyKIQSMh5u+Qnnnw
         RKYswwCT78FAYEUyyBWw/g/z2PGfMhdeIUXAvUgba2MY74RTcKjEgmd68HZ39Fbnnx/7
         V30tgeyYiv97eQdeA5wwiHyu01gS5MMs1J0y0pQYfs4dlNUNE9e7me+IqNjoSxYIPw70
         AdlA==
X-Forwarded-Encrypted: i=1; AFNElJ9KInV5aAhNJzFeqYJiINR8ku5QxXxi264YTSzRCUo6SKkDyCzL681iTxMQ3zb9zTixa16/NxNTT2CD@vger.kernel.org
X-Gm-Message-State: AOJu0YyUauBNm0PX9XMzw2kTjDCKqtDmVKSZ7U+orbtUfa85RukJjpMr
	EmZlXl4aSZ9R2GEmSLC37ZDdTMesllvtuOcTcCj3uHfpeeUPE1eRhn7MyQT0aCKjOi9ovPmOJC/
	xlwM47tl1mV0Vn/MienEAi7V0WLrXcqwzc4uqEnM7NPUV8imJWwb/pDcm8/6DgmfLeFCA4AEx1B
	83dEQFSYXGf1+a64l7EMMPNT89+EISLUFUhlPUnQ==
X-Gm-Gg: Acq92OFsfvhJ+J20GKRIzUi49GuR1HiHE76ePdV1dOmlNGwoUxvdjok29A/Vg+GiuhA
	bGy5EYSXYclfAL298i3kc6MJq3VrrNZfN6fXiC0ecrNF3Z4nJQEPTuB0RQrkizFuX7qEXdyIcqj
	yvhA7q9MH+I6lPblCBfGN5Zu2FprGDnmtvnbzafAgDSYkqfyMX/arP8SmUh6qcItLX1QYKBTw//
	KcH4xWoBitkCQvD6adbuJCEVUsFQSouRfBe3xDuJLVh7Ex9
X-Received: by 2002:ac8:5788:0:b0:517:29c1:2b58 with SMTP id d75a77b69052e-51795b674c4mr311254421cf.48.1781030674823;
        Tue, 09 Jun 2026 11:44:34 -0700 (PDT)
X-Received: by 2002:ac8:5788:0:b0:517:29c1:2b58 with SMTP id
 d75a77b69052e-51795b674c4mr311253601cf.48.1781030674294; Tue, 09 Jun 2026
 11:44:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603032201.993015-1-jsnow@redhat.com> <20260603032201.993015-10-jsnow@redhat.com>
 <87ecinkgnv.fsf@pond.sub.org> <CAFn=p-aXcHomC4r=Gh9yQhoQzFDqxqTc2YTpaE-NOgiYDQRx_g@mail.gmail.com>
 <87h5nbon3y.fsf@pond.sub.org>
In-Reply-To: <87h5nbon3y.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 9 Jun 2026 14:44:22 -0400
X-Gm-Features: AVVi8CdTfPyMB5qd05xDjln5PEzohNNuyuVLB_fgaO3XbOny2JH-azy36Gfo3p0
Message-ID: <CAFn=p-a8hhJ7AQpCJZ=C_P8SNdYuv0Hp301DeFLKg8mhkiRCyA@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] qapi/docs: adjust stub member insertion algorithm
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
	Michael Roth <michael.roth@amd.com>, Igor Mammedov <imammedo@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	linux-edac@vger.kernel.org, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 9:33=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > On Wed, Jun 3, 2026 at 7:27=E2=80=AFAM Markus Armbruster <armbru@redhat=
.com> wrote:
> >>
> >> Quick first pass...
> >>
> >> John Snow <jsnow@redhat.com> writes:
> >>
> >> > A forthcoming patch removes the implicit PLAIN section that always
> >> > starts a QAPIDoc section list. Further future changes begin converti=
ng
> >> > "PLAIN" sections to "INTRO" sections. To accommodate this, the
> >> > insertion algorithm that places stub and dummy members must be
> >> > adjusted to cope with not only the finished state, but temporary
> >> > intermediate states while the series is merged.
> >>
> >> Perhaps:
> >>
> >>   A forthcoming patch removes the implicit PLAIN section that always
> >>   starts a QAPIDoc section list. Further future changes begin converti=
ng
> >>   "PLAIN" sections to "INTRO" sections.
> >>
> >>   This will affect the code that inserts "Not documented" descriptions
> >>   for undocumented members ("stub sections") and the dummy section tha=
t
> >>   marks the spot for "The members of ..." references.
> >>
> >>   Adjust the algorithm to cope with not only the finished state, but
> >>   temporary intermediate states while the series is merged.
> >
> > Sure.
> >
> >>
> >> > This algorithm can handle zero-or-more PLAIN *or* INTRO sections at
> >> > the beginning of a QAPIDoc object, in contrast to the previous
> >> > algorithm which assumed and relied upon there being always one PLAIN
> >> > section at the beginning of every QAPIDoc section list.
> >> >
> >> > In other words: (PLAIN | INTRO)* <EverythingElse>
> >> >
> >> > This does not impact what the parser itself will actually produce. A=
s
> >> > of this patch, the parser will still always generate QAPIDoc section
> >> > lists that start with precisely one PLAIN section (whether or not it
> >> > is empty), followed by the remaining sections. Those remaining
> >> > sections may or may not include additional PLAIN sections, but never
> >> > two such sections contiguously as the parser will always treat that
> >> > layout as one PLAIN section consisting of multiple paragraph(s).
> >> >
> >> > In other other words: This insertion algorithm is more lenient than
> >> > the parser, but this is on purpose for flexibility mid-stream as we
> >> > convert QAPI to using explicit introductory sections. The allowed
> >> > order of sections will eventually become strictly enforced in the
> >> > parser, which will in turn allow dramatic simplifications to the
> >> > insertion algorithm. This only exists as transitory code until we ar=
e
> >> > able to enforce that order.
> >> >
> >> > Fear not: the intermediate rest output before and after this patch
> >>
> >> "ReST output"?
> >
> > Sure
> >
> >>
> >> > are byte identical, so failing all else, we at least know it doesn't
> >> > make anything worse.
> >> >
> >> > Lastly, because we have three places in the code that need to insert
> >> > stub/dummy sections, we take the opportunity to consolidate this cod=
e
> >> > to handle all three cases with one function. This winds up
> >> > necessitating the qapidoc.py generator actually modify the section
> >> > list to insert a "dummy" member that acts as a placeholder for "The
> >> > members of ..." text. While it looks like a code smell to modify the
> >> > caller's argument, it is ultimately safe because the QAPI Schema
> >> > object is re-parsed and re-constructed in memory for each individual
> >> > process that needs to operate on it. In other words, the Sphinx
> >> > document generator already does have "its own copy" of the section
> >> > lists, so it is "safe" to modify here without regards to other
> >> > consumers of the QAPIDoc objects. It only *looks* like it smells
> >> > bad. Ultimately, this code will also be removed once the inliner is
> >> > merged, so it is only a temporary aesthetic issue regardless.
> >>
> >> Such trickery, even when safe, risks making attentive readers go
> >> "WAT?!?"  I find it tolerable only because we plan to replace it fairl=
y
> >> soon.
> >>
> >> The code finding the spot to insert stub/dummy sections is more
> >> complicated than it has any right to be, both before and after your
> >> patch.  It reconstructs information the doc parser has, but doesn't pa=
ss
> >> on in usable form.  Passing that info on would likely be simpler and
> >> cleaner.  However, you tell me your inliner patches also simplify
> >> things, and they already exist.  So let's go with those.
> >
> > Right, the basic idea is this:
> >
> > - Differentiate INTRO with new syntax
> > - Convert "PLAIN" into "DETAILS"
> > - Enforce strict section ordering: INTRO only at the beginning,
> > DETAILS only at or quite near to the end
> >
> > Once that is cemented, the insertion algorithm can become much simpler
> > and dumber; e.g. using a map of regions where we can append to the end
> > of a region without having to iterate through to find our sweet spot.
> >
> > Since that's the plan for the inliner anyway, some temporary ugliness
> > here in order to ensure that we do not regress even one byte seems
> > acceptable.
> >
> > Additionally, once the inliner is merged, we won't need the "dummy"
> > sections at all, so those go away entirely, and all of the ugliness of
> > that particular part of the hack with it - i.e. no more modifying the
> > caller's argument to insert a bookmark.
> >
> > So, it's a little gross, but it's just a band-aid to get to where we
> > want to be; and it isn't as gross as it looks.
> >
> > With your suggested commentary changes, do I have your blessing to
> > push forward? In the interim, please review the rest of the series so
> > I can send you a new version.
>
> Yes, you do.
>
> In addition to the commit message changes, I'd like to have a comment in
> the code.
>
> Perhaps as separate patch before your series:

It's easy enough to add it as a separate patch right before this one
instead of in a separate series. Added in with no rebasing issues, so
I'm going to do it that way just to avoid any potential merging
issues.

>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index c3cf33904e..844afc6e0e 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -852,6 +852,12 @@ def connect_feature(self, feature: 'QAPISchemaFeatur=
e') -> None:
>
>      def ensure_returns(self, info: QAPISourceInfo) -> None:
>
> +        # This is more complicated than it ought to be.  The doc
> +        # parser should already know where a generated RETURNS section
> +        # should go.  It currently doesn't, mostly because it accepts
> +        # tagged sections in any order.
> +        # TODO Tighten doc syntax and simplify.
> +
>          def _insert_near_kind(
>              kind: QAPIDoc.Kind,
>              new_sect: QAPIDoc.Section,
> --
> 2.54.0
>
> We could adjust the comment within your series to also cover the new
> uses of _insert_near_kind(), but I don't think that's necessary.  It
> should serve as a reminder as is.
>
> If that works for you, I'll post the patch.
>
> >
> > --js
> >
> >>
> >> > That's my story and I'm sticking to it.
> >> >
> >> > Signed-off-by: John Snow <jsnow@redhat.com>
> >>
>

