Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB86388E4F;
	Tue, 28 Jul 2026 04:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211952; cv=none; b=ghkrz2cuC1PhJIgYbbEivc7Lw3IlXktujlMg1wSeoETK+vX497dwxuvtPi8pZV8gyyFOBBnwjZo8oeVgwZCKUc3IQ1JRx0806hbb9tImPQYbD4Pp0QeHy/sgsI5Wr9Nr4/2U/o5EIVeBk5IFsMsTNFl9G8XAMhrlc23TIMId+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211952; c=relaxed/simple;
	bh=yz+yd7sAZXMNBY2IzZWigPcM/VaK/ABd+kScJrZDgzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LdazEIxZbMP/ZlnFP/iLFYBoFibITUBe1H8qtu5eIfVstShiM/WKYqrL3rvvIVKIsfnK8dQnBC0qID97xihztFbzpFbpViqBF1FqUa+POyhQtwplS+dDI2iaVelQwL/l8OktSHHT89Zlv1eEDxyRCQuUEmAgwO3KeAf14Krd9Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8553975a8a3a11f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:85065990-e28c-47a7-8d1e-6bfd72dc6dd5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:dd09915f950902fed379a6504f5bc0ef,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8553975a8a3a11f1aa26b74ffac11d73-20260728
X-User: yuebingkun@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yuebingkun@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1665371522; Tue, 28 Jul 2026 12:12:17 +0800
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
Subject: [PATCH v2 2/3] Documentation: fix "readng" typo in EDAC memory-repair ABI doc
Date: Tue, 28 Jul 2026 12:12:12 +0800
Message-Id: <20260728041213.52820-3-yuebingkun@kylinos.cn>
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

Fix "readng" -> "reading" in
Documentation/ABI/testing/sysfs-edac-memory-repair.

Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/ABI/testing/sysfs-edac-memory-repair | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-edac-memory-repair b/Documentation/ABI/testing/sysfs-edac-memory-repair
index 0434a3b23ff3e..ab199132ffd8a 100644
--- a/Documentation/ABI/testing/sysfs-edac-memory-repair
+++ b/Documentation/ABI/testing/sysfs-edac-memory-repair
@@ -160,7 +160,7 @@ Description:
 		in trace events, such as CXL DRAM and CXL general media
 		error records of CXL memory devices.
 
-		When readng back these attributes, it returns the current
+		When reading back these attributes, it returns the current
 		value of memory requested to be repaired.
 
 		bank_group - The bank group of the memory to repair.
-- 
2.25.1

