Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887CA4DA54F
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 18:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781031491; cv=pass; b=iFb1MliMFO4vzH+R14CewT/ltk0ABA/yViVjaahsK0gH0xlJrQHVXLHSrU08uOYCwIAnXhDcOt78vOCLylT3xST4Q9w937tF/O1HytAd4bmp//1OJAjPkihH6ZesQndmj8Oxr6J5cY/aHbOtKhNSDeiSwtYP6KD6Ewoq49z0dXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781031491; c=relaxed/simple;
	bh=t9zKKCT7g99jk/9vM5TM174m/2XPeRulUwXBUlg730c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2idjTf1QmLv4bvpLXtBhtwO3Uv8q0eJf3J59hVd/QzwsXJurUzj9KtoOW+5S7GI+8J5TXfw5MJAw5/gPXqylfRjLVGQ5fFuFGzCV+ILQdehL30JKyXOwDPFxucVim8UQyMTfzJ/WOi0iQn5H9e8f82ggtpdI2a6jI5Xt20PPvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZ1TNrVu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RFEKbRKW; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZ1TNrVu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RFEKbRKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781031488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUz4z9xJm0sVo+7VV1gF6jdAjVdm+QQcpxU667lJY5w=;
	b=hZ1TNrVuRnZbAlpbCflt2Cw9IzUdXv69htY6E+aZaE+CGHCdqllB6OZK9Dr/D6It92zH/v
	ydTdgfT5DeT1+3lkEsoj1qjnlsj0fro7eLiJNCuQ9Dw48TpretM0p9gnXz0gqQBnT9+aCT
	AWxi0Jkz7QVXZCxSUlLaGxNEOinxU+Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-1QNB9jmXPwSWnev2REMSqA-1; Tue, 09 Jun 2026 14:58:03 -0400
