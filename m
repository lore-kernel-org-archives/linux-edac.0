Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015EB3F1AC1
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456960; cv=none; b=mhF/CGuhDMNowHM3QaRVIv8ifp1ycb5AqFAebDErGAEGh0obVCNKbtVKwVKpAxdroEHfaaEQ6oZn+gpD1Zv9z5Zuj0MTfhUHqxk5Q0EHKs2htuRZz4AY5bJiuFZTySbjQSzG097rmZ1rGGf27qFsrb9pdqESkgmAYWIa5yjM7MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456960; c=relaxed/simple;
	bh=AoRKxq2YqTFVDYlFMCNZQUpgQdCiqdTPNtLWXtzmbgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cudAv+if1c6MVTNiAylBVjVdX6KXekIjAqMBQugllZ7ZD1C7WPG0uxWOFK4p9O2Eq0MucpU0/95IztefhnswujT50M/60604OCmqYAWPAwbb9mAo+ctDnP/d+SFXnXPSXkhIVWIjB6Tika6yaeGmhEfVriwwG3WeQ0sBcMPb0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyoGlVRJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyoGlVRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6doVMe7e1Q7JlWfRBYUrZgsyQrjHY+nvl3g1E7JrqM=;
	b=iyoGlVRJhZmyP2IQV+jfSku8NyzfZgYn3q4RLWNKSJ6lWkU44M9OeuT3t/ObyHWvTMsnD/
	O0VENpBcX4uRAZwc2E0ZYeRFS01VwZGOrZgZOnF7qfOorqvaHX/P5TcjjiN3HK3VMG13cP
	PefzAVFbUJ2Y4etkOJx7NpMyPwy2mdE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-t31tBrUOMdCLX6G2jRVeoQ-1; Tue,
 02 Jun 2026 23:22:34 -0400
X-MC-Unique: t31tBrUOMdCLX6G2jRVeoQ-1
X-Mimecast-MFC-AGG-ID: t31tBrUOMdCLX6G2jRVeoQ_1780456953
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F38741801238;
	Wed,  3 Jun 2026 03:22:32 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2724F3000233;
	Wed,  3 Jun 2026 03:22:29 +0000 (UTC)
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
Subject: [PATCH v3 06/16] qapi/docs: fix comment phrasing
Date: Tue,  2 Jun 2026 23:21:51 -0400
Message-ID: <20260603032201.993015-7-jsnow@redhat.com>
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

Plaintext sections can be one or more paragraphs, the original comment
was a mistake.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index da4756a7424..d8068bb1bf6 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -631,7 +631,7 @@ def get_doc(self) -> 'QAPIDoc':
                     line = self.get_doc_indented(doc)
                     no_more_args = True
                 else:
-                    # plain paragraph
+                    # plain paragraph(s)
                     doc.ensure_untagged_section(self.info)
                     doc.append_line(line)
                     line = self.get_doc_paragraph(doc)
-- 
2.54.0

