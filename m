Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1CC4195BE
	for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683381; cv=none; b=VAotN44KdiV4SIpnRNE1vnQypBHetELdHCqwbQwM2M7d5bOxfJA6AklyBhqQH8sv3+Mw15BnSwK6F+j1ko1gBqefg2lT+kJY97GO8hZmKVcWcVJu69EDyecfd45vXD9OEfNk5dHaPoP9RSGM8Xi0RfiS+1oekNUweKm+Qupd5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683381; c=relaxed/simple;
	bh=7OLa5VSZga3c7xHtQ7LDudELJy00EvKKS9zK5/3jRY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GOWkIL+ty9/UyF8l7Z0TfRJM1zWQJvWlXxemUDfAibg5O3qV8H1qOPk6ixxsQVrKnCM3VisKZBnfKX8SocfcWwpDg22etMUoYQRsGjcqgESSu6dPy5bpZcezeK4GPgzindX6MWfo4Vrw1PdOM3eRuoz8og5ZwyPX5rcyIA2N0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHy8zXyl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHy8zXyl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so5711375e9.1
        for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783683370; x=1784288170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3vn/hujzrD+r1/zdSZb7/P6FDyllIFs8N7tqn2TGCg=;
        b=dHy8zXylx44vVRwGd3ioJUsQ68I9HPhK/Wcepgx7Y1wbQbVDt+Bn8GmBvarNp5ZAKC
         yLFW5pREbp3UH60Iu2PGB3DPjnIYSo/1Ku1ARmDCDcCVQdO90vRpBh0dPEPoZdh7Eixw
         LJnkxza7nJidLfB771O9vcmbeKMJiJMlFt+3N0zAC+bsYCxNcbBsHDEz3r3MFAAmiB0U
         gX1mDGYdCj70hwcus4hqtngzSZeUFZNZuOb/gIJto5/9vd7FF39xVvda6yOBvK7xadkN
         dmudSoxeY7tfFdWlA2PZyWx2I9HqAVSVm2s+0I7/GSGS5Sigh4lyILa1ls6FEPBBnX/A
         SuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683370; x=1784288170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3vn/hujzrD+r1/zdSZb7/P6FDyllIFs8N7tqn2TGCg=;
        b=MugXgvGK0ud/DoX8mlzKInQRsHVDqahXgNdfgmM2rS/PKLmVtIt1PBFshlg7BHKj0X
         nBRMXnkEd0Wm4DC3+xXizLpJzbaS+uJGhZ99xdcFL4M6Ursce1+GdPLHUsh4BHHEKlEt
         gbzOFIOdts8ZNycKz+tzZ6Vd2X1h7gLUo96Kj9Dx0PIJnCOi9nQe+7Nb/Cr5/z9uITxH
         nykehC6bRH/mldLBXTDWWJtgKs45KaQ6gIeNrvuiz5cU2TKrdmakfs2MvcO48am+b61B
         kwEGmzTyPZUyZfIZ+WmJkkjEwn5xKnvc52LINULGqgqeNfV2mZagYHVkg1ZBcwfxdTwW
         s9DA==
X-Gm-Message-State: AOJu0YzKSrzCU72UWQoGHkmKlACtRvUEA03F4/6pDQaYDR4K5WGjODwR
	ZZMhVc1Y+xOY1oY6sqFslfc8E2dDjRnUg+1EgkVtOR0DCC/9Hq4spsUu
X-Gm-Gg: AfdE7cm6T4TwC/et13RiRFCIen2eiBOLHwP/yaOHRwyEVP9rMIkLSUrDttQ5hJEIb97
	GMes7MDCUHNbmBl7GebVRf3SvEn1Ks6AZapaNAx7Qxr6ba3aTqav2WIQbu4JdI+TNChskVXq9FM
	u4DYrhqRdgwrl4rrT6j3uTRhRgyN2PRpgN3kqxeAqI+rF8nAajaHy1S+gqfEzW6IEROFhBg1hk9
	X4dsW4/WquonukopynhwO74IwNd8l9cKYhsZ5a0mypUDgwAM8wS0ZON/CqAMxG1p2wQvU/cd3As
	R7kwRVfYfXfR/DhxDwLzRvsUZ/2URvWtwBg7r3KbGWbrrA17b6ZBOUao9OVPVjhmNDEvzFiCz0O
	30u94916V40iSxUO200yaKuJikzShREpSIEQHwxS6xnAYF9dipBkRodnStq3+zmQudFkHynN41F
	JyIDEGzoDLgoYtWF47Vcd866VE6ah4f/kIzG5wfM4tfZmZAPA2EoGBY9DVEUTxK9LK/9o=
X-Received: by 2002:a05:600c:8119:b0:493:ee34:d875 with SMTP id 5b1f17b1804b1-493f2b3369fmr30839765e9.10.1783683369863;
        Fri, 10 Jul 2026 04:36:09 -0700 (PDT)
Received: from fedora ([196.121.194.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e77c2esm37069885e9.2.2026.07.10.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:36:09 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2 1/2] EDAC/device_sysfs: Reject poll_msec value 0
Date: Fri, 10 Jul 2026 12:35:47 +0100
Message-ID: <20260710113548.46266-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The poll_msec store allows writing 0, which sets the workqueue delay
to 0 jiffies. This causes the poll work to spin without any delay,
consuming 100% CPU on the polling kworker.

The comment has said "must be at least one millisecond" since the file
was first added, but no validation was ever enforced. Add a check for
value < 1 and return -EINVAL.

Fixes: e27e3dac6517 ("drivers/edac: add edac_device class")
Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index b1c2717cd023..89adfd3091e0 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -96,6 +96,9 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
 	 * and set a new one.
 	 */
 	value = simple_strtoul(data, NULL, 0);
+	if (value < 1)
+		return -EINVAL;
+
 	edac_device_reset_delay_period(ctl_info, value);
 
 	return count;
-- 
2.55.0

