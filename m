Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A837E5F6
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773446; cv=none; b=ntitmM9QT9dOdKAycAHCwP6sOBuYxjgKW1Dl7SpGvpghBo2qJRXWK9FjB+Wx6w7GWtZNrEEg8kpYys+Dojde5UTmstZ6+kzn/wDBJFg5msI3VVET+mi+IOGvUoNWP6pfC6pQlfJfUDI/J5p9R08N08TklRzbcRrOj4NaeobDS2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773446; c=relaxed/simple;
	bh=SHvKt/iwCHs40hkH7EY6waUBZi4y7wo12zLJaw4loxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMcWhKKS+umYPaZ4ts0z0dr51fihAq2mkEMDyj5qYYw2Xdz9XFMrgs+YkrZi7tFVY/V6S5JuB++l9Kd1Jqect/essO8gHBDUTau4zd73KzaWMsQYmg2R0Z72qxH8IKOWCV7slcm9jlasRi9l4xUxI5wv7XENiDc2AESWAuaMefI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KkLNM93S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KkLNM93S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787773423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld5g/j6L0lxSwaRZjY3pcA3TM2VpEohq25svIVL3ldM=;
	b=KkLNM93S+sezyOLPimpMydJRiIbZBaZ16S8M9B2aqLGWswV6L95mEQEqhG02KNfLtZTf4q
	RjCcGNydC5KaB6jwEYnOKYpkDWRgKum3CuJABkH6eyh5r5nkm0TU9MnAIcU6wkq/1uYegX
	FHB7PkE5OIMDLlrrxCTi6HD0e8UyIbE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-oni9NediNoyC1PBuDg5K0g-1; Wed,
 26 Aug 2026 15:43:37 -0400
X-MC-Unique: oni9NediNoyC1PBuDg5K0g-1
X-Mimecast-MFC-AGG-ID: oni9NediNoyC1PBuDg5K0g_1787773413
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D474D184BA96;
	Wed, 26 Aug 2026 19:43:32 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 460DE1800577;
	Wed, 26 Aug 2026 19:43:27 +0000 (UTC)
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
Subject: [PATCH v3 34/43] qapi: convert trivial intro sections for cxl.json
Date: Wed, 26 Aug 2026 15:38:31 -0400
Message-ID: <20260826193840.2152000-35-jsnow@redhat.com>
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
 qapi/cxl.json | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/qapi/cxl.json b/qapi/cxl.json
index 81d6198ba03..aef849a4c2a 100644
--- a/qapi/cxl.json
+++ b/qapi/cxl.json
@@ -365,8 +365,7 @@
 
 ##
 # @CXLUncorErrorRecord:
-#
-# Record of a single error including header log.
+#     Record of a single error including header log.
 #
 # @type: Type of error
 #
@@ -399,8 +398,7 @@
 
 ##
 # @CxlCorErrorType:
-#
-# Type of CXL correctable error to inject
+#     Type of CXL correctable error to inject
 #
 # @cache-data-ecc: Data ECC error on CXL.cache
 #
-- 
2.55.0

