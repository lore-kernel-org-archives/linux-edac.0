Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE441226D
	for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683386; cv=none; b=dsQE11keN8j6ELMPZEnVFNlDgZ2XQUU253j5IKun5ecH/BPb0RsqmrtWAcg9k9pdL3PTXUQuWfogv5zmX5rzMNBa2YNdo40j7YEELz6Z4NBNzKx6erxvu1oT7Q56yks4FcVQSV9d266O/T6KVdiozi7K8FnAdJRnui/whHQG5wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683386; c=relaxed/simple;
	bh=Y784NiPo/Lkfm2UuRmEX6I6Vl39TYNfqDYa75fJKlg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0IoRhxGA2gELDB14Jfoc/zziOfuFN9PSeD1s+8vqoFuj/mnHncaCYlmRZ8nSMYxq3I6EAp/vr5IbFBls3iciNsGPsCnMqSJm4CpmKPXaStxWrkSaU4a2PnzyUqi4OcEOiRgh5pUCi6SNYyjARQAsz6WASgNI1dattbaUX4GxHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAZLJk3a; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAZLJk3a"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so6950445e9.1
        for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783683376; x=1784288176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wr86uApLkpfSeVw0S+gM2kwm+DgPZ+faPytZybQHxag=;
        b=IAZLJk3aKuCNJ/H9jHH+OXOWehB2wuOkp0vMH/0NnqnalBYvfkmyH21a4KlSpGJR1Z
         d/4QPBd5Vli3m93FNi56imqlzowtXR2nGhzQDRSsRCHLw21SqzuaTx3BFyrVNbMmfRAn
         4dJ6loRZ0zBttlK0eDLglM6C2nUB8GOtNjL6IFq5F6I+8zuPOf2I3ClzgcmfoozjqL6j
         dIStpAGTD9nJuSA5g2fiY6VtMGDNbKaK25m88LvzU0GIA8ulA9bM/wURHRjvOFkaGY+b
         HEWwmytCZA4MQ7KZFGltUA4l7u1rQrpdrmeqnnchZNcyBUtt8IUU4iqcA1/C8lBIGgMV
         s4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683376; x=1784288176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wr86uApLkpfSeVw0S+gM2kwm+DgPZ+faPytZybQHxag=;
        b=ccsx69lezo8TmJsSR4ElrVOsWBdqQlRK6cfrKHTNR2g+CBSa6CkGjKO6V92CZsouel
         usJVvrHESIYYxW4SpS+W+Wk4rZusbvJ147OgmOEsseA7Q/v2DZluPWX5tatuzMuvFzL0
         MApkBHsL9oH+TQ4znbHSJwEsLi+sY2jgco4OQY6ccslWNaHqxMtmVQhkk1CxCvPtQwsq
         9hbnyEBySeoFIPBRmM1W78ZrIWlttiOcuGZW5VNQCytuTVa7sqGqOIdvoiwc6ZAHBb8X
         n47d7t6PqB0uwYCLfgacEr1DRl5LSFmKCptL2RUb5gQkpjJLHd+/mubJ0lLx9OZ+vQc9
         XUAg==
X-Gm-Message-State: AOJu0YzqBJxIJsdzKmacDnIT5Fh6ozSd81v2T0PdjTK1Qb1+KgDHBnub
	8qcZ7dDFcugFn2kGGrBvB/OneVJ00CVOj+bU2kySqC0iCvfvjFE2H8sK
X-Gm-Gg: AfdE7ckvx3YQooMR7NL9tjIsH6Su+Lubj+HhDdBwVDkZ96aKxzOISh8SBAmsIGA0DXH
	MlRoW9K7UdwNwjtZVwcyaCvMdoZo3ncZ8ofovT6+h4bwZrqHm1jeGpZmWOoImNA/37So/oAtBxy
	Dmx9N4BLddch1G5JLYK0ksnfdlagCXEbdDUQluKfW5xiHNrW2L0pEw/oqmqRzFYFMhI9KCz5+iF
	7Yzs7Z1XDnZ7TzmMk8+CT0z8DGdAVdOSijySyzeTqfxRudNVpqVUN4OA3cke4+wI6pex5l80e11
	/AHKCMj+JI6WbHH1SDgS2clL903L5noWqeDVZdAt/4/1DSYqfpWhy0B6UpoNWSzTR7sXYonTj3N
	cwadSmYfgAjs5HCUwV8yIWfAJD3z3rwt1AGM+bunHiSrSXnmRVGfhPZjeAG+JWB3IKJEWEYadii
	gAfS4+sL01KHeM8/6z7PQq2ElWhcqCflDgaf1MK9b1Jv0UTBG3AOumx8iTbOuUXL5cm9ZYWrTQg
	T4Ytg==
X-Received: by 2002:a05:600c:3e15:b0:493:f6e6:ce2a with SMTP id 5b1f17b1804b1-493f6e6ce2fmr7629615e9.2.1783683375885;
        Fri, 10 Jul 2026 04:36:15 -0700 (PDT)
Received: from fedora ([196.121.194.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2e77c2esm37069885e9.2.2026.07.10.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:36:15 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH v2 2/2] EDAC/device: Don't re-arm workqueue during teardown
Date: Fri, 10 Jul 2026 12:35:48 +0100
Message-ID: <20260710113548.46266-2-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710113548.46266-1-inasj268@gmail.com>
References: <20260710113548.46266-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_device_del_device() stops the workqueue then removes the sysfs
attributes.  However, writing to poll_msec triggers
edac_device_reset_delay_period(), which unconditionally re-arms the
workqueue.  If writes occur during that window, the re-armed work
runs after edac_dev has been freed.

Fix this by checking op_state in reset_delay_period().  del_device()
already sets it to OP_OFFLINE before tearing down the workqueue, so
the new guard causes reset_delay_period() to skip mod_work() when
the device is being removed.

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

