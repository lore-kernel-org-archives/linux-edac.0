Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CF31A6806
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550435; cv=none; b=OSk5Mjg+PaKbzHOryqg8fbJfYjuiTbTxa9apha/XMjN7SCjwhpkcK1oh6Kd7ifSlDU8fSDvUS8EcnbsH8FTb5ngYehhdp97wL8A6X7PqGiCLmYrynSs8vQKuCg4XTJiouvWkBdFO1q6+hhbaQI96k185sqARfgPXJvi2avqOLTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550435; c=relaxed/simple;
	bh=fPrpOKXJr9nruDDTsn+7uGXjfrkxJtzLxS8K00lZO4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEOxyti5ktMRFZGbYdCQhdW2xMA/HYTo/qiWduvUNRM8KXxL/nKxXG9UJfftTXmS0PSkT6lJgAeyC2LkHEsVcg94GRop1V3umqd2YBfSqbApGkBQRLLB7jqIJN7dH8I2dp1jmmblFevVxivDVFc7lqzLtk/ezVRzv4h8FSzGwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6sNL7eV; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6sNL7eV"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so4855705ad.3
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777550434; x=1778155234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ8Z+a0emIBhKGFU70tK/Y6xfc8pLkgntdZpPCo3x24=;
        b=Y6sNL7eVd8xddGO3Vz3zYbEm0Fd8cFKAEaNdnKygmOr0+mFlxBuZlJHwJWEI7Yy4yt
         ELWHO2zIEFfYIsihz4BYk8XO+kXYnwneRrhsDBWeVc8yx8D0/8LI2GmjAOeZxeMNQ0Zx
         vadSsc7oyPzmsgRjqBPENlOOdyxBC8DaZcHNHzXaeLQvztFd58HFhEMBPAe5RMoDQ2lJ
         XgXw9Ajcl+idvrIeHBYu2SpJ//OabYRA1kotTFbodp2/xAPcqBUQ/7eropQCMUW8n0My
         tQx7uHGOSltJvuOS3KosDbBNHMmewLpnny4kNPlwb0/XuihtD/ZvBbOCCLEkQVwArJR4
         Cmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550434; x=1778155234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ8Z+a0emIBhKGFU70tK/Y6xfc8pLkgntdZpPCo3x24=;
        b=cu8crDIo6OWgMoaLljWjVV0XubicXpvX40+iKTQoKlknfoeiWBTLG4s9xwpOvOgLDd
         49AfLxHwDWWIol0F5+sJHwBbVwlRjhF5jcVa3IQc/21ltpNBZODYqOjep+rnJzSbj/v/
         xTqDsI4HjJOb7ILuiLKfiT9wfyH8Hzppdm0QIvwePCSYXIdP/97cUpJ42oe9DWhe9RLe
         VY+L7y9wSucsHFcy9C+ZXHDsIVPAqYvaXMna0TxyXks7NVjPkGtX5+l6V96ZshgAK3z+
         srAP/ItFcu+V4PuxCV8cn1Q4z0nQAoYP+0oDmnLo/JN9Dsg4Z05bGKD3pq4IkRgbkXtQ
         baug==
X-Forwarded-Encrypted: i=1; AFNElJ+Dqy3F0TjFjWTp3Pb+0IaabclgHO/17T2MMSPNLyvW0X39F80zDbOvErDZRYdf18iQ41s5Mz5jxjDw@vger.kernel.org
X-Gm-Message-State: AOJu0YwfV0HB1tNg2oNYtCoQWQSswERN86Gu4ZpU5aSQYXSUldr5jPHf
	0e4XjmGF9Tv9+ydevqMsleRRgeG1L60ugnKxhXq6mAFE2kCoNlUynKPC
X-Gm-Gg: AeBDiev3lR1zooc6f5NTJR3QNqzRDpe3JRxjZ1R+TWUVlsfB+MxxbqmU+WlQXNSFUqe
	alli8WhTuVZbRmHwoJSLEJfKfGlUiiGbXFh89HmPs9y8/ZCINP6s7iShuwf6TIGB3md4Ch1nTGP
	dnuI7jz0V+SsY+EiWxY56CJSsMPhfvPHHnPLo8DT9mvP5k+yh1+xDfgAI+W2LqlfTnibhwgxtyZ
	EMlog+IMKDqz8TOGy94hINykqiquLBm8+A/qTmq2sG6Yh+9/5VQe49OYbqQbCYs4GWt9khzERcS
	Qs5AUC5zP+9O9LJ/jAKpZDaHy/m5OT5+e2nIaO117ECVKveNlY+hdvMWxHKaZ4Kki4PeQgwiD4L
	HJKgtqyZLamzyfiLasVWnNuYJ9LzwABV/QWoTaxXlV3NgoK0+u8+EhKqbbs4XpkVstrQaRMvVt6
	IOb4UyxjOlUGvG8fqwCtB9iw0=
X-Received: by 2002:a17:903:264f:b0:2b2:65db:8c51 with SMTP id d9443c01a7336-2b9a231ababmr18912845ad.8.1777550433452;
        Thu, 30 Apr 2026 05:00:33 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f317sm53983175ad.53.2026.04.30.05.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:00:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Doug Thompson <dougthompson@xmission.com>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] EDAC/sysfs: Fix error handling in edac_device_create_instance()
Date: Thu, 30 Apr 2026 20:00:19 +0800
Message-ID: <20260430120019.464049-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Once kobject_init_and_add() failed, we should call kobject_put() to
decrement the reference count of the initialized kobject. Or it could
cause a reference count leak.

The release callback of the instance kobject drops the reference of the
main kobject, so replace kobject_put(main_kobj) with
kobject_put(&instance->kobj).

As comment of kobject_init_and_add() says, if this function returns an
error, kobject_put() must be called to properly clean up the memory
associated with the object.

This issue was found by a static analysis tool I am developing.

Fixes: b2ed215a3338 ("Kobject: change drivers/edac to use kobject_init_and_add")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/edac/edac_device_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index 32460c6dfb7c..0f5bc2f1fa5e 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -626,7 +626,7 @@ static int edac_device_create_instance(struct edac_device_ctl_info *edac_dev,
 	if (err != 0) {
 		edac_dbg(2, "Failed to register instance '%s'\n",
 			 instance->name);
-		kobject_put(main_kobj);
+		kobject_put(&instance->kobj);
 		goto err_out;
 	}
 
-- 
2.43.0

