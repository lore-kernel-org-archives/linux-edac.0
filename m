Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A082836BE;
	Tue, 31 Mar 2026 12:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774959387; cv=none; b=XEy3uaMPQ5dfulAZ8+k4eKt+ERV4X1vNcQjSSPIdetJTZgZIwsn7xJw2fSIIq+VyPhPROw/hGOAdNehicqj8+TvuW2CaLYca8R+O4EaHPzYgI2kcC7AwxgkwGib/ZdVyohtfkEEnVMvnpP2ML+WXn8k6lglCAGnnefFKG4m2sDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774959387; c=relaxed/simple;
	bh=D42bmMYrX+ybqYjtyM9a0qR1z0bN8ByK9xECT7XvtqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DIIzpYHlBHcWsLs4zCvC/iQmQEGTCS26a6jlcb3mbxJ3USd9o5H1hCvovwyPUoYs7Uss7KUd9oqJWg67igODCCq8LhnlOdQ+lIGbFJbhrxBev3oY7W7epWXeU2rFsEcwevl2XKt5OBFf9D3jbnXf0T3aHf36FTpeqlrgiaA3Ynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3pz/w6X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3pz/w6X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437A5C19423;
	Tue, 31 Mar 2026 12:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774959387;
	bh=D42bmMYrX+ybqYjtyM9a0qR1z0bN8ByK9xECT7XvtqI=;
	h=From:To:Cc:Subject:Date:From;
	b=a3pz/w6XaAicP1usY8NQS0OICWCCE35ovOEiV8+oWuYnd9niFxRKE7zoc+5EpMjzM
	 Big+s5WgHmDI6twfkDF1s5DtdTAh3Y3IGNifN70Dz7UirKiDCByRl1VWqZXkiTmQJy
	 AOEu5kfjjmrV4PExvdF/V7UKJMl8Q93s6sUkF9iph+pMaIiAoE3W4EkKedPLETnkA+
	 aStotigKg6xGP5IEig0MeIbH9Jf9NqKheallRbAV+/tRBs3ZBqBPJYlyu8q4xKQTs3
	 nwLAzLY1AIcU9GtPdp8tOAD5+cd+gVFJd9A+y8SwMo6BRV7GegcEK9wdXet9kFdB1u
	 TSvZuJIHWmm0g==
From: Borislav Petkov <bp@kernel.org>
To: linux-edac <linux-edac@vger.kernel.org>
Cc: Tony Luck <tony.luck@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	stable@kernel.org
Subject: [PATCH] EDAC/mc: Fix error path ordering in edac_mc_alloc()
Date: Tue, 31 Mar 2026 14:16:23 +0200
Message-ID: <20260331121623.4871-1-bp@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

When the mci->pvt_info allocation in edac_mc_alloc() fails, the error path
will call put_device() which will end up calling the device's release
function.

However, the init ordering is wrong such that device_initialize() happens
*after* the failed allocation and thus the device itself and the release
function pointer are not initialized yet when they're called:

  MCE: In-kernel MCE decoding enabled.
  ------------[ cut here ]------------
  kobject: '(null)': is not initialized, yet kobject_put() is being called.
  WARNING: lib/kobject.c:734 at kobject_put, CPU#22: systemd-udevd
  CPU: 22 UID: 0 PID: 538 Comm: systemd-udevd Not tainted 7.0.0-rc1+ #2 PREEMPT(full)
  RIP: 0010:kobject_put
  Call Trace:
   <TASK>
   edac_mc_alloc+0xbe/0xe0 [edac_core]
   amd64_edac_init+0x7a4/0xff0 [amd64_edac]
   ? __pfx_amd64_edac_init+0x10/0x10 [amd64_edac]
   do_one_initcall
   ...

Reorder the calling sequence such that the device is initialized and thus the
release function pointer is properly set before it can be used.

This was found by Claude while reviewing another EDAC patch.

Fixes: 0bbb265f7089 ("EDAC/mc: Get rid of silly one-shot struct allocation in edac_mc_alloc()")
Reported-by: Claude Code:claude-opus-4.5
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Cc: <stable@kernel.org>
---
 drivers/edac/edac_mc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/edac/edac_mc.c b/drivers/edac/edac_mc.c
index 07d3f73bcd23..fd70caa85574 100644
--- a/drivers/edac/edac_mc.c
+++ b/drivers/edac/edac_mc.c
@@ -367,13 +367,13 @@ struct mem_ctl_info *edac_mc_alloc(unsigned int mc_num,
 	mci->n_layers = n_layers;
 	memcpy(mci->layers, layers, sizeof(*layer) * n_layers);
 
+	mci->dev.release = mci_release;
+	device_initialize(&mci->dev);
+
 	mci->pvt_info = kzalloc(sz_pvt, GFP_KERNEL);
 	if (!mci->pvt_info)
 		goto error;
 
-	mci->dev.release = mci_release;
-	device_initialize(&mci->dev);
-
 	/* setup index and various internal pointers */
 	mci->mc_idx = mc_num;
 	mci->tot_dimms = tot_dimms;
-- 
2.51.0

