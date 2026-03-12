Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C340536D4FD
	for <linux-edac@vger.kernel.org>; Thu, 12 Mar 2026 05:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773292113; cv=none; b=E/YSbhTKqpGpD6Wxs9hATRhD10Wsh2XI02fCO7cEwVr0zRR0R8GA6BO4W4DYxlZ+TchE6ETX0K4nGqG8KDLo22xqctAVJiNjNUz+6mYmStcEt46hUGXFqF/zzfwB0O/UdfEEIOa/MxQzYPghAMvDXlLYOII94EpATyHWShHUlWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773292113; c=relaxed/simple;
	bh=VoUnsqUa2CjJvSkODbwmVCtNMW5aOlRcr358eQoOc1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnJAlFVQ87SXUde76sUhEfyLx5lMJ7yAogl4ZPloucG5hXAnADIiG+tTBxxfXfonWk10StfSfUhiG3CHFgcvkdJsIivmmXW30dQYSpaMNxo8XGZ0lIm1rFPnX1GGXFkOzBO5vfbrH2tp804V93Q51H1lvdH25T++/3Di5Z/zOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxfy8ZyW; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxfy8ZyW"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf43014d0so4854365ad.2
        for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 22:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773292112; x=1773896912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLyWI/vZ6KJ+d4HD/0yXDVb44fVq/X3hpM9ycM+cxjc=;
        b=jxfy8ZyWtJLsmZnOeDmwPDWWkffARsHuhAFr7CmVzpvV8hdPyAtgfaw2tdEXW/riNL
         Kp3uo9HwT3yby293nmBCHXhubc1w9Wn+fuGHzu2QKy1wgqRhyo+GLNrk9Jt5tBsE6axw
         fa2EOfHqoKCl6XdKE/SVYm0/sTUzWV7p7ZXdhOeFtVkY7OEPCMda69Cu/VAj5RbX7i2C
         xmpY9GBBxc+jW10SoBlsAswP3vlN9xreUaYXozHolx62Ua2yTCoaNgXM78vw5mzJGNfE
         i5T+xNIQ3+31BQsw+X00KEQwoGXHySD7cVLHDNsmd/bsSqqZiSp3Wdwn6f6/vPcai7Uj
         eLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773292112; x=1773896912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLyWI/vZ6KJ+d4HD/0yXDVb44fVq/X3hpM9ycM+cxjc=;
        b=bmumeI9Iv3MBMb+2j5O84qQyhRjpSx/rVH0vdEKIuXLVoQ2DB4znfB0/VR2z3ao6V3
         90zqex54yu0v79FQnTVzVFpjYPv6JYasS44IR/m8KAvj6nk8SMrAWyXjPy4QKnnTHe1p
         BXP1oiPVjQhyjkmQGdGypdUcf7pDMEUhdz6LdF9QvzGamtajXc2Tjr0zgKCrRnOUY39o
         SHPGUDJw9DKHdDGZdXbpzyr2jRtve6T1EBCJEV//3u41/5Vr2aql7pwxsHBMM1c7/46O
         TzZSa5m/91pkuXJSMXSpAUGHLJqH7i68KCMlh5exHSX25/+qxOQKh0zpV8T+UeK+ig5C
         i7sQ==
X-Gm-Message-State: AOJu0Yzng6VjO2WK+s2GjM5zf9lM85kp+5bc7J8K9Vnl1Mq0hGT5Vfo6
	cG1uxur73pvfUzdRyGT+s3pq5Jt269/va/OS5DcCmopleh6cd9LNK4P71FfTu/IS
X-Gm-Gg: ATEYQzyQeRsHuR8BMYGqtlzxogtfac/fD6BI+j1U9hrkpzEcVq+R6W2ejo3PsJUuT/m
	6P65Gt2ANfIGqaYDmJgE199IN3hvBbyh84ee0Srzrb0mreG+h7PnMehi7kzjzhALWkEajcRaWj4
	WNe96F+uzsp+TmqDTDlNoLcOSatOeAnhiP1MoejK/+YrTxGnZoBwjIAJ6+KXXPJS+nn+B1NqUPH
	r+H+7RHJj/p7yo7ILy/VlzC6UmnKC6E76WMxAj7z96EIybL3SpynU1axwSB/DzDEtAjTR3qop+n
	jm6g9EHEK9WF//MQF6luR1Lfpeqx7g/Ssdv1OLUIa/aP/GQl8WoU/yMxEmV70lR2Nf5gPvoELzm
	1AYOnIgfdnGFTwgpaCXSQW0CT7xo6JZaq6udpcTqRdpB661iFE6H3osysQSiUbT9Etq4c8TeNP6
	qGJ3vwWAskLQRSEbAItFP1Z10j4Tgmovoxhm4CkVqh9WABeJEcb8NlHw==
X-Received: by 2002:a17:903:2b0c:b0:2ae:3dcc:eb19 with SMTP id d9443c01a7336-2aeae7be9b2mr55414965ad.19.1773292111873;
        Wed, 11 Mar 2026 22:08:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae2228f5sm42044625ad.16.2026.03.11.22.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 22:08:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] EDAC/mc: Use kzalloc_flex()
Date: Wed, 11 Mar 2026 22:08:13 -0700
Message-ID: <20260312050813.9915-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change kzalloc + kcalloc to just kzalloc with a flexible array member.

Add __counted_by for extra runtime analysis when requested.

Move counting assignment immediately after allocation as required by
__counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/edac_mc.c |  9 ++-------
 include/linux/edac.h   | 23 ++++++++++++-----------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index 29e9828422bb..1ffab0269aec 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -203,7 +203,6 @@ static void mci_release(struct device *dev)
 		kfree(mci->csrows);
 	}
 	kfree(mci->pvt_info);
-	kfree(mci->layers);
 	kfree(mci);
 }
 
@@ -361,25 +360,21 @@ struct mem_ctl_info *edac_mc_alloc(unsigned int mc_num,
 			per_rank = true;
 	}
 
-	mci = kzalloc_obj(struct mem_ctl_info);
+	mci = kzalloc_flex(*mci, layers, n_layers);
 	if (!mci)
 		return NULL;
 
-	mci->layers = kzalloc_objs(struct edac_mc_layer, n_layers);
-	if (!mci->layers)
-		goto error;
-
 	mci->pvt_info = kzalloc(sz_pvt, GFP_KERNEL);
 	if (!mci->pvt_info)
 		goto error;
 
+	mci->n_layers = n_layers;
 	mci->dev.release = mci_release;
 	device_initialize(&mci->dev);
 
 	/* setup index and various internal pointers */
 	mci->mc_idx = mc_num;
 	mci->tot_dimms = tot_dimms;
-	mci->n_layers = n_layers;
 	memcpy(mci->layers, layers, sizeof(*layer) * n_layers);
 	mci->nr_csrows = tot_csrows;
 	mci->num_cschannel = tot_channels;
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

