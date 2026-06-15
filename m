Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63ED3B42FC
	for <linux-edac@vger.kernel.org>; Mon, 15 Jun 2026 19:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781552722; cv=pass; b=FuVcE4Suwwnoq9AoyR9hTB/Vq68nEfaRubSzaqcOM8zwUlnDrcuZfjKJUxYEEnjh/ieav7/Dh60z9ZuzbJJa1HiIv2nGyMTUSi99Jn+9/T4CdrZW55I+C2asKB8AkjVuY9AZxdfPPj1VhNIsGWNmb6l7JSyj/tgeXX298TylNj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781552722; c=relaxed/simple;
	bh=r0RPZzrW84BP3ek31WcNe85r/SmUYmhTuqDxYC6EAug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W2qxpHmgLaod8nHYINj3waV8txe1Vfp1TV71ET7XcluQRWxFDQomDZtqX5U5MZMaj3LqA2BelWm9ErgCqxQwwpnkZqYnQkh5teulNEnSCQCbPN3Qnof1k9j71OvUPnCTWxAnktVwq4wFcrqWU11SZtlYGbObfqkL8aa5ZuVLLok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWzDS47v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oDY93KrB; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWzDS47v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oDY93KrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781552720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9WP1c2EpAEG3hSuiAV0GYoU8NlzhyFLVwlwiKZyD8Q=;
	b=DWzDS47vGdQq4f7166kmOBbPPX/Xkiv/+ZK4tS/MZOSxIgUVaMNatrjC7FmiOA8kvzMcdf
	i3YD4Y3NXK7lHw6ujxHyHba/U6/LIgjRgOsEgInwVGpN5RnmThmSyJKjdhwDhHEv7os7ou
	gM78A5CSykaWKZ8nmbSR01Ayf/dOFsw=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-HZCR1qfaO1e_uGaaA9UmAA-1; Mon, 15 Jun 2026 15:45:19 -0400
X-MC-Unique: HZCR1qfaO1e_uGaaA9UmAA-1
X-Mimecast-MFC-AGG-ID: HZCR1qfaO1e_uGaaA9UmAA_1781552719
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-660331b4db1so5874040d50.3
        for <linux-edac@vger.kernel.org>; Mon, 15 Jun 2026 12:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781552719; cv=none;
        d=google.com; s=arc-20240605;
        b=RT3tIqnxb9CKOcWvrICdXOKD8oI1p3IPWvoLE9iwRHeWpe08xgAZ3t1oc48RPrZIpD
         93F0zLPlgDYX6Py7/CZC1TAKZ3O+Y8S/2ai23fwJgyKeL9w+N8CQYWTxhoEeINGOfDaP
         zoWylTLo5/WPFEu+dOItPHpfUFbQ4iDq2Nly3qvTCwMO3omsESeuzQ963wot+yIhxMpA
         Tizi7OO95wfSX4ngLZxnDOx4YysSRe1vNJ5KH97TnvE+UsTWKSpoazSLoDW7ZvYheazW
         U6J93HMgyeCRT3v208kKFj7W4BP4s1XQaV//sg3onprlobFMQzkuQwSVFKtuwCgFf1KZ
         FxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9WP1c2EpAEG3hSuiAV0GYoU8NlzhyFLVwlwiKZyD8Q=;
        fh=IyIGHUW9m86ohEW52abMx7JaiVnEhYrFh2kuCMa7uEU=;
        b=JVriB0Bkxql/In8Lj0VzU4lX+prUy/Etw/BrnkQAFFVCkNXIlfs1LMEeYFJGpjKJdW
         hGl1guNcXBf0nZ2c+mQ4uEbtO1CqyI+0anh4oJc4Mv3O7lwMVt8gZfSTTuo8n67hVuk+
         ImDXCD7WDgP3kdOWD3gBfqfB1iCqT6XsgwviRHYH1/DIWhdk95wBSdOCgFNeA4CphPLB
         4QtaWbIi9zCXo+7TWgRvLsmzVMftoLrHvr/Jq2M497wiN6avsZ43mSoj7Mz+FsbaOdS+
         kQVPo+bqwQMc/y3RDqZ6tuXKmzzZ2pkm059cocHAIxXfFoKCvOU2url4kor97wV7vrpe
         /NVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781552719; x=1782157519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9WP1c2EpAEG3hSuiAV0GYoU8NlzhyFLVwlwiKZyD8Q=;
        b=oDY93KrB3jcNHQy3u9M+9bxK3KwzCZVtMrz7fFVz8tPH20oa9mtvXwl00jIdlOHc7L
         +v4lQCBfmlOVBPZkDziG1PnV1wxfM92xm6IN/b6pDvxdtwQHHk3uZDoUxEpRZU0BMBzu
         tKDCLQap/d2ps5i+X/emN96h3oMwMOBD8dFPue25r8sd8q6Ed5DFcd1kkcl7zKCleSs+
         vk8oYRNULkWkMPMFODorOxLAcRt9vp7Uv9bg1nMSPZ7v6RPdZbo9ATTfBPw/aKyAvhrh
         rJqXoRYa++4CXgXOKnd2NkqPzCd+5L1GzWggq4rbMOWlUo5Ss4ImeS9obELj08KnnclD
         k1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781552719; x=1782157519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e9WP1c2EpAEG3hSuiAV0GYoU8NlzhyFLVwlwiKZyD8Q=;
        b=or0ejRAX7++K2DmCxahnbNwn1dbGc6oUyu7li5gmzVqjXVv3ilRvHMEQjXcYMHFtA6
         1lunhktyQg7V1hYW4xCsgTj+XdfrUBSwf2leXLZdSBtP6hIlV/DgZkLBCdxg3Xv6kL7Z
         HlNdkcYna/aJvhqW/veMaRx+PKT33iqjK1E3SKAau3qwf6HgX1tgbbOMh+QSntcNr5cp
         CTrDoM91X1jua1blyr5EIJgc94Ia06kRbOAfkFGby4IBYn0ovNC9VaG/mApC0EL8z4m/
         O6EGx41SGpFfcFqGIIc51QB6uizw+1LFiUN3gHGxWNEeycAjLJS7kO6hCzK6x2O4mnkl
         F8KA==
