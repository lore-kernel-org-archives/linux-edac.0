Received: from va-2-111.ptr.blmpb.com (va-2-111.ptr.blmpb.com [209.127.231.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC8B46C836
	for <linux-edac@vger.kernel.org>; Fri, 21 Aug 2026 09:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305716; cv=none; b=Vpn6jIeBpPC1xVp+PX7E30CpfbkTjHxCHtkn0/68cfAj/v4pgMFyz+/JwxSloSS1l6NGqGx45rc4+49L+ceWpb9zn7F437q6DC/8BAVDTVNjxC9cdZdQlFOeUzoXfqJ/seO009M1Qfxn94ViGJB3Zlr6aIJCLyFEq61VFaGLjtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305716; c=relaxed/simple;
	bh=oofEVVxLr6mgzoTgOP7uIro06mlSNjfSVYpM0Jc4gVk=;
	h=From:In-Reply-To:Content-Type:Cc:Subject:Message-Id:References:To:
	 Mime-Version:Date; b=mKiYdAxxhENTBhdot2iWt5NppYri6mMxlta3nSCtUZ8kBX48WE4BgPwsFCCfoOn3b5FlxYeaGAlubEwU+WOQG1YqwHZKQqI+6axnVEIPJ25Oj47rLNFu1aByiJwLblRxvLydcwJQHvSjnjme8KKhtLmW+DgPR4CA8BCwsoMur+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bMoDC9Ym; arc=none smtp.client-ip=209.127.231.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bMoDC9Ym"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787305692; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=AXx9j9m8Lc8aO7XPmh5HBF1sx0KZ+TcvBSs6HuGDW/Q=;
 b=bMoDC9YmPcS64qTuCipdpEIWMXsw4bbbebej0ISIsBd20qpId6PN6ax+DL8XEkFGIbVX8F
 BbFj1W4GFPYlOkY+gB3/xf5uiJKmFAToRbAbqahog2hroeTEXNsnFR6AsLtVyoXZshxp9h
 N4IYrAliTZcTPRMBfMluASRvd8s6Uev4sVXY+gLxFm7yRXgJC4elZoODgQ40619Oq94c/L
 XZvagAyerwYb4lhpbGds1EdAMpiqQ2kifchuQSrhdA/Cv2GAOe+oFyTUhWh391t2mX60N0
 bMlSAeRCrCpv8yfTNNvxnLy+DN30ttvElPCNZ7ZSVaYrAyBOUr3soFqWbVHavA==
X-Lms-Return-Path: <lba+26a881eda+4c2295+vger.kernel.org+qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
From: "Rui Qi" <qirui.001@bytedance.com>
In-Reply-To: <20260821094748.145394-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH 1/4] RAS/amd/fmpm: Fix out-of-bounds read in for_each_fru macro
Message-Id: <20260821094748.145394-2-qirui.001@bytedance.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
To: <Yazen.Ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
Date: Fri, 21 Aug 2026 17:47:45 +0800

The for_each_fru macro evaluates the array access "rec = fru_records[i]"
before the bounds check "i < max_nr_fru" due to the comma operator's
left-to-right evaluation order. When the loop terminates, i equals
max_nr_fru, causing fru_records[max_nr_fru] to be read before the
condition is checked.

While the garbage pointer value assigned to rec is never dereferenced
(the loop exits immediately), this is technically undefined behavior
and would be flagged by UBSan and static analyzers.

Fix by using short-circuit evaluation with && to check the bound first,
only accessing the array when i is within range:

  for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), 1); i++)

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/ras/amd/fmpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..91c49080873e 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -169,7 +169,7 @@ static unsigned int spa_nr_entries;
 static DEFINE_MUTEX(fmpm_update_mutex);
 
 #define for_each_fru(i, rec) \
-	for (i = 0; rec = fru_records[i], i < max_nr_fru; i++)
+	for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), 1); i++)
 
 static inline u32 get_fmp_len(struct fru_rec *rec)
 {
-- 
2.20.1
