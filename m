Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D71A39E18E
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456949; cv=none; b=XNdAhEYWRgaoIqFnaXmY/QzuSF1pHAYsI3x81nsSrV3M0xNi1FFajfaDl3LApTjnAg8M2iBTf5I7YVkUSoK6ur5C98b+LoFq3DTubANjvvv0TMuLv89XSpqfyaqDpFhVQtmWnrpc3hj9IsjfWLvFpqfzdgtgwap1DweLPxLOj9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456949; c=relaxed/simple;
	bh=9wPyytNRkemJSEV8V8C8fZ2KEHR9+Jf2v7dk/st3LAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXhOLdxTsIXuWB9S0+sBVSs/X/iF12aYb48kWZT+h3bUD0gMIc7ZXsEB6niJ98IfGvV+dCEQIQ7O4WY86ufwABkMuR5b5GV8HJa9YVkqEYCjF+2VjHKFXhFLoruWGpr2UqaJ7EUsDNVhY3cLarZXblCFKJFgMxPitrrgVEg9WXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WlRsm2h2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WlRsm2h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eD93VbLNcb0i8xKYOQN6HBmq0xjc5UHNJ/CSbLRm+fI=;
	b=WlRsm2h2ZhzlmJ8cep4bfeXjxhZ/lzzH3o23QLDcZePZa+NfTDYfK59vEaEZZ0cf1ombjT
	qcvXs5dw/6pu+7FfntfQeg8gXZDZeK8ZHa9Vx2Q9INLN7Et++fMhz8Dp4af0mI2Fo45/eM
	dDOsP82o47Pr2TAhYqh5x27G81jvclI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-329-rd_0QzmwMoObrbOlYuTP6Q-1; Tue,
 02 Jun 2026 23:22:26 -0400
X-MC-Unique: rd_0QzmwMoObrbOlYuTP6Q-1
X-Mimecast-MFC-AGG-ID: rd_0QzmwMoObrbOlYuTP6Q_1780456944
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F58F1801238;
	Wed,  3 Jun 2026 03:22:24 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 572BC3000203;
	Wed,  3 Jun 2026 03:22:20 +0000 (UTC)
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
Subject: [PATCH v3 04/16] qapi/docs: add has_features property
Date: Tue,  2 Jun 2026 23:21:49 -0400
Message-ID: <20260603032201.993015-5-jsnow@redhat.com>
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

