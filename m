Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC3330301
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151856; cv=none; b=R7rvWGkUkC647sn+1gAHauvbMyyS/suntsfgdAVShq5vpkWvtLz3jlAjU0HiwaBZ+SQeNXwaev3yXLTMGRYCvptR3FZMFEdUD+SAlhHa5gZvKCD6wSMCBSTPVjmvg2zyjdD1g3RzzxFwVgrnRzqhOHSC3l31DnuukpCi0qX72VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151856; c=relaxed/simple;
	bh=9wPyytNRkemJSEV8V8C8fZ2KEHR9+Jf2v7dk/st3LAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JiXzAKa/FLa+EY9NpWLVE7F4OVKbv8tAh7apLjUJZvn6wffz4rFmY+38lgFkq3ODKhJxru5na7Qr51hgT+n4oI7MNx8BDgb/x8COP3kaVZggkzhAouOj3dRSSE5bx/eO+Fc6GucArW48xqUGv1ipXgRp2P5dNjF1XHOupS2EUys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ThBYlYxJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ThBYlYxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eD93VbLNcb0i8xKYOQN6HBmq0xjc5UHNJ/CSbLRm+fI=;
	b=ThBYlYxJ0lwj4ZhAcOglDclzuTGZ7oS5Tu24uY2WJ4zsh74raxXlXg2WkusQ/ZA5BwCuDC
	NU6d9cEJO0nOk3HDfWqeBh5dyI14A2vsccY+IJaOqIlWc/7U2LXT+UonsGGNa1HUxhRZ+c
	fwrHx7ESTlYpem+tP4oD87FoofEeDgg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-637-9KU3_9rtM6CB7JHmSB_mWQ-1; Thu,
 11 Jun 2026 00:24:03 -0400
X-MC-Unique: 9KU3_9rtM6CB7JHmSB_mWQ-1
X-Mimecast-MFC-AGG-ID: 9KU3_9rtM6CB7JHmSB_mWQ_1781151841
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E1E2188EB5B;
	Thu, 11 Jun 2026 04:24:01 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3B6081800480;
	Thu, 11 Jun 2026 04:23:55 +0000 (UTC)
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
Subject: [PATCH v4 04/13] qapi/docs: add has_features property
Date: Thu, 11 Jun 2026 00:23:23 -0400
Message-ID: <20260611042332.482979-5-jsnow@redhat.com>
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

Begin preparing to remove public access to the .features member by
introducing a semantic "has features" property instead.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index b33edbba74f..dcc58170bd5 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -555,7 +555,7 @@ def get_doc(self) -> 'QAPIDoc':
                     break
                 # Non-blank line, first of a section
                 if line == 'Features:':
-                    if doc.features:
+                    if doc.has_features:
                         raise QAPIParseError(
                             self, "duplicated 'Features:' line")
                     self.accept(False)
@@ -570,7 +570,7 @@ def get_doc(self) -> 'QAPIDoc':
                         if text:
                             doc.append_line(text)
                         line = self.get_doc_indented(doc)
-                    if not doc.features:
+                    if not doc.has_features:
                         raise QAPIParseError(
                             self, 'feature descriptions expected')
                     no_more_args = True
@@ -741,6 +741,10 @@ def __init__(self, info: QAPISourceInfo, symbol: Optional[str] = None):
         # "Since" section
         self.since: Optional[QAPIDoc.Section] = None
 
+    @property
+    def has_features(self) -> bool:
+        return bool(self.features)
+
     def end(self) -> None:
         for section in self.all_sections:
             section.text = section.text.strip('\n')
-- 
2.54.0

