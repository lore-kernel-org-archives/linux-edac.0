Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D033F58CE
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002746; cv=none; b=txULEA2XdI3xr2vq6bY0fLNJvT02YT/pLjg1VPu8XIhGrZSIxcrixypMQzIpp41CqA/HCxmXKVVNw7omj7hYebYZCVnHdsxUk5gwLZw7jebTAViAiqkunnztRMGxEgsUC1/cPC66YzdOuRXeuUCOffWOELEVFS0PmpDcZ3Y6tx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002746; c=relaxed/simple;
	bh=NJm7en42vHqUEOL097e7ZQlVuWRWW3IjO/i3DEPRdF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UrNP89T4wBQbT29Ma0vhK9ZlsmpDFYU4AUuLjRtgkiKYzh+nvMutk/4K40YhMt77irXYuD8Ns3ehg+h0IKOm5wqFWveAVwvcvEw+x98tFeOeV0Yhf/tgSPRpoJ6FEBKQjfRv7WDkWHXo+iAzYaKxMZ4750/K3WMI1gk09SZuC7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZRCXtzu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZRCXtzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781002744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O2uWd1OSRuv/AisuD6Qc+yfYpvy0KTABFXqDhRLF8tc=;
	b=YZRCXtzulh+BbnMPl3NN73rcSs2k8T/y6CJolMO5gBMPLZxvwsqoF31DTzEaFYS2rJRBIB
	bDRthqrSNVsXzpg/dmgyIZHk4YjSGjH/J242nKy8/i7D5tTI4kh1B+pOYAe7zKUchMoWpa
	mmdLELI2BPJzhf/ZHFdwT4gA4GvkzqQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-c6nZMEQDM-StBjojnwVpMQ-1; Tue,
 09 Jun 2026 06:59:01 -0400
X-MC-Unique: c6nZMEQDM-StBjojnwVpMQ-1
X-Mimecast-MFC-AGG-ID: c6nZMEQDM-StBjojnwVpMQ_1781002739
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35E9A19560BB;
	Tue,  9 Jun 2026 10:58:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79FA43008B38;
	Tue,  9 Jun 2026 10:58:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 145E921E6A01; Tue, 09 Jun 2026 12:58:56 +0200 (CEST)
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
Subject: Re: [PATCH v3 07/16] qapi/docs: add "Intro" section
In-Reply-To: <20260603032201.993015-8-jsnow@redhat.com> (John Snow's message
	of "Tue, 2 Jun 2026 23:21:52 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-8-jsnow@redhat.com>
Date: Tue, 09 Jun 2026 12:58:56 +0200
Message-ID: <87tsrcou8f.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

John Snow <jsnow@redhat.com> writes:

> This patch adds an "Intro" doc section, intended to eventually replace
> the "Plain" doc section alongside a forthcoming "Details" section.
>
> For now, this section is not actually instantiated or used, but
> subsequent patches will slowly convert the leading introductory sections
> of QAPIDoc documentation to use this new section.
>
> A main motivation of this series of changes is to more explicitly
> delineate the "Introductory" documentation for each QAPI definition for
> the sake of the inliner. When inlining members, examples, and details
> from multiple QAPIDoc sections, we will want to omit the "Introductory"
> text from inlined definitions while keeping notes, caution boxes,
> examples, and so on. This new section facilitates that.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/sphinx/qapidoc.py | 2 +-
>  scripts/qapi/parser.py | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
> index c2f09bac16c..1f7c15b7075 100644
> --- a/docs/sphinx/qapidoc.py
> +++ b/docs/sphinx/qapidoc.py
> @@ -368,7 +368,7 @@ def visit_sections(self, ent: QAPISchemaDefinition) -> None:
>          for i, section in enumerate(sections):
>              section.text = self.reformat_arobase(section.text)
>  
> -            if section.kind == QAPIDoc.Kind.PLAIN:
> +            if section.kind.name in ("PLAIN", "INTRO"):

Is the change from QAPIDoc.Kind.FOO to "FOO" just for brevity, or is
something going on I don't understand?

>                  self.visit_paragraph(section)
>              elif section.kind == QAPIDoc.Kind.MEMBER:
>                  assert isinstance(section, QAPIDoc.ArgSection)
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index d8068bb1bf6..97e7dacb0fd 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -681,6 +681,7 @@ class Kind(enum.Enum):
>          ERRORS = 4
>          SINCE = 5
>          TODO = 6
> +        INTRO = 7
>  
>          @staticmethod
>          def from_string(kind: str) -> 'QAPIDoc.Kind':
> @@ -748,7 +749,7 @@ def has_features(self) -> bool:
>      def end(self) -> None:
>          for section in self.all_sections:
>              section.text = section.text.strip('\n')
> -            if section.kind != QAPIDoc.Kind.PLAIN and section.text == '':
> +            if not (section.kind.name in ("INTRO", "PLAIN") or section.text):
>                  raise QAPISemError(
>                      section.info, "text required after '%s:'" % section.kind)

