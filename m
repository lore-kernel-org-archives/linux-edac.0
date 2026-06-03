Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B353E51C6
	for <linux-edac@vger.kernel.org>; Wed,  3 Jun 2026 03:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456942; cv=none; b=W4GrceLoBx94HJQkSbv39u8AqsnjPxnoMqFw5nF8kEEtlZoW8f3SDdsw2kT3lnt7WIdUAT/H53AWhRHo4T1xZODda05J65t54R9VUzcJuVKXWbx2ynuC6RIHTMiZ6695KwXKdaYvLWH526bDMeSVh3dx9Vuy3b9pU5Mg9yC2y1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456942; c=relaxed/simple;
	bh=l4nP3i+quPjtFAjC9ePOxQMxhINSZR1rO9QYEVI7K8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgYPbFB+pTYXBQk4Hy/em+Qk+Jhcy9aDIuEwrxA10AUUIBX5Jon/+Q5PkeFbeMuu481TTVMdY8bkCpFbbq6Rbg3u0TCAphS0wfvMaUyfR8dum7VqbPDCgwTqfrxHKrWaaEmrS/Nf/U6LR072bI4cQa0zviFocI4U1SogdP950yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGHD7m8l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGHD7m8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780456940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8D57LdqxPoD4a9j6wePWb8wwo2KDSwcsiMBMUdPpIx8=;
	b=MGHD7m8lX9rUHYnikf2s5sOgSEMG82A8Aeg+etDVR9sNXojZ8wCGmG9vPZSmoan//dp+2Y
	92vOFQhBHjwvq3CQNXY8gK32TIJ8rZ/k6IdHsOgzAdhjd3csaViLQqiviPJZpW/daqHd9A
	JEOCTkWjuv0uJ3bbpwisFB+bHRDF9Ws=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-39-OjFNwjwaOg-Fpby1I_pYfA-1; Tue,
 02 Jun 2026 23:22:14 -0400
X-MC-Unique: OjFNwjwaOg-Fpby1I_pYfA-1
X-Mimecast-MFC-AGG-ID: OjFNwjwaOg-Fpby1I_pYfA_1780456933
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECD36180123B;
	Wed,  3 Jun 2026 03:22:12 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.64.74])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 335353000203;
	Wed,  3 Jun 2026 03:22:08 +0000 (UTC)
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
Subject: [PATCH v3 01/16] python: temporarily restrict max mypy version
Date: Tue,  2 Jun 2026 23:21:46 -0400
Message-ID: <20260603032201.993015-2-jsnow@redhat.com>
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

The newest versions of mypy do not support targeting Python 3.9, which
we still support. I want to address that soon, but in the meantime
it's nice if the tests pass.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index 80975933971..ad4121a58d8 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -40,7 +40,8 @@ devel =
     flake8 >= 5.0.4
     fusepy >= 2.0.4
     isort >= 5.6.0
-    mypy >= 1.4.0
+    # Max ver is temporary until we drop 3.9
+    mypy >= 1.4.0, <2.0.0
     pylint >= 2.17.3
     pylint != 3.2.4; python_version<"3.9"
     pytest >= 6.0.2
-- 
2.54.0

