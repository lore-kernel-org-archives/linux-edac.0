Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30A35CB6F
	for <linux-edac@vger.kernel.org>; Thu, 26 Mar 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774516458; cv=none; b=gP2mWi1H2wxocpM8+CW1kFpN8Xnj5+cvW9cPqle9LSxWDl5hcpZQ3kXdSQJH3G/PWzfbmOXF61YRDEQIq+kZw9s2qWPu4Q/5ZkGVJ/9Z8aQati0ENogzN0V6kRYzOqzecTh0KA/x+sHu7em1Jg/VnxKnTL9lwuBDEBRJ/xgpsOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774516458; c=relaxed/simple;
	bh=+WPzH9j3aRke3bddKjSnhST7mOFYpgrQnUPnG3BsoCI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=GLN6rc2qDxlt46YMQR19lXnhLfPh/JUinTVXaQ9urZO8nVws5sBZonr82YmWNPAFxB164Tp8OvIjy1KWV/sd3IrhasMh1ESPmh/pp9Uan9/CyIVI7eH8cEzKTAgjBR7/vnDeU52xrgOgw+G30t0SeYPtTbyxZqCVerh20dNDoPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=S8jz+c6c; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="S8jz+c6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1774516448;
	bh=tw0dRETnlD5CJRFHraQhsnRQO1XhcxDirBjwTYmT/eM=;
	h=From:To:Cc:Subject:Date;
	b=S8jz+c6c6GI3NVaiVoX7WUNTTDUI2oyBFflTBXuV3YWXjBGlx9ZCK6B1X/uQfN8Vb
	 lQyqquTD76CAYBOszgfCDGFr9ALpKb0e2NQZ6ROos0/bowOzzf36LH3s/I9zHXBAE9
	 yBS5Teyxk3nT49p2nNiOUOeortXPtGa/qfpJqJtA=
Received: from K6J6K61M47.bytedance.net ([123.157.157.69])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 38585E47; Thu, 26 Mar 2026 17:14:05 +0800
X-QQ-mid: xmsmtpt1774516445tjpxwzhun
Message-ID: <tencent_2A0CC835A18366643CBD2865B169948AB409@qq.com>
X-QQ-XMAILINFO: NmYPxqSo4aXvE38EQSC2bGH/hy1cKP95dY2mDWX90DVMZ6HCaFHhM9PFaLRdDl
	 lq0+oJlGREZSippoixGRruKaPkdpdbJbrAlDdSNtY/YikLTGInrvyfVjGjXDfSffcsK56mN1zd+v
	 i2WjSC4ldmruP5/OlZ8eUUfcA9wC192DV8sqyzxT/vUwY5MQQ6hDWMiKk3CCM8pfQ5bG+oWGCeZc
	 E/Eh4aTJY3ZibL0baPFtR/X0SQzCNDjp+LmDXUMDtDcLJm6j2414nm/blFKgtxH801j7PJDLFUfS
	 Upr+LSQvPs75pRKdwV/+AjTfhzxSngBqs7X1ia7oL76GoAAM9/pqGq2+ufZZg8sdctZ3w12/UGbG
	 +H6cQ8n5YOLYpvwaVeHaY1VtkdiNjiSM2DbrnWgz6xt3VbXsUh79R/qO6OvN66sL2WWo7UKSRjMw
	 9g1H9he16FHdoUpnD7YlesBYi9E6J2DlcuGUOuMeVcOn9cxFQoU5UC61mw+FfLZ6oGvEyY3JE6zO
	 UGI7pQsAelo/nMfzIoL4AfMMNQWtS0mSekEjaCGxe21i3seCGsm1AANVK7ShtZjtHn+1Ckx4IiPj
	 HyNBcMq/8og+6pFtNUF7SI8SFaQXfvYo1WqItagciRGRWMxIr4Wjz4RdStGwgfhyro+63soqC0kP
	 61hpYby43AuwG4rEb2sTthanCv9Hob/xENA1asJ8koNB3T+COWABaA336kFuzegqeCk73CQRYAD6
	 exbbbh7ZsJKmycPqT6wwpsglVQbr91rXBB29hXaOnPxOE97ADj3UFk9j2kNcB2o1UWbuyr1JOXie
	 fLh7DR1UW++aiWGW59eRISiGIgUwGYApE+whDPsDXbEEJkSvwds/khkXBIZTmgkAB5fG+//M/a2r
	 84P4AZ/vVZLK5+3u/UTB0AS22EWiLRd7p3Vv4VMdDdqubKs9TEHvhgmB7WgH18Xu8jsceChhRSuh
	 alictE6L+AwBuZE83NLQ59XfHaZF2LxPxt6vhxzHG00dABpCNB+O7Y/CpAXO+5A5mdG6JH29gcGk
	 xO3kwHoZeYyUKeSthAyUg9aOgmq2cTmz7GnaxwMZljtaurmnr/QNhqxr3jw8eHV2rEKo4vYxQhm7
	 s/oXR4oTRTQfiFvx0xSmra89166K9MQxl8/VAt
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: zhoumin <teczm@foxmail.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: teczm@foxmail.com,
	linux-edac@vger.kernel.org
Subject: [PATCH] EDAC/{skx_common,skx}: Fix UBSAN shift-out-of-bounds in skx_get_dimm_info
Date: Thu, 26 Mar 2026 17:14:03 +0800
X-OQ-MSGID: <20260326091403.85729-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the skx_get_dimm_attr() helper returns -EINVAL,
skx_get_dimm_info() does not validate these return values before using
them in a shift operation:

    size = ((1ull << (rows + cols + ranks)) * banks) >> (20 - 3);

If all three values are -22, the shift exponent becomes -66, triggering
a UBSAN shift-out-of-bounds error:

    UBSAN: shift-out-of-bounds in drivers/edac/skx_common.c
    shift exponent -66 is negative

Fixes: 479f58dda25b ("EDAC, skx_common: Separate common code out from skx_edac")

Signed-off-by: zhoumin <teczm@foxmail.com>
---
 drivers/edac/skx_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/edac/skx_common.c b/drivers/edac/skx_common.c
index a9557c8344bc..f15de0ea96c8 100644
--- a/drivers/edac/skx_common.c
+++ b/drivers/edac/skx_common.c
@@ -466,6 +466,9 @@ int skx_get_dimm_info(u32 mtr, u32 mcmtr, u32 amap, struct dimm_info *dimm,
 	rows = numrow(mtr);
 	cols = imc->hbm_mc ? 6 : numcol(mtr);
 
+	if (ranks < 0 || rows < 0 || cols < 0)
+		return 0;
+
 	if (imc->hbm_mc) {
 		banks = 32;
 		mtype = MEM_HBM2;
-- 
2.50.1 (Apple Git-155)

