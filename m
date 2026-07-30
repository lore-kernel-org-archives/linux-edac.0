Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125C37CD59;
	Thu, 30 Jul 2026 02:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379778; cv=none; b=pfNGYfAa7uI/cGamyJcccaaVxs5L4fYza/YVbXmFG5Ko4Yrgo+mTYeCYvYPagWbYH9xlFWVBgV4fWMOiTkbW9HgKnXT+qmo2lt0ta4V/emMmM71ROM5FfkGQZlw7NXjy2MNB6aLCxroq5Ikblf0ev6eFcJJ/pTmWJlJd6jQm+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379778; c=relaxed/simple;
	bh=KDItziufT4P5TQRpMrJwhhqGG3SlhPZrUTb6saXdeYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3MQdDB6rPpA5oFKXYIl9aZ2NaOTY8DDHbEDjPGbBzL7HrC2OufRBAd/9YQH6aIigpTKmjc1DrMGeYSq5t+444HVNHh6Bt+Ryw+v5u7LT5LmH1ziwJI9HHMgDAw+OMKk2Z7mdaMha5UMBtm0ZLjM/t8dJWYwqbLZL5sXMJcuvck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1OaWNK3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1OaWNK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379777; x=1816915777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KDItziufT4P5TQRpMrJwhhqGG3SlhPZrUTb6saXdeYs=;
  b=O1OaWNK3L7s+uVLAs2YaPPXijB0SI+dFqvDO7J9SnJ7le4EeRnFSs5Zm
   O5nwimO1gbmYwEfpXMTbRPOE/CaqF48JjJxeM3aLzq8KggTO0YLCIl9UQ
   tl0GwiN59U2lBErkf32TTSbF/uCtnQqKkr/5rJyZWd7DNG29cWzQ0Fo7/
   ms92ETYoPCoL0cSOheaweew1TT5w0hRYqtjHr4Da2PeihxN3E87z65eAZ
   2zXl6YapAw+jk6t1AjBKQLXcchZHm8BRFUkKQxe+Y6pioQ3r76yUGZETB
   PRbZyYn401BrE05Lhladf39kYEA6PjKJa9m9Xl3yDtubpypCvd2tjQirP
   g==;
X-CSE-ConnectionGUID: pQJVlKJ8Rea800lBenYsDA==
X-CSE-MsgGUID: vcK2VMghTTCGnQtYdlmt7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103398237"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103398237"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:37 -0700
X-CSE-ConnectionGUID: nK9BQTgDQtqOHIc956/Huw==
X-CSE-MsgGUID: 2HOjXBLuS2qNJx0stYbtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240765"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:35 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 06/10] EDAC/igen6: Remove unnecessary XOR on the zero-valued interleave bit
Date: Thu, 30 Jul 2026 10:42:34 +0800
Message-ID: <20260730024238.4096623-7-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When reconstructing the removed interleave bit from an inflated memory
slice address, where a zero was inserted at the interleave bit position,
it's unnecessary to XOR this zero-valued interleave bit.

Remove this unnecessary XOR operation. No functional changes intended.

Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 12d718a50e1c..71ed50daeb19 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -448,16 +448,16 @@ static u64 mem_addr_to_sys_addr(u64 maddr)
 	return maddr;
 }
 
-static u64 mem_slice_hash(u64 addr, u64 mask, u64 hash_init, int intlv_bit)
+static u64 mem_slice_hash(u64 addr, u64 mask, u64 hash_init)
 {
+	/* The interleave bit in @addr is a zero. */
 	u64 hash_addr = addr & mask, hash = hash_init;
-	u64 intlv = (addr >> intlv_bit) & 1;
 	int i;
 
 	for (i = 6; i < 20; i++)
 		hash ^= (hash_addr >> i) & 1;
 
-	return hash ^ intlv;
+	return hash;
 }
 
 static u64 tgl_err_addr_to_mem_addr(u64 eaddr, int mc)
@@ -478,7 +478,7 @@ static u64 tgl_err_addr_to_mem_addr(u64 eaddr, int mc)
 	maddr = GET_BITFIELD(eaddr, intlv_bit, 63) << (intlv_bit + 1) |
 		GET_BITFIELD(eaddr, 0, intlv_bit - 1);
 
-	hash = mem_slice_hash(maddr, mask, mc, intlv_bit);
+	hash = mem_slice_hash(maddr, mask, mc);
 
 	return maddr | (hash << intlv_bit);
 }
-- 
2.43.0

