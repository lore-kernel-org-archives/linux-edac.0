Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB5A3DBD5E
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456958; cv=none; b=AIwTV/O3d7C3kh82KezETKTfWacTPHWoCFlgpMqL6vV4vl0k2ieYL8dncVd5ZH0IeNNH5S2MYHtCH6ofDz1w5Y085NgXKA2pWVPPIVptaKXaSZ2TvzRNHMl9JQSvdNXYCbV9EFDDA4Q5LTl0AC+BAQSKzjX7aM/OADIpuivAFxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456958; c=relaxed/simple;
	bh=igDv0MMoluql6zpxnGE5bVGQIVWXQYHnbgL40LSMW4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tRiQyjhlGUc9NT2rdAXAyTDGsbU7Scus0J4dNvOxifiuX5s+TSksiEoqPU74g6hGPEjTWAgLYfi//mnATN91R4rCQecs4DdIut+wvfumnWXAnbiK1d3TeL5NOPdll00ksVPSuepCS8ikrjHYd7/8EQdDDOYHs3aJjK1fBPx745w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c/mgrIQZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c/mgrIQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i/8BRod6YgBNjBQ1A4fmjvtc3BSkD+yn4td3noauUX8=;
	b=c/mgrIQZ65xQGPlMmGjM0IK6xK9933dumtNuLtcBiTJK/0KHzo8BEMKLiqwXZF1kCcjfGO
	0m22lR5u6BtnBO9vZ+dAfLQoAiD+k/wrkkOiDujIaB4L4DbcRAqFDkRdZNK2BJBSkJZ9MH
	8V91xw13ZBcZMULL4O5d0LZaaRaF+xY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-CBJ5ZysbPzST3Kn1Md9j_A-1; Tue,
 02 Jun 2026 23:22:30 -0400
X-MC-Unique: CBJ5ZysbPzST3Kn1Md9j_A-1
X-Mimecast-MFC-AGG-ID: CBJ5ZysbPzST3Kn1Md9j_A_1780456948
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B515A195609D;
	Wed,  3 Jun 2026 03:22:28 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7612230001A1;
	Wed,  3 Jun 2026 03:22:24 +0000 (UTC)
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
Subject: [PATCH v3 05/16] qapi/docs: make remaining subsection members "private"
Date: Tue,  2 Jun 2026 23:21:50 -0400
Message-ID: <20260603032201.993015-6-jsnow@redhat.com>
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

These fields are used to provide error checking and internal logistics
and should not be used by a user of the library to directly access
documentation sections, so make them private.

The "since" field alone is left public, as the qapidoc generator does
use this field to pull that section out of the regular flow of the
document.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 48 +++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index dcc58170bd5..da4756a7424 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -733,17 +733,17 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
             QAPIDoc.Section(info, QAPIDoc.Kind.PLAIN)
         ]
         # dicts mapping parameter/feature names to their description
-        self.args: Dict[str, QAPIDoc.ArgSection] = {}
-        self.features: Dict[str, QAPIDoc.ArgSection] = {}
+        self._args: Dict[str, QAPIDoc.ArgSection] = {}
+        self._features: Dict[str, QAPIDoc.ArgSection] = {}
         # a command's "Returns" and "Errors" section
-        self.returns: Optional[QAPIDoc.Section] = None
-        self.errors: Optional[QAPIDoc.Section] = None
+        self._returns: Optional[QAPIDoc.Section] = None
+        self._errors: Optional[QAPIDoc.Section] = None
         # "Since" section
         self.since: Optional[QAPIDoc.Section] = None
 
     @property
     def has_features(self) -> bool:
-        return bool(self.features)
+        return bool(self._features)
 
     def end(self) -> None:
         for section in self.all_sections:
@@ -775,15 +775,15 @@ def new_tagged_section(
     ) -> None:
         section = self.Section(info, kind)
         if kind == QAPIDoc.Kind.RETURNS:
-            if self.returns:
+            if self._returns:
                 raise QAPISemError(
                     info, "duplicated '%s' section" % kind)
-            self.returns = section
+            self._returns = section
         elif kind == QAPIDoc.Kind.ERRORS:
-            if self.errors:
+            if self._errors:
                 raise QAPISemError(
                     info, "duplicated '%s' section" % kind)
-            self.errors = section
+            self._errors = section
         elif kind == QAPIDoc.Kind.SINCE:
             if self.since:
                 raise QAPISemError(
@@ -807,16 +807,16 @@ def _new_description(
         desc[name] = section
 
     def new_argument(self, info: QAPISourceInfo, name: str) -> None:
-        self._new_description(info, name, QAPIDoc.Kind.MEMBER, self.args)
+        self._new_description(info, name, QAPIDoc.Kind.MEMBER, self._args)
 
     def new_feature(self, info: QAPISourceInfo, name: str) -> None:
-        self._new_description(info, name, QAPIDoc.Kind.FEATURE, self.features)
+        self._new_description(info, name, QAPIDoc.Kind.FEATURE, self._features)
 
     def append_line(self, line: str) -> None:
         self.all_sections[-1].append_line(line)
 
     def connect_member(self, member: 'QAPISchemaMember') -> None:
-        if member.name not in self.args:
+        if member.name not in self._args:
             assert member.info
             if self.symbol not in member.info.pragma.documentation_exceptions:
                 raise QAPISemError(member.info,
@@ -827,7 +827,7 @@ def connect_member(self, member: 'QAPISchemaMember') -> None:
 
             section = QAPIDoc.ArgSection(
                 self.info, QAPIDoc.Kind.MEMBER, member.name)
-            self.args[member.name] = section
+            self._args[member.name] = section
 
             # Determine where to insert stub doc - it should go at the
             # end of the members section(s), if any. Note that index 0
@@ -839,14 +839,14 @@ def connect_member(self, member: 'QAPISchemaMember') -> None:
                     index += 1
             self.all_sections.insert(index, section)
 
-        self.args[member.name].connect(member)
+        self._args[member.name].connect(member)
 
     def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
-        if feature.name not in self.features:
+        if feature.name not in self._features:
             raise QAPISemError(feature.info,
                                "feature '%s' lacks documentation"
                                % feature.name)
-        self.features[feature.name].connect(feature)
+        self._features[feature.name].connect(feature)
 
     def ensure_returns(self, info: QAPISourceInfo) -> None:
 
@@ -887,18 +887,18 @@ def _insert_near_kind(
 
     def check_expr(self, expr: QAPIExpression) -> None:
         if 'command' in expr:
-            if self.returns and 'returns' not in expr:
+            if self._returns and 'returns' not in expr:
                 raise QAPISemError(
-                    self.returns.info,
+                    self._returns.info,
                     "'Returns' section, but command doesn't return anything")
         else:
-            if self.returns:
+            if self._returns:
                 raise QAPISemError(
-                    self.returns.info,
+                    self._returns.info,
                     "'Returns' section is only valid for commands")
-            if self.errors:
+            if self._errors:
                 raise QAPISemError(
-                    self.errors.info,
+                    self._errors.info,
                     "'Errors' section is only valid for commands")
 
     def check(self) -> None:
@@ -918,5 +918,5 @@ def check_args_section(
                         "do" if len(bogus) > 1 else "does"
                     ))
 
-        check_args_section(self.args, 'member')
-        check_args_section(self.features, 'feature')
+        check_args_section(self._args, 'member')
+        check_args_section(self._features, 'feature')
-- 
2.54.0

