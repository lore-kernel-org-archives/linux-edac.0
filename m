Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771203E715A;
	Wed, 27 May 2026 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890188; cv=none; b=nYZQA3QaBiT0BXFNap0mfUsktXxmFHFy2pdUkuJb1yU8o8FeiXrAVaeyWPzM7OM1llGjdKnLAxJ1grOPATaJ4fphL2b1epA/kUcHmxdH64oqjszFEBfMZXVRRYbndjDUXKTgH/0Tb5AXxTsnQDXboFzNlhqmbk4+IgKsgpsJbvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890188; c=relaxed/simple;
	bh=+03sELYnwN8CaaQLmHLm3e6AvpF9IiFEHhg3mAOhHQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJQjcOEjTLnrBeibYSw/wEPu77V0iwQyD6KWmqMD9aBJ/tatUtHtq/oYYFj+RKSNN0ULVi0UuBCCBJ1ditSyAmg6EAUBzzDgiBHvnuYFg/pYXDO2NTPk1eb9ghWL6mWPu3Qp3Qo9PiUAzFTEaPe7M6mqtdftrRXgfeCMb5k/jXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zKyX2pVT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zKyX2pVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F33B1F000E9;
	Wed, 27 May 2026 13:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779890185;
	bh=GTt2YzPSrArfwNQRIjn8fGQbGcQLSGK5oegPVS5xB0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zKyX2pVTpogd+85p2vPYZgg8fpYJvHvvd8jpVq2h5Za13z/gE0WYyKh/lDwY8bb/C
	 /PD9BIo9oIdE3gDN4BPfP6x9TQfOo4Hp8n6Dqa7HVB6c8pZe3/ioR79zayQRn99Wex
	 UDU4vAxsXPIxt6y+c/7lQahkgDoh9bm1niccaSKU=
Date: Wed, 27 May 2026 09:56:24 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Mark Gross <markgross@kernel.org>, 
	Prabhjot Khurana <prabhjot.khurana@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Tony Luck <tony.luck@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v2] MAINTAINERS: Update Mark Gross's email contact
Message-ID: <20260527-worthy-orchid-fulmar-4241fe@meerkat>
References: <20260526-arrogant-lime-ibis-3cf01c@meerkat>
 <20260526193238.3622176-2-ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526193238.3622176-2-ukleinek@kernel.org>

On Tue, May 26, 2026 at 09:32:38PM +0200, Uwe Kleine-König wrote:
> Mark's intel address doesn't exist any more, update the maintainer entry
> that is still using it to his kernel.org address that is already used in
> other entries.
> 
> Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4087b67bbc69..021a45e7cc1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13206,7 +13206,7 @@ F:	drivers/crypto/intel/keembay/ocs-aes.h
>  
>  INTEL KEEM BAY OCS ECC CRYPTO DRIVER
>  M:	Prabhjot Khurana <prabhjot.khurana@intel.com>
> -M:	Mark Gross <mgross@linux.intel.com>
> +M:	Mark Gross <markgross@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/crypto/intel,keembay-ocs-ecc.yaml
>  F:	drivers/crypto/intel/keembay/Kconfig

Acked-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Thanks!

-K
