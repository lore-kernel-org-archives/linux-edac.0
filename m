Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486775;
	b=PZdfoJ8vBLJsIpZkTrVHDd22vwYWiaqfRtV68IhjeFpDZHcPXZdALXxTI8A/kpN8nluB
	 FBshcROkE0HAHjLUedg3dGUiAtaPs9g34tUcKxWTsjFOd5RLkBnSnqGcRPYjIsZx1M/qy
	 fArt77Dzv+Iecy1Jsmfz5vnE2G7xAqRG0m8Y/IwVTWmN+0P6vdQu+MEYM37KaEmcxSBmB
	 Jw94xyuTXfA6D4q60m0dNyvTpKxHsHxi3AnrPDr0tklniiKNCsuX6PTUkLmv5zk1RE05C
	 59cPJf80auenJ7ogzwac1W/NdPLOf3dy63DI4P1xbdhLxSdr6XnK3skerzK5jFe62lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486775;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ovE50DcR5YB7E/nO8X0QpKbIy4s1PPSaAbhETQNprMQ=;
	b=gIlJFKcPCklXi8mU9iJrt0SEMrtkD3iyrT0VZBdt9mZu4EdeFvvYDP5wOGR6PDx+szyx
	 Ry/10t+aR7k7AkRKYAeYot9WXF/caum3gsc/bk5MIeKRhQ7qoKMC6oF35Bg72o8ej+wqU
	 d3JpQQbwzX0csZ+n522dwkeNySEfWRFqWbaajALtD4ARhBCnpQRlPhdptFywX//Hf25Vr
	 ExwhK9KvesJZ0Xi5RrF8Ajxa5uGF1oXXMf/qq6uD5HsEfHfEfnlVa5VcrctLLodQ+1MXT
	 53pq/p6iu9+UNScvhO0sbMRoG3Q3VXdrzsqriMF6Ztu0iHLO8r0bC3gf2hGFzqDpYVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=S5ewNgag;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FE8606A31E;
	Tue, 24 Nov 2026 02:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56FE8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=S5ewNgag
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BEDBA40E02B4;
	Tue, 24 Nov 2026 02:19:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QpkJfojVIM6f; Tue, 24 Nov 2026 02:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1795486769; bh=ovE50DcR5YB7E/nO8X0QpKbIy4s1PPSaAbhETQNprMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5ewNgagV9kPsk2qV2+oguD8rpXzEbhfqkdv029V6WyquDbKY+TzpgzDxWJYhp6ax
	 HtENwnjR/u30wQ7VSw73p1UHPLwMvnz27itI0opb80r5o5xKdJ487/t9qfcdzYKNSm
	 Q4O1vot8dTB+iCPf/+N1CgxOBCS2tTgWSbAF7wiICeVGHFYTxOxFovse4xo925aOxq
	 8LwIhW7mVaC9iQoNdIK5I97lkxVVYrkMkiNUDJj2S8rJjFSn83vG0LwiNaJb9lCYKp
	 I1n6rR/8kp17HjHtDH5MoVJmwB34HnU6B0AOfVMNKpxifmFALk62XoHQTxBDTcky5Q
	 xSxDVbgDAA6VJZkPwvDDg8ugd8ZyaBBJjRb0SdfIgKOd3yoQtsWcUP6WrWkJ4h0FQW
	 gDIwkCu9GPexst3I0yJGHve+tyB6An2pXQpoHu3Nrxsh7+R/zaHi+IoMFbrZM8OSPX
	 07VXWUgqTe4we2FwAi1BeXWJpjWYZn0B0tNvR4wpmVNbaPOTgu50dwStnVxuksaK94
	 MT9cr+21jWsOPm2SPZRfU1UEOdKO0zlhDhWDNjVy+rDA9xY76m3Q1SWBB7O0KmMeo6
	 YesEeCc4i4w3H0jSDgK/OqpSftHRhPR8RAlvPBRPEnwSNhxOeo1ev5VcVb6xpH6Goz
	 RbHNZm8O1uspwk33FZq655vU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3FBED40E02A9;
	Tue, 24 Nov 2026 02:19:17 +0000 (UTC)
Date: Mon, 23 Nov 2026 18:19:14 -0800
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	michal.simek@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/12] EDAC/versalnet: Use designated initializer for
 rpmsg_channel_info
Message-ID: <20261124021914.GJawT0Im6zaLUotIqG@fat_crate.local>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-3-shubhrajyoti.datta@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118142213.100581-3-shubhrajyoti.datta@amd.com>

On Wed, Nov 18, 2026 at 07:50:26PM +0530, Shubhrajyoti Datta wrote:
> Replace field-by-field assignment of struct rpmsg_channel_info with a
> designated initializer. The old strscpy() call used strlen() as the
> destination size, which truncated the channel name. Use the
> string literal (via EDAC_RPMSG_CHAN_NAME) in the initializer so the
> full name is passed to rpmsg_create_ept().
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> Use a macro for channel name
> 
>  drivers/edac/versalnet_edac.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Changes ontop:

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 3d496c71126a..9dcb38cf3ba9 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -70,7 +70,7 @@
 #define XDDR5_BUS_WIDTH_32		1
 #define XDDR5_BUS_WIDTH_16		2
 
-#define EDAC_RPMSG_CHAN_NAME	"error_ipc"
+#define RPMSG_CHAN_NAME	"error_ipc"
 
 /**
  * struct ecc_error_info - ECC error log information.
@@ -715,7 +715,7 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
 }
 
 static struct rpmsg_device_id amd_rpmsg_id_table[] = {
-	{ .name = EDAC_RPMSG_CHAN_NAME },
+	{ .name = RPMSG_CHAN_NAME },
 	{ },
 };
 MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
@@ -723,9 +723,9 @@ MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);
 static int rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct rpmsg_channel_info chinfo = {
-		.src = RPMSG_ADDR_ANY,
-		.dst = rpdev->dst,
-		.name = EDAC_RPMSG_CHAN_NAME,
+		.src	= RPMSG_ADDR_ANY,
+		.dst	= rpdev->dst,
+		.name	= RPMSG_CHAN_NAME,
 	};
 	struct mc_priv *pg;
 
-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
