Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8AC1A9FA8
	for <linux-edac@vger.kernel.org>; Fri, 25 Sep 2026 03:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790305781; cv=none; b=Qi+TI3u157OBNWwfou6uIF2Vsw2gPjQoRxNTHIpLaTueOr/cXikPFrt/zH0mQCQfz3yw7tSC6S/VgP21fS4RHNfEudO/6rS8pdFRJCpebxSqeCppnhGDirCRcBzAH2662BRnvS7MUr8xl9iPI7wFx4AYULfB3dOIYF9czceMRIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790305781; c=relaxed/simple;
	bh=a8MxFJFxDe3mlXcocv+JVKuo73xbs4f0LCNXuLNDV9A=;
	h=Content-Type:Subject:Message-Id:To:Cc:Mime-Version:From:Date; b=E5EKkk8T1PdHerr8pq9vD3API4LLDnTWGIo7RXKxYFsXTp50/KNYyunK2BNPm8gEr9QClXCOXItZEOVTeQdTCNjPu9jYPlhF5k/HiSQa7vYrBIisqPFFRt4phvMlPeXbY0PwzFq6zkc4lG4wJa4fXXB1a2IC79+mrbyks/yy640=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cLTN3XXz; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cLTN3XXz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790305774; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sBU7GGQ/oj9fWAqJXQyybmelwygzgg5VcUHTnG64hC8=;
 b=cLTN3XXzldRnrAWRFK3U3vMNyHmns1oCMrlOrn8BHTZjLcUzDgE02YNm1UOz87zJhdjPw+
 T0ekjLaLOsZp22AVdqByg7+6feqmZx9dYCEgWaPd3R8lUsJh/Rxg3jahuK8BznPChWzxz8
 eLqRxWsvDSkZax8TbmaSuWjOwSL4WHffTz0ez8qZS4P9Lo6/CXzg7AIvg26+GxUGWVZ3rC
 /KlEkJY1tmiK4qxybzdG73Z/DfAR91Sw0pf24qTYtMhexVnXq09JcU4KjpCdVCj2ty78iB
 xOa+ctfTFy4C45K9Y6b1kduv8dAd4jV5Wm2nqcFxkvToe7byDlZ7lCtmHBN9cw==
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH v3] RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails
Message-Id: <20260925030918.3428029-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
To: "Yazen Ghannam" <Yazen.Ghannam@amd.com>, 
	"Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>
Cc: "Kees Cook" <kees@kernel.org>, 
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>, <muralidhara.mk@amd.com>, 
	<naveenkrishna.chatradhi@amd.com>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ab5e5ec+0fe22e+vger.kernel.org+qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Fri, 25 Sep 2026 11:09:18 +0800

When erst_get_record_id_begin() returns an error, get_saved_records()
jumps to the out_end label and unconditionally calls
erst_get_record_id_end(). But begin() only bumps the
erst_record_id_cache refcount on success, so calling end() after a
failed begin() underflows it.

This is reachable when fmpm is built as a module: if the cache lock
is contended (by pstore, erst-dbg, or apei_read_mce) and a signal
arrives, mutex_lock_interruptible() in begin() returns -EINTR without
incrementing the refcount. end() then takes the lock, decrements the
refcount below zero, and BUG_ON() fires while still holding it. The
loader dies with the mutex held, so every later ERST user blocks
indefinitely.

Built-in fmpm is not affected, since its initcall runs before
userspace and mutex_lock_interruptible() can never see a signal.

Fix it by jumping to the out label on begin() failure, skipping
erst_get_record_id_end(). kfree(old) moves to that shared label so
it still runs on every path.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
Changes in v3:
- Reword the commit message per review feedback from Yazen Ghannam.
- No code changes.

Patches 1-3 of the series are unchanged and already carry Reviewed-by
on v2; they are not resent.

Link: https://lore.kernel.org/r/20260924161746.GI1080284@yaz-khff2.amd.com

 drivers/ras/amd/fmpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index c13db1f743e5..48a437042953 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -673,7 +673,7 @@ static int get_saved_records(void)
 
 	ret = erst_get_record_id_begin(&pos);
 	if (ret < 0)
-		goto out_end;
+		goto out;
 
 	while (!erst_get_record_id_next(&pos, &record_id)) {
 		if (record_id == APEI_ERST_INVALID_RECORD_ID)
@@ -714,8 +714,8 @@ static int get_saved_records(void)
 
 out_end:
 	erst_get_record_id_end();
-	kfree(old);
 out:
+	kfree(old);
 	return ret;
 }
 
-- 
2.20.1
