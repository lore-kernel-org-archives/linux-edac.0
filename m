Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4C1B142D
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151860; cv=none; b=iJQzevTZErshsAlSKWDQumowdpaExlFyb2RDXXc0jNqWjE6DCvELTtpW4AP0fOI8XHNhxCS9r04tqrrw4e8bT/vyEYV8zwvmusLAS4FHgFnkDHQn8zSZhLmgCjZJC8lG3HlfaZFVCD9/aI+/qsQAjf2wOO5VHAR9LLhnitXt+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151860; c=relaxed/simple;
	bh=AoRKxq2YqTFVDYlFMCNZQUpgQdCiqdTPNtLWXtzmbgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BhXIgW39fVGZ1+OihnPB/bDhvunvgdOJNauTQHkE6fINHSjSUZmoFOeYo/U0vq8WyTVvq/+RtTzHBjkuOmH+Sq2D6bHwjFa7utF9yHN2Hsf16LDVkGXG+1YyQeL+7dPuSyP2xWQ6gcT7pylnUt+hWjBbKjl+Vy1HwTjrGapkFgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S01l0JH5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S01l0JH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6doVMe7e1Q7JlWfRBYUrZgsyQrjHY+nvl3g1E7JrqM=;
	b=S01l0JH5UpyZNIEPEl2xI8zU44fqMBfaf8i8hApBpISLxw9uKSRo3tRi6zK7mb4xl4f0Y9
	QJtq1OAKKwSH3TlE+p8IyrN6ACP+GB7zd3dJNUfpcYM5NrMFz/pPXj9i4x9+z3Zt5t+QSV
	fO+PwLF+N3YvNh6vWswYTU7AeCLul2o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-377-gTNaeh6BOnCXjJUBc3frnw-1; Thu,
 11 Jun 2026 00:24:14 -0400
X-MC-Unique: gTNaeh6BOnCXjJUBc3frnw-1
X-Mimecast-MFC-AGG-ID: gTNaeh6BOnCXjJUBc3frnw_1781151852
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 79146183076A;
	Thu, 11 Jun 2026 04:24:12 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9434D1800586;
	Thu, 11 Jun 2026 04:24:07 +0000 (UTC)
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
Subject: [PATCH v4 06/13] qapi/docs: fix comment phrasing
Date: Thu, 11 Jun 2026 00:23:25 -0400
Message-ID: <20260611042332.482979-7-jsnow@redhat.com>
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

