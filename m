Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D951633936B
	for <linux-edac@vger.kernel.org>; Tue, 15 Sep 2026 01:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437329; cv=none; b=TIILOYm9Lnqs8HqCTZsNOD/QOkhE4hMkguS2ViFtotxdwp0ezffbxpS7y1KFsoFspZK5T1bSqZfG8YZkF5Ka3tYiFtueSsMFCA44UnJ2k6TvlcqBQeqYUG9/0FPmdE1zB7UbRr9aofTW0/nSlwZ8zok2B1Stu1hdeNYy3gnGO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437329; c=relaxed/simple;
	bh=SImV7x1CZ+YZSzFzbNMVur6qt+AKDbf3BSRwa4So7GE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o12fvZRFN4JbcWDaR4sdypm8cRjOYOsy9S0so2uR5DtdPg7hlhvQ+cE9EgGT2ePTr5hYIxIjL+RNauC6w/RI7elno4JJctfKJfoWisEnJiAjvKzhbsZWSyFBUlL4FE94kogtgVuAKfUsTIbSV1AQcD6zEH5uNG9+EjwHv/hr4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjG6Q6xC; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjG6Q6xC"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530de452c33so36214971cf.1
        for <linux-edac@vger.kernel.org>; Mon, 14 Sep 2026 18:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437327; x=1790042127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmGs6Nrhth/r9kEqCYRE9v0bMT5Om7otMfWFzjHwusM=;
        b=mjG6Q6xCqRM01+Sg+fTkfEosJOcFy9PnJeAgc8qDDSMD3DymXNwMRpoladNNp96rpE
         M11a3RUtaavWcxOkGiW23NNcMXHsOFPH8PnVgzdKoJIyTcNoBaPkIu2a7gSEt5mS1ws6
         LHboJEZPMb/DFJ938RvK0GOdPwyx+RPXDpDJneOr/SgOiDj6WFwvWH15uSubn1RCTms9
         FzG3q7ACWyFyfInNponwBv5MhvK0o9jW8q9pQpU96x5i5GnNa0c4KI/OlRJz036VHwHZ
         EUAE5wXKoU7q+RunZWKvhqBFtuEWa/pFP+9NzoA1vLY0zhzkgWP4VVAK6BVBQrhtDlwO
         1Abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437327; x=1790042127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmGs6Nrhth/r9kEqCYRE9v0bMT5Om7otMfWFzjHwusM=;
        b=YamkB0GLjw5QJLNR1SPk+89gkPpX8D0FXrzKKDUAstRlX20I4RAmO/0qeNsdmV4WCa
         T+c18V1DI/vdJ3p2KOphIsPPin2ryjR5n1M7uyKh8WrhF5mfp+X6zxz81nZa+q/eJc2G
         gUrLBXyG0HPcgwPqCsrGvTchgVJWpXsQYcJsOilnEE+Adqe/7ZK5gimsAtiTESFm3Njp
         ZaNS1s5i3YGCVNoIOJDLx4NfeDGy/ib9fRV2+1n8gepi07iF2ZrBDN3XnFL9gbV/YGd4
         muXQkJgVFM9x+YFCezx39Lm0Rz1XxxiWSEEf3mG26m7bvp1MzpreookLd9+UeMjrtOrq
         QWPw==
X-Gm-Message-State: AFuF++mXwDrTmV83i/uMog+477okrvkN/Mf0Pn1xGMhVBQ/JX7dhh7+i
	aSFB4qfp7jTsBGiJz8XKT1WxuLDENq7MHHwniZKfBSYJu+RkAGI9ADc=
X-Gm-Gg: AYBFou2qb6FO861fIJG+uig2nP7w+MqKIHIYjsPDgP6reqkapQDTrgilYWTwF7/p896
	36CUKVLV+YEI2FTZ5Qj5VoXNux4ywpH/gllcSvLmOF31EFIcszBLVnU49ucC1eJDNwdc+neOJBY
	wzio3SE3UAbhUvpFSWSu67GslSYDWMkiHE3lnlG5KsatNmDNVvvHhkumlK0hL2SZwjYOLU4sZ6s
	64suanMxAFMn/ANy8VvJIVfDHdGMkmDAoYuXqAjNw9SOqOP/kRIfIlXFgr1/dAmr16+VttsIFwA
	QHjEUqn1ic6Wj84eBNCv9L5gefOZVB08INUoc0KCE4FU78sysNOzXUI67xsT8ed3NlDacY93jmu
	uxnUgerp7WUAb+CUtXwo/CZEEWnV6J8+fWih9JarrvKLa/NQNgvfYnqMUpy9XRh+bI1G3VpceTI
	ND+kFFHoGVqJAATcRW+E7ubL98knluMYIoAw6mcqbo7pDrEeODCU/ZDDJZPfrZ6RJ5LoMcEupCK
	eHfIh1yb56RU2VEkrR7RmhwkSZzQ8qnkni54KwyaIFj6Osnx/OECvCokC5neyQWpCcLQChVGmGS
	glzKGEOq1qeczetuunJ9sAQK9Xs8bdDERfdq3Ak35lR6tXk85rcDlj9ISHK5hBOt+jAoGPA7qU6
	oGMHL
X-Received: by 2002:a05:622a:1194:b0:530:62bc:e11d with SMTP id d75a77b69052e-5310cf152d5mr76349151cf.4.1789437326963;
        Mon, 14 Sep 2026 18:55:26 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:25 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/3] EDAC: Balance PCI device enablement in three Intel drivers
Date: Mon, 14 Sep 2026 21:55:16 -0400
Message-ID: <20260915015519.83833-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These drivers leave PCI enable references held on probe failure or removal.

Use managed PCI enablement for e752x. Keep explicit cleanup for i3000
and x38 because their module initialization can invoke probe outside
PCI driver binding. Each patch is independent.

These issues were identified during our ongoing static-analysis research
while reviewing kernel code.

Assisted-by: LLM

Myeonghun Pak (3):
  EDAC/e752x: Use managed PCI device enablement
  EDAC/i3000: Balance PCI device enablement
  EDAC/x38: Balance PCI device enablement

 drivers/edac/e752x_edac.c | 2 +-
 drivers/edac/i3000_edac.c | 4 ++++
 drivers/edac/x38_edac.c   | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)
