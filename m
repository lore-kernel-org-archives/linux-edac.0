Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D830F55B
	for <linux-edac@vger.kernel.org>; Wed, 26 Aug 2026 03:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787716431; cv=none; b=FpRO2XH/+TGc/VFN34gc+GmRKaDr5RSmMbCMyS+SnXQmbkwSKTfUQSOKAD0o5Oh+wJU144IscZ6N4olWVF0nxsqUVighd41dvdArO14JWvlJJ5VGSb8tabVBYOHqle33uu3khG4lkF5MnN+jZmqmTTlYwKIiBaaCgiLdD/Oug1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787716431; c=relaxed/simple;
	bh=LzlNA+vTYMinB+5oqKzjJDtR8oSJGlnQrdWrAfNzQCE=;
	h=Cc:Subject:Message-Id:To:From:Date:References:Mime-Version:
	 In-Reply-To:Content-Type; b=tDio0VoTEqGlG5c4DGZA22MtE2UILYFCyNuFbmKG17CAFAmEzLJ6alMcxTmFgVtyUNR9q/rs5j0ZPUmh72n5qOeHsWCaiS0kgWcr1IhOPa58b7TT3CGZOMmsb+0U+ArfnkHSDYK4PDy2efF5c5gHDiQbuu6CXqHnl31/uAZTUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LtDS4hp2; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LtDS4hp2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1787716425; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YiFsJm98mSe94RNuH7SDN6xSZlINuqUUPUSly9lgma0=;
 b=LtDS4hp2fZMn8a/9Cm498I0ijj4UIrmEwdIluQLC14/0C9EKSr6Ui4n+JCp4I0jBmQ2eBo
 0xhquZQmNqIKSnlWa+lifJRW1mYe/i0y3jtgdguVw+r/V0zUVNuBRxpcIZknMzMpDNqRQ6
 0PsKZM0zFZ+is+Vbfpvtb+xY2fuPiwcIzZaZzFUMj4VHepfy4iEKEFZYb9VwhRr/MW5buB
 cYAtijy1J1dGw2SyJqp7fkh+Dqo8XuMQrvDwewvtmdAnj+PoUact31RiDyjQmkFIUNjh0V
 4SNngzXnWm2MsSIG1vS3my09Nsj+jk0aonVMhvrDBz6OdTtpYvRNcKjmoojicw==
Cc: <tony.luck@intel.com>, <bp@alien8.de>, <linux-edac@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Rui Qi" <qirui.001@bytedance.com>
Subject: [PATCH v2 2/4] RAS/AMD/FMPM: Clear new records bitmap before rollback
Message-Id: <20260826035314.1536340-3-qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26a8e6347+72a6ae+vger.kernel.org+qirui.001@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <Yazen.Ghannam@amd.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Date: Wed, 26 Aug 2026 11:53:12 +0800
References: <20260821094748.145394-1-qirui.001@bytedance.com> <20260826035314.1536340-1-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Rui Qi <qirui.001@bytedance.com>
In-Reply-To: <20260826035314.1536340-1-qirui.001@bytedance.com>
Content-Type: text/plain; charset=UTF-8

save_new_records() uses a stack bitmap to track which ERST records were
created during the current initialization pass. If a later write fails,
the rollback path tests this bitmap to decide which records should be
removed again.

DECLARE_BITMAP() does not initialize stack storage, so the rollback path
can observe stale bits and attempt to clear records that were not created
by this function. Initialize the bitmap to zero at declaration so that
only records successfully written in the current pass are rolled back.

Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 drivers/ras/amd/fmpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 81d7f02c053d..e3f7bd053479 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -528,7 +528,7 @@ static void set_rec_fields(struct fru_rec *rec)
 
 static int save_new_records(void)
 {
-	DECLARE_BITMAP(new_records, FMPM_MAX_NR_FRU);
+	DECLARE_BITMAP(new_records, FMPM_MAX_NR_FRU) = { 0 };
 	struct fru_rec *rec;
 	unsigned int i;
 	int ret = 0;
-- 
2.20.1
