Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8DF3FE668
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538767; cv=none; b=uMSZ63A6+L/h1veKTt3+sEPiESDLWRdePgh+n2dfeNrkykXMEOz8X3Lwa2s3VEuNCVDGiNXpYW22BL6DBfKmw01DaQGhZIma+xkakjolPNC9JEIjDB+bBhEePGZkf0UkZ8SNkbISPLNuy/by68ypGlZCOurea5+9QtDG/YPZWes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538767; c=relaxed/simple;
	bh=M09yHag7up4F6kPXAiAdNXxj3svLe/ZEuWUuZV0Sj+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmvkjU5CObQ+2wsUFZMe7VZs9oK4Cve9QbThGY+N68i9loKdydWEbNg1oQd7UT0HXhkLdoQE0E85rsqWG3cj8mbn5jaV0u+ilod2L2/cXNKv4gckL4vnRpOjxLBauxm4DoyW8UILm4Xxng5rtxUGCNUshvZOUt7QUJzx2vAW6Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyWRZmkY; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyWRZmkY"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c795f441ff7so364386a12.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777538765; x=1778143565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqWhyLhoWLxiaF5WQsCMkEz/2G7cVXnnU/08nqY6P74=;
        b=nyWRZmkYUpUbqUCT52rzL/qe5+zinO2og9ZtPqMJ1z4XM943sj6Nx/0gSZ4nDc7c2s
         kE1YQT5W8ySzcNvA+xyYt80Vdu+QHpbhPcLXYn6paFn3pse/ShO2zUGTVmvMIouyq9me
         1orAmzRyNTTE+yeVBOqFL0A3Xj6/gwssHmary6nigjTRy0zKm3mTorVQeK7mBjRuD4/B
         qgx16SdZ72ZXDoeJS8ktV3+RC9cIFADe3l5T/GltbvGZ1H4kNoq8+4wclBYaaX8CUe+X
         aB6vVAhHipk4Dcur/zZto5eWU1S9UtK6sPwka5nn61yGGqGbrqn6aZAo6wTYzOi7DgqP
         hBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538765; x=1778143565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqWhyLhoWLxiaF5WQsCMkEz/2G7cVXnnU/08nqY6P74=;
        b=Ijo3nFFqOctSXVY7iFPAT4GCw+Sc/vIoQ9j5hcO/vQEWuYdNdaMyaZi3SY3gQeRpcy
         PD4h08aPW12LSZ0xrDeaChWDg2PV+fWHM3G734JrXRqRnE7XEhWBxNtW54bnGToo9tQj
         lXydItUcUHassU7pqUX3c26IeaUoRxPeum3hspuEv1b3YpHkLzw+iU7LhDcLijFHZizH
         DhrexMC+Nw21ERzK956vZKGZkpsXNIuMS8BCTWPmyg9jjHgZdmQknCvmof5Z2OYdQz9K
         QqFz8VWKrGs+xuqNYfrkw79DOKR77T0T+bIzWlPjyZj5NC0JEXNWaj7/d002t/sTmhFo
         OpPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eE2JX0YFAsr9Pp5ZrC7nomBKt0rrNtSrLK3LEKm8t25LhI6Uuhbwlon582LleJ9Aa0BcE3FkfDeT3@vger.kernel.org
X-Gm-Message-State: AOJu0YxMy5hs1du+x/i7rsHzYnJpULJOcMZxpgr+09sBcfBszW8Jb5Tp
	KUGisjxHAaCZh3BYp2xOSTVA5c2+9ZlARC4LAprO1HxKIBEt2cMW9RA/
X-Gm-Gg: AeBDietINyE5LU2RjnLp/h0UKjg91fSyS4YLpYHRxeLC1Oiv4zmQmkfbx3i5lCvDwjz
	ZKqF6tX9IPyArT12zi/0rwH0yuzySrvdMyAGid1UIzJJSdvx400R8uFji2ZCOmIHvEMJYVFIoAY
	KXYJ9JJMJcIW1zNfkCQC2qvnrvSQkEArHjGzY7Be+0Wi+inoByifl42DkgC40nJ4AViVYFo5oip
	cGtybyxRv4RHCDXXfltH5Xa42WwHyTZ3VotgrjPXxBsfN+UPhUX6MbfYhmbsc0xZCgIiWA4XcFv
	f1eyHY9PsfCHA4iiGIziOoysQSqZh9uLvF1X5pijXuKo3sVaOkiKOdG6dBqT2K4jK2RPcKCzY7T
	+t26GtkwaSs0lC184G/OiV2Hucg3FxgRmUPgWFbr5bfcEfOFo2KVGmlaTgfmGDbpkqhf/8i0+hm
	Uu8waolEYgW1AP0V3NfeszjBRW8Mo9tCWEWgyJ0hudy3Em35zO02yelk8T0jviyAvrnlv6UXc=
