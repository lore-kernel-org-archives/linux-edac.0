Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251442DC357
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 13:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011980; cv=none; b=A001ETTm1Q8ST5KX/QFLfdO3NocCtzURioJixbTyoR404wmL1HwicpFllUuHRBoZrJfnP1h3H5RO3P3TQw34BQPlshySMw7TfoG84xUoS0+ni3+/4xljO1FtC3ihomhNpnt2oETCimMpUd831//aD/zImwLD59CgRIP8bkoKj9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011980; c=relaxed/simple;
	bh=SIexvqQ0pJSfLH3l//6Y0rDkU3cAKG3gxcty0RG40Og=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gPUZOtvPZPVSHCRmfDKbKktsi+4qZlX74iE6Tg/dqsjCruhRZUMgcNI8EzfKktDaU4I5+/Y8NOyQS9IQvLs24bqFJwg0uZ86gicdamXqF0+uoLuHirXtb1H2KpNQlKrn8b5jFTMoVXqce5cXZcjvRDKnBH3BV3WsiSlYAI6QhlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rk6dO9u7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rk6dO9u7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781011978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0ZIy5Z/bad00vxyXWqY5myYg5Ll0WT2xWmXzi7net0=;
	b=Rk6dO9u75GOvAy6/Fo5UjjAYiUSDGSKjuCjAN8PenNz5unbsZN3OGZ1WVHSWIi6wEs7ppd
	8UAQ8CHsLz8mNQ0FbgNKkIF0DwPcENSidA0qsXeLoqoDLH61xtDKCu0KRf30cfvuvk/5Vl
	C5Ex3Pc/WYZTLd1p1EVavyA4nsK+gLQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-xY9pr3bGMiiB8jOVQGYFMg-1; Tue,
 09 Jun 2026 09:32:54 -0400
X-MC-Unique: xY9pr3bGMiiB8jOVQGYFMg-1
X-Mimecast-MFC-AGG-ID: xY9pr3bGMiiB8jOVQGYFMg_1781011973
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E5AD718501F2;
	Tue,  9 Jun 2026 13:32:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D63619560AB;
	Tue,  9 Jun 2026 13:32:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9F80321E6A01; Tue, 09 Jun 2026 15:32:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Ani Sinha <anisinha@redhat.com>,  Michael Roth
 <michael.roth@amd.com>,  Igor Mammedov <imammedo@redhat.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Blake <eblake@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,  Mauro
 Carvalho Chehab
 <mchehab+huawei@kernel.org>,  "Michael S. Tsirkin" <mst@redhat.com>,
  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Paolo
 Bonzini
 <pbonzini@redhat.com>,  Pierrick Bouvier
 <pierrick.bouvier@oss.qualcomm.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Gerd Hoffmann <kraxel@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
  linux-edac@vger.kernel.org,
  Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v3 09/16] qapi/docs: adjust stub member insertion algorithm
