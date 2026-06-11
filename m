Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EDD340407
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151908; cv=none; b=iu/Yx2IDBxTBV2Aj9Tp83iYBHkBluPzoH3fST72QtHYlQvhaV0oXHNcWm9vXo+tSRG7zChxLWxs6Tr6RuP12+RcTu6M4B0Wc6SQR0vMJaC/OTsILUHjSqf7SG6DzpWxz5xlcQnji/gll1ILczBmGMkvB2k2aE5ssjcWMDGP2y3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151908; c=relaxed/simple;
	bh=ZWB/m8Fp38s0DIGHnwz7goVz2mcw+iIINvsEFHceKFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6V1c8z9+etohGGYf+onIEUBCloiJi8894frh9luANaMPBdHFbZr81olsUrbTRwha1KoWOFGyPcEQ8bKmwr1pyGmQKdtiNyNUl/hlarxdfAj7HhdynktrgyNQKTC1nt3TJ7Thuru+9sC+nwvpaq+Trj1KpbPtNndP9WPlsbUiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkgsQc3h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkgsQc3h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwOBoDaGDJlIZ921Yr5vzll8ZG1QrMqqed9kC3sj/2k=;
	b=BkgsQc3hQ4hQEGlNG6XJDICUr35EELLXOpVaaE47kjgEQqIMA1bhwoUuqpt5mQQrHVSEvg
	4AjYo7rXBW3u6vW+rFNun/BZGUEEwcGR+wbg7j76vrbuCB+6FMVHfOaS5xX/U7D07pArCz
	8/MDSsOw+GpN/ael6jdpKNZwg/B6edU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-9M_ZRV-BOqWacLhqf3XTVQ-1; Thu,
 11 Jun 2026 00:24:51 -0400
X-MC-Unique: 9M_ZRV-BOqWacLhqf3XTVQ-1
X-Mimecast-MFC-AGG-ID: 9M_ZRV-BOqWacLhqf3XTVQ_1781151890
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C27BC195FE1B;
	Thu, 11 Jun 2026 04:24:48 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F20361800480;
	Thu, 11 Jun 2026 04:24:42 +0000 (UTC)
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
Subject: [PATCH v4 13/13] qapi/docs: add "Intro" section parsing
Date: Thu, 11 Jun 2026 00:23:32 -0400
Message-ID: <20260611042332.482979-14-jsnow@redhat.com>
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

Add parsing for explicit Intro section syntax.

A side effect of this patch is that we will (currently) always create
an empty Intro section, similar to how we used to have an empty Plain
section. The tests are adjusted accordingly, rendered document output
does not change at all.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/qapi-code-gen.rst   | 16 +++++++---------
 scripts/qapi/parser.py         |  4 ++--
 tests/qapi-schema/doc-good.out | 18 ++++++++++++++++++
 3 files changed, 27 insertions(+), 11 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 3a632b4a648..b1cc5b5f0db 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -984,11 +984,11 @@ definition it documents.
 When documentation is required (see pragma_ 'doc-required'), every
 definition must have documentation.
 
-Definition documentation starts with a line naming the definition,
-followed by an optional overview, a description of each argument (for
-commands and events), member (for structs and unions), branch (for
-alternates), or value (for enums), a description of each feature (if
-any), and finally optional tagged sections.
+Definition documentation starts with a description naming the
+definition with an optional indented overview, a description of each
+argument (for commands and events), member (for structs and unions),
+branch (for alternates), or value (for enums), a description of each
+feature (if any), and finally optional tagged sections.
 
 Descriptions start with '\@name:'.  The description text must be
 indented like this::
@@ -1093,8 +1093,7 @@ Examples of complete definition documentation::
 
  ##
  # @BlockStats:
- #
- # Statistics of a virtual block device or a block backing device.
+ #     Statistics of a virtual block device or a block backing device.
  #
  # @device: If the stats are for a virtual block device, the name
  #     corresponding to the virtual block device.
@@ -1111,8 +1110,7 @@ Examples of complete definition documentation::
 
  ##
  # @query-blockstats:
- #
- # Query the @BlockStats for all virtual block devices.
+ #     Query the @BlockStats for all virtual block devices.
  #
  # @query-nodes: If true, the command will query all the block nodes
  #     ... explain, explain ...
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b7a7b9465a9..9e14c2f7921 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -542,8 +542,8 @@ def get_doc(self) -> 'QAPIDoc':
             if not symbol:
                 raise QAPIParseError(self, "name required after '@'")
             doc = QAPIDoc(info, symbol)
-            self.accept(False)
-            line = self.get_doc_line()
+            doc.all_sections.append(QAPIDoc.Section(info, QAPIDoc.Kind.INTRO))
+            line = self.get_doc_indented(doc)
             no_more_args = False
 
             while line is not None:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 16f44221771..371dd25ffc7 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -106,6 +106,8 @@ Examples:
 - *verbatim*
 - {braces}
 doc symbol=Enum
+    Intro
+
     Member=one
 The _one_ {and only}, description on the same line
     Member=two
@@ -117,10 +119,14 @@ a member feature
     Plain
 @two is undocumented
 doc symbol=Base
+    Intro
+
     Member=base1
  description starts on a new line,
  minimally indented
 doc symbol=Variant1
+    Intro
+
     Plain
 A paragraph
 
@@ -134,10 +140,16 @@ a feature
     Feature=member-feat
 a member feature
 doc symbol=Variant2
+    Intro
+
 doc symbol=Object
+    Intro
+
     Feature=union-feat1
 a feature
 doc symbol=Alternate
+    Intro
+
     Member=i
 description starts on the same line
     remainder indented the same
@@ -151,6 +163,8 @@ doc freeform
 Another subsection
 ==================
 doc symbol=cmd
+    Intro
+
     Member=arg1
     description starts on a new line,
     indented
@@ -198,6 +212,8 @@ Note::
     Since
 2.10
 doc symbol=cmd-boxed
+    Intro
+
     Plain
 If you're bored enough to read this, go see a video of boxed cats
     Feature=cmd-feat1
@@ -211,5 +227,7 @@ another feature
 
    <- ... has no title ...
 doc symbol=EVT_BOXED
+    Intro
+
     Feature=feat3
 a feature
-- 
2.54.0

