Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F42E718F
	for <linux-edac@vger.kernel.org>; Mon,  8 Jun 2026 07:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903711; cv=none; b=RIPsJWijvlY4HrlKvy1Sa2UsIvShEGvhFMnFuTOws2/XqYBBXUqAjQ1VFmJH0uxxUxBYusYs5Zs4ZFuo5HT6w/5EWxrF4Z1lSy/9t8kQ0LNg/JOSJLHNfufceNa/sJgMFQkKRX0gDcC7RjH/YjgIAJJTMAfSf8o7Am+fOlWXL98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903711; c=relaxed/simple;
	bh=sySpD3R/l7ycqOxHdSSeOmbFWUJHnLa3aoAK+XPukEY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=kBUQu2Q8nrQpO9OHFBCXj/76cQXReRXiNnk3Xq7i2unrPE1LjazQrfOZ8ZplszungHfxuzPnQ+sCBchijYVE8WoqEJXnYFSeqh1xMrhJymieYB4ZZYWP92yi16g32HsHaAT2hP3CLA3Eqxx25tHq7YdcfOvPh1Dd5FqotKJTyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pohaosu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Aqjx/a0a; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pohaosu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Aqjx/a0a"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-84235f9b91fso2954928b3a.2
        for <linux-edac@vger.kernel.org>; Mon, 08 Jun 2026 00:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780903708; x=1781508508; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ye+1FU+tMaZ8kUgy08SSlStBEw+oyIPQoZf1GuNesDc=;
        b=Aqjx/a0azvXXeMqTkumgQFRfDX2KEIwNd9fgJ3zkUjNEIen4P7VFjX9XnwUC83fDlh
         GPTTS03z85vrVWgh1vh0IyPrIu0y7n/NdS/xxi1tEfE8dBlxD+3uJ7ddsN++Awi+/w15
         cxYCjpcYv3JkEddUz9yMYnTRWCHy3DasRazPZSx+shtxO28su6ZUpmrorr578W5sQMlM
         1oWuZuTP8PUJ0f5Yhfm3OiAzc60X+2pLNbnSzvr2RZV3oKh54r4KfeDCDMz473QH45LN
         aJpStfc+H0LN8/GjHyaVTTZPU61NWyun8XSs4NTNCk59wrPIyIqsOOH3Nswj+ct4/R80
         XImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903708; x=1781508508;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ye+1FU+tMaZ8kUgy08SSlStBEw+oyIPQoZf1GuNesDc=;
        b=B9zVPeiHUwPQlHH2he+uQ4iFS3crqQqmj0qZlff5aMcWPmyMsgWfxJavWu4C1Hi8VR
         XAPQwn/IyWbklFohOadnVmJISIh10/MxF/rvSSSSRHGuE273M2P9LMXZtsKedvTjMva9
         Wsb3X1Qah7IpuK47IbffhCtileitiZUZZWv4/8GQan9dd8pT9OdWv2jRGXsuOYNHWzSS
         T3kZNDsag200ceKY0bx+ha0sqDTCAz+odjOLTSme+aJAAp29xj6YvrrPwjUhd/Qsl5X1
         htk/M3YoPeYf9yGsXStPrSrxZpBm69k3WVPlie9og3SV4VLL9mQwug8vtlCEdbzltCmd
         kngg==
X-Forwarded-Encrypted: i=1; AFNElJ+PLbfmAwSHLUxJAwq8vesTtaqVLkeXKEeZ0w27VFRi2pRYfW70P29Be1WkZCGrPsS2OY53YfLLcBvk@vger.kernel.org
X-Gm-Message-State: AOJu0YxvCsBr7H8TnnUwI+JguduvvToX+WtraM9PAeaLEVgHdoX2YsoW
	ur8p6bHDXcqvAEnH+4472ZeDa9Wz66h6nJG+1WQdoD4x/OaCXg/LJ4b+4x5hUBtMPMoSbOcjmw9
	7GGlMrodX3g==
X-Received: from pfnj4.prod.google.com ([2002:aa7:83c4:0:b0:842:4a9c:2fd3])
 (user=pohaosu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9084:b0:842:7e6f:f487
 with SMTP id d2e1a72fcca58-842b0e5cdb6mr14873893b3a.15.1780903707820; Mon, 08
 Jun 2026 00:28:27 -0700 (PDT)
Date: Mon,  8 Jun 2026 07:26:07 +0000
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <20260608072607.1819873-1-pohaosu@google.com>
Subject: [PATCH] EDAC/amd64: Fix incorrect Node ID mapping on CPU-only Zen4+ systems
From: Phineas Su <pohaosu@google.com>
To: yazen.ghannam@amd.com, bp@alien8.de, tony.luck@intel.com
Cc: muralidhara.mk@amd.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Phineas Su <pohaosu@google.com>
Content-Type: text/plain; charset="UTF-8"

On CPU-only systems using AMD Zen4 (Genoa) and newer processors, memory
ECC errors can be reported with an incorrect Node ID (incremented by 1).
This happens because these CPUs use SMCA_UMC_V2 banks, which triggers
the GPU node ID fixup logic in fixup_node_id().

Since it is a CPU-only system, gpu_node_map is not initialized and
gpu_node_map.base_node_id is 0. The check (nid < gpu_node_map.base_node_id)
evaluates to (nid < 0), which is always false for the unsigned u8 nid.
The function then incorrectly applies the fixup (nid - 0 + 1), resulting
in the Node ID being incremented.

Fix this by ensuring that gpu_node_map has been initialized (i.e.,
node_count is non-zero) before applying any GPU-specific fixups.

Fixes: 4251566ebc1c ("EDAC/amd64: Cache and use GPU node map")
Signed-off-by: Phineas Su <pohaosu@google.com>
---
 drivers/edac/amd64_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index c6aa69dbd9fb..1e688123a50c 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -1047,6 +1047,10 @@ static int fixup_node_id(int node_id, struct mce *m)
 	if (smca_get_bank_type(m->extcpu, m->bank) != SMCA_UMC_V2)
 		return node_id;
 
+	/* If no GPU nodes are present, no fixup is needed. */
+	if (!gpu_node_map.node_count)
+		return node_id;
+
 	/* Nodes below the GPU base node are CPU nodes and don't need a fixup. */
 	if (nid < gpu_node_map.base_node_id)
 		return node_id;
-- 
2.54.0.1032.g2f8565e1d1-goog

