Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE763DCDA1
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456977; cv=none; b=Y9GJQ3Bnszq7wl8bRcEgSzNuh4FO1QknjPjN90oVTZg3ajxBgdvPzNaCHgRdHZqTdUCdT0F+PDJ1Xx6Bu2CG72TmlgCK8AqSeeZcHJ8CmpeoLWrjs6XcqD4UJKzpmo7qbuQFSiBTw4eqWWH7hwyfsRB85V6Md8usWQDaC5YuhU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456977; c=relaxed/simple;
	bh=AeemVVMwxrIISo99Wr8Bd0WhhVLbsOpXvC8oPuwU3mQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkhlAXXIs8Vwc3irktXgLxenan6eYbZVwqVfnkLuvRjpP/d1wUigzEzSc9MK2fbf+sU8Aj2cWekJO5x34uxpdxqngtrtECKBzJjljBz2z7QYQka4xO80YVpHn5EmRrXG/4i/z/dOUcTR5eMX2k+sQbQk3u09KUKCEgYP4cNOlPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C72/bIZc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C72/bIZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcOyyMvF31+cUE24n3jEGHkdEH2/+jIBhFBTj92e3UY=;
	b=C72/bIZceT4DbfbCLYhBlWVtzSZ4UeaKjAwiWU1WogUGa1BDGbdPCBgLFYbL+fqAgwLI8a
	BVslLOOLi/bmrtZUbou6rHf97rJbwaohJ6LRvuA8cIM4F71YFusyPznu8LdwfXwaX5r97B
	YPJY6WbqyNDePYXsJdfGNcjp7uhYByY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-Kq0itHC5OQWClD1o2AoIRQ-1; Tue,
 02 Jun 2026 23:22:51 -0400
X-MC-Unique: Kq0itHC5OQWClD1o2AoIRQ-1
X-Mimecast-MFC-AGG-ID: Kq0itHC5OQWClD1o2AoIRQ_1780456970
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E90F1800635;
	Wed,  3 Jun 2026 03:22:50 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A103C30001A1;
	Wed,  3 Jun 2026 03:22:46 +0000 (UTC)
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
Subject: [PATCH v3 10/16] qapi/docs: remove implicit Plain section
Date: Tue,  2 Jun 2026 23:21:55 -0400
Message-ID: <20260603032201.993015-11-jsnow@redhat.com>
In-Reply-To: <20260603032201.993015-1-jsnow@redhat.com>
References: <20260603032201.993015-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Prior to this patch, we always create an empty Plain section. Removing
this allows us to gradually phase out the "Plain" section in favor of
"Intro" and "Details" sections while keeping "Plain" around for the
interim churn during the series - meaning that we don't actually know
at __init__ time which type of section we'll have first.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py         |  4 +---
 tests/qapi-schema/doc-good.out | 14 --------------
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 406edf6aa9d..4beec4f9eda 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -730,9 +730,7 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
         # definition doc's symbol, None for free-form doc
         self.symbol: Optional[str] = symbol
         # the sections in textual order
-        self.all_sections: List[QAPIDoc.Section] = [
-            QAPIDoc.Section(info, QAPIDoc.Kind.PLAIN)
-        ]
+        self.all_sections: List[QAPIDoc.Section] = []
         # dicts mapping parameter/feature names to their description
         self._args: Dict[str, QAPIDoc.ArgSection] = {}
         self._features: Dict[str, QAPIDoc.ArgSection] = {}
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index b9829e2f841..16f44221771 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -106,8 +106,6 @@ Examples:
 - *verbatim*
 - {braces}
 doc symbol=Enum
-    Plain
-
     Member=one
 The _one_ {and only}, description on the same line
     Member=two
@@ -119,8 +117,6 @@ a member feature
     Plain
 @two is undocumented
 doc symbol=Base
-    Plain
-
     Member=base1
  description starts on a new line,
  minimally indented
@@ -138,16 +134,10 @@ a feature
     Feature=member-feat
 a member feature
 doc symbol=Variant2
-    Plain
-
 doc symbol=Object
-    Plain
-
     Feature=union-feat1
 a feature
 doc symbol=Alternate
-    Plain
-
     Member=i
 description starts on the same line
     remainder indented the same
@@ -161,8 +151,6 @@ doc freeform
 Another subsection
 ==================
 doc symbol=cmd
-    Plain
-
     Member=arg1
     description starts on a new line,
     indented
@@ -223,7 +211,5 @@ another feature
 
    <- ... has no title ...
 doc symbol=EVT_BOXED
-    Plain
-
     Feature=feat3
 a feature
-- 
2.54.0

