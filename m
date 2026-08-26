Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1767118C008
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 03:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716456; cv=none; b=fsI0UpAqfMJS8nB4lzWxlqwGmzBtbpTuFSPW1qOBpF50p8pcRyUn8sxUAZyEdMDbgRMPU0ZALzYtsK1T/9sFPd/CHrLNLZSGYSF3Z2buDS1fPt8RjzVEieQMo2xct/PdVaJ3WcuhUEqm7ordE78UtpweioGIX6HYixgPatm2X8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716456; c=relaxed/simple;
	bh=eyy2Z87w8WUkDbNBqXBx4Fib2Kzk0jBHrPjpnjJ2m7I=;
	h=From:Subject:Date:Message-Id:Cc:In-Reply-To:Content-Type:
	 Mime-Version:To:References; b=M5+FAODyTyYpkQLOOsl5uM7yDUQhxgjhgAXrfYTtMBAcK0s9KOKqejeLWJnubcSj4617h8S88dxkqSy7Q+tCxxUyIc8N7hkzGsUCtYkB2dSkoYe1F8BqD5DuHs4xy6aV7Vxpfi2VYNSuvZMjiwFlvX4kvfy7wNiqTrrF0Q2n8Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Wpipw/Ae; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Wpipw/Ae"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787716443; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=HdqJcOoT3zgDkOVHdBRoCSbC2PLCueacyrx6yLLDzsM=;
 b=Wpipw/Aevxrxij2TKgRm9uh2Q5ANsNLJIbpBxbNqCFBs6kOfAf3t4/1GyGITwSgFJnG7dx
 11qyEI75Kwh3GHE3aQgk4T1+ypEyrvI0Q1qfN5JpvTUvkddDcRROmy422zk08RZaR0HM9b
 uoRgnPLaU1fD1/V+CZwrS184TOeVBle87/NLlqRO4B7s2RgJh2e7npChGQbrcZYAGqbQkB
 /WaZRjJGUYb+yOJ088hYWmuuvyyQJb+YBKt7Jo6Ovl5VGmMPlRjz6E2RLVOBmxmiG/s13q
 D+N1sD0awI7G7ziDIrxrkJu9tXZb7jekbN8huHKPCMJy82sm7F0sW/0XOIVdEA==
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 4/4] RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails
Date: Wed, 26 Aug 2026 11:53:14 +0800
Message-Id: <20260826035314.1536340-5-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a8e6359+ef8050+vger.kernel.org+qirui.001@bytedance.com>
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260826035314.1536340-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: <Yazen.Ghannam@amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com> <20260826035314.1536340-1-qirui.001@bytedance.com>
X-Original-From: Rui Qi <qirui.001@bytedance.com>

When erst_get_record_id_begin() returns an error, get_saved_records()
jumps to the out_end label which unconditionally calls
erst_get_record_id_end(). This is wrong because:

- If erst_disable is true, begin() returns -ENODEV without
  incrementing the refcount. Then end() hits BUG_ON(erst_disable)
  and panics.

- If mutex_lock_interruptible() is interrupted, begin() returns
  -EINTR without incrementing the refcount. Then end() decrements
  refcount below zero, hitting BUG_ON(refcount < 0).

The comment in erst_get_record_id_end() warns that it should not be
called when erst_disable is true, so callers must not invoke it after
begin() fails.

Fix by jumping to the out label when begin() fails, skipping the
erst_get_record_id_end() call. This is safe because kfree() handles
NULL pointers.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
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
