Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061813909AB
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207797; cv=none; b=KLbhb5CuyXWXD0cYs/o4HVnatS6XDb5lQmWmilRz9zQIF+e7JjM7TM34wLC91CGigLN/zcgHyx+QbVECdIlUlwSalVzXHwYbq+K4q5D5l6l5wtl+lb/F08JNvyM5IX/7HjoLv3RqEgE/fk8VpxhGQrXUUd/r+kZpF9yyWn41LhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207797; c=relaxed/simple;
	bh=wShGT2SUxlRrKOXzNLi5XL/cGg0rEqr4cCljqe7mcUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBrd9R4HuoW8sn0+VUWHaHO0BbYzGrLlrXt5nXYUW3zctvkvrxmwnsahKgxsgFMrW0OXdoh8MsluTsfoUuZa/LAUDh5UQIKQ7NWyeJhzSufYWS6IQ7D4NeMq8iorhjAM9iSxBAhf5gkvAbX+MC2YDUshN6RHMW411Yg+Y1UqXv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ersBQAZD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ersBQAZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788207793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUbeK+L1hQxvyWPr/IkVmjVqdE8Y4kF2825fESMfeOk=;
	b=ersBQAZD0wwcCTnsQBux3yrs6ZzM1fPS1YQ8SRcAte/ieC0zdATvQ7FmCpUPrrymPNvJ/K
	sHncXwh7PiMPEi6YPDCvPQgqk8obJDfs64gUkdIsSR5YGeUCzdtNMa9pC13MMKZr5W8ywX
	JMv/tzYXHk3tcgXsDBTLI8z9KITfz/I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-f5u4uEFvNSyYwOmZwu5hog-1; Mon,
 31 Aug 2026 16:23:10 -0400
X-MC-Unique: f5u4uEFvNSyYwOmZwu5hog-1
X-Mimecast-MFC-AGG-ID: f5u4uEFvNSyYwOmZwu5hog_1788207787
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 261511860657;
	Mon, 31 Aug 2026 20:22:26 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D691E1800347;
	Mon, 31 Aug 2026 20:22:17 +0000 (UTC)
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
Subject: [PATCH v4 14/43] qapi: convert trivial intro sections for machine-s390x.json
Date: Mon, 31 Aug 2026 16:19:16 -0400
Message-ID: <20260831201945.287730-15-jsnow@redhat.com>
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
 qapi/machine-s390x.json | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/qapi/machine-s390x.json b/qapi/machine-s390x.json
index f79864f417b..a83a258d6ce 100644
--- a/qapi/machine-s390x.json
+++ b/qapi/machine-s390x.json
@@ -9,9 +9,8 @@
 
 ##
 # @S390CpuPolarization:
-#
-# An enumeration of CPU polarization that can be assumed by a virtual
-# S390 CPU
+#     An enumeration of CPU polarization that can be assumed by a
+#     virtual S390 CPU
 #
 # Since: 8.2
 ##
@@ -94,8 +93,7 @@
 
 ##
 # @CpuPolarizationInfo:
-#
-# The result of a CPU polarization query.
+#     The result of a CPU polarization query.
 #
 # @polarization: the CPU polarization
 #
@@ -122,9 +120,8 @@
 
 ##
 # @SCLP_CPI_INFO_AVAILABLE:
-#
-# Emitted when the Control-Program Identification data is available in
-# the QOM tree.
+#     Emitted when the Control-Program Identification data is
+#     available in the QOM tree.
 #
 # Features:
 #
-- 
2.55.0

