Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684672;
	b=xYWze4nCfOdeZeQcRi2XwLgjBg6EIsbNGW0X7UiChqRI8kG0HAlq8gdUg19DP/oyQQdh
	 SfJVDDsEEI5GldfHrUS4lnZWZDmGDC6wdv7cNxopDz0w1+AoO746fffO+mro6YNeA0JKA
	 QXA0U3xmkwED400r1O0ZqylgAwSKPc3UBf6vhCcZR+5erVk0RpgP4gqzT05Bs4HP2Wn6i
	 7TSaYBGWfFsBwcbqDg6q2iMaD5+mT68+I3aTTxBYpynDguw2d2ySekOQsPFlvzfseZTmo
	 9FLfYzpBnjApaF96hg1uPIolu/obPlxMMh8Ss+1yebpnPFGD0s0tcsDm4fyupryXeQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d1IwY0SZ93EHNkqt/Svz5shK9e8xm3IUrcVs2KOn+U4=;
	b=foXkikwUh9py78km4NHZyQPNR/8S3AbvybIJICBNDeHJdzsf47q95+02C4ao4tFqqS0D
	 OnMqL2/vMur1ntJv5Lf4Tl/uTZps+BZQ4tAGUs5g/u7ndrU6zb/saRr7MhU/Rr3Au8LQj
	 7MSlzIr3cGLYRTQmTHrPzLVbVvYS6hStze3aixCI/9SNQsMklL9vMeaOzb/UrLzCafIDM
	 C0A/fvIi3Ottzn7Pt4iCQneT+YnMo+9Te0rvv6kEwI4PgGU3u41w3V/utIFrDMY/9aylZ
	 ht2d8pOGT0TKHRT4uEfxE5mHAo5UKvO702OechW3bb5hxuHML4pWeMyqqIVg269FAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKdPkNX1;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542BD606A31C
	for <linux-edac@vger.kernel.org>; Thu, 26 Nov 2026 09:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 542BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UKdPkNX1
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38431138772so8812760eec.1
        for <linux-edac@vger.kernel.org>; Thu, 26 Nov 2026 01:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684671; x=1796289471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1IwY0SZ93EHNkqt/Svz5shK9e8xm3IUrcVs2KOn+U4=;
        b=UKdPkNX1ksh4wLR19uqs7yJzY0seBapvvpUzVeiK7gjO85SXZLkRlJnYN7yFl0t7qw
         WXUBDT6+entzA1nyOEsU5xoLnqB2ZYFsPUGYC9cTzJWpC+/HDV3o3s8yU3QMh0IH3ajt
         mBCUSFpdrFPdCxo3BPyfl3/F596w10zpEUTAnOuKSPjyLEamF+J/VuAJ3F55any5YnLd
         48x26MOZ4ku33OsQB+b8cWbajtTqvinim4ojQTHcMunlOekR23zpQmKqzORG1QdTAmPW
         BI2N+GNTUAKopZ9BnBsRsLVHS6Nnqa0xjjqq3nG3/I3queyRn3wmaS4WYRQam+M9D4Dg
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684671; x=1796289471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1IwY0SZ93EHNkqt/Svz5shK9e8xm3IUrcVs2KOn+U4=;
        b=aEAvrr0N7ClZI+LB9lNofPrRGrA0+sR/R+9L+0xXjSVpC/lIUXXU9/I5SdqBm7SN0o
         gIiYjhFaqHho0ZxI3Fm39SKpVrMEeVw5cYADxUUd+LuFU8DHK01gyFFwByBQulxZ6Qco
         okpfZg8ZlsBrl/5hfztVSfmYVqUKbQ56i8vXKgcgieHNy6Hmj38/Q4zSoizCq6knVZAq
         6ittIuTD+q0yGcCiTzBhyfMIncmbjplNGmdParTDQpDDCBeg1cRQjPDSXgVoGvm/ABsm
         M8Cz9CSpzpmYRyXEAkIwgMC/tzmxzef6ga6jQIxoAbz6UrQ4XGDv9cdIwTMN0fuddt89
         7WbA==
X-Forwarded-Encrypted: i=1; AL+hErHwLWFNET7ujNG7+IUIhUB+La5bfCmjPWJJrDw2ZZJ3rj/LOykA3GVVkiy+LEOBRrrRnlJwhJsMht9s@vger.kernel.org
X-Gm-Message-State: APuU4Z+2y5zq4CxhCPilrafosYFVrwHE+p1lv2e/kFQWze2S8WX7ZkLy
	bxpuqpqXQgD3qf+3t8tvFZylR4YheHqJjYEVAmp7UVhAxUUpE3iQHAs2V4J8gg==
