Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB9C282F3E
	for <linux-edac@vger.kernel.org>; Tue, 17 Mar 2026 03:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773717430; cv=none; b=DqAhC5XGyIWv4+oGL9Wxs2QprcKqKLx5t6b9lEUbx40f0mx04oOT7ueFkYJlXsAcHZ38w/F/D2OhMt+jSd33mQxQy7VmBNAzpUsGeMUmtPI8mkCdXnK46LPcYsvIs90iHl0qwEQH1j4R2DMUt2OaCN3HaHoZV9PcnnAEJwMjeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773717430; c=relaxed/simple;
	bh=k6Ew+lvXzfY+FBqQY/XE6H20WHXueQjInyqHxkeuCow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uv7VOAZeDCe3sr61OZFuLckSHkJcxEX700LKD8K/AJOOzM2ow/tvhhZNg1oy+K09X8kynbZW0MHQ2X/tDnT+5ThYLZbA6i+cjnCQ+GX1DfoFa/E9JmQldO0NZG44uDSCLnOEfaOr4meUZ0NGD2Oy7ie+0K135ibYyTveQ3Y31TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=depkSuI8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="depkSuI8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a871daa98fso39558385ad.1
        for <linux-edac@vger.kernel.org>; Mon, 16 Mar 2026 20:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773717428; x=1774322228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cS+uHVcQ6W17khP+tSxWlPevxoYz4a9bCO/ehxDx5zg=;
        b=depkSuI8pjTzuawErKNfbHULZkrrr6oEezBq0fsyv20AEtfeQo1QWsmlSXF2mM4CnL
         ufCgeJDO7vQUPwuXxNih0BshyzmNFX5SQRqz6dflhsre3a12/8YfBuTihT3SBEKq2gPf
         cYGjwdR+EbagoStLmh7FxmFbmGBVlZlJ8icmJevhHGXLjf2Bia3LqoM2H4WZwpOVnuVJ
         6D1EHr52bIvcX47PuIytp82HNIojaj20oTRrcL81EczbjdVzt4Q91O1YtrwEBPnwD1ax
         ukQuk7RO3caTr/6xM4su+cB67NhArp2eeR3tndVcIRCjNIZMlRUQOsxqPMzjkoyI7ccX
         bCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773717428; x=1774322228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cS+uHVcQ6W17khP+tSxWlPevxoYz4a9bCO/ehxDx5zg=;
        b=TxncvUgKTkSAU0wJoizfe0+jYxtpfFyfPm9tIpiipy0Na6zWPjNkOOYtQ6H1hNjb5r
         QIPCs7oGApL3AY3BXRm1mIivJn2ZOXygkMJrKu1z3t/O7h7ctZdiZlycAedr1wcN3grk
         QaROfnmUYbbg1qOl0fHvZuMNDeundmYv6skEnYNunxjmiJIn00ZFS0IrteziGl135jNo
         EGOgJ3EXnvanyUQp9CoGTSwD0vCatbyXPM1AjvRcPily6a0g1WXeKpBJ2ICyC/ryPRdj
         pdDR4Kz32dPZYUKrXHsWZuUJYQe2p7ct74FfQ/BIPr7Bhzeb5cbVDeiUoau5jCh0vsIY
         I5lg==
X-Gm-Message-State: AOJu0YzB/cmgsvL3tb7wqTyOcN5Hw3E0z9kwIdjzwQy0I0g2jgm3BU4t
	IXmlMvd0nzdbVR9RQTvRSDmvFLpvvGEeqGAkLrQTOvW0DnOEa3YDL1yWalXS1oCZ
X-Gm-Gg: ATEYQzwEThIhwfDhfF/jgXKuW7wV+KkGmJfAnO0I1tOh+IJbR2DGfZxtOrSHXi42Dcq
	VuB4cmVyY/TD+9wFf58H+RdOw67vwg7PSHsKER7SBpn/coqe7sF9X6BPDEclMGSW/yiwHXxJqjm
	RXDZRaiVVOl1SuuT3JEbS69GVvaudY+8fxBluCHVx5lMhb8AOhIpkDWh6ty29DHOBB53t90SSVD
	k68Yqz5lmTqJ+Zz2M8ySulhajfpsR2MS4zS3Sv6asQZmXib5HfGi90k9mugOQKa5xWBj1F+EJ+i
	rN1IdsI95ljzxNp1E+DAO7syU8pcHjXHX0HV08GeK8pq4DpDI+IzQFOZ+GrzHfxfaHAkYY+3pq+
	WBe/ftec1+AHg91SxEAh3TUm+ErDtetVp61csRzOd/wPbHmLpKaIE0ZBXu3PjNsU2YKZFQSkoQC
	Qu5Aa8xFlCZ3XZJyMbHdpvHBuXx6zJ0IjqmsdwNZDn7WtDRKzwhuyC3nk=
X-Received: by 2002:a17:903:2b06:b0:2b0:68d1:2557 with SMTP id d9443c01a7336-2b068d12649mr23135ad.45.1773717428472;
        Mon, 16 Mar 2026 20:17:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c2b9sm149564365ad.18.2026.03.16.20.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:17:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Yazen Ghannam <Yazen.Ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] RAS/AMD/FMPM: use struct_size_t
Date: Mon, 16 Mar 2026 20:16:50 -0700
Message-ID: <20260317031650.93712-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoids manual size calculation with the proper helper.

Also use kzalloc_flex for the same reason.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ras/amd/fmpm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
index 34ef75af31cb..af862fbb04a8 100644
--- a/drivers/ras/amd/fmpm.c
+++ b/drivers/ras/amd/fmpm.c
@@ -150,7 +150,7 @@ static unsigned int max_nr_fru;
 /* Total length of record including headers and list of descriptor entries. */
 static size_t max_rec_len;
 
-#define FMPM_MAX_REC_LEN (sizeof(struct fru_rec) + (sizeof(struct cper_fru_poison_desc) * 255))
+#define FMPM_MAX_REC_LEN struct_size_t(struct fru_rec, entries, 255)
 
 /* Total number of SPA entries across all FRUs. */
 static unsigned int spa_nr_entries;
@@ -794,8 +794,7 @@ static int get_system_info(void)
 
 	spa_nr_entries = max_nr_fru * max_nr_entries;
 
-	max_rec_len  = sizeof(struct fru_rec);
-	max_rec_len += sizeof(struct cper_fru_poison_desc) * max_nr_entries;
+	max_rec_len = struct_size_t(struct fru_rec, entries, max_nr_entries);
 
 	pr_info("max FRUs: %u, max entries: %u, max record length: %lu\n",
 		 max_nr_fru, max_nr_entries, max_rec_len);
@@ -826,7 +825,7 @@ static int allocate_records(void)
 	}
 
 	for (i = 0; i < max_nr_fru; i++) {
-		fru_records[i] = kzalloc(max_rec_len, GFP_KERNEL);
+		fru_records[i] = kzalloc_flex(*fru_records[i], entries, max_nr_entries);
 		if (!fru_records[i]) {
 			ret = -ENOMEM;
 			goto out_free;
-- 
2.53.0

