Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081447;
	b=NcVr8lhyb215LjOEqiVdAZs3+I6xdO85K/gMQR4VHZZze5yOULi1QKgFeBASKJEuzFzK
	 0XZBauB2zRiAcaPp+2y8W6ObU7ITSwt1BA0eMkapeDDIr7bXT23JozcKPJr4KNxWYfqsE
	 PodbqfRo1VvZbc5zAjJ5LycHQBmJkQ+/C75B+avCUAgWm7nSWhp4d7irUB3lyisiNWI3g
	 5qec3O/9VyUmqi2ttf5KznB9Nc4S13rVFA8ubsQ5z7W0addAZw4AFxFevJQaT4TMqA54W
	 iSBXZ6NP1sfukc3W/H9Nkf/QcjJeYk3OYyXg8ox9Wg/WBqfl9aODz2Rbae88/elMfUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081447;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=qGVPOGpJKDtjABaYP8ZTaqIcJpzyvSJfHCEp5P9ItkE=;
	b=czGC5KuMz/YsvhiKSCm0esfvjjuuN36VPz5HDkk26wo+CJUxm1aWj4b2/FBjHkNzHdeK
	 qf8ruWknw4+RUoWUv+lWkCqMmkJrUqPLIcs/9qcM3LtUPma0V6NOKdtHh+94nmI7E+TKp
	 m7Ya4F7y3Xe96s/x+IjX4szCofu4FZN65a5i5g4fUp6OTpW/ueJyr4kuiVHp5PvRaNEe0
	 zLVfZxP3J3xrmRAZhPVuvnTppwfHPXUHr3WZAJnQt9wFsnrWW72LTInhdPBUIr/RwEeMp
	 aLCsAu02rMdOQ4G/tznryEt0EjbdNkVsRxsI1mr44acTvQ4mB6tCBmjJ038kqqn6RbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FGhw7+vJ;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B1606A320
	for <linux-edac@vger.kernel.org>; Thu, 19 Nov 2026 09:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=FGhw7+vJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=qG
	VPOGpJKDtjABaYP8ZTaqIcJpzyvSJfHCEp5P9ItkE=; b=FGhw7+vJ3Z5QVg2J0E
	DwJBMt+Qy9vxYmmvMOuNs2fXqM9e0cTOWlJmF3hTId7ItsJ0i4t0RG81HsV/5G0T
	w7/GGzIhziaY8pbCTpK1GXBPN2HV3+JiXOHKecyLvgWTNR1XT4bgU6H4jsplICep
	ZDauWL0LZ3JAVjoPrlFvv1WfU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnj0nHxP5qc1gDJQ--.35146S2;
	Thu, 19 Nov 2026 17:43:36 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: tony.luck@intel.com,
	qzhuo@nvidia.com,
	bp@alien8.de
Cc: linux-edac@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH v2] EDAC/igen6: Fix error handler teardown on probe failure
Date: Thu, 19 Nov 2026 17:43:34 +0800
Message-Id: <20261119094334.3011176-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:_____wDnj0nHxP5qc1gDJQ--.35146S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4xWF1Uuw4UGFy5ZrW8Zwb_yoW8WF4Dpa
	98Kw15CrsYqa15tF1jka1xZas2k3W8GrW2yr4vq39Fvws8XFyrt347tFW2qF1UArZ7ua1a
	vw45XFWrurZ8ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pizpB3UUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7gi9LGr+xMjEKAAA3D

register_err_handler() registers either an NMI handler or an MCE notifier
depending on res_cfg->machine_check. If enabling error reporting fails,
igen6_probe() always unregisters the NMI handler, leaving the MCE notifier
registered while the driver resources are released.

The handler may also have queued ecclog_irq_work or ecclog_work before
error reporting setup fails. Unregistering the handler does not drain
these tasks, which can still access driver resources and allocated
error-log nodes.

Use unregister_err_handler() to match the registration method, then
synchronize ecclog_irq_work and flush ecclog_work before destroying the
memory pool, as already done in igen6_remove().

Fixes: 0b7338b27e82 ("EDAC/igen6: Add Intel Tiger Lake SoC support")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
 - Drain pending IRQ work and work before destroying the pool.
 - Update the commit message accordingly. Thanks, Qiuxu!
---
 drivers/edac/igen6_edac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 776c5db2f598..80e477ea9db2 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1948,7 +1948,9 @@ static int igen6_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	igen6_debug_setup();
 	return 0;
 fail4:
-	unregister_nmi_handler(NMI_SERR, IGEN6_NMI_NAME);
+	unregister_err_handler();
+	irq_work_sync(&ecclog_irq_work);
+	flush_work(&ecclog_work);
 fail3:
 	gen_pool_destroy(ecclog_pool);
 fail2:
-- 
2.25.1

