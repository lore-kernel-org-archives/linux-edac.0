Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292F38889B
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769005; cv=none; b=rqXYZKhmMS1FQIYuS6/cHoCe58tCeTMqO3Gqxzw3tird/hGbtgpW+8NVqs630eGLwWESL2BHjbr+E3bWE8rZAKNileGKZHtqmZLRoD08hn3eiBudKXDtn5NIWkAFaiviqYJ1BRE3whWCQRthwEoE/2WRrJ+YSK2LZ/uFRlGyC5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769005; c=relaxed/simple;
	bh=IYnFvfc00Xokc88IBvMtAJMwsQzHNKFR+RIfygA9v3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMe+GvIvuZFlDFfygu4vopCjV71Vf5i/C5RQIUn6Ro+PmToXLz4hzMDlRbodvB4ssafvqVRUgZeX+3k3ajGFsSslPegzxk3dI6uovlEeBzjVaDcLR6q+uuS9QKLGFu20dDq5Z86riD/69lz3a62a4ODovRiLWatBac5Oc5gP8MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BN3LL6CQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BN3LL6CQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FteK1ShNbAANejCx7TvRGS/rSbHh5+NZrkX/3IVpqxI=;
	b=BN3LL6CQmyfRkANSZjtIjCrJENDfJzshm0GVuZK065H39RZ3WF0GD+kQpoIAslspNpIiHp
	4u8XcS61pozu0mpb5vGy/kAqA+o9TRpxDPaMnriqxs16xHZbtBGmzaXsmuPapB38L4xe/O
	WTRvPsSs2dU4gISfmySDLUw53Ihv+rE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-QOFyi6GuMeGOWGUbk14hPw-1; Mon,
 29 Jun 2026 17:36:42 -0400
X-MC-Unique: QOFyi6GuMeGOWGUbk14hPw-1
X-Mimecast-MFC-AGG-ID: QOFyi6GuMeGOWGUbk14hPw_1782769001
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07CFC1945104;
	Mon, 29 Jun 2026 21:36:40 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC8E719560AD;
	Mon, 29 Jun 2026 21:36:34 +0000 (UTC)
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
Subject: [PATCH 01/14] qapi: convert intro sections for error.json
Date: Mon, 29 Jun 2026 17:36:11 -0400
Message-ID: <20260629213624.936258-2-jsnow@redhat.com>
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
 qapi/error.json | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qapi/error.json b/qapi/error.json
index 54cb02fb880..a53b13e55c9 100644
--- a/qapi/error.json
+++ b/qapi/error.json
@@ -9,8 +9,7 @@
 
 ##
 # @QapiErrorClass:
-#
-# QEMU error classes
+#     QEMU error classes
 #
 # @GenericError: this is used for errors that don't require a specific
 #     error class.  This should be the default case for most errors
-- 
2.54.0

