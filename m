Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE663515F7
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 04:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782302; cv=none; b=RKFdFpnkYVH7RmCv5uzQ6EMjm3/bAOoq1Fo4Of2UuQ24q0qVfQescZOJBCL8Uf8h/spraXRCyARXuvZaNuBr4RHelcJM55t1tn13KmvWpmhbR3nojp1U+cx/k1FpShFbjv0n8qZZO0cbpluwqrZK8HBZKFK6l3thsenCDmXRS+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782302; c=relaxed/simple;
	bh=lml0sCwBNAe9/7CrXv9IEgiy9hZcb7xT94hK1k7jyA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ixhfgu0/79kGaEjqeC+FqEESpqeWloBg5hD2uUI9Lt+w8d6/+rEtikjI2L2WlVvWhrCTqLpJFRAWFR07BN/vEX2Lw5SIXqXf5F8TLLjWemYvlzRM+6Z9eMj3uCdUqceuzwIjF1M5ZLoYGt8JfWT7WGuEpS/GTSwSCN+b0QQlwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQlyK9lQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQlyK9lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784782287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uK3gVanDkZsjvvgE0Rg1w4gDzuwAaXDx8DZDiRphsfQ=;
	b=RQlyK9lQw4tcH1pXkkKG6sqpSX526UYpgVUFKeoFcp62BNz+BpbHA2jecgdQYktV3lrXiV
	MEAA5JVzb+JlTMr2U4KwRseo7B9nrfbzlEgbusPs7jP9TacXu8rTKmwkm7qBUNgcZDvBiA
	K7B7rvxdWjiStn8HLi7uYr0Tl4Gi03k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-1zGTlrKaO5G6JF2UIT2urw-1; Thu,
 23 Jul 2026 00:51:22 -0400
X-MC-Unique: 1zGTlrKaO5G6JF2UIT2urw-1
X-Mimecast-MFC-AGG-ID: 1zGTlrKaO5G6JF2UIT2urw_1784782279
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A3101954B26;
	Thu, 23 Jul 2026 04:51:19 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5531018002AE;
	Thu, 23 Jul 2026 04:51:09 +0000 (UTC)
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
Subject: [PATCH v2 18/44] qapi: convert trivial intro sections for qdev.json
Date: Thu, 23 Jul 2026 00:47:39 -0400
Message-ID: <20260723044805.527643-19-jsnow@redhat.com>
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
 qapi/qdev.json | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 974cf9c5830..a35321d2fd1 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -14,8 +14,7 @@
 
 ##
 # @device-list-properties:
-#
-# List properties associated with a device.
+#     List properties associated with a device.
 #
 # @typename: the type name of a device
 #
@@ -33,8 +32,7 @@
 
 ##
 # @device_add:
-#
-# Add a device.
+#     Add a device.
 #
 # @driver: the name of the new device's driver
 #
@@ -85,8 +83,7 @@
 
 ##
 # @device_del:
-#
-# Remove a device from a guest
+#     Remove a device from a guest
 #
 # @id: the device's ID or QOM path
 #
@@ -121,11 +118,10 @@
 
 ##
 # @DEVICE_DELETED:
-#
-# Emitted whenever the device removal completion is acknowledged by
-# the guest.  At this point, it's safe to reuse the specified device
-# ID.  Device removal can be initiated by the guest or by HMP/QMP
-# commands.
+#     Emitted whenever the device removal completion is acknowledged
+#     by the guest.  At this point, it's safe to reuse the specified
+#     device ID.  Device removal can be initiated by the guest or by
+#     HMP/QMP commands.
 #
 # @device: the device's ID if it has one
 #
@@ -145,9 +141,8 @@
 
 ##
 # @DEVICE_UNPLUG_GUEST_ERROR:
-#
-# Emitted when a device hot unplug fails due to a guest reported
-# error.
+#     Emitted when a device hot unplug fails due to a guest reported
+#     error.
 #
 # @device: the device's ID if it has one
 #
-- 
2.55.0

