Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8FA3446C4
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781028384; cv=pass; b=Ek+0qEvLMFtF8O2dGOhOrtoNfuj5hGxbl2q69hTEOYrvt3k2+0qTQ06AbWTx7yJ1ydfRNvALa91Ow9JYvWVvuAl6RZpMToqJ+1CGzNYCwKfIEkHjDekQA8hI+ptNIa9WR5HNrzFDuY2e6dGhjTb5m11GICKqPJIsEnFyw4KgjJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781028384; c=relaxed/simple;
	bh=L9UzuWqKM5Y/vX4NZio0q6ub8a1X8xlT+dlyuunG1PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzDjXIo6xLRQU83ILbYuk9jOBN74mAytygtaJWZ8LjNanVAjMal7q//iSnp584XOn7ow0MbInQBVBIlE4v/LhqBhWhdplzrVgHgyE9N3Iza7xXZGndGKXOxGSA3MCedeCXayMZp5YujvyXCktMqbwP8y1OW9Rey9Ur48I2hglr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U7fTtzsp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QqfczaUZ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U7fTtzsp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QqfczaUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781028381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuccWviCqF3gc4kByg4lj4eR1OAjDvjkjt3M9KaoiEA=;
	b=U7fTtzsp0V42a9D48KItdFiuExPXl7RA8iYgw9nEuSuVZhJxJAsjI46hg1xB/Xc2uf3kR5
	fveTrTyjDgfL0m0xwGsYzOQSJmCHHmWHU0KnR8vuvNtu2Xs+2iDqajDFU0E3rAeB458n8a
	dylzIF+tAbGPdEPXBnQLCQPSCy8qa6s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-2_8fZFG7P2e_bHw3FWoNUA-1; Tue, 09 Jun 2026 14:06:20 -0400
X-MC-Unique: 2_8fZFG7P2e_bHw3FWoNUA-1
X-Mimecast-MFC-AGG-ID: 2_8fZFG7P2e_bHw3FWoNUA_1781028380
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91576c147a4so1480852585a.3
        for <linux-edac@vger.kernel.org>; Tue, 09 Jun 2026 11:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781028380; cv=none;
        d=google.com; s=arc-20240605;
        b=ecZOdFqtFKAnIdY7X2Jrfvo9fREoJyjcBgy+V+beFFc5kJjISaro6NR9cc54egMm/z
         Bgv2WIN3swLIATd7A+RnkKqYV/geUWKq8aeWR5RchDDnDs3HEWSSnbRdDFUBtUzYo6cn
         /e5BzF5O/MGDMWhlx0bCRg9f6OENaKFvGvWflyFLS/ch/h3es2yST7fSyE7pDhXUmWqd
         nXP9lF/tdOe+vVzUV0sYEMqGt2PeOQGxjYgexcQZCRacLm+VNjWI2yru5eRGrKdh10Pr
         /q2CXExh/CeszwIqbncAWHcFGSyyTzYQLeX3X3fsKfMLWh0LaNYIRolYe+8C1MGDF184
         +kqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NuccWviCqF3gc4kByg4lj4eR1OAjDvjkjt3M9KaoiEA=;
        fh=q/DgLP280TZH84ZsCH7YPbEs7HGXhZvtJEkHFbZzR/M=;
        b=SfyWqHYedRvoBHmEdUYX1vhGBW5cC1aDtUrvTAeg1Pb8QIstzZOfLAMFzQ3YskNTNC
         joGdRuli06YpBNe8UfqagfMwuVFCHdmebfbRULrSCtQvpSU9uecdRJsUQU6wzN0oiv0l
         YYkjxaFUj/VbUNQTTv7rywUcfHc/SujRyPsZfPwtb3DoTYnnBshS9oB9SHXSF1wA8UiO
         tPHc1xtyqtoLUH7FhN8+5wNx8xxIErc2lzMDjlqUsTs1pvzm7Px2DLBhcgmUDplnEmVA
         WdaD0o0y5t/Pn3J7g53VNX6oindwWpKzFPv5FrrpCBGqkokmVU3qrMLjSGVlNWGUTync
         5dFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781028380; x=1781633180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuccWviCqF3gc4kByg4lj4eR1OAjDvjkjt3M9KaoiEA=;
        b=QqfczaUZC1HwgUF/0bwIfegCqE0tKbFrt4iK8UJgZ6OPTPIamC9t1wmZtmCBRbMzHN
         GFHw0nTw6aHmYIsndDA+1OPL0KO+hmwn0fex2f3yWlE94oAQpYf9SQhxBD4IdGilosM9
         wQvEzBoUFH2VtJQ4UrF6jnfbb7W/0D4Q6Hwyduo4Yu2bofjqlqjU0FnM3H7A5Nv/Y739
         cF7D5saFcGLoGfvW2gC6V9GCX2LhHNmClJGH+8V8wLqZQ22fisCyFVXcNzMNiE9icm4q
         My6JdEGqQniTiQoNQTtqz5AVls/jACQhAekivV1wxcfv+l2MjCJz31tFL6L+WU1kGC+B
         qgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781028380; x=1781633180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NuccWviCqF3gc4kByg4lj4eR1OAjDvjkjt3M9KaoiEA=;
        b=pJwnINj1xsW78EY4xd2Rn9q9NdtRaolvsMFUZ12lmzLMs+88O2R9rHmm/dNMkXxoH3
         T9t+idpbF1PWB4ZF/O7qbQ/QKOMWvZcgoQjHM7D0FNQg2QXyFb6WMgulYde6ZCxLOKJu
         kUBRWu5mljfAa7rDytoJEWVTJXsERPxBb/QjTwQyMUZ7UJAZFDGUGg28OEtOWMAhcolk
         2Ls0j9VOhUe8gwgZd5rkzt9WZExBPRBPSYPSfs6K/c0nsI7KA0kVuJ7tlUpYW1Slr1gZ
         BWQmZSi+KOR5VUadcBvfDG17XrP948JHhmLKxFoLHWf+Oe/I7iiz9eI3+F7+9+970Bql
         LMYg==
