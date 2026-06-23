Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED821375AAD
	for <linux-edac@vger.kernel.org>; Tue, 23 Jun 2026 11:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215614; cv=none; b=oH34GmKFB407qIIpONi9LeKTum2H9Lo553bZ9WoDQtPbb6kffi3n1XA4pDqsSHq2NafxGP7Zwi4U2ru2sZsOeIV7UbQD026s0jPuVE6dITKoBQ5YYiIT/Z3vwECkVcbxB7DK8cVjTwcC0Mzwhr6zDhX/vtnyItnTPZa6BZShsYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215614; c=relaxed/simple;
	bh=slg0wilJ+lnBoi7h+mGdKbCHzjbVPo75nov0Wh/sebU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L5JeJJSJ7hHJAVpTWmACxAjwbJWnFa/0sBsi9rNhoV2pdAQ9eeT4AnG4Hg44ien58k+3fL82ojAWJGKU8RxZIDtu4TwjC2UOiU7ug9oxbBvbPnmgKeKYuQ5PChiFCcXp+pQkdGw23AeEHf6OgNhQnMaEcvf8KPgYnvwff2TE9Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFtAhMoB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFtAhMoB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-46019b190b6so4263999f8f.3
        for <linux-edac@vger.kernel.org>; Tue, 23 Jun 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782215611; x=1782820411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H6r83cd1SVoMgZf6xvGtobjKHtKJs7Qs7LveMMzCzVc=;
        b=MFtAhMoBz3ECkQD3VO1FpfkqOVe0ExuRQ5DLs1hYeaS7FK5+6n9N+nMZfDuGIlbTcQ
         5Cg8TIeUfWe70xTBT2LOnE95tRLCqV+TONjvq0mFKBjbsEpOSGp4PjgxLzlmuNSnP3bw
         qRBIz1NKW8Dzz8EV2cpR/m0uPbbqLvb3q46iWPSzPnUKN5X8RpX6xJZQXsnXaUXV3r+Z
         yPNx6wyars+8nJ+ZAG+m8CCjnFzRczJ4Ap9Y8NUAQSoXIo4u+pQUFoySMV8eG+tLFDNK
         Os7APHyO4z3cqNa+yPhWyYlIeyT5KBEPHL9tZH71c0AIq4Olv/c70TfKJvVbb1oDz+Wi
         UFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215611; x=1782820411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6r83cd1SVoMgZf6xvGtobjKHtKJs7Qs7LveMMzCzVc=;
        b=cky+mDo+WcCWqVOzU1qhU1qAkKrS9Ycy4kxwl6a9B8VteAEAKbQkaqzTsGXOagdmXW
         wKKraL9mHaHKxdhGYIlmlfavdJ0r/RwT13PftDrjo9mBvHr/WAXd9MaTUSBUMfloFz0L
         Z5DhO131CJpnsG6OVbKBgs3aruGb8im99huzWIjUhCXBelcwRRetL5MjCtYsSvbarpQk
         /tfOPoQwooyH/Ho+i2PsyIeTPESy+6rawkM1scNQFj24Nqc0lYfJXmkR2xQaRZzHulVJ
         9bBuqz3zfClu6Ty++CyZ4j20VtXuoqjWVBVq7bAUbVpNquAC6LcrhAlWxTaJMQboSSNB
         eSgw==
X-Gm-Message-State: AOJu0YxQdsj9IqWE8zG3L0hKzb36Hz+bEA6okJsez1xrRd85DNRQ0kMe
	BoqOQmLIa65Zeg5GOZ22g/EXBBIC4aULypnzXNV+0J2eorXRwR7I2yRe
