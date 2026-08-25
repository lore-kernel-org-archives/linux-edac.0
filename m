Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C723FAE19;
	Tue, 25 Aug 2026 13:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665416; cv=none; b=ovXHNV6MDriijO3eNPQYC2o3AxxZjF6aW7pcDgpiJy1qIWeB7vRJnRMI21XP/gu95NWwNxU3wS9QLMid/vHbOBqvHKOKY+GLmcQA67lPlJI05/9+JU8WfgvL6khpx0MtGjr4kP4XjK6Yar8AuKkf6W44SXfN9s7t1Nn2izYYojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665416; c=relaxed/simple;
	bh=LF7c6jZmooF3Pr6lXIrNR+fGEM0XhPoSAZ83GDYUbog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EgJ6ZKvEUuN4nPGQO21/eKkGWfz5gL5e+CcFcdbB9vV/Ho1zDHOQRpCPe1hTQbA05exAzulV5lYL475iKVZnyio0JsS6jZw2/jj2uzDFWDQolpRz3lxydcYbSh3tFahipONoJUq2fSL/wetSXXxvfgX6V38Ey1flbgGCvYs6FLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=X7EjS0WK; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="X7EjS0WK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5VFyMexrLlHbTsBpNho+bXunhG55J7ETy3WG/rcEZh4=;
	b=X7EjS0WKVzZgG0VxL2H+q3QjQdaVj0S3e1oMSIhS0mD15Vl2VcaPCyfXyY1gPzIsAQTPNZJJg
	aInqRdRcRR2kAmskIzMZK1dvpmMsCDT8TQ5krbkKvHRhLp3sZYTqXTII/c25TETfzKZef2XJtp1
	+CjfF+ELDWDIrmFRVg3yhKY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4hTpdF07Skz1T4Fq;
	Tue, 25 Aug 2026 21:33:21 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 1EAB240575;
	Tue, 25 Aug 2026 21:43:30 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 21:43:29 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <jic23@kernel.org>,
	<ardb@kernel.org>, <rafael.j.wysocki@intel.com>, <guohanjun@huawei.com>,
	<mchehab+huawei@kernel.org>, <luoshengwei@huawei.com>,
	<jason@os.amperecomputing.com>, <danielf@os.amperecomputing.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <liuwenliang@huawei.com>, <yangzhuohao1@huawei.com>,
	<douzhaolei@huawei.com>, <zouyipeng@huawei.com>, <wangbing6@huawei.com>,
	<nixiaoming@huawei.com>
Subject: [PATCH v2 2/2] RAS: Fix out-of-bounds read when tracing arm_event
Date: Tue, 25 Aug 2026 21:43:23 +0800
Message-ID: <20260825134323.4181892-3-liuwenliang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825134323.4181892-1-liuwenliang@huawei.com>
References: <20260825134323.4181892-1-liuwenliang@huawei.com>
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

The vsei_len < 0 error path did not verify the pei_len and ctx_len.
When vsei_len is negative, section_length is too small to hold the
full record, yet pei_len and ctx_len were derived from
err_info_num/context_info_num and may describe regions beyond the
(long)err .. err + section_length buffer. To prevent trace_arm_event
from reading past the allocated record, sanitize the parameters:
move the cpu lookup above this path so it is available for tracing,
recalculate ctx_len and pei_len based on section_length, limit them,
set the corresponding pointers to NULL and lengths to 0  when there
is no remaining space.

pei_len and ctx_len become s32 so that the recalculated lengths can
be checked for negative values, and the cpu lookup is moved above the
section length checks so that both paths can share the final
trace_arm_event() call.

Fixes: 05954511b73e ("RAS: Report all ARM processor CPER information to userspace")

Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 drivers/ras/ras.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 2540538a16a8..4a48a897f616 100644
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
@@ -81,20 +81,31 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
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

