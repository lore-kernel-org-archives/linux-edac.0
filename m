Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427749;
	b=H3XF33Np0hFj6cCFnxVqlblJpCyzoeolpbi+PKmo2ZXvfhzsMthfRkf72zGxBdSSNzrg
	 HHDPgO80pv93/QSL7qO9JNevwL9lXDUr3FcoqfL8Rf2SjuxeWfP89JoMrmmfTD096s4up
	 uoNP9e0I9XSgIrUZ8rCd6PkpTXK6sUYUsSwRg7q/i0ZAut9o7QCL4l+TOND5tmJ5WVxnK
	 B6VcKcA6tJO0Z4yVhB6RUfiFm9oIhurnlpZbF6YJISSqQHJE0u86Uz+prL64vn02d1rnh
	 7JTMQjTblgk9kZRvD8/8OUg4KtvuQFFlpF/WvwqA/pRa7PiFwXhII2d2JlNt+mTN0/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427749;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=i5Bb6LQ0JNsmImryWzNQLJ90C7blcTOwp5oThaKLOI0=;
	b=EojpvVmIWbg4Q92sC5rEEJAHtVAcu6u7xxtlpRgFnDt8g8rE0HrN0oZt6oOXsUtis5Qt
	 ReJY3XR+4Q03SamPCPCCH94b3cCvETc+kNsncRcyEutRg2UJwJu0BPDqvVRLVyehg4FYb
	 +ssX4g/O+oWVcLzx5jqXkHAGAdx/OfrZTjt1JYb30s4DlQZVS26eIbm+t4ghlT600DaTW
	 obiT5vcYk8KtrlZhLNV770ObcMgGWwhl8zMtcUjXfUJdb4mjEubrRhASd5fg02puOkxR5
	 zSEp1J7aL5ehlILLwQPgjVP/DGimRsV98l8qxn16Q8acWEEt/WnPCYeByZxvDW//VCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KFow5d2R;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C32B606A31A;
	Mon, 23 Nov 2026 09:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C32B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=KFow5d2R
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=i5Bb6LQ0JNsmImryWzNQLJ90C7blcTOwp5oThaKLOI0=;
	b=KFow5d2RIBojVpe8IQ8W5FXByr0v16wXcBcCY8ieqhiE8AuKH+BNGrQNUeMIZFcE7WKcBPj59
	GrjEFK0tATviKN9ZaYVBiorWi7f8lv1GE31HYR22EcG8PTauKgZT7aEREEHrmB+KEnLvvbmWXAp
	YCSEo0M1AsevDvI5FMW2VBA=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jY1XH4zXsz1prmh;
	Mon, 23 Nov 2026 17:55:27 +0800 (CST)
