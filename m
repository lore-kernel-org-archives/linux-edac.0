Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795008634;
	b=XQWE7TlRtlI5qmNCE3QVA+B+bYW/cRoaTmhkAnJDtDaiQPKWyXepBN8N1URyQkGplCis
	 t2NDveFxdrblt4QVkS2/8/408veDoiMu8oveiOSsVHdkYYT/H96L1pPTRQwEIkihr5BE6
	 d6TGt3nebWV2StzDZHbvp2r745LnOf1q81McoBsgzCq676F1DOsqofNtAXxuta2Bsq2hM
	 voEurOO9kUqPfzNI4yt0cSjWNeqgDwnkP1qbseOLkK3Gm6iOgwFZWR01vfndAe0uT0N5n
	 IrMD9OV4uqu5Hx4L00UCm7PlrdQkrxpYzoyWgP+V99tOGcrhYQRpWFF0WvX3SUxfCXQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008634;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=fVwRT26k7SVKZLHEOdP2bT4be/bVX2eT6G04Pp6eiDE=;
	b=xtsva/2uWldYIyA3H+jxLs7w2SPNHfuPnbgK95DbF5eHlY8TEtare2RfmOTb8YLW5CqM
	 A6JzOieywyc6GVYR6mKWQu3u9ZUVlry9h6rY0R3QuqyDGqvADSC/YKGooieUDTi/VWU89
	 /AQMr8bKtKjIap+Ex6luje6oXCReFKqIm7/IBpc/1Q1KgSsvMaeeOqTVwvCHdR0BvCo5n
	 9OYP6cf/OGEE/k5QYOBEZWvJ1R4zJ/Sdo0B1dllQLwhBWf8DK6myZABDwSlgDxchjJm+3
	 iMP/f9hRZH34oM1xvjhNkf90pOHb5wm1eEymLtfdrsO0/Zows6TPLLxgtdkRyy8Oa+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENhBEI+I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71A606A32A;
	Wed, 18 Nov 2026 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENhBEI+I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795008634;
	b=zJDjXeHIGu2H+v+Z1dmp1M/2zb00BJc7TtSWKzdzFjiieUGgXEX7q3zOucXurbZFhrQc
	 komaif+OTDYxhFt6XO+rxVbvtV7FM7C5Qul3YqCzoF8ASfkPeVrkBIu1iwCASNk32hT+1
	 OcgIxy8lL7m9BFMJt7zTTOs/Ph7bP4AZExsoXOKwEDMnksmamD8Eshmmc8kVbRmo1YQPa
	 r4nJemnUJvqX0GqiyhCmsjMea/aJSNqC2RRq/XrtTSPMJ1Op05icLq7Dd8X6G6Cl/6kFA
	 yNLkWcF+K3rGg6CHMi/mfns9hZhQXRombJlqajTYVEVJ0sv/LDL4F8YY492yOY2jwug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795008634;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=fVwRT26k7SVKZLHEOdP2bT4be/bVX2eT6G04Pp6eiDE=;
	b=CXXl0e9iuqNEq47Tsb0aaazHImLuVf7CcHiDZ+TrCIx/PcOaI1LHIE8/4rUVQEXjIk8V
	 7n5wKWSFWYthBSbTjrUpCdX8//Finm2Dksy3SmXis+tcvJqKUQKhqnUdEvxVNW2KAX5yC
	 2AtmDTUQSQtu+lCJJ0aBM9Skb7ebCKftvggzUcA6YpB4DjYBZ+n0n7QzKXFanXACmxDY6
	 Qoc44ZJl1uWQRIf2Fd1rTYC0uPQZMOl3EyWSQ5HFYjKBs53hK+kbI/8Qikq4PpcAIdm/P
	 n0O/1RlihgUm3ksCoxqL6DrWaXksmesqnO1LFhej+QjM0X3NWoe1Nqvx1s051r34CKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B0B71F000C6;
	Wed, 18 Nov 2026 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008633;
	bh=fVwRT26k7SVKZLHEOdP2bT4be/bVX2eT6G04Pp6eiDE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ENhBEI+IsGX4zgewt9EMfAMnawTn2U1JNSTfMMIjz8DXWUWO1YgHLxjiokztHcJ7l
	 sGQR0jLoEuLko/IT+Ofx71BpMSzmEtxlJHBFObmEJiHmMEREO0s/xr59CMOYtqdBbZ
	 5q67p2aMiXa2Dmyqlu4pmI+Hk/hlWiTT2+n+DYZJjLPZC+vQ+nAz4666l85aHKik84
	 DdPHHSoXfLdXWPWFRYU88Cm6mf+Fns4yPyMF2+lpyoagGcaThR9Zi+wj11F3z3v+Y1
	 SYsCItDd7tU+A8P0A9vnQWyaR/ei+mZx8/IxgTntUusueDcQXkZ/tY8xrk6Du0vKbQ
	 B9ge3gkqKL9UA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 18C644AD80;
	Wed, 18 Nov 2026 13:30:33 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 13:30:32 +0000
