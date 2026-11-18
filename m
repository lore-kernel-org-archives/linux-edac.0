Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991348;
	b=rcTNl/sH+WMwXJOtaFxondHpNCG41w4GP1LUGU0XnQEeVekTVHIekSRMzJRywEEqfrqi
	 Q5sI/D44eKlnwoRWl6iamhSLRX/eX+g4CSBISA0mSwFWTYRUL8cJ6oDwk1skfwhep6Vjm
	 F0BeMhLUJAwk34olv3ywRcX9hODqHIEbi0GZDYHRxoJKsLH0UVJUeZcQRLEdLAqPwb4bC
	 8atGGDQRTZwWBYAM1/4ffX9fj504eoCVM1Gu3VvNZxJZgvO3+X/bQpQXE2xqpFaMTVz1m
	 UTSx69Xih1GOqm3PFwIZqGrMlj9Pkqf7TZWhr0CJV5ulTO1Zwyyxv5ki+KH8uEthSgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991348;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=0ZQTVryEmIsnM+GqvoXyuw7ccmcLMnFre+y24On/fN0=;
	b=5l5XBM9YwOFL53UURddf74AhebHOApWgXmJ1hUPHZ8MLB9Uuz63wupNC8t68NzcZc+G9
	 EDg6ZVdhi3gDCHZIVUrnVEKKPmoWWmkXhZx1Dv8ikl+y4wzQSBXclJXgHcf9qlf3kHzfN
	 HcqWf9R1OLREsJ1i95VtXcQkgIKADX2lbRmPb0e96pM42A5dUYznONwPoT4ekGGjukH35
	 LzwsZ1V2HxbEMG2fo/s33KEr6Dzz7yXnGLvxEHr6JwgUiw8TuglkWERonNNuUpZ7ovJV2
	 3s8T49pMqJPZMwkS0zXdN3IDKBRms+miPeX0MO3BMpI2jINtw5eg2ZvFjc2/jC3c9MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MADKrsIE;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166E606A32C;
	Wed, 18 Nov 2026 08:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4166E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MADKrsIE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0Z
	QTVryEmIsnM+GqvoXyuw7ccmcLMnFre+y24On/fN0=; b=MADKrsIEmxK796aYv8
	HUDpx0hr1jC98Pmum7dep2Q22+9NI0gqGGduo5q07xaYlby1R8oarmJMHYjwOvGT
	Rh7zWZ5opqUshDQWSvqS7bEwuDKw1gm8jP+Mg1x4Xyzj3rwf60aDzfGUx+Dh+2Sr
	DE0wSpH5+FpLSR5h1hYu5AHcE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnl17YZP1q1I2WIA--.48069S2;
	Wed, 18 Nov 2026 16:42:02 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: tony.luck@intel.com,
	qzhuo@nvidia.com,
	bp@alien8.de
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] EDAC/igen6: Unregister the correct error handler on probe failure
Date: Wed, 18 Nov 2026 16:42:00 +0800
Message-Id: <20261118084200.2184184-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnl17YZP1q1I2WIA--.48069S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF48KrykGw1UuF1xXFykuFg_yoWkXwcE93
	48tFWxJrZY9r9rJwnxCF4av392kF40gF93Ww1vgF9xGw1fZrWDXF1DuF1UAr17Xr4SkF90
	kryYgryfuw47CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRtGQ6DUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7Rpp12r9ZNrbUAAA3r

register_err_handler() registers either an NMI handler or an MCE notifier
depending on res_cfg->machine_check. If enabling error reporting fails,
igen6_probe() always unregisters the NMI handler, leaving the MCE notifier
registered while the driver resources are released.

Use unregister_err_handler() in the probe error path to match the
registration method, as already done in igen6_remove().

Fixes: 0b7338b27e82 ("EDAC/igen6: Add Intel Tiger Lake SoC support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/edac/igen6_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 776c5db2f598..a2207337f251 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1948,7 +1948,7 @@ static int igen6_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	igen6_debug_setup();
 	return 0;
 fail4:
-	unregister_nmi_handler(NMI_SERR, IGEN6_NMI_NAME);
+	unregister_err_handler();
 fail3:
 	gen_pool_destroy(ecclog_pool);
 fail2:
-- 
2.25.1

