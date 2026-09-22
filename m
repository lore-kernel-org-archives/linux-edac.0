Received: from mail-wr2-f39.google.com (mail-wr2-f39.google.com [74.125.225.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466293769F0
	for <linux-edac@vger.kernel.org>; Tue, 22 Sep 2026 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119149; cv=none; b=FhJc8V54vJzsZDrJmteeQ/nrYyvZDlcI4zL2DjF6bIKmunJGGHgewMEufLyKfv4TlfjYgnBqBJD5Q05pcD8B0ckrHsqeuz3ldpKz/B/brkYJfH8So5iX4V/dLMdIS0UGYBFrD2rGvlN5NQd7bIODZiZaA2hOwSF3VgVMUxlpm5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119149; c=relaxed/simple;
	bh=H7gmJiEJ7L75WynDh8xl+jcAnaPeaov8swQaArvFogk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HxPTKia0JIKsRhr77AHGIohC8PM1YyBDpwOLDXiqw8jPtm40zimz6jRjMRyIcjRYZy75KUj1vw3uZpjxS9uRQ74/cQdOjQdxi7mZcxeb5/+jIO25CxcXhsaEGiHRH2olUkRmBZcOxfY4If+OcaCtyOpb0ttW+hfxjT2Iss8tzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCmvR0Rp; arc=none smtp.client-ip=74.125.225.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCmvR0Rp"
Received: by mail-wr2-f39.google.com with SMTP id ffacd0b85a97d-482f633ece3so324257f8f.3
        for <linux-edac@vger.kernel.org>; Tue, 22 Sep 2026 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790119146; x=1790723946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQ44cX4ajnfIo4kZAd/0Ua+K+UeEg7vA1TBW5i/GjgU=;
        b=sCmvR0Rpgzz9VBMRAz4E8YVW47nsbVKaaAy7u65dKzUVq+KePabhXl+FX+BTZvzu/f
         LmsYgPpkMSOvlg0KUIB9Vz3pd7DIeFLX7LXtU966K6rGAh8+cnYF/vhGgZoxvdlocrKU
         3Qr++fxu4Bu7PQVvd5bxb95h8xLTUWG8yWDzpsmXYrthexBc344DDkapfDucyS7d2dvL
         4hgBzEYf76BlBcIoEAzyEuMjg0UlPmIa+dIqWSY3ae5qcPZggVfhumtakrzc6ivi8Zun
         o4VwIj1JXx3W4FxBKA79exKRtpD7hET7bQytJUt8VsqBDP7jF2pdGHDHR8ls3IYRkzcS
         ytKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119146; x=1790723946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ44cX4ajnfIo4kZAd/0Ua+K+UeEg7vA1TBW5i/GjgU=;
        b=ShS2/4qwX5W7g4s9rcp+0z9G2PKW02ck/PuKTYTcornZ3cTMEwK/Qdfg95iZFFR12u
         qe341Ha9zsAnCFFC7Tj52+y7b2aEQvfNPKD4zxu1e82Mz1xs1J6Ji3O3nT2IkOz+Sy5l
         J9vbSiJY8VCYgwOBW4Fhqqbs9qVqrk9NBma3ega4/qZTd2p7a1KD+LgL35LH6ReVilRQ
         nvZdFS+0WZl33yuVLeIPDrBa6jlmvMcR4+VqOKdPX1+vHM31q6VcbyhUPZlx4VjIS1uK
         hvU6PXY71i7Q2T3PdRvfnEtHAHFI+nkcZ/5aJ6xxd1RfdL+yHIHBDobOvd9ICb9XNPqh
         s0Zw==
X-Gm-Message-State: AFuF++nzd8fJpcdnzVtPw5V7/bMtgTvsBhTzW8mCQ3sjsx6/qOfcuEzP
	kFA51TkJXDD5m5f1Uu5lwtTfgZ1qHjAKjSyibEJ4ocgc3wTukGLzaUkE
X-Gm-Gg: AYBFou3Oek1V8mHv2xaITq2brum6+1aoNWdbWp1Yj6wuuSPbtYfnOPnba7GiUGGDZuM
	CNEJ/2OasBeRcvxS7NQVkeGJVXuji5Yh9BG88ugBs+9A0o4c4RcfAbzNiRjJJOB7gnbRZmlcDpQ
	/wiZ9A2hgNrBPV4p2tY9hi/Egeug3vGU4WHvMi+50UdYq9l6vqHtvZCjWaq6nFNq8AP1WyxSPAt
	q64RCBAA8oamVQq3OI8EQsi08+eBk546iuhCkCShfACe7/HY75tPv2Hkd6jecLgpmxdT3pTvbgF
	haBP+k4eVUYSfUVpCCJP2YmA4AaC9U8dzuP75jhEqb9RzH3hI0cBtmnCQQlnFD/l0BwTEKC/XjE
	ILUww/NdoX+L2+eUEI7N4+IdrKDq3JWskYvB+NLNetA5XtD8icg61deLx8nCMkPC2gHmtjrnoG5
	cReRoC3I+WkVhkz6ZJxBNs6gkb6U0xMKh0RMseUgwO0s2BqOWFFLyk5obwtI5Lzorb3xWmH3k0C
	DFroRftLNHxX/ZcSqY5FlHa3ACH4HOjycLYT/WWbb3flqvur6A4xAfHMCyWFHIP0QTCUbIlQ+a+
	kMrse8yr
X-Received: by 2002:a05:6000:25c4:b0:487:1266:5be7 with SMTP id ffacd0b85a97d-48867090ad8mr1431876f8f.26.1790119146144;
        Tue, 22 Sep 2026 16:19:06 -0700 (PDT)
Received: from localhost.localdomain (brnt-05-b2-v4wan-169762-cust1351.vm7.cable.virginm.net. [81.101.101.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889337sm1875902f8f.34.2026.09.22.16.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:19:05 -0700 (PDT)
From: Bryan Chan <bchimhim15@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org (open list:EDAC-SKYLAKE),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan Chan <bchimhim15@gmail.com>
Subject: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical operator style
Date: Wed, 23 Sep 2026 00:18:53 +0100
Message-ID: <20260922231854.108188-1-bchimhim15@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code works fine and works how it should be, the fix is just for
uniformity/consistency of the bitwise operations. Also fix the compiler
warning.

lchan here is always 0 or 1 here, replace the inconsistance logical
operator by xor operation resulting 1 or 2. This remove the compiler
warning and make the switch case easier for reading.

Signed-off-by: Bryan Chan <bchimhim15@gmail.com>
---
 drivers/edac/skx_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/skx_base.c b/drivers/edac/skx_base.c
index de749413ff9a..ae2fda006632 100644
--- a/drivers/edac/skx_base.c
+++ b/drivers/edac/skx_base.c
@@ -356,7 +356,7 @@ static bool skx_sad_decode(struct decoded_addr *res)
 			break;
 		case 2:
 			lchan = (addr >> shift) % 2;
-			lchan = (lchan << 1) | !lchan;
+			lchan = (lchan << 1) | (lchan ^ 1);
 			break;
 		case 3:
 			lchan = ((addr >> shift) % 2) << 1;
-- 
2.55.0

