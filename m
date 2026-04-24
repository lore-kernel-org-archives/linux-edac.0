Received: from sg-3-26.ptr.tlmpb.com (sg-3-26.ptr.tlmpb.com [101.45.255.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A343F6617
	for <linux-edac@vger.kernel.org>; Fri, 24 Apr 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777056612; cv=none; b=LZMOfVNCareelyvPy+hQswC55Yv5QazOW5c0VgSTqsxl9/h45ditvWulwnbbocWd807XLwBF86T8UEU8Js0I1So8j1DBNun5bbyBO/MFF5VFgFWB/0JdEmXhVlXD0yya5CZKtXEtRpyQskk4PKIGEESjTBs1wzwroMhsFeM2UTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777056612; c=relaxed/simple;
	bh=/6Pa5p+oGkpttmM/HEQnMwUagRgGFISXpAZzrdwLK/o=;
	h=To:From:Date:Mime-Version:Content-Type:Cc:Message-Id:Subject; b=jZZ2a4chNbqWHtAWP27pHrDI9nhHmnQn/+AYH9Q4DHH0My8od77UgYpJJOZi6L/h7anbA5hC15QCYhXr+Ue22n6hFVgri1DJejEOSRiNy1o2LJ8gcx+O2tOVnXxDduocCjP3+RgVSRStbSQbPPARyLLPQS7BwEW+wNw3elM/lF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=aKAKptg8; arc=none smtp.client-ip=101.45.255.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="aKAKptg8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1777056560; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=RKA/JMZYhDziL6eOGmSREqjLGYKJoQnSLzMtF2VvzKI=;
 b=aKAKptg8zulczLBNFV8RCvD7rN1+nfL0LK7P37J6YZlhxU9VpcWr0LSxEMAp60BB9cH1+f
 e5bnk83W7H3W53DF9A0oxVPgsltL8RaphR1UOhWkLdWe+2KT+6qtZ0FCvDBSr9DTw2uQ8n
 MFr3KOceVOC4RrmFZdDx5l3mVa0ztocTQef+TMHrNwIV3UPRqErpxyL6PBvIvMAFgrDqOf
 pam5DyNJofvjk/BupS/qIxc1G/UUegz3+Gj2RHiIt8xFxP+s5e9NEWBaZmuh94WM5+1bUU
 q953WJxW4ikpju5VnzXvFT79KVWj9L1zT+nUHRke7liH9oMzM1s4pIH+MzJdkA==
X-B4-Tracking: v=1; b=H4sIACC762kC/x3MSwqAMAwA0atI1gZq/eJVxEWtiQahlVZEEe9uc fkWMw9ECkIR+uyBQKdE8S6hyDOwq3ELoczJoJVuVKVrpNlYjIexG3pmnG70jpCbVpWWqdNFCan dA7Fc/3cY3/cDHjAghWcAAAA=
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>, 
	"Sai Krishna Potthuri" <sai.krishna.potthuri@amd.com>, 
	"Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>, 
	"Michal Simek" <michal.simek@amd.com>
Content-Transfer-Encoding: 7bit
X-Change-Id: 20260425-edac-stack-off-by-one-f6703cfe8213
X-Lms-Return-Path: <lba+269ebbb2e+726cef+vger.kernel.org+me@cherr.cc>
X-Mailer: b4 0.14.2
From: "Shengzhuo Wei" <me@cherr.cc>
Date: Sat, 25 Apr 2026 02:49:05 +0800
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Received: from pve.cherr ([111.42.148.227]) by smtp.feishu.cn with ESMTPS; Sat, 25 Apr 2026 02:49:18 +0800
Cc: <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, "Shengzhuo Wei" <me@cherr.cc>
Message-Id: <20260425-edac-stack-off-by-one-v1-1-4b2dd2b9c7df@cherr.cc>
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Subject: [PATCH] EDAC/xilinx: Fix stack off-by-one in debugfs UE injection handlers

Two EDAC debugfs write handlers copy up to sizeof(buf) bytes into a
fixed-size stack buffer and then unconditionally NUL-terminate it via
buf[len] = '\0'.  When userspace writes >= sizeof(buf) bytes, len
becomes sizeof(buf) and the NUL write lands 1 byte past the end of the
stack buffer.

Fix by clamping the copy length to sizeof(buf) - 1 so that the NUL
terminator is always in-bounds.

Fixes: 3bd2706c910f ("EDAC/zynqmp: Add EDAC support for Xilinx ZynqMP OCM")
Fixes: 83bf24051a60 ("EDAC/versal: Make the bit position of injected errors configurable")
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
 drivers/edac/versal_edac.c | 2 +-
 drivers/edac/zynqmp_edac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
index 5a43b5d43ca28027c829f53aea50588297484c5c..917d7d1762aa9ec9f752e8419c24fd265048ff28 100644
--- a/drivers/edac/versal_edac.c
+++ b/drivers/edac/versal_edac.c
@@ -856,7 +856,7 @@ static ssize_t inject_data_ue_store(struct file *file, const char __user *data,
 	u8 len, ue0, ue1;
 	int i, ret;
 
-	len = min_t(size_t, count, sizeof(buf));
+	len = min_t(size_t, count, sizeof(buf) - 1);
 	if (copy_from_user(buf, data, len))
 		return -EFAULT;
 
diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
index cdffc9e4194d42d4d11c5218c9f341ac46301a94..048a7b9becd622a5eeebf9c893ffdf9e163f5e9b 100644
--- a/drivers/edac/zynqmp_edac.c
+++ b/drivers/edac/zynqmp_edac.c
@@ -304,7 +304,7 @@ static ssize_t inject_ue_write(struct file *file, const char __user *data,
 	if (!data)
 		return -EFAULT;
 
-	len = min_t(size_t, count, sizeof(buf));
+	len = min_t(size_t, count, sizeof(buf) - 1);
 	if (copy_from_user(buf, data, len))
 		return -EFAULT;
 

---
base-commit: dd6c438c3e64a5ff0b5d7e78f7f9be547803ef1b
change-id: 20260425-edac-stack-off-by-one-f6703cfe8213

Best regards,
-- 
Shengzhuo Wei <me@cherr.cc>
