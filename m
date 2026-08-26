Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341546A600
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773289; cv=none; b=XU4NzTrh3OBqn8nI8hEU/Zl/c1jK83LFGnoga8Kimc/SickfRizj0b38Dk8Ug4mq2ZXd0tKoQDPRrtskwf1SZweaLToRKZEzPbJmPbyw/oJj1IsQpkAdfZGEmrt/6zFn2jCPQrCMGcUnxRs6bJXfhBlN1XubyjwV0yp5vWIO5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773289; c=relaxed/simple;
	bh=K7WPoxkr3np5GVbsXkFIviL6SGEbvyPxrGdMKOAeiQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoSrU+pxpocxoG4XHKuXjywBLZ76nvrtLV7rFfu2QXgEX2J68BgbcEFLgDeOTLU3zeO3olELAqV6e8VGcl3cZbxkQp/EthR4xvZLT/UJwJqmcTAUyTllmP22PgYr2MfiRedfk6t/mwTVTv8Fru1Tihf0upAP80qzyZO4YcS+1Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2nctmXY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2nctmXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787773280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q7ddRUc8gUI3lDxdCUKNaV59MC9hJW515QAIptbgtpY=;
	b=e2nctmXYBrgkEDopTfQj80Lyq7LJ1E6CSqOaIWqFagaQn6wiR/lRIfCukYitF2fFxPEt3Y
	7lFpOQxT4xQZb/WtxIMraOnVQEUZDNeVWikOzjTPS90823aGAzIvY03VTI9qYqzvoJojoP
	Xf15DzDxjFQWaTUYiQetYXlzNTolOp8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-jDsxlECiNJ-FPbMmQJzOzw-1; Wed,
 26 Aug 2026 15:41:15 -0400
X-MC-Unique: jDsxlECiNJ-FPbMmQJzOzw-1
X-Mimecast-MFC-AGG-ID: jDsxlECiNJ-FPbMmQJzOzw_1787773269
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98FF01955E7E;
	Wed, 26 Aug 2026 19:41:09 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 124DA1800577;
	Wed, 26 Aug 2026 19:41:00 +0000 (UTC)
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
Subject: [PATCH v3 15/43] qapi: convert trivial intro sections for acpi.json
Date: Wed, 26 Aug 2026 15:38:12 -0400
Message-ID: <20260826193840.2152000-16-jsnow@redhat.com>
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
 qapi/acpi.json | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/qapi/acpi.json b/qapi/acpi.json
index 906b3687a55..d2c59df30b2 100644
--- a/qapi/acpi.json
+++ b/qapi/acpi.json
@@ -107,9 +107,8 @@
 
 ##
 # @query-acpi-ospm-status:
-#
-# Return a list of `ACPIOSTInfo` for devices that support status
-# reporting via ACPI _OST method.
+#     Return a list of `ACPIOSTInfo` for devices
+#     that support status reporting via ACPI _OST method.
 #
 # Since: 2.1
 #
@@ -126,8 +125,7 @@
 
 ##
 # @ACPI_DEVICE_OST:
-#
-# Emitted when guest executes ACPI _OST method.
+#     Emitted when guest executes ACPI _OST method.
 #
 # @info: OSPM Status Indication
 #
-- 
2.55.0

