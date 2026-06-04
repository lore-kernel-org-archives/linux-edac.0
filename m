Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377F245020
	for <linux-edac@vger.kernel.org>; Thu,  4 Jun 2026 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780600082; cv=pass; b=hXKhif5xl/pBZo7VMX6tKwW/UqKMtJ8UHTt3OCyy1yLpfayZIi1joIG3RDZDQorywSvL5AKthBwezKrE2/QqRvbESviXuov9alrD+Rj+mZNMjZRohsM/6RGYG1qB8kIO/3k9IX9XuSPqRfGD/bybFHE0act5FkjXh10MdUS+log=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780600082; c=relaxed/simple;
	bh=w153EbwweXJ5cQBR9n68xxnh0BlPBXwvjDhhF0GM8tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guQ+9w0VvtfPopkS/fIeu6adYWP8ru/lu8NANK05NrYFDXBqZE9Du00X9xm+1hrD/MrerJV9dT7QQ7x67G72aYAQ8vVg1WbDLYx67AJZoOsfOpipLFT1lKIN6LqphHG30qo/kPxrAZx8Ujs6+/wt+xk6HUGR7EjmcW3xZutlPwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VTkPv3t3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rs+OElH+; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VTkPv3t3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rs+OElH+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780600080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7jsGZP7BFRry3kXkhb3T7q12Ju72i2xWTrMMRzZQQY=;
	b=VTkPv3t3A82kXQpIoVxkpm6roTpYenY4GDSuTgEg3W4PP7LVmJrKE0Olz0e0S/75lggtlY
	5Bb5/64gYHHy780rfRdhtyA5phmoegJZB0dX4Y8IYU4YopB1xs9ON5/m6e/8ZV4D/vLr+T
	LX+62oC7PazREhkvO3nYmHvqDIXSbm8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-EUUHLdPkOji9ZANMjoO7BA-1; Thu, 04 Jun 2026 15:07:58 -0400
X-MC-Unique: EUUHLdPkOji9ZANMjoO7BA-1
X-Mimecast-MFC-AGG-ID: EUUHLdPkOji9ZANMjoO7BA_1780600078
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7e9dbc4039bso24465547b3.1
        for <linux-edac@vger.kernel.org>; Thu, 04 Jun 2026 12:07:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780600078; cv=none;
        d=google.com; s=arc-20240605;
        b=hq64CfyfJle5Rcq2/nEBZklLhpjbzIv/NqtSjMi2WQe7zEQICPQP+BHc2KdZee0Qlu
         r253tQE8Ir+ayJWCZrXrqmFbs4gLHdX0bzFY5BI6XnPQmxbRMjyMw6CBWE79kBZx4drK
         XjHlQyu1qh7z/etHn21a1VCEtN1z+pqBYic5rgdjD9BQwnRIsX4K8Z//YRGTqEK9w6K2
         dp+8jERyTsw/n4ygTG8G6ImiRMEsCxk7+Y0cS4YjZFsgqeaY1MzhWUSVl7hnGsUd5Zt8
         L62sfk2eTnrTtq/flPAJArSXDaYBFrgGKtB2R22WdqtkTM1P9kL7kpoROVvIfKuPjglj
         r2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/7jsGZP7BFRry3kXkhb3T7q12Ju72i2xWTrMMRzZQQY=;
        fh=wNVfSVW0eLiZbApLQQ8f3gJGpk6VEj145MhJfisuCyE=;
        b=JRlJuLethK9yUjl27JmCKRfgpO43TifQ9F5Qbsee/Dc5aeSpLgpv3lHcqx+FTefaM8
         JW8+UNYRK264PtWFzdPJkXl+qaYO9aCcYplzVFvf7YcwxXh6tPdF6WEncQBhIf6QmuE+
         QksDsa5RvH3Y5UdG0y7VM5Zvh41WzI4FGTD8YrB9kFrIO3tBOkAFIZcSmPP+wlluvUOv
         ChLtx4v6Qd6f64gPBR3gjgXExWt4fDp9imZywX/QiLYUxVAR5BeF7Nnl7F64XQNvJw54
         MRnpfLdFvRF4kvrArIN/mOJPYOqTvpAftrZdMpvDgYUwTv9AqAqVVD7qSB+PknJTDEx1
         krzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780600078; x=1781204878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7jsGZP7BFRry3kXkhb3T7q12Ju72i2xWTrMMRzZQQY=;
        b=Rs+OElH+uMwLIlw6TQUgnvp8TSzDk9JB64q+5UN23V4eUbTvpb71WLpLUjFdyC1S//
         LKfktOIuGxjNYYL9e1WVZ8oqU3yX6weSPOqBPAlP39MUO2STo7n+8x3TkIXJl0VINPs7
         2px7UvbPOmNcOsY44uf4dbr6ahnIuaALeh6cDLpYEMaeiA07/Bd0g1ZbQhfMZWb83eyS
         FbY2kc2t3hlxHGFKyJqbS5sozHS/kGQQIluPvGTVri6wgAT4Ozrz2qX1V7CUCoserkeP
         /BmwMdsoj5p5IeRCem3xkDzw9Skk9+K/t1Y3VGvDyvXGTaqeeKGsFCrcARVJSNbLNek7
         /0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780600078; x=1781204878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/7jsGZP7BFRry3kXkhb3T7q12Ju72i2xWTrMMRzZQQY=;
        b=ZhDhH+La0U2z9ED/7CXsWdDfdGIr8BZGVg6X0caSgAluriFfT0AOlfJOcvpy2rMUWi
         uZNpY8lUsI/dAcOIQGr1KGsBPHmmFajKCoHjcz+CgbkROva5YUXEO2sipNPYesMF/+KU
         5G++dGEtSOXy0giJnV2q+R3DgFPA7XvJ+DU43eRw5p+fn5XyoYeAzzS+Z3LXS617qjdO
         WL6+42jZlhubwStQvPGEaQsUHgK0W/ARuehVrrs8dtxZyloQ1joprwC2K6ndOwCDJF06
         FzHTOWQLtSaQp5497qq/3bp1sAMFLQDda/CBfVHRqW7m8sTCPg9I7iYzotpIOhqF15tH
         ULog==
