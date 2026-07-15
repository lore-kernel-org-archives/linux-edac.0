Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9330C141
	for <linux-edac@vger.kernel.org>; Wed, 15 Jul 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125199; cv=none; b=i/IgfjekfrpATb4Sw3QkWZvfIwG7toVgYnJTpMf8WqNY/2t5Z8ED35sJTSAOe522PtLG7tRtjGx1Gv4f2Lb67ZrZpnnZ16+78/7Rh0m5GBpbkXbk9hlnt0aDmAw+drAkPv9ZTAJz3VNKWVX9UM9Ixftg/fsgCYXoZ0jMvPLKMTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125199; c=relaxed/simple;
	bh=d+uOZscKl85SU69fH3skPfgUIcCafb7R3rGyzENzbjs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z8zKVtk2sKZrubxLKqNiRmzlBm7mzMw1J1p2DCi3FYN6V34YknmFWa0DUyJ1LQ5ihU4e33Nqv+A6tBp7UFRIBkG2u/MnphLx8gSpwne9RpNiCr32MGVAevQU5Y4HN3FYS7byecHYFVfBprjf8+uTVB+4lBzzSCiwVsWlEiAvGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhzrytSa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhzrytSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784125196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JB941LrGN/iBFnBCrtCyVDOY1ao0FdU1/fMLI0NBSIM=;
	b=BhzrytSan/K9DtDQUh/3O+GzKFLxhw1M1LHEsGJGPy2B3pE5AQ3zfrA3Ki92mu8382y+QN
	3AV/NZMwE8F99HGqWkjbWPEoq5dG//HV2bLKUtZd4vuPN8bSp9V9qq6HM6bITYI07vY2Pn
	w+acjOjK7xOj4Fpvxig0d0P3/dlVUEQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-y0Q63fhOMgWFXq8tYz7a2Q-1; Wed,
 15 Jul 2026 10:19:53 -0400
X-MC-Unique: y0Q63fhOMgWFXq8tYz7a2Q-1
X-Mimecast-MFC-AGG-ID: y0Q63fhOMgWFXq8tYz7a2Q_1784125191
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C9B81955F73;
	Wed, 15 Jul 2026 14:19:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCF0A30001B9;
	Wed, 15 Jul 2026 14:19:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4830B21E6920; Wed, 15 Jul 2026 16:19:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  linux-edac@vger.kernel.org,  Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>,  Alex Williamson
 <alex@shazbot.org>,  Paolo Bonzini <pbonzini@redhat.com>,  zhenwei pi
 <zhenwei.pi@linux.dev>,  "Gonglei (Arei)" <arei.gonglei@huawei.com>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@mailo.com>,  Eric Blake <eblake@redhat.com>,  =?utf-8?Q?C=C3=A9dr?=
 =?utf-8?Q?ic?= Le Goater
 <clg@redhat.com>,  Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
  Zhao Liu
 <zhao1.liu@intel.com>,  Lukas Straub <lukasstraub2@web.de>,  Stefan
 Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 00/14] qapi: convert to explicit intro section syntax
In-Reply-To: <CAFn=p-Yu9OV0LJN8rGrc6GTkJZ38XAvP296tfwBxU6CnhLYR7A@mail.gmail.com>
	(John Snow's message of "Mon, 13 Jul 2026 16:34:07 -0400")
References: <20260629213624.936258-1-jsnow@redhat.com>
	<87ech7gi45.fsf@pond.sub.org>
	<CAFn=p-Yu9OV0LJN8rGrc6GTkJZ38XAvP296tfwBxU6CnhLYR7A@mail.gmail.com>
Date: Wed, 15 Jul 2026 16:19:47 +0200
Message-ID: <87ik6ggwsc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

John Snow <jsnow@redhat.com> writes:

> On Mon, Jul 13, 2026 at 9:00=E2=80=AFAM Markus Armbruster <armbru@redhat.=
com> wrote:
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/2638342206
>> >
>> > Hi, this patchset converts some of the most trivial modules to use the
>> > new explicit intro syntax. This particular patchset does not
>> > differentiate between "trivial" conversions and those that take
>> > slightly more liberty in refactoring, but there are (debatably?) no
>> > such cases in this patchset.
>>
>> Looks entirely mechanical to me.  Am I missing anything?
>
> Honest answer: I am not sure; I have edited so many QAPI files that I
> cannot remember what is and what is not mechanical anymore. If there
> are instances of "non-mechanical" changes, it would be for cases where
> I decide to indent some paragraphs, but not others, effectively
> introducing a new split as to what appears before and what appears
> after the tabular data.
>
> I genuinely do not recall if there are any such cases in this mini-series.

It's only mostly mechanical.

Almost always, the patches change

  ##
  # @name:
  #
  # Single plain paragraph: Lorem ipsum dolor sit amet ut enim ad minim
  # veniam duis aute irure dolor.
  #
  # Something other than a plain paragraph

to

  ##
  # @name:
  #     Single plain paragraph: Lorem ipsum dolor sit amet ut enim ad
  #     minim veniam duis aute irure dolor.
  #
  # Something other than a plain paragraph

No decisions, thus mechanical.

I found two exceptions:

1. In qapi/compat.json

    @@ -39,8 +37,7 @@

     ##
     # @CompatPolicy:
    -#
    -# Policy for handling deprecated management interfaces.
    +#     Policy for handling deprecated management interfaces.
     #
     # This is intended for testing users of the management interfaces.
     #
     # Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
     # with feature 'deprecated' or 'unstable'.  We may want to extend it
     # to cover semantic aspects and CLI.
     #
     # Limitation: deprecated-output policy @hide is not implemented for
     # enumeration values.  They behave the same as with policy @accept.
     #
     # @deprecated-input: how to handle deprecated input (default 'accept')
     #
     # @deprecated-output: how to handle deprecated output (default
     #     'accept')
     #
     # @unstable-input: how to handle unstable input (default 'accept')
     #     (since 6.2)
     #
     # @unstable-output: how to handle unstable output (default 'accept')
     #     (since 6.2)
     #
     # Since: 6.0
     ##

   Here, we have multiple paragraphs, and only the first one becomes
   "intro".

2. In qapi/misc-arm.json

    @@ -29,9 +28,8 @@

     ##
     # @query-gic-capabilities:
    -#
    -# It will return a list of `GICCapability` objects that describe its
    -# capability bits.
    +#     It will return a list of `GICCapability` objects that describe
    +#     its capability bits.
     #
     # On non-ARM targets this command will report an error as the GIC
     # technology is not applicable.
     #
     # Since: 2.6
     #
     # .. qmp-example::
     #
     #     -> { "execute": "query-gic-capabilities" }
     #     <- { "return": [{ "version": 2, "emulated": true, "kernel": fals=
e },
     #                     { "version": 3, "emulated": false, "kernel": tru=
e } ] }
     ##

   Here, we have two paragraphs, and both become "intro".

