Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A43009CB;
	Fri, 14 Aug 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786713718; cv=none; b=NQWHdgELjY9SVDCLw6hLs0f4nTGSlfM8qDp2kG2dxnFL5Xj8Kp3LmCb32Ky+AVrImPOkxxh72E6CiNwKfDnpaNWM31pxqqDOeY2O54ZhNtvnt5bw5RAIkJQmRuqSr5GXeF3/vVURs5JDo3YcZFql2vrkzGq8t+1nHqdqZvcyYCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786713718; c=relaxed/simple;
	bh=nLMEST9iAm45dUSnEnwrl5znii4ozWACDyNm4+/uyuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bs7S+hs7oxNG6jk/wUABMr/ZMkpUoDMKJOWV4AKfgkoaiVXfLh/xdFjSB7Sx9UWQJmrXb02LsHT8eN6G5VR0ma/0rsG6hPQB8ppfBPH6Sko8xwdIuHE9K77kCk3/40K3ncW8xWm0KOkCkX22WJWYfWt2IG2Rra9sDHbmZeURKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDaWmQzw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDaWmQzw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531EF1F00A3A;
	Fri, 14 Aug 2026 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786713716;
	bh=1CShWh7mEy5IlrdpXKhII8Rau7FTgNnUtXCgOzdlsPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LDaWmQzwsGhtzjnu8L30g5pdH1CCSQvH/GbWZi+96BlaMYIxEoowduqSDsLN/HnzI
	 P0uURR2sR1w5UkUcaFnnY6s6Ih/2nK1XVYkPrF55OJHLTkUmPSk33OjUihHm3Enp/o
	 jnkN3WNsTO9Qsopbf5eVaYlqxELiJ5PFfpO16+mN7JcbhhqGaEfgEzxmqtYaiTlAmU
	 RfvUr08l1y2RM06XG+2Yqd9dm3uqxjb9jNi/LAa48Prb4Ldn8FDcnunoZ1sfufRxru
	 Mr+iO0m14crAIM1Hq7eB9gzfzUpFj2kvp8rBiPRfnKESpMYo2cNNtpBr6HBy+EIQ8W
	 S+x5a0zmERQsg==
Message-ID: <ea68e8dc-3b5e-45eb-8822-d72b1c358c51@kernel.org>
Date: Fri, 14 Aug 2026 08:21:55 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 3/4] EDAC/altera: Fix code leak on dci allocation
 failure
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, tony.luck@intel.com, niravkumar.l.rabara@altera.com,
 linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260806155412.1518582-1-dinguyen@kernel.org>
 <20260806155412.1518582-4-dinguyen@kernel.org>
 <CAPYTKoPpccGRmu60qhzxUy7MAoH40z3B=ioUN4qCSFFmPakWmQ@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAPYTKoPpccGRmu60qhzxUy7MAoH40z3B=ioUN4qCSFFmPakWmQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rounak

On 8/6/26 13:16, Rounak Das wrote:
> Hi Dinh,
> 
>> -       if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL))
>> +       if (!devres_open_group(device->edac->dev, altr_portb_setup, GFP_KERNEL)) {
>> +               edac_device_free_ctl_info(dci);
>>                  return -ENOMEM;
>> +       }
> 
> This overlaps with my of_node_put fix that was acked on 2026-07-20
> (20260717131720.19038-1-rounakdas2025@gmail.com), which was held
> until the sashiko issues were addressed.
> 
> Patches 3/4 and 4/4 touch the same two hunks in altr_portb_setup(): the
> devres_open_group() failure path and the err_release_group_1 label. Both
> changes are needed in the first one, i.e.
> 
>      if (!devres_open_group(...)) {
>          edac_device_free_ctl_info(dci);
>          of_node_put(np);
>          return -ENOMEM;
>      }
> 
> so whichever goes in second will need a rebase. Happy to resend mine on
> top of this series if that ordering is easier.
> 
Can I ask you to rebase and resend it once this series lands?

Thanks,
Dinh