X-Forwarded-Encrypted: i=1; AFNElJ/m4rJTbR0Un7vqYkSGOhyOqhpVZ5Gc+p4NgXPGpXxqeAOzp3SD8dVNh/UzLVI+zRsJkzEv0Su919LX@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMEQ2oDsimGOfpqhFL0BSr3iT+50pCr1x6xBu6CkFji56LCrs
	p1qxJ5GgBxWrZmpWMf2bvpkAwwypOWxK5PQgVS1ntvcamQIyBRwJZ2dI3zGi0+9y39vz5z1Xy2Q
	+E+Pg4u7I6yE8CdG4AcJrbauACL/lpGpICyuk9gqBqCJHUmtQgzrBAA5feoL79js+Vy/9GYvNxc
	5lcVOwLieWqCM4IZPbli5L27N/1HuQpchegdSz5Q==
X-Gm-Gg: Acq92OEhSJEGp2LXbBhZshMlX1weodz8BOZzCOzEq/0iALLbsrqTD+2RApg9fkK4YGh
	pgPSjrRagkiMCRysgvLW9x7h+P2ZrOUpS+kx7BaybEWKEQgD6tqF9EYoKmCuRLIgLcGlIOLMzhu
	726vGz3im//mpUDWkGUHwKs3ADSr22nMI02A7+mtiAq5e8kUr4d5X/B9HIJRhd33C4ATdEsVbMH
	EeSLMZEX6Gt8hyPv83UUmq7tuJ1YFk47gFaxiOpY2JAs74X
X-Received: by 2002:a05:620a:371c:b0:915:c4de:7ab7 with SMTP id af79cd13be357-915c4de848fmr2187989085a.35.1781028379661;
        Tue, 09 Jun 2026 11:06:19 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:915:c4de:7ab7 with SMTP id
 af79cd13be357-915c4de848fmr2187979285a.35.1781028379107; Tue, 09 Jun 2026
 11:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603032201.993015-1-jsnow@redhat.com> <20260603032201.993015-8-jsnow@redhat.com>
 <87tsrcou8f.fsf@pond.sub.org>
In-Reply-To: <87tsrcou8f.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 9 Jun 2026 14:06:07 -0400
X-Gm-Features: AVVi8CdGs4OrHPKjAfP53q3RBlJSXhZAiY3Vh7vq6DyRAALHZKTcBb555JiIBxY
Message-ID: <CAFn=p-bJS7M9FV=Pa8JgpTi=jmSx24-J6uyFCWKvxwEsx4rM6w@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] qapi/docs: add "Intro" section
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

On Tue, Jun 9, 2026 at 6:59=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > This patch adds an "Intro" doc section, intended to eventually replace
> > the "Plain" doc section alongside a forthcoming "Details" section.
> >
> > For now, this section is not actually instantiated or used, but
> > subsequent patches will slowly convert the leading introductory section=
s
> > of QAPIDoc documentation to use this new section.
> >
> > A main motivation of this series of changes is to more explicitly
> > delineate the "Introductory" documentation for each QAPI definition for
> > the sake of the inliner. When inlining members, examples, and details
> > from multiple QAPIDoc sections, we will want to omit the "Introductory"
> > text from inlined definitions while keeping notes, caution boxes,
> > examples, and so on. This new section facilitates that.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/sphinx/qapidoc.py | 2 +-
> >  scripts/qapi/parser.py | 3 ++-
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index c2f09bac16c..1f7c15b7075 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -368,7 +368,7 @@ def visit_sections(self, ent: QAPISchemaDefinition)=
 -> None:
> >          for i, section in enumerate(sections):
> >              section.text =3D self.reformat_arobase(section.text)
> >
> > -            if section.kind =3D=3D QAPIDoc.Kind.PLAIN:
> > +            if section.kind.name in ("PLAIN", "INTRO"):
>
> Is the change from QAPIDoc.Kind.FOO to "FOO" just for brevity, or is
> something going on I don't understand?

Just brevity, honestly. I'm using the .name attribute and checking
against strings. Otherwise it didn't fit on a single line.
Inconsistent style, but I guess I chose what I disliked least.

>
> >                  self.visit_paragraph(section)
> >              elif section.kind =3D=3D QAPIDoc.Kind.MEMBER:
> >                  assert isinstance(section, QAPIDoc.ArgSection)
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index d8068bb1bf6..97e7dacb0fd 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -681,6 +681,7 @@ class Kind(enum.Enum):
> >          ERRORS =3D 4
> >          SINCE =3D 5
> >          TODO =3D 6
> > +        INTRO =3D 7
> >
> >          @staticmethod
> >          def from_string(kind: str) -> 'QAPIDoc.Kind':
> > @@ -748,7 +749,7 @@ def has_features(self) -> bool:
> >      def end(self) -> None:
> >          for section in self.all_sections:
> >              section.text =3D section.text.strip('\n')
> > -            if section.kind !=3D QAPIDoc.Kind.PLAIN and section.text =
=3D=3D '':
> > +            if not (section.kind.name in ("INTRO", "PLAIN") or section=
.text):
> >                  raise QAPISemError(
> >                      section.info, "text required after '%s:'" % sectio=
n.kind)
>