X-Forwarded-Encrypted: i=1; AFNElJ92+k00TzsCcMz5wiIksOiwr+ZPy1saveIe2t5UU+cqkqQc7LaWzwcezEFvblqZ/tc+JLeaMM61+73x@vger.kernel.org
X-Gm-Message-State: AOJu0YzJS+KFtnQk9unIidKLPU9jZGk1xeFIp4O7rgdJGJuITcvGQMOw
	7WNAcm7jlFvrwfnSX7Ehg6GttM3ql502ZWFPZsnoHyBMqwj9ejvBLEgylcgczH37aUirz3VegYX
	EmBNtQNvHwe2R/3pR3pcz3Xm7fiYpAuqP+D6lLW9DmHJxYIVNYgbhx8DUiPHPj7qz3ZDL0uDX8w
	pxl0M0ujPYVVM7Oz1tvdVgkh64efQLFqNQDXamtQ==
X-Gm-Gg: Acq92OGOz0WxqfMhzryzmzV4HjdWZbT9QVHMnvji0l4rLjPotkKzjONp9iVTaiar230
	g63jTWRRLnNWVPCvSemsJ+MCzEKLvggOPjgyN6VB1gvEHeH6PzO1gtSo6wyxj2/cHPsM9RCQUlV
	ixOkbtYgsxcAxBI5ObKIgSXK9FPBoT/huzCAMi/qAfNVdk0WZwmtGsfWe4GNUefwfJQlNUsPER/
	TRegwc8rY/264dqmQ+BtI0KPhhS/aeTaESrvQ==
X-Received: by 2002:a05:690e:d01:b0:651:9286:57a0 with SMTP id 956f58d0204a3-66284bc938cmr10940874d50.0.1781552718957;
        Mon, 15 Jun 2026 12:45:18 -0700 (PDT)
X-Received: by 2002:a05:690e:d01:b0:651:9286:57a0 with SMTP id
 956f58d0204a3-66284bc938cmr10940850d50.0.1781552718494; Mon, 15 Jun 2026
 12:45:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603032201.993015-1-jsnow@redhat.com> <20260603032201.993015-4-jsnow@redhat.com>
 <87pl1rx5br.fsf@pond.sub.org>
In-Reply-To: <87pl1rx5br.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 15 Jun 2026 15:45:07 -0400
X-Gm-Features: AVVi8CfYYa6y_Wv6I7VYLEBYe4vU-IY7KhPE8sCkcxXPLrX6wdSfrlP6ESa3Pqs
Message-ID: <CAFn=p-b1xj_+QeZkOLK+zpptm8vPPfNh-HFm6ihRUw4AUWSCTg@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] qapi/docs: remove unused QAPIDoc subsection members
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

On Mon, Jun 15, 2026 at 10:10=E2=80=AFAM Markus Armbruster <armbru@redhat.c=
om> wrote:
>
> Uh, "qapi/docs:"?  Shouldn't this be "qapi/parser:"?
>

Uh, sure. It's the parser of docs ... forgive me

> John Snow <jsnow@redhat.com> writes:
>
> > All users of the QAPIDoc object should be iterating over all_sections
> > and not grabbing arbitrary subsections, if possible. Remove the 'body'
> > and 'sections' members, as they are no longer used.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > ---
> >  scripts/qapi/parser.py | 6 ------
> >  1 file changed, 6 deletions(-)
> >
> > diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> > index c3cf33904ef..b33edbba74f 100644
> > --- a/scripts/qapi/parser.py
> > +++ b/scripts/qapi/parser.py
> > @@ -732,8 +732,6 @@ def __init__(self, info: QAPISourceInfo, symbol: Op=
tional[str] =3D None):
> >          self.all_sections: List[QAPIDoc.Section] =3D [
> >              QAPIDoc.Section(info, QAPIDoc.Kind.PLAIN)
> >          ]
> > -        # the body section
> > -        self.body: Optional[QAPIDoc.Section] =3D self.all_sections[0]
> >          # dicts mapping parameter/feature names to their description
> >          self.args: Dict[str, QAPIDoc.ArgSection] =3D {}
> >          self.features: Dict[str, QAPIDoc.ArgSection] =3D {}
> > @@ -742,8 +740,6 @@ def __init__(self, info: QAPISourceInfo, symbol: Op=
tional[str] =3D None):
> >          self.errors: Optional[QAPIDoc.Section] =3D None
> >          # "Since" section
> >          self.since: Optional[QAPIDoc.Section] =3D None
> > -        # sections other than .body, .args, .features
> > -        self.sections: List[QAPIDoc.Section] =3D []
> >
> >      def end(self) -> None:
> >          for section in self.all_sections:
> > @@ -766,7 +762,6 @@ def ensure_untagged_section(self, info: QAPISourceI=
nfo) -> None:
> >
> >          # start new section
> >          section =3D self.Section(info, kind)
> > -        self.sections.append(section)
> >          self.all_sections.append(section)
> >
> >      def new_tagged_section(
> > @@ -790,7 +785,6 @@ def new_tagged_section(
> >                  raise QAPISemError(
> >                      info, "duplicated '%s' section" % kind)
> >              self.since =3D section
> > -        self.sections.append(section)
> >          self.all_sections.append(section)
> >
> >      def _new_description(
>

