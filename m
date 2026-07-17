Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7344342C98;
	Fri, 17 Jul 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288935; cv=none; b=qa6sOywv3vzybCVGyV/M92+/epK0a5jsolp7GF1mrqvXKi42MFg4FB+P/epDhCP7a4ag+e43xvXisk0nflHNCPVOO4XLgNgiAXfFaKpMyv0h8Ce4Q2OYmSGQ32BKaOo+iDQ0wozi76ErPQCZfLDmA4jOSF8GuCWGny9IwhJXjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288935; c=relaxed/simple;
	bh=hDXUYihvOLmOJTdE7pOoZGBzeLBETgdo0+wwNYNtUCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYYAVEKiiL/jUaV7zDyZ5baVq5GPENfAdlhvqamiIRNSJBv8J8bLA205yAsXkie6z7vdp+NeCe7Y64vYVjc+xY+rXq9LhgJtwe4WWOjJa0Rx+OdzC+ExxbKX4V2WGBVK1jz99NyTmSNOwBKN54VM2HAaQk/HzAX+38GCH+LuTSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di3FcY3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di3FcY3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DC91F000E9;
	Fri, 17 Jul 2026 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288934;
	bh=MNq5QKAJkYSdHsr18PjrJtLXKCNv4/Do0D2aLT4YoZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Di3FcY3JYwpoYpQ/5swbfPZambhYeM4P8tSa5NkkakZpdual8yHWLATIOAFpk1lKc
	 EnToPFCqYdToeSHKzTBQ1vEmclMxwOQR9BJxERD/wzo94nenfxDHAYX7chXyqvEPBo
	 J3DA1nmeewQU2vHoBYpbSHUolkYaZcAO87glPsTFgvQJFKU+IpCxXSnYp4LocYRg9v
	 9IwQ5sW+pHegQHyCFPLCNdGzVRDLKbcw88VMXTz3X8DW035XzFhtzbc43WtUMNig6Z
	 dNWR/Hz5mwffId/PIRHA7QLh0sCANRgNRDfZV+3TfoJ6QgBmvAE7tzu2yi4Qjo5beO
	 VzspkJl/tZlsA==
Message-ID: <182c3d64-17b7-4e18-9bbe-2fd97eb231a2@kernel.org>
Date: Fri, 17 Jul 2026 06:48:53 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/altera: Fix device node reference leaks in the SDMMC
 ECC setup
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com
References: <20260717102549.13309-1-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260717102549.13309-1-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/17/26 05:25, Rounak Das wrote:
> Under altr_portb_setup() and socfpga_init_sdmmc_ecc(),
> of_find_compatible_node() was being used to look up the sdmmc-ecc
> node. This node wasn't being dropped using of_node_put().
> 
> altr_portb_setup() did not drop its reference under its success path
> or on any error path.
> 
> socfpga_int_sdmmc_ecc() did an early return thereby skipping the
> common exit label and thus leaking the reference.
> 
> Add the missing of_node_put() calls in altr_portb_setup(), and route
> socfpga_init_sdmmc_ecc()'s success path through the common exit label.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
>   drivers/edac/altera_edac.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 

If this patch is fixing an issued, please add the Fixes tag and also a 
Cc: stable@vger.kernel.org. For reference you can look at
Documentation/process/stable-kernel-rules.rst . Also, if you are 
addressing a sashiko review, add a Closes tag as well. Please see [0] as 
an example.

Thanks,
Dinh

[0] https://lore.kernel.org/all/20260617164303.585555-1-dinguyen@kernel.org/
