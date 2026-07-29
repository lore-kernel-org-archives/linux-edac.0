Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371AF3BB125
	for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358026; cv=none; b=eshPL/fyu2sdnVvIlpGdFW4Kp9RM125n6HraZB9bNXuIKwupUaw96QLgogCFSS8PAUm7tOWtgbVqObnLyNM2q5MXijvaONCAeYsnQCrcamlwRCPj0NG9MHACWkSFEnDWMs4ep05VzlrJlZqBGi0n/2Z9uUNy07bnHxLJINaOhd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358026; c=relaxed/simple;
	bh=qDoPFDgYOwBJutDRxjyEAfPZBpXw87vS1RFRdmij+W8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z55XGMje0iCGCHYzzHhwkojxmDQobcXChwFqVaeaGWWSMjnh67W2rG+2gsh33fLfSRpPaE/ikambK6aKZrgmNTZojayOKwVB2c2FwEdUdrevopfMMNigvQOrMJBKZfkLdnzS3eBPSD4APsHx11lkhMIvghnLcl/gRCtarRmn6Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj7h7PF2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj7h7PF2"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38101f85591so88104a91.1
        for <linux-edac@vger.kernel.org>; Wed, 29 Jul 2026 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358021; x=1785962821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teTKn1OpGKLb7AWpDMW6Ji1oRtzdBgxsC8nNkN5FQbU=;
        b=Jj7h7PF22+lJfeg89v+OL/+GBPxcX6VYAAgtoerRl0znFSUCC9lNq4YW/UOXE3jHU0
         KN1EONceFKHnEQqXn+LqZBESO2jrXTnHo5lkN6ilHVr7q4D3bf23Ad6d1/IGDpeaF7i9
         CrussRmQnz/pPJUncBmvKFuEAWXzCKmvZCtOsCVqePFRZT2M1A7nP7J9cxdjPlSfB5dl
         pGfC1o8rbsNeR71JZLX7Y57Cy+WP6vPmETHUmaH7gSIM2inrrXIy9euKP5Wwp+20dJKh
         iazoB2IAhmnWQllz1mjkv2+khAFR1/WifCdHdNlmEujas48hLJhMZjmKGE2RCZtXhURx
         O51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358021; x=1785962821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teTKn1OpGKLb7AWpDMW6Ji1oRtzdBgxsC8nNkN5FQbU=;
        b=JolXutrY+DDBKpzt2j52cjjKY1Lpcfm0VfOMLYdGWvus+MT/mrgZsX/a3dvVMqo2vo
         IvIeQf8pwyCPmiM0XiunQsRzl6PY5V9fhKuegkdE19tV72ZqVTJVOjVRl6V7cU9M8/oi
         mXzgSX+frUf6wGxMoS50KrkNJ5OETMJgj3Q94G9ll7LPSU+BwZsgolBZ0/seIB8t9BZi
         UfLdGAXpbzliNlH0z/l4XCQ02FRyM+UofeHWqvKKHHsKAodJk825NqmneZ9oCTlxQFGd
         XHEAnHV8mxuPxt2h5a8bqeLD7yJDV3nl4cNwKm3ANTVMHGuxR4UTRSdW3USbLnjNo0kJ
         adbA==
X-Forwarded-Encrypted: i=1; AHgh+RqCzRNJrgbCtsPTtyPw83Wj2I4VlrUARM/X0IEVXrCHiEaJAvaBZJTuez2LRYkGB+ft3LHPV3bZ9kac@vger.kernel.org
X-Gm-Message-State: AOJu0YzFMVdkQm6zyF3bXdfPgjVpQhf4V6POBinLxT8b3SclyhWcV7MS
	RH99lSgm5dvxliDRK14z43TcY/Bay0J2jXPUL8fkz/AFaozKRISPtRIF
X-Gm-Gg: AR+sD11kyQF9wrthPuCk158e+JaYSBSQ+4UPGHGlA0Aradg3/6LUO1zT9+UQuX2GAdb
	7AiCUGavGncE6tlbmX49dAfK7g+qQuP80RGNGUdUW/X0RFnZ8ydnauF3wBmDT1I86BmyJn7Uu2e
	Q5Q3nmUu9hLJcUCdOvUijzAonoc2D98JsChEXthP1JlMvbSDviotsOj1q6vUCh+VJ1jDlelDlFT
	6bRTKyRIrwvWGLDMCTojKoZfHHo/SHYvDPIr7NU+OD2br8dq/6sA5zcplspS/xociL082oirfH9
	5fzVVSsQbau93Ym40usIJZuPrkcuqFM0HgwTVMMIAKHz9zz3p/SMobO4iIkBAzY/s7zCC167ySM
	4N14KBpcfLOexocqtIVYa6rZZo7ViVOiOyWAFkb74p+YNsd9wiyoXFQrnNRidFLU/GyXO6UD8vl
	k/cgGOfvCXkHes5JFF+RC+xBG9p9hwE1C2LGJqcOufpYRIQCUehK80oqhfdBI5J9Qq1SxgtBQrK
	6nXRrei9DGr6Uoc3FbdHflNYxdqDNY=
X-Received: by 2002:a17:90b:4b8f:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38f836bca81mr3747394a91.16.1785358020997;
        Wed, 29 Jul 2026 13:47:00 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e3:209d:579a:9da:66e9:b9a4:b92b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm14526894eec.14.2026.07.29.13.46.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 13:47:00 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: krzk@kernel.org
Cc: bp@alien8.de,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dinguyen@kernel.org,
	krzk+dt@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@altera.com,
	robh@kernel.org,
	rounakdas2025@gmail.com,
	tony.luck@intel.com
Subject: [PATCH 2/2] EDAC/altera: Use an enum to identify the platform variant
Date: Thu, 30 Jul 2026 02:16:42 +0530
Message-ID: <20260729204642.23281-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260724-spotted-resilient-badger-495b71@quoll>
References: <20260724-spotted-resilient-badger-495b71@quoll>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for Agilex5 support the driver needs to distinguish
more than Stratix10 versus everything else. Replace the defines with
an enum. SOCFPGA_A10 is zero so the Arria10 match entry, which has no
match data, maps to it naturally.

Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
---
 drivers/edac/altera_edac.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
index 30e35da7eb6a..79b51f051183 100644
--- a/drivers/edac/altera_edac.h
+++ b/drivers/edac/altera_edac.h
@@ -372,8 +372,11 @@ enum altr_agilex5_irq_idx {
 #define ECC_READ_EOVR                     0x2
 #define ECC_READ_EDOVR                    0x3
 
-#define SOCFPGA_S10                       0x1
-#define SOCFPGA_AGILEX5                   0x2
+enum altr_socfpga_platform {
+	SOCFPGA_A10,
+	SOCFPGA_S10,
+	SOCFPGA_AGILEX5,
+};
 
 struct altr_edac_device_dev;
 
-- 
2.50.1 (Apple Git-155)

