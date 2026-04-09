Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8722C40DFBD;
	Thu,  9 Apr 2026 09:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727969; cv=none; b=Fhy9H6jhJJzyNV0sx74hiUFO1Ma2puGqXsDday9TQ0N1U5wxplP7r7x6ymi4N32wxdmeXia8OSskUZCOJdUz+U9kgLTtuMuTWrMWSK5wwFSEO2kgDXaRrd4V0vmJsvNAtAo3sS+/jyYLwNNHFcgyoU/20GLe/PdU1ekckULQI3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727969; c=relaxed/simple;
	bh=qVoFngDbhhvGjCIE66fqeS0GBIwI7mR9ilCyZ5eevXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sGujojnSUYtFcH+IytA+2L4tPK3/ylcoF20YlRZfA5f39ZhtMY5EhGjPvnwZmzpjTT4BLhycLXdU5ZkP6NWLQgiO9P9MzYWODhg3ZCK+g+78SdVi/pVic+OOA3jRwWS1t3sUcJgwcECVDr64kT4nz+5AeThGMog8dPZA43uzt2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=e7i8+uVi; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="e7i8+uVi"
Received: from [10.94.177.52] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 45D6920B710C;
	Thu,  9 Apr 2026 02:46:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 45D6920B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775727968;
	bh=G2lle84WD8JmEul9OOJUE6UwN5ypB+rICggGOBHmmUM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=e7i8+uVirdCW8cMYkwNt0fF0uK2pCQ2AOMNF5rTDN5HutBgAkmxeSXRjdj4DIiIdp
	 o1N4MatdqzuZaIX7oinp5i2UDLVUGaAW5oJjYFXYagqZTLQu2hlJCarXX1hg/p4rMd
	 MSxUjnmX00wmej2RyfPCcj3r4zLtA+NC2XXvp/iE=
Message-ID: <425dd033-51dd-418f-8ae3-216a9c785c8b@linux.microsoft.com>
Date: Thu, 9 Apr 2026 15:16:06 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] EDAC/versalnet: Fix device_register() error
 handling in init_one_mc()
To: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com, bp@alien8.de,
 tony.luck@intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
 <20260401111903.2343006-1-ptsm@linux.microsoft.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260401111903.2343006-1-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01-04-2026 16:49, Prasanna Kumar T S M wrote:
> When device_register() fails, it must be followed by put_device()
> rather than kfree(), because device_register() calls
> device_initialize() which sets up the device refcount. The matching
> release function versal_edac_release() handles the actual kfree().
> 
> To simplify error handling and avoid complex unwinding, split
> device_register() into device_initialize() and device_add().
> Initialize the device early so put_device() can be used in all
> error paths.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
> ---
>   drivers/edac/versalnet_edac.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 012c4f40994d..94580d3c3170 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -780,7 +780,7 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	struct device *dev;
>   	enum dev_type dt;
>   	char name[MC_NAME_LEN];
> -	int rc;
> +	int rc = -ENOMEM;
>   
>   	config = priv->adec[CONF + i * ADEC_NUM];
>   	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
> @@ -812,23 +812,23 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	layers[1].size = num_chans;
>   	layers[1].is_virt_csrow = false;
>   
> -	rc = -ENOMEM;
>   	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
>   		return rc;
>   
> +	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> +
> +	dev->init_name = name;

Sashiko's review is valid
-------------------------
If edac_mc_alloc() fails below, we jump to err_dev_free, call 
put_device(dev),
and return from init_one_mc(). Since kobject cleanup can be deferred
asynchronously (such as when CONFIG_DEBUG_KOBJECT_RELEASE is enabled), and
name is a local stack array, could this result in a use-after-free if
dev_name(dev) is accessed during cleanup?
Would it be safer to use dev_set_name(dev, "versal-net-ddrmc5-edac-%d", i)
instead of assigning dev->init_name directly?
-------------------------

This is a valid issue, I will fix it in the next iteration.

> +	dev->release = versal_edac_release;
> +	device_initialize(dev);
> +
>   	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
>   	if (!mci) {
>   		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
>   		goto err_dev_free;
>   	}
>   
> -	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
> -
> -	dev->init_name = name;
> -	dev->release = versal_edac_release;
> -
> -	rc = device_register(dev);
> +	rc = device_add(dev);
>   	if (rc)
>   		goto err_mc_free;
>   
> @@ -849,11 +849,11 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>   	return 0;
>   
>   err_unreg:
> -	device_unregister(mci->pdev);
> +	device_del(dev);
>   err_mc_free:
>   	edac_mc_free(mci);
>   err_dev_free:
> -	kfree(dev);
> +	put_device(dev);
>   
>   	return rc;
>   }