X-Received: by 2002:a05:6a20:9143:b0:398:77ae:8d8b with SMTP id adf61e73a8af0-3a3cf565b34mr2351455637.10.1777538765020;
        Thu, 30 Apr 2026 01:46:05 -0700 (PDT)
Received: from pop-os.. ([103.100.151.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606a079sm4133130a12.12.2026.04.30.01.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:46:04 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qiuxu.zhuo@intel.com,
	Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH 3/3] EDAC: i5400: disable error reporting at teardown and refactor helper
Date: Thu, 30 Apr 2026 14:12:23 +0530
Message-ID: <20260430084223.9298-4-tushar.tibude1000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
References: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If error reporting is enabled during initialization but initialization
fails immediately after, or during normal driver teardown, error reporting
is left enabled in the mask register even after exit.

Replace i5400_enable_error_reporting() with i5400_set_error_reporting()
to combine enabling/disabling. Disable reporting at initialization
failure and driver exit, before call to i5400_put_devices() for cleanup.

This ensures clean hardware handling by disabling any unused error
reporting bits before exiting.

Signed-off-by: Tushar Tibude <tushar.tibude1000@gmail.com>
---
 drivers/edac/i5400_edac.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/i5400_edac.c b/drivers/edac/i5400_edac.c
index fb49a1d1d..ae4f92989 100644
--- a/drivers/edac/i5400_edac.c
+++ b/drivers/edac/i5400_edac.c
@@ -353,6 +353,9 @@ struct i5400_pvt {
 	/* Actual values for this controller */
 	int maxch;				/* Max channels */
 	int maxdimmperch;			/* Max DIMMs per channel */
+
+	/* Hardware error reporting status */
+	bool enabled_error_reporting;
 };
 
 /* I5400 MCH error information retrieved from Hardware */
@@ -1223,10 +1226,10 @@ static int i5400_init_dimms(struct mem_ctl_info *mci)
 }
 
 /*
- *	i5400_enable_error_reporting
- *			Turn on the memory reporting features of the hardware
+ *	i5400_set_error_reporting
+ *			Turn on/off the memory reporting features of the hardware
  */
-static void i5400_enable_error_reporting(struct mem_ctl_info *mci)
+static void i5400_set_error_reporting(struct mem_ctl_info *mci, bool enable)
 {
 	struct i5400_pvt *pvt;
 	u32 fbd_error_mask;
@@ -1237,8 +1240,11 @@ static void i5400_enable_error_reporting(struct mem_ctl_info *mci)
 	pci_read_config_dword(pvt->branchmap_werrors, EMASK_FBD,
 			&fbd_error_mask);
 
-	/* Enable with a '0' */
-	fbd_error_mask &= ~(ENABLE_EMASK_ALL);
+	/* Enable with 0, disable with 1 */
+	if (enable)
+		fbd_error_mask &= ~(ENABLE_EMASK_ALL);
+	else
+		fbd_error_mask |= ENABLE_EMASK_ALL;
 
 	pci_write_config_dword(pvt->branchmap_werrors, EMASK_FBD,
 			fbd_error_mask);
@@ -1319,17 +1325,19 @@ static int i5400_probe1(struct pci_dev *pdev, int dev_idx)
 	if (i5400_init_dimms(mci)) {
 		edac_dbg(0, "MC: Setting mci->edac_cap to EDAC_FLAG_NONE because i5400_init_dimms() returned nonzero value\n");
 		mci->edac_cap = EDAC_FLAG_NONE;	/* no dimms found */
+		pvt->enabled_error_reporting = false;
 	} else {
 		edac_dbg(1, "MC: Enable error reporting now\n");
-		i5400_enable_error_reporting(mci);
+		i5400_set_error_reporting(mci, true);
+		pvt->enabled_error_reporting = true;
 	}
 
 	/* add this new MC control structure to EDAC's list of MCs */
 	if (edac_mc_add_mc(mci)) {
 		edac_dbg(0, "MC: failed edac_mc_add_mc()\n");
-		/* FIXME: perhaps some code should go here that disables error
-		 * reporting if we just enabled it
-		 */
+		/* Disable error reporting if we just enabled it */
+		if (pvt->enabled_error_reporting)
+			i5400_set_error_reporting(mci, false);
 		goto fail1;
 	}
 
@@ -1387,6 +1395,7 @@ static int i5400_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 static void i5400_remove_one(struct pci_dev *pdev)
 {
 	struct mem_ctl_info *mci;
+	struct i5400_pvt *pvt;
 
 	edac_dbg(0, "\n");
 
@@ -1397,6 +1406,12 @@ static void i5400_remove_one(struct pci_dev *pdev)
 	if (!mci)
 		return;
 
+	pvt = mci->pvt_info;
+
+	/* Disable error reporting on teardown */
+	if (pvt->enabled_error_reporting)
+		i5400_set_error_reporting(mci, false);
+
 	/* retrieve references to resources, and free those resources */
 	i5400_put_devices(mci);
 
-- 
2.43.0

