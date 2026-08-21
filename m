Received: from va-2-115.ptr.blmpb.com (va-2-115.ptr.blmpb.com [209.127.231.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4003D903C
	for <linux-edac@vger.kernel.org>; Fri, 21 Aug 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305703; cv=none; b=S3CsYke3pJLNWqckRlLazNbV7sZ3APaKmLGs6wWzo5Dto6ONOI4asj7QZTO360mmQw9KdDX8OJAfReA6BRldGApGhMQ5KIqM74cAqYyqF+uEbdWbjS2QfqO7M6vCMFbNpeGOA2E5VfVuqEgqknFLwIJ1ax/aBr3HNbF7BQF4Br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305703; c=relaxed/simple;
	bh=LIXahCQDdJh8gUi74r/Zb7fUPZ/ku8bc1h2P37wsHEw=;
	h=Content-Type:Cc:Date:Mime-Version:To:From:Subject:Message-Id; b=bVd55bF2oAMTcl8kaISTP4GDESE30B6Uga4u68jvZXEDkS/W/OVwMMeJ0jZ+weGSCULbvi4zoAcEupdzhoD8hkVpsbsrIMVSE/xWd/UXNbySIFKsApqipNegPR5zY1s+pTLOWShaqCuwiS3wmjMB2OayxDi7dDSgKkwAQQBEYLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DAHvdeUG; arc=none smtp.client-ip=209.127.231.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DAHvdeUG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787305683; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=EZy1oEn54YulaKvYYKL5HrgxeCTcb5+YDy8KRfuaPcY=;
 b=DAHvdeUGYo0wZyCr1wZciAruY0zyFnXe/2lc/tH9Dklbi6csGoaPA4SHhGHze1MOra9woZ
 +U5l3GvolvrvLP4o8VXGjPSsOCJw2tFvGWdjfCDyh3lRpOorrCU3a88MC2piSZB+t5E8+h
 pBM6ZeG0vDW86M8g0/WHfQ72na9p4tKaJZND/EnPE9WLra/ya3GGn6DxuGNFt1T05qAq4a
 N9wWAnaew68GEe6t2iDbMs3SLREC8pIgPlYH9qCtDaIcFtX5qQ9HFbYLHG1BH2T67YsC83
 UYfeQzwQfcueRgD2Yr9POr2TG7k2zm5wsFt4iPUNQ+RsgGZu0gfqX7S7CgSiEw==
X-Original-From: Rui Qi <qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Date: Fri, 21 Aug 2026 17:47:44 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
To: <Yazen.Ghannam@amd.com>
X-Lms-Return-Path: <lba+26a881ed1+011ecf+vger.kernel.org+qirui.001@bytedance.com>
From: "Rui Qi" <qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Subject: [PATCH 0/4] RAS/amd/fmpm: Fix OOB, uninitialized data, and error-handling bugs
Message-Id: <20260821094748.145394-1-qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit

Hi Yazen, Borislav, Tony,

This series fixes several bugs in the AMD FRU Memory Poison Manager
driver.

Patch 1 fixes an out-of-bounds read in the for_each_fru macro caused by
the comma operator evaluating the array access before the bounds check.
This is technically undefined behavior and would be flagged by UBSan.

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

Rui Qi (4):
  RAS/amd/fmpm: Fix out-of-bounds read in for_each_fru macro
  RAS/amd/fmpm: Clear new records bitmap before rollback
  RAS/amd/fmpm: Make max_nr_entries read-only
  RAS/amd/fmpm: Fix spurious BUG when ERST record enumeration fails

 drivers/ras/amd/fmpm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

--
2.20.1
