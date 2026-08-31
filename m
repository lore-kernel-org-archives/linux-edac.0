Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC138AC72
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207694; cv=none; b=pb3RSE7dzw6EianyzuRcM7lMFZ90rNwJPxtN4WMk2twzNIr4pz6gGde+PrYDFL26CzHeT8t+PhplUMpHbjr1nrFtNvRYJrp3uidawz/adaFOJuZg1m+Xz2nLNhn6+Lkwf8fJfLhXoljJlqjSmFwHj+xLiDDvyTM6err1iOYkhA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207694; c=relaxed/simple;
	bh=p0TWmw8FzLY6pfGK1/inwsHz9y3rTz5Ged2cym+09pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/V/9bTDatTm+sprWfMID9IE9NH8sV1oDzsHhVHcqRHfNR2IuuNywF+KU92WOl9wxJDJbGUy6hJ16uAJWAL6i/bCOOpZjE9IHiA+bMbvsfpg9mMhYgoO6LYKi/hnCXrztNKmv0s7fkXEqe+3YlkuPMreAq85atBhea3GDl8dGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VZeuryxq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VZeuryxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788207692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSlSwxOgzm2zCxGI4LaQEBpjOYn5iLa1KBJ6Ly1YGHg=;
	b=VZeuryxqQxZKlk7X9AzUwrKUqib6c9CYiMb3lK/xT8CGU1E4ddcoyIA11QgB1xSjWqwgVK
	W3sLyIkzz0MQ/9ZVn/MnVGxaaS7FhfRFeUJc7GKFaezkjJuF3oVPbkog2JCpGbF0e7QGYN
	rwKPMi77e4XBHcFQK7Qs1esyFLOW4ow=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-553q7kN-OT-Mt6wlYOusMQ-1; Mon,
 31 Aug 2026 16:21:24 -0400
X-MC-Unique: 553q7kN-OT-Mt6wlYOusMQ-1
X-Mimecast-MFC-AGG-ID: 553q7kN-OT-Mt6wlYOusMQ_1788207677
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71EFC1896E0E;
	Mon, 31 Aug 2026 20:21:08 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4400F1800347;
	Mon, 31 Aug 2026 20:20:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Lukas Straub <lukasstraub2@web.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	Jonathan Cameron <jic23@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jiri Pirko <jiri@resnulli.us>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	qemu-block@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	linux-cxl@vger.kernel.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Alex Williamson <alex@shazbot.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	linux-edac@vger.kernel.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	John Snow <jsnow@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Eric Blake <eblake@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	qemu-trivial@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 07/43] qapi: convert trivial intro sections for misc-arm.json
Date: Mon, 31 Aug 2026 16:19:09 -0400
Message-ID: <20260831201945.287730-8-jsnow@redhat.com>
In-Reply-To: <20260831201945.287730-1-jsnow@redhat.com>
References: <20260831201945.287730-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/misc-arm.json | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/qapi/misc-arm.json b/qapi/misc-arm.json
index 4dc66d00e5c..a7b5498d2d3 100644
--- a/qapi/misc-arm.json
+++ b/qapi/misc-arm.json
@@ -48,8 +48,7 @@
 
 ##
 # @SsidSizeMode:
-#
-# SMMUv3 SubstreamID size configuration mode.
+#     SMMUv3 SubstreamID size configuration mode.
 #
 # @auto: derive from host IOMMU capabilities
 #
@@ -64,8 +63,7 @@
 
 ##
 # @OasMode:
-#
-# SMMUv3 Output Address Size configuration mode.
+#     SMMUv3 Output Address Size configuration mode.
 #
 # @auto: derive from host IOMMU capabilities
 #
-- 
2.55.0

