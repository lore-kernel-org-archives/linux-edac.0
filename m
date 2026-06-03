Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357783002DD
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486062; cv=none; b=G6KupS4l0XeS2zWxrLj/o6y9X13YTLteQVmvMV/0wBhrCPPKu/3EcL2nXY+9mTYZ767Hd3i77VSFQM/T47RzY7wy477ciz44Mmhy1SJsdCUHMrWUA+M/YdW67PjBNwLSWhX+YzHJk45yx9UXq9qPwXYETyZC2/uZoQy+628c3Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486062; c=relaxed/simple;
	bh=0+2k/5DEQ+HPeWX5hPy5KAHdHJdbtUOn/58qAbdNLhA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HJT6rakd7oqH4XYZ7DI29pPBqwe6jI0DTUg7L2aHz6OUtze4iNoaM5PEudRHD+7M/S2X7Z5YOn5E5dxY1i+6mJDmdW/ehnfwB0gHo1C7Qaaq+982S0hrRAum6+IwX5rCplaqzdNaubUISw9VQg/g/ZIEXiJZ0m20+sE0ezF2e1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=il0bf0wk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="il0bf0wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780486060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AiPI7Kj1yBTSfhaqq9Rf7rhYKY3mEeGqJEwvsoccqRQ=;
	b=il0bf0wkcBnb3UAsJp7Ml4UENp+/pAoSTEcvJ5sAkwMZJrozx1emsFwiKPYj/JHXxGgmZx
	6k5qFEKG8bW9yPs+T8HeJG/foUJxfeOijeKqM6TI8Q0gI8fXifpWBA4E9xb9cOjRY9/S5X
	6Lsc6pOxfXeuqlzieWofiSIdT8IBmuM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-CfUD5C19M-GaWsWJKNvT-w-1; Wed,
 03 Jun 2026 07:27:37 -0400
X-MC-Unique: CfUD5C19M-GaWsWJKNvT-w-1
X-Mimecast-MFC-AGG-ID: CfUD5C19M-GaWsWJKNvT-w_1780486055
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 886221956094;
	Wed,  3 Jun 2026 11:27:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60A20180049F;
	Wed,  3 Jun 2026 11:27:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 0C11821E6A01; Wed, 03 Jun 2026 13:27:32 +0200 (CEST)
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
In-Reply-To: <20260603032201.993015-10-jsnow@redhat.com> (John Snow's message
	of "Tue, 2 Jun 2026 23:21:54 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-10-jsnow@redhat.com>
Date: Wed, 03 Jun 2026 13:27:32 +0200
Message-ID: <87ecinkgnv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Quick first pass...

John Snow <jsnow@redhat.com> writes:

> A forthcoming patch removes the implicit PLAIN section that always
> starts a QAPIDoc section list. Further future changes begin converting
> "PLAIN" sections to "INTRO" sections. To accommodate this, the
> insertion algorithm that places stub and dummy members must be
> adjusted to cope with not only the finished state, but temporary
> intermediate states while the series is merged.

Perhaps:

  A forthcoming patch removes the implicit PLAIN section that always
  starts a QAPIDoc section list. Further future changes begin converting
  "PLAIN" sections to "INTRO" sections.

  This will affect the code that inserts "Not documented" descriptions
  for undocumented members ("stub sections") and the dummy section that
  marks the spot for "The members of ..." references.

  Adjust the algorithm to cope with not only the finished state, but
  temporary intermediate states while the series is merged.

> This algorithm can handle zero-or-more PLAIN *or* INTRO sections at
> the beginning of a QAPIDoc object, in contrast to the previous
> algorithm which assumed and relied upon there being always one PLAIN
> section at the beginning of every QAPIDoc section list.
>
> In other words: (PLAIN | INTRO)* <EverythingElse>
>
> This does not impact what the parser itself will actually produce. As
> of this patch, the parser will still always generate QAPIDoc section
> lists that start with precisely one PLAIN section (whether or not it
> is empty), followed by the remaining sections. Those remaining
> sections may or may not include additional PLAIN sections, but never
> two such sections contiguously as the parser will always treat that
> layout as one PLAIN section consisting of multiple paragraph(s).
>
> In other other words: This insertion algorithm is more lenient than
> the parser, but this is on purpose for flexibility mid-stream as we
> convert QAPI to using explicit introductory sections. The allowed
> order of sections will eventually become strictly enforced in the
> parser, which will in turn allow dramatic simplifications to the
> insertion algorithm. This only exists as transitory code until we are
> able to enforce that order.
>
> Fear not: the intermediate rest output before and after this patch

"ReST output"?

> are byte identical, so failing all else, we at least know it doesn't
> make anything worse.
>
> Lastly, because we have three places in the code that need to insert
> stub/dummy sections, we take the opportunity to consolidate this code
> to handle all three cases with one function. This winds up
> necessitating the qapidoc.py generator actually modify the section
> list to insert a "dummy" member that acts as a placeholder for "The
> members of ..." text. While it looks like a code smell to modify the
> caller's argument, it is ultimately safe because the QAPI Schema
> object is re-parsed and re-constructed in memory for each individual
> process that needs to operate on it. In other words, the Sphinx
> document generator already does have "its own copy" of the section
> lists, so it is "safe" to modify here without regards to other
> consumers of the QAPIDoc objects. It only *looks* like it smells
> bad. Ultimately, this code will also be removed once the inliner is
> merged, so it is only a temporary aesthetic issue regardless.

Such trickery, even when safe, risks making attentive readers go
"WAT?!?"  I find it tolerable only because we plan to replace it fairly
soon.

The code finding the spot to insert stub/dummy sections is more
complicated than it has any right to be, both before and after your
patch.  It reconstructs information the doc parser has, but doesn't pass
on in usable form.  Passing that info on would likely be simpler and
cleaner.  However, you tell me your inliner patches also simplify
things, and they already exist.  So let's go with those.

> That's my story and I'm sticking to it.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

