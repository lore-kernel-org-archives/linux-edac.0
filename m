Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA1B3BBA1E;
	Thu, 18 Jun 2026 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779031; cv=none; b=prD6wqNBvwZ2A7jMgPUBJAB+duOcPAT5652RYmgLDPFnEK8A/cP5vVl491U0Fj9IREPTtiDJLN9JYk4e7B6kQ/K0XnwPUe+GNNx3UKXOqbzlVyoOAD/pUMAByxipGq+CE4W5QEOleknT46I33uvn/aCpC8NY5OXJhHNKlsNVIaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779031; c=relaxed/simple;
	bh=omiokKQiDLzTuaCfI3bs36kG6hNa9L6bMjtL3igue0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrLstYSGzX2u9bVIDSYD1CHHvKXM9YF6Pt2dYLWU4WfqWTqP6vcR+tKgSM5YaRoZiabwh3u2LI1Z4AxzxoP3mgqvTAPV3iQntQh4Nko/+LCsILWFn1AmRu3t/iR4xxfRAC2gA/n2zMEq59Hy1gw9Iuw5D6PzPuxnUGl0KGqSRxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyuHXrlr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyuHXrlr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB3A1F000E9;
	Thu, 18 Jun 2026 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781779030;
	bh=dcbJSwWthf82PCpdpKfW/QIzw6jz3FMDKtGYKs2eJXw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jyuHXrlrdOX63CGe0kX5qigbw5Pfo+SMvOHtbQcq867PpJ4xcL5o9fBvk8s/eoCoO
	 tptKf2/FbQRfp5QOCw0SxQly11CvLPZpW9/2mlzuCccqRMAvN3hv3HNVeDOrVmZWP+
	 d1/ebFrvWfKRSHtFCYpTZV7Jczy+P3c7y5JVf6+dyFcLU5JOyJF7ox9urugOtU2f1Q
	 +GME3wBPTxYw1Ah0Wdw2Um8XGj5F4VL8JcSrd+zXXpid0qYXDSqlrM4Ai7mcD3canP
	 St9dqJGitE8PEKRdUiX7n76lTztyEfknwQLOlxgNP4S7T8DgNVCgVTyokEfj+rQ0uy
	 H7BmTk+vJlLAw==
Message-ID: <77d71af8-27b8-42ca-a6e9-f110a6289893@kernel.org>
Date: Thu, 18 Jun 2026 05:37:08 -0500
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] EDAC/altera: use ECC manager compatible to select
 A10/S10 IRQ layout
Content-Language: en-US
To: Rounak Das <rounakdas2025@gmail.com>
Cc: bp@alien8.de, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 tony.luck@intel.com
References: <470f54e9-9e92-40c1-9383-6be055170d69@kernel.org>
 <20260617000711.60804-1-rounakdas2025@gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260617000711.60804-1-rounakdas2025@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/16/26 09:07, Rounak Das wrote:
> The SDMMC ECC IRQ layout selection uses CONFIG_64BIT to distinguish
> between Arria10 and Stratix10 paths. This is architecture-based,
> while the interrupt layout is a hardware property described by DT
> compatible strings.
> 
> Detect the SoC once at probe via the altr,socfpga-s10-ecc-manager
> compatible on the ECC manager node, store it under the struct
> altr_arria10_edac, and use it in altr_portb_setup() and
> altr_edac_a10_device_add() in place of CONFIG_64BIT.
> 
> Selecting on the manager compatible keeps the decision SoC-wide and
> correct for every ECC child device (OCRAM, USB, EMAC, SD/MMC),
> and avoids repeated compatible lookups. Stratix10 and
> Agilex both declare altr,socfpga-s10-ecc-manager and Arria10 does not,
> so behaviour is unchanged on all three SoCs.
> 
> Signed-off-by: Rounak Das <rounakdas2025@gmail.com>
> ---
> v3:
>   - Use compatible string altr,socfpga-s10-ecc-manager instead of
>     sdmmc-ecc (Dinh).
>   - Set it once into struct altr_arria10_edac::is_s10 to
>     avoid repeated of_device_is_compatible() calls (Dinh).
>   - Fix the checkpatch open-parenthesis alignment.
> 
> v2: https://lore.kernel.org/linux-edac/20260616081709.48774-1-rounakdas2025@gmail.com/
>   - Use legal name in Signed-off-by (Borislav).
> 
>   drivers/edac/altera_edac.c | 106 +++++++++++++++++++------------------
>   drivers/edac/altera_edac.h |   1 +
>   2 files changed, 55 insertions(+), 52 deletions(-)
> 

Were you able to test this on any HW? I tested on an Arria10 and it 
looks good. Currently, I don't have access to a 64-bit platform. so I'd 
like to wait to get access to one and test.

Thanks,
Dinh
