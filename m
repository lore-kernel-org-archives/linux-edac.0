Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545A15E5BB
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769077; cv=none; b=jsu5STXHqgOwwuLzRQKJHXKqAABgEoqe1FLOJMf8bRQyFVTWtyyFrtk5bLwNPmqOlZAG0gT/ruHVlaHVL6pxEWZEuxntI7CQBY+hMksvRFmJ1F0navFZFwHsQj4U4x2uXIBqiYAEwUzcmrUmjbq7quTfdgeWIcbHnG9hRF0F3Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769077; c=relaxed/simple;
	bh=pgBHBWfptswx2BxVHbTXwUJeBMOfmKeSve+LufkfoWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wfhf77diHdublnhDu7sKXDMdXC8jjbaclgM0EYesm66WTqT3xxiBBfBUk1fzEE1GcJJFM1j+W4o3LSjw2DoUBc/WHv/uwp3VpRGQZPGgsHv51phdSZjTDoqbZ7Am7GJ16gGr9fif+tf2w4obckkErW4nQ+yAmYOaSiAvtJXRUNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K+Gn8XQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K+Gn8XQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9s+IkMlBhanf+Pn0duVGNoPMUPvY2espT9FCcXlZ7w=;
	b=K+Gn8XQ/SkeQu8PeIoQFHU7+cws25m/SqWuzTbJpqFr1/1udFjbmjwzCmkCz8fGr2GGpT1
	7BvubrRy+AZ0JgbXbHPf/D7EWMo0T3VW+DRyHAKv8n8oUmeoLKxeF2/5qcp2bqRyE0ih/9
	LhAzOlRJ8zNWw6fACm7IddYqK+dXd7E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-L96HUKv0Pp6Gw2HxSaGsSQ-1; Mon,
 29 Jun 2026 17:37:51 -0400
X-MC-Unique: L96HUKv0Pp6Gw2HxSaGsSQ-1
X-Mimecast-MFC-AGG-ID: L96HUKv0Pp6Gw2HxSaGsSQ_1782769069
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 712A518C0FBA;
	Mon, 29 Jun 2026 21:37:49 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52F501956096;
	Mon, 29 Jun 2026 21:37:44 +0000 (UTC)
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
Subject: [PATCH 14/14] qapi: convert intro sections for replay.json
Date: Mon, 29 Jun 2026 17:36:24 -0400
Message-ID: <20260629213624.936258-15-jsnow@redhat.com>
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
 qapi/replay.json | 45 ++++++++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/qapi/replay.json b/qapi/replay.json
index ccf84da68ef..db1440c09a6 100644
--- a/qapi/replay.json
+++ b/qapi/replay.json
@@ -12,8 +12,7 @@
 
 ##
 # @ReplayMode:
-#
-# Mode of the replay subsystem.
+#     Mode of the replay subsystem.
 #
 # @none: normal execution mode.  Replay or record are not enabled.
 #
@@ -30,8 +29,7 @@
 
 ##
 # @ReplayInfo:
-#
-# Record/replay information.
+#     Record/replay information.
 #
 # @mode: current mode.
 #
@@ -47,10 +45,9 @@
 
 ##
 # @query-replay:
-#
-# Retrieve the record/replay information.  It includes current
-# instruction count which may be used for `replay-break` and
-# `replay-seek` commands.
+#     Retrieve the record/replay information.  It includes current
+#     instruction count which may be used for `replay-break` and
+#     `replay-seek` commands.
 #
 # Returns: record/replay information.
 #
@@ -66,13 +63,13 @@
 
 ##
 # @replay-break:
-#
-# Set replay breakpoint at instruction count @icount.  Execution stops
-# when the specified instruction is reached.  There can be at most one
-# breakpoint.  When breakpoint is set, any prior one is removed.  The
-# breakpoint may be set only in replay mode and only "in the future",
-# i.e. at instruction counts greater than the current one.  The
-# current instruction count can be observed with `query-replay`.
+#     Set replay breakpoint at instruction count @icount.  Execution
+#     stops when the specified instruction is reached.  There can be
+#     at most one breakpoint.  When breakpoint is set, any prior one
+#     is removed.  The breakpoint may be set only in replay mode and
+#     only "in the future", i.e. at instruction counts greater than
+#     the current one.  The current instruction count can be observed
+#     with `query-replay`.
 #
 # @icount: instruction count to stop at
 #
@@ -87,9 +84,8 @@
 
 ##
 # @replay-delete-break:
-#
-# Remove replay breakpoint which was set with `replay-break`.  The
-# command is ignored when there are no replay breakpoints.
+#     Remove replay breakpoint which was set with `replay-break`.  The
+#     command is ignored when there are no replay breakpoints.
 #
 # Since: 5.2
 #
@@ -102,13 +98,12 @@
 
 ##
 # @replay-seek:
-#
-# Automatically proceed to the instruction count @icount, when
-# replaying the execution.  The command automatically loads nearest
-# snapshot and replays the execution to find the desired instruction.
-# When there is no preceding snapshot or the execution is not
-# replayed, then the command fails.  Instruction count can be obtained
-# with the `query-replay` command.
+#     Automatically proceed to the instruction count @icount, when
+#     replaying the execution.  The command automatically loads
+#     nearest snapshot and replays the execution to find the desired
+#     instruction.  When there is no preceding snapshot or the
+#     execution is not replayed, then the command fails.  Instruction
+#     count can be obtained with the `query-replay` command.
 #
 # @icount: target instruction count
 #
-- 
2.54.0

