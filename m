Received: from cvsmtppost102.wmail.worksmobile.com (cvsmtppost102.wmail.worksmobile.com [125.209.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8373358B6
	for <linux-edac@vger.kernel.org>; Thu, 14 May 2026 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.209.209.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787128; cv=none; b=AGXd4hqxKyQfJGEtMDv6ic9mcqMgnKhn1F/WeCs2x8iblBfNy0Ektft9z9jFE2thYPXt7nu/SIj6WfCsvE31YhNV6/ItFPw1HVXbcWZ3VJtYFAwxVZLSReqEZ9belVqEFLE4GnlXg/ZfN15t4dS4Qg6u+pak9jFe83rb4KaLhmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787128; c=relaxed/simple;
	bh=RP38EchosiNHgV4BdOwCZ+a6oc5IlJykGsySFoHEzwU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fr7ut+9vCGiZUo9DpukM5vTCgIieUGt20t0k6hZFaaPJElM1qD++k5t3aZKR8TAxc44EVL+Xd4khp0kgKCHvBff6IE5NV/Fg1m1FRMooaeyK+tBY8baFcX9+gwnV4txU/jb99e+LYeruhmbMPgsSWA8wUprLLEYUXLu3udAO/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b=ods6m7sw; dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=PReYooWH; arc=none smtp.client-ip=125.209.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b="ods6m7sw";
	dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="PReYooWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1778787123;
	bh=RP38EchosiNHgV4BdOwCZ+a6oc5IlJykGsySFoHEzwU=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ods6m7swygEJDKK7sXIeQG7rYmEP0QALnfVedcNVL5FNzcI3jrai9oXgLvQoX9I4H
	 x9WBScFLb8HD+GvDfWL5XvLHSijZNxeY91oBMhr26Y6KSjyJdvPf+O4LS5pmc5xMRH
	 Nmra/wg/p3eCWVdLwpQ9riZqJry212plKAqqDtDbycPI9uABtunGwQyElPqbgthbMl
	 lObPX+QgPg/ZdPNTer0dREqjCZDPiWW5Ruwpfu8hp73TcTh9nppTreC9wlyduc3PEd
	 cU04ldIENqNgHSLjo4o1buVwB6dL8AIFvoPAtYh+X2n+oTgo2b7vC2YVg7GALZ1ZfA
	 93SuPXYCrNf0w==
Received: from cvsendbo001.wmail ([10.113.20.163])
  by cvsmtppost102.wmail.worksmobile.com with ESMTP id jGDBC8xOQvaMsfyGh8cUPg
  for <linux-edac@vger.kernel.org>;
  Thu, 14 May 2026 19:32:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1778787123;
	bh=RP38EchosiNHgV4BdOwCZ+a6oc5IlJykGsySFoHEzwU=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=PReYooWHTAO49tLVlA4sJA+qHvRTDNWYYTqcb083aOp36fGT/PkUWnl8cP+rLm15O
	 Su5LekgbxugGC1OYHOueIbpefeu+VVUnvNANOYJwKIDnc8UBLGEfB45UAJ2EUYW1et
	 fu1/5tWLzBK3qRuw3Xjt+LPwqb+Tf9t7T0dfj3Kw=
X-Session-ID: Gp5PzMqiSuSAIJbb7qdSZQ
X-Works-Send-Opt: EendjAIYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: AqK9Fq2XFqJZ+HmqKobd+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp402.gwmail.worksmobile.com with ESMTP id Gp5PzMqiSuSAIJbb7qdSZQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Thu, 14 May 2026 19:32:03 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS/CEC: Use IS_ERR() checks in create_debugfs_nodes()
Date: Fri, 15 May 2026 04:32:02 +0900
Message-Id: <20260514193202.2397348-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_create_dir() and debugfs_create_file() return an error pointer
on failure, never NULL, so the NULL checks in create_debugfs_nodes()
are unreachable and the dedicated error paths cannot run.

Replace each NULL check with an IS_ERR() check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 drivers/ras/cec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c8efd..253aa734f05ff 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -489,21 +489,21 @@ static int __init create_debugfs_nodes(void)
 	}
 
 	d = debugfs_create_dir("cec", dfs);
-	if (!d) {
+	if (IS_ERR(d)) {
 		pr_warn("Error creating cec debugfs node!\n");
 		return -1;
 	}
 
 	decay = debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
 				    &decay_interval, &decay_interval_ops);
-	if (!decay) {
+	if (IS_ERR(decay)) {
 		pr_warn("Error creating decay_interval debugfs node!\n");
 		goto err;
 	}
 
 	count = debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
 				    &action_threshold, &action_threshold_ops);
-	if (!count) {
+	if (IS_ERR(count)) {
 		pr_warn("Error creating action_threshold debugfs node!\n");
 		goto err;
 	}
@@ -512,13 +512,13 @@ static int __init create_debugfs_nodes(void)
 		return 0;
 
 	pfn = debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
-	if (!pfn) {
+	if (IS_ERR(pfn)) {
 		pr_warn("Error creating pfn debugfs node!\n");
 		goto err;
 	}
 
 	array = debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
-	if (!array) {
+	if (IS_ERR(array)) {
 		pr_warn("Error creating array debugfs node!\n");
 		goto err;
 	}
-- 
2.34.1

