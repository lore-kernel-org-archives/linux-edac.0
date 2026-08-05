Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2FB5A79B;
	Wed,  5 Aug 2026 05:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785907179; cv=none; b=g6RTNH9+CElFSNXZDd2ha+ili82JOfIapB2HQp/H8FzeuaFpVlbaVE/x3a0c5w8BnHTZk6LP+yi7ku1n/kgXnm+vSaYY0qloBMUqLiQemec61L4qfCGcI6fUGtwQLLPMGjNXLAEH0DTydxJ1yt3Te0NcoYDbLjF9pZA3ETZlpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785907179; c=relaxed/simple;
	bh=tKx76mAMYtAFO0o2vz3awMEFZvxTHaekyoV6YfVuC78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJRFpzNvPjiyJgZWlCzZYf0wnnvg0g/gK5eb8kxd9eFvcOGxh2h3R0lo3C8Eo0zxNiysle+/Zx/SmRLFuuh4fBOO9ud72ORsOYmCQfdh2Da1NhTId8r2Vc3EGCI06tL36pKBDq5IDB35Wm9wXhCh5g/BHKBCsWmKhbInx99fV/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=FKFZy5IN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="FKFZy5IN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 842FF40E00B8;
	Wed,  5 Aug 2026 05:19:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id UR1AopS0eAGu; Wed,  5 Aug 2026 05:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785907165; bh=HnY35baxDOOl9O0spWO4s2Z9rQ/HOTzX4TovSIcPv/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKFZy5IN6LGZVyMumwRWOScuk+jGZJ+H6PftA28WWZdqTsDqtvr3KwSVWDjv6ljds
	 yBPiAgWUWggsAJGxztW4EmXFZzg8WEjTMwzAtgqXsAzpAbONEfhYZJfzbZUsQCbSes
	 JhM1v3I47e+OoDQ62B7rm6ic8gw/oMFK4YNOgC9x84pXIt6G4oCxqsKQeDMIUk/umi
	 LY0w1XAuKXCp9ADUMVZeO9naQ+w6qaOtPQjv3t2hu2DjM9xr89kcIY9GNK1V/sACp9
	 lcq875C0U0Z4c9c2f9Yjut90EvlrmJUh7r9xtGpk7HNcv/kwSzZyhOCrG4HPwgtF/P
	 tTBRD3T93KznH8uXZQm+aZSOws87A2Cil4l9G/nWODuwvu7FJJfTTHeY80m8GfOa/n
	 K/yVZG25M73nZXKhrev5qaQS+Teue29wuhpT2RGSiEH5OBLeXTkCczy8o69Yw1xNZv
	 aRR2RCZAEFroOYeIx4CUtzqugHOpTNYX4QIZc/LvcHxKNtdt79rcWe/bdGvgRJBokw
	 iMSgmWKlgCJfDLNprvBQW0SOGP1ZeWDeTfl59WuLxS/cOwXdCnbk9IXLHeiRpzVo3Q
	 k8DoTI2QsB02ikosJJ11f82xgNUvCRwXsfH8hbdvNmX1IIiPKZx0SVylIHi5sEevcE
	 7femXwlKumbPa/cTyiZdHpxo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 10EAE40E0031;
	Wed,  5 Aug 2026 05:19:20 +0000 (UTC)
Date: Tue, 4 Aug 2026 22:19:17 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v9 2/7] RAS/AMD/ATL: Refactor PRM address translation
 into a common helper
Message-ID: <20260805051917.GEanLH1c_I3ayfTccC@fat_crate.local>
References: <20260730194834.3203601-1-yazen.ghannam@amd.com>
 <20260730194834.3203601-3-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730194834.3203601-3-yazen.ghannam@amd.com>

On Thu, Jul 30, 2026 at 03:48:29PM -0400, Yazen Ghannam wrote:
> Every PRM address translation follows the same pattern. Each fills a
> parameter buffer, invokes the handler, and checks the result. Only the
> handler GUID and the output buffer differ.
> 
> Factor the common sequence into prm_umc_norm_to_addr().

And here your commit message ends. The rest is describing the diff.

> -unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
> +int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
> +			 unsigned long addr, void *out_buf)

So if you're going to have a param buffer structure, you might as well use it:

diff --git a/drivers/ras/amd/atl/prm.c b/drivers/ras/amd/atl/prm.c
index 3d5a6f5ae0a9..726464f31e10 100644
--- a/drivers/ras/amd/atl/prm.c
+++ b/drivers/ras/amd/atl/prm.c
@@ -26,18 +26,11 @@ struct param_buf {
 	void *out_buf;
 } __packed;
 
-int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
-			 unsigned long addr, void *out_buf)
+static int __prm_umc_norm_to_addr(guid_t guid, struct param_buf *p)
 {
-	struct param_buf p_buf;
 	int ret;
 
-	p_buf.norm_addr = addr;
-	p_buf.socket    = socket_id;
-	p_buf.bank_id   = bank_id;
-	p_buf.out_buf   = out_buf;
-
-	ret = acpi_call_prm_handler(guid, &p_buf);
+	ret = acpi_call_prm_handler(guid, p);
 	if (!ret)
 		return 0;
 
@@ -52,9 +45,15 @@ int prm_umc_norm_to_addr(guid_t guid, u8 socket_id, u64 bank_id,
 unsigned long prm_umc_norm_to_sys_addr(u8 socket_id, u64 bank_id, unsigned long addr)
 {
 	unsigned long sys_addr;
+	struct param_buf p_buf = {
+		.norm_addr = addr,
+		.socket    = socket_id,
+		.bank_id   = bank_id,
+		.out_buf    = &sys_addr,
+	};
 	int ret;
 
-	ret = prm_umc_norm_to_addr(norm_to_sys_guid, socket_id, bank_id, addr, &sys_addr);
+	ret = __prm_umc_norm_to_addr(norm_to_sys_guid, &p_buf);
 	if (ret)
 		return ret;
 
-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
