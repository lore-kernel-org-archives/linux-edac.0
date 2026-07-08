Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23823E4C88;
	Wed,  8 Jul 2026 20:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543689; cv=none; b=YGYsCey77UCw0fTxoXYVis29HCmtHSTOAvo1MsFJB2MOm4eAsXHUrD+qr4j0atDVjCePVluWpMwYLmAevhbxE+3TrgSkWhNVvFrKUB9mBu5Kv4YdXkscfd0+STLTbqZzmEYbmytPfhKcARCAptutIPeSqAogoPRRSMS+77N7aJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543689; c=relaxed/simple;
	bh=kuV6UBtRfwwjMgoNX+Lcr82Wecd5Gmq2PlIL28RRGJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQK013DJil3p6WzEYScpblA+cYEj4sKo3euSCuwtdNmU8IEHxTiCEUpYEjaPL33jEIF4i2Ng6Q+dFtooDf7HxZNDAA5kT8BDRQfZrXOSII5saL5ujyOV7eqYc1tsni2nrtrUlVmHzwn+kLJuGxUZJItPqUnCHrvq093jwC79VWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9pEzivp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9pEzivp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7BF1F000E9;
	Wed,  8 Jul 2026 20:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783543688;
	bh=2gdSjSw65z92G6xTxPtYhBQtHnAxR2GK+zKKmTbLRcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=D9pEzivpX6tBrFhUes7YYql4TDDymkVpitzvHgjiziq/W7qnL+RBMlN71yJcnc+hV
	 UNQNd78Y54WviCwCv75PLwRB4Hn4pCgVLuOlaTXITc3gpCmjWZVpiyxtSCy7Q7H1gL
	 Gom9w3UDVcRluDGDfUJwFqnTyHs32qWsi1m4f2FPMg/VRaARSbAcQsc11BfKGxR5LN
	 xtgik7EgdfvNccLNo61GYHJab4jQ6hmg2YxpYW+gYvBBNdWUSidzqQ+k+6HW2h89Iu
	 rq6wChu0OjKdCbqfHeICZBovUyFdrgAuoQgGXzCmnozd+UP7waukXvf1DzHA6PDUVB
	 xxoHfP5SITslw==
Message-ID: <ea33196e-6d3d-41d4-9e2d-a2d96e7c7923@kernel.org>
Date: Wed, 8 Jul 2026 15:48:06 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260708091135.94114-2-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260708091135.94114-2-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/8/26 04:11, Rounak Das wrote:
> The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
> between Arria10 and Stratix10 paths.
> 
> Detect the SoC once at probe via the device match table (.data)
> store it in struct altr_arria10_edac, and use it instead of CONFIG_64BIT.
> 
> This keeps the decision correct for every ECC child device
> (OCRAM, SD/MMC, etc.) and avoids any runtime compatible lookup.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
>   drivers/edac/altera_edac.c | 107 +++++++++++++++++++------------------
>   drivers/edac/altera_edac.h |   1 +
>   2 files changed, 55 insertions(+), 53 deletions(-)
> 

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

