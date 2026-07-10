Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544FB312807;
	Fri, 10 Jul 2026 13:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690386; cv=none; b=snnXCDpgtTu60wY030bGN/38A+M9hFWggb9234wCzNu2iP9vSBYIul6PuydXebd9jzwIxwBE58R1lRk7KEAkJm6EMPb//qf/mE8gpFtdtVB7wH3S0h17pXyjFy8eKi6YGJOYtoEcqEOLDRc3+NYdBk6/rrUxo87LJdEaHl4ESYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690386; c=relaxed/simple;
	bh=jGnpT7cIgu5IVb5NtA28uFdvHMswUOS7ppj8ZojU23Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLJ01GO70Z+L3jZvgK1Z5BBgatUz1jeU0RuP4mJh/ugijD+JRHw3ShiK6ipahgs7xvJ++np87/Fe/N/zt0ypxK/Uxc2PSRN1zio9ZT1QmYy5KKQ6yzsk8Q9oaocnQovygP4PVcIoXQcwzk7XF8ohEB8LcBRAwKzXZ8XIq6HY9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBeR+h46; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBeR+h46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB281F000E9;
	Fri, 10 Jul 2026 13:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783690384;
	bh=ZvRW8He9Zsyy1p0vA/8m37+TwcRHiHahbcc6zP6A5cg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IBeR+h464dJnYTK6cES8x3EOQ7K6TEBQxAOwTGFmZVHd54MWwui/8Nv6btH9/SKRu
	 kgpb+EKzBIIj9zuRoaWMZRvldPDkyj0H4O13IxAdlamJuSY+nTpyFLy/xlcaiP0Twv
	 mFMr+vAULPYN8gKRlAm1WCiNlZYDhwpLRakRE03M/0nXAp+R2qLbN2nOUbS1WK4xb/
	 ezbUKyLmVHmEBbxCgJEio5bkuCUXJkPU0DyIzTgxisMYzY+278BvwZdWa5785G+ujj
	 IHDnEVZf3LAiBO5ZQcyXBR+WUtY6csvUs4XO0sdnDpYUbobmSfqENwldIAukdBjtvO
	 g/MJxYKb7kUow==
Message-ID: <970708b7-555d-4fc1-a424-57f794b957e9@kernel.org>
Date: Fri, 10 Jul 2026 08:33:03 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] EDAC/altera: select A10/S10 behaviour by ECC
 manager compatible
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Rounak Das <rounakdas2025@gmail.com>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com>
 <20260710030717.GHalBh5aBQdoub2_pB@fat_crate.local>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260710030717.GHalBh5aBQdoub2_pB@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/9/26 22:07, Borislav Petkov wrote:
> On Wed, Jul 08, 2026 at 01:11:33PM +0400, Rounak Das wrote:
>> Replace the CONFIG_64BIT-based A10/S10 selection in the Altera EDAC
>> driver with the ECC manager compatible. Patch 1 handles the IRQ-layout
>> selection; patch 2 removes the remaining ifdefs in the double-bit-error
>> path.
> 
> Sashiko points out a bunch of (pre-existing) issues:
> 
> https://sashiko.dev/#/patchset/20260708091135.94114-1-rounakdas2025%40gmail.com
> 
> Folks, pls address those first before piling new features ontop.
> 

I think this is a good cleanup patch and is not a new feature. I was 
planning start addressing these sashiko reviews after this patch.

Thanks,
Dinh

