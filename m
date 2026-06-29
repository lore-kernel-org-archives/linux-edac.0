Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FED3C9EE7
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769018; cv=none; b=iCcS/8VCcijKrCpruzu56BdergCsLThMM/2dIP60nA7t63uQlHyvbmp04ezKkK3xq9a9V8rDgxot4neSv5OPDTsVMf127ZGkm7D0yXzmx9Qud2wP7LTLgu2QqsgbMGXuc9MuAhuRW20HdQo6mByIJl5fT9QEPTS1B1IRe6KENIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769018; c=relaxed/simple;
	bh=2hnqzf4ZJX9rn+0wJeQ7sMqA1kp/oH6+xF1ZsW8py2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQja024+4l2JSp54g8OtfooQvXKUno0ChS+TsCup0/lrQ81BqmxNJIqE8yEPtz2zWSQktuuMn/LkIkDRe+bulLmRTeILk8aPL3tsHWHFaciFoRTnrGqEI6pHLCu96fR9lPoFq9MPHkbrj6DAmgYvd4kBnGPPCodfiC/H6qx6rAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etxPDqd5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etxPDqd5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpPPvrbfX6Wg6auz74hgpVrGyUcQsPOhT6ZNVlKgcLU=;
	b=etxPDqd5Oi/J7ZBsbMN/5YKNgWSTNB6i2DHVLdqLTNif0Y/J9HyksNH5y1UGDpI+7OAjbI
	8wuwBSiKpnWRI3Qgc0eoKtaGrP6z1wH5Ocjq4uDvOyBOuM7Xo/Ie8MsH8/uIhfdzX3NiHe
	CEITjltV7EM5AEoBFllZTJnpkG8FAUo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-AtUV29G0PRWcUjtPEqQ0Yg-1; Mon,
 29 Jun 2026 17:36:53 -0400
X-MC-Unique: AtUV29G0PRWcUjtPEqQ0Yg-1
X-Mimecast-MFC-AGG-ID: AtUV29G0PRWcUjtPEqQ0Yg_1782769011
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D427B189F05C;
	Mon, 29 Jun 2026 21:36:50 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92D7819560AD;
	Mon, 29 Jun 2026 21:36:46 +0000 (UTC)
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
Subject: [PATCH 03/14] qapi: convert intro sections for ebpf.json
Date: Mon, 29 Jun 2026 17:36:13 -0400
Message-ID: <20260629213624.936258-4-jsnow@redhat.com>
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
 qapi/ebpf.json | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/qapi/ebpf.json b/qapi/ebpf.json
index f0257955fa2..1f7a4d5c126 100644
--- a/qapi/ebpf.json
+++ b/qapi/ebpf.json
@@ -20,8 +20,7 @@
 
 ##
 # @EbpfObject:
-#
-# An eBPF ELF object.
+#     An eBPF ELF object.
 #
 # @object: the eBPF object encoded in base64
 #
@@ -33,8 +32,7 @@
 
 ##
 # @EbpfProgramID:
-#
-# The eBPF programs that can be gotten with `request-ebpf`.
+#     The eBPF programs that can be gotten with `request-ebpf`.
 #
 # @rss: Receive side scaling, technology that allows steering traffic
 #     between queues by calculation hash.  Users may set up
@@ -49,10 +47,10 @@
 
 ##
 # @request-ebpf:
-#
-# Retrieve an eBPF object that can be loaded with libbpf.  Management
-# applications (e.g. libvirt) may load it and pass file descriptors to
-# QEMU, so they can run running QEMU without BPF capabilities.
+#     Retrieve an eBPF object that can be loaded with libbpf.
+#     Management applications (e.g. libvirt) may load it and pass file
+#     descriptors to QEMU, so they can run running QEMU without BPF
+#     capabilities.
 #
 # @id: The ID of the program to return.
 #
-- 
2.54.0

