Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC33DD871;
	Wed, 13 May 2026 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669151; cv=none; b=gI6I9y/hQovXHunbJNXLqXvNxnZ9zwrhV7ZqJWYkn2U7fHWI3jTus4NOEDWF6dvJ1/jim3ko+lKhN06xd/0RDNIIWxsQcqj+u/+6Ufyho3Qa3dUqi7n/MOHEdyZnybvhHnHlpXPLTFnaqcTPgNNBYH89ZbDjbXqoDYFQowTEAD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669151; c=relaxed/simple;
	bh=muuwARazTjEAvbXIOfzW/1TAyB+3XXA0p2SK256ykVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/h6I80yxwA4BLKK9TLl4c0BuoBAxZHdQbGAB4uDEjcp/v3YPLwfVdPD7aEOeBc+GmwRNy1PQqvd690qxV3COTh+r3y+WBcHysmqMRL1J+hyh0AffYFxcyeRQhxtQ6dB2tUv/MuTbF6M+39c1eOiZ2cL0EsaVCjdPX5qblxert8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvMpum+0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvMpum+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA74C2BCFA;
	Wed, 13 May 2026 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669151;
	bh=muuwARazTjEAvbXIOfzW/1TAyB+3XXA0p2SK256ykVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AvMpum+0pqdXm9vGudPLtAmsoqsFbzz3XrQU7cRtMb7mU9DP5Qs70kk0AUdyyxdtb
	 qDueFOICre4yQUeyMTywlSc0DEO7wUbtjUDMwDtFiFAX2WrJCHWb2rb66fr7lhj5DX
	 mYezn7FnP8jK3rB1dUlu8+ZOE8H55IjMgrtoZTm/wMiUmdkbLP+hV+ePbOt9aIKcGX
	 JqKbc66ny+KzcrVHmaxsGazj9jl3zcJBCQFk4IQ52v27paYFx40W27WPUMMevX1gMW
	 DDXHG1TU0D8EM524vv5a0Q1sTqpBJRlb6AnTH1vg2RtR6qvXFJm3dgX7qH8w3CYZLG
	 g5nJfhI4pDtaQ==
Message-ID: <b88eb1df-6841-43b8-990d-506c8c4f2d4f@kernel.org>
Date: Wed, 13 May 2026 05:45:48 -0500
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
 <de0f32eb-2216-47a8-80d4-bd66fcb253a9@kernel.org>
 <4f80ef77-a38b-4652-a1f1-1bea3e88de74@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <4f80ef77-a38b-4652-a1f1-1bea3e88de74@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/12/26 06:51, Nazle Asmade, Muhammad Nazim Amirul wrote:
> On 12/5/2026 7:25 pm, Dinh Nguyen wrote:
>>
>>
>> On 5/11/26 20:37, Nazle Asmade, Muhammad Nazim Amirul wrote:
>>> On 11/5/2026 7:54 pm, Dinh Nguyen wrote:
>>>>
>>>>
>>>> On 5/8/26 02:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>>>>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>>>>
>>>>> Guard the irq2 retrieval with an of_machine_is_compatible() check so
>>>>> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
>>>>>
>>>>> Signed-off-by: Nazim Amirul
>>>>> <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>>>> Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
>>>>> ---
>>>>>     drivers/edac/altera_edac.c | 3 ++-
>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
>>>>> index 4edd2088c2db..b30302198cd4 100644
>>>>> --- a/drivers/edac/altera_edac.c
>>>>> +++ b/drivers/edac/altera_edac.c
>>>>> @@ -348,7 +348,8 @@ static int altr_sdram_probe(struct platform_device
>>>>> *pdev)
>>>>>         }
>>>>>         /* Arria10 has a 2nd IRQ */
>>>>> -    irq2 = platform_get_irq(pdev, 1);
>>>>> +    if (of_machine_is_compatible("altr,socfpga-arria10"))
>>>>> +        irq2 = platform_get_irq(pdev, 1);
>>>>>         layers[0].type = EDAC_MC_LAYER_CHIP_SELECT;
>>>>>         layers[0].size = 1;
>>>>
>>>> Why? We already switch on arria10 later in the same function.
>>>>
>>>> Sorry, but NAK.
>>>>
>>>> Dinh
>>> This driver were used by cyclone5 and arria10. Cyclone5 only has one
>>> interrupt whereby arria10 has 2 interrupt. That is the reason why the
>>> interrupt was guard by (of_machine_is_compatible("altr,socfpga-arria10"))
>>>
>>
>> Yes, but look at line 397,
>>
>>             /* Only the Arria10 has separate IRQs */
>>           if (of_machine_is_compatible("altr,socfpga-arria10")) {
>>                   /* Arria10 specific initialization */
>>
>> Dinh
>>
>>
> Hi Dinh, That is true, but the one that we looking at now is at line 352
> which enabling the second interrupt and it is not required by cyclone5.
> Perhaps are you saying we should move the irq2 at line 352 under this
> line 397?

Yes, that would be fine.

Dinh

