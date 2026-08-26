Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDDF463B6D
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773221; cv=none; b=WL8rQVT3LD0l5JekgjcxWyaZE5ym6IV/PxrqIYTLUN81l2DWByGVm5Pj1ysvIBaLLXvxE+vfVJkSMi0amyrZgSm6bvY638z+sLKP+5t7Eb+Mwawk0186k7QOT75TndJLNbP1DY3sR+tk9BSVvHAK0SU2SHsmlevE9CkpoNqnvoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773221; c=relaxed/simple;
	bh=p0TWmw8FzLY6pfGK1/inwsHz9y3rTz5Ged2cym+09pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5U+q/+JARNNqzsWBaDnvjqP5Oq3tKnKIuz/+x7JVb5dJCj3Kn8+i/q3ZVSsjGPwNS+WP7AKaq2lMpHoBELd6uQszE+IyWoOGdlsZ2k4QNgxMxwOqy/etHmKW7XC6BMdhizHQ5FhAV6kU0NjDiWvsRAAleMZW4jhS8UnGh0mp8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G8AMW5Ms; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G8AMW5Ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787773208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zSlSwxOgzm2zCxGI4LaQEBpjOYn5iLa1KBJ6Ly1YGHg=;
	b=G8AMW5MstMTx6KzRmCPG+7NsxmEZCSJlu7J9sk0YAxQzsEqwCQ6Bg51nX0Vum8seBwy76S
	Ux4yR/tleNyVEENE/ngDse+ogQ8tabsNSxNxKIPhexd+fczk3WpIz+nUzbqGrOyilsEIuG
	bPuGnfTJ5RIir5xHVsp+45Hs9ohL5cQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-380-ak1Emq0rNNm-6UjBrH0swg-1; Wed,
 26 Aug 2026 15:40:04 -0400
X-MC-Unique: ak1Emq0rNNm-6UjBrH0swg-1
X-Mimecast-MFC-AGG-ID: ak1Emq0rNNm-6UjBrH0swg_1787773201
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D43E19539B9;
	Wed, 26 Aug 2026 19:40:01 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF0E118005AC;
	Wed, 26 Aug 2026 19:39:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex@shazbot.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	linux-cxl@vger.kernel.org,
	Markus Armbruster <armbru@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Peter Xu <peterx@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	qemu-trivial@nongnu.org,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiri Pirko <jiri@resnulli.us>,
	qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	linux-edac@vger.kernel.org,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Lukas Straub <lukasstraub2@web.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v3 07/43] qapi: convert trivial intro sections for misc-arm.json
Date: Wed, 26 Aug 2026 15:38:04 -0400
Message-ID: <20260826193840.2152000-8-jsnow@redhat.com>
In-Reply-To: <20260826193840.2152000-1-jsnow@redhat.com>
References: <20260826193840.2152000-1-jsnow@redhat.com>
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

