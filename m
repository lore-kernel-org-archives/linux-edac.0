Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA1A40DFD9
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 18:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031083; cv=pass; b=ktfB4c4soMDtMikWqXNWbUhgkr3dKP0MmxP++2UdbP0NmTKqdmUE02PQ1Co8Sya+E4mFVDHu4rvwee8yQgWIzIOdtOwHY3EwEhpWgEXtmytZ7ahbtXM6ff7JpprddTcs452R1xC8g94iqMUBjZAnaX0gifYmOZqDpy+SE25BGuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031083; c=relaxed/simple;
	bh=o7msaVeA5eQdscLjcuRgzYYKcviHBIzzVM9HjCe2RNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjwNYu0jlLY/Y5wXS9EFi0NDwnUJceKjMfytQSHy29SFBTu8D+H2D3GdDO69MLF3CT9Mo0zI3CcbF0aZnbVyfSQEYlj04bT1EsNTm8Bw9gwIpkbrMXxv+QnbSnfkJHxG1LZQ1utZkal3IS6ObQyxNwUTBk3oNxcfpLbIOk3Ru9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ex5IN1wY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DXponuaw; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ex5IN1wY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DXponuaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781031080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yCswAtT263a0ZsmKD8XqrLbqUhP/Fhx/nYqIniWGmk0=;
	b=Ex5IN1wYI+TzaJZbv5LhG4uemoUu1omG4D1BKl4v0POGD3sfXLuJlw8Fq7bhHdaxJ19Rn1
	ybGYSMfpuEnzJGOC7fIkUSxadYgpuo4HDGSQWfXSTO436GWPa3hHkPAruwqOJiG3cuKuTR
	rvqQeUVgAQg1rJ0oefKDIveuO2l81Og=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-KD_O7H9tMO-PF03m4G6Vhg-1; Tue, 09 Jun 2026 14:51:19 -0400
