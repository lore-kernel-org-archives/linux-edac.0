Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AEC33BBD0
	for <linux-edac@vger.kernel.org>; Fri, 27 Mar 2026 02:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579728; cv=none; b=R7FK7QGlrl1Mw0UoyYP5FlJoup+QWvrF+rOpATsvIegVov68r3oumcmJl30qhCYLOw/c6T0xZubpll7cqu3fttmC9brONKrqJlS0VLO8Aa8a+0cIrDsBejl01nF7Zz1BCpBMBMf4RHTERkqPE4tnpmf2+/X/9q8giaQAqWkCE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579728; c=relaxed/simple;
	bh=asWVsSVzuzmjm0bm4hjsbXuKHUxUkVLUJFLHVqPtcqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXDcE0viSfEfV5HQyDYCk6xDvLQWSwhzmfDGi2lH5nW0F8eudzCDweqoPcvVb3Blsvgd1TGB9Y2yM8CERQ/7FDSuAZb2JoGck/CTWrh0Ju4LLemkmJRtqI14gSIDWsFv1FIWz3gGmZo4EdQI76OUPr5ixQ4/Jk0y6wghLfjr6A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfTVFbyG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfTVFbyG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1094863a91.0
        for <linux-edac@vger.kernel.org>; Thu, 26 Mar 2026 19:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774579726; x=1775184526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CDgkowu/puJ35XcKRoiAG5i+KHdrwMmbRhRH/tcCZpU=;
        b=FfTVFbyGklaYzY503EWsatILZoVfZp9S63X4v1OVr02t1wk+qHZ/CSeooKUAGzM9GO
         pvX5nW1YrhdRPr87kk4Ufcz/ksfM9rmWIWwfibVDuOPSqfXKTdCSS0Q92oAn3GoJv6rY
         KfdymvCLriJD8EL4qgZecp4OWCMiSl7Rx+XZdcDd4N4ew6FzetuvX4oGXtprdbrnTXOz
         EJpmgF2bstmvRECUD4gCsdNpvMa9gMK4/VyUpw4DCK2VK1lvSgsHy6X2pD8P6vXI6vbl
         OVJUtsqJRaSqZlTKRM+aqd4pW9dkB1i6PtKVB7gbDk2MwQ3+mbHi+bjfU1+/OErngGIq
         SM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774579726; x=1775184526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDgkowu/puJ35XcKRoiAG5i+KHdrwMmbRhRH/tcCZpU=;
        b=er3Y5U0AOFXjR+Y4CGGjhQ3AObyBCnNotzWFA+WxxZRxOX8wXfwzuagavGR9531psR
         0k2h3Zr77e1BN3xiPkVl5rexYiyak/uZOhTGCbBrTHUT5pFj7+a4IVLy54zj5oqs6H6I
         CRg7epWardlkDWEOSweZYLUugNbk10A1NZYdLP/XVTcQMLjeGZddqbuwuIS4PiQMrdkY
         C9YHBM/ZtVPgtoBa9U7THPq6rzhyayOQVW0J/XnxKrU4we6w5mHEPvgiesVCSojABB8S
         LbfDzDF0cuwLZzR/ltkCwtlaU9YWUUbGaK72NoU2W7yi9kNxQiSKKdXd7g8WcWGVcV++
         N47A==
X-Gm-Message-State: AOJu0Yzlh9hLJZM4pVIRkgY1v11dqS2zMrKodizSonMpeD3sj/n2YyU4
	s/pZ4VJGc4wsNm2H0rjzviDpua7HNunjPfffPggTeNI8XF+BBmQLmZeEFRu+Ill0
X-Gm-Gg: ATEYQzzrXLtZofcrNCXON1KUzdROO49SgwK9Pjh48a+kLM+JrT2deAfBp/lBAa+0Mcz
	PBU/BsWQcPiHjtXFcjQhvsITf/aGkVNw+zFrsLZZe51etkqYhmVPH0bLS6kuMubW9ieVzY97Bhs
	OiJ8B1wDj1JCoDCe8bz0m1izvwUGAf7Fe8a40DY2CkkYF/3d/oH0e01cCGgGsk8DAEefueqytan
	NHNlR2oav/nGw/xb9+sZdMW/SSeV98yKXhQJehw+7MlyJAKPWT3w9uulQ5Tws161c1DBp6zl1UE
	E+x3xoIqL4sLRJ1tUGVfeDghiLbQoiCE2AJLiQidrbsDerW7wElbJx4KQk1e/Cu+gpJ5c9Q+RkX
	J97ZvI72nFIHFej0E/dBl7HSOFxmS+bl7580sxynXalBoTlDduj2q4YYtl7shZh4hO8szkXCE7q
	GzQOYv+bXkHAU/d0iNc+IhU3t8OTpPrST+gU2S6ZpTFnAE/IBcifJGWQk=