Subject: [PATCH] EDAC/versalnet: Fix device-name use-after-free on removal
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-edac-versalnet-v1-1-cee5b2d3cb25@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHeo/WoC/yXMQQqDMBBG4avIrBswBkS9SuliTH51RNKSsVIQ7
 26sy2/x3k6KJFDqip0SNlF5xwz7KMhPHEcYCdlUlVVtrW0MAnuzISkvEasZXGh7V7rGM1OOPgm
 D/P7D5+u2fvsZfr0udBwn51M7SHIAAAA=
X-Change-ID: 20261118-edac-versalnet-f3d9b3038caa
To: tony.luck@intel.com, bp@alien8.de, shubhrajyoti.datta@amd.com
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 radhey.shyam.pandey@amd.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795008632; l=2204;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=sTtyzJiANnIvp7M1JNbpCfE+tCWHvVaQU2IfbQIiNEU=;
 b=ePMlEm6RensHEV8Xaa8mBur6V/XNR+lMpvzg4hG9hfo9o8doC3KcdGdr2YTBDqrVuq8lgPLn+
 0qH80Yqz5lRDQZOqTuyYn/PCZuidD6Ng2vR4LJCeChck3GVoEz/QmRr
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

mc_init() stores a pointer to the backing device's name in mci->dev_name
without copying the string:

	mci->dev_name = dev_name(dev);

remove_one_mc() then unregisters that device before calling
edac_mc_del_mc():

	device_unregister(mci->pdev);
	edac_mc_del_mc(mci->pdev);

device_unregister() can drop the last reference, and kobject_cleanup()
frees the device's name along with the device. edac_mc_del_mc() then
logs the controller removal through edac_dev_name(mci), i.e.
mci->dev_name, reading the freed name string.

Call edac_mc_del_mc() before device_unregister(), so the device and its
name stay alive until EDAC has logged and removed the controller.

Found with a static analysis tool and checked by hand.

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Link: https://lore.kernel.org/linux-edac/20260724171945.2812749-9-shubhrajyoti.datta@amd.com/
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
We found this independently and later found the earlier patch linked
above, which fixes the same bug as part of a larger series; this is a
standalone two-line version. The bad ordering predates the refactor in
62a9fc50e8d9 -- it was already in the original driver, in both the normal
remove path and the init-failure rollback path.

The change only reorders two cleanup calls. Checked by inspection; I
couldn't build it here (it needs an arm64 Zynq config and my arm64 cross
toolchain fails at an unrelated vdso step), and I don't have the hardware.
---
 drivers/edac/versalnet_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index d59ba3904cda..075b0105c427 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -767,8 +767,8 @@ static void remove_one_mc(struct mc_priv *priv, int i)
 	struct mem_ctl_info *mci;
 
 	mci = priv->mci[i];
-	device_unregister(mci->pdev);
 	edac_mc_del_mc(mci->pdev);
+	device_unregister(mci->pdev);
 	edac_mc_free(mci);
 }
 