X-MC-Unique: KD_O7H9tMO-PF03m4G6Vhg-1
X-Mimecast-MFC-AGG-ID: KD_O7H9tMO-PF03m4G6Vhg_1781031079
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176d949c58so147434571cf.0
        for <linux-edac@vger.kernel.org>; Tue, 09 Jun 2026 11:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781031079; cv=none;
        d=google.com; s=arc-20240605;
        b=CFHrzPlHy1CbLhaTe0yoMAHS8SPwqq/J/Y7ntKbKjcv28k47h9yb0vv3PqDXBwzr0h
         NtD7F3e1wiiqVShpctAfByfpDtchPuTJtOqkF7RulG6X8gOYle0WQW+AYCGzthQSmICn
         LqT6RCbajqMgWOOV8yDSoBk+q73a+i8hQORSJYkH7X++lQ//YIO5FUhup7xGQeD6LvY/
         2euV8We75/cia0B08Q7mGe3bTETuHM5Rox+EWqDCTUahj1xs2u53AQN5VuTkJelbZ8bo
         o697xi0PGr/kHuaTIQ1uIUAxc3XIy1z5o0aED/N8qTPorcybpAQVHxL15mIy2wsiezti
         v0bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCswAtT263a0ZsmKD8XqrLbqUhP/Fhx/nYqIniWGmk0=;
        fh=oM4RODHx1O8HZ6TWnpBXBnIo14Mpm3JaEi3WO9oc+6I=;
        b=fNynYftAni6TNUr/Xv8vv/mO/PB1PAacFZ6lm/XLx/ByxAviLkHjckIKpQ3CNkmFVI
         o9hT2/jGq2eCwmHKNHOGRVD3piyEOLLqrGV/U7tSS0HqRJjNJmt1+KLMG6mX3t/d6hNG
         FugSrk/IwslgoMWdTDbylc2tVmonxt5LLXA5l8zduUlJEjb3tEn6Hz7v2OnF4Bhf8iOP
         fKiUjcl+L43lEYByVf/chEYQdVH2gB2tIWp+4k0h0MpLdMXyQu4FCACjaxosTKjO7FeQ
         p+iS3TbxZkLWbKsTfelRUwRijxnBYPV3sEVR619HO6YL2QDxvp+U4/jXloeudq9TMcDa
         t5JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781031079; x=1781635879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCswAtT263a0ZsmKD8XqrLbqUhP/Fhx/nYqIniWGmk0=;
        b=DXponuawXRAyVmvY2v/gNStZ3FE1pEOOiLuEDCsXVhOAIJXux4/3FpXEKpMm2xr8nu
         dzP+Zm0NP066kWufOzohrLVghNb5PgkjS6lApiqYsQt+DH9wTIg64wjamj4q8Kk5U/h9
         P/jH9bqMn1kWGTRxq/rr8wQcV4xE6E9MZ5LaDHV1WhLDCfwkmV9AdhjdRCRLwuDykrcY
         5qQaWXvIgbMSJSIMZ9vNX0UpSChFqtk6UtqXIwFBvoDO5EbZZw1kL2SEwyZViD5W8Mst
         KOTSp2jeF67THTivlBwEyauB9Y+U4EuA38Rhw47XCJUjfjNt/PQN+5XISc0xYGvpyxyB
         +c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031079; x=1781635879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCswAtT263a0ZsmKD8XqrLbqUhP/Fhx/nYqIniWGmk0=;
        b=JwTW3dEbnXpblU3/35MLCpqo7vfMjinkiv+UuHp9YEvOYnAt2Shc7GC2Wv/fMgQ+cD
         ooRBCusI5/R35z7facEKC3gFRLlF/a39R7diI2/LZV5i79DkyUWTauQBQ2JBGUYUNKNO
         +xZ9FKNhRxzv0Gp7E7oQBkWFizjUuWwwlJsgNfJuy6cw3t71OrmOloT/cWOPekw+eTWS
         oFLtI5cX1Tpxr/SSQJPV2ZG5fn/LbwgSI9wjf58+oy6LtFTsbpUV3wEmbN2OyOZCMovp
         15DUIk8un+wug6gbYcRryLPialBdZkNOLRjjSC7bapNoEB2HizysOqen//2agj5q/i8O
         LyBg==
X-Forwarded-Encrypted: i=1; AFNElJ+TqVx7otPeFc1yaayZ7UubvfHxwjFKVeRaXaU06s3DKA9jmRsyfhm/D9diJndMun2IpKqqIrRY5fdc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf5j67zVCaTtZf5hvSY9ZDLVi1hJEcL81CTH1YRYUQCFEMG8fX
	z5aH4YG/5UQTge3UjF0Tk40r/ZOCd4Kj+CCDqoJjBwo0DWJaJrsf9sP3KmiVyY5J3xvqohpcGIW
	C5CfA23DiiDe5oL/BTDi+7xals+Vx5M1oxZWqNgw3tUOvWnYLyNyG53dGxo4eWDJ4JHKIAqsunZ
	iTFASnBZzPFG9abP3+jjU9h1X15UJENt7e9R1ryQ==
X-Gm-Gg: Acq92OFJr7qb6R4tCH+jmq1yFer1z9eeo3rJtD8+ieywjJBBeyzjDDN5J8248AT2+Jd
	uwQFz3HzAbvnPYt/H/CU4Et/XcTxbXjTxauuK0ISAlGIilIlgbfOk17rE+DpUIShfiiqdyezxwr
	I50pgj931IRVpzWf4OopV7MEdLFWFFz8PWA7dC0pvNy0YOULgGkE2XoilbAoMDa5EGsJUPGkQ5l
	fiEWZNr+Sa17M8KsUstboPxokHaYEkLw4Y9JKR/L83IPANf
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id d75a77b69052e-51795afe9e0mr307724441cf.33.1781031078375;
        Tue, 09 Jun 2026 11:51:18 -0700 (PDT)