Received: from whupemk100014.china.huawei.com (unknown [7.152.184.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 89C194056E;
	Mon, 23 Nov 2026 17:55:43 +0800 (CST)
Received: from kwepemf100015.china.huawei.com (7.202.181.14) by
 whupemk100014.china.huawei.com (7.152.184.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 17:55:42 +0800
Received: from kwepemf100015.china.huawei.com ([7.202.181.14]) by
 kwepemf100015.china.huawei.com ([7.202.181.14]) with mapi id 15.02.2562.045;
 Mon, 23 Nov 2026 17:55:42 +0800
From: "Liuwenliang (Abbott Liu)" <liuwenliang@huawei.com>
To: "tony.luck@intel.com" <tony.luck@intel.com>, "bp@alien8.de"
	<bp@alien8.de>, "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>,
	"rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "jic23@kernel.org"
	<jic23@kernel.org>, "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "danielf@os.amperecomputing.com"
	<danielf@os.amperecomputing.com>, luoshengwei <luoshengwei@huawei.com>,
	"jason@os.amperecomputing.com" <jason@os.amperecomputing.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "yangzhuohao (A)" <yangzhuohao1@huawei.com>, douzhaolei
	<douzhaolei@huawei.com>, zouyipeng <zouyipeng@huawei.com>, Wangbing
	<wangbing6@huawei.com>, Nixiaoming <nixiaoming@huawei.com>
Subject: Re: [PATCH v6 0/2] RAS: Fix ARM processor error bounds checking
Thread-Topic: [PATCH v6 0/2] RAS: Fix ARM processor error bounds checking
Thread-Index: Ad17L+za6KtM0f1WQxuNnF458ub2Yg==
Date: Mon, 23 Nov 2026 09:55:42 +0000
Message-ID: <4f5a15f093a44588bed88884e2bbe648@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

> Commit 87880af2d24e ("APEI/GHES: ARM processor Error: don't go past
> allocated memory") and commit 05954511b73e ("RAS: Report all ARM
> processor CPER information to userspace") introduced bounds checking
> for malformed ARM processor error records in log_arm_hw_error().
> However, two issues remain:
>=20
> 1. The ctx_info bounds check condition is inverted: it adds
>    ctx_info->size when the context header is already past the end of
>    the section instead of when it is within bounds.
>=20
> 2. When vsei_len < 0, the error path does not verify pei_len and
>    ctx_len. Since these are derived from err_info_num and
>    context_info_num, they may describe regions beyond the allocated
>    record, causing trace_arm_event() to read out of bounds.
>=20
> Patch 1 fixes the inverted bounds check for context info iteration.
> Patch 2 sanitizes pei_len/ctx_len/ven_err_data in the vsei_len < 0
> error path to prevent out-of-bounds reads in trace_arm_event().
>=20
> The ctx_info->size overflow (a size over 0x7fffffff making the signed
> sz negative, as reported by Hanjun Guo) is deliberately left
> unaddressed in this series: a size overflow implies a corrupted
> firmware record, and then section_length may be corrupted as well.
> For example, a real section length of 1024 could be reported as
> 16000, and the context walk can go out of bounds even without any
> size overflow. Guarding ctx_info->size alone therefore does not add
> meaningful protection.
>=20
> Changes in v6:
>   - Drop patch 3 ("RAS: Fix integer overflow in ARM processor error
>     context walk"): an overflowing ctx_info->size implies a corrupted
>     firmware record, in which case section_length may be corrupted as
>     well, and the context walk can go out of bounds even without a
>     size overflow, so guarding ctx_info->size alone does not add
>     meaningful protection.
>   - Add a note to the patch 1 commit message with the same
>     reasoning, as cover letters are not preserved in git history.
>   - No code changes in this version.
>=20
> Changes in v5:
>   - Collect Reviewed-by tags from Hanjun Guo for patches 1 and 2.
>   - Added comments to patch 3.
>   - No code changes in this version.
>=20
> Changes in v4:
>   - Remove the empty line between the Fixes: and Signed-off-by: tags
>     in patches 1 and 2, per Hanjun Guo's comments.
>   - Add braces around the else branch that assigns ven_err_data in
>     patch 2, as suggested by Hanjun Guo.
>   - Add new patch 3 to check each context entry with 64-bit
>     arithmetic and stop the walk at the first entry that does not fit
>     in the section, so a ctx_info->size over 0x7fffffff cannot
>     overflow the signed int sz and walk ctx_info past the section,
>     addressing Hanjun Guo's overflow comment.
>=20
> Changes in v3:
>   - There was no change, and the email was sent by mistake.
>=20
> Changes in v2:
>   - Split the original single patch into two separate patches, one
>     for each distinct fix, to ease review and backporting.
>=20
> v5:
>   RAS: Fix ARM processor error bounds checking
>   https://lore.kernel.org/all/20260921080337.3000957-1-liuwenliang@huawei=
.com/
>=20
> v4:
>   RAS: Fix ARM processor error bounds checking
>   https://lore.kernel.org/all/20260909112832.805314-1-liuwenliang@huawei.=
com/
>=20
> v2:
>   RAS: Fix ARM processor error bounds checking
>   https://lore.kernel.org/all/20260825134323.4181892-1-liuwenliang@huawei=
.com/
>=20
> v1:
>   RAS: Fix out-of-range section_length in ARM processor error handling
>   https://lore.kernel.org/all/20260820131829.1006371-1-liuwenliang@huawei=
.com/
>=20
> Abbott Liu (2):
>   RAS: Fix inverted context info bounds check in ARM processor errors
>   RAS: Fix out-of-bounds read when tracing arm_event
>=20
>  drivers/ras/ras.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.43.0
>

Hi,
Friendly ping on these patches in v6 versions:
https://lore.kernel.org/all/20261012131140.1526599-1-liuwenliang@huawei.com=
/

Please let me know if there is anything inappropriate in the patch
or if it is ready to be applied to the tree.

Best regards,
Abbott Liu
