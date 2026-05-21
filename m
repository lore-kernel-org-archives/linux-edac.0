Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB43A255F
	for <linux-edac@vger.kernel.org>; Thu, 21 May 2026 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350728; cv=none; b=TameZisvUTu6Ry2CiTDKzd50qOaz99shzZyjf6+5hotjOvNQ9qQhP+aks/8l1Cp6C6lXWYDzZq/pP0wVSt6025JCmtzsSTKtqEY+5BIs8BhnI4qzykGugr8Mwn6GVjrvNI8AK5AlfNIHwXYsUA0cAccYClivmH0k8Gsh9snhbM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350728; c=relaxed/simple;
	bh=z+oaBkw2Yb0lFVo2vASgOcRT0V3+q+cTpZMkvV1R8NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=momsqqOC0Ljidq4G5Edtbx5U5fBfS7JIsFBYPdZnyfDf8BqBDqNvTlQtXTSUOTJA3HRwDP3EXMjwfx69k589Yko4H4UVo8TdaAageT6hl9gCGhm5E2ARSrIT6PH3/JVC1IB0f6PC4mSSw0Owrlui0cbAPSxH5n4V6I/JchfX+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Novvij6n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Novvij6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779350726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RGr3RYJe7M8Xi5mt3nckge7KIM9KBp97LkjIcwj2Cxo=;
	b=Novvij6nnwl1jyJeMKFvu+jGhfDzUuKirG73B752wzMO0nwfDEFarUvZoeSgSmVHyYGlOw
	dJrAh1iw4WftJZwWPrWMBnoEraMeOYaILj6h/SGTEd1eZibUOe6wdIUjPv/XnCzEIHcFSz
	efIX9MBhjbtqMk0LgBSFGvqwSsC96V8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-383-2mRrKbmhPDioLXWeMwWmTA-1; Thu,
 21 May 2026 04:05:21 -0400
X-MC-Unique: 2mRrKbmhPDioLXWeMwWmTA-1
X-Mimecast-MFC-AGG-ID: 2mRrKbmhPDioLXWeMwWmTA_1779350720
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69FDE1800614;
	Thu, 21 May 2026 08:05:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23E8B1800591;
	Thu, 21 May 2026 08:05:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 2202C21E6743; Thu, 21 May 2026 10:05:12 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	pierrick.bouvier@oss.qualcomm.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 19/39] MAINTAINERS: Fix F: typo in "ACPI/HEST/GHES/ARM processor CPER"
Date: Thu, 21 May 2026 10:04:51 +0200
Message-ID: <20260521080511.999266-20-armbru@redhat.com>
In-Reply-To: <20260521080511.999266-1-armbru@redhat.com>
References: <20260521080511.999266-1-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Fixes: ddd8f3baa2 (qapi/acpi-hest: add an interface to do generic CPER error injection, 2025-09-23)
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-edac@vger.kernel.org
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6268ee1d73..38064971fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2237,7 +2237,7 @@ ACPI/HEST/GHES/ARM processor CPER
 M: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 L: linux-edac@vger.kernel.org
 S: Maintained
-F: hw/arm/ghes_cper.c
+F: hw/acpi/ghes_cper.c
 F: hw/acpi/ghes_cper_stub.c
 F: qapi/acpi-hest.json
 F: scripts/ghes_inject.py
-- 
2.54.0

