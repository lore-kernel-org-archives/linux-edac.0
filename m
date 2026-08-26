Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878B32C3757
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 03:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716442; cv=none; b=Y/wejNn2ttOPjmoaum4LRBdNg+jAKhlfSiRlllJtVXdng57MJEZr++PJuvAW60EeX433lYWiikZ6XNudAcdbjRBcghFAd3XelN/9cnassHc3vvTXzdB+R1E42HufgJKI9EQJvj7SIr0Je7NsyJB/jjSVCNB8ZBj6g1e1vzwpvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716442; c=relaxed/simple;
	bh=Eo/jSTkhSXYGsAXzzJb97akxKG79oMYaZwIRXS+sp3Y=;
	h=To:From:Subject:Date:Cc:Message-Id:Content-Type:Mime-Version:
	 References:In-Reply-To; b=giPQbYUK3dS9bP7b1CqNOSleNA9Pl4v+FVpTO0Iv+PJh9MuoRs2VHkwbR3K9DkcUR9dXWkv/7hx0lCafgUnqMec8z4799zPizVxSA1lykCOUJHxKDR1Vin1Z1jIdWCYMcR1D8E9aD2eQOpPVxVA84YnVK6Ft8ph1gjQUcbpjVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UXCRWmCI; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UXCRWmCI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787716434; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=tYTS7ob5V3gZ1fuo9ohaWTruH7XTJOLasgUxqkVxVJg=;
 b=UXCRWmCI8SvD63Iyvjjt9TxvO6KUH/a3yxoLt5p45K8rQp107LUGRAoZXtpO+sR62/O9tz
 6A3Zz+7rcAD6ohbHNWrRm/gli24VroH3aP4+hYK4Ukfi1jdExLrc/iHRcULTL5xIZZMmhJ
 PtzyKK65/iqRVq+7V4WNBLsXvVciyrQxkILJZm4n5vEroh25EC7t+xEacoUez3gxcZWJv3
 jfWCNqQWUO3+4VzZaSfmuXjJTVac34qQK5GP7WuC8CZ/xZE/Ql8GUrhP/ZZ83qY2ZFQrLa
 cx2BGyWnxZsc5h5LdJaV5LjAWeIwDaIPLd1XwLNyG91yz6et0yhAXylp/3cXTA==
To: <Yazen.Ghannam@amd.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 3/4] RAS/AMD/FMPM: Make max_nr_entries read-only
Date: Wed, 26 Aug 2026 11:53:13 +0800
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <20260826035314.1536340-4-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a8e6350+996a4e+vger.kernel.org+qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260821094748.145394-1-qirui.001@bytedance.com> <20260826035314.1536340-1-qirui.001@bytedance.com>
In-Reply-To: <20260826035314.1536340-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1

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
index e3f7bd053479..c13db1f743e5 100644
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
