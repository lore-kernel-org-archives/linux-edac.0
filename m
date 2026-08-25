Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC47048124D;
	Tue, 25 Aug 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665416; cv=none; b=MVPi7rY17a8F1gxoOtNpZLD71Ij9415A1qeEe/c0FKev682R7dz7Qf0cgG6TXemEuMrAglBvtngW0CNpHjbvnGaRP5ha+CUpSeP/CDEfWQtPfg7MrHiUITntE7yBi5zUspa1xZCNv2Ro1gsGeCdYFFUYfd+Zj5b4gmjHk+fhQuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665416; c=relaxed/simple;
	bh=eyKxPi7YIFTnwrxtrSRnbs+Rik5A+D/pWIUN1VLbqZQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NkuywlqL5AGhsEpIj0nR7UDhwYsR1x112kvhR6tla/vkNYsmeO5u5ssWVrWfFPboDPsgMtQW51qn+5T8ZyrX0pxMTjlMbIY0LRMEGH7ViLkD8UVviXevYHfcBn69uNnnZU8RDO1Ng4x5GOXXSiAE/o1LVY0ZFfKxsRoRe71Bw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=uC+6+UKQ; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="uC+6+UKQ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=n3iNdMKWmwiU+jsEp25v9YDtwau7exIa2e79SzMyFB8=;
	b=uC+6+UKQ+MVNaoAZZQeI2EHNVkny6x9krrGn00Yk6xcDBrD0LEoW737whS0S6kprE61ATbGLg
	3MHsC+0GOr3TMLZCPcdhGQwto+MbnMIS07XsrUwLy7XRPpTHDRRAv4F3gWRChumKQzWAA3GJFG+
	IAAzzReNrgbvY/kepQVxW14=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4hTpc42kX6zpSvB;
	Tue, 25 Aug 2026 21:32:20 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (unknown [7.202.181.14])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A0614057F;
	Tue, 25 Aug 2026 21:43:27 +0800 (CST)
Received: from dggphicprd10024.huawei.com (10.243.6.112) by
 kwepemf100015.china.huawei.com (7.202.181.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 21:43:26 +0800
From: Abbott Liu <liuwenliang@huawei.com>
To: <tony.luck@intel.com>, <bp@alien8.de>, <jic23@kernel.org>,
	<ardb@kernel.org>, <rafael.j.wysocki@intel.com>, <guohanjun@huawei.com>,
	<mchehab+huawei@kernel.org>, <luoshengwei@huawei.com>,
	<jason@os.amperecomputing.com>, <danielf@os.amperecomputing.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <liuwenliang@huawei.com>, <yangzhuohao1@huawei.com>,
	<douzhaolei@huawei.com>, <zouyipeng@huawei.com>, <wangbing6@huawei.com>,
	<nixiaoming@huawei.com>
Subject: [PATCH v2 0/2] RAS: Fix ARM processor error bounds checking
Date: Tue, 25 Aug 2026 21:43:21 +0800
Message-ID: <20260825134323.4181892-1-liuwenliang@huawei.com>
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
allocated memory") and commit 05954511b73e ("RAS: Report all ARM
processor CPER information to userspace") introduced bounds checking
for malformed ARM processor error records in log_arm_hw_error().
However, two issues remain:

1. The ctx_info bounds check condition is inverted: it adds
   ctx_info->size when the context header is already past the end of
   the section instead of when it is within bounds.

2. When vsei_len < 0, the error path does not verify pei_len and
   ctx_len. Since these are derived from err_info_num and
   context_info_num, they may describe regions beyond the allocated
   record, causing trace_arm_event() to read out of bounds.

Patch 1 fixes the inverted bounds check for context info iteration.
Patch 2 sanitizes pei_len/ctx_len/ven_err_data in the vsei_len < 0
error path to prevent out-of-bounds reads in trace_arm_event().

Changes in v2:
  - Split the original single patch into two separate patches, one
    for each distinct fix, to ease review and backporting.

v1:
  RAS: Fix out-of-range section_length in ARM processor error handling
  https://lore.kernel.org/all/20260820131829.1006371-1-liuwenliang@huawei.com/

Abbott Liu (2):
  RAS: Fix inverted context info bounds check in ARM processor errors
  RAS: Fix out-of-bounds read when tracing arm_event

 drivers/ras/ras.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

-- 
2.43.0

