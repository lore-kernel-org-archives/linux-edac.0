Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB37F4B8DE3;
	Tue, 12 May 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585125; cv=none; b=uYAjmwedrZCbzH3w7M6udBCThMkKLGmBxlWYqYbxPYktCnOdd9dV2yUneGpxJXZvZvSWNt66EE+y/xjvs8YW7ETlRWuQXY4R2TEuaNaUAobw7mSoU9mRsQ4LkiLXxDoeOp7kBfkLgwk29NX53KWjwYXNd0PvbV9POmsGxUsOVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585125; c=relaxed/simple;
	bh=No/1r9NXSOvgxBku9vx1UG+/LfWeGy8sRNaCqMvPgOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ouIfL740zEOCdGheebNheB2tnr/NahAMO5Fp+eZRV3s9MadkdVXKomR++SUqNz2gCRZZ4ZWUu1U/hjVuFud1UVHgKQZFOTvLLbsm8P0Ik5E6ZICxJ84wZjty1tHj2LsNmvmDICoYFN0GJMBC7jVdVqVCjktr3NcVG7rsaWl06fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmOy6kHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmOy6kHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2603C2BCB0;
	Tue, 12 May 2026 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778585124;
	bh=No/1r9NXSOvgxBku9vx1UG+/LfWeGy8sRNaCqMvPgOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmOy6kHzN5p1IPWyFzACokakRsYFASS4O46h02LnikTFHm0UdzpDfsasI8fn2JxOi
	 Cyg85QidHWc+4Cj1+R/o/iuSVUq9d5ggESsqOiUx27kh0cUJw20zT/pIC9MNRhdIur
	 ozwJlCIHb5ZA3SixWmdh21PtoirTQ/n1TN45z6C3X0BwTBaJYTRPz8NA5Yt8lDZ5z4
	 LxcjszL5K5g/e431tsdrZeORmm4PpZN+jg9I22idu/n+0/Lb7ZyGM3+1rMqV0658MT
	 JnSxoxPC+58RZ5NPJ0kKPm7LkXcCJmBOWELeDNChkaEOBnTIQgzyCfc/Ok8cMozvBs
	 gk5KFrm1d+yDg==
Message-ID: <de0f32eb-2216-47a8-80d4-bd66fcb253a9@kernel.org>
Date: Tue, 12 May 2026 06:25:22 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Content-Language: en-US
To: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>, "bp@alien8.de"
 <bp@alien8.de>, "tony.luck@intel.com" <tony.luck@intel.com>
Cc: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
 <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/11/26 20:37, Nazle Asmade, Muhammad Nazim Amirul wrote:
> On 11/5/2026 7:54 pm, Dinh Nguyen wrote:
>>
>>
>> On 5/8/26 02:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>>
>>> Guard the irq2 retrieval with an of_machine_is_compatible() check so
>>> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
>>>
>>> Signed-off-by: Nazim Amirul
>>> <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
>>> ---
>>>    drivers/edac/altera_edac.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
>>> index 4edd2088c2db..b30302198cd4 100644
>>> --- a/drivers/edac/altera_edac.c
>>> +++ b/drivers/edac/altera_edac.c
>>> @@ -348,7 +348,8 @@ static int altr_sdram_probe(struct platform_device
>>> *pdev)
>>>        }
>>>        /* Arria10 has a 2nd IRQ */
>>> -    irq2 = platform_get_irq(pdev, 1);
>>> +    if (of_machine_is_compatible("altr,socfpga-arria10"))
>>> +        irq2 = platform_get_irq(pdev, 1);
>>>        layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>>>        layers[0].size = 1;
>>
>> Why? We already switch on arria10 later in the same function.
>>
>> Sorry, but NAK.
>>
>> Dinh
> This driver were used by cyclone5 and arria10. Cyclone5 only has one
> interrupt whereby arria10 has 2 interrupt. That is the reason why the
> interrupt was guard by (of_machine_is_compatible("altr,socfpga-arria10"))
> 

Yes, but look at line 397,

       	/* Only the Arria10 has separate IRQs */
         if (of_machine_is_compatible("altr,socfpga-arria10")) {
                 /* Arria10 specific initialization */

Dinh


