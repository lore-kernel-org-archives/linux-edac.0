Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED7019D891
	for <linux-edac@vger.kernel.org>; Wed,  8 Apr 2026 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775652738; cv=none; b=IbP+6INUkigwbFuh0jzQYAYv/v3shIWW8UvQXwV6FeC6Y0TfJOsT28PRWgLcGlzgoykSWuvq9kvZ+weB5DAu4b6/Z1nPPDCTBakkIWfmtUKE8PGYk0rkVxvXnPFYzwU9GTdeQsQU1NyW3prCPXzB5AerjKEGIwzLy9W8rMs3DuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775652738; c=relaxed/simple;
	bh=Wwd4N6ncFuXPGxq/M+7f/7qFh15fDnsEzHfxH9LLEc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GusZPJtV4AoYjW8Wh7VZt8DujdzMjHETJqQqZHyXlNbCgyby8B5mHyFk0/d8fVk4xY4xatubY7C1XnN3Kv94h9bfFgtDOOb2IZKT4t3ia/0T6z/rlIwTgqsEmn5NUzfXDe2a+FloEPQFL5jV4axukavmxBhc3UR7moGTwKRWDJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Hd1/8BTW; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Hd1/8BTW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775652735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x5WN3XIizGyP40gdWVZGFy8MHGJBU2//F0o6j8F4WMk=;
	b=Hd1/8BTW8rWS9VgK9ZWl53FiVLvcOSLUJ4BfGPnIy6kyHp8F74u4R1qIn2ohimVlNBfttb
	X9NEXq6/2reYPxk9jPcmKkrnkOKS77eRNsYd67+kzhgZv/RdNfo6ydTfijc/N1QhOActbn
	7v2uaKFP0yfwR2grm0xECKTpP1FDENA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Tony Luck <tony.luck@intel.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC/sb_edac: fix grammar in sb_decode_ddr3 warning
Date: Wed,  8 Apr 2026 14:51:42 +0200
Message-ID: <20260408125141.1145434-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=thorsten.blum@linux.dev; h=from:subject; bh=Wwd4N6ncFuXPGxq/M+7f/7qFh15fDnsEzHfxH9LLEc0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnX/GMFK1jiTbd2PDsoELFX5v6+AMv7y008nge0872Ja kw5pR3fUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABPJ3sPwP5uvpnCfNFtpxsGk FW9FsjldvFZf7frwrnzpqwNXpX4bKTL8U8q0iAu6e23SzOpvOk9zOuQXiokWvtyoP1O+71H9da2 1DAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix the warning in sb_decode_ddr3() by adding the missing verb "is" and
using "supported" instead of "support" to match the LockStep warning in
sb_decode_ddr4().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/edac/sb_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 09d4e816404b..694e4e199234 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -2024,7 +2024,7 @@ static bool sb_decode_ddr4(struct mem_ctl_info *mci, int ch, u8 rank,
 static bool sb_decode_ddr3(struct mem_ctl_info *mci, int ch, u8 rank,
 			   u64 rank_addr, char *msg)
 {
-	pr_warn_once("DDR3 row/column decode not support yet!\n");
+	pr_warn_once("DDR3 row/column decode is not supported yet!\n");
 	msg[0] = '\0';
 	return false;
 }