X-MC-Unique: 1QNB9jmXPwSWnev2REMSqA-1
X-Mimecast-MFC-AGG-ID: 1QNB9jmXPwSWnev2REMSqA_1781031482
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517c65c019bso36505071cf.0
        for <linux-edac@vger.kernel.org>; Tue, 09 Jun 2026 11:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781031482; cv=none;
        d=google.com; s=arc-20240605;
        b=WJOeKJrJ+VRO+seqdBGIGAXHS2P8CBkVRxKbuNXwcwwTaIuL6+dI3d8dC6Q2HLE7Q+
         laNtM4zmJL4FBufnMBsDAfrgkagk4E3aCXYv6HQJsneRGNruzzFKy7ztnEM+d5dl3CZY
         u9pe+PYI4Ygcy1ms07KNuuWQryAuCg/HDYvDrlm9b6P1M/JLrQOnMEaoJoF+mMUk2qz6
         WQSwa05+SiFylHQZloDM6EdPd5SHTrj1fDt2RkWgOXUPv1tGPUKmT/iU4Qk6EouJGism
         51GdJH5cQ2gkHLJmdgGbC4yZIsiRIK6U2l5YN6xxqAvU3Z+8Copi7qGrFrHXPaBvDUf5
         Wm1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bUz4z9xJm0sVo+7VV1gF6jdAjVdm+QQcpxU667lJY5w=;
        fh=Lx1XuigH6wnQ0R4KhjIxdXSo01YjHm/A549dInTfWds=;
        b=dz4MmBS2QTBhcBz/dta9hv32r0SjbybwhzdfhIUcuujaLo1P5KNz8YecuhZB7V96yw
         GtH4dYPS7iqFpnovHS//eRmCs2cPmYx0Tfz163e6z1ZgC3oYjWhPoEuvrqJi/DFJxfy5
         XCYccGkQhYaHwIUxzPDXyz8QOjK33EUN077d+C7a68o1koZkfwgIHljKPMmZNnTWFg4g
         7zTpPto+ETk8Zd+lnoXsggMJE/NA5FT3CNgf/E1LVIbcy+Sraaka329wVvtgWR9Sz3Rf
         ZzNK8aVnfpJQWgUv6SgaZ1P6xOqhCHhrQhf/jgHE4j/UeEJc16SqZsm5Q8JA6t76MJ0+
         Gjug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781031482; x=1781636282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUz4z9xJm0sVo+7VV1gF6jdAjVdm+QQcpxU667lJY5w=;
        b=RFEKbRKWoGL6xujQyMKMEpNw+IK8Fsb6zGztvx+oCF8k1IZ5IABSn6YxBdBFiftlva
         hCmxIaWh1w3WJ5XDwa1cigD3KMmQw/CJljYdpLFglgz7c32owCdbaS+KUvyvx5Ch6LzT
         jeUjcqrUwIdqmZEmOTgDeOAdpzUyPITxupOiub5pckvvlTP+qThHlsPNHIrnWesV1wy1
         5JFIVG54pXKzfjX5mPx9LbGzv4xlo3zJ7UD/Wtq6AppvwNlOALt6jo6gaszq3iPwuJB1
         a3tn4kV6xFT3Hs/u+rozCCFgopv5bmxTGkMxxrbGkHkdFX3bkCD/PJ9LJ1HyaurbDMyy
         Kmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781031482; x=1781636282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bUz4z9xJm0sVo+7VV1gF6jdAjVdm+QQcpxU667lJY5w=;
        b=KkDyO9J41lsoKcOIPKV02OhrEbg5l41Q2q72tFh5PahvsTonwPUxaci72CuSJvLzCK
         CRIq7mQdzBzHanbRoNKnHRFK5fWyIi3RSbdlqVWHFLqJ5jvXYWXXryGsimCGkUlH7UvW
         4VMj0nvXYMaTk35uFATZkvArAQU3Y0CPIl/zSB7dGjpVn2KSN4ZDiTNT0aoSrTc+x14G
         zuxGGGXqx44PLQsiapgaWFeKLASLUHTcjV9JFR7HcZhkldyHT2wuXh/UHlA8nYwxHa3U
         p5NKosTdaK5jYbe4/zKwGv3b8tuPIsp9dyfzkzHaPwBoupq63H+8tmw0WDL8aF1pDADK
         uxgg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZFXSrcje0rJS3UkMt/F+ECTvx6mo7xrt5lTphak3RgDNquDkTK48WdVyUHTSXlsUEBeLeYRBCxIA2@vger.kernel.org
X-Gm-Message-State: AOJu0YzNILB/EYleGXeAKFJdl7pJkw7ekYWQ+pa4KnVH2t+A+1ifNSBh
	u57lJ1p/C5pls/tBXm9JuWaqPSk6+9iR/KXeiQrT75CQFYBpyk2j0Gz9fmwImCWPWr7OCzsqBD2
	A66O6nVBcoY8fHXIpy2KSi92xmjECNhs3s1IDWo4HHsJFwmBuenVpGLwKJ3tKgbsM/xDYyso4+N
	Iuuf5gOSbGjHwmaTl0U6MP+rgWcAolx76b14WJ0w==
X-Gm-Gg: Acq92OGOioLKmFgYgqfSPOPsTF69Ug2FDtpFUV8TpwI6csxyUTZSKolDyCoDEbQHOVB
	LKsufNp8PnSHtnV6UmTq/BawnC+P+UHuudzJe77kDY4JnkDCh3f+hztXZlYcx5opQ6ffIG2j6Tw
	HsyfKOV3xUGTyZtTNTUX5Kj4ukJn+t0/mO5E0T/zQjg7LPI2fQDh82v9cNiEte2GPUGw8GB6J7g
	AnylQ5k86YIdLJFdRE/ibtczCcF57rUTIDWT4adnaKN2CD8
X-Received: by 2002:ac8:598d:0:b0:517:5bc1:e1f0 with SMTP id d75a77b69052e-517959957a0mr324623031cf.0.1781031482332;
        Tue, 09 Jun 2026 11:58:02 -0700 (PDT)
