Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65185386C12
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 04:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782160; cv=none; b=gzvr+usWN5Y+v08pwJto+IK13OGHbtKM/MJd41mAqrKZlIMK50b3cSl27v14QjCoi2NMnVlZsqRFSuoKVe2LtzENZ0efApHtTw6jCRQh9PJbtA/NdDao3nKexrzqcHXrzwlm+ua+wZpNmuoKYAa//mJ+wTMJr7J44wgGo81GYTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782160; c=relaxed/simple;
	bh=yIS5Q9ipsL3Axb+naalhxpGiIo1fXIPDAwq0GOjCaSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbebR9SRgSJnBaOjCXI5Bvm6SJY2NCR+suZfv1Tvu4aThXlj90dBelIvpGrNFzTEH3bH6Mc/R3+20y5O8ITZP+a8GnNocgZF9rWT2UmNx0RNz5JTlDshN+1u0jJs7UkNkei8IGcr4EptZ2s49HQyt810lLnWg5QATRFAn7Zrrho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KJvCp9Re; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KJvCp9Re"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784782147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o+bQR//T6yQ1PPsE5y6DgGjYaFx3qqyzrYEDUIB8MPE=;
	b=KJvCp9ReWJE3CKkqgdGJaGohG7Wbf2jSSRGkPdng6Gsc2uyy7Ey5tig2WgQNTvrlbAbhya
	w1KiMcfbQ6lWY3nXiOVaxcanPbvo0JKkYDUgcox/7T1GeYPqdb5jJwYUs/KZysKrtnGF8F
	jBr4u/oFu6Cnpcl7TnKAEUF2O6+hVpA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-100-eQm3yPQvNnmtw7CwDzAuJA-1; Thu,
 23 Jul 2026 00:49:02 -0400
X-MC-Unique: eQm3yPQvNnmtw7CwDzAuJA-1
X-Mimecast-MFC-AGG-ID: eQm3yPQvNnmtw7CwDzAuJA_1784782140
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA336182E6BA;
	Thu, 23 Jul 2026 04:48:58 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA0BD18002B4;
	Thu, 23 Jul 2026 04:48:49 +0000 (UTC)
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
Subject: [PATCH v2 04/44] qapi: convert intro sections for uefi.json
Date: Thu, 23 Jul 2026 00:47:25 -0400
Message-ID: <20260723044805.527643-5-jsnow@redhat.com>
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
 qapi/uefi.json | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/qapi/uefi.json b/qapi/uefi.json
index 86f33b234ba..cb2b5e1f531 100644
--- a/qapi/uefi.json
+++ b/qapi/uefi.json
@@ -17,9 +17,8 @@
 
 ##
 # @UefiVariable:
-#
-# UEFI Variable.  Check the UEFI specification for more detailed
-# information on the fields.
+#     UEFI Variable.  Check the UEFI specification for more detailed
+#     information on the fields.
 #
 # @guid: variable namespace GUID
 #
-- 
2.55.0

