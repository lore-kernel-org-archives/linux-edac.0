Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32B2F8E9C
	for <linux-edac@vger.kernel.org>; Fri,  8 May 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251159; cv=none; b=gxj6XUOYndovctT5NcqZOVirwWsInpL1B82HsZ4FxnaWgBDPMJDdNKo875awD0YaoUNDlhLOMBleHgzyaFkxn4gm02jIKydI/nzepuVV9+zxBis46qaFF/z9zIAqFXbheHm54LzS0LbxDXGEwSpJBEbLxDn612kzdh+T2shD3+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251159; c=relaxed/simple;
	bh=B2na0v/CK213xynSpQTcSfmKq1psdKX2ZQ4MNq7eEG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVL+cODHCJYa/5opBVssXiXUcP7K93HbGo9eu3OuumvgeBCqxgxGQwn4wyykSw+rdWhpZlun9hnGtqpM1OU67MgbhFwr6JOb2IR55x0jYyVSVssu7nP1l4+wuB5i9uO51TEnRx2agDy3j76aaNzsxkrMWw1NKpM1QIGkcLfCITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eGAcRrHA; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eGAcRrHA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778251146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lvDNOoWMgwLgdgrJTkSO9bAh4YpPbUijOshu7CPCj5s=;
	b=eGAcRrHA0SDR/Ha9QL3uz9MN3JyzO2JJhB7JCIT6s4DxohUsioJ9mNbvpUSqDq7EKLQ+E+
	EUk0KoiSEeHFV6kzBdlke4XLnr7CL0Y1LgxpcDQt5R/gVVQOWORlwrlfvY2p9EQpvAotfw
	tVvlCwfK3/iZ7tMvJ6qgL6QUCrSkqb8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tony Luck <tony.luck@intel.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] EDAC/sb_edac: fix grammar in sb_decode_ddr3 warning
Date: Fri,  8 May 2026 16:38:46 +0200
Message-ID: <20260508143844.2996-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=892; i=thorsten.blum@linux.dev; h=from:subject; bh=B2na0v/CK213xynSpQTcSfmKq1psdKX2ZQ4MNq7eEG0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl/v5ZsSXmXkSxztNI7LHVX1WW2MsNVCeK6l9hVN7E9d HlZsGZpRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzkXDAjw7opM3/dPP3Ob7bT yXS57Mla0zQUvdWkX3/bZlq1eodkyUdGhj1339ZePz3LN2xdKbva80kHJr1vXPjMvD79HOdBFWa RRwwA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix the warning in sb_decode_ddr3() by adding the missing verb "is" and
using "supported" instead of "support" to match the LockStep warning in
sb_decode_ddr4().

Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/edac/sb_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 7b282dfd093f..35eb7a2038ab 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -2016,7 +2016,7 @@ static bool sb_decode_ddr4(struct mem_ctl_info *mci, int ch, u8 rank,
 static bool sb_decode_ddr3(struct mem_ctl_info *mci, int ch, u8 rank,
 			   u64 rank_addr, char *msg)
 {
-	pr_warn_once("DDR3 row/column decode not support yet!\n");
+	pr_warn_once("DDR3 row/column decode is not supported yet!\n");
 	msg[0] = '\0';
 	return false;
 }
