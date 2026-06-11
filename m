Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5383D3B3
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157296; cv=none; b=K8Cq+C/pG2lgixL+U1gL2TtgrBv9/S6MbrKXQAnXLy46OeEI9ftNbL1/bqKTQb8Uye7wG30pGBGyBKfVOBsaUQOGesnhs7R/n4slJkTImu2gmDnTs1BskZnlv4tXz/+Po1T8Kxxii5L5L22WvKqSgcFB3vvpaQl1GFVRg+4jhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157296; c=relaxed/simple;
	bh=8YlnyHtgw2EwTo1NyuGipX5EZ3YOcxA/mZks2Fep+8k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pRInBvEfFQc1fBB8YxvxLG9CrlRBLiZEr3e99AI0VkNGCyvVdzTMqXfR89Bq0Rhvf1312iYIrp59rHDtOz/OnOyiYrpUDEPxWPpbm4LhMtAv9qM09bqR88Hy5p86V3pvVcUbfxoHyYG5/okCv10PLCr832WCMddLDiHTyjx3nxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G3Y8u1GM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G3Y8u1GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781157293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1L573xuZLWoLLxhd+5lpmTNV0e6QxbN5IXb7+RwwK8=;
	b=G3Y8u1GMWtAUBVuJT4Koi6HYKhOyNy+5mNEuWPPzZFOLYt9vqkrUayo5HlES200pcKAxlL
	PLuKtoc96wRM34NvItRKBY6faZ/ccxvSDS2b3Em7I/9tmi75XPWrm4mlIOdpSEF36cEA29
	Ja+sG5YWaqWLHrz9AuJKoWeQDiSiIuU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-9yp-fdasNdq8lazfAN3pTg-1; Thu,
 11 Jun 2026 01:54:49 -0400
X-MC-Unique: 9yp-fdasNdq8lazfAN3pTg-1
X-Mimecast-MFC-AGG-ID: 9yp-fdasNdq8lazfAN3pTg_1781157288
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB0E91956080;
	Thu, 11 Jun 2026 05:54:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E47DC1954B0B;
	Thu, 11 Jun 2026 05:54:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5EAA921E6A01; Thu, 11 Jun 2026 07:54:44 +0200 (CEST)
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
Subject: Re: [PATCH v3 12/16] qapi/docs: add "Intro" section parsing
In-Reply-To: <CAFn=p-YJg_KhMf3vHZYP-4F1FVsA-MOE=ydRAmUv5srdVteuwQ@mail.gmail.com>
	(John Snow's message of "Tue, 9 Jun 2026 14:57:51 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-13-jsnow@redhat.com>
	<874ijboms6.fsf@pond.sub.org>
	<CAFn=p-YJg_KhMf3vHZYP-4F1FVsA-MOE=ydRAmUv5srdVteuwQ@mail.gmail.com>
Date: Thu, 11 Jun 2026 07:54:44 +0200
Message-ID: <87se6tfwpn.fsf@pond.sub.org>
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

> On Tue, Jun 9, 2026 at 9:39=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > Add parsing for explicit Intro section syntax.
>> >
>> > A side effect of this patch is that we will (currently) always create
>> > an empty Intro section, similar to how we used to have an empty Plain
>> > section. The tests are adjusted accordingly, rendered document output
>> > does not change at all.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  docs/devel/qapi-code-gen.rst   | 16 +++++++---------
>> >  scripts/qapi/parser.py         |  4 ++--
>> >  tests/qapi-schema/doc-good.out | 18 ++++++++++++++++++
>> >  3 files changed, 27 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.r=
st
>> > index 3a632b4a648..b1cc5b5f0db 100644
>> > --- a/docs/devel/qapi-code-gen.rst
>> > +++ b/docs/devel/qapi-code-gen.rst
>> > @@ -984,11 +984,11 @@ definition it documents.
>> >  When documentation is required (see pragma_ 'doc-required'), every
>> >  definition must have documentation.
>> >
>> > -Definition documentation starts with a line naming the definition,
>> > -followed by an optional overview, a description of each argument (for
>> > -commands and events), member (for structs and unions), branch (for
>> > -alternates), or value (for enums), a description of each feature (if
>> > -any), and finally optional tagged sections.
>> > +Definition documentation starts with a description naming the
>> > +definition with an optional indented overview, a description of each
>> > +argument (for commands and events), member (for structs and unions),
>> > +branch (for alternates), or value (for enums), a description of each
>> > +feature (if any), and finally optional tagged sections.
>> >
>> >  Descriptions start with '\@name:'.  The description text must be
>> >  indented like this::
>>
>> This works if we convert the entire schema in the same series.  I guess
>> that's the plan.  Is it?
>
> I still plan to do it piecemeal: I will probably send everything out
> in a big series, but you will be able to cherry-pick and stage those
> patches individually as you feel they are ready. This way, modules
> that need further revisions don't hold up the entire series and v2,
> v3, etc won't email bomb all of creation just to fix an indent in a
> single module somewhere.

We'll see.

The important bit is separating "split the initial part into intro (to
be discarded by the inliner) and non-intro (to be kept)" from purely
mechanical "make the entire initial part syntactically intro".

The transition to intro syntax will likely be bothersome for
contributors, and I feel kind of bad about it.  But I also feel we do
need to make intro syntactically obvious.  We could try to ease the pain
by silently accepting old-style patches (not using intro syntax) for a
while, then have another bulk conversion.

> I think this documentation still covers it just fine: "an optional
> indented overview". Technically the things we haven't converted just
> omit that indented overview. Those overviews just remain as
> "plaintext".

You're right.  "Optional" carries even more weight here than I thought.

> It's not perfect documentation, but the expected window where we have
> two competing systems should be quite small in the grand scheme, so I
> don't think it's worth writing docs to cover the technicalities of the
> transition.

Okay.

[...]

