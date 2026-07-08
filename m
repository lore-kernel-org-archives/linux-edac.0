Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A2140BCDE
	for <linux-edac@vger.kernel.org>; Wed,  8 Jul 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519812; cv=none; b=GQKzN9lKv1m9nkm3yav1PBAE3MNiDEEOnS1hiEgXs8+lnkgCnQpXaI0pfaUDCapP5Fx3djW35LTZCkbnPDsZVzcLTvPocSDrgLCrZMGmcKGHIjbB5vcevGs/NQre4K0ZBQZv0mufEyLKM+s59FoHfvVh4Yc42aKvAKkQnXlkPi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519812; c=relaxed/simple;
	bh=GwN1S4Y/Z3B3qmz+MTHgvzSV9DWZZu8uLiqV2eQGB30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/BLLXSAvKLrbPrcdbSh012HgEfC9JrIOS38OTzX6Pv99scFURLdZKr9lNm3mIv9s+jhuXa9a3LVlN6FVlX/gCdYSuYgCgkfYtOZoT0xDkhNHVZnC7N60MYlNNsHvzvdBTb3DvUpeZheXsWCQJ0EpO1oj6nPBl/qAIEsvuTe6/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHfu07ib; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHfu07ib"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so1250046a12.1
        for <linux-edac@vger.kernel.org>; Wed, 08 Jul 2026 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519810; x=1784124610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUQFekeQR7aF2bl/7XnDJ3W7Z3Ri5CBrxTY3M+VB1/Q=;
        b=VHfu07ib/EbJt4Fk0PgTTpeEvQZ1JanNpqdiyTIfx8H8BWXbzRaupW18LpLuSkvSZw
         rE8ExQAB6hUwNoUL4Pf90sdVkfA7xQlSbpVwbmJI7nCiK80Q0pzSp2bjcW+8h8HOQtOB
         TU+umFStyu5JA0yCOHiWPU+bPMQM0hMKhsaFx7NxJNgDxk7yrB1kcUB+hF2HcVo9DWzW
         CEtutGpV4Yd8Mf8znJ1hvVSWVdhmSYq+5sw1Oe8L8Y3pV20Teaskq1Sqws20ry1K7Ri8
         U7N+j6PC7+womxc+XIIn4YEBmLcSrFNk7ffMeX+xBrAOF2V05/raSzxa72pr9YCyqiXd
         XmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519810; x=1784124610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUQFekeQR7aF2bl/7XnDJ3W7Z3Ri5CBrxTY3M+VB1/Q=;
        b=Dm1m8ZzR3gx9gJtoNnUKKcknPikIe4hEWasnkArDwdfvo9dNBvszGGxfb2QVWZcr5L
         6tUVINo2nAOg5PbSXl6M2LNTFzBLo+MhWqhZHOVZIFOZGtv3JylrCzFIAjmeqKBbXrKB
         ScFh5ygux6F2E1iWczCZfF1a8fjO9W4axD7wJEI6PDafEwp4HXAnGGjmeHfzTpDmadFr
         opH5C9ThmHrZqRJ/OScCyp8tRYnIxMlEpCmEXACas2G12wNmolfxzWwxRk3Pom53FHI9
         WPBnez/Ff09SDMKY/rI6H544MGwo55D84TBFnONZ8WDeO3DI7R+Xz/ASMeEOdSgPeqdK
         5ceA==
X-Gm-Message-State: AOJu0YxoSbT6gJ7fREHVLhCx8sJS0gJhqMws3WH7biNGO9+Yu+DlwYIE
	Kq8QDxNJwHhV24fFkcyhnxIBg6YDWGKZHyZRwSFA3nmiSiYUzoU2jH1Z
X-Gm-Gg: AfdE7cnfxWF+8EQjIsQBMEfb2Gphd6lq0eozCz6Z3FgvbcFaCh85W2x4hPKnemheZF1
	msEO4lL6oRJrqhVF9cXX3Uk48dh53b11lCZKmTg52ErrzzDi3Ytz3Bl7VBPJrxXCi7c2MvSwTaB
	QNbORL0e0KHrw3PMJTBkTRyWCLzlaTLIN+5e3KvUMbvxiaE/9q4+x7Z+/wRvP9zxx3c4VfHnHWy
	31U5G1+ewK6jn/WQMgOwCLZ2da+Q8Zd/wAKSF+EYcrHGDiHa5kCnVaD2C5pLdUYf/m9dD+aPqCB
	SEAFGzm+HEtk4Rc4sGjU46VDl2aoAFQmBxjkqVZ1qHlUoec4AziIN/yHPhzxHngua1Opcmk0FrO
	e6hN0SU8+LU1BQddVeqTJSsp67j4VQfH09rQNrvMQ1CT7v8wQ8rld5XM1hUs87FGzTH94HOfai0
	9Jd6wgvwH3vU/KHXuf9sjW3dQu59BiEeC+1te4XDhR8xoez2EbNnJSV0YpyNWrs7zUIA==
X-Received: by 2002:a17:907:1c0c:b0:c15:d84e:4bc4 with SMTP id a640c23a62f3a-c15d84e5e92mr56474466b.8.1783519809524;
        Wed, 08 Jul 2026 07:10:09 -0700 (PDT)
Received: from fedora ([102.78.186.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84bc3dsm335198366b.21.2026.07.08.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:10:09 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 1/2] edac: edac_device_sysfs: reject poll_msec value 0
Date: Wed,  8 Jul 2026 15:09:59 +0100
Message-ID: <20260708141000.1764100-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment says it must be at least 1ms but there was never a check.
Writing 0 sets the workqueue delay to 0 jiffies, which makes it spin.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device_sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index da804ebe3626..3137cf6cf36b 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -117,6 +117,10 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
 	ret = kstrtoul(data, 0, &value);
 	if (ret < 0)
 		return ret;
+
+	if (value < 1)
+		return -EINVAL;
+
 	edac_device_reset_delay_period(ctl_info, value);
 
 	return count;
-- 
2.55.0

