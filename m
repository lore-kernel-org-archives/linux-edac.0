Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E983947B0;
	Thu, 14 May 2026 11:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758326; cv=none; b=sdR+5e2VUyS3OwD27K6lICaJknBXY/nf/qb2FkiQKe1CifcMtPzYfAFa44iXLeqg/d5x4RLdym4RXeaYevICijNDRaxOZRb/36jphRuXZiDA7pxCto9UvWTXug5M4tJDlJglaxDKD7LDMKC340EyLoZTjqNiUgkpnZCr3u/+SXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758326; c=relaxed/simple;
	bh=StKU09FNmy3vNk8IKmeJzdqYp4NpxQaGx7JIDbdocH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQtAAEwpyywNLxNqgnLBJqbeXgcL+DHMS8cfFh2NMXm4iNr15O/d2vv7UTyyXf5z3q16TpiD6GL50tKPsRbIvoIOVhy7p7l86ehNsk07fYouDj290R+2A6eQffFNOPPJ8GNZGdGTif2pkas0RHE4M0WlijYggNFHBnhD36kNNrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=V58rk+VN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="V58rk+VN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 13CC140E00BA;
	Thu, 14 May 2026 11:32:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u1sxMBIRjYst; Thu, 14 May 2026 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1778758312; bh=bDQZtfxWiYXWYGkUoz5Mtr7FFHPQhuYyIi4eYg6P2do=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V58rk+VN93nA4M6wo4Cfbfuu2QRykpuPKbGCEuzPvVEcjoNIxcQsK++lnAsYN+R8U
	 4tp9LAUFDAWo0rB2aBnOGNVww9T5IBI+TQxfVKhagDUd+YXLKNCEv+BhwiLpkIdBkQ
	 6XDc92VYGEJyJilApGS/F6jwJ0ai7cLS3Owb4bKpQ2SIUY86qyuWqCU6qWHIg60G3U
	 FvZgKHTj17geYvMmxDksZZ1QUIywsDsVvECmqKn49BbYuWpM9M+/7ZajDBBZ+exleE
	 x4V+hgBIm9AA4ixmqq/HH+gBBiXqDEZxcJp+VBql8aLlzZi0CGcX6h2P3quskQTSUi
	 fslnABNU/abx3DAWTY27RiKa8AElP14tV1lXs20/HwPxM3MXJugdqy4DQ3ljEYTw5g
	 O/fJN4p0EKTkih+X2UQb9+Khr+k3GfYj7p9gxibGMQ4PfflqSQRRPUSeCxY38V0pYQ
	 XZeBIkI8tpvvz8HznrP+EJni+EYhCuuuqTtO2JvL9QQWgjNfSeEmwrXsWOhv0Yt+jK
	 Cxa/8CJRo+NUxj8YLy5KKsmG6QRFvZhULeZBRJHaxtahzT3XV087s46xL7wg8uH72n
	 VVEuPztPWrM9MFIL7zUSC7O5u5+WmokoreGlQHyVr2RgtOeL4htfWtIhIgUtBInDiU
	 cd14piVsf7ruVcn236Lg+ZtU=
Received: from zn.tnic (pd953014d.dip0.t-ipconnect.de [217.83.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6EE7A40E0031;
	Thu, 14 May 2026 11:31:48 +0000 (UTC)
Date: Thu, 14 May 2026 13:31:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v4 2/2] EDAC/amd64: Include DRAM address in output
Message-ID: <20260514113147.GCagWyowfypCcZ0fUo@fat_crate.local>
References: <20260316125324.396889-1-yazen.ghannam@amd.com>
 <20260316125324.396889-3-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316125324.396889-3-yazen.ghannam@amd.com>

On Mon, Mar 16, 2026 at 08:53:24AM -0400, Yazen Ghannam wrote:
> From: Avadhut Naik <avadhut.naik@amd.com>
> 
> The DRAM address of an error is used by tooling to find failure
> patterns. This information can be used for general analysis off system.
> And it can be used on system to take action like offline a page affected
> by a bad row.
> 
> Other EDAC modules (GHES and SKX) provide this information in their
> output. The AMD64 EDAC module was not able to provide this information,
> because system-specific translation is needed.
> 
> Recent AMD systems provide a PRM handler for DRAM address translation.
> 
> Use this PRM handler to get the DRAM address of an error. Include this
> in the EDAC "other_detail" field.
> 
> [Yazen: Reword commit message and reformat other_detail string]
> 
> Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
> Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  drivers/edac/amd64_edac.c | 27 ++++++++++++++++++++++++++-
>  drivers/edac/amd64_edac.h |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)

https://sashiko.dev/#/patchset/20260316125324.396889-1-yazen.ghannam%40amd.com

Please sanity check.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