X-Gm-Gg: AfdE7ckkjKJHbr211jsn5zVDSMhUbrhzPITSk9Djo0MOKfycSo8/z8e7U+whuBfMWqS
	iI0pf2EfrEGaPXkjzOoVGZtuE9mzM2mqaCA++Z9+QBqPV0Nixxn65tlwt05JF3YFznS67VvQfGi
	lX0/SlcDDd6KFZ0avcm0TpQmt2W4M4+7IgCzkS/vAAY6y3IOIwjWzne3MPitwAux/oy2/bs4dOR
	12nrJqUUyRAc5N/wYSEzE05bAF5J9sfYogkmDWXLOZmZ8ogWOCmGqLLUYMV04maCEuuSUZakJCC
	4HfZU/YAtJAYJssuBKzpkIq6bKUWASDkGdGrvRwMpGC40Noy3XyRWfq6R0/KuwmMqRf50SC1NCO
	GBwpirHWiz1OregzFNWb50sN4eK1TPCnyMdFx2Gj6B9p13S2oj1nWJ9vkPfDyFhFg5DPoPlQF9E
	o2cHMoHd5XuIasr1e7QMjCSkMHhfRqNfjroE7RjiMbj7q1/kj0nlc7O3CGnofiHSEE67EqVvxE1
	7g=
X-Received: by 2002:a05:6000:184c:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-46adcda85e1mr4046852f8f.26.1782215611086;
        Tue, 23 Jun 2026 04:53:31 -0700 (PDT)
Received: from fedora ([102.99.34.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c5413sm36555050f8f.11.2026.06.23.04.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 04:53:30 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] edac: edac_device_sysfs: replace simple_strtoul with kstrtoul
Date: Tue, 23 Jun 2026 12:53:23 +0100
Message-ID: <20260623115323.519298-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

simple_strtoul is deprecated.  These calls also didn't validate input -
echoing 'garbage' would just set the value to 0 with no error.

Use kstrtoul instead so bogus data gets -EINVAL back.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device_sysfs.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index b1c2717cd023..da804ebe3626 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -37,8 +37,14 @@ static ssize_t edac_device_ctl_log_ue_store(struct edac_device_ctl_info
 					*ctl_info, const char *data,
 					size_t count)
 {
+	unsigned long val;
+	int ret;
+
 	/* if parameter is zero, turn off flag, if non-zero turn on flag */
-	ctl_info->log_ue = (simple_strtoul(data, NULL, 0) != 0);
+	ret = kstrtoul(data, 0, &val);
+	if (ret < 0)
+		return ret;
+	ctl_info->log_ue = !!val;
 
 	return count;
 }
@@ -54,8 +60,14 @@ static ssize_t edac_device_ctl_log_ce_store(struct edac_device_ctl_info
 					*ctl_info, const char *data,
 					size_t count)
 {
+	unsigned long val;
+	int ret;
+
 	/* if parameter is zero, turn off flag, if non-zero turn on flag */
-	ctl_info->log_ce = (simple_strtoul(data, NULL, 0) != 0);
+	ret = kstrtoul(data, 0, &val);
+	if (ret < 0)
+		return ret;
+	ctl_info->log_ce = !!val;
 
 	return count;
 }
@@ -71,8 +83,14 @@ static ssize_t edac_device_ctl_panic_on_ue_store(struct edac_device_ctl_info
 						 *ctl_info, const char *data,
 						 size_t count)
 {
+	unsigned long val;
+	int ret;
+
 	/* if parameter is zero, turn off flag, if non-zero turn on flag */
-	ctl_info->panic_on_ue = (simple_strtoul(data, NULL, 0) != 0);
+	ret = kstrtoul(data, 0, &val);
+	if (ret < 0)
+		return ret;
+	ctl_info->panic_on_ue = !!val;
 
 	return count;
 }
@@ -89,13 +107,16 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
 					size_t count)
 {
 	unsigned long value;
+	int ret;
 
 	/* get the value and enforce that it is non-zero, must be at least
 	 * one millisecond for the delay period, between scans
 	 * Then cancel last outstanding delay for the work request
 	 * and set a new one.
 	 */
-	value = simple_strtoul(data, NULL, 0);
+	ret = kstrtoul(data, 0, &value);
+	if (ret < 0)
+		return ret;
 	edac_device_reset_delay_period(ctl_info, value);
 
 	return count;
-- 
2.54.0

