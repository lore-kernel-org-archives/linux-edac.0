Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B73ED12C
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780457000; cv=none; b=JxmnggskAoadpTtAZXqsCGbR6WxhgGXpjnoGdHQukHMy1fLUmPSH/rgTf2NamuhHOjlO8u0Xwga4jF8RZyFdKOYkkrHivsuXrOeQnaiaTX+iSw6KvFxP3JpIi2OpgaqCKkIn8+ZzVUOYTCm3AZ2Ccpu0axkHIiDX42H9mqLdyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780457000; c=relaxed/simple;
	bh=IOkEx7eOjec0+v+9Zt4qn9cnDE4DlwOlFLH2wkkeVcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANNtTKEvKcKiji0yQJg04Cg1PVCLgDqQsqa97n0IpbwFr2xn6Ki1fFUKEeVfAYJP1xUGCZVQZYr0jlxuI++RDNiFjGbZJnEWX3GTkUuh1uIuS7BJfjBILT9sKqf42fBPhQIRyPDAlD56p+lslWHM4n2323Hw88URhAJB7VBJxkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WXTMFAiJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WXTMFAiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fjt0nKIoMX/lOpK/Cw8uE3rBIm1wNU+6Z3KCnX7JfPg=;
	b=WXTMFAiJsSiNmsUhaBcNrBfwNhssteIWmgpHB/ulLakhZGJYAzfHh+GGS2Cwyr8nqQnbiv
	sonBtllm+oynSUMrsdG2dLIbbsAQxswce8++qvEbUKjl1OQlwLq9t1NBdYz9/52ASPtSbW
	bL86Yb1cgSoduPPj4pF/jYEoy2iaEkw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-LFN77XXwONWJWLgt0xFzUg-1; Tue,
 02 Jun 2026 23:23:15 -0400
X-MC-Unique: LFN77XXwONWJWLgt0xFzUg-1
X-Mimecast-MFC-AGG-ID: LFN77XXwONWJWLgt0xFzUg_1780456994
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D76C2195608A;
	Wed,  3 Jun 2026 03:23:13 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D117630001A1;
	Wed,  3 Jun 2026 03:23:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Igor Mammedov <imammedo@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	linux-edac@vger.kernel.org,
	Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v3 15/16] qapi: convert intro sections for acpi.json
Date: Tue,  2 Jun 2026 23:22:00 -0400
Message-ID: <20260603032201.993015-16-jsnow@redhat.com>
In-Reply-To: <20260603032201.993015-1-jsnow@redhat.com>
References: <20260603032201.993015-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/acpi.json | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/qapi/acpi.json b/qapi/acpi.json
index 906b3687a55..82e82d7cf89 100644
--- a/qapi/acpi.json
+++ b/qapi/acpi.json
@@ -13,8 +13,7 @@
 
 ##
 # @AcpiTableOptions:
-#
-# Specify an ACPI table on the command line to load.
+#     Specify an ACPI table on the command line to load.
 #
 # At most one of @file and @data can be specified.  The list of files
 # specified by any one of them is loaded and concatenated in order.
@@ -81,10 +80,9 @@
 
 ##
 # @ACPIOSTInfo:
-#
-# OSPM Status Indication for a device.  For description of possible
-# values of @source and @status fields see "_OST (OSPM Status
-# Indication)" chapter of ACPI5.0 spec.
+#     OSPM Status Indication for a device.  For description
+#     of possible values of @source and @status fields see "_OST (OSPM
+#     Status Indication)" chapter of ACPI5.0 spec.
 #
 # @device: device ID associated with slot
 #
@@ -107,9 +105,8 @@
 
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
@@ -126,8 +123,7 @@
 
 ##
 # @ACPI_DEVICE_OST:
-#
-# Emitted when guest executes ACPI _OST method.
+#     Emitted when guest executes ACPI _OST method.
 #
 # @info: OSPM Status Indication
 #
-- 
2.54.0

