Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A363F0A94
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456936; cv=none; b=ECuJcA5fpQ2AOVkUvFO4F4Mcy+FqH5iJuanzYxKDiImhxcPaoze6P7XMisPbAFqmUzU8G7Ll5ZN/GtVfFaTtOftmU5iZY9cBjEcOaqKyZdbhyFz6P8eFBCxkfyfEnuMGqfZDgycd6MYRtrIDRypRMBzVlV0O8Y7oDUjpvqCIo9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456936; c=relaxed/simple;
	bh=Ple/vUs3O8SB1le8Lp/kDUZfBkiOy41LbefWKJI0SwY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=k5rUr8nSWQAZY/9MgQnG9DTbU7Xuz5m/Y3oz8Jyz3dyo68g/wEwjrChX5NmFwrZONFj039B/3UGeIT8rXFq3NaRZu+aS0t9I9D1CuSntaaqF3pfu7yaDT60Le7hBWzGOYgvcoG1P+6NTLF+UkLBwr0KB5u5IioDKltB+mMuuyaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rm8kXHNC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rm8kXHNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=so3jSTembzNsOuKeK8c2QkxeTNOxuho6aLvudNKLKS4=;
	b=Rm8kXHNCWT1Tjnb7AUfwH6yMze4mFCawLKlYHsDMSem474D/4NduzQUq/LyHEeLQ6gNuUM
	tUhjcLHofQM8d/0Lgk3dXjxMbMGQqEfSzqZ31GBDxlJFYyPheVOMoH08pRICCHNNlFbf/h
	PBmO+g52cN/lTNw0Q+cYyuCdxvlrkVA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-NE9FmolGP6i3ZjEKw4nlAg-1; Tue,
 02 Jun 2026 23:22:10 -0400
X-MC-Unique: NE9FmolGP6i3ZjEKw4nlAg-1
X-Mimecast-MFC-AGG-ID: NE9FmolGP6i3ZjEKw4nlAg_1780456929
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D39AA1800663;
	Wed,  3 Jun 2026 03:22:08 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2A0730001A1;
	Wed,  3 Jun 2026 03:22:03 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	linux-edac@vger.kernel.org,
	Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v3 00/16] qapi: add formal "intro" section
Date: Tue,  2 Jun 2026 23:21:45 -0400
Message-ID: <20260603032201.993015-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hiya, this is a series that explores a potential syntax for a=0D
designated "Intro" section. Markus knows why I want this, but for=0D
everyone else: a designated "Introduction" section is useful for the=0D
desired "inliner" feature for the new QAPI doc system. Commits explain=0D
a bit more. This is prep work and doesn't really change anything=0D
tangibly except source code syntax for the QAPI docs.=0D
=0D
It is designed so that this conversion can happen incrementally with=0D
no actual difference to the rendered manuals, so each QAPI module can=0D
be converted one at a time for easier review and merging in an=0D
arbitrary order.=0D
=0D
This series demonstrates conversion of just four modules; if I'm given=0D
a thumbs up, I will convert the rest of QAPI, one module (or=0D
maintainer stanza) per patch like how I handled adding=0D
cross-references.=0D
=0D
**=0D
=0D
V3: changed intro section syntax, made various fixes and changes; I'm=0D
going to be honest Markus I did not keep a strict account this time=0D
;_;=0D
=0D
V2: punt intro sections to the subsequent line and adjust the parser=0D
accordingly. Left as an RFC patch that undoes some things this series=0D
does instead of properly factoring into the series.=0D
=0D
John Snow (16):=0D
  python: temporarily restrict max mypy version=0D
  tests/qapi: generate output in source order=0D
  qapi/docs: remove unused QAPIDoc subsection members=0D
  qapi/docs: add has_features property=0D
  qapi/docs: make remaining subsection members "private"=0D
  qapi/docs: fix comment phrasing=0D
  qapi/docs: add "Intro" section=0D
  qapi/parser: move _insert_near_kind() method=0D
  qapi/docs: adjust stub member insertion algorithm=0D
  qapi/docs: remove implicit Plain section=0D
  qapi/docs: add rendering for INTRO sections=0D
  qapi/docs: add "Intro" section parsing=0D
  qapi: convert intro sections for accelerator.json=0D
  qapi: convert intro sections for acpi-hest.json=0D
  qapi: convert intro sections for acpi.json=0D
  qapi: convert intro sections for audio.json=0D
=0D
 docs/devel/qapi-code-gen.rst   |  16 ++--=0D
 docs/sphinx/qapidoc.py         |  59 +++++++-----=0D
 qapi/accelerator.json          |  18 ++--=0D
 qapi/acpi-hest.json            |   4 +-=0D
 qapi/acpi.json                 |  18 ++--=0D
 qapi/audio.json                |  88 +++++++-----------=0D
 python/setup.cfg               |   3 +-=0D
 scripts/qapi/parser.py         | 162 +++++++++++++++++++--------------=0D
 tests/qapi-schema/doc-good.out |  86 ++++++++---------=0D
 tests/qapi-schema/test-qapi.py |  14 +--=0D
 10 files changed, 236 insertions(+), 232 deletions(-)=0D
=0D
-- =0D
2.54.0=0D
=0D

