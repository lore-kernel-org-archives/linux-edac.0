Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512F3BED63
	for <linux-edac@vger.kernel.org>; Fri,  5 Jun 2026 12:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664067; cv=none; b=RUr9XiVp3U5kGT2eBWejD5Ii7eMbZUZPrm7V8pMQDxngkm3sIhJfJUisWFRMKuO4XMirvW4L610AQ0VUENETynLm/5gk5Upd/QjyWCuN0pS08yU42QMYtxUI6HV13/uh3bFA46EXq7sgkXuWs19P8+0/W+uQEHdnvVjPLjle5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664067; c=relaxed/simple;
	bh=FIIHe24uc7O4CBDOKLXoeJY2JexSRAuF6oL7yVzo8Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LwtxF+ikpZpqtuI7xvvmzDocBfo7YuntdstjV/SJYA4aRf2vF+2w8BqdSjsJqvkFokdfA0XNifxNeTGoPmd/dX0IzwMVPXEAYTbEGREyscHCrm5nu+3tECDrJjcaW63A8DaO+kKqlt7GmCbNCL3tDNGx38MMRkTAdiCr9Y0eFp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaSgCD73; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaSgCD73"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccf7b7d188so18859316d6.1
        for <linux-edac@vger.kernel.org>; Fri, 05 Jun 2026 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780664064; x=1781268864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shO4CEuYdjm6KH0/u78uU6qowwMulzIyxJQ1MR7e7A8=;
        b=PaSgCD73iSsVOjsUrQ7zKNaAc95R/kxpvdGyEIVNDhp0/x6IT4ZeFzK5qt5+iBnz1A
         /fF2ZnKJbTzL2QwUPepv6XnoDQ3F1gUdBspKnCJaLBSctfETWsQmuSgEIiMC/d/LI3JL
         BCv2MoQErCUKTlJ6zJiG9MTycZz90YqQWW7kFBbsPiNJqDdZvw3n87VCL5bd3Mu27ula
         VI3542DqQW9d58xnc69STl68rOGiEm+SlSsdyANfL8/hQ3DWSJzzf7j8kACBR51Frw4C
         wSBfOHkCuiwpxV60OibU5I7ecUuxc2OyebAl38/awv2ES8AwWlA7pr8ddxLfZq3LB8y4
         xqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664064; x=1781268864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shO4CEuYdjm6KH0/u78uU6qowwMulzIyxJQ1MR7e7A8=;
        b=NNRWfEXVw7+sNaHEL8nJHtq5O3EJ9IJozrYNW+uyREGWoUGSpBkS4z3I2eIo/lObev
         vx0Xp0z95fo/vSUod8p32W5vvjzYdVXgn6f30X04IKJfA/YBLldYIykmKxwEnyEiYuFY
         xoEghpDVGjLvpnAkImJFtgKCpzYzpDZJeXKahtBRf+X4KKK0u0Zj43OKZnVrcU5QSVmN
         mNDZ6KT9my0/GHVTHXURE1rW8cggpbPm7TfdgpnTqPwYNDvURYnC36Uz0QzXBaJ/Mp+8
         feCLyUPG4eAEHSoC/S2xOtWdeFVsuBxk6HruPkBTez4Ef4eHycF1tD1TCV5VmCMAU7sP
         k9LQ==
X-Gm-Message-State: AOJu0Yy12f6US0tPdexjeDr+uMrSQSxcqe1I7QSSMPlQiQpx4RWmqMjs
	45ml3eTAhSx5bcIWVhRy6W/0fr89Q78ERvL5ly30yHluyZXIiRkt++MJ
X-Gm-Gg: Acq92OFfaEsEQGO1DYoKiM7G5UP5IKfLsm+48XQarboCIgbE2Fq5US+ptOYrweSLBuL
	8R+f/k7nrZew3Ee9Ku1IBcA+wEvO3M9ceCpmE0Zx64D/kRliimNrVSkz5z8nFnlXCNCA0AryudG
	YdQBAXN1suagyaFBt/oDk7YYbj1ik68dV8otqSB98f8IQ6yIbXWsWsNIGhuRDDSNKxHZXqmcNZ6
	WTVNQ70B25KyAL8A+9x3gX14v0SPgp4cCyx1l5uTm/FrbKubDLlnO5adUzKvVeUm7u8h/9sq1xT
	5Kb2htuM8y5rRFRRwRfGdrd4ZW4HOzqQR9LJqm4A+uDxRcHvLGTFqaLFFdOeHH5drK8fGpPCtog
	d6pRRzTIZl4yFpDuxe2QQV4LAXssEcfgCH3aAI6IjlEZxu7Boes2elLsIenofQjGaF2Uz6i/5nz
	o5xOQp7z5EO/2e1vHm8+REtuLDpj4EfLYXGFvVOfdgeuulaaru1hDhiRZYzfGY9A==
X-Received: by 2002:a0c:eb09:0:b0:8cc:15e4:1208 with SMTP id 6a1803df08f44-8cee6156373mr46026746d6.32.1780664063708;
        Fri, 05 Jun 2026 05:54:23 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm81783306d6.28.2026.06.05.05.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:54:23 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] EDAC/synopsys: Fix cleanup on injection sysfs failure
Date: Fri,  5 Jun 2026 08:54:17 -0400
Message-ID: <20260605125417.2348115-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_create_sysfs_attributes() creates inject_data_error before
inject_data_poison. If the second file creation fails, the first file is
left behind.

The same failure path runs after edac_mc_add_mc() has registered the
memory controller with the EDAC core. Jumping directly to edac_mc_free()
skips edac_mc_del_mc() and leaves the registered controller state
unwound incorrectly.

Remove inject_data_error when inject_data_poison creation fails, and
route the probe failure through edac_mc_del_mc() before freeing mci.

Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes in v2:
- Remove the CONFIG_EDAC_DEBUG-guarded del_mc label.
- Call edac_mc_del_mc() inline before jumping to free_edac_mc when
  edac_create_sysfs_attributes() fails.

 drivers/edac/synopsys_edac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index 51143b3257de..9ca2a842612e 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -1120,8 +1120,10 @@ static int edac_create_sysfs_attributes(struct mem_ctl_info *mci)
 	if (rc < 0)
 		return rc;
 	rc = device_create_file(&mci->dev, &dev_attr_inject_data_poison);
-	if (rc < 0)
+	if (rc < 0) {
+		device_remove_file(&mci->dev, &dev_attr_inject_data_error);
 		return rc;
+	}
 	return 0;
 }
 
@@ -1431,6 +1433,7 @@ static int mc_probe(struct platform_device *pdev)
 		if (rc) {
 			edac_printk(KERN_ERR, EDAC_MC,
 					"Failed to create sysfs entries\n");
+			edac_mc_del_mc(&pdev->dev);
 			goto free_edac_mc;
 		}
 	}
-- 
2.43.0
