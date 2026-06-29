Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D777D3C9EFB
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769045; cv=none; b=Znlmxx8lvdp4BcH9Pe4PoCGKW0URaipUibtsSEGdAkTBI8pKOTdWYWkYvtqh8ENBt7iIXa6/JrAa+9qXV6vlfI4xDenvxtKwQdWwr2fgkMvCYhF8kb0BMBbKurt7014HXvCyTLYEAVpC9M1Cef7Tg1Eg027I1ZAjlfAUz/sIVD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769045; c=relaxed/simple;
	bh=RoF2Us7LhFOGkAnR2mWq+1SZAFch87908r/DV+lLeRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MlmeaNkYhN+OyAzSQJr6DK9aegQ9/F9Iei2p8Rj5Z2WSgFNLdYi0rwE5xKiYMit7w8NqltXSF30EZxDP7FUr0ik4vQjlfq7iphF1utTFZZNVn3H5FuLTYPFJL5ZApvclSSJFTr+Wgh+dFZWs7vKTvwNNheAyEpbJnphEuE3ucu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SaEafJRR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SaEafJRR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXeXshimwAxrn9+eaWCq3jzOzOCoeduWsu291snjukk=;
	b=SaEafJRR+C+scpAirh6cWKZx0nAn79J8muEvYc+JY5M8HM+vw+bUjZ5iguoqU0AgT7/68D
	HGgr154kbqhdJRRpkBGrJlP7pzNsfRPrXT4G0BBurqcQKJuAQf9H3OmTnQiQTkrAuQKdP8
	UIE0lv0yJXCIsT7F0neTaa8vaw5hH+E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582--TBkmm3hO66x73XOMYFGsw-1; Mon,
 29 Jun 2026 17:37:19 -0400
X-MC-Unique: -TBkmm3hO66x73XOMYFGsw-1
X-Mimecast-MFC-AGG-ID: -TBkmm3hO66x73XOMYFGsw_1782769038
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB2B619344BD;
	Mon, 29 Jun 2026 21:37:17 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 430F21956096;
	Mon, 29 Jun 2026 21:37:12 +0000 (UTC)
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
Subject: [PATCH 08/14] qapi: convert intro sections for misc-arm.json
Date: Mon, 29 Jun 2026 17:36:18 -0400
Message-ID: <20260629213624.936258-9-jsnow@redhat.com>
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
 qapi/misc-arm.json | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/qapi/misc-arm.json b/qapi/misc-arm.json
index 4dc66d00e5c..64059b5688d 100644
--- a/qapi/misc-arm.json
+++ b/qapi/misc-arm.json
@@ -5,11 +5,10 @@
 
 ##
 # @GICCapability:
-#
-# The struct describes capability for a specific GIC (Generic
-# Interrupt Controller) version.  These bits are not only decided by
-# QEMU/KVM software version, but also decided by the hardware that the
-# program is running upon.
+#     The struct describes capability for a specific GIC (Generic
+#     Interrupt Controller) version.  These bits are not only decided
+#     by QEMU/KVM software version, but also decided by the hardware
+#     that the program is running upon.
 #
 # @version: version of GIC to be described.  Currently, only 2 and 3
 #     are supported.
@@ -29,12 +28,11 @@
 
 ##
 # @query-gic-capabilities:
+#     It will return a list of `GICCapability` objects that describe
+#     its capability bits.
 #
-# It will return a list of `GICCapability` objects that describe its
-# capability bits.
-#
-# On non-ARM targets this command will report an error as the GIC
-# technology is not applicable.
+#     On non-ARM targets this command will report an error as the GIC
+#     technology is not applicable.
 #
 # Since: 2.6
 #
@@ -48,8 +46,7 @@
 
 ##
 # @SsidSizeMode:
-#
-# SMMUv3 SubstreamID size configuration mode.
+#     SMMUv3 SubstreamID size configuration mode.
 #
 # @auto: derive from host IOMMU capabilities
 #
@@ -64,8 +61,7 @@
 
 ##
 # @OasMode:
-#
-# SMMUv3 Output Address Size configuration mode.
+#     SMMUv3 Output Address Size configuration mode.
 #
 # @auto: derive from host IOMMU capabilities
 #
-- 
2.54.0

