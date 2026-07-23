Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A476738F951
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782231; cv=none; b=ic0nm1LSOAdoA8JbaSQawMg1RZ2jTjplthPxJemcFU3sJvWDMoMz+/5MVeH2UTIR4Lw9Zbc3EUfhkLnltM7/sUhgnvdcF94wBJemBDgVwZwu9gBGeJuwDxvIvjnwRBYJmdfKIgMP6/yhr3qdp4fmKVfPp55BIwhytZ7qqWFR5Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782231; c=relaxed/simple;
	bh=KhMOXazkaptH5/h9BjCGliPFo3XCNvuipDmaQ4iQKjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsAUaDWbECf/hhLXPdLqR0P23DM1CBD+rk+br+7lNJTretdWqck3Fxr6ViZbbV+nzh7tsHjRMRl6tN/qf0TweKa0aCJ85F33WCkVZJ13y1tWAKdMHLO7rzZW2QwP5NHkYG7oCRi2rDPWUPmKRG2QCC/auUvADSit75DIinwPtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CPqgJ3Nd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CPqgJ3Nd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784782214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/m9oOcbWUoOnQCUdpT8YuW9QMaUcjKrgB4Bi5ODd0yI=;
	b=CPqgJ3NdalW3tcpX8f9sm+btYqMTvVt2N91eG6rHWRYAQQ1QfIBCoOrqZYMjiC4NzUKJ8G
	9ao1MCRp4+7NN9ihX7kC2/S0cPXUzYWckzXkx4edpWfHZfF4kFKAb5L0yYHzO3Nq2AiU6W
	5dFs7d/glcNkzAu2sCkDRz+ZJn5Dx5A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-378-UXDzHo2gP9SY12M-UaSCgA-1; Thu,
 23 Jul 2026 00:50:08 -0400
X-MC-Unique: UXDzHo2gP9SY12M-UaSCgA-1
X-Mimecast-MFC-AGG-ID: UXDzHo2gP9SY12M-UaSCgA_1784782205
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 710CE1955E92;
	Thu, 23 Jul 2026 04:50:05 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85D01180059C;
	Thu, 23 Jul 2026 04:49:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Lukas Straub <lukasstraub2@web.de>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhao Liu <zhao1.liu@intel.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Markus Armbruster <armbru@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Alex Williamson <alex@shazbot.org>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	linux-cxl@vger.kernel.org,
	Jiri Pirko <jiri@resnulli.us>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fabiano Rosas <farosas@suse.de>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Igor Mammedov <imammedo@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	qemu-trivial@nongnu.org,
	Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 11/44] qapi: convert intro sections for accelerator.json
Date: Thu, 23 Jul 2026 00:47:32 -0400
Message-ID: <20260723044805.527643-12-jsnow@redhat.com>
In-Reply-To: <20260723044805.527643-1-jsnow@redhat.com>
References: <20260723044805.527643-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

(Trivial)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/accelerator.json | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/qapi/accelerator.json b/qapi/accelerator.json
index b59df378664..efc0fa81418 100644
--- a/qapi/accelerator.json
+++ b/qapi/accelerator.json
@@ -13,8 +13,7 @@
 
 ##
 # @KvmInfo:
-#
-# Information about support for KVM acceleration
+#     Information about support for KVM acceleration
 #
 # @enabled: true if KVM acceleration is active
 #
@@ -26,8 +25,7 @@
 
 ##
 # @query-kvm:
-#
-# Return information about KVM acceleration
+#     Return information about KVM acceleration
 #
 # Features:
 #
@@ -46,8 +44,7 @@
 
 ##
 # @x-accel-stats:
-#
-# Query accelerator statistics
+#     Query accelerator statistics
 #
 # Features:
 #
@@ -63,8 +60,7 @@
 
 ##
 # @Accelerator:
-#
-# Information about support for MSHV acceleration
+#     Information about support for MSHV acceleration
 #
 # @hvf: Apple Hypervisor.framework
 #
@@ -88,8 +84,7 @@
 
 ##
 # @AcceleratorInfo:
-#
-# Information about support for various accelerators
+#     Information about support for various accelerators
 #
 # @enabled: the accelerator that is in use
 #
@@ -102,8 +97,7 @@
 
 ##
 # @query-accelerators:
-#
-# Return information about accelerators
+#     Return information about accelerators
 #
 # Returns: @AcceleratorInfo
 #
-- 
2.55.0

