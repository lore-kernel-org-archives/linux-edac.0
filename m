Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28FE3D9686;
	Thu, 14 May 2026 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779386; cv=none; b=Q/0ZJr6FbJJW1IOvXqhKPWnKYsT0tAbaZLhFrvenKQRti9beOKPRCStzMJ2aSHYpwovsnViaae+7CSlZTpU+ZHQaGX4vjEbpoD3H7U1f5KJFKdFjNqVqduTRwsaY/4kIFblIBu0dR7iWAMN1Oei+v8qAeZBlcBkP10B9pwGzhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779386; c=relaxed/simple;
	bh=75o1J/gLh/jzUQl+m1veukeAxZoSfbygPJG88JMzKaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E/kT0/15cSPTH6qzBksF7qxUTrKQO7eOxHAJ5k+4Af/dB87rvgIUmdKL05TomNWY2oLERc/9SAi6NjOHpaef6IFYuN8Nw3cttLzOE0BiJh1vAkPnEgipYyujx5Pwe9AyPkIBKaH2ycgjO1rOYvERaAeguIstG+I4D80agdxqmLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz+Ul3/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz+Ul3/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D40C2BCB3;
	Thu, 14 May 2026 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778779385;
	bh=75o1J/gLh/jzUQl+m1veukeAxZoSfbygPJG88JMzKaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uz+Ul3/UNvRfRBYSR7u4pC0743oobLLxlhfuEeDez4Eqc4KDll8GPbyYrjEQlzPYi
	 VxIz4Q3l7ypCnpdqaVo9FdJuJkZ0tz7t/cEzJYWwOrKVou7fl2MmuaMGYB5XaR4SjE
	 0f+dh9w6xf/3dIsLjfqeLW/d8dDe6DeHU6H62p3lF04jf3kEKmb3aafHjMa/UVkq+d
	 n6VZglUUQ+hTvdN8GXGboijXOp0RAkTLMwt43R2NZ05JmqW+t0SmkITac8COCGprOc
	 R5lyHFfgM/qADJtZH+WtvlKTgDRndN8y3EVKQLPRNVXbc7LB/DIhz1r5naj0vEms70
	 dLTWqeWOM3fCA==
Message-ID: <055c980a-0282-422d-b224-4d65482c2155@kernel.org>
Date: Thu, 14 May 2026 12:23:03 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Content-Language: en-US
To: muhammad.nazim.amirul.nazle.asmade@altera.com, bp@alien8.de,
 tony.luck@intel.com
Cc: linux-edac@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/26 22:40, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Guard the irq2 retrieval with an of_machine_is_compatible() check so
> that platform_get_irq(pdev, 1) is only called on Arria10 platforms.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
> v2: Move irq2 = platform_get_irq(pdev, 1) inside the existing
>      of_machine_is_compatible("altr,socfpga-arria10") block instead of
>      adding a separate duplicate guard around it.
> ---


Please get into the habit of looking at previous commmits and their 
formatting.

This commit header should be:

EDAC/altera: Guard SDRAM irq2 retrieval for Arria10 only

Dinh

