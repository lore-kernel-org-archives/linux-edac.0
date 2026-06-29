Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C760238889B
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769013; cv=none; b=NjR1FYX4WLO9Xw33PeQMSeCkc5jjXBYJjbbKUXttQbVqtFWtq06GyJtDDxMtIeEyUwGXQW7jqFvANEIs5Pbm6tPkSrw70S3igkDf9P6mjrq+kGlqXfDymmwvDb5OIMOBpSU4Afw6IIM+/Y7YqDj18xDhHwkx7fDbCDWFaXONhdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769013; c=relaxed/simple;
	bh=9i/EqfQCNRVF+ZSiOwc2MVc64rrCtxQx9bbJp3g7cCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMdBbaiKK4QO/naljTzrdqFnAEjMev0MPUy3lwsZwqPX9COJmPdYO/Cxn6gCttnaohd6dseQg9UlS/SS8GyfMC/tsKsqmfYV7gv3z6fx3bm5DR3F26QXgM1yHiA2No1alxGS1BeS5QkDHlihywKMJh1jcFb4IICAYBtTmZ5Enx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWqOBma/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWqOBma/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VM1rLFGjColtnWu6GvZAwBXS6W0rnnyuFBdpHvgA9sQ=;
	b=BWqOBma/lADB1/E8/vnSTO47GpY2nf8BAlNXW7wbcWVOa9ttKYKfq/MhbPx6fTaqrHKM2S
	ahhH6iOEIeFJ9/rwIPikaOUuOU/9tYfjkyV+soQpe8zdWAH42ydlAb2ywTwUfSUcx2WQgK
	jCYbONC3hBVqmvoO0SMAOV/q7DoKBjE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-98Hb8cS7Ms6eV3jrZkBflg-1; Mon,
 29 Jun 2026 17:36:48 -0400
X-MC-Unique: 98Hb8cS7Ms6eV3jrZkBflg-1
X-Mimecast-MFC-AGG-ID: 98Hb8cS7Ms6eV3jrZkBflg_1782769006
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B50C1979042;
	Mon, 29 Jun 2026 21:36:46 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6BABE1956096;
	Mon, 29 Jun 2026 21:36:40 +0000 (UTC)
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
Subject: [PATCH 02/14] qapi: convert intro sections for acpi-hest.json
Date: Mon, 29 Jun 2026 17:36:12 -0400
Message-ID: <20260629213624.936258-3-jsnow@redhat.com>
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
 qapi/acpi-hest.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/acpi-hest.json b/qapi/acpi-hest.json
index a01f1dee095..8db804df197 100644
--- a/qapi/acpi-hest.json
+++ b/qapi/acpi-hest.json
@@ -13,8 +13,8 @@
 
 ##
 # @inject-ghes-v2-error:
-#
-# Inject an error with additional ACPI 6.1 GHESv2 error information
+#     Inject an error with additional ACPI 6.1 GHESv2 error
+#     information
 #
 # @cper: contains a base64 encoded string with raw data for a single
 #     CPER record with Generic Error Status Block, Generic Error Data
-- 
2.54.0

