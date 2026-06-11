Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051D52D5932
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 04:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781151834; cv=none; b=KCLulEIqXiDru5Qz8oFhNf47thfhT9SgED6RQD3Ms02cLB2qRQVvsudei8Xw/bwu7VBqsgQqYQc4112nbieQngjtVKgYPgVH4MTPclmjI//OITMo8OyBAH5N2ARMeMu0NLvdykAEzZur7UFPojgzg2SqfX4Vd0IJRMYVxKYLvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781151834; c=relaxed/simple;
	bh=l4nP3i+quPjtFAjC9ePOxQMxhINSZR1rO9QYEVI7K8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6LC4jBOCOO7SjPvE0dgKMHpKLCsQx2H+JoSZhp1I1megA2WlEcaTiOezF4kiXXinC7SXB/Y7BfWqJUdxRDRCA9m5UTCzuLK6cqPUp/hlmCOXaAyQxMyHVCZnXNi6gGPo5e2PM18xwQbb4yGBmpvrJnlkF4GwDt8/dO176sKmIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6BgVgW6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6BgVgW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781151832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8D57LdqxPoD4a9j6wePWb8wwo2KDSwcsiMBMUdPpIx8=;
	b=H6BgVgW6n51CiTuU5H26NjIjXBHXkTtUI0wkRb8q41CMLf5PgARjQJit6n8GHQFhvza1+1
	jXaDz74MlwjrbKDAMMyefw26z0lirgZ3abTEfD1VHqLBSmrIFwkkly8CNPgPBYpdS2xqbV
	0ZVJpG07PvvbneB12wSKH9TYljT0OZY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-dgMv86kVMqqB3jmbO0nmzA-1; Thu,
 11 Jun 2026 00:23:47 -0400
X-MC-Unique: dgMv86kVMqqB3jmbO0nmzA-1
X-Mimecast-MFC-AGG-ID: dgMv86kVMqqB3jmbO0nmzA_1781151826
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20F12180ACE2;
	Thu, 11 Jun 2026 04:23:46 +0000 (UTC)
Received: from jsnow-thinkpadp16vgen1.westford.csb (unknown [10.22.80.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 17BC21800583;
	Thu, 11 Jun 2026 04:23:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Michael Roth <michael.roth@amd.com>,
	Eric Blake <eblake@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	linux-edac@vger.kernel.org,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 01/13] python: temporarily restrict max mypy version
Date: Thu, 11 Jun 2026 00:23:20 -0400
Message-ID: <20260611042332.482979-2-jsnow@redhat.com>
In-Reply-To: <20260611042332.482979-1-jsnow@redhat.com>
References: <20260611042332.482979-1-jsnow@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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

