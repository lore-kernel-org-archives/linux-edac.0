Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2F3A8756;
	Mon, 11 May 2026 20:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532069; cv=none; b=fx2Q9Y+56yzbcT/WItmvxqvc0qzHN8jIh/GUNnXBRtqv6yBnbU9Nr5nNtKEBCpl6PtjXkyEuQrJKuEBoed6AsvaZ4k8c+LC+Bx9Ucy8TpiJAkYj8TeLSAvMSyoOwJsBM8qURZIijJESk3ibXb9TWYCuL8WoXYcLp+3AbuBJxZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532069; c=relaxed/simple;
	bh=kazZdssv6rrbjASAXCsLwiHL1NAMZ3OkTZSHd7TmKlg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MfzO8qgfrNqRK3n6rAvbUYtOJX4md52Yr/aspXqa+GQKKiJbiO1CbgnsUFNrxlIbv80DcOTD/2I6HDBW0gGbDkL46oOB5g2FPAa/Ku+hIFEaxJj43wgbOqLBXLKJqCfu9t2PVecsNz0olzybajD91m3r3l3jAi2myfSLfgnJ7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=N7BLYy8e; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="N7BLYy8e"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=kazZdssv6rrb
	jASAXCsLwiHL1NAMZ3OkTZSHd7TmKlg=; h=subject:from:cc:to:date;
	d=al2klimov.de; b=N7BLYy8eAaYxBNo8LZ3ZrVDbtF3DYIjFLFrF9b4nmRLwE6TvtYM1
	uN0Bgxz7RCsClVYsgkR9jdvO61euaembTQj0SSsB/E8w68JslX/jwsX3mZy321erWY/qEf
	xMJvKNk3HdeS0EO8LZWbGJiIsEvoVjPtolyL81XnedZGKB4TbTbHKc2nbf3yVpWKFxO6O5
	UWznWalxzDUkMsLZWorT/LukJ+wm/nE1UjaDGxAVEkO4qjsQX7vNwNifVuymHrXke2PS53
	NkBxUgr6Btx7712BX31ApjP64C7RyWBmIWXqzHtblL6V9Svc5renarOIjTqIOVBZMDaByd
	N92W/G4Emw==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 17302414 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Mon, 11 May 2026 20:40:55 +0000 (UTC)
Message-ID: <77d710ce-cf4b-4794-9467-7ca0fc638a6c@al2klimov.de>
Date: Mon, 11 May 2026 22:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] EDAC/versalnet: fix possible buffer overflow
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In rpmsg_probe(), a string was copied like this:

     strscpy(DST, SRC, strlen(SRC));

A buffer overflow would happen if strlen(SRC) > sizeof(DST).
Actually, strscpy() must be used this way:

     strscpy(DST, SRC, sizeof(DST));
     strscpy(DST, SRC); // defaults to sizeof(DST)

Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
  drivers/edac/versalnet_edac.c | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 97ec05d68bbb..ee3ad64e34a4 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -728,8 +728,7 @@ static int rpmsg_probe(struct rpmsg_device *rpdev)
  	pg = (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
  	chinfo.src = RPMSG_ADDR_ANY;
  	chinfo.dst = rpdev->dst;
-	strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
-		strlen(amd_rpmsg_id_table[0].name));
+	strscpy(chinfo.name, amd_rpmsg_id_table[0].name);

  	pg->ept = rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
  	if (!pg->ept)
-- 
2.54.0

