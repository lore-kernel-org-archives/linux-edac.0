Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C538AC72
	for <linux-edac@vger.kernel.org>; Mon, 31 Aug 2026 20:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207894; cv=none; b=pbWx/U07z3vehiKHavIL+hThxqayIvZ6jxiHE0tmRbFxnUoAb068RrKa8QlgBp5t4ptjX8NYBJLH2LT4UR6alIB1UenhcY95u+r6NcwnPDRaBl8N+ue7EgczEo4uBz1XXLe+umZeieqORgYwNcrJOo/pUxPigJ982hWPhh95RbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207894; c=relaxed/simple;
	bh=fBXv1dyQNJI/ViWNJdv4VtldTlohpp1etotgzX5foxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtHjRjmR+PrPscBrlBgdTvLO2yqJIXWEQnzXu/2tUJ7oFyIuNwmQwpI7ISVnjwA+RwYcq1Rd+R0o9RZsvey0c2FdXgcuyEXaRZLpdzkvodcn/W4GMqkSbR7GLIyNGLdo1J6bh50K0RB3trDvkuOgyR7nddL0W7kdJi6IpSWEMq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DEbYcnUS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DEbYcnUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788207891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y8pqXrIvr/yRTQ3rsO16r+lqlJjBRU1uvUFq6p7chi8=;
	b=DEbYcnUSSChHksYKHUqp8zIQGzcmOjZh+ielxnRxQwI9TPwqOTKmGOiLu7ID5HRwwLK5Yj
	Ic8hqd7hs46b0bECOXm1Hwy1LEAhIyaxPfUCFkLxNb/XL4ZbL7SCQceBXRJTEtgZbE15qp
	i04J111U5/A6uuNfemV/TforZ9KhFdI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-VgiO1ekmMsm3UUxhDdvEcg-1; Mon,
 31 Aug 2026 16:24:47 -0400
X-MC-Unique: VgiO1ekmMsm3UUxhDdvEcg-1
X-Mimecast-MFC-AGG-ID: VgiO1ekmMsm3UUxhDdvEcg_1788207884
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E1A61843AD9;
	Mon, 31 Aug 2026 20:24:44 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D9041800577;
	Mon, 31 Aug 2026 20:24:36 +0000 (UTC)
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
Subject: [PATCH v4 32/43] qapi: convert trivial intro sections for misc.json
Date: Mon, 31 Aug 2026 16:19:34 -0400
Message-ID: <20260831201945.287730-33-jsnow@redhat.com>
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
 qapi/misc.json | 74 ++++++++++++++++++--------------------------------
 1 file changed, 27 insertions(+), 47 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 22b7afed9f6..b3c2a1421f3 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -44,8 +44,7 @@
 
 ##
 # @NameInfo:
-#
-# Guest name information.
+#     Guest name information.
 #
 # @name: The name of the guest
 #
@@ -55,8 +54,7 @@
 
 ##
 # @query-name:
-#
-# Return the name information of a guest.
+#     Return the name information of a guest.
 #
 # Since: 0.14
 #
@@ -69,8 +67,7 @@
 
 ##
 # @IOThreadInfo:
-#
-# Information about an iothread
+#     Information about an iothread
 #
 # @id: the identifier of the iothread
 #
@@ -137,8 +134,7 @@
 
 ##
 # @stop:
-#
-# Stop guest VM execution.
+#     Stop guest VM execution.
 #
 # Since: 0.14
 #
@@ -159,8 +155,7 @@
 
 ##
 # @cont:
-#
-# Resume guest VM execution.
+#     Resume guest VM execution.
 #
 # Since: 0.14
 #
@@ -208,8 +203,7 @@
 
 ##
 # @human-monitor-command:
-#
-# Execute a command on the human monitor and return the output.
+#     Execute a command on the human monitor and return the output.
 #
 # @command-line: the command to execute in the human monitor
 #
@@ -251,8 +245,7 @@
 
 ##
 # @getfd:
-#
-# Receive a file descriptor via SCM rights and assign it a name
+#     Receive a file descriptor via SCM rights and assign it a name
 #
 # @fdname: file descriptor name
 #
