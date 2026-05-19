Received: from cvsmtppost105.wmail.worksmobile.com (cvsmtppost105.wmail.worksmobile.com [125.209.209.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C83E274D
	for <linux-edac@vger.kernel.org>; Tue, 19 May 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.209.209.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180720; cv=none; b=I1edSY8rVr3H7GGzU2hOxLYWAMBkVABOR7TdwvZUfgmn327DQggt25y05umP5FLR7ZVxgZxyXjSgGu7VlKJu/V/yN+EJeLQw4OgquSiD1i6LdyySTUz4pwXg/Xej+gl2nPxWT1hsaiFWrru1K5cmAjzwi99z981Nl1S3RL3TxGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180720; c=relaxed/simple;
	bh=frWGhDbN1uz99gkuwPjyN9y05vKP5LnUYNfAyBcT2Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BRGTYLmky8q8B1wKni8EBqCRRKsRnoFwwyhjtjWABCZjxD4ZDqaldpJ796lhPmJhNJB8FRBMc8ne0wCXqVs31NpZsowXQWNZ04PsINhOo6Ho4rBBqZyNvJNKxcCvFycv3EZXtk7xgQ/SQpQIdwkpXPdze0J/vFKiHFMoTsbyTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr; spf=pass smtp.mailfrom=korea.ac.kr; dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b=pmnsOeCx; dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b=CSacBjNn; arc=none smtp.client-ip=125.209.209.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=worksmobile.com header.i=@worksmobile.com header.b="pmnsOeCx";
	dkim=pass (1024-bit key) header.d=korea.ac.kr header.i=@korea.ac.kr header.b="CSacBjNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=worksmobile.com;
	s=s20171120; t=1779180716;
	bh=frWGhDbN1uz99gkuwPjyN9y05vKP5LnUYNfAyBcT2Bg=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=pmnsOeCxNtUR6or/k32etzs3aaXe7nixPntLwGtnrZnwBBpFFCAYL7EqpIcQYWHyv
	 apn5JSPyt6fg1JrQg+BbyKQktlZdFHQBJub8h7LtU6qiXqxGNYlnVoHeaFSjdobTVm
	 AjS0JoTepHJNObEwWHh7/Pe5BXYtwk6niWZ/7JxAOKX7HtH3QXioSByNGQJzea+y6M
	 jtRItTlMOXUBz45JpgEdtmNKtu2YzXt115CzhEFqYGmrd9thUFXfkgU0qdy6Kti/GG
	 1MwwRxmjQVD0aeHvOo+Y81EkVcbrJW2z4maw7A/1oHU3cRYqkKYZxs9+y7bShcze5l
	 EbCmJPkV30TBw==
Received: from cvsendbo006.wmail ([10.112.11.111])
  by cvsmtppost105.wmail.worksmobile.com with ESMTP id sg2QDZ6-Tx6t-qrpw0kiMA
  for <linux-edac@vger.kernel.org>;
  Tue, 19 May 2026 08:51:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korea.ac.kr;
	s=naverworks; t=1779180716;
	bh=frWGhDbN1uz99gkuwPjyN9y05vKP5LnUYNfAyBcT2Bg=;
	h=From:To:Subject:Date:Message-Id:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=CSacBjNnK95MSPRVok2pKkB86Y5IAN1MXqiweaLdO9kccsz26AqONJRlx20Cd9mMf
	 R9CfIVC9So8u3LKE2WsarGiLEd/SDC0rXuZmv5yNE8DfYVXAYQr4QOMfI+DuCKs09l
	 Q3O9o9uINNqpF0UNv0BUOJqjVXYwneh45mPvQ3SQ=
X-Session-ID: d8XufWlYRCSOHjmVICBs-A
X-Works-Send-Opt: EendjAIYjHm/FqM9FqJYFxMqFNwYjAg=
X-Works-Smtp-Source: eqbdKxvXFqJZ+Hm9KxK/+6E=
Received: from s2lab05.. ([163.152.163.130])
  by jvnsmtp401.gwmail.worksmobile.com with ESMTP id d8XufWlYRCSOHjmVICBs-A
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 19 May 2026 08:51:55 -0000
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS/CEC: Drop unneeded debugfs_create_*() return value checks
Date: Tue, 19 May 2026 17:51:54 +0900
Message-Id: <20260519085154.103438-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514193202.2397348-1-ingyujang25@korea.ac.kr>
References: <20260514193202.2397348-1-ingyujang25@korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_create_dir() and debugfs_create_file() return an error pointer
on failure, never NULL. Per commit ff9fb72bc077 ("debugfs: return error
values, not NULL"), callers do not need to check the return value.

Drop the dead NULL checks in create_debugfs_nodes() along with the now
unused err label and local variables. Converting them to IS_ERR()
instead would have exposed a regression: on a real debugfs failure
(notably CONFIG_DEBUG_FS=n) the function would return -1, causing
cec_init() to abort the entire CEC subsystem.

The ras_get_debugfs_root() NULL check is kept; that helper has a
NULL-returning fallback and is the legitimate "RAS debugfs root
missing" gate.

This patch supersedes an earlier proposal that converted the checks
to IS_ERR().

Link: https://lore.kernel.org/all/20260514193202.2397348-1-ingyujang25@korea.ac.kr
Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 drivers/ras/cec.c | 39 +++++++--------------------------------
 1 file changed, 7 insertions(+), 32 deletions(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c8efd..32c1be97bbd0d 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -480,7 +480,7 @@ DEFINE_SHOW_ATTRIBUTE(array);
 
 static int __init create_debugfs_nodes(void)
 {
-	struct dentry *d, *pfn, *decay, *count, *array, *dfs;
+	struct dentry *d, *dfs;
 
 	dfs = ras_get_debugfs_root();
 	if (!dfs) {
@@ -489,46 +489,21 @@ static int __init create_debugfs_nodes(void)
 	}
 
 	d = debugfs_create_dir("cec", dfs);
-	if (!d) {
-		pr_warn("Error creating cec debugfs node!\n");
-		return -1;
-	}
 
-	decay = debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
-				    &decay_interval, &decay_interval_ops);
-	if (!decay) {
-		pr_warn("Error creating decay_interval debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("decay_interval", S_IRUSR | S_IWUSR, d,
+			    &decay_interval, &decay_interval_ops);
 
-	count = debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
-				    &action_threshold, &action_threshold_ops);
-	if (!count) {
-		pr_warn("Error creating action_threshold debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("action_threshold", S_IRUSR | S_IWUSR, d,
+			    &action_threshold, &action_threshold_ops);
 
 	if (!IS_ENABLED(CONFIG_RAS_CEC_DEBUG))
 		return 0;
 
-	pfn = debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
-	if (!pfn) {
-		pr_warn("Error creating pfn debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("pfn", S_IRUSR | S_IWUSR, d, &dfs_pfn, &pfn_ops);
 
-	array = debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
-	if (!array) {
-		pr_warn("Error creating array debugfs node!\n");
-		goto err;
-	}
+	debugfs_create_file("array", S_IRUSR, d, NULL, &array_fops);
 
 	return 0;
-
-err:
-	debugfs_remove_recursive(d);
-
-	return 1;
 }
 
 static int cec_notifier(struct notifier_block *nb, unsigned long val,
-- 
2.34.1

