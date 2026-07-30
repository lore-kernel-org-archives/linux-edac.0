Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E322A3D413C;
	Thu, 30 Jul 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402270; cv=none; b=de870N+fWo9Efw040/Iia/e5tZSGgeCTzrP4p9Kolig5dXIV67ZUr7JytBlPlD1ZzApAfsktzw+iRXdxiVRoF6W9W6cptS8ExEcwIarRQr0MTqDFxk0tyg8SxZTBiiYqcRPTwI3szaHAsC0gqAvxe/DS5inZ3TwHNd/sDHxAIZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402270; c=relaxed/simple;
	bh=tmyj+J1zlk09xjWRl9pD3OEsdh/E1ZcvKHzZgq8IfHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WptXR+hulLK/pcBw5hl4+/QWjFpk/xu18N/XSlMIGiIfbzIVyr4QYpxhW8a4AxPFM6hopFbeIpY4L5TawaM6Rw0xyvZyxh1Hjbae5vMHwnaThm+YWXP/+ssooD2VqVZAhTf69PV1WUokYyoXmqzvhUE8huRk3wTqVpwqOI/06aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDAlAlRa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDAlAlRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D94E1F000E9;
	Thu, 30 Jul 2026 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402269;
	bh=X4QCNkLzo7Pqj10SLhfkm521j47s1uOVy7OW3tEaHA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XDAlAlRaWbkGGSLYiolNhrOl9iBK74Fh+KkedGqapKV2gjnLZi7YU+Yf8gphcHqkg
	 x1AB81Yz/NgIey8AakSaueu8ccmS7+xzhj/hFXH0328lc+AO1cv7Ms0t9V+gyhNtpj
	 CJzzmufrk4PK1WmEhcSkfVv+bUTUbLyHx7+3y27a/8ptGZiDVf/8TBsPpiC2H/KPhY
	 L2QzTxQQsYMOeogfInWztqaADJn7bdEJdLNJoYaATaavfVNACm0H/ya4Q7HQQn+Thk
	 K0Vy2z1cRTcGfYpIowtACSxQlf0vvE4OMlmwtpcfHIG2PF0Y+lecyJcKxMitEhRbu+
	 WNSlDvTB6Nwbw==
Date: Thu, 30 Jul 2026 11:04:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	dinguyen@kernel.org, krzk+dt@kernel.org, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org, niravkumar.l.rabara@altera.com, robh@kernel.org, 
	tony.luck@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: altera-sdram: Add Agilex5 ECC manager
 compatible
Message-ID: <20260730-gopher-of-unnatural-leadership-968ec0@quoll>
References: <20260724-sensible-flamingo-of-experiment-5a389f@quoll>
 <20260729204308.21562-1-rounakdas2025@gmail.com>
 <d580900f-d880-4ede-ab74-a83fc0c71be9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d580900f-d880-4ede-ab74-a83fc0c71be9@kernel.org>

On Thu, Jul 30, 2026 at 07:56:32AM +0200, Krzysztof Kozlowski wrote:
> On 29/07/2026 22:43, Rounak Das wrote:
> > Add the altr,socfpga-agilex5-ecc-manager compatible as an enum next to
> > the Stratix10 entry, since both share the Arria10 fallback.
> > 
> > Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> > ---
> >  .../devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> Dinh just sent it, didn't he?
> 

And why is this even linked as in-reply-to the other header?

How any tools can parse it properly? Try yourself with `b4 diff`.

Best regards,
Krzysztof

