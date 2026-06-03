Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0869A39E18E
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456948; cv=none; b=sOcSRkUK1eBRu7U3zJKH1GLHZbUDeg38sbvswz56LqjaHEBRDKgb0l5+UhqcguEsGqWzMl13hFwDlueuTM5lDxEarfC9XSc0bVV1YRlghx8xjlRQZW6++HbJT0+jIEn9XOdapugVeBhunFZllIOFT/Ik/kLrQJW20bCarn0LqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456948; c=relaxed/simple;
	bh=SBO3St4t0bUQoNPxbMIdWzd4gJGgXGpXRSDwxfNdl2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=abp9rIBRRVgdWQo1C62sn7fPD8gcmHlr9iHLbTimvLDufzbMmLPsp0kqKw8XArK/mUnpLH7A1x0xiiZeRt0m4fkMDNVhxGNN8Dj0m2wmRuciMhTcLI/U05+2Lp+YaULYr5OJUy0hoX9MgOLiVoGgirEvt+WGmfr9XHzNwFsgpDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2mcDPLu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2mcDPLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d+ZrUF5QiDAqJMi43LG3mwd5iMGaAwMF/E106IU4/XI=;
	b=V2mcDPLuNOk9ptNX4kgwdGfEBEFKOGy/+86ZRuxA9XN/rIAYOBQngP2Z5dFx1gSkqQG8KD
	PJcdiikyHT8cp3H7EP6FYDCCdWiaJd2/NPzXh43b0w+svO+9a0JGvFugxwjcyZzjJHqAMG
	+tedKIU2iOQnZc7fh2w58vHoq3N1yAk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-UBn-pHWAPqWBHeXNS6Jk5g-1; Tue,
 02 Jun 2026 23:22:21 -0400
X-MC-Unique: UBn-pHWAPqWBHeXNS6Jk5g-1
X-Mimecast-MFC-AGG-ID: UBn-pHWAPqWBHeXNS6Jk5g_1780456940
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0144918011FF;
	Wed,  3 Jun 2026 03:22:20 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6ED5730001A1;
	Wed,  3 Jun 2026 03:22:16 +0000 (UTC)
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
Subject: [PATCH v3 03/16] qapi/docs: remove unused QAPIDoc subsection members
Date: Tue,  2 Jun 2026 23:21:48 -0400
Message-ID: <20260603032201.993015-4-jsnow@redhat.com>
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

