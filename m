Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6EC38837F;
	Tue, 28 Jul 2026 04:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785211951; cv=none; b=P3zxxazgo1jhYI6t91SwE/YDBP4uiowVph4rW7nDGrepFltmkEjlzxDa7Gs4J1N2E9ceD6R5J+uD9RLB24BwfqUZPI+lCl9F6RsthdaxACICQbgcPgxS7w5JWd3pXx/ol/4+7rgloYMcD2OTBIfND0zrR1IHyKIgRBm+PNimYko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785211951; c=relaxed/simple;
	bh=FqVw2ZhnbIZVHqH1KnEEYGAuM/8b8ILdyFFWnIvkQQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSpRkF1P0tuqGD3nqH+KUH9q5zgReO3i7fsnTGbvqAP8Ui4QKwSWUj1bDfVtF6/TYwgoQzcN9oRLAlq/9y34vvmw+Zwv8Dc87xPdlp52ZlD2p/Rin4/IPc2BLY9LoSObdY5rkKYrD9Nu9mdUVD8OXslgzSgde/GTmElbCflxH/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 84ff44348a3a11f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f71f12f8-d0a1-4ad9-8dfd-f20b14121f1a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:18e8bd82e2c2d5e57c20a3449696fe10,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|51,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 84ff44348a3a11f1aa26b74ffac11d73-20260728
X-User: yuebingkun@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yuebingkun@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 278190004; Tue, 28 Jul 2026 12:12:16 +0800
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
Subject: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI README
Date: Tue, 28 Jul 2026 12:12:11 +0800
Message-Id: <20260728041213.52820-2-yuebingkun@kylinos.cn>
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

Fix "should be use" -> "should use" in Documentation/ABI/README.

Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/ABI/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index 315fffe1f831f..27c962e6a872c 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -62,7 +62,7 @@ Users:		All users of this interface who wish to be notified when
 
 
 Note:
-   The fields should be use a simple notation, compatible with ReST markup.
+   The fields should use a simple notation, compatible with ReST markup.
    Also, the file **should not** have a top-level index, like::
 
 	===
-- 
2.25.1

