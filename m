Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325C2D5932
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151839; cv=none; b=E0xPfLVvyBOr2pgP8/CkFBUHpoE4G8+vcy9tn7yBYE4v4u9VOnPKIV1MbG5n2SpKOrOBKUZtWP15hnOvnkc2eRVPJDFogzvzb6iRHpoiIEW5MBzP7CEC/DttLvrLG4nzNwUYkJqhEb5htyYo7/GJKg/Ob/KQuvFCzbOQPODE2s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151839; c=relaxed/simple;
	bh=wVJDruwkKNSpjhDWOZcVdHo+aM4tsl28X+0dIFXrcRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzjuMnmCL/KrCvhuIgwrT0JFIH7XYh6bxcNdyAwMcCl54tBkzUg7DQ9wAcUN+DHnEKMF1XeuTQ0Kckz0d88u1fVdYWpbK/P4WlRxWQvIQbyvDpPVNnymbcs50w8v6fvfGTja+BD0un8nKhDnmBSFAN01lbAokZOIWFnkSOAJnNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ff4zWU3Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ff4zWU3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D39Y81M9rFkACn/NQlcX7QZiwh/aJXxhvafRYIbxpe8=;
	b=Ff4zWU3ZXmDPTCCS+t1FgxhrVRa2x314lR4revIcLRqI/mkSJVEVzcD2xQRBCfA9BZWSc4
	9/cG/iyY0tpO+erBeaTz01355vyOH7zf+xEmCf7VtESwAb6v7GYM5+003za4keSogYGuyI
	Jkdc8ZWweJXGi6oLJ2TO1ElrovZerok=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-oU9FRwM3Nu-B7Clb7eSPKg-1; Thu,
 11 Jun 2026 00:23:52 -0400
X-MC-Unique: oU9FRwM3Nu-B7Clb7eSPKg-1
X-Mimecast-MFC-AGG-ID: oU9FRwM3Nu-B7Clb7eSPKg_1781151831
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CB31C1955EAC;
	Thu, 11 Jun 2026 04:23:50 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AEF3C1800583;
	Thu, 11 Jun 2026 04:23:46 +0000 (UTC)
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
Subject: [PATCH v4 02/13] tests/qapi: generate output in source order
Date: Thu, 11 Jun 2026 00:23:21 -0400
Message-ID: <20260611042332.482979-3-jsnow@redhat.com>
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

Rewrite the test doc generator to produce output in source order instead
of arbitrarily by section name.

This patch removes our last use of the "body" field, which has an
effect on how the sections of each test documention block are
printed. We now print the name of the section followed by the section
text for all sections except Members and Features, which are printed
as "Member=%s" or "Feature=%s" followed by the section text,
respectively.

This patch is motivated by a desire to move the QAPIDoc API away from
named fields for specific sections in a bid to force all users to simply
iterate through all_sections in order, instead - and to remove the named
subsections.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qapi-schema/doc-good.out | 82 +++++++++++++++++-----------------
 tests/qapi-schema/test-qapi.py | 14 +++---
 2 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 04a55072646..b9829e2f841 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -54,15 +54,15 @@ event EVT_BOXED Object
     boxed=True
     feature feat3
 doc freeform
-    body=
+    Plain
 *******
 Section
 *******
 doc freeform
-    body=
+    Plain
 Just text, no heading.
 doc freeform
-    body=
+    Plain
 Subsection
 ==========
 
@@ -106,84 +106,84 @@ Examples:
 - *verbatim*
 - {braces}
 doc symbol=Enum
-    body=
+    Plain
 
-    arg=one
+    Member=one
 The _one_ {and only}, description on the same line
-    arg=two
+    Member=two
 
-    feature=enum-feat
+    Feature=enum-feat
 Also _one_ {and only}
-    feature=enum-member-feat
+    Feature=enum-member-feat
 a member feature
-    section=Plain
+    Plain
 @two is undocumented
 doc symbol=Base
-    body=
+    Plain
 
-    arg=base1
+    Member=base1
  description starts on a new line,
  minimally indented
 doc symbol=Variant1
-    body=
+    Plain
 A paragraph
 
 Another paragraph
 
 @var1 is undocumented
-    arg=var1
+    Member=var1
 
-    feature=variant1-feat
+    Feature=variant1-feat
 a feature
-    feature=member-feat
+    Feature=member-feat
 a member feature
 doc symbol=Variant2
-    body=
+    Plain
 
 doc symbol=Object
-    body=
+    Plain
 
-    feature=union-feat1
+    Feature=union-feat1
 a feature
 doc symbol=Alternate
-    body=
+    Plain
 
-    arg=i
+    Member=i
 description starts on the same line
     remainder indented the same
     @b is undocumented
-    arg=b
+    Member=b
 
-    feature=alt-feat
+    Feature=alt-feat
 a feature
 doc freeform
-    body=
+    Plain
 Another subsection
 ==================
 doc symbol=cmd
-    body=
+    Plain
 
-    arg=arg1
+    Member=arg1
     description starts on a new line,
     indented
-    arg=arg2
+    Member=arg2
 description starts on the same line
     remainder indented differently
-    arg=arg3
+    Member=arg3
 
-    feature=cmd-feat1
+    Feature=cmd-feat1
 a feature
-    feature=cmd-feat2
+    Feature=cmd-feat2
 another feature
-    section=Plain
+    Plain
 .. note:: @arg3 is undocumented
-    section=Returns
+    Returns
 @Object
-    section=Errors
+    Errors
 some
-    section=Todo
+    Todo
 frobnicate
-    section=Plain
+    Plain
 .. admonition:: Notes
 
  - Lorem ipsum dolor sit amet
@@ -207,23 +207,23 @@ Examples::
 
 Note::
     Ceci n'est pas une note
-    section=Since
+    Since
 2.10
 doc symbol=cmd-boxed
-    body=
+    Plain
 If you're bored enough to read this, go see a video of boxed cats
-    feature=cmd-feat1
+    Feature=cmd-feat1
 a feature
-    feature=cmd-feat2
+    Feature=cmd-feat2
 another feature
-    section=Plain
+    Plain
 .. qmp-example::
 
    -> "this example"
 
    <- ... has no title ...
 doc symbol=EVT_BOXED
-    body=
+    Plain
 
-    feature=feat3
+    Feature=feat3
 a feature
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index cf7fb8a6df5..5beb96e894f 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -19,6 +19,7 @@
 from io import StringIO
 
 from qapi.error import QAPIError
+from qapi.parser import QAPIDoc
 from qapi.schema import QAPISchema, QAPISchemaVisitor
 
 
@@ -116,13 +117,12 @@ def test_frontend(fname):
             print('doc symbol=%s' % doc.symbol)
         else:
             print('doc freeform')
-        print('    body=\n%s' % doc.body.text)
-        for arg, section in doc.args.items():
-            print('    arg=%s\n%s' % (arg, section.text))
-        for feat, section in doc.features.items():
-            print('    feature=%s\n%s' % (feat, section.text))
-        for section in doc.sections:
-            print('    section=%s\n%s' % (section.kind, section.text))
+        for section in doc.all_sections:
+            if isinstance(section, QAPIDoc.ArgSection):
+                print('    %s=%s' % (section.kind, section.name))
+            else:
+                print('    %s' % section.kind)
+            print(section.text)
 
 
 def open_test_result(dir_name, file_name, update):
-- 
2.54.0

