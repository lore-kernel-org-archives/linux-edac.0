Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7396721CC5A
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 00:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286013; cv=none; b=K7+Vg4J7M8JLg+uR8dFWo5vfP3ZmJffxowMNkAZsMoKJ2Kzz9bG7cu82uTD4EhL/7uJ7uZdDkqT5koCK7455kLo0T6+ntoKJs9jpwDN9uJUwh1HLpWK4Uq2QhvJsVnFAa+FvWTzHrD1ruM7LvEYvZBgrB6G5+rg9SQ470n6kUy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286013; c=relaxed/simple;
	bh=pg0YQExBKD1QBaMwIK+8w4kMFIM1KokG0edT6frwxlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2083/6imcfsMshkNucBO3mUX1D+A3tftnL2ZAndOExyPffErkGi2jG+Bt6FhqrymkBq8TUDyxVi6L6SOB+2r+rcWvXlbDLAkysC4uemA0uTe+x8i7kLrBvepWJxfc+HAyFFKzHQn5I2aN7FYR94UJlPMn4QDqZY/ybqHTPk2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baA750o8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baA750o8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so4691165ad.1
        for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 17:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785286012; x=1785890812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+/PYQKf0JDqIIDQm8H4gTdIyq8keoILKfJLaIqCIM/c=;
        b=baA750o8TxoouBmAsc4HizWocRKLnAjxf2bdxQkuUWMcK6KF4GwTyTt8JdG/QQSTqE
         P3DUzQgeVHetVgp1BbeXhX0ZRYxf+1JrZ96wErKZabY35Gj3sqfVUK8wIFhU4W3X2ibG
         nS+eU+Al6Oq63tUnrjb9wSOOBvdRpulZ58kQQ0aDFZoWkd8UFxxHIoNIIJ6GApt+22dI
         8p15JmCn2En4qsSoNZ7qE5BvdOfAI5Gs2Eg1fAmCR7T3bwY7JhaoD/iiopgKUnvsBZeM
         ZQ7YHo4HuvEjWLbPybIQgLUI0O90B78M8BitpQ8TwmXKNcXQQVK77mQZrXWccPUTdljm
         G9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286012; x=1785890812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/PYQKf0JDqIIDQm8H4gTdIyq8keoILKfJLaIqCIM/c=;
        b=R3/hUuOQEtLNQ3EuhOFiOwnbfjFplXAdX604z+K2DouXUUai31zJH+dGrKTCTb9MHY
         0peAfhAuyyERLKNBGoaFj/Jbuo1BCAzWmAgpzirIESRVp0CB6CMUlM9g4NOBsAHgNq9c
         3SsSJEndmhER09wX36okaevwVm2vRUcB+X9UfKKN0ORb+WSVfvPS2cw8HUvlMn4byeFI
         rltcAKg8f8C4U+33xRHQ526YbZk1dn9iiRaSBJN+z+pZK4yiYbHNG8gBo8ubg74tDxAA
         TxRovncyBpKT8IYi8VEqf7OhwihGuMpJTdRww/I9lyBQ/cgC+x8JdqX3aYvHT/xc1ZUd
         D/2w==
X-Gm-Message-State: AOJu0YxBAjKL07vMKIPJKA56tD+eN3SLPg5/M9gRCoPJxLo1S/28U1Xl
	Io5818mh83mrR6kBrA7fjvA1uejvF9dnkNApIX07g8UbyWdcbTETq4/B+9jI+xqD
X-Gm-Gg: AR+sD12IImB+Mhs64SdQ1HUlH41ot3YfmL5cLSAH1wYXFiFpsVIhylf7AGgWrlxt0lq
	zFh8w0032mEghovN0fLy1oVr+gXuW2hhgt1hvidO/Fcgyr+7v44A3NH+zoeEQlAh3riCf72QCXR
	3ON7BnkEOP+4K6ygmB1dkgZtngOL9biQ39vSCheXgk+ApBAn17ZHCdPyLufa6DTna9zc6uljDZu
	gpDiNTevQr102T3kEIor4TDPahse6CbvzPCDiql3Nbh2YVaM+uFXd1wpcU/3eHkqvfC9CDI7dJg
	P+IOKZqdzlypRrfaaXVvXFeTu9uAqKD/bmpjndtB/hj56aD3x3I8W2dyWiVuDMPK8cCU1KU922N
	BxiFQxGEbSdStd1KUYv5ZhL/KAbrvWJBgrpwp/M/HazcuoU47qzYz8oGIGGcvfdUYaVNNyB0zVa
	CjxCcfwgJ23uW7uwwHghQqE0ZmlgZbRjgu25keNpV9VX5GFjcy0iX5bWdf5+4AfOuJGd0RLWLi/
	tobBAxVgf03rSEIawA5ZB3Y2qq7bhXqhsxWKtIgxO9iVkCN+5riqvGuhOD2Y7v1mtxJSMp8mxHj
	HKYkRh8a+eI7EYMMqsm7kce5CWAF+MUlfPKgyek=
X-Received: by 2002:a17:903:26c4:b0:2ca:d976:95ce with SMTP id d9443c01a7336-2d015d661dcmr49142535ad.39.1785286011753;
        Tue, 28 Jul 2026 17:46:51 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d024b114a5sm1588145ad.21.2026.07.28.17.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 17:46:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] EDAC/mc: embed channels with csrow_info