X-Gm-Gg: AZFdTZcp4OqUJwuTHLMN6xd4LjJ/kIMer/or+FPnimBMKze6MHskQ14lcRYdB7hWB3G
	PYy4PjVkt/GJ9UiVipSXWNsm+0irkeUaTL5Oz4GOiu8T6YNbsfeBxerQ14apdKOtypHSIcV/kot
	ZDwk9EIy6DJUlDEhmWYTuT+zgSeFoUWbc5MGNdmkYhF7lgSM8O/eIFXu/pPuHe8anYRoumrznTc
	ajCW3HByUim0v+cb1wlDGjGK7bbCDxTgFCQhcC93L1prSAXZGckd407rcA+xloMW4zWC0jpTG08
	BfWFFg+AhFP0r5irQq2B3/rAuS7r+g5e2jtNaPnREp5QYg1OfDYP5XArlqAxLbtqlTfnvfD1MSA
	HRXLJlgcpp8dXUUkR2u2xHQEoEEyBgo2Auh3Mz6KWg/c8jpByBClnxtRw+PBEFJqGfdxB+E5stb
	E45sSvnW35IUlSnNfQeaEhhZlt0TNzHEgeFdaNEU342fLo+GoHlBge1fyRgXBpZeCeEb3e2Wvqa
	84ImAJVVMMivzB5iQdiJNgdWhQvrwJGX1UnOCN/F5s790K6yzj2ehRDSz0UWOlSJLtar3WwJPq7
	I8njaeAUFvuQ+CV7j86DtWNuN9U0Xe0ZNhlJpKdiC2BTWu6qzAHEkawREPJwJrk=
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr15512715eec.3.1795684671328;
        Thu, 26 Nov 2026 01:17:51 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm48060697eec.1.2026.11.26.01.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:17:50 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org
Cc: John Allen <john.allen@amd.com>,
	Aichun Shi <shiaichun@open-hieco.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS/AMD/ATL: Check the legacy MMIO hole after the address map is read
Date: Thu, 26 Nov 2026 14:47:44 +0530
Message-ID: <20261126091744.2096611-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

norm_to_sys_addr() refuses to translate an address when the legacy MMIO
hole is enabled but the DRAM hole base is unknown.  That check cannot
fire.  It runs on a freshly zeroed addr_ctx, and legacy_hole_en() reads
ctx->map.base, or ctx->map.ctl on DF4 and later.  Both are only filled in
by get_address_map(), which runs two calls further down, so FIELD_GET()
always sees a zeroed register and reports the hole as disabled.

The situation the check was added for is still reachable.
get_df_system_info() only warns when get_dram_hole_base() fails and
leaves df_cfg.dram_hole_base at zero, so the library loads either way.
On a system whose hole is enabled, add_legacy_hole() then compares
against a base of zero, takes the branch for every address, and adds
BIT_ULL(32).  The system physical address handed back is 4 GiB too high,
and the caller retires the wrong page.

This has not been observed on hardware; it needs the DRAM hole base read
to fail on a system that has the hole enabled.

Move the check below get_address_map(), where ctx.map holds the values
read from the Data Fabric.

Fixes: 1233aa3fb342 ("RAS/AMD/ATL: Read DRAM hole base early")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
Compile-tested only.  ATL needs an AMD Zen system with a Data Fabric, and
norm_to_sys_addr() is only entered from a DRAM ECC error, so I cannot run it
here.  Built at W=1 with CONFIG_AMD_ATL=m, and confirmed core.o is not built
with it =n.  I also replayed the guard outside the kernel, with the same field
masks, across DF2 through DF4p5: it lets every address through today and the
result is 4 GiB too high in each case.

Noticed while reading the Hygon Family 0x18 series, which clones this function
as hygon_norm_to_sys_addr() and places the same check after its own
get_address_map() call [1].  That is the ordering this patch moves to.

Based on origin/master; drivers/ras/amd/atl/core.c is identical in
ras.git edac-for-next, so it applies there too.

[1] https://lore.kernel.org/all/20260528035246.526012-6-shiaichun@open-hieco.net/

 drivers/ras/amd/atl/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
index d77dacdd4f56..06744d3aaf0c 100644
--- a/drivers/ras/amd/atl/core.c
+++ b/drivers/ras/amd/atl/core.c
@@ -125,15 +125,15 @@ unsigned long norm_to_sys_addr(u8 socket_id, u8 die_id, u8 coh_st_inst_id, unsig
 	ctx.inputs.die_id = die_id;
 	ctx.inputs.coh_st_inst_id = coh_st_inst_id;
 
-	if (legacy_hole_en(&ctx) && !df_cfg.dram_hole_base)
-		return -EINVAL;
-
 	if (determine_node_id(&ctx, socket_id, die_id))
 		return -EINVAL;
 
 	if (get_address_map(&ctx))
 		return -EINVAL;
 
+	if (legacy_hole_en(&ctx) && !df_cfg.dram_hole_base)
+		return -EINVAL;
+
 	if (denormalize_address(&ctx))
 		return -EINVAL;
 
-- 
2.54.0