In-Reply-To: <CAFn=p-aXcHomC4r=Gh9yQhoQzFDqxqTc2YTpaE-NOgiYDQRx_g@mail.gmail.com>
	(John Snow's message of "Thu, 4 Jun 2026 15:07:46 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-10-jsnow@redhat.com>
	<87ecinkgnv.fsf@pond.sub.org>
	<CAFn=p-aXcHomC4r=Gh9yQhoQzFDqxqTc2YTpaE-NOgiYDQRx_g@mail.gmail.com>
Date: Tue, 09 Jun 2026 15:32:49 +0200
Message-ID: <87h5nbon3y.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

John Snow <jsnow@redhat.com> writes:

> On Wed, Jun 3, 2026 at 7:27=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>>
>> Quick first pass...
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > A forthcoming patch removes the implicit PLAIN section that always
>> > starts a QAPIDoc section list. Further future changes begin converting
>> > "PLAIN" sections to "INTRO" sections. To accommodate this, the
>> > insertion algorithm that places stub and dummy members must be
>> > adjusted to cope with not only the finished state, but temporary
>> > intermediate states while the series is merged.
>>
>> Perhaps:
>>
>>   A forthcoming patch removes the implicit PLAIN section that always
>>   starts a QAPIDoc section list. Further future changes begin converting
>>   "PLAIN" sections to "INTRO" sections.
>>
>>   This will affect the code that inserts "Not documented" descriptions
>>   for undocumented members ("stub sections") and the dummy section that
>>   marks the spot for "The members of ..." references.
>>
>>   Adjust the algorithm to cope with not only the finished state, but
>>   temporary intermediate states while the series is merged.
>
> Sure.
>
>>
>> > This algorithm can handle zero-or-more PLAIN *or* INTRO sections at
>> > the beginning of a QAPIDoc object, in contrast to the previous
>> > algorithm which assumed and relied upon there being always one PLAIN
>> > section at the beginning of every QAPIDoc section list.
>> >
>> > In other words: (PLAIN | INTRO)* <EverythingElse>
>> >
>> > This does not impact what the parser itself will actually produce. As
>> > of this patch, the parser will still always generate QAPIDoc section
>> > lists that start with precisely one PLAIN section (whether or not it
>> > is empty), followed by the remaining sections. Those remaining
>> > sections may or may not include additional PLAIN sections, but never
>> > two such sections contiguously as the parser will always treat that
>> > layout as one PLAIN section consisting of multiple paragraph(s).
>> >
>> > In other other words: This insertion algorithm is more lenient than
>> > the parser, but this is on purpose for flexibility mid-stream as we
>> > convert QAPI to using explicit introductory sections. The allowed
>> > order of sections will eventually become strictly enforced in the
>> > parser, which will in turn allow dramatic simplifications to the
>> > insertion algorithm. This only exists as transitory code until we are
>> > able to enforce that order.
>> >
>> > Fear not: the intermediate rest output before and after this patch
>>
>> "ReST output"?
>
> Sure
>
>>
>> > are byte identical, so failing all else, we at least know it doesn't
>> > make anything worse.
>> >
>> > Lastly, because we have three places in the code that need to insert
>> > stub/dummy sections, we take the opportunity to consolidate this code
>> > to handle all three cases with one function. This winds up
>> > necessitating the qapidoc.py generator actually modify the section
>> > list to insert a "dummy" member that acts as a placeholder for "The
>> > members of ..." text. While it looks like a code smell to modify the
>> > caller's argument, it is ultimately safe because the QAPI Schema
>> > object is re-parsed and re-constructed in memory for each individual
>> > process that needs to operate on it. In other words, the Sphinx
>> > document generator already does have "its own copy" of the section
>> > lists, so it is "safe" to modify here without regards to other
>> > consumers of the QAPIDoc objects. It only *looks* like it smells
>> > bad. Ultimately, this code will also be removed once the inliner is
>> > merged, so it is only a temporary aesthetic issue regardless.
>>
>> Such trickery, even when safe, risks making attentive readers go
>> "WAT?!?"  I find it tolerable only because we plan to replace it fairly
>> soon.
>>
>> The code finding the spot to insert stub/dummy sections is more
>> complicated than it has any right to be, both before and after your
>> patch.  It reconstructs information the doc parser has, but doesn't pass
>> on in usable form.  Passing that info on would likely be simpler and
>> cleaner.  However, you tell me your inliner patches also simplify
>> things, and they already exist.  So let's go with those.
>
> Right, the basic idea is this:
>
> - Differentiate INTRO with new syntax
> - Convert "PLAIN" into "DETAILS"
> - Enforce strict section ordering: INTRO only at the beginning,
> DETAILS only at or quite near to the end
>
> Once that is cemented, the insertion algorithm can become much simpler
> and dumber; e.g. using a map of regions where we can append to the end
> of a region without having to iterate through to find our sweet spot.
>
> Since that's the plan for the inliner anyway, some temporary ugliness
> here in order to ensure that we do not regress even one byte seems
> acceptable.
>
> Additionally, once the inliner is merged, we won't need the "dummy"
> sections at all, so those go away entirely, and all of the ugliness of
> that particular part of the hack with it - i.e. no more modifying the
> caller's argument to insert a bookmark.
>
> So, it's a little gross, but it's just a band-aid to get to where we
> want to be; and it isn't as gross as it looks.
>
> With your suggested commentary changes, do I have your blessing to
> push forward? In the interim, please review the rest of the series so
> I can send you a new version.

Yes, you do.

In addition to the commit message changes, I'd like to have a comment in
the code.

Perhaps as separate patch before your series:

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index c3cf33904e..844afc6e0e 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -852,6 +852,12 @@ def connect_feature(self, feature: 'QAPISchemaFeature'=
) -> None:
=20
     def ensure_returns(self, info: QAPISourceInfo) -> None:
=20
+        # This is more complicated than it ought to be.  The doc
+        # parser should already know where a generated RETURNS section
+        # should go.  It currently doesn't, mostly because it accepts
+        # tagged sections in any order.
+        # TODO Tighten doc syntax and simplify.
+
         def _insert_near_kind(
             kind: QAPIDoc.Kind,
             new_sect: QAPIDoc.Section,
--=20
2.54.0

We could adjust the comment within your series to also cover the new
uses of _insert_near_kind(), but I don't think that's necessary.  It
should serve as a reminder as is.

If that works for you, I'll post the patch.

>
> --js
>
>>
>> > That's my story and I'm sticking to it.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>>

