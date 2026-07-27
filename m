Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E47140E5F;
	Mon, 27 Jul 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158671; cv=none; b=vBDd0cZe5BFP6Xu7C6FjGxe2mZzYuN//GblnSaHR/2T7qV2gCu5R0axqBni0OIzISgSTI/VwJSmBQUoH1RqxKjxkvdotTbQv+obShfxrFo3rvdKeU72XjbIfXfN7ka81DL1sQrZl4ueB5xtKOj9gIf3jJ3FDOi3cQIkwU3QxjJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158671; c=relaxed/simple;
	bh=zftXiK4W6lHQFTXz8GpM5d1e6OI4ROiaI0rGG06olvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AO2PMnWM5wgaryeEGL/L7G5LB9bZB2dL37E8RKuv3oKz4Q/ZtIIIkQLJyLEYCaGcT2UVEWJQpEIhRwr1KipyDhTw+ocqOae286mim2NKrT4vaCLWA/tTr+Pd5CdFwi2U+lDXbriE3OdgktAysmWaQdXr2v4axjte3RTcXBRMIBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ip732K4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ip732K4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B5C1F000E9;
	Mon, 27 Jul 2026 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785158670;
	bh=u/a1nORypEiJcZ39rVOhCYdZ/j18kUZkwZ1MPY88rp8=;
	h=From:To:Cc:Subject:Date;
	b=ip732K4sb566RsLpyR01h44+4bUe9veHz+zjuMq0IxnSVihpTrBGl7+bpwqoaQjvx
	 KQu6HQFcdDeiXpNcW1xmoaCceBZ9cTizMMTMKZrLbk2CUVJ1/JVKDYpNLqaps1T4if
	 5xilES/ImiPeTk1ID015nrGoCzvc8+DRBORV/mEtWySvNtOVPnt9hNGhndXoGkf/b9
	 HFfxGSZpP6yZMEdvrMZsPJLfXb6fCfyr7w7Cj+ZDwGMXgq9swKcvZa/chxBCYVU1WH
	 AM8dhaar3IpM91za+Adqw2Vn3gmOB+xnYDx77QgXaIXgUCE+95txO3KRNenPq0ZP9t
	 4t4O1W82bj5fg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] EDAC/altera: Address sashiko reviews part 1
Date: Mon, 27 Jul 2026 08:24:06 -0500
Message-ID: <20260727132416.807230-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the first set of patches addressing sashiko reviews. I've tried
to the best of my ability to decipher hallucinations and actually bugs
found. There are a few more and I anticipate another series, but I wanted
to keep the series small and handle the most critical bugs found first.

The most important patch is in this series is "EDAC/altera: Add
suppress_bind_attrs so driver cannot get unbound". Because this driver
never tested against bind/unbind, this bug was not observed. Without
this patch, an unbind/bind would cause the system to crash.

Thanks,
Dinh

Dinh Nguyen (10):
  EDAC/altera: Fix NULL of_node dereference altr_edac_device_probe()
  EDAC/altera: Fix use-after-free in error paths
  EDAC/altera: Guard against NULL match data in altr_sdram_probe()
  EDAC/altera: Fix IRQ domain leak on platform_get_irq() failure
  EDAC/altera: Fix code leak on dci allocation failure
  EDAC/altera: Add suppress_bind_attrs so driver cannot get unbound
  EDAC/altera: Drop __init from ECC setup paths for re-probe safety
  EDAC/altera: Skip ECC memory init if already initialized
  EDAC/altera: Detach sb_irq handler when db_irq setup fails
  EDAC/altera: Fix error cleanup path in altr_edac_device_probe()

 drivers/edac/altera_edac.c | 118 ++++++++++++++++++++++++-------------
 1 file changed, 77 insertions(+), 41 deletions(-)

-- 
2.42.0.411.g813d9a9188