X-Forwarded-Encrypted: i=1; AFNElJ/7guV67rjRgsGQCHbWPXjK7Mnb0PK0tG299QZA9Pq/XXZ35JGgQAuXhi1Y2R4KPsTI+MMLsGQGy0QD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw22lH3BzeIU5LLLLOKwB5FAK6c/rY9o95islf0DpKaaR+uIZhP
	YxHmDkHR8BAdQm7Ope0hfLlNY5En22Jze06Kk8p3rfxiEbYLdSbSNJjWFnA0jG83YL6urJMrh3e
	/65y0shLCerM4AmyBNZb+7Y0LHeXo2CMmeYZhKhXY2Ki7knB2SkHEEliDahDyNoD6cEP55HC6Vj
	GxEHNLyrZLIVvf0lzwTZ62JGHlEh1Zv28RiPFdDQ==
X-Gm-Gg: Acq92OGIIm95YFiwqc8NJY2gf0avrKRSzVaMj0/dXXXMoOSyXGYKZfYUYai6nAMtMvU
	ZSnhcwruLVpOqXl+adipTFrTN8MNmqcnPqopPkCf1wYYS8/4OzC8xbnhuNRtPY3HBgES9CLQgYe
	YrX5b0nK7jpNs3oTbMYdIeW9IjHN7ovA+YmTv5j+W7Mv6RRpACpfrbcvGSviKYJIMP5UxWZJQ2G
	9vzq9rKpkYJ60XKC8ySYrBfKENACkmuRetp2PbVBTjBjMXP
X-Received: by 2002:a05:690c:4b87:b0:7bf:ff7:ea71 with SMTP id 00721157ae682-7eb8c2fe788mr37900767b3.17.1780600078087;
        Thu, 04 Jun 2026 12:07:58 -0700 (PDT)
X-Received: by 2002:a05:690c:4b87:b0:7bf:ff7:ea71 with SMTP id
 00721157ae682-7eb8c2fe788mr37900437b3.17.1780600077563; Thu, 04 Jun 2026
 12:07:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603032201.993015-1-jsnow@redhat.com> <20260603032201.993015-10-jsnow@redhat.com>
 <87ecinkgnv.fsf@pond.sub.org>
In-Reply-To: <87ecinkgnv.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 4 Jun 2026 15:07:46 -0400
X-Gm-Features: AVHnY4Kl9_8gAYf2PjEJ9ZQzE5vSDMi6CzNvJj2qPaI925F79Rz9tN7Dwp-xpWY
Message-ID: <CAFn=p-aXcHomC4r=Gh9yQhoQzFDqxqTc2YTpaE-NOgiYDQRx_g@mail.gmail.com>
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

