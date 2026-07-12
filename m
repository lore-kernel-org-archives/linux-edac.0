Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A060E7478;
	Sun, 12 Jul 2026 03:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783826211; cv=none; b=FItfo+rzOPak4TKbFiAcIjs1Wq5hPI++wp/+8Hxqza9xi5UCOoIV4K4fiQ1IRB6/c54BbdMFM10tHy3M4pAGTyOuvaHqowHGE0eTg6Gc5Su4YXWiSDQbGlzPHJRkVDY5pcCweauGCVDwBKYYbJuZumHqS3UFzGHBSbJksTWl1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783826211; c=relaxed/simple;
	bh=LaIaU+FyifvUxwiU4v2iFGMRhJ1I9GWqC5pfjqaBkqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmDFP7H2WgNg4z/sW9RzDK22h7UF7dABtDQDAL24899svKyHdw8Ph9nqpR2Njm4eIPF/XXmZeJGx+6dP4ZS2GXjJxEcqrMybfgBpktxz3y7/gXOo3BijpYfM2IOjNH1c5rfqFisybTkqzU6iFbYndTCoRnhbGuVss3K3kdr+8cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdv86hSA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdv86hSA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69D01F000E9;
	Sun, 12 Jul 2026 03:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783826210;
	bh=2rggkK2XQ9rn5T/49d3O+xV0qmbFRQVE4gldYO1OX/4=;
	h=From:To:Cc:Subject:Date;
	b=gdv86hSAhJNEauMvv7PWyH4DswKqE4WAGIZC9hyh1vDi8lstOW4OY/kz3QTjYSnrR
	 B1+4alEah644eDfPNvAvmEG7hpUiShGBiag7DN5lK3SI3UUSZMyZ8CNRJ5pEqQWrMF
	 Po4t/N0MH/x1HLlJXjIa7TXhRBH30FPTQMJfrw1+VZtLjOgOjlGJ0eehX7Y0DmeZr8
	 /eKeoc3SFlqLvOsDMcZEartVJFIKHH300HWCQXGzHBsylRBAJxduk9SRIfg5+S4HU8
	 cOKRKwxeX4/b6dCumSLE7tDmIUs1pOylN0quJMc1SjE6MXK2U289Y2vYov3NZ9/583
	 DCpKZF/CmOCkA==
From: Borislav Petkov <bp@kernel.org>
To: Yazen Ghannam <Yazen.Ghannam@amd.com>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] EDAC/mce_amd: Do not print a stray newline
Date: Sat, 11 Jul 2026 20:16:48 -0700
Message-ID: <20260712031648.486110-1-bp@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

With error records which don't have FRU text, an empty newline is
printed like this:

  [28014.094610] mce: [Hardware Error]: Machine check events logged
  [28014.094674] [Hardware Error]: Corrected error, no action required.
  [28014.094687] [Hardware Error]: CPU:11 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
  [28014.094724] [Hardware Error]: Error Addr: 0x000000019ba9a974
  [28014.094732] [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000081a1f2505

  [28014.094744] [Hardware Error]: Load Store Unit Ext. Error Code: 1
  [28014.094748] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD

Move the \n into the last printk() call where it belongs.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/edac/mce_amd.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/edac/mce_amd.c b/drivers/edac/mce_amd.c
index bd252cb3c38e..ec7395cb7a70 100644
--- a/drivers/edac/mce_amd.c
+++ b/drivers/edac/mce_amd.c
@@ -870,12 +870,10 @@ amd_decode_mce(struct notifier_block *nb, unsigned long val, void *data)
 				memcpy(&frutext[0], &err->vendor.amd.synd1, 8);
 				memcpy(&frutext[8], &err->vendor.amd.synd2, 8);
 
-				pr_emerg(HW_ERR "FRU Text: %s", frutext);
+				pr_emerg(HW_ERR "FRU Text: %s\n", frutext);
 			}
 		}
 
-		pr_cont("\n");
-
 		decode_smca_error(m);
 		goto err_code;
 	}
-- 
2.53.0

