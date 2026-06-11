Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9F61B142D
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151856; cv=none; b=G7+KVP9O7ROuMrjAlU+J4u26I+WUymlDt1C+jL7Fu23J26tOi5Hw2FCxmYCx1zcyyS+7mBMv8dcVAIZDis4zMJaEqNQG9RSER9jAfZ0SjW4LC8d0JucX1pI8KORBXdw377y26G6kNVt1TuEwQdIXmfIJWpdU8aCuNNAAE15H2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151856; c=relaxed/simple;
	bh=SBO3St4t0bUQoNPxbMIdWzd4gJGgXGpXRSDwxfNdl2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPJ/0yElMaB6emwCf1SJijHrmDzHTH2yJ1T2Hb78gz/wWYZOfHNTJf2istUnUViWYUvBZ2u3tsDrasItGzID1hgiiPF0hO3mguN99ptyQ4H5/dhKcbkK1rnUmerF0mhJx1dtfK0xhXVrA7RlCcTBCahowrwKZJTpg8uMaBVGWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fainxj/q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fainxj/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+ZrUF5QiDAqJMi43LG3mwd5iMGaAwMF/E106IU4/XI=;
	b=Fainxj/q6KxokVUzTJLXFDTRFL8uzbKJXaBI+qmVt3iY323gjZx23o3e6yXd6Tif8Vv1P8
	6PSGBQwJl1yJAQJQpnudjuS4NRGZNlEXpnMV42dMLoMq7EnRilL7jjaMXYJSYrjzMtqzq/
	KuwamTTlyTCT0tb+EpQBjsb37kQHag8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-AA-qXEJON7SKdNO9yWKqjA-1; Thu,
 11 Jun 2026 00:23:57 -0400
X-MC-Unique: AA-qXEJON7SKdNO9yWKqjA-1
X-Mimecast-MFC-AGG-ID: AA-qXEJON7SKdNO9yWKqjA_1781151836
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B79A31955F06;
	Thu, 11 Jun 2026 04:23:55 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38B961800586;
	Thu, 11 Jun 2026 04:23:50 +0000 (UTC)
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
Subject: [PATCH v4 03/13] qapi/docs: remove unused QAPIDoc subsection members
Date: Thu, 11 Jun 2026 00:23:22 -0400
Message-ID: <20260611042332.482979-4-jsnow@redhat.com>
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

All users of the QAPIDoc object should be iterating over all_sections
and not grabbing arbitrary subsections, if possible. Remove the 'body'
and 'sections' members, as they are no longer used.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index c3cf33904ef..b33edbba74f 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -732,8 +732,6 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
         self.all_sections: List[QAPIDoc.Section] = [
             QAPIDoc.Section(info, QAPIDoc.Kind.PLAIN)
         ]
-        # the body section
-        self.body: Optional[QAPIDoc.Section] = self.all_sections[0]
         # dicts mapping parameter/feature names to their description
         self.args: Dict[str, QAPIDoc.ArgSection] = {}
         self.features: Dict[str, QAPIDoc.ArgSection] = {}
@@ -742,8 +740,6 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
         self.errors: Optional[QAPIDoc.Section] = None
         # "Since" section
         self.since: Optional[QAPIDoc.Section] = None
-        # sections other than .body, .args, .features
-        self.sections: List[QAPIDoc.Section] = []
 
     def end(self) -> None:
         for section in self.all_sections:
@@ -766,7 +762,6 @@ def ensure_untagged_section(self, info: QAPISourceInfo) -> None:
 
         # start new section
         section = self.Section(info, kind)
-        self.sections.append(section)
         self.all_sections.append(section)
 
     def new_tagged_section(
@@ -790,7 +785,6 @@ def new_tagged_section(
                 raise QAPISemError(
                     info, "duplicated '%s' section" % kind)
             self.since = section
-        self.sections.append(section)
         self.all_sections.append(section)
 
     def _new_description(
-- 
2.54.0

