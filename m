Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0213C9ED6
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769072; cv=none; b=Us0KhxyOyCTBOuNvxdk30uZv4Dgz6w2nuhNNCkqaDNXAIqeQLMVHOLmWikTyo5vO6oqpmTCDhOpOjCnH0YYCqHITJjX8C5zch+WkbV8p69KFqO044qMBew+XKyZvWVBWMvu0Q0Wq+A0cwjvgMsolqgP8zXNE65fvcNqPM7eZ9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769072; c=relaxed/simple;
	bh=cA60i+sZ5CAFjINuPMzjhchJFdMUajpCUkSFKz8OGRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aY0p8TAFCqa1U6goztZSO6MkNpa9mfnGVZQ4lyNSBG3kUEkbAadda+dLehwo5R8bqcKVsExze20YwVK1u6EoXjwTDYj4qZpi5vwdyT4EHID39suzsZlfQPsr5kJJF/xRfFlPBwDtDBVN0cP11wUiU9AaXbQNie5Sdfo/Bri7ZEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JbN2+YBd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JbN2+YBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLVFGzp09CzhnZkb/rQms/Ql1UubbrCtslqNYqSQ1RA=;
	b=JbN2+YBdwMAsBKLOIxrHV+8w6V9DcIEyjjEvrkoXbD4dRq+Oi2lBUWxMpK7swbaDnfka44
	9GPQtm1SpJHHC1QqUlTviNrZvAeoztV4TomArT3pzkGgOuqYyRwDZzQvSyJIaixXwX9V0N
	Lm8DoZ7/lHa/bwRPI9igm4+unh0ZAfY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-fx_v1BPxM7Cp4O4iBwHqog-1; Mon,
 29 Jun 2026 17:37:45 -0400
X-MC-Unique: fx_v1BPxM7Cp4O4iBwHqog-1
X-Mimecast-MFC-AGG-ID: fx_v1BPxM7Cp4O4iBwHqog_1782769063
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C978D19344BE;
	Mon, 29 Jun 2026 21:37:43 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BF5C1956096;
	Mon, 29 Jun 2026 21:37:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	linux-edac@vger.kernel.org,
	Markus Armbruster <armbru@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Alex Williamson <alex@shazbot.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	zhenwei pi <zhenwei.pi@linux.dev>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Lukas Straub <lukasstraub2@web.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH 13/14] qapi: convert intro sections for yank.json
Date: Mon, 29 Jun 2026 17:36:23 -0400
Message-ID: <20260629213624.936258-14-jsnow@redhat.com>
In-Reply-To: <20260629213624.936258-1-jsnow@redhat.com>
References: <20260629213624.936258-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/yank.json | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/qapi/yank.json b/qapi/yank.json
index f3cd5c15d60..6fdf169084d 100644
--- a/qapi/yank.json
+++ b/qapi/yank.json
@@ -10,9 +10,8 @@
 
 ##
 # @YankInstanceType:
-#
-# An enumeration of yank instance types.  See `YankInstance` for more
-# information.
+#     An enumeration of yank instance types.  See `YankInstance` for
+#     more information.
 #
 # Since: 6.0
 ##
@@ -21,9 +20,8 @@
 
 ##
 # @YankInstanceBlockNode:
-#
-# Specifies which block graph node to yank.  See `YankInstance` for
-# more information.
+#     Specifies which block graph node to yank.  See `YankInstance`
+#     for more information.
 #
 # @node-name: the name of the block graph node
 #
@@ -34,9 +32,8 @@
 
 ##
 # @YankInstanceChardev:
-#
-# Specifies which character device to yank.  See `YankInstance` for
-# more information.
+#     Specifies which character device to yank.  See `YankInstance`
+#     for more information.
 #
 # @id: the chardev's ID
 #
@@ -47,9 +44,8 @@
 
 ##
 # @YankInstance:
-#
-# A yank instance can be yanked with the `yank` qmp command to recover
-# from a hanging QEMU.
+#     A yank instance can be yanked with the `yank` qmp command to
+#     recover from a hanging QEMU.
 #
 # @type: yank instance type
 #
@@ -74,9 +70,8 @@
 
 ##
 # @yank:
-#
-# Try to recover from hanging QEMU by yanking the specified instances.
-# See `YankInstance` for more information.
+#     Try to recover from hanging QEMU by yanking the specified
+#     instances.  See `YankInstance` for more information.
 #
 # @instances: the instances to be yanked
 #
@@ -101,8 +96,7 @@
 
 ##
 # @query-yank:
-#
-# Query yank instances.  See `YankInstance` for more information.
+#     Query yank instances.  See `YankInstance` for more information.
 #
 # TODO: This line is a hack to separate the example from the body
 #
-- 
2.54.0

