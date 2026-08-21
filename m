Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508874582CC
	for <linux-edac@vger.kernel.org>; Fri, 21 Aug 2026 09:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305715; cv=none; b=BRcIE7SejFpCDdSPsSi4CMPGyRiPqFlC6pUJZY0dAwqKJWs0W9GrL1QqaqXsuT9Mw1q3QBvbPKGql7F7e/GM/KHJGkLJOkAz5AuV2sr3gbRXMpPFQhaSSSL1XPBxH/+PcHNGsmBxqfReDWWOnvVSYMhS4mn6ihms+eV5z5Sr9ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305715; c=relaxed/simple;
	bh=vveRqZFx/RxyQ7dvEOw79MWBmU54WLPqN/jhtgLsVig=;
	h=To:From:References:Content-Type:Cc:Subject:Date:Message-Id:
	 Mime-Version:In-Reply-To; b=ZGyOL2DGmWHUwV6+cQ/NJ390KgzmOK1vD0yebVz7Q8T1g7OxARAo2lRWFfonVQYITPToGGUo1FHdcYItj5doFNJdEJUlc1Bh1rD9ZLo4u+fcaqBgNogjrUx8O0rVbya6VvKXpl8XJoUFTESM1AW79ILfGBWbZBcHW+blqsgTX3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=oRaJ9Vso; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="oRaJ9Vso"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787305700; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=g/k1wLRcj/Ks0knWs5oR7rhnChhxNSotzVGGyLFePtM=;
 b=oRaJ9VsosHqSODZ2czZ7SdIzc5EXxwNipgnFO9Ftyt6SONoMa28tI2st4gpYgFZM/20U6u
 Mincol9Mn8KjYwSNIm5eFXLNndtKKvJGHKRjjM6AqsdKZt85NHAFT9O1Aw+DaVak9PuE1y
 /z4uUDQPHoB6DpD/jGeKxZZjf+V0Czn25hpEPPQQT+L5bcjCSttMMNq1a3dOPAeAJkK2/Y
 TCKEnpPfpt+SVELWGr0c48EyDUjI53kKEUDUx/MEvwjCbtbbD5y0NEMOFEUxQ0fJMhinBo
 ZgOvq1UuDGLdKdQLMUMhSR5QhLVs9snogPYKbwj403f6PkKriuQ7Gnhn+hMYhQ==
To: <Yazen.Ghannam@amd.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a881ee2+fa41ec+vger.kernel.org+qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH 2/4] RAS/amd/fmpm: Clear new records bitmap before rollback
Date: Fri, 21 Aug 2026 17:47:46 +0800
Message-Id: <20260821094748.145394-3-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260821094748.145394-1-qirui.001@bytedance.com>

save_new_records() uses a stack bitmap to track which ERST records were
created during the current initialization pass. If a later write fails,
the rollback path tests this bitmap to decide which records should be
removed again.

DECLARE_BITMAP() does not initialize stack storage, so the rollback path
can observe stale bits and attempt to clear records that were not created
by this function. Clear the bitmap before it is used so that only records
successfully written in the current pass are rolled back.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/ras/amd/fmpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 91c49080873e..0231163e2634 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -533,6 +533,8 @@ static int save_new_records(void)
 	unsigned int i;
 	int ret = 0;
 
+	bitmap_zero(new_records, FMPM_MAX_NR_FRU);
+
 	for_each_fru(i, rec) {
 		/* No need to update saved records that match the current record size. */
 		if (rec->hdr.record_length == max_rec_len)
-- 
2.20.1
