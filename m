Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9930E821
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151826; cv=none; b=a2bc7GE8i0ZAPYldMIRxpuXyRT0Ta1G2k6rxISZ1L39QLMkYecGMsDBQ8NXyOtsyAwrN6/xwRSfsmZYkooVFk+7z2+wecbPg1nsm5FRnQ7LI7vIbQaH+dcMYONcFwZjTDexezsW9v1PfX5B2okMmqKsTu1MQeqcYMKW8VZ2SJ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151826; c=relaxed/simple;
	bh=pQWkRgZUCf8HakiCDLsza3gHOHZKu8EuNLUrSu4fVx8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ARjdA12dsCxu+M0OrUBaYW0hMRvYGykRHto2jyDUlrWopxirNcO9M4RHiTaD8XbLYBvCm3XDrAI6GuJJNFtpzD/P+ay3urSpu/EOoTvh/jjoxpRFGwhOiMCII1ecvzrvwtziplft5pQILJHf5Xb/wN9avjQL/bqhYcPn2vtDWRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUVUr8tL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUVUr8tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SvH369xNRR447fk1hvE6sT+1Q/ldXYI0tqtjisLXCmk=;
	b=eUVUr8tLfuJJQ1T9pMZbldbOxm3/6/NTQZEMsg5bolAOjnQ4b9IKVc+TPJ42USvgcOKPDx
	6Lf8PhDD1rKGLDU2NijquUtaiTBB3nIvHiWPFcgHeY8X9XED2tRzzzg884cjKMiDIpKNSZ
	/4F2drvhB/d2N4iNfT8oL2TxQ8oJpoo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-V1ibuMr3NPyivOvFvDWkJA-1; Thu,
 11 Jun 2026 00:23:42 -0400
X-MC-Unique: V1ibuMr3NPyivOvFvDWkJA-1
X-Mimecast-MFC-AGG-ID: V1ibuMr3NPyivOvFvDWkJA_1781151821
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B5161800345;
	Thu, 11 Jun 2026 04:23:40 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7F6981800583;
	Thu, 11 Jun 2026 04:23:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Michael Roth <michael.roth@amd.com>,
	Eric Blake <eblake@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	linux-edac@vger.kernel.org,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 00/13] qapi: add formal "intro" section
Date: Thu, 11 Jun 2026 00:23:19 -0400
Message-ID: <20260611042332.482979-1-jsnow@redhat.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
V4: A few minor comment touch-ups; omitted module conversions.=0D
=0D
V3: changed intro section syntax, made various fixes and changes; I'm=0D
going to be honest Markus I did not keep a strict account this time=0D
;_;=0D
=0D
V2: punt intro sections to the subsequent line and adjust the parser=0D
accordingly. Left as an RFC patch that undoes some things this series=0D
does instead of properly factoring into the series.=0D
=0D
John Snow (13):=0D
  python: temporarily restrict max mypy version=0D
  tests/qapi: generate output in source order=0D
  qapi/docs: remove unused QAPIDoc subsection members=0D
  qapi/docs: add has_features property=0D
  qapi/docs: make remaining subsection members "private"=0D
  qapi/docs: fix comment phrasing=0D
  qapi/docs: add "Intro" section=0D
  qapi/parser: move _insert_near_kind() method=0D
  qapi/parser: add mea culpa comment for ensure_returns=0D
  qapi/docs: adjust stub member insertion algorithm=0D
  qapi/docs: remove implicit Plain section=0D
  qapi/docs: add rendering for INTRO sections=0D
  qapi/docs: add "Intro" section parsing=0D
=0D
 docs/devel/qapi-code-gen.rst   |  16 ++--=0D
 docs/sphinx/qapidoc.py         |  61 +++++++-----=0D
 python/setup.cfg               |   3 +-=0D
 scripts/qapi/parser.py         | 167 +++++++++++++++++++--------------=0D
 tests/qapi-schema/doc-good.out |  86 +++++++++--------=0D
 tests/qapi-schema/test-qapi.py |  14 +--=0D
 6 files changed, 197 insertions(+), 150 deletions(-)=0D
=0D
-- =0D
2.54.0=0D
=0D

