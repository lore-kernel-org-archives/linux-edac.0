Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67AA21C16A
	for <linux-edac@vger.kernel.org>; Mon, 15 Jun 2026 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532627; cv=none; b=ZxOiwoEGkfU7AOves7detrW11hOfJJYUqx6E9aqC6V15epULZsDBrMM94tCF/D0PgpJ7XLNNYmKyQwU0Cho/1P5fDZ5tliIO++nudti2hldlJP4ZJ6298JRgorH9dAFjnKcvrqiTNV+F4UPi0HbzHbta2zH9jiM+ZPEZ0UDG/+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532627; c=relaxed/simple;
	bh=Y/Fdx9KdItQbB8VruiKSaIShB5hz2bbaK7aiZ/V2kCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TWLqiQap/Tx4PvxvUDb8zeHuPRcnghbYD6Pw9THWrQJ6BfJ57BwiBzTL93jrk0pW2QT1+4+NGS6jfgn3fnG00L1XJAkYbXQ0vyVV6VXVQLdih/VANUaauMijkK94eTePO5f5gSxWrpHgJCitWZX+tD2x31BxltlETh2gfvjG8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Frj7DYF2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Frj7DYF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781532624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mrc6jxfXu0JVMA1XB7QC9Y7mwSTtUHRcwNNASjO+bCA=;
	b=Frj7DYF2sVMefgi/mCVC+2L0eff0CQeK0USF3q8NWdeM/Z9mnOYn9v3ibZ5Ap3f5tHqY+u
	zjN8SBiTKbMTgiKtqIPl2b/41b/95MYT4XvarjJ7GDC+Z0b8zSCHIYYNopSKTVBFjPXU9E
	3zgswQJwAVxsm252xhjDthE3fTd0pbI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-674-Be3Lvz_fOvOBe61wxVLBXA-1; Mon,
 15 Jun 2026 10:10:22 -0400
X-MC-Unique: Be3Lvz_fOvOBe61wxVLBXA-1
X-Mimecast-MFC-AGG-ID: Be3Lvz_fOvOBe61wxVLBXA_1781532620
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF8F218003FC;
	Mon, 15 Jun 2026 14:10:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.4])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEF7118005AE;
	Mon, 15 Jun 2026 14:10:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 81EF521E6A01; Mon, 15 Jun 2026 16:10:16 +0200 (CEST)
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
Subject: Re: [PATCH v3 03/16] qapi/docs: remove unused QAPIDoc subsection
 members
In-Reply-To: <20260603032201.993015-4-jsnow@redhat.com> (John Snow's message
	of "Tue, 2 Jun 2026 23:21:48 -0400")
References: <20260603032201.993015-1-jsnow@redhat.com>
	<20260603032201.993015-4-jsnow@redhat.com>
Date: Mon, 15 Jun 2026 16:10:16 +0200
Message-ID: <87pl1rx5br.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Uh, "qapi/docs:"?  Shouldn't this be "qapi/parser:"?

John Snow <jsnow@redhat.com> writes:

> All users of the QAPIDoc object should be iterating over all_sections
> and not grabbing arbitrary subsections, if possible. Remove the 'body'
> and 'sections' members, as they are no longer used.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> ---
>  scripts/qapi/parser.py | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
> index c3cf33904ef..b33edbba74f 100644
> --- a/scripts/qapi/parser.py
> +++ b/scripts/qapi/parser.py
> @@ -732,8 +732,6 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
>          self.all_sections: List[QAPIDoc.Section] = [
>              QAPIDoc.Section(info, QAPIDoc.Kind.PLAIN)
>          ]
> -        # the body section
> -        self.body: Optional[QAPIDoc.Section] = self.all_sections[0]
>          # dicts mapping parameter/feature names to their description
>          self.args: Dict[str, QAPIDoc.ArgSection] = {}
>          self.features: Dict[str, QAPIDoc.ArgSection] = {}
> @@ -742,8 +740,6 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
>          self.errors: Optional[QAPIDoc.Section] = None
>          # "Since" section
>          self.since: Optional[QAPIDoc.Section] = None
> -        # sections other than .body, .args, .features
> -        self.sections: List[QAPIDoc.Section] = []
>  
>      def end(self) -> None:
>          for section in self.all_sections:
> @@ -766,7 +762,6 @@ def ensure_untagged_section(self, info: QAPISourceInfo) -> None:
>  
>          # start new section
>          section = self.Section(info, kind)
> -        self.sections.append(section)
>          self.all_sections.append(section)
>  
>      def new_tagged_section(
> @@ -790,7 +785,6 @@ def new_tagged_section(
>                  raise QAPISemError(
>                      info, "duplicated '%s' section" % kind)
>              self.since = section
> -        self.sections.append(section)
>          self.all_sections.append(section)
>  
>      def _new_description(

