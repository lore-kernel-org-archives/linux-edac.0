Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037032DC357
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 03:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716430; cv=none; b=f4WPTvQZoc+R/jE2EMidtvkl5bF+hBWapI9loKZjgMZC8OiRQdp/vI0URhiFPVHgZOuk3Ux8VT2a77lvHPeK4psBz5f3uL/l+/doEnQkMfOybovdejBZqV4NZhG6+IM7yowGmnueu8REgY5nSG2DtpvqRdZS11DpRNZyBF5i6Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716430; c=relaxed/simple;
	bh=XIhRMq2clZ19aR6ASYiRZB8iIkryXIMbTdHMER7D0pE=;
	h=To:Cc:Mime-Version:Date:In-Reply-To:References:Content-Type:From:
	 Subject:Message-Id; b=Sv0v9EBlkAKjs5/6kz4i36KZV73lIKTvRYeDWSwDLAoMXIVZon7bGeQxzIrjBOzQTXkG42ivkq42AnSebAH+JWmlvkH5TLGQHkW+M3cjPfOFbaPYEetOcsz2fib5OBsZEmCrthaZoH20h3OfW1upRedzPf7RbKUU5KHAIbh013c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=amta/Prz; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="amta/Prz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787716416; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=hXQ2RGC+EMz7OMTzABp+Wr7+AqgogaxAooS9n7iKBww=;
 b=amta/PrzM9x40jE5GOuQkwT1cE5pvyPBfABwLPoTFk7kIbqnweXZKbVVMK0QrBMVmpjtr5
 d9v9uveG9he0dplzHXvzPyDVVOIaNupkSaSwrgdIdNyfiKrFbi4g10LfO5In9n9IYDSiwa
 FtTgg30+5zuu6JBLqWR42hqHTI3PVLFfqWBiZsNkyKyXr9iwqVn15BFIP/zFdL/aeS1G92
 RzcdXF5G/UsvhpSCsNH/cOqPPBmR1AG4sOs9zseM0FJ0KxGfmprOooMV0FhIV2v/RV/YuQ
 zLjfRs9N+6zvqNUR9A871rbnQQJgFP3JjE6Xt4rHuumLIEwCA5LLw8Mn0pj/Zw==
To: <Yazen.Ghannam@amd.com>
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a8e633f+62056d+vger.kernel.org+qirui.001@bytedance.com>
Date: Wed, 26 Aug 2026 11:53:11 +0800
In-Reply-To: <20260826035314.1536340-1-qirui.001@bytedance.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com> <20260826035314.1536340-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 1/4] RAS/AMD/FMPM: Fix out-of-bounds read in for_each_fru macro
Message-Id: <20260826035314.1536340-2-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit

The for_each_fru macro evaluates the array access "rec = fru_records[i]"
before the bounds check "i < max_nr_fru" due to the comma operator's
left-to-right evaluation order. When the loop terminates, i equals
max_nr_fru, causing fru_records[max_nr_fru] to be read before the
condition is checked.

While the garbage pointer value assigned to rec is never dereferenced
(the loop exits immediately), this is technically undefined behavior
and would be flagged by KASAN and static analyzers.

Fix by using short-circuit evaluation with && to check the bound first,
only accessing the array when i is within range:

  for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), true); i++)

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/ras/amd/fmpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 4ccaaf7b70bf..81d7f02c053d 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -169,7 +169,7 @@ static unsigned int spa_nr_entries;
 static DEFINE_MUTEX(fmpm_update_mutex);
 
 #define for_each_fru(i, rec) \
-	for (i = 0; rec = fru_records[i], i < max_nr_fru; i++)
+	for (i = 0; i < max_nr_fru && ((rec = fru_records[i]), true); i++)
 
 static inline u32 get_fmp_len(struct fru_rec *rec)
 {
-- 
2.20.1
