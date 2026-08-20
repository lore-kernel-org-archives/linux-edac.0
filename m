Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F4449B3B;
	Thu, 20 Aug 2026 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787231951; cv=none; b=p9i5/wJW4DYq7pbE2dUe8MNC82U8GJsZ4i16cOM7H6neoKVy3mccGfmq2VExM384fxnQtzoHJdLejrzCwvkom0/6xxc6XAW9hKJw0XrWdeW/Y8F1iwM8P1unb2Lfq1LJ5ZYFwTsmV602Z6zVOMlOXh2NwPfvF67axq65pf1Gb3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787231951; c=relaxed/simple;
	bh=EiIrLeIC1xOWUgnkETjHfGC5dmm2JJRY1dcPgF7NKa4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=h6fz86l+C2DCEhVycLWAuAMGMc633zroDdN9CCNP/J0E+eXag1DmU2quwqcC8rbtyJkVUV6PemdKe2Dj8sJA5uq3tcla+P71PzHshR8oCiWgKZpU3JH8xpSp1d1cCenIe5KtpYYwH/MdOhxcxYogDx8pNVi/aQdvfw82IgLBuA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=AWqNMDmg; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="AWqNMDmg"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=O22NWOPC1GpD2ZOkiPxHTA/eZJKLDTPUdhnpVu3jCAY=;
	b=AWqNMDmgqTC5eeKXD+qQHj5+zMk0QNtYxiEBNhYtYygGJ357WaseMFngYfvn8jq0TLuulLkv8
	GBZgAwGlkYgcWeJNKrbXW0aldzbxSBF9XSsfBta/scJJi3Rv0kRi04A7lkHPbG52AA0p7U7S0wD
	AUlJZFBPbZ+ZhKZxjIR34jA=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hQkJj226HzmV8f;
	Thu, 20 Aug 2026 21:08:21 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 692A340572;
	Thu, 20 Aug 2026 21:19:03 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 20 Aug 2026 21:19:02 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <rafael.j.wysocki@intel.com>,
	<mchehab+huawei@kernel.org>, <ardb@kernel.org>, <jic23@kernel.org>,
	<guohanjun@huawei.com>, <linux-edac@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <yangzhuohao1@huawei.com>, <douzhaolei@huawei.com>,
	<zouyipeng@huawei.com>, <wangbing6@huawei.com>, <nixiaoming@huawei.com>,
	<liuwenliang@huawei.com>
Subject: [PATCH] RAS: Fix out-of-range section_length in ARM processor error handling
Date: Thu, 20 Aug 2026 13:18:29 +0000
Message-ID: <20260820131829.1006371-1-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf100015.china.huawei.com (7.202.181.14)

Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
allocated memory") added bounds checks for malformed ARM processor
error records but contained several bugs:

- In log_arm_hw_error(), the ctx_info bounds check is inverted. The
  condition `sz + (long)ctx_info - (long)err >= err->section_length`
  adds ctx_info->size when the context header is already past the end
  of the section instead of when it is within bounds. So change the
  comparison to <=.

- The vsei_len < 0 error path did not verify the pei_len and ctx_len.
  When vsei_len is negative, section_length is too small to hold the
  full record, yet pei_len and ctx_len were derived from
  err_info_num/context_info_num and may describe regions beyond the
  (long)err .. err + section_length buffer. To prevent trace_arm_event
  from reading past the allocated record, sanitize the parameters:
  move the cpu lookup above this path so it is available for tracing,
  recalculate ctx_len and pei_len based on section_length, limit them,
  set the corresponding pointers to NULL and lengths to 0  when there
  is no remaining space.

Fixes: 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past allocated memory")
Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 drivers/ras/ras.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..e37bf11d0926 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -58,10 +58,10 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	struct cper_arm_err_info *err_info;
 	struct cper_arm_ctx_info *ctx_info;
 	u8 *ven_err_data;
-	u32 ctx_len = 0;
+	s32 ctx_len = 0;
 	int n, sz, cpu;
 	s32 vsei_len;
-	u32 pei_len;
+	s32 pei_len;
 	u8 *pei_err, *ctx_err;
 
 	pei_len = sizeof(struct cper_arm_err_info) * err->err_info_num;
@@ -74,27 +74,37 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	for (n = 0; n < err->context_info_num; n++) {
 		sz = sizeof(struct cper_arm_ctx_info);
 
-		if (sz + (long)ctx_info - (long)err >= err->section_length)
+		if (sz + (long)ctx_info - (long)err <= err->section_length)
 			sz += ctx_info->size;
-
 		ctx_info = (struct cper_arm_ctx_info *)((long)ctx_info + sz);
 		ctx_len += sz;
 	}
 
+	cpu = GET_LOGICAL_INDEX(err->mpidr);
+	if (cpu < 0)
+		cpu = -1;
+
 	vsei_len = err->section_length - (sizeof(struct cper_sec_proc_arm) + pei_len + ctx_len);
 	if (vsei_len < 0) {
 		pr_warn(FW_BUG "section length: %d\n", err->section_length);
 		pr_warn(FW_BUG "section length is too small\n");
 		pr_warn(FW_BUG "firmware-generated error record is incorrect\n");
 		vsei_len = 0;
-	}
-	ven_err_data = (u8 *)ctx_info;
-
-	cpu = GET_LOGICAL_INDEX(err->mpidr);
-	if (cpu < 0)
-		cpu = -1;
-
-	trace_arm_event(err, pei_err, pei_len, ctx_err, ctx_len,
+		ven_err_data = NULL;
+		ctx_len = err->section_length - (sizeof(struct cper_sec_proc_arm) + pei_len);
+		if (ctx_len < 0) {
+			ctx_len = 0;
+			ctx_err = NULL;
+			pei_len = err->section_length - sizeof(struct cper_sec_proc_arm);
+			if (pei_len < 0) {
+				pei_len = 0;
+				pei_err = NULL;
+			}
+		}
+	} else
+		ven_err_data = (u8 *)ctx_info;
+
+	trace_arm_event(err, pei_err, (u32)pei_len, ctx_err, (u32)ctx_len,
 			ven_err_data, (u32)vsei_len, sev, cpu);
 }
 
-- 
2.43.0

