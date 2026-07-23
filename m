Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93922376BC6
	for <linux-edac@vger.kernel.org>; Thu, 23 Jul 2026 04:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782347; cv=none; b=Xhi5+aOALrOO/mYP4YIgrMeyUBIuQ7/Q5B5qQ6JByqkOP+Vg8NnZdaZZ7OtgCWOaocTkVA3oFF67IEd7YUMZQ/1L2Zb8fUMfXJZkgCzl+vgvk1dHi7oSJrodDOdtDDcDcfQCLaOf9IF6CeH4ACF86wi3gUiL7YcxznSBT18bA4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782347; c=relaxed/simple;
	bh=/P7UMPm6aOxGGT0ybQBzabH25to+nVCu1B+zoxtMfAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cs63JOCBNVj7CP1GIe5a/zkp1Rmc3F2juXcHsf42WTi+ZWVum7ykzayO/Kb7WfszKN/rkR/hr+isJIEAjZVjvl/sd5TpgG+DsCTrtX9sA20MqT7s7fmqVKbFJ6CL7wN6ULAWV2i9H1+MGg0OYZXpSwBc2LYi7xYnZvUSvZH3Bfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtZM0vA+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtZM0vA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784782338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5pYNtwR7SG5TiuFxq7Ubuc04yN+erb8vLnytfXqXS8=;
	b=WtZM0vA+OHzHe2xEkI197lSR4kCmaLqXNHKpi48GXEoR6tH/lAQX5wqsUZwvVAToKqRbhx
	OR3GB47ckTW3SBmyhvyFU+mBspq0+KLp8IYAHktYE7/ErP4ZilHxfJPIM5apatAoJF4WEI
	iMfID1aQgSbyBX2xuPu+mL1XeZy14jY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-ZTt86k4uOE2IyN07IoWtvA-1; Thu,
 23 Jul 2026 00:52:14 -0400
X-MC-Unique: ZTt86k4uOE2IyN07IoWtvA-1
X-Mimecast-MFC-AGG-ID: ZTt86k4uOE2IyN07IoWtvA_1784782331
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 372A61800759;
	Thu, 23 Jul 2026 04:52:11 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A5E1180029D;
	Thu, 23 Jul 2026 04:52:01 +0000 (UTC)
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
Subject: [PATCH v2 23/44] qapi: convert trivial intro sections for transaction.json
Date: Thu, 23 Jul 2026 00:47:44 -0400
Message-ID: <20260723044805.527643-24-jsnow@redhat.com>
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
 qapi/transaction.json | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index 4b4eb09bf38..c0dc811ba61 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -12,8 +12,7 @@
 
 ##
 # @Abort:
-#
-# This action can be used to test transaction failure.
+#     This action can be used to test transaction failure.
 #
 # Since: 1.6
 ##
@@ -22,8 +21,7 @@
 
 ##
 # @ActionCompletionMode:
-#
-# An enumeration of transactional completion modes.
+#     An enumeration of transactional completion modes.
 #
 # @individual: Do not attempt to cancel any other Actions if any
 #     Actions fail after the Transaction request succeeds.  All
@@ -156,9 +154,8 @@
 
 ##
 # @TransactionAction:
-#
-# A discriminated record of operations that can be performed with
-# `transaction`.
+#     A discriminated record of operations that can be performed with
+#     `transaction`.
 #
 # @type: the operation to be performed
 #
@@ -184,8 +181,7 @@
 
 ##
 # @TransactionProperties:
-#
-# Optional arguments to modify the behavior of a Transaction.
+#     Optional arguments to modify the behavior of a Transaction.
 #
 # @completion-mode: Controls how jobs launched asynchronously by
 #     Actions will complete or fail as a group.  See
-- 
2.55.0