@@ -273,11 +266,10 @@
 
 ##
 # @get-win32-socket:
-#
-# Add a socket that was duplicated to QEMU process with
-# WSADuplicateSocketW() via WSASocket() & WSAPROTOCOL_INFOW structure
-# and assign it a name (the SOCKET is associated with a CRT file
-# descriptor)
+#     Add a socket that was duplicated to QEMU process with
+#     WSADuplicateSocketW() via WSASocket() & WSAPROTOCOL_INFOW
+#     structure and assign it a name (the SOCKET is associated with a
+#     CRT file descriptor)
 #
 # @info: the WSAPROTOCOL_INFOW structure (encoded in base64)
 #
@@ -301,8 +293,7 @@
 
 ##
 # @closefd:
-#
-# Close a file descriptor previously passed via SCM rights
+#     Close a file descriptor previously passed via SCM rights
 #
 # @fdname: file descriptor name
 #
@@ -317,8 +308,7 @@
 
 ##
 # @AddfdInfo:
-#
-# Information about a file descriptor that was added to an fd set.
+#     Information about a file descriptor that was added to an fd set.
 #
 # @fdset-id: The ID of the fd set that @fd was added to.
 #
@@ -331,8 +321,8 @@
 
 ##
 # @add-fd:
-#
-# Add a file descriptor, that was passed via SCM rights, to an fd set.
+#     Add a file descriptor, that was passed via SCM rights, to an fd
+#     set.
 #
 # @fdset-id: The ID of the fd set to add the file descriptor to.
 #
@@ -361,8 +351,7 @@
 
 ##
 # @remove-fd:
-#
-# Remove a file descriptor from an fd set.
+#     Remove a file descriptor from an fd set.
 #
 # @fdset-id: The ID of the fd set that the file descriptor belongs to.
 #
@@ -387,8 +376,7 @@
 
 ##
 # @FdsetFdInfo:
-#
-# Information about a file descriptor that belongs to an fd set.
+#     Information about a file descriptor that belongs to an fd set.
 #
 # @fd: The file descriptor value.
 #
@@ -401,8 +389,7 @@
 
 ##
 # @FdsetInfo:
-#
-# Information about an fd set.
+#     Information about an fd set.
 #
 # @fdset-id: The ID of the fd set.
 #
@@ -415,8 +402,7 @@
 
 ##
 # @query-fdsets:
-#
-# Return information describing all fd sets.
+#     Return information describing all fd sets.
 #
 # Since: 1.2
 #
@@ -457,8 +443,7 @@
 
 ##
 # @CommandLineParameterType:
-#
-# Possible types for an option parameter.
+#     Possible types for an option parameter.
 #
 # @string: accepts a character string
 #
@@ -476,8 +461,7 @@
 
 ##
 # @CommandLineParameterInfo:
-#
-# Details about a single parameter of a command line option.
+#     Details about a single parameter of a command line option.
 #
 # @name: parameter name
 #
@@ -497,9 +481,8 @@
 
 ##
 # @CommandLineOptionInfo:
-#
-# Details about a command line option, including its list of parameter
-# details
+#     Details about a command line option, including its list of
+#     parameter details
 #
 # @option: option name
 #
@@ -512,8 +495,7 @@
 
 ##
 # @query-command-line-options:
-#
-# Query command line option schema.
+#     Query command line option schema.
 #
 # @option: option name
 #
@@ -552,8 +534,7 @@
 
 ##
 # @RTC_CHANGE:
-#
-# Emitted when the guest changes the RTC time.
+#     Emitted when the guest changes the RTC time.
 #
 # @offset: offset in seconds between base RTC clock (as specified by
 #     -rtc base), and new RTC clock value
@@ -577,9 +558,8 @@
 
 ##
 # @VFU_CLIENT_HANGUP:
-#
-# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
-# communication channel
+#     Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
+#     communication channel
 #
 # @vfu-id: ID of the TYPE_VFIO_USER_SERVER object.  It is the last
 #     component of @vfu-qom-path referenced below
-- 
2.55.0

