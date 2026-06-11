Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46149325707
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151895; cv=none; b=pVTTD3mhgS0uB2GwmOxqqXnv9J14V25kyQ215j8RxY8NQbXWG1GFbPzg+3FEkkPokVg9+cNNvmStF+y2Igl9e4+BcgaEvWLDbocmQBSmMpAxs2NcBqsM4IRzM5U+NYKnz9TwkVViL6ACyB/SvxlozKpM8LbyTUuGjZJF5DMOv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151895; c=relaxed/simple;
	bh=My0hFFroQCRj2gqrvm6x9Ya1s00Cvgz2OUQlcKyg/oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtHRebkbJGVIXuYoPN+xY+zNMB1wIfd1Fxicd6d6ySGy7p4HqTYlNVrSUwECYf8zgDfjOWS2CN8/8mlljIbyI9l8TizUmsQ1hjRFjnbnfhearOARwbh8XPPhhoW+x3FFQC2SD62LSDaUA8LzMXlH21TfRG40J+ARcScUMQ43wx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yo726Wbb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yo726Wbb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPSL5K6v9G2sSpduMf7Q5BSCS+FnIuZ4sHlbEVJdViM=;
	b=Yo726WbbjldowrAxtgFCqZrIj2+2FdfU4fQ7XPTr6LFHeCBgoOXYTQha2PILKSWaJLHJoy
	Nnm21HEQOjXjMjmD2+Z4EZ5oE+fLIK5nJqFgRfp4EJF4Dq0Z0mgXXVyg28zRFiT6jJRDr3
	ykfAYWe0oXsHGmoimOYXfTSwgjT6a9o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-296--y30ZmB-M2uJOpeDN0zY5g-1; Thu,
 11 Jun 2026 00:24:45 -0400
X-MC-Unique: -y30ZmB-M2uJOpeDN0zY5g-1
X-Mimecast-MFC-AGG-ID: -y30ZmB-M2uJOpeDN0zY5g_1781151883
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9910718D65E1;
	Thu, 11 Jun 2026 04:24:42 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 182C91800583;
	Thu, 11 Jun 2026 04:24:36 +0000 (UTC)
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
Subject: [PATCH v4 12/13] qapi/docs: add rendering for INTRO sections
Date: Thu, 11 Jun 2026 00:23:31 -0400
Message-ID: <20260611042332.482979-13-jsnow@redhat.com>
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

Amend the qapidoc generator to handle and render INTRO sections.

The only real difference here from other sections is that we need to
dedent the text so it renders correctly. Members and Features are also
indented, but do not require a dedent() because they are always used
in tandem with an rST construct that forms the start of a new indented
block; there is coincidental harmony.

Plaintext sections, however, do not start their own block and thus
need to be dedented to prevent accidentally rendering them as a
blockquote or a syntax error.

This dedent transformation on the text does not reflow the text, so
source line information remains accurate, and the "blame" chain of
custody for sphinx rST parsing error messages continues to be correct
even through this transformation.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index 16ad15fe94f..54a32e45f7e 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -35,6 +35,7 @@
 from pathlib import Path
 import re
 import sys
+import textwrap
 from typing import TYPE_CHECKING
 
 from docutils import nodes
@@ -150,8 +151,15 @@ def add_lines(
         self,
         content: str,
         info: QAPISourceInfo,
+        dedent: bool = False,
     ) -> None:
         lines = content.splitlines(True)
+
+        if dedent:
+            lines = textwrap.dedent(content).splitlines(True)
+        else:
+            lines = content.splitlines(True)
+
         for i, line in enumerate(lines):
             self.add_line_raw(line, info.fname, info.line + i)
 
@@ -223,13 +231,16 @@ def reformat_arobase(text: str) -> str:
 
     # Transmogrification helpers
 
-    def visit_paragraph(self, section: QAPIDoc.Section) -> None:
+    def visit_plaintext(self, section: QAPIDoc.Section) -> None:
         # Squelch empty paragraphs.
         if not section.text:
             return
 
+        # Intro sections, which are indented in QAPI source, need to
+        # be dedented to avoid accidental block quotes in ReST syntax.
+        dedent = bool(section.kind == QAPIDoc.Kind.INTRO)
         self.ensure_blank_line()
-        self.add_lines(section.text, section.info)
+        self.add_lines(section.text, section.info, dedent)
         self.ensure_blank_line()
 
     def visit_member(self, section: QAPIDoc.ArgSection) -> None:
@@ -373,7 +384,7 @@ def visit_sections(self, ent: QAPISchemaDefinition) -> None:
             section.text = self.reformat_arobase(section.text)
 
             if section.kind.name in ("PLAIN", "INTRO"):
-                self.visit_paragraph(section)
+                self.visit_plaintext(section)
             elif section.kind == QAPIDoc.Kind.MEMBER:
                 assert isinstance(section, QAPIDoc.ArgSection)
                 if section.name == "q_dummy":
-- 
2.54.0

