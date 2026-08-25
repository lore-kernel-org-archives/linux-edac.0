Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC240243B;
	Tue, 25 Aug 2026 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665417; cv=none; b=dVwSijPa5pFU/n7W4Gi/Yg9zlHuzufktWEIN6APgrkpFOMmHsnDv7NaNda2buaRTsXqYFJcNPYMr5rIDeNYVyLs9V96jOIj5oQJLP5Hf9EtCSDI3K2tSdDY2hFemRw3meG1pWnjOGC6a4jnvQifoLhfiVqMhr+bX0DRhmUR+eSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665417; c=relaxed/simple;
	bh=jVNaIZa9bLxDivLfIjj/ZiNsqb/MhroxqRXkcKgqT4Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZciiGjzlqX9pTUrZ1zQyfAOmh5ppdjpcC7dk377yTQmHWvGjjCS6eZTZigJ6GpHhfR+BWC4lHPVhwZoBU/mdfb8YDyypP2OogFSqrvYwelpaXhAr3qktEzJoScyOTnd5K+eAru7gpcWiJ8pGK49ErjUzbAJ+YhFn66IwZjU5SO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=XSrqkplW; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="XSrqkplW"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bRaqqAWGANWkdOhHtCUeopjLiw9W9A11sh4lWZckVYQ=;
	b=XSrqkplWPh7BKZnbUm6fFVDuJNFg3y1KZ5Dqotoydq7XIKdsY4qa8Ol3wPL2YzCXq8uzArlH6
	fy3GE6Nk8tCSWAILhVLKe1KLN7/Ut54wi+O4XSjVr6tMMabLNCbTAQH/QbMWlb+q2UWSVUm+Kac
	NSbsIpVHUqb1lrSmH+a+w8M=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hTpcn38S8zcb0T;
	Tue, 25 Aug 2026 21:32:57 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id BB49F4056D;
	Tue, 25 Aug 2026 21:43:28 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 21:43:28 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <jic23@kernel.org>,
	<ardb@kernel.org>, <rafael.j.wysocki@intel.com>, <guohanjun@huawei.com>,
	<mchehab+huawei@kernel.org>, <luoshengwei@huawei.com>,
	<jason@os.amperecomputing.com>, <danielf@os.amperecomputing.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <liuwenliang@huawei.com>, <yangzhuohao1@huawei.com>,
	<douzhaolei@huawei.com>, <zouyipeng@huawei.com>, <wangbing6@huawei.com>,
	<nixiaoming@huawei.com>
Subject: [PATCH v2 1/2] RAS: Fix inverted context info bounds check in ARM processor errors
Date: Tue, 25 Aug 2026 21:43:22 +0800
Message-ID: <20260825134323.4181892-2-liuwenliang@huawei.com>
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

Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
allocated memory") added bounds checks for malformed ARM processor
error records but contained a bug:

  In log_arm_hw_error(), the ctx_info bounds check is inverted. The
  condition `sz + (long)ctx_info - (long)err >= err->section_length`
  adds ctx_info->size when the context header is already past the end
  of the section instead of when it is within bounds. So change the
  comparison to <=.

Fixes: 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past allocated memory")

Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
---
 drivers/ras/ras.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/ras.c b/drivers/ras/ras.c
index 03df3db62334..2540538a16a8 100644
--- a/drivers/ras/ras.c
+++ b/drivers/ras/ras.c
@@ -74,7 +74,7 @@ void log_arm_hw_error(struct cper_sec_proc_arm *err, const u8 sev)
 	for (n = 0; n < err->context_info_num; n++) {
 		sz = sizeof(struct cper_arm_ctx_info);
 
-		if (sz + (long)ctx_info - (long)err >= err->section_length)
+		if (sz + (long)ctx_info - (long)err <= err->section_length)
 			sz += ctx_info->size;
 
 		ctx_info = (struct cper_arm_ctx_info *)((long)ctx_info + sz);
-- 
2.43.0

