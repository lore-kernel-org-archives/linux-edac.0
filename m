Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BC3346A0B
	for <linux-edac@vger.kernel.org>; Sat,  8 Aug 2026 22:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786228751; cv=none; b=ReObODcgibd9mkEpaszkkh7acE/Kq8Bx4JSWBGiiCNNjgze9xWRWks8+LwcCgwWRQuulTwlONjU865eJElOSx8ZVR14frIG7vlIZ3su+vMZR9v1yfdsbmRJn5YkrEGFI4zDhtxljwyeZsrCyNmaU2IWsTZ4MhbJKQsgWQZJO27U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786228751; c=relaxed/simple;
	bh=/Ri+76lmeMTI0L0K9x/tU/UJQSgi9MDW+TkkxjfzvnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjem/XtOBwMtur0UpKn9lKMYJ0FGiAwbZ4/823ZTB9nMWfVlyQYqG+IsvskuQAa13JQHJeVomTLmrl1g+cQ1To3m2XshJecYwt8fuF0xNJ5fJDh1J+K/xIT6zoGhHb0GWjPeMePMoFTBFGCrADlnQ3EkK6lezC/naZGKcNh4VGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIbmY/I0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIbmY/I0"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fd66a094eso151640f8f.3
        for <linux-edac@vger.kernel.org>; Sat, 08 Aug 2026 15:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786228748; x=1786833548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIDW4mWudSHacH5kmeKRE0d0Qth6MvHevd3mWB6RzP0=;
        b=VIbmY/I0NTOGt5qrUj2cfpgQ89jxjl/a5URZfaBTfQcC/O3rC0eq81IDBIA3ZLcFzI
         AlQOQRuiak8770HrvrPzubvsakqQOvBLkRpeJQVOVjfhyEeKvIdK5BQcHnhhi42Dl4fV
         gYNMykiAZvHrepN2TXHxDTY6/3CfC1HtLf5k4vy/dZ6MMAzm5jaDUgseDFYp68ZXxzM5
         P40rnJcgjcYMpKQqWWuEwj7w5e+HtmPAbcJVfSrDy8gKulWFcbfdvL8QIljxvNfecnKn
         De3G6rROrSTwldvoAKnwuZlHJIEAoTx8jJvKyhZD+PjzQYEF/ZYn1II3utFOJa7cnuOy
         EfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786228748; x=1786833548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIDW4mWudSHacH5kmeKRE0d0Qth6MvHevd3mWB6RzP0=;
        b=WAgj4lN4iCodG+MVlTayejH9g+Ca30bCqfFbA2M41lGbvn+O51E5wqLgLJm/3UyIpD
         EU9FBsGn6iqRsrs+4UsFsBMKFSM/hgRiJxllzux4X9IsgESNRR1kGyL8WIt6BAMDa/ue
         5+CcrtaJgzCZIFBkhMPE7Mqw0SCoXrwwQRstQb0mFURX5xag33my4Y2RdBeKC8N/g3ar
         IvQRyw5Ucz76d5zOO3xaWBNCkRXijUNpJTuOdAjT9jmuIkDfdPMhkxZ8vDPneLOsYwEp
         KSJUp/PQbfXmReQSte6rVmNyZw93+XIkVbB2jafgXAFepJzb2EymRAlSAGL/znF6u3Pc
         fJ8w==
X-Gm-Message-State: AOJu0Yx5mz5ierj7n0+orp1ufSK7iSeTn8rOx3rhpoOr2aIl5d3BRbEt
	77x4ClIYKJoVTPp3dxetG9LmdygPf5H92IDIDgviAwez22TCeVNmyoAQ
X-Gm-Gg: AR+sD10K1DbkNHgkpzm1jI6ebH3/EuGupAw8k8AVWB4G4MUdbS3eyes5LFDoOQK/hhf
	Nqeh6P+rR5w/t42EKaViWThTR6NQe/lA46sPHwC23UontN4i2s8lLumBo7B26FLcZHfVUm7wj7Y
	qM35MCTs6r1aMXQ+8Q01yp7E/FX+dWeuBfbxvCI1/kyLFi9xtGltz+WD5OpytXB82UKTdIHQK4b
	KtnP3U12ZxXYNXZW6wnqvbDPS1+q/ar+SYKR+jrUl+G9WSrpHpRvmYDqKtvxBpxMJdUcFXhZKOy
	lSHXBSkR3yALrTPXmrk9ViWMzw6NSej1rir6aeK+bezzCIpzpoZJyLo3zBIzyqfe9ViPgf6K1z2
	9hxoduRj0S+HThleOpiUs2DBdTAMr/QuqmWJ5OShtEnVliz97YAsf1j01E8jByky2d76XqKRP2k
	jf90JE1X5XoAqaQWJEOM0dVSTGKrXiPzUj+teitURUd9/7C2sNitRjKdaUl4Aci/5kElctvfOiF
	URXTLb8OVd2YrpXeQbq18U5RIw6XnZI1JP9gnI3Lg==
