Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A33838D6A5
	for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 23:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271567; cv=none; b=hILj0k4AKIOdK/Ny3wWzYke8thqQslY9uUFXkCPiDpF8bg0z4lAxgGV95CiY2D3PzrCL5idpdALMUTIVh9rl8rRsKLBCCGp1jl1E/ooddBzVqj4Zsq65lCZq41NPLzc4KvkX2K0ktckkTAmhjJmPYnkqZVDKlLv97tL/U5sWnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271567; c=relaxed/simple;
	bh=3oeka6xSuQGsIoemOkiYuLcr42dJkXo6FacYTZeSSHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FI/joMthXqsd1uQ8xO4KCzrpmnF6cyJDi5utXS7bRplQ4cZ+nq5cplv8xnKSOczXBq1VTJvn3NRzM9H34q5P2Uhl2YLnxBzvKBG9mqQcLr2ndS4SMsjWjgZ3K2g/uilwCQ+gA8AeInnnBPDZUkOS13vbgxUc4cRnIypRdPyHNPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLWu/qGg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLWu/qGg"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8296dabef74so394976b3a.1
        for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 16:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271565; x=1773876365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4ZhuYWhXFbDLDSntJ2zZXQchcPysyGDuSdk2vVJCmg=;
        b=VLWu/qGgLCgEQZPzfuj8j0w1GH+tG3/FbugHnUWUoQOexVGp/gAHuGlMBI65llQ2PD
         96UWhhtCuP6PcfOUb9u8EW/dGzS2M2CzdXvRl6a0qs8jr3fa4i2NtbyKaLKkW38vhpis
         KnJmpdjZLB3WSodNwsIK2BGKhao3NqBR+q68gYiBRvYaZU9ODMlXO5IFjGhcjTmOuLO+
         nbBAoGW7/t0GZNUzeltFFa/6Xdbl/lFc4IX7uuDQlFxgJIQiODXABIqRxl67o5RM8xaY
         q4huzmcmEtqcBbOye95mzyF4aAnfbMa696jLjMRFcMBLynGzxkLCsVCxkyzJ99wwBFW6
         w0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271565; x=1773876365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4ZhuYWhXFbDLDSntJ2zZXQchcPysyGDuSdk2vVJCmg=;
        b=Lb/8Sv/KjTF3IPwGov49M8+OYEQV21AfLsCzCAaomifBZan1lpODgZibxe2YYnWneC
         SGJe66Sbj3sUPKhKEDisnnEsdrDezXqry88xMFfnE+/l5D9bhAmZE0ccAjVA4BJXpEoY
         lrTsgVylpuukvtEOj5Q6Npe9BuVU43pKt/8xb8iNXqVnWWCA2/5Tr4fEQioYLEzSDrYb
         0xbuczBP6iat9p5IdwTPseJWVeBHuhE9ifzMDEVKi0oSaBg7fbWyPTvMdRd14+XBOO29
         LFhudeMUVJdRB8DjnFChz/9yPqgZ7PU+EwPwdRSV4i2CzJXBWrSU+e971fNnbIKtzm/2
         Qe0w==
X-Gm-Message-State: AOJu0Yzlm7Bo6dmRqm4q6MwrSaVmOF2exJbla2lF8RHy5Q9qWsyWErWs
	nvq7Y+yq1sUwYyPTcQNNmS/nwZ+uVMk0t7Ri8DfAEeVC4JSRaeXlxcK+BOvWohDE
X-Gm-Gg: ATEYQzyUnxhNcdglivvUWi+r3ityYvLJ1lWfHn6vM7cBnoPjp9JczccV5Dpa46pPxPg
	idDRnLTY7dw+gs2MR7V9E2IdEXrMOBbG1roi5Ab/uKgpuqeIvTmwFTi7OLAWdtbRwrnotFHZkSe
	pwFJHgrjMl7shm0aJ2jHHxd73KqVFkFU5gkyvLub08MXRSjATwixeD0xJR/cHhpWtjLE9FlnYrm
	nG43tEnkSTkcbBfRO6sicVUnsNuk6dHHQKgHwEgTYxaURTWOqT9JHVsEsHNET1Mxxa6G771mBD4
	5v2Q4KEYh+YPBaBikB11mavvNdNtG1hL7wa1Wy6wTJLHBtIk3ZhweBQkp6v/chbYd2JSEXPX9BR
	yVM/Q2vVw3b+LCZgEVaZe2QJ9/tAtFm1Yu7Bvi7AcOmNJokKvImUAzuJWIaSEQlgPHE9/ZHRCcB
	+f6NNemS8veIkapv67FFCs7DsdOU05oAu4NyvVYz4odYgOhAzqlEbbPg==
X-Received: by 2002:a05:6a00:94a6:b0:82a:8aa:cbb0 with SMTP id d2e1a72fcca58-82a08aad83dmr482996b3a.29.1773271565071;
        Wed, 11 Mar 2026 16:26:05 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07341ed1sm740846b3a.33.2026.03.11.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:26:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Tony Luck <tony.luck@intel.com>,
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] EDAC: sb_edac: use kzalloc_flex
Date: Wed, 11 Mar 2026 16:25:45 -0700
Message-ID: <20260311232545.18492-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocations by using a flexible array member in this struct.

Add __counted_by to get extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/sb_edac.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
index 09d4e816404b..7b282dfd093f 100644
--- a/drivers/edac/sb_edac.c
+++ b/drivers/edac/sb_edac.c
@@ -364,11 +364,11 @@ struct sbridge_dev {
 	int			seg;
 	u8			bus, mc;
 	u8			node_id, source_id;
-	struct pci_dev		**pdev;
 	enum domain		dom;
 	int			n_devs;
 	int			i_devs;
 	struct mem_ctl_info	*mci;
+	struct pci_dev		*pdev[] __counted_by(n_devs);
 };
 
 struct knl_pvt {
@@ -771,21 +771,14 @@ static struct sbridge_dev *alloc_sbridge_dev(int seg, u8 bus, enum domain dom,
 {
 	struct sbridge_dev *sbridge_dev;
 
-	sbridge_dev = kzalloc_obj(*sbridge_dev);
+	sbridge_dev = kzalloc_flex(*sbridge_dev, pdev, table->n_devs_per_imc);
 	if (!sbridge_dev)
 		return NULL;
 
-	sbridge_dev->pdev = kzalloc_objs(*sbridge_dev->pdev,
-					 table->n_devs_per_imc);
-	if (!sbridge_dev->pdev) {
-		kfree(sbridge_dev);
-		return NULL;
-	}
-
+	sbridge_dev->n_devs = table->n_devs_per_imc;
 	sbridge_dev->seg = seg;
 	sbridge_dev->bus = bus;
 	sbridge_dev->dom = dom;
-	sbridge_dev->n_devs = table->n_devs_per_imc;
 	list_add_tail(&sbridge_dev->list, &sbridge_edac_list);
 
 	return sbridge_dev;
@@ -794,7 +787,6 @@ static struct sbridge_dev *alloc_sbridge_dev(int seg, u8 bus, enum domain dom,
 static void free_sbridge_dev(struct sbridge_dev *sbridge_dev)
 {
 	list_del(&sbridge_dev->list);
-	kfree(sbridge_dev->pdev);
 	kfree(sbridge_dev);
 }
 
-- 
2.53.0

