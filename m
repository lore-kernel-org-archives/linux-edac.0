Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E9377ECA;
	Fri,  1 May 2026 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777674372; cv=none; b=rbERlo6/55CI38DB3fVhVaABLYD39J3fBZXlktUiStylLeytvsB7vOpyXnclLyHGrqhOwuJmZvL7SOFJxr6+BVvEScx1c3LRR3V3D7w3KZdrEJMYkjoiGZPNACpPlHs06OGc0jjbuy7UuRA8WIQHwtgSYSRXcuom1fCfHNxJ454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777674372; c=relaxed/simple;
	bh=Uzug2T49DQl0qdeViq0SQToclaOdzEXorXOgYHZSQO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f95bfKpZ+RpG5Uq55NsxQZuka7pAQfFKUWfpTVRpKH5cmnwxxUoO5s1EioA3EiDdsHiarOATXqiftm/1Prycm3ZHDpD5gUYtlB61S6PTRQY9/jp4i66vYcbEKQ4WJefxaIqUm5sPq+7lzlmOFYfILrTOBJW4vxExqSDxhuhv7gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFeNvZZh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFeNvZZh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D7CC2BCB4;
	Fri,  1 May 2026 22:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777674372;
	bh=Uzug2T49DQl0qdeViq0SQToclaOdzEXorXOgYHZSQO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DFeNvZZhzFQjBEWLOu+JxHn5mw0IGsFrCiptTA65mDJClxV6B66x8cL7peCvwuF20
	 GdMmQJ5PjavHr4BMiyhYQTtXxKT86PpdOtJA3Vxw7PKziwwadP/xidVfwQuJl9O+TX
	 orzFVw34mh2HBrVOVwzyNodbw5asSZJPOKe6jlyoTqBxnn7ZOh+bWkxvaFwDpYnQor
	 eP2jdFv9W6UEl9KSy9mQFnyt5qD+IRnCjV9NvfvrB/2d46kwsiXKuykcXgWl1v67cd
	 upNKkbHImR9HYGgCyTA3xdGkiXAVVKYmUF5Rfnw+n+mxC8cYc6HErgrAvTDdFEnenY
	 vCWvO2Xi4NXjQ==
Message-ID: <4ea824df-3ef2-4756-ae87-02c31f20c191@kernel.org>
Date: Fri, 1 May 2026 17:26:09 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] EDAC/altera: Fix SDMMC PortB OF node reference leak
Content-Language: en-US
To: Yuho Choi <dbgh9129@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501194838.2682274-1-dbgh9129@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260501194838.2682274-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yuho,

On 5/1/26 14:48, Yuho Choi wrote:
> of_find_compatible_node() returns a device node with its refcount
> incremented. altr_portb_setup() looks up the SDMMC ECC node but does
> not drop that reference on error paths or after successful setup.
> 
> Route the exits after the lookup through a cleanup path that calls
> of_node_put() before returning.
> 
> Fixes: 911049845d70 ("EDAC, altera: Add Arria10 SD-MMC EDAC support")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>   drivers/edac/altera_edac.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index 4edd2088c2db..a2fb30a9b914 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1526,15 +1526,18 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>   		edac_printk(KERN_ERR, EDAC_DEVICE,
>   			    "%s: Unable to allocate PortB EDAC device\n",
>   			    ecc_name);
> -		return -ENOMEM;
> +		rc = -ENOMEM;
> +		goto out_put_node;
>   	}
>   
>   	/* Initialize the PortB EDAC device structure from PortA structure */
>   	altdev = dci->pvt_info;
>   	*altdev = *device;
>   
> -	if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL))
> -		return -ENOMEM;
> +	if (!devres_open_group(&altdev->ddev, altr_portb_setup, GFP_KERNEL)) {
> +		rc = -ENOMEM;
> +		goto out_put_node;

I think this should goto err_release_group_1, otherwise the dci pointer 
is leaked.

Dinh


