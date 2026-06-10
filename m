Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E153A4F32
	for <linux-edac@vger.kernel.org>; Wed, 10 Jun 2026 08:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078703; cv=none; b=P4X+KD5hBtc0jHluI8PH5244DnkyiGW87yaSV8HNrQRYfMmgfwB5ovLbOXMhMllwDG0l4EoqtcX6Te4n+qB7jqL88dK9iaMVH3ocPQXX+XKseEBHr1BW6P7SWE8CYSjzB21ffaKsUhpY44a51Gasmb9M3udjcoN6KMqtdBSmpCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078703; c=relaxed/simple;
	bh=kh/9byxtKBz0ur/UieOWXVaMM1n7UiXISF7rkZDfex4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ysj4wEDAALtM5hcHnwUq/vQSmuSEPHmkAPuXuxCEo7yc0M2IOIXzVoJ9yocEkCHBYog46lSEuW3tj0mMT2J9DA9i2uTOMwF+MuFp+cssBjQj65M+ahsrrAgmpamAa6BAV2gLMg2Q1yCsviFy05MGKx4Ah30kc7Vslm0t4NwO7PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IhQXNw5l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IhQXNw5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781078701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwmfgE5w6+4e17J1Wyl3r4miu2V9/8gGZbKcODwwfPs=;
	b=IhQXNw5lyy3/AYl54bCWpNTf5Wq8AvqHFCnwP+iVgb10R245ncaCdEao53493l2grhtpga
	xfw5C4WVhwR72wf/2qUnod0eDjTU4hyIChy/GK4d9oGI2i7Q3ZCnoIea9UXhILiIP3sFcR
	pnrI2LiuWC+MqQrQFoQ4525JzkLPOGw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-JYoQlC5dNmaajSCdwWaG2w-1; Wed,
 10 Jun 2026 04:04:57 -0400
X-MC-Unique: JYoQlC5dNmaajSCdwWaG2w-1
X-Mimecast-MFC-AGG-ID: JYoQlC5dNmaajSCdwWaG2w_1781078696
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D33819560BA;
	Wed, 10 Jun 2026 08:04:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.28])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E5E18180034F;
	Wed, 10 Jun 2026 08:04:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E7DC021E657C; Wed, 10 Jun 2026 10:04:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PULL 22/42] MAINTAINERS: Fix F: typo in "ACPI/HEST/GHES/ARM processor CPER"
Date: Wed, 10 Jun 2026 10:04:27 +0200
Message-ID: <20260610080447.1156502-23-armbru@redhat.com>
In-Reply-To: <20260610080447.1156502-1-armbru@redhat.com>
References: <20260610080447.1156502-1-armbru@redhat.com>
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
Message-ID: <20260603064032.3733394-19-armbru@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 39414f727e..d6a32be0a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2235,7 +2235,7 @@ ACPI/HEST/GHES/ARM processor CPER
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

