Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DF3C9ED6
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769050; cv=none; b=XsrZe3swVebnhVyDLEfDiz+dfaQPMF/4sk1zt0nUMQGcd+3RjQpFDCMPa8/TFY/x68nF9kCmO5yyk/bVWMp/QKnqkbwqRk+vdcK1Al2bGQvwTczSNPiu+oD1ie8Xrs7Vh0BpUP7nSTkO09UspVxmbM1Gb8AkaZhPWLelEUvL/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769050; c=relaxed/simple;
	bh=4tSJryCgC4g9cMm4FUKB8h8zGXAYC4OtgcyH9xgosUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvKAN4+cN3z4QQn48RQz9pAl+0G3DlTnafJJlOCo2ih6Gqv0d/Ig5UqIs9yXgbE0o45MwL73Q1FdGgIcA6a7H18n0NcKDl6vqdH1g0h6NHwjLpvGWfIAQtrQ4Ja6vc+1RC8lzGzZzmFtNuqo88vJxljnYkwz6tlhGhcZa4AeJHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCWMrCVk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCWMrCVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0/UQU46W2hvgmNLSWNCBvTQ9oWZFd9tSIYPkcUj78k=;
	b=CCWMrCVkOhA8eFNFb2lD1T79C5dEC6ouqVGvhPE3ebo/ilHpI9o5zOP4vrr+tZuTjRj2xL
	dWIaolv/jC2wDVNPEfn3/0hYyTYHmrkJea54JMVHsRVaGsRRJU8uVEqmGMNqbG85IN9KtA
	9taIWOAWVWOoUdLe7UxhiO7fgDWUJP8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-NZeftUPHNH6lFU_-yNAtAQ-1; Mon,
 29 Jun 2026 17:37:25 -0400
X-MC-Unique: NZeftUPHNH6lFU_-yNAtAQ-1
X-Mimecast-MFC-AGG-ID: NZeftUPHNH6lFU_-yNAtAQ_1782769043
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8474D18052D1;
	Mon, 29 Jun 2026 21:37:23 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1D6441956096;
	Mon, 29 Jun 2026 21:37:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org,
	Markus Armbruster <armbru@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH 09/14] qapi: convert intro sections for cryptodev.json
Date: Mon, 29 Jun 2026 17:36:19 -0400
Message-ID: <20260629213624.936258-10-jsnow@redhat.com>
In-Reply-To: <20260629213624.936258-1-jsnow@redhat.com>
References: <20260629213624.936258-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/cryptodev.json | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/qapi/cryptodev.json b/qapi/cryptodev.json
index eb309c22f86..d0c1e6c8944 100644
--- a/qapi/cryptodev.json
+++ b/qapi/cryptodev.json
@@ -12,8 +12,7 @@
 
 ##
 # @QCryptodevBackendAlgoType:
-#
-# The supported algorithm types of a crypto device.
+#     The supported algorithm types of a crypto device.
 #
 # @sym: symmetric encryption
 #
@@ -26,8 +25,7 @@
 
 ##
 # @QCryptodevBackendServiceType:
-#
-# The supported service types of a crypto device.
+#     The supported service types of a crypto device.
 #
 # @cipher: Symmetric Key Cipher service
 #
@@ -46,8 +44,7 @@
 
 ##
 # @QCryptodevBackendType:
-#
-# The crypto device backend type
+#     The crypto device backend type
 #
 # @builtin: the QEMU builtin support
 #
@@ -62,8 +59,7 @@
 
 ##
 # @QCryptodevBackendClient:
-#
-# Information about a queue of crypto device.
+#     Information about a queue of crypto device.
 #
 # @queue: the queue index of the crypto device
 #
@@ -77,8 +73,7 @@
 
 ##
 # @QCryptodevInfo:
-#
-# Information about a crypto device.
+#     Information about a crypto device.
 #
 # @id: the id of the crypto device
 #
@@ -95,8 +90,7 @@
 
 ##
 # @query-cryptodev:
-#
-# Return information about current crypto devices.
+#     Return information about current crypto devices.
 #
 # Since: 8.0
 ##
-- 
2.54.0

