Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F053B38AD;
	Wed,  8 Jul 2026 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783475964; cv=none; b=nHLSqkjcrFIy07oZwhitGRE+wLn3hEDwT3JBiLelFsYqooP16K6xrarloSBoFIDy8xc3tDxRAADCrAjG0KEcEfVTJyJtDNZz7yj/Cdmt7v+GPNcpaqKNPS3AJep6qhbKn1Ioy7F2SfB5hC6GblrtMCRs55aCgOgmLl5GNhjJZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783475964; c=relaxed/simple;
	bh=e/5l9lYkFP7e5XwgS1/IYEw+n5j0Z1+uZ1f9lV8Oqs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhDa8EiidBllp84XEfxFGZp0XvHttMRew5+gQnj8WfDZ5HRWIR/by669Vh2AuJ0GR8gWAEMHEPb0QNcWNiBN1WA7oHuNZGN9phqP8DgF1kE0DIu/VVYwDMBwEg/TxEni78LZMElKwjMdtBTTDVx5xnO+pnv69bun+va8zZzBuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bflazNpw; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bflazNpw"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2C5BF40E016E;
	Wed,  8 Jul 2026 01:59:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fXp2WTqpu2Ix; Wed,  8 Jul 2026 01:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783475945; bh=c4frSB45vie1MbPzUrgNsK81EQN0X87dikCeYV8wmNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bflazNpwIQyF8u0hKFXEABORx+f60TO77AF9Qj3/MQ/hJklE1RlrZenvHbFsdALpD
	 BLwrW2gljk7q4oLuf8opLlMP4/1gwzr32JD+5P07vxZZ1YZI0oqymZGioudae06jeP
	 STfXy6EUnGttbo2oz2YaOxY/mtZYiD5DBfD8U09/3OIeQMgcMgtT5PKOeLKUHpok1b
	 OmmChjDl4fHTTcDnaNgBwrPVpbdzM2/GhgVVfayTwoK6Ap/yC81q9qVRMnaUC/8ecf
	 V8g6lMM5AsUOi/IYs3hsjzztr799DH1iGcWEsgzkFRf9jQH2iMIVe43eYNkABXIpZA
	 idvlRDuZQlZftxmJ8boa8Mh+MPSPIWAJQVkT5AsVBL4VTZqoegB9YO5mlEGu4jVVbe
	 Kd4Adu8EjjJttJJd8yShEdkyN4wLLwGyum6HjxKix4UbV8EM4UBCykdfTEZda/pmtB
	 B74jR0Xo/PvRIjXuvbwpT56QF8+5BuYYOBDhHAgl4aZHOwb/JGRfPCjDeWn41SJKfd
	 Vj1Oj7h+lt2wWd4Edurkr91EUXPgZrHUlMCr3sr0pWstt9QcLtyJLB0/jbEWyuxo4c
	 BddCDxCLfPyQVNSCri9uTN7xvjT/9ds3TRVCDyOGH+T2Ty+1D222Zc/nYsBysW7t52
	 DX9QhO0xPLEZo+DuiPbNwk7k=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B3ED940E0163;
	Wed,  8 Jul 2026 01:59:00 +0000 (UTC)
Date: Tue, 7 Jul 2026 18:58:57 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v7 2/3] RAS/AMD/ATL: Translate UMC normalized address to
 DRAM address using PRM
Message-ID: <20260708015857.GHak2u4QYZh1fWdHeG@fat_crate.local>
References: <20260630210640.680758-1-yazen.ghannam@amd.com>
 <20260630210640.680758-3-yazen.ghannam@amd.com>
 <20260707003204.GAakxJBJWtxD2fM6Th@fat_crate.local>
 <20260707135756.GA1382082@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707135756.GA1382082@yaz-khff2.amd.com>

On Tue, Jul 07, 2026 at 09:57:56AM -0400, Yazen Ghannam wrote:
> What do you mean? Print it or remove it?

Print it so that the error message is more informative than now.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