X-Received: by 2002:a05:622a:6096:b0:517:7217:6737 with SMTP id
 d75a77b69052e-51795afe9e0mr307723751cf.33.1781031077803; Tue, 09 Jun 2026
 11:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603032201.993015-1-jsnow@redhat.com> <20260603032201.993015-12-jsnow@redhat.com>
 <87a4t3omy2.fsf@pond.sub.org>
In-Reply-To: <87a4t3omy2.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 9 Jun 2026 14:51:05 -0400
X-Gm-Features: AVVi8Cekfstri9M4uf9Wmwd1cxxjiqdixi3lsUKi-o1jhUQn8neRmG3mjwm1vJ8
Message-ID: <CAFn=p-Y6h6uXN9Hf0TjtdE-ZJ2zOGiauqX=kg-Q1p=kCaeg3KA@mail.gmail.com>
Subject: Re: [PATCH v3 11/16] qapi/docs: add rendering for INTRO sections
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

On Tue, Jun 9, 2026 at 9:36=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Amend the qapidoc generator to handle and render INTRO sections.
> >
> > The only real difference here from other sections is that we need to
> > dedent the text so it renders correctly. Members and Features are also
> > indented, but do not require a dedent() because they are always used
> > in tandem with an rST construct that forms the start of a new indented
> > block; there is coincidental harmony.
> >
> > Plaintext sections, however, do not start their own block and thus
> > need to be dedented to prevent accidentally rendering them as a
> > blockquote or a syntax error.
> >
> > This dedent transformation on the text does not reflow the text, so
> > source line information remains accurate, and the "blame" chain of
> > custody for sphinx rST parsing error messages continues to be correct
> > even through this transformation.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/sphinx/qapidoc.py | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> > index 16ad15fe94f..317dc44b1b8 100644
> > --- a/docs/sphinx/qapidoc.py
> > +++ b/docs/sphinx/qapidoc.py
> > @@ -35,6 +35,7 @@
> >  from pathlib import Path
> >  import re
> >  import sys
> > +import textwrap
> >  from typing import TYPE_CHECKING
> >
> >  from docutils import nodes
> > @@ -150,8 +151,15 @@ def add_lines(
> >          self,
> >          content: str,
> >          info: QAPISourceInfo,
> > +        dedent: bool =3D False,
> >      ) -> None:
> >          lines =3D content.splitlines(True)
> > +
> > +        if dedent:
> > +            lines =3D textwrap.dedent(content).splitlines(True)
> > +        else:
> > +            lines =3D content.splitlines(True)
> > +
> >          for i, line in enumerate(lines):
> >              self.add_line_raw(line, info.fname, info.line + i)
> >
> > @@ -223,13 +231,14 @@ def reformat_arobase(text: str) -> str:
> >
> >      # Transmogrification helpers
> >
> > -    def visit_paragraph(self, section: QAPIDoc.Section) -> None:
> > +    def visit_plaintext(self, section: QAPIDoc.Section) -> None:
> >          # Squelch empty paragraphs.
> >          if not section.text:
> >              return
> >
> > +        dedent =3D bool(section.kind =3D=3D QAPIDoc.Kind.INTRO)
>
> Could use a comment explaining why INTRO needs to be dedented.

# Please see commit message

(Joking, I added a comment.)

>
> >          self.ensure_blank_line()
> > -        self.add_lines(section.text, section.info)
> > +        self.add_lines(section.text, section.info, dedent)
> >          self.ensure_blank_line()
> >
> >      def visit_member(self, section: QAPIDoc.ArgSection) -> None:
> > @@ -373,7 +382,7 @@ def visit_sections(self, ent: QAPISchemaDefinition)=
 -> None:
> >              section.text =3D self.reformat_arobase(section.text)
> >
> >              if section.kind.name in ("PLAIN", "INTRO"):
> > -                self.visit_paragraph(section)
> > +                self.visit_plaintext(section)
> >              elif section.kind =3D=3D QAPIDoc.Kind.MEMBER:
> >                  assert isinstance(section, QAPIDoc.ArgSection)
> >                  if section.name =3D=3D "q_dummy":
>

