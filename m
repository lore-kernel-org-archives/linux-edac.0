Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5147CA99
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 19:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773369; cv=none; b=cl5eRy5uWnxRF4VtqD7w1rx6yuXwAzJo0wihNUjdQyLY1tbZrKhZmigO4ATa6WC3+tdAvGzzgpMvE7rjTvIFfiVHj9eOHWN36TUlcAn3XVBEYrTXeyXthu0vHvy+qFoSFMGWTjHAtry+jeQYCH07ns/HhlN8F39ZswGKrpETms4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773369; c=relaxed/simple;
	bh=AKesL3BMOVJNrDh3MhtIMQpZmh3NvItYn1yPilrjlwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vD93FXbKbVE53hwerZ8++SZg7g70QaqXpQC8ymj9DcdYpDHPQmLvMF8sG0AhQ8FiMjGeXge8mbLsXHz4wtA0tWKgpHN8phQ7tRt56PNjwVdIsQqrDZJmRDZSTxGS94A76qgYh2HRKsorUEd56ljoE7eswB8feILlDgGAuSZQQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DsUI3eSL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DsUI3eSL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787773352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FOyryAyUvVmwl4/qZOf0d22k1z8DeAksa2FdV0gP0NE=;
	b=DsUI3eSL5Nm1bWIDXaZVZKIU20af3HJ+qbsUo0QZa6OqlKzOZRSau8fLpNYBaGXAhcxwnQ
	3goOp2ehp+SJACuae8XFZXSstr0UosB3JIFLReiVZK3wCxwpfSnRIXRF3pEe1+3Md36wWJ
	r8HQSz4zSoB2PYEwnOjB37zCDXaJkys=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-FmEnOKF_NjyVsCIZv0KNOA-1; Wed,
 26 Aug 2026 15:42:28 -0400
X-MC-Unique: FmEnOKF_NjyVsCIZv0KNOA-1
X-Mimecast-MFC-AGG-ID: FmEnOKF_NjyVsCIZv0KNOA_1787773344
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B5524184BABD;
	Wed, 26 Aug 2026 19:42:24 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8963F1800577;
	Wed, 26 Aug 2026 19:42:16 +0000 (UTC)
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
Subject: [PATCH v3 24/43] qapi: convert trivial intro sections for job.json
Date: Wed, 26 Aug 2026 15:38:21 -0400
Message-ID: <20260826193840.2152000-25-jsnow@redhat.com>
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
 qapi/job.json | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/qapi/job.json b/qapi/job.json
index 31618e6ebcc..b68d7292423 100644
--- a/qapi/job.json
+++ b/qapi/job.json
@@ -9,8 +9,7 @@
 
 ##
 # @JobType:
-#
-# Type of a background job.
+#     Type of a background job.
 #
 # @commit: block commit job type, see `block-commit`
 #
@@ -42,8 +41,7 @@
 
 ##
 # @JobStatus:
-#
-# Indicates the present state of a given job in its lifetime.
+#     Indicates the present state of a given job in its lifetime.
 #
 # @undefined: Erroneous, default state.  Should not ever be visible.
 #
@@ -90,8 +88,7 @@
 
 ##
 # @JobVerb:
-#
-# Represents command verbs that can be applied to a job.
+#     Represents command verbs that can be applied to a job.
 #
 # @cancel: see `job-cancel`
 #
@@ -117,8 +114,7 @@
 
 ##
 # @JOB_STATUS_CHANGE:
-#
-# Emitted when a job transitions to a different status.
+#     Emitted when a job transitions to a different status.
 #
 # @id: The job identifier
 #
@@ -259,8 +255,7 @@
 
 ##
 # @JobInfo:
-#
-# Information about a job.
+#     Information about a job.
 #
 # @id: The job identifier
 #
@@ -294,8 +289,7 @@
 
 ##
 # @query-jobs:
-#
-# Return information about jobs.
+#     Return information about jobs.
 #
 # Returns: a list with info for each active job
 #
-- 
2.55.0

