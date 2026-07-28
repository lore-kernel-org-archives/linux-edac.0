Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C210388883;
	Tue, 28 Jul 2026 04:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211951; cv=none; b=bQ2TgibZPpFI4KRNtqwn+1H5lAOAlLiyEiR4Fuk9NqJuMd4/IVPi6tggAfzArhKIKOUuUb+USZP4Yb3ANZlRGqghQgwxMwY5os38mJruKxuoQqwn4ZK45SOLwtoWp6PONMQhpBVCpxOvl1od5Hewy/kMDcE/K8oC34Yw+F1r+W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211951; c=relaxed/simple;
	bh=+uYi0Nfz9en3HiMWrRn0MjaSGGjPU9sAnM56iIdoiOQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B74rVIIoatxEUfwM/0n23UlriV1l98kK4JR4e0lWinFAsx7XU05th9zx3DxRTtT9Ghgls6BSbyjc31PBTt2j3aM++VVgSVv7vlYFj7cDm4EZtdlDKas9/a6Yg9WQk2Azr5eTLYO94YFFUFn4FVhEF4Sy6MUvEYUvVbrUvoSnMKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8631217e8a3a11f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8c28a556-9128-42c0-983e-8f65c42919af,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:2d0dcd86d7957e38a977f3687258d1cc,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8631217e8a3a11f1aa26b74ffac11d73-20260728
X-User: yuebingkun@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yuebingkun@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1374740103; Tue, 28 Jul 2026 12:12:18 +0800
From: =?UTF-8?q?=E5=B2=B3=E7=A7=89=E5=9D=A4?= <yuebingkun@kylinos.cn>
To: mchehab@kernel.org,
	tony.luck@intel.com
Cc: corbet@lwn.net,
	rdunlap@infradead.org,
	shiju.jose@huawei.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=B2=B3=E7=A7=89=E5=9D=A4?= <yuebingkun@kylinos.cn>
Subject: [PATCH v2 3/3] Documentation: fix "thare are" typo in V4L subdev routing doc
Date: Tue, 28 Jul 2026 12:12:13 +0800
Message-Id: <20260728041213.52820-4-yuebingkun@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260728041213.52820-1-yuebingkun@kylinos.cn>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix "thare are" -> "there are" in
Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst.

Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 6f66ca38589e8..164cf0ad35931 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
 drivers may adjust the requested routing table.
 
 The kernel can return a ``num_routes`` value larger than ``len_routes`` from
-both ioctls. This indicates thare are more routes in the routing table than fits
+both ioctls. This indicates there are more routes in the routing table than fits
 the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
 with the first ``len_routes`` entries of the subdevice routing table. This is
 not considered to be an error, and the ioctl call succeeds. If the applications
-- 
2.25.1