X-Received: by 2002:ac8:598d:0:b0:517:5bc1:e1f0 with SMTP id
 d75a77b69052e-517959957a0mr324622421cf.0.1781031481868; Tue, 09 Jun 2026
 11:58:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603032201.993015-1-jsnow@redhat.com> <20260603032201.993015-13-jsnow@redhat.com>
 <874ijboms6.fsf@pond.sub.org>
In-Reply-To: <874ijboms6.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 9 Jun 2026 14:57:51 -0400
X-Gm-Features: AVVi8CcmL5RcjMHoqmKCDwgyIh7PYamDdMOzM2lSQJRccGXaYGBtPFhkdtejFOs
Message-ID: <CAFn=p-YJg_KhMf3vHZYP-4F1FVsA-MOE=ydRAmUv5srdVteuwQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] qapi/docs: add "Intro" section parsing
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

On Tue, Jun 9, 2026 at 9:39=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> John Snow <jsnow@redhat.com> writes:
>
> > Add parsing for explicit Intro section syntax.
> >
> > A side effect of this patch is that we will (currently) always create
> > an empty Intro section, similar to how we used to have an empty Plain
> > section. The tests are adjusted accordingly, rendered document output
> > does not change at all.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  docs/devel/qapi-code-gen.rst   | 16 +++++++---------
> >  scripts/qapi/parser.py         |  4 ++--
> >  tests/qapi-schema/doc-good.out | 18 ++++++++++++++++++
> >  3 files changed, 27 insertions(+), 11 deletions(-)
> >
> > diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rs=
t
> > index 3a632b4a648..b1cc5b5f0db 100644
> > --- a/docs/devel/qapi-code-gen.rst
> > +++ b/docs/devel/qapi-code-gen.rst
> > @@ -984,11 +984,11 @@ definition it documents.
> >  When documentation is required (see pragma_ 'doc-required'), every
> >  definition must have documentation.
> >
> > -Definition documentation starts with a line naming the definition,
> > -followed by an optional overview, a description of each argument (for
> > -commands and events), member (for structs and unions), branch (for
> > -alternates), or value (for enums), a description of each feature (if
> > -any), and finally optional tagged sections.
> > +Definition documentation starts with a description naming the
> > +definition with an optional indented overview, a description of each
> > +argument (for commands and events), member (for structs and unions),
> > +branch (for alternates), or value (for enums), a description of each
> > +feature (if any), and finally optional tagged sections.
> >
> >  Descriptions start with '\@name:'.  The description text must be
> >  indented like this::
>
> This works if we convert the entire schema in the same series.  I guess
> that's the plan.  Is it?

I still plan to do it piecemeal: I will probably send everything out
in a big series, but you will be able to cherry-pick and stage those
patches individually as you feel they are ready. This way, modules
that need further revisions don't hold up the entire series and v2,
v3, etc won't email bomb all of creation just to fix an indent in a
single module somewhere.

I think this documentation still covers it just fine: "an optional
indented overview". Technically the things we haven't converted just
omit that indented overview. Those overviews just remain as
"plaintext".

It's not perfect documentation, but the expected window where we have
two competing systems should be quite small in the grand scheme, so I
don't think it's worth writing docs to cover the technicalities of the
transition.

--js

>
> > @@ -1093,8 +1093,7 @@ Examples of complete definition documentation::
> >
> >   ##
> >   # @BlockStats:
> > - #
> > - # Statistics of a virtual block device or a block backing device.
> > + #     Statistics of a virtual block device or a block backing device.
> >   #
> >   # @device: If the stats are for a virtual block device, the name
> >   #     corresponding to the virtual block device.
> > @@ -1111,8 +1110,7 @@ Examples of complete definition documentation::
> >
> >   ##
> >   # @query-blockstats:
> > - #
> > - # Query the @BlockStats for all virtual block devices.
> > + #     Query the @BlockStats for all virtual block devices.
> >   #
> >   # @query-nodes: If true, the command will query all the block nodes
> >   #     ... explain, explain ...
>
> [...]
>

