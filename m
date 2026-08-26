Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18090433BB0
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773327; cv=none; b=PSUPrRqZSJn6TZMQ4gFHJTrG25Wi769kc/k7gsltfID0zZFL0+wjmKNIbX+4t0yWGRLfG3ppYPBNOVn04Gj3CsdU8SrP/LcQiTvzOlUs1uApoVRJGD0NmyITVFOjFT1+c5hj5X4L56iCGjfmH/6iRhnqrXKp8HeAJnWwGrgfFac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773327; c=relaxed/simple;
	bh=3I9Z/ag5mh89HvPP3UeMwBTvwl8VT0Wa6Tiv49zZY5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nj4G0KpKbpxswlRQDDxjVwXNG2B2OPeYyVpDrY88U6yrWPICAhS5hZBT3r4FJP/lbyeY16q6Gl1CMyJfMGC+K97SRXBq4oRGX8IeyP6VYdob3+OUF4k7oxW3afoRUgXJk4Sagl/06eQVel5e5RxuvDI2nHKFMqSr/40SevZd888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAYG0Z5M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAYG0Z5M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787773309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5E80AYcJQq1AFb1blKcFRy9kxc8JKyis50TCaxBSCf8=;
	b=XAYG0Z5Mmro9GoEb1F2+kbFZ7pMSUpV71Lj47sp7oEmeeVCsiEB+eoLKnO8hqgA+2iS5XF
	/hylxwOZpxexv6sKgsJFEa0EPeUljkcDt3M7silxKN7g8NeBLc0Q10BR7+L4SHMnz9AyZG
	Ya6mJGu+cF/CSINm5e7lzh1tI/mi8ZI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-7R5lkI-mNZqyK8XjM-t1CA-1; Wed,
 26 Aug 2026 15:41:46 -0400
X-MC-Unique: 7R5lkI-mNZqyK8XjM-t1CA-1
X-Mimecast-MFC-AGG-ID: 7R5lkI-mNZqyK8XjM-t1CA_1787773303
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84A0C1802149;
	Wed, 26 Aug 2026 19:41:43 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A4C591800577;
	Wed, 26 Aug 2026 19:41:34 +0000 (UTC)
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
Subject: [PATCH v3 19/43] qapi: convert trivial intro sections for dump.json
Date: Wed, 26 Aug 2026 15:38:16 -0400
Message-ID: <20260826193840.2152000-20-jsnow@redhat.com>
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
 qapi/dump.json | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/qapi/dump.json b/qapi/dump.json
index 690f3963fe1..520c58cbcd8 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -12,8 +12,7 @@
 
 ##
 # @DumpGuestMemoryFormat:
-#
-# An enumeration of guest-memory-dump's format.
+#     An enumeration of guest-memory-dump's format.
 #
 # @elf: elf format
 #
@@ -116,8 +115,8 @@
 
 ##
 # @DumpStatus:
-#
-# Describe the status of a long-running background guest memory dump.
+#     Describe the status of a long-running background guest memory
+#     dump.
 #
 # @none: no `dump-guest-memory` has started yet.
 #
@@ -134,8 +133,7 @@
 
 ##
 # @DumpQueryResult:
-#
-# The result format for `query-dump`.
+#     The result format for `query-dump`.
 #
 # @status: enum of `DumpStatus`, which shows current dump status
 #
@@ -152,8 +150,7 @@
 
 ##
 # @query-dump:
-#
-# Query latest dump status.
+#     Query latest dump status.
 #
 # Returns: An object showing the dump status.
 #
@@ -169,8 +166,7 @@
 
 ##
 # @DUMP_COMPLETED:
-#
-# Emitted when background dump has completed
+#     Emitted when background dump has completed
 #
 # @result: final dump status
 #
@@ -203,8 +199,7 @@
 
 ##
 # @query-dump-guest-memory-capability:
-#
-# Return the available formats for `dump-guest-memory`
+#     Return the available formats for `dump-guest-memory`
 #
 # Returns: An object listing available formats for `dump-guest-memory`
 #
-- 
2.55.0