X-Received: by 2002:a17:90b:3fcb:b0:359:d54:846f with SMTP id 98e67ed59e1d1-35c2ffad934mr983155a91.7.1774579726440;
        Thu, 26 Mar 2026 19:48:46 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22cc0943sm2994487a91.13.2026.03.26.19.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 19:48:45 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv3] EDAC/mc: Use kzalloc_flex()
Date: Thu, 26 Mar 2026 19:48:28 -0700
Message-ID: <20260327024828.7377-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert struct mem_ctl_info to use flex array and use the new flex
array helpers to simplify initialization.

Add __counted_by for extra runtime analysis when requested.

Move counting assignment immediately after allocation as required by
__counted_by.

Move memcpy to make it clear that this should have been kmemdup_array.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Reviewed-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 v3: move memcpy after n_layers assignment
 v2: reword message slightly.
 drivers/edac/edac_mc.c | 10 +++-------
 include/linux/edac.h   | 23 ++++++++++++-----------
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index 29e9828422bb..07d3f73bcd23 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -203,7 +203,6 @@ static void mci_release(struct device *dev)
 		kfree(mci->csrows);
 	}
 	kfree(mci->pvt_info);
-	kfree(mci->layers);
 	kfree(mci);
 }

@@ -361,13 +360,12 @@ struct mem_ctl_info *edac_mc_alloc(unsigned int mc_num,
 			per_rank = true;
 	}

-	mci = kzalloc_obj(struct mem_ctl_info);
+	mci = kzalloc_flex(*mci, layers, n_layers);
 	if (!mci)
 		return NULL;

-	mci->layers = kzalloc_objs(struct edac_mc_layer, n_layers);
-	if (!mci->layers)
-		goto error;
+	mci->n_layers = n_layers;
+	memcpy(mci->layers, layers, sizeof(*layer) * n_layers);

 	mci->pvt_info = kzalloc(sz_pvt, GFP_KERNEL);
 	if (!mci->pvt_info)
@@ -379,8 +377,6 @@ struct mem_ctl_info *edac_mc_alloc(unsigned int mc_num,
 	/* setup index and various internal pointers */
 	mci->mc_idx = mc_num;
 	mci->tot_dimms = tot_dimms;
-	mci->n_layers = n_layers;
-	memcpy(mci->layers, layers, sizeof(*layer) * n_layers);
 	mci->nr_csrows = tot_csrows;
 	mci->num_cschannel = tot_channels;
 	mci->csbased = per_rank;
diff --git a/include/linux/edac.h b/include/linux/edac.h
index fa32f2aca22f..deba46b3ee25 100644
--- a/include/linux/edac.h
+++ b/include/linux/edac.h
@@ -541,17 +541,6 @@ struct mem_ctl_info {
 	struct csrow_info **csrows;
 	unsigned int nr_csrows, num_cschannel;

-	/*
-	 * Memory Controller hierarchy
-	 *
-	 * There are basically two types of memory controller: the ones that
-	 * sees memory sticks ("dimms"), and the ones that sees memory ranks.
-	 * All old memory controllers enumerate memories per rank, but most
-	 * of the recent drivers enumerate memories per DIMM, instead.
-	 * When the memory controller is per rank, csbased is true.
-	 */
-	unsigned int n_layers;
-	struct edac_mc_layer *layers;
 	bool csbased;

 	/*
@@ -609,6 +598,18 @@ struct mem_ctl_info {
 	u8 fake_inject_layer[EDAC_MAX_LAYERS];
 	bool fake_inject_ue;
 	u16 fake_inject_count;
+
+	/*
+	 * Memory Controller hierarchy
+	 *
+	 * There are basically two types of memory controller: the ones that
+	 * sees memory sticks ("dimms"), and the ones that sees memory ranks.
+	 * All old memory controllers enumerate memories per rank, but most
+	 * of the recent drivers enumerate memories per DIMM, instead.
+	 * When the memory controller is per rank, csbased is true.
+	 */
+	unsigned int n_layers;
+	struct edac_mc_layer layers[] __counted_by(n_layers);
 };

 #define mci_for_each_dimm(mci, dimm)				\
--
2.53.0