Date: Tue, 28 Jul 2026 17:46:48 -0700
Message-ID: <20260729004648.601130-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine allocations to avoid separate
freeing. Also emded the actual array to avoid separate allocations.

Add __counted_by for extra runtime analysis with UBSAN.

Move tot_channels assignment to after allocations. kzalloc_flex() does
this already for GCC >= 15.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/edac_mc.c | 33 ++++++++++-----------------------
 include/linux/edac.h   |  2 +-
 2 files changed, 11 insertions(+), 24 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index fd70caa85574..0fff56ce21b4 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -179,7 +179,7 @@ static void mci_release(struct device *dev)
 {
 	struct mem_ctl_info *mci = container_of(dev, struct mem_ctl_info, dev);
 	struct csrow_info *csr;
-	int i, chn, row;
+	int i, row;
 
 	if (mci->dimms) {
 		for (i = 0; i < mci->tot_dimms; i++)
@@ -193,11 +193,6 @@ static void mci_release(struct device *dev)
 			if (!csr)
 				continue;
 
-			if (csr->channels) {
-				for (chn = 0; chn < mci->num_cschannel; chn++)
-					kfree(csr->channels[chn]);
-				kfree(csr->channels);
-			}
 			kfree(csr);
 		}
 		kfree(mci->csrows);
@@ -222,26 +217,18 @@ static int edac_mc_alloc_csrows(struct mem_ctl_info *mci)
 	for (row = 0; row < tot_csrows; row++) {
 		struct csrow_info *csr;
 
-		csr = kzalloc_obj(**mci->csrows);
+		csr = kzalloc_flex(*csr, channels, tot_channels);
 		if (!csr)
 			return -ENOMEM;
 
+		csr->nr_channels = tot_channels;
 		mci->csrows[row] = csr;
 		csr->csrow_idx = row;
 		csr->mci = mci;
-		csr->nr_channels = tot_channels;
-		csr->channels = kzalloc_objs(*csr->channels, tot_channels);
-		if (!csr->channels)
-			return -ENOMEM;
 
 		for (chn = 0; chn < tot_channels; chn++) {
-			struct rank_info *chan;
-
-			chan = kzalloc_obj(**csr->channels);
-			if (!chan)
-				return -ENOMEM;
+			struct rank_info *chan = &csr->channels[chn];
 
-			csr->channels[chn] = chan;
 			chan->chan_idx = chn;
 			chan->csrow = csr;
 		}
@@ -272,7 +259,7 @@ static int edac_mc_alloc_dimms(struct mem_ctl_info *mci)
 		struct rank_info *chan;
 		int n, len;
 
-		chan = mci->csrows[row]->channels[chn];
+		chan = &mci->csrows[row]->channels[chn];
 
 		dimm = kzalloc_obj(**mci->dimms);
 		if (!dimm)
@@ -613,13 +600,13 @@ int edac_mc_add_mc_with_groups(struct mem_ctl_info *mci,
 			int j;
 
 			for (j = 0; j < csrow->nr_channels; j++)
-				nr_pages += csrow->channels[j]->dimm->nr_pages;
+				nr_pages += csrow->channels[j].dimm->nr_pages;
 			if (!nr_pages)
 				continue;
 			edac_mc_dump_csrow(csrow);
 			for (j = 0; j < csrow->nr_channels; j++)
-				if (csrow->channels[j]->dimm->nr_pages)
-					edac_mc_dump_channel(csrow->channels[j]);
+				if (csrow->channels[j].dimm->nr_pages)
+					edac_mc_dump_channel(&csrow->channels[j]);
 		}
 
 		mci_for_each_dimm(mci, dimm)
@@ -758,7 +745,7 @@ int edac_mc_find_csrow_by_page(struct mem_ctl_info *mci, unsigned long page)
 		struct csrow_info *csrow = csrows[i];
 		n = 0;
 		for (j = 0; j < csrow->nr_channels; j++) {
-			struct dimm_info *dimm = csrow->channels[j]->dimm;
+			struct dimm_info *dimm = csrow->channels[j].dimm;
 			n += dimm->nr_pages;
 		}
 		if (n == 0)
@@ -904,7 +891,7 @@ static void edac_inc_csrow(struct edac_raw_error_desc *e, int row, int chan)
 	if (type == HW_EVENT_ERR_CORRECTED) {
 		mci->csrows[row]->ce_count += count;
 		if (chan >= 0)
-			mci->csrows[row]->channels[chan]->ce_count += count;
+			mci->csrows[row]->channels[chan].ce_count += count;
 	} else {
 		mci->csrows[row]->ue_count += count;
 	}
diff --git a/include/linux/edac.h b/include/linux/edac.h
index 3902c3789510..3d8ee12c11be 100644
--- a/include/linux/edac.h
+++ b/include/linux/edac.h
@@ -448,7 +448,7 @@ struct csrow_info {
 
 	/* channel information for this csrow */
 	u32 nr_channels;
-	struct rank_info **channels;
+	struct rank_info channels[] __counted_by(nr_channels);
 };
 
 /*
-- 
2.55.0

