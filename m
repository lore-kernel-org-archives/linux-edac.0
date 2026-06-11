Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C81325707
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151869; cv=none; b=uwlTj3tFOdKFcMMZruvigHFGHJ1STeNFKh2bM+rLCMANeqYBn3paVV2YvdUbWLNlmy4W7jp/qZKb8cKzfu/OeFU7iF3J5S/LLyvm3G7bquvLPo+2jl9xAJCKAf+RjZg7tDKQMqSww72GjhAAWhkS3H+WAf6P9EsCcKj03BYNcjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151869; c=relaxed/simple;
	bh=LnGI8kae/DIFDTDTCZaV3v/VpFCoDXzD3EAXd3B/kUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHyoleHqQm4JQJIWF/lHGf30+2bBpyzF9hsERFns92IyZrvsbL7WLgpBQtDN+K1e88hbPLQTHRNIpsn2lCmsaP8h+i3CV98OR3dVr1NOHbl4Pka7HzszsbxD7wK9tW901ehz+FbgCmqEJiWZgP9I/1xa65ZmYZRLEAUny3g4xEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqVnd6Jv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqVnd6Jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AQ9gxAk0ZVxirQ/nsQerUhE6EQtniOZuya0ID+1Nzys=;
	b=OqVnd6Jv19fuKap03Ffuf/LzZGB+IEn/wMMP4nZCyTt79P43073tsAS4NM7R7aAiB6h1as
	VhuXKJZauiwsmtyeeICb0gqSf3TLeQS7E5X1Ll3FToDIzj/mPqw15BhVbJ/0T1/4KDXJMs
	lKVxZ5xnb+91iARtferdzKeluQfvcsE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-711-wtsbMfa3Pia9K_iAYM5lJQ-1; Thu,
 11 Jun 2026 00:24:24 -0400
X-MC-Unique: wtsbMfa3Pia9K_iAYM5lJQ-1
X-Mimecast-MFC-AGG-ID: wtsbMfa3Pia9K_iAYM5lJQ_1781151862
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6488E1955EAA;
	Thu, 11 Jun 2026 04:24:22 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 57C211800583;
	Thu, 11 Jun 2026 04:24:18 +0000 (UTC)
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
Subject: [PATCH v4 08/13] qapi/parser: move _insert_near_kind() method
Date: Thu, 11 Jun 2026 00:23:27 -0400
Message-ID: <20260611042332.482979-9-jsnow@redhat.com>
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

Move this function out from underneath `ensure_returns` and make it
available for general purpose use as an object method instead. This is
purely a scope-level patch with no functional changes.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 97e7dacb0fd..261f8ba9f8b 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -816,6 +816,22 @@ def new_feature(self, info: QAPISourceInfo, name: str) -> None:
     def append_line(self, line: str) -> None:
         self.all_sections[-1].append_line(line)
 
+    def _insert_near_kind(
+        self,
+        kind: 'QAPIDoc.Kind',
+        new_sect: 'QAPIDoc.Section',
+        after: bool = False,
+    ) -> bool:
+        """Insert or append a new doc section at a specific point."""
+        for idx, sect in enumerate(reversed(self.all_sections)):
+            if sect.kind == kind:
+                pos = len(self.all_sections) - idx - 1
+                if after:
+                    pos += 1
+                self.all_sections.insert(pos, new_sect)
+                return True
+        return False
+
     def connect_member(self, member: 'QAPISchemaMember') -> None:
         if member.name not in self._args:
             assert member.info
@@ -850,28 +866,13 @@ def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
         self._features[feature.name].connect(feature)
 
     def ensure_returns(self, info: QAPISourceInfo) -> None:
-
-        def _insert_near_kind(
-            kind: QAPIDoc.Kind,
-            new_sect: QAPIDoc.Section,
-            after: bool = False,
-        ) -> bool:
-            for idx, sect in enumerate(reversed(self.all_sections)):
-                if sect.kind == kind:
-                    pos = len(self.all_sections) - idx - 1
-                    if after:
-                        pos += 1
-                    self.all_sections.insert(pos, new_sect)
-                    return True
-            return False
-
         if any(s.kind == QAPIDoc.Kind.RETURNS for s in self.all_sections):
             return
 
         # Stub "Returns" section for undocumented returns value
         stub = QAPIDoc.Section(info, QAPIDoc.Kind.RETURNS)
 
-        if any(_insert_near_kind(kind, stub, after) for kind, after in (
+        if any(self._insert_near_kind(kind, stub, after) for kind, after in (
                 # 1. If arguments, right after those.
                 (QAPIDoc.Kind.MEMBER, True),
                 # 2. Elif errors, right *before* those.
-- 
2.54.0

