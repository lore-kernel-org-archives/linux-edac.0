Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B82325707
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151874; cv=none; b=Q9K/XWTJlD9NiLzOznOKoI/sbU5PziDEP+ecpb5zW2LIzKg4o4M1DQ6dyOy84QqfPlX1k4B3zmmOjyXVruD1+TkYeuSm3V33GaGPL0A3qzyLWdMMqXK8GttivlN4e5cHdqzF7u7yrhTzsJAUX+8YltZoa+qL/i8c0g36iWZ490A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151874; c=relaxed/simple;
	bh=jJIzlyZmBSKG/j5qfsKPRiUB1lZRNzhzqTFru1XNY/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jb439KNV6/U8i8j8CfPgp1nz1jvx/VtTfuoHMHsIMCkpO9WwiMBCL7Rufmul3qJD/VDYOkKiXM07AWsZ8bW8Je0PWeGTZRKTevFc/g19LZt52cndXKH9jh5kVv/ESwz/ae89Zyo77D+304leVtDIATQn+vUMHAXG3Fu3pJpuK4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IUamfb5C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IUamfb5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GgcCbsDG7i6mFrpM4lessixf2pXw7a+25UYC+eClyHU=;
	b=IUamfb5COfVfiEuH9KanTt3k4P08wZCtl4+yWYHuDVQfxZwrYDRBsmGSsF3HSgjX9KwEc6
	8PeV/DF/A0WQHQS2Pu1KRNGzlEkSRjD2qELEJcq86bv6f4fkJRjBDKlfLWrX4wnlEm76BW
	EQp1rS6GHppARcDeTvshRQLd5nGmOJU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-AfmO8mvsMRWOw20RU97ZEg-1; Thu,
 11 Jun 2026 00:24:28 -0400
X-MC-Unique: AfmO8mvsMRWOw20RU97ZEg-1
X-Mimecast-MFC-AGG-ID: AfmO8mvsMRWOw20RU97ZEg_1781151867
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60C5F1955F44;
	Thu, 11 Jun 2026 04:24:27 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B8A391800583;
	Thu, 11 Jun 2026 04:24:22 +0000 (UTC)
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
Subject: [PATCH v4 09/13] qapi/parser: add mea culpa comment for ensure_returns
Date: Thu, 11 Jun 2026 00:23:28 -0400
Message-ID: <20260611042332.482979-10-jsnow@redhat.com>
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

These algorithms are quite a mess currently, but they are temporary
until we add the inliner which will address these issues more
holistically. For now, add the "mea culpa".

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 261f8ba9f8b..b0cead38b1f 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -866,6 +866,13 @@ def connect_feature(self, feature: 'QAPISchemaFeature') -> None:
         self._features[feature.name].connect(feature)
 
     def ensure_returns(self, info: QAPISourceInfo) -> None:
+        # This is more complicated than it ought to be.  The doc
+        # parser should already know where a generated RETURNS section
+        # should go.  It currently doesn't, mostly because it accepts
+        # tagged sections in any order.
+        #
+        # TODO: Tighten doc syntax and simplify.
+
         if any(s.kind == QAPIDoc.Kind.RETURNS for s in self.all_sections):
             return
 
-- 
2.54.0

