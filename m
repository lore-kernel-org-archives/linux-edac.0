Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA593358B0
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151865; cv=none; b=KZqfSUnx/ViYkBJPq1I7ecrMl8xEwmtV/9Wpx0xJv2f0F5SAuQLE5v0yLPA7ZeGEM91KC7v9c7nDqiM5tT/aqIt8u9R/tB6g6ldYC75T3OWtmxfqrmrX0I0EuOr/R1VxjKvbst+uP3miauRadyPVklVqWgeEYNE0R8ts1Qb9aPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151865; c=relaxed/simple;
	bh=vrkyCQ8eaoSWwptJ/2xFWDoF5xTQsF/J6HaYwqfVKXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVzHNLFGWchmNyE5PtNu4/RrXzgda7T55j85Q2sPcbD0a5P9p0jVjsewm71NwmX7tWwZOSBz8a7hDLBi5NjnLZsUoNiY9aVQm3bP8Lz6C8ZTgXocRimgEkNrzr11tp0tHvmXelB9m84H1fSiQyaQsIA0CzcDeX/M1IwE4ws/SPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UWo98kl2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UWo98kl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6G8ieSNPc0xcSVEK59e57gLX+A/vEMuKvzW9P7RxR8=;
	b=UWo98kl2yocHwqQOzcMFFsqOilfFZ5CrOYYVMqEAPFi16t34kkENs6Z7vd7mAQX6LPLZn4
	nSGRXx79cgetSjg+h5cy7uXnmd+TBewzCLh0lxqFwqqCzhmE2UUM+d/jhWLKPuhnwme0sU
	1RKp4ZW+Oqay+2k+y1Z4ABO4447UYvI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-77TCvxNhNAaOGXv0QGPc_g-1; Thu,
 11 Jun 2026 00:24:19 -0400
X-MC-Unique: 77TCvxNhNAaOGXv0QGPc_g-1
X-Mimecast-MFC-AGG-ID: 77TCvxNhNAaOGXv0QGPc_g_1781151857
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB107180894F;
	Thu, 11 Jun 2026 04:24:17 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2213B1800480;
	Thu, 11 Jun 2026 04:24:12 +0000 (UTC)
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
Subject: [PATCH v4 07/13] qapi/docs: add "Intro" section
Date: Thu, 11 Jun 2026 00:23:26 -0400
Message-ID: <20260611042332.482979-8-jsnow@redhat.com>
In-Reply-To: <20260611042332.482979-1-jsnow@redhat.com>
References: <20260611042332.482979-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

This patch adds an "Intro" doc section, intended to eventually replace
the "Plain" doc section alongside a forthcoming "Details" section.

For now, this section is not actually instantiated or used, but
subsequent patches will slowly convert the leading introductory sections
of QAPIDoc documentation to use this new section.

A main motivation of this series of changes is to more explicitly
delineate the "Introductory" documentation for each QAPI definition for
the sake of the inliner. When inlining members, examples, and details
from multiple QAPIDoc sections, we will want to omit the "Introductory"
text from inlined definitions while keeping notes, caution boxes,
examples, and so on. This new section facilitates that.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py | 2 +-
 scripts/qapi/parser.py | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index c2f09bac16c..1f7c15b7075 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -368,7 +368,7 @@ def visit_sections(self, ent: QAPISchemaDefinition) -> None:
         for i, section in enumerate(sections):
             section.text = self.reformat_arobase(section.text)
 
-            if section.kind == QAPIDoc.Kind.PLAIN:
+            if section.kind.name in ("PLAIN", "INTRO"):
                 self.visit_paragraph(section)
             elif section.kind == QAPIDoc.Kind.MEMBER:
                 assert isinstance(section, QAPIDoc.ArgSection)
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index d8068bb1bf6..97e7dacb0fd 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -681,6 +681,7 @@ class Kind(enum.Enum):
         ERRORS = 4
         SINCE = 5
         TODO = 6
+        INTRO = 7
 
         @staticmethod
         def from_string(kind: str) -> 'QAPIDoc.Kind':
@@ -748,7 +749,7 @@ def has_features(self) -> bool:
     def end(self) -> None:
         for section in self.all_sections:
             section.text = section.text.strip('\n')
-            if section.kind != QAPIDoc.Kind.PLAIN and section.text == '':
+            if not (section.kind.name in ("INTRO", "PLAIN") or section.text):
                 raise QAPISemError(
                     section.info, "text required after '%s:'" % section.kind)
 
-- 
2.54.0

