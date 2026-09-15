Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F163CF047
	for <linux-edac@vger.kernel.org>; Tue, 15 Sep 2026 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437337; cv=none; b=nTYrvm2SZ72pE/GWiG59o8xOz9Zqux6ImkAuhgVcjt2a//58CrlrxOwUQdQfoFiQBNEJzD7gGj1ZuA05wt8lXlqbp2Eyru/56DOKN6k8Yzu3z1U2TzXjSbzimPA/f5u3yPxqkC8Y0Xi6e6GGYOG1aI7EXSmNLCAFO5XduhxXiDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437337; c=relaxed/simple;
	bh=Xrq7jp89mGnekKQK3ThxX3L//Vp8Bi65jjsv4DPKdMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mon5VPmUUV14NSMpu7fYEylOULj0mqWqPrnAe6x5qUZB+Izr2O8JQyk1BzlAdpfpoTolZeWhUItt5pMZdO4ocBDT1j07t8IK/aFclRRglF01v0VnDr9rogevdut//bczReN9odWc/aM4Mn4BLiV2BHo+x0BGx3mTLX2rPNIria4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyclTsES; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyclTsES"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9104e54b1abso31816516d6.1
        for <linux-edac@vger.kernel.org>; Mon, 14 Sep 2026 18:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437335; x=1790042135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+t2pOcypXggyoA3oDjVoOfkJNIX87WTFu1zXhjCgQ3c=;
        b=LyclTsES6m6Ir+dcgNm7EtaZw/ZhGSQsnflzrD0ogYh0SprlgK3aTBT3CKxjU7W5YD
         Ux7p+rE7AwKomEeoedD0+GRJIRoLm6D2vqPuoEfVtaSDj9Dio9l0L4AVYceT9rheiIxC
         1+MeTNqnL6JbVkLpY4trCf2Rlfv4xtqs2U0uCKHy+HtMNQe1cc+yhhZfu2CRip6kPug6
         s3unVN+BaAsFfAYdMEy4MavaDTfl0dlTCGasvlsq4DRIc7g/eVHMyT0YtAAGoZDtFiKe
         s8GamhjL7kelusn47mCPhb60WVGaHbQIOnA/KA7jJvu2RR8mrxbMozhvQF/MIh3gcrsB
         aSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437335; x=1790042135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+t2pOcypXggyoA3oDjVoOfkJNIX87WTFu1zXhjCgQ3c=;
        b=VUBf1PkPN8iP9c/Ua+yA6CimUD2LS/bEXxEVeYE/UexiHw31NnKwnMQ2DE+EXF2CW1
         o5pSrLKy3R0jB7eQbs+GDxZPxa1v/zRgDnXg7WP2rA6w84KtX1Y6m7aoLtzYP+ca0e7/
         Ge342ewNFAfGjUO9DiQCzsu6Ef0EpvKA49E/qTuqz24rQyMPpEjZHvHJyJEECtAt4Fpe
         Bm6NW5WdfxPNWxulIxgSdvl+rblYxLHARlLRGwZtli7WmF4ITyipXgkCXuWgYWvElRDM
         9So8Nz/pjxbZe8b6BwvwidSEmzsHEyiKpcUpYxjko0FQ7WOZWthPI1uUI3igF3ErL8al
         PD3g==
X-Gm-Message-State: AFuF++mFr852l2Bj12EPWMPLTJiseRD8GVE9SP7ngomscwtFWJX26QO2
	OkBTjQyOXjQIh/3hT2/rguQm3oIK6cnqhCIu2vBL2CO8k1Z8ACVaHBa61CRlFKJFMA==
X-Gm-Gg: AYBFou24s2SC7vxKOvdmf9tXp7iF2Odxn++6PImG23eTxyB5ppLfw8QV8jOG4x61mfJ
	fIMouv/nrTPpqUYH7CC5bMtVstxMzpYkENQbHNWe5VIv4ShqT0J7W6pbk1O+cEkUJjIzielCJTx
	lNd/YPp+5zs5mF/maaUUeoFjzJLcruklj9gkUGwEMYv3+Xo8HBCldTtbRFn7PIk3qodefPOlyvj
	rd9mia8afCHA7cx4dprKgaD+tDUvowA/bgQ3U16z3JXCHoyRt/BZJkWhoztoEQ1sqo3Pzl2b26Z
	5T0fX1AaJDOPZr5hGIEBxGyjrfXrYKRNrIZqKC5vzorPRurXrAbmv9a6ZWmP67aq4WD/ZvtSlp0
	7Tt+9H31XP86y4neeswJmvzxD6kJze0Gvx/hiNIC0SdeOkS7yQlRtqdQLL21V4htC87BRIqAMH6
	35s4n8bPr3kaGKFONYeu6e3REWJl4kBzU059OBlVxW3ABAyJWAtECHgndA/VNeHKG/lE2T824dh
	6c+iooLRawzTlGizco5Y2kypmzPjkuiItHA9FuwF+AKkDHIQihDP+wt4YOfkYpVstTU3r1/5snM
	LJ7c2uzDwTUQiZOXJN1perlpg43gVORjuJ7rz/FnYyLYWvTHoJ0n0U6FuCQDEDPXm1uO3w==
X-Received: by 2002:a05:6214:3c9e:b0:90e:98e7:4481 with SMTP id 6a1803df08f44-9122e67604cmr95381566d6.29.1789437335040;
        Mon, 14 Sep 2026 18:55:35 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:33 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] EDAC/i3000: Balance PCI device enablement
Date: Mon, 14 Sep 2026 21:55:18 -0400
Message-ID: <20260915015519.83833-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915015519.83833-1-mhun512@gmail.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i3000_init_one() leaves the PCI enable reference held when probing fails
and when the controller is removed. Disable the device on probe failure
and after removing the EDAC controller. Keep explicit cleanup because
module initialization can call i3000_init_one() outside PCI driver binding.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 535c6a53035d ("drivers/edac: new inte 30x0 MC driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/i3000_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/i3000_edac.c b/drivers/edac/i3000_edac.c
--- a/drivers/edac/i3000_edac.c
+++ b/drivers/edac/i3000_edac.c
@@ -461,6 +461,8 @@ static int i3000_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -EIO;
 
 	rc = i3000_probe1(pdev, ent->driver_data);
+	if (rc)
+		pci_disable_device(pdev);
 	if (!mci_pdev)
 		mci_pdev = pci_dev_get(pdev);
 
@@ -480,7 +482,9 @@ static void i3000_remove_one(struct pci_dev *pdev)
 	if (!mci)
 		return;
 
 	edac_mc_free(mci);
+
+	pci_disable_device(pdev);
 }
 
 static const struct pci_device_id i3000_pci_tbl[] = {