X-Received: by 2002:a05:6000:2c0d:b0:47f:6b9a:9d54 with SMTP id ffacd0b85a97d-47fec4ebd82mr49986071f8f.7.1786228748190;
        Sat, 08 Aug 2026 15:39:08 -0700 (PDT)
Received: from fedora ([105.191.54.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021501bcsm17943429f8f.9.2026.08.08.15.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 15:39:07 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: bp@alien8.de
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Robert Richter <rric@kernel.org>,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] EDAC/device: Serialize poll_msec updates against device teardown
Date: Sat,  8 Aug 2026 23:39:03 +0100
Message-ID: <20260808223903.16768-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The poll_msec attribute was writable on interrupt-driven controllers,
where the value is meaningless, and a write racing with device removal
could re-arm the polling workqueue after it had been stopped and the
ctl_info freed -- use-after-free.

Restrict the attribute to controllers that are actually polled: _show()
and _store() now return -EPERM unless the controller is in the
OP_RUNNING_POLL state.

That check alone is not sufficient against the teardown race: _store()
can pass it and then be preempted by a concurrent del_device() that sets
OP_OFFLINE, stops the workqueue and frees the ctl_info once the store
completes.  So re-check the state inside reset_delay_period()
under device_ctls_mutex -- the same lock under which del_device()
updates op_state -- making the check atomic with the re-arm.  The mutex
is taken only around the check and re-arm, never across the stop/teardown
path, so it cannot deadlock against other pollers queued on the shared
EDAC workqueue.

Reported-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device.c       | 11 +++++++++++
 drivers/edac/edac_device_sysfs.c |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index 361dc985497b..519d1c6d0930 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -392,10 +392,21 @@ static void edac_device_workq_teardown(struct edac_device_ctl_info *edac_dev)
  */
 void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev, unsigned int msec)
 {
+	mutex_lock(&device_ctls_mutex);
+
+	/* Don't re-arm the workqueue once teardown has begun or when the
+	 * controller isn't polled; this check must be atomic with the
+	 * re-arm below so it can't race a concurrent del_device().
+	 */
+	if (edac_dev->op_state != OP_RUNNING_POLL)
+		goto out;
+
 	edac_dev->poll_msec = msec;
 	edac_dev->delay     = msecs_to_jiffies(msec);
 
 	edac_mod_work(&edac_dev->work, edac_dev->delay);
+out:
+	mutex_unlock(&device_ctls_mutex);
 }
 
 int edac_device_alloc_index(void)
diff --git a/drivers/edac/edac_device_sysfs.c b/drivers/edac/edac_device_sysfs.c
index e12122b2f42e..821a80806086 100644
--- a/drivers/edac/edac_device_sysfs.c
+++ b/drivers/edac/edac_device_sysfs.c
@@ -83,6 +83,10 @@ static ssize_t edac_device_ctl_panic_on_ue_store(struct edac_device_ctl_info
 static ssize_t edac_device_ctl_poll_msec_show(struct edac_device_ctl_info
 					*ctl_info, char *data)
 {
+	/* Interval is only meaningful while running under polling */
+	if (ctl_info->op_state != OP_RUNNING_POLL)
+		return -EPERM;
+
 	return sprintf(data, "%u\n", ctl_info->poll_msec);
 }
 
@@ -93,6 +97,10 @@ static ssize_t edac_device_ctl_poll_msec_store(struct edac_device_ctl_info
 	unsigned int value;
 	int ret;
 
+	/* Only meaningful when the device is running under polling */
+	if (ctl_info->op_state != OP_RUNNING_POLL)
+		return -EPERM;
+
 	/*
 	 * Get the value, make sure it is non-zero, must be at least one
 	 * millisecond for the delay period between scans.
-- 
2.55.0

