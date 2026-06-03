Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0C2BFC60
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468848; cv=none; b=k92YaF1GtZkr3ASV1aNzu6Sd8QLC18Q8qMEZEMXOdH1yDjqYKJOK/ktpEukof2isJSTELkhk6UmfqW8MEOhXz7E+mH0379YrlR/lBVrZVYXf4Bp7dJM5YsrqM1kmoxcK9NLdJIzIZa+i5FdtPLPIxd+W0P1EW7Ev92u8Wpl4z6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468848; c=relaxed/simple;
	bh=s81srs2okcYSbv9RpqC/NhmsdujoopOJH0QO9B/FvkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYgUTyA77MUqzTuoKM4NalwBDkQdEVBs3AkX4O1BNeBnBpAJp0feIsjWV/21HciOCcfXY0n8bxVO/eLm6gH+/1hSiKpmtMBuU69C2CyGCm3Bf0PY7bpn03OyRmBzKPQ5w16TKP2cygv+7+40Hxi6dV2lswbkvBoCWdLNodUU24Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LI9G+nVV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LI9G+nVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780468844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIrQAKya31ypo+5j9X3JO9WQgohhJh3rZPyQNjSBeAk=;
	b=LI9G+nVVCQh1JGQDOHwNnCEa1NZcDKfe94fWZ1enUnGEu9DslZx0XgB9Ur8QOTcBDQ150K
	vLULrxmq+yPhy4JU6IHrPLYUqVgIseF2RiIVuQoIKEQ8X8Jf98ebjFylt4Qyukm6K5U+7y
	ABAALb0qutw0V8byeBML+6ImJ3pOh1c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3--wprOu8SNjiTER1NZqNFqw-1; Wed,
 03 Jun 2026 02:40:42 -0400
X-MC-Unique: -wprOu8SNjiTER1NZqNFqw-1
X-Mimecast-MFC-AGG-ID: -wprOu8SNjiTER1NZqNFqw_1780468841
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73739195608D;
	Wed,  3 Jun 2026 06:40:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24CE01966658;
	Wed,  3 Jun 2026 06:40:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7BA8D21E6742; Wed, 03 Jun 2026 08:40:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@mailo.com,
	pierrick.bouvier@oss.qualcomm.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 18/38] MAINTAINERS: Fix F: typo in "ACPI/HEST/GHES/ARM processor CPER"
Date: Wed,  3 Jun 2026 08:40:12 +0200
Message-ID: <20260603064032.3733394-19-armbru@redhat.com>
In-Reply-To: <20260603064032.3733394-1-armbru@redhat.com>
References: <20260603064032.3733394-1-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Fixes: ddd8f3baa2 (qapi/acpi-hest: add an interface to do generic CPER error injection, 2025-09-23)
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-edac@vger.kernel.org
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ad56da5ca0..815ec48686 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2233,7 +2233,7 @@ ACPI/HEST/GHES/ARM processor CPER
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

