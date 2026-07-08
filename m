Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9844A739
	for <linux-edac@vger.kernel.org>; Wed,  8 Jul 2026 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519815; cv=none; b=MhAuiJTXDkU+iqr1YBlHQMBN+H44Y+M6OCglmo/O4C/eQ78tnoRSOwrv1tYgYpEA758JTbISM+8FfINJXb8Xwyk9UtJgdN7hM3pWmocaszUDVKCkPVbNMoD3V3UrwmJRExL1EluUUSCShtqkhzSvVoNIEqEjLsJTZx16ussAk/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519815; c=relaxed/simple;
	bh=05ucUDnwOHNaxkux3/UftcRKvD5KwS5v8V1vZCmV6ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbzatRKPbGQZYRPdZicOvIkaSkPqm4bigUV8DwmsGsw6su9MGl00674xd3mP/8iYiy0HlbKkCOnWlRErcz8M49TmeglyaWVgekab1sigj+IM15hg8i5ph7vR+mkI9hESRY1Hx5s6yropiB4Y4OpYRHqJIXAYl7MB6DItrUXf+m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSLYhxk/; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSLYhxk/"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6989c0ec3c5so1317098a12.2
        for <linux-edac@vger.kernel.org>; Wed, 08 Jul 2026 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519812; x=1784124612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8WQTKp+DQlkWDWV6K0fBqOjwjvG0ClbVN/kOQS8hWI=;
        b=BSLYhxk/H6Y4EKy+NfZgEgevrMdJZvQIJt/thDNh9MHWZ3FGimFU8TsvmZtHTtnV1d
         uAlH+aVYi5c92Mt2JIkBfK2WtKTeOEUVfwi+pyyf2pQ0sL91VQY/1/8ANdgHMzcjqu5N
         exGyA3PS+UVQNq/6pP6BnrzhzYlRbfMfUtx1nVFdiymdoFOIeIFssTpeuWe7osmVftWP
         B1NNEDaJ0PxVm0ImulscEbjBelFc51O+Q/HG7Djm+CBxvb9bGfp56m7hfTC4IrDiG0J8
         PVIFenEwfbwt8qmK78RGd7Ad7uw/HqjDGISbutkIuzkcXxQgLpVFibBlz3tbaYTg+sEE
         wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519812; x=1784124612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8WQTKp+DQlkWDWV6K0fBqOjwjvG0ClbVN/kOQS8hWI=;
        b=awu6KKk2vJtWBZ7PEXvxQB/7hWO2ChtzIifqkccZbmTP3Qm/If0AG+0wxzHwnlEdSi
         et80rF2UVKv3A2dCcF5PsPfJv/Rxs6jLTAOxdj0f64Q8qKLvZW8Uexi98fE2AzpsdwIk
         daGBZeS7tirwxJRk6MNuuQBvZCFnFpkUW9bhbDDNn97BMFBPV2T9mq+lTemDZ4xzSboS
         T2Pf3TNX3OrHd072Lv19Frf7iXpbY0lCZ57WKu5LyFQRdE4p9m5JJq5ed862/icuz3kl
         qt9kwvaTBh6hSJbV0NRVHpSJiBOZ6qon42sf+8WD+YH8s28h3X5mqH+Mz179GOTTMUo9
         jN9A==
X-Gm-Message-State: AOJu0Yz0Q5Xictf1sevSBbaNw6LsjFIx3HkzcNjw0b2GDweDfStbhMr1
	9TPS7FF5jNrk070a0oT8HM9m+UnQB06EsIIKQjCgAHGje1hrRYyipQDm
X-Gm-Gg: AfdE7cncR6ftKZs394reJzSSS474/droQh84hreJXdkqi96YXYgWEwKFHK4hHC24v2F
	Xq8+HRtOdSuSP4+8X4j5ZdbOiIlgtbmIQ/lnvs9A3DIvJ86yXy9oNNwWW91nhPfDbsSsWkUPXJY
	j8b8cDcoiEPFwM9lk57UZiL1E8xm34IAZjcQTB02hFdp782GgGiZRMOlpo8XA8ScYoqFGhy4yLd
	bmv5164VvV3bgW6A8s5N5Um3y9yc4bkGLW+iQqMvNWjStNsy6k32VlxrClDBV/PNuOPliyoTbVW
	kwwVUcIUyndJroZn7/ry7qHEXF6cPjDm1F+CsCBmfrTRVuXgPSyhXqSqLTrH6OO5MmOSd1D/WrV
	2lYoP8m/zLFpcH1NW8mPv+6rdJMJMxrJ8b/A84vjekkXEAIkZpq43eELNIe0psYTi98gRdGYm5G
	OWyg8qVqnJXymCOrdULXdoEli2hrQ6evT73YkUGlwnVsTQqm0kMfcvkotOoTEad6yncOTQU6eT6
	G2W
X-Received: by 2002:a17:907:7ba9:b0:c12:8a3f:3e16 with SMTP id a640c23a62f3a-c15ce092b2fmr141410466b.44.1783519811737;
        Wed, 08 Jul 2026 07:10:11 -0700 (PDT)
Received: from fedora ([102.78.186.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad84bc3dsm335198366b.21.2026.07.08.07.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:10:11 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH 2/2] edac: edac_device: don't re-arm workqueue during teardown
Date: Wed,  8 Jul 2026 15:10:00 +0100
Message-ID: <20260708141000.1764100-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708141000.1764100-1-inasj268@gmail.com>
References: <20260708141000.1764100-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_device_del_device stops the workqueue then removes the sysfs
attributes.  But the sysfs store for poll_msec calls
edac_device_reset_delay_period which unconditionally re-arms the
workqueue.  If someone writes to poll_msec in that window, the
re-armed work runs after edac_dev is freed.

Check op_state instead.  del_device already sets it to OP_OFFLINE
before tearing down the workqueue, so reset_delay_period will see
it and skip the mod_work call.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
---
 drivers/edac/edac_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/edac_device.c b/drivers/edac/edac_device.c
index cf0d3c2dfc04..50ae7f1e5152 100644
--- a/drivers/edac/edac_device.c
+++ b/drivers/edac/edac_device.c
@@ -354,6 +354,10 @@ void edac_device_reset_delay_period(struct edac_device_ctl_info *edac_dev,
 	edac_dev->poll_msec = msec;
 	edac_dev->delay	    = msecs_to_jiffies(msec);
 
+	/* Don't re-arm the workqueue if the device is being torn down */
+	if (edac_dev->op_state == OP_OFFLINE)
+		return;
+
 	/* See comment in edac_device_workq_setup() above */
 	if (edac_dev->poll_msec == DEFAULT_POLL_INTERVAL)
 		edac_mod_work(&edac_dev->work, round_jiffies_relative(edac_dev->delay));
-- 
2.55.0

