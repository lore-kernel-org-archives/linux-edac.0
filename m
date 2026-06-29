Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97343CA487
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769065; cv=none; b=BsVS3SzycqVFc8LdwNOZf0rUeFoI7B5klheGnvPtHuXN4XNakkfvfGNbxDFMxsQlBsBui8JgoarjD5syjYXDS8xCXJ+r+106cgFUl1qY/kG1kxE57CPCtwd5IsQJ1q65GIC2Nij4AdCsTEI7Z9y5y5pWDh+juti7JZrp1wCNn3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769065; c=relaxed/simple;
	bh=EYG2cTvYBaaQLiO8VlM3iVLVj2J6Xj2pp5/wH6TANxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0/H6bQLOBOwPmJVkmK2DeHxFv+3wm17y2mmL9fX/jaRRKMlBT+tFfNR+3X/yvq8P9q5IpV29xHbR5uoJGjhM2mJV5iGv2cN0/+Mwt3wNX+OXbLKEoeGAIdSuJnDYjnPu2aZdN5ia8wqqElyYr4fknUOGMwaeu7i9qbjoONrjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h0bwf+HN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h0bwf+HN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZzH2vgYPGUBsrs5ZG94GuwI9S4cjR/KWflAG6TZKmQs=;
	b=h0bwf+HN8JIJN4VvSdQTYHsQdgvRRt2umkBCxOBFY8xfy7lKN7yUMuyAD0bVaA3o9ZxBLw
	ZS7YDklTmqn6LYoIVjwHEjbla+oFttpSC8BzKk8RixhRcViW9FjvXbNmbkQIjE3ZyQPjdl
	IHJAlSpStMm9y37geaFoFXJVph4zbRs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-567-fP9UPKqXM4ChvpyBI9jOxA-1; Mon,
 29 Jun 2026 17:37:39 -0400
X-MC-Unique: fP9UPKqXM4ChvpyBI9jOxA-1
X-Mimecast-MFC-AGG-ID: fP9UPKqXM4ChvpyBI9jOxA_1782769057
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9523B1978CAA;
	Mon, 29 Jun 2026 21:37:37 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BC9631956096;
	Mon, 29 Jun 2026 21:37:33 +0000 (UTC)
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
Subject: [PATCH 12/14] qapi: convert intro sections for authz.json
Date: Mon, 29 Jun 2026 17:36:22 -0400
Message-ID: <20260629213624.936258-13-jsnow@redhat.com>
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
 qapi/authz.json | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/qapi/authz.json b/qapi/authz.json
index bc1123cc053..b76c39c53af 100644
--- a/qapi/authz.json
+++ b/qapi/authz.json
@@ -9,8 +9,7 @@
 
 ##
 # @QAuthZListPolicy:
-#
-# The authorization policy result
+#     The authorization policy result
 #
 # @deny: deny access
 #
@@ -24,8 +23,7 @@
 
 ##
 # @QAuthZListFormat:
-#
-# The authorization policy match format
+#     The authorization policy match format
 #
 # @exact: an exact string match
 #
@@ -39,8 +37,7 @@
 
 ##
 # @QAuthZListRule:
-#
-# A single authorization rule.
+#     A single authorization rule.
 #
 # @match: a string or glob to match against a user identity
 #
@@ -57,8 +54,7 @@
 
 ##
 # @AuthZListProperties:
-#
-# Properties for authz-list objects.
+#     Properties for authz-list objects.
 #
 # @policy: Default policy to apply when no rule matches (default:
 #     deny)
@@ -73,8 +69,7 @@
 
 ##
 # @AuthZListFileProperties:
-#
-# Properties for authz-listfile objects.
+#     Properties for authz-listfile objects.
 #
 # @filename: File name to load the configuration from.  The file must
 #     contain valid JSON for `AuthZListProperties`.
@@ -93,8 +88,7 @@
 
 ##
 # @AuthZPAMProperties:
-#
-# Properties for authz-pam objects.
+#     Properties for authz-pam objects.
 #
 # @service: PAM service name to use for authorization
 #
@@ -105,8 +99,7 @@
 
 ##
 # @AuthZSimpleProperties:
-#
-# Properties for authz-simple objects.
+#     Properties for authz-simple objects.
 #
 # @identity: Identifies the allowed user.  Its format depends on the
 #     network service that authorization object is associated with.
-- 
2.54.0

