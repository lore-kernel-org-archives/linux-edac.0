Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8292837E5CD;
	Thu, 30 Jul 2026 02:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785379756; cv=none; b=oyDPvUWDKVqrvkjMiGAR0FxESrS4cZvFo3duuY1atXjSnQgv7xnNvVF1Xgkb6jtk9i0wwCgPUtoAiJETg8J31P/1iSQUy4WlN8lGj8m3R/1mXYgorUb93zL8JcoM08S10J3D/eoMmOj6ILPJhlm2+KVwCj8QspD/9sF3BrVQCE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785379756; c=relaxed/simple;
	bh=JJipb8+EYuRMsqTZSrfLXMo3N2+oerrEUblWeIl33A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktv41Sxx+UPGmlzSTHphXfhqNPMtKDh4p4OMTLEcdlgRnGbXeTm4o3I6j6VyLa9RKHZM7lvefskdJfFhNlUU0mG00GTNae4ZSLWdowJMCya/z549IBR532LV8dpgo21sqtT5IvjASIHLBW1wI0Ek3OV9a5lerUnhAJNCJGiLWKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KMc/+VtK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KMc/+VtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785379754; x=1816915754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JJipb8+EYuRMsqTZSrfLXMo3N2+oerrEUblWeIl33A0=;
  b=KMc/+VtKtsc1ksPGAXAmJx5NFs+mOWBy1+UuTqnkbDlko5gCF5ZxTbc5
   OY+S7bFc7NofC7GhBSzxVzbujWodqup78y67BOL6WmArvjqHm6ejNx72o
   TdVuHbEbiH5Jbt7pNVlJ4uXvGKMRKXTo+r5oTAcZIBv0YFmo8RwHKVpKf
   FszherY+AugP3FTraacExI9uygRH+phIW86zGOizCyapf++Rildgmcljs
   WMHNEcO3Y1H8yNcOM2AdfZldOj9vDBMXw6L7rPk5MDAFr+AsFeiT0pZVN
   dlLNkaPUhjbVqwyHWMQLgrzYo97NNZvaE4NSiAwJlJy8+pNsNNswDtZgs
   A==;
X-CSE-ConnectionGUID: PZUEi+e4TJKk/S4Fvh+iDw==
X-CSE-MsgGUID: ITyfc2s5R1mp+0R6Qpd0Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89674311"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="89674311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:12 -0700
X-CSE-ConnectionGUID: Qd8nNe7sR8CvsDp23VT0fw==
X-CSE-MsgGUID: n36M5buYRQiKny+ERsqiJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="256240734"
Received: from qiuxu-clx.sh.intel.com ([10.239.53.109])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:49:11 -0700
From: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: qiuxu.zhuo@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yi1.lai@intel.com
Subject: [PATCH v2 03/10] EDAC/igen6: Fix channel selection hash
Date: Thu, 30 Jul 2026 10:42:31 +0800
Message-ID: <20260730024238.4096623-4-qiuxu.zhuo@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
References: <20260706032233.3283297-1-qiuxu.zhuo@intel.com>
 <20260730024238.4096623-1-qiuxu.zhuo@intel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In channel selection hash mode, the hardware decoding logic always
includes the channel interleave bit in XOR operations. However, the
hash mask may or may not include this channel interleave bit. When
the mask does include this bit, the current igen6_edac code performs
XOR on the interleave bit twice, effectively ignoring it - which is
incorrect.

Fix this issue by ensuring the hash mask always includes the interleave
bit, so XOR is performed on the interleave bit exactly once.

Fixes: 10590a9d4f23 ("EDAC/igen6: Add EDAC driver for Intel client SoCs using IBECC")
Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
---
 drivers/edac/igen6_edac.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c
index 43b56a2eb547..f1fb644154ae 100644
--- a/drivers/edac/igen6_edac.c
+++ b/drivers/edac/igen6_edac.c
@@ -1009,14 +1009,22 @@ static void set_dimm_params(struct igen6_imc *imc, int chan)
 
 static int decode_chan_idx(u64 addr, u64 mask, int intlv_bit)
 {
-	u64 hash_addr = addr & mask, hash = 0;
-	u64 intlv = (addr >> intlv_bit) & 1;
+	u64 hash_addr, hash = 0;
 	int i;
 
+	/*
+	 * In hash mode, the @intlv_bit is the lowest selected bit of @addr
+	 * to be XORed. While @mask may or may not include this @intlv_bit,
+	 * we enforce that @mask includes @intlv_bit to ensure @intlv_bit is
+	 * XORed exactly once.
+	 */
+	mask |= 1 << intlv_bit;
+	hash_addr = addr & mask;
+
 	for (i = 6; i < 20; i++)
 		hash ^= (hash_addr >> i) & 1;
 
-	return (int)hash ^ intlv;
+	return (int)hash;
 }
 
 static u64 decode_channel_addr(u64 addr, int intlv_bit)
-- 
2.43.0