On Wed, Jun 3, 2026 at 7:27=E2=80=AFAM Markus Armbruster <armbru@redhat.com=
> wrote:
>
> Quick first pass...
>
> John Snow <jsnow@redhat.com> writes:
>
> > A forthcoming patch removes the implicit PLAIN section that always
> > starts a QAPIDoc section list. Further future changes begin converting
> > "PLAIN" sections to "INTRO" sections. To accommodate this, the
> > insertion algorithm that places stub and dummy members must be
> > adjusted to cope with not only the finished state, but temporary
> > intermediate states while the series is merged.
>
> Perhaps:
>
>   A forthcoming patch removes the implicit PLAIN section that always
>   starts a QAPIDoc section list. Further future changes begin converting
>   "PLAIN" sections to "INTRO" sections.
>
>   This will affect the code that inserts "Not documented" descriptions
>   for undocumented members ("stub sections") and the dummy section that
>   marks the spot for "The members of ..." references.
>
>   Adjust the algorithm to cope with not only the finished state, but
>   temporary intermediate states while the series is merged.

Sure.

>
> > This algorithm can handle zero-or-more PLAIN *or* INTRO sections at
> > the beginning of a QAPIDoc object, in contrast to the previous
> > algorithm which assumed and relied upon there being always one PLAIN
> > section at the beginning of every QAPIDoc section list.
> >
> > In other words: (PLAIN | INTRO)* <EverythingElse>
> >
> > This does not impact what the parser itself will actually produce. As
> > of this patch, the parser will still always generate QAPIDoc section
> > lists that start with precisely one PLAIN section (whether or not it
> > is empty), followed by the remaining sections. Those remaining
> > sections may or may not include additional PLAIN sections, but never
> > two such sections contiguously as the parser will always treat that
> > layout as one PLAIN section consisting of multiple paragraph(s).
> >
> > In other other words: This insertion algorithm is more lenient than
> > the parser, but this is on purpose for flexibility mid-stream as we
> > convert QAPI to using explicit introductory sections. The allowed
> > order of sections will eventually become strictly enforced in the
> > parser, which will in turn allow dramatic simplifications to the
> > insertion algorithm. This only exists as transitory code until we are
> > able to enforce that order.
> >
> > Fear not: the intermediate rest output before and after this patch
>
> "ReST output"?

Sure

>
> > are byte identical, so failing all else, we at least know it doesn't
> > make anything worse.
> >
> > Lastly, because we have three places in the code that need to insert
> > stub/dummy sections, we take the opportunity to consolidate this code
> > to handle all three cases with one function. This winds up
> > necessitating the qapidoc.py generator actually modify the section
> > list to insert a "dummy" member that acts as a placeholder for "The
> > members of ..." text. While it looks like a code smell to modify the
> > caller's argument, it is ultimately safe because the QAPI Schema
> > object is re-parsed and re-constructed in memory for each individual
> > process that needs to operate on it. In other words, the Sphinx
> > document generator already does have "its own copy" of the section
> > lists, so it is "safe" to modify here without regards to other
> > consumers of the QAPIDoc objects. It only *looks* like it smells
> > bad. Ultimately, this code will also be removed once the inliner is
> > merged, so it is only a temporary aesthetic issue regardless.
>
> Such trickery, even when safe, risks making attentive readers go
> "WAT?!?"  I find it tolerable only because we plan to replace it fairly
> soon.
>
> The code finding the spot to insert stub/dummy sections is more
> complicated than it has any right to be, both before and after your
> patch.  It reconstructs information the doc parser has, but doesn't pass
> on in usable form.  Passing that info on would likely be simpler and
> cleaner.  However, you tell me your inliner patches also simplify
> things, and they already exist.  So let's go with those.

Right, the basic idea is this:

- Differentiate INTRO with new syntax
- Convert "PLAIN" into "DETAILS"
- Enforce strict section ordering: INTRO only at the beginning,
DETAILS only at or quite near to the end

Once that is cemented, the insertion algorithm can become much simpler
and dumber; e.g. using a map of regions where we can append to the end
of a region without having to iterate through to find our sweet spot.

Since that's the plan for the inliner anyway, some temporary ugliness
here in order to ensure that we do not regress even one byte seems
acceptable.

Additionally, once the inliner is merged, we won't need the "dummy"
sections at all, so those go away entirely, and all of the ugliness of
that particular part of the hack with it - i.e. no more modifying the
caller's argument to insert a bookmark.

So, it's a little gross, but it's just a band-aid to get to where we
want to be; and it isn't as gross as it looks.

With your suggested commentary changes, do I have your blessing to
push forward? In the interim, please review the rest of the series so
I can send you a new version.

--js

>
> > That's my story and I'm sticking to it.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>

