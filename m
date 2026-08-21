Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D53E46F4B4
	for <linux-edac@vger.kernel.org>; Fri, 21 Aug 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305748; cv=none; b=cCuc3gM4dd7xgpU8qS3pnSqJEA8NEyRedMx80YHs4ndBc/HVobksVYI2h99OKyHT9do5SV5A7/gGKFwgeBa2ZnCYsDlLApYv1FacbLZbYVDvkRW+YweYveatl9SBVZQ9qw+mvRJNUmiR2b4gnirwF0wMe4FGdwDCDbEajmqAuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305748; c=relaxed/simple;
	bh=JFiLZpv6bNsWUBFWmW4Juu9Ple+T0UPfksCS7Y280MI=;
	h=Message-Id:Mime-Version:To:Date:References:Content-Type:Cc:From:
	 Subject:In-Reply-To; b=uAQZj4uLU3VkiIeSO+iZVOAqW26f61sJ+mCxYS1ZigrqhPSXiICe4Y4nScIM9Yl88r90olx3xKDAhOt7w6Zepf+ARgiIwVbdg8kILKRUXtZyu9YQOxMOV6hvv3B8ocFJNbDvxD7DmL1B50f5rBhU7iYeuIab1UsLrh+r5hyTIRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KWVOpvvw; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KWVOpvvw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787305725; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=zyVrZJ5IZx0CCZ48i4+32zgz1kVSbJppEcwWzNCanuA=;
 b=KWVOpvvwHsmQLAgO1vi44oXNCIPz2owzRyg4R92wRpJ8T8A3/xTNw5w1L0bqTd9O/A6WUQ
 US659GtCSmVK3gHyfLVtsQH9Tfdunr+YiqfLEwZpszu59oDAZo2tOsb2JXZB+Jj69LoB93
 kozm3T4ye7vifgnnncc1BAOCXs3D3XRzqlAqhOZZ+0AutTlHgcsqqbOt/HO3KAtmTiqqkV
 ItWoUAzwiBQ0cf1GMPtCKtzf+rfUmXf6OauFsB4vlrtgvfQ1pedz6fnXnR+R39R8Yj9k3X
 iF5qEjMl/Hh5K+VFVBneeq9was2WQ22h/cjtjPIB//uNmYbHSyz19aEKc3vWWQ==
Message-Id: <20260821094748.145394-5-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
To: <Yazen.Ghannam@amd.com>
Date: Fri, 21 Aug 2026 17:47:48 +0800
References: <20260821094748.145394-1-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a881efb+7442f3+vger.kernel.org+qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH 4/4] RAS/amd/fmpm: Fix spurious BUG when ERST record enumeration fails
In-Reply-To: <20260821094748.145394-1-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit

When erst_get_record_id_begin() returns an error, get_saved_records()
jumps to the out_end label which unconditionally calls
erst_get_record_id_end(). This is wrong because:

- If erst_disable is true, begin() returns -ENODEV without
  incrementing the refcount. Then end() hits BUG_ON(erst_disable)
  and panics.

- If mutex_lock_interruptible() is interrupted, begin() returns
  -EINTR without incrementing the refcount. Then end() decrements
  refcount below zero, hitting BUG_ON(refcount < 0).

The comment in erst_get_record_id_end() explicitly states that it
should not be called when erst_get_record_id_begin() failed.

Fix by adding a separate out_free label that only does kfree(),
skipping the erst_get_record_id_end() call when begin() failed.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/ras/amd/fmpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 14a103de9d62..22627f6278c0 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -675,7 +675,7 @@ static int get_saved_records(void)
 
 	ret = erst_get_record_id_begin(&pos);
 	if (ret < 0)
-		goto out_end;
+		goto out_free;
 
 	while (!erst_get_record_id_next(&pos, &record_id)) {
 		if (record_id == APEI_ERST_INVALID_RECORD_ID)
@@ -716,6 +716,7 @@ static int get_saved_records(void)
 
 out_end:
 	erst_get_record_id_end();
+out_free:
 	kfree(old);
 out:
 	return ret;
-- 
2.20.1
