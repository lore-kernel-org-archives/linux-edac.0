Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FFB18C008
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 03:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716430; cv=none; b=dBP51oyRqr2wiYtqnSaW8KFB9o0PsUzod+ZIJg0/1QsHCu9oHU/VLjZedG0M7oWgbeP51yzyUcpwKgY5tm/r6XXZSH72vsGf3/R94z6EJ20FtQi05R7OSKVbByNsCLL9UAb2q9I9vj6SBaPGYswuynBIvEKPYOXL6PbhN+U3Zsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716430; c=relaxed/simple;
	bh=F7o6iYiWXM14elK3b9CJjeO08a68rOMb21E2Ettlrfs=;
	h=Date:Message-Id:References:Content-Type:Mime-Version:From:Subject:
	 In-Reply-To:To:Cc; b=iiKqjvaNtF+6Bibe1yIe0pFgLrxDfulkm2MpnBtGEsc2jbHzcTwLnvc9hHyULJACr//0uScaq50EC+Er/Jj7JfvPH5rN5hgYnKaoemS/oIC37nih+v6jWRLoo2FbGEOztdgxfviu8+KaPaXlOi0h5HvcraJyorPoIsEJZC+MObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=na90KsPS; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="na90KsPS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787716417; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4sJiiMHyQAi6A+lgISHh1YJNzvVJeXQrUfKmOGDcSHc=;
 b=na90KsPSvmkeSenJofZHtz5pFMYLIESlPq650/17EfEEhaG3azAoYrfncAezwsVymZMCZg
 +ReWMIqRSE+Xz6ORK5tDIvvDyOTpHL+knpcarL5rYXm4RraxCB7tl7kRr+UVlCMkAHNFEJ
 jVV8uTLXocHearYLHNDOls1Ph/iRvaPgjutvlxypHY1OurMBgz50TspLFL2qlZlWWykuJv
 dU7NH7De2QzGQZzwYQInj6WlzWHEDiP8/35UwRBVESd3wsW0tx73khBenPq7j+H64sLuIa
 dooCc0BNqQH+cas0hY7KlH35/+UX+Ue1nabuJRGs42ZyRmNHEw2eA8zClBvsCQ==
Date: Wed, 26 Aug 2026 11:53:10 +0800
X-Lms-Return-Path: <lba+26a8e6335+1f160f+vger.kernel.org+qirui.001@bytedance.com>
Message-Id: <20260826035314.1536340-1-qirui.001@bytedance.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 0/4] RAS/AMD/FMPM: Fix OOB, uninitialized data, and error-handling bugs
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260821094748.145394-1-qirui.001@bytedance.com>
To: <Yazen.Ghannam@amd.com>
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>

Hi Yazen, Borislav, Tony,

This series fixes several bugs in the AMD FRU Memory Poison Manager
driver.

Patch 1 fixes an out-of-bounds read in the for_each_fru macro caused by
the comma operator evaluating the array access before the bounds check.

Patch 2 fixes an uninitialized stack bitmap in save_new_records() that
could cause the rollback path to clear ERST records that were not created
in the current initialization pass.

Patch 3 makes the max_nr_entries module parameter read-only (0444),
preventing runtime writes that could exceed the allocated flexible array
size.

Patch 4 fixes a spurious BUG when erst_get_record_id_begin() fails,
because the error path unconditionally calls erst_get_record_id_end()
which triggers BUG_ON.

All four bugs have been present since the original introduction of the
AMD FMPM driver.

Changes since v1 [1]:
- All patches: Use RAS/AMD/FMPM: subject prefix to match existing
  convention (Yazen Ghannam)
- Patch 1: Replace UBSan with KASAN in commit message, as KASAN is the
  appropriate sanitizer for out-of-bounds memory accesses (Yazen Ghannam)
- Patch 1: Use ", true" instead of ", 1" in the for_each_fru macro to
  clearly indicate a boolean value (Yazen Ghannam)
- Patch 2: Initialize DECLARE_BITMAP at declaration with = { 0 } instead
  of calling bitmap_zero() separately (Yazen Ghannam)
- Patch 4: Fix commit message to accurately describe the comment in
  erst_get_record_id_end() (Yazen Ghannam)
- Patch 4: Simplify error path by using goto out and moving the out:
  label above kfree(old), removing the out_free label (Yazen Ghannam)

[1] https://lore.kernel.org/r/20260821094748.145394-1-qirui.001@bytedance.com

Rui Qi (4):
  RAS/AMD/FMPM: Fix out-of-bounds read in for_each_fru macro
  RAS/AMD/FMPM: Clear new records bitmap before rollback
  RAS/AMD/FMPM: Make max_nr_entries read-only
  RAS/AMD/FMPM: Fix spurious BUG when ERST record enumeration fails

 drivers/ras/amd/fmpm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--
2.20.1
