Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B318B325707
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151890; cv=none; b=V8Nx4pldlbtf+c1uVgt5ad3Za15S+2zde9OdoW1N3+Cu8IbufFTt17zc13sM9thlsJvXXyNPiapBe4qp9eEj+QSDxr1BZNitrn4W8z7fJeXZ/TBx6p/5JS06xBRUuXSIqmeeaIw7i5Jww9CUrw5BejuPQtqmOgC98NNp6yo+2xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151890; c=relaxed/simple;
	bh=p29BMmh88DWDtnIuvtJk9XpxSYnJlAzq/g/swltAt44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mj3ykjgI2x/HN0zrZVBiKAOwm7Zm5Y49iTIBSMEqPEIMyEzAZcCyCwLYheCKmaEcZtTjMnsdn9TDxP0VQX4kkfeEbt56lqUn2LrXqUxQF4coXJc1ewZQcB8nINOCBlidKqND0rOxAHYWTSRR2OiD9ZFdOpK+nFB7pZLuuKYXT4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iT8HS+Ep; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iT8HS+Ep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSo1lqn68UhenL7oYBn7w1Z0vR4YGWD3FV+n9trUE2E=;
	b=iT8HS+EpAyAQC4xuOzjiyGvk6ejOZnGtJ/4yEY02TIy4C22crCiPkVqfS4ZYBQKZKJAVQz
	uKrtFSIHCNX5B9FivEXItrQ+Cu3onUm9PLIroKqFMWTK3VT31ocJyj3+9zi/frHG37cJFu
	s9SDyLwBZW4BzCTAHiSueGnDeTqgszA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-9OcywcDvP3W4CYAqL6ZfZA-1; Thu,
 11 Jun 2026 00:24:39 -0400
X-MC-Unique: 9OcywcDvP3W4CYAqL6ZfZA-1
X-Mimecast-MFC-AGG-ID: 9OcywcDvP3W4CYAqL6ZfZA_1781151876
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E77318D97F0;
	Thu, 11 Jun 2026 04:24:36 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4FA01800583;
	Thu, 11 Jun 2026 04:24:32 +0000 (UTC)
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
Subject: [PATCH v4 11/13] qapi/docs: remove implicit Plain section
Date: Thu, 11 Jun 2026 00:23:30 -0400
Message-ID: <20260611042332.482979-12-jsnow@redhat.com>
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
index 09720a2c270..b7a7b9465a9 100644
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

