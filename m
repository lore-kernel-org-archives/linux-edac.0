Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD163C9EEB
	for <linux-edac@vger.kernel.org>; Mon, 29 Jun 2026 21:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782769023; cv=none; b=T1efWpfTYCkYBPoIVwLpoyQL7XzqhWIolGzkSSkFGDaUbSQ3tQ7ORknFuc35Kt0hrINzE0yQc6ct9I/BUwtCk0vYAoSCvbavmvV+X3L+CycjthGlGzRiL9yvE08RPLyhV/sh3U8fl8d50f5QSiS/1V1MExIx/ydB4RGjQGnoPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782769023; c=relaxed/simple;
	bh=HrnaPGe6JWSSI6sZDsAhXED18Ed6qwks73ZtTHxBFsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zbmj37O6teZUr9ctQiubPX28GHHSx+fesGxA3NpWtpY0wygvwE5xc3j4z1ck3SLSVyOsF4LLoLTmVkQMm+GlNhAgFh8D87zpfZ26UxJ98Ec+jITOQtMutUZfsWrzHnZm24egZHTzEG/ewNlD9AvPWUvIKhbNGcb2MqbpfRtRU8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C4K7IJoO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C4K7IJoO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782769021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gxwzqjyi4gNRuk9Pg2y7ID71zjslsTl4XO5exshZvh0=;
	b=C4K7IJoO35j0YMrSnhKcY4wf9E5PUOdwQf75AmhQuubaPLMWQt5PKRtqwiQdWu5UuQ4N1r
	hHEGqY0wIE4xziUUzXmm1TwREInh1ALeWd8ewozBvnZCMmxUL6XrmKA5s4/qHitNUquVay
	NZA9JhIAza8mrmTnzA8+MM5PBy909LE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-Y6rBAd1nMFGF1rxlZLlvsA-1; Mon,
 29 Jun 2026 17:36:58 -0400
X-MC-Unique: Y6rBAd1nMFGF1rxlZLlvsA-1
X-Mimecast-MFC-AGG-ID: Y6rBAd1nMFGF1rxlZLlvsA_1782769016
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E02791945CBA;
	Mon, 29 Jun 2026 21:36:55 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.88.171])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2C2B41956096;
	Mon, 29 Jun 2026 21:36:50 +0000 (UTC)
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
Subject: [PATCH 04/14] qapi: convert intro sections for uefi.json
Date: Mon, 29 Jun 2026 17:36:14 -0400
Message-ID: <20260629213624.936258-5-jsnow@redhat.com>
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
 qapi/uefi.json | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/qapi/uefi.json b/qapi/uefi.json
index 86f33b234ba..cb2b5e1f531 100644
--- a/qapi/uefi.json
+++ b/qapi/uefi.json
@@ -17,9 +17,8 @@
 
 ##
 # @UefiVariable:
-#
-# UEFI Variable.  Check the UEFI specification for more detailed
-# information on the fields.
+#     UEFI Variable.  Check the UEFI specification for more detailed
+#     information on the fields.
 #
 # @guid: variable namespace GUID
 #
-- 
2.54.0

