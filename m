Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1620A3D6CB0;
	Wed, 24 Jun 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312923; cv=none; b=BU50gT+0cARsRBW6HiR87SSKsLizkma+sR+L/Dy3XKPxWKBtNtYwfxnzueRvnzCDQ+QOXY9ulXcOmmav+P3Xm+lbHjXrP8CaVgUub5z18BESZoD9ELwDdjnJJSaCAMLn4NPwEHoavNKUsO5LlT5StFKtg5zV4OLa9YTANwich2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312923; c=relaxed/simple;
	bh=1AYXg2cDTIMgsn5TSbGdMh1j48fKA0TBb74YazBRrRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jb8TJKRzrcNSC5nQD7qxxcT1uGc08gVO+zkLdEQsaLi4bLDX0NGUXW3ipaDCvUhbZCf1bc3idhwZRzEqwp/oM/Du2w3BzKlkW1qKWMLoT/NQ29qkZe2MggwcRpkIVk+Uat3yUMVYzWDOFWRWB387o/eif9udbBfdE+H3hDlQyDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZ9YuPUy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZ9YuPUy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 677CA1F00A3A;
	Wed, 24 Jun 2026 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782312921;
	bh=pnBhzyXr/BhjflKzGQwB2VOOXPapOc+5g94oBK5goD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gZ9YuPUymJ8FD63eV86xPZ3Dz0uBUUz7jKm9tsecC4ukxC6tewgVd37ByuoYcaCvt
	 NqaCorHRygx09Q+HezsHsOrpvC7DDLFtvy6DGEg501psOeOolFO3FlGR4OECwBaWo4
	 TFpUZ6ZSwGVZpF3F6L6drBi/l2IH5dR5lIs1iteJS2c+l82n5lYbdzFLdElUO25II9
	 +YhlAhMJaUT85OGxR1u8KRCpJA35kmdFkPCsCbuvkUhwlxTGMj4325tNYUOcCdR4JU
	 pbNZifftfg47HEPCmPCsiG1zuphn4+2Zp5lBgZe+rqsRxlGjRG0vlGygmfGMXKAI02
	 trAZc9qCdrv1A==
Message-ID: <706ccef9-4f8c-4d03-973d-8e63e76917f8@kernel.org>
Date: Wed, 24 Jun 2026 09:55:20 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EDAC/altera: use SDMMC compatibles to select A10/S10
 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260615191508.46335-1-rounakdas2025@gmail.com>
 <20260616081709.48774-1-rounakdas2025@gmail.com>
 <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <3131206B-1E30-4EED-A327-D6FD39E6C4E8@gmail.com>
 <CAPYTKoNq4894bH5r3bAXLNDogWw52sFg-GCP4H7EDY+L871XHQ@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAPYTKoNq4894bH5r3bAXLNDogWw52sFg-GCP4H7EDY+L871XHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/16/26 18:58, Rounak Das wrote:
> Thank you for the review.
> 
> I originally used the altr,socfpga-s10-sdmmc-ecc compatible because in
> altr_portb_setup() np is the SD/MMC ECC node (found via
> of_find_compatible_node(…, “altr,socfpga-sdmmc-ecc”)) so reusing that
> felt natural there. I later realised that shifting to
> altr,socfpga-s10-ecc-manager is better especially in scenarios where
> np could be any child node.
> 
> In v3, the compatible is read on the manager node. To avoid repeated
> calls (as you have mentioned), I have decided to store it as a `bool
> is_s10` in `struct altr_arria10_edac`

Doh...sorry about that. Will retest version 3.

Dinh

