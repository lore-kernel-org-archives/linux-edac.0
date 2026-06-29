Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B103C9EE9
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769028; cv=none; b=HqfoE1ORx/6rojwxAsFs4sqed4APc6dsfoYuWp4gXq6ezKgVjTdfR2mJck2c0GUfVh0HUjYHoCoIkh1xQsmV9cf0vy5WYJ4BYdIl1t0SUiblEJYbgSDaWRK2/qliQw/R4AvuNhptwGiruX+vf71AGSpKhIaF7eI+O8vLOjx8brE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769028; c=relaxed/simple;
	bh=zbB6s5xi7CiQAg9ibym+hgUkY281tx4DIseDu4AzOqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdTO35nxZTx8p6832bp/KaCIW0kLf1K+G+wosGjrXz1iFgOIugMqpPG8Ao1xs1veaKrr+OE26eJP4eaEinlI1yHrnSpINXO+FaE5NU4oeiRvu3hNoZpV/fodoTuvUDPSfTZEDR/uRoH0vOI2zLpm62xezc5ZHwEcPpFjTl7h9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=At248gEG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="At248gEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2i1M56psiJC4Y+a4wxdvlazg6AIoI7yl1Qb9xCS6G0=;
	b=At248gEGyoVDOuQOTnkGHxyDu1utwOreaPuFeoayqCi2EWxl5EcJih3b1EhS1aokDHzjG3
	QkcMinWlcJOVkLNbL+6erKd/n9BTvn7XPk+rP26Ji084tGFiXgZgaUIv2e2yQ6Gqx6Rneo
	S1bKyHnjF4t89ec6g5oWGlIdtB3q6v0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558-GtMX6rFcNoWowG9GbFY0aw-1; Mon,
 29 Jun 2026 17:37:02 -0400
X-MC-Unique: GtMX6rFcNoWowG9GbFY0aw-1
X-Mimecast-MFC-AGG-ID: GtMX6rFcNoWowG9GbFY0aw_1782769020
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 329151979064;
	Mon, 29 Jun 2026 21:37:00 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A4D119560AD;
	Mon, 29 Jun 2026 21:36:56 +0000 (UTC)
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
Subject: [PATCH 05/14] qapi: convert intro sections for compat.json
Date: Mon, 29 Jun 2026 17:36:15 -0400
Message-ID: <20260629213624.936258-6-jsnow@redhat.com>
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
 qapi/compat.json | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/qapi/compat.json b/qapi/compat.json
index 90b8d51cf27..b42d142ddcc 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -9,8 +9,7 @@
 
 ##
 # @CompatPolicyInput:
-#
-# Policy for handling "funny" input.
+#     Policy for handling "funny" input.
 #
 # @accept: Accept silently
 #
@@ -25,8 +24,7 @@
 
 ##
 # @CompatPolicyOutput:
-#
-# Policy for handling "funny" output.
+#     Policy for handling "funny" output.
 #
 # @accept: Pass on unchanged
 #
@@ -39,8 +37,7 @@
 
 ##
 # @CompatPolicy:
-#
-# Policy for handling deprecated management interfaces.
+#     Policy for handling deprecated management interfaces.
 #
 # This is intended for testing users of the management interfaces.
 #
-- 
2.54.0

