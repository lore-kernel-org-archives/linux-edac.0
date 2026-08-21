Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C2C3D9541
	for <linux-edac@vger.kernel.org>; Fri, 21 Aug 2026 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305734; cv=none; b=eFUFc4bRDdZggPm7ASSzF5DbrxC6fxrGE82o+JtV1o5COfNxcUgaWMVC0BgeJmmUjMp56i8iL1ewxaif7TPFlRLC3l0w/tATBPuzRlUiED2Tw6rMZJBQaERzMO+3wqtR86Mm38s0+69GP9MO6tssZ+kxtDr+t5c5+iMp7VDjCmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305734; c=relaxed/simple;
	bh=qhA5/94/QtNSz75LoIVzwHN2FusUrji5lvaCMQVOSSo=;
	h=Mime-Version:To:From:Date:In-Reply-To:Content-Type:Cc:Subject:
	 Message-Id:References; b=icT3OvaYB1MAU+ROtVfkkNoDHMVFKNhWihUuDYFogMs3J0/DkVllJ7OQX8Pz7PZFyypG4yQ9j+I4RMeqqc8J4bNrgG7jUHPo33ZL/poQZ765DOQL5m6qJugyEOXd4KXsxX2enjfpHWiffz0/SCNy8kMuO9U8O8iVy1QKKjlF+Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=pLcV71OT; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="pLcV71OT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787305716; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=r/wUl+7sOsBV6JsvoUp2DjG+HjTf0XUxdty+gSMEJw4=;
 b=pLcV71OTBppDC78KE/lpjTQz+O1bMydmv2saBuFBoEiT3QQDIC9gOboS8tC1BvghjjzCb+
 j9PAtpY2RJYFRPRDm8Aax5rSj4UZLol0Tl7zN6cr/KE9T0aNpdBL53TRYRrDrDOLuqwSS6
 1oZSKTvXCzeBStOtpHfLf/b3psVkGSGuEQHudVnCuLWl/rzGaJ19t46aNzPXwQgS+WvFUC
 IGARYZY8SBX28TTdGCyfNvbumf56AMVN/Ym/fc3phpG5wCny/CXIuucxwuJYlMxi6BiJj4
 rsihfwTL0ZWQjzzz++7mPadng5PPKiMOD5YbrKoB1QlrTkIBU29TSHOaZPG6mg==
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.20.1
X-Lms-Return-Path: <lba+26a881ef2+314429+vger.kernel.org+qirui.001@bytedance.com>
To: <Yazen.Ghannam@amd.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Fri, 21 Aug 2026 17:47:47 +0800
In-Reply-To: <20260821094748.145394-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH 3/4] RAS/amd/fmpm: Make max_nr_entries read-only
Message-Id: <20260821094748.145394-4-qirui.001@bytedance.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>

max_nr_entries is used during module init to calculate max_rec_len.
That length determines the size of each allocated FRU record and is not
resized after init.

Leaving the parameter writable lets a later sysfs write raise the runtime
limit used by update_fru_record(), allowing entries beyond the allocated
flexible array to be written.

Expose the parameter as read-only so it can still be set at module load
time, but cannot diverge from the allocation size afterwards.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/ras/amd/fmpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 0231163e2634..14a103de9d62 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -138,7 +138,7 @@ static struct dentry *fmpm_dfs_entries;
  * No input or '0' will default to FMPM_DEFAULT_MAX_NR_ENTRIES.
  */
 static u8 max_nr_entries;
-module_param(max_nr_entries, byte, 0644);
+module_param(max_nr_entries, byte, 0444);
 MODULE_PARM_DESC(max_nr_entries,
 		 "Maximum number of memory poison descriptor entries per FRU");
 
-- 
2.20.1
