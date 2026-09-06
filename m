Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13621360EE2;
	Sun,  6 Sep 2026 21:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788730150; cv=none; b=S2hM9wHKzxSu5r42jvdvBZkss8F1h/dMtMxgmJ0SJvxnhlq3ZnH+MaH4EL2ZrAtrm4vOa+XoCHHvoj7wFs3CDZvRCHYior0tUESHTEOmDkKpZkGqwrT8RdVF+fdnQzJb21wEiqQAwIuBw4FgxesZuPWnfqH7PZ901v4nAenNI7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788730150; c=relaxed/simple;
	bh=4WuRsLREm3BUSO22ALBArbGcA3Vct45BB60houZUCy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwxfXnRjoGKl5PMRQ8vZb5NTr3riO8PFqg+W3PAHGF3RO5J2d0SrzV5tog9N7PBTDcQZfolrDl+XQYywjLqB10qUI6UDxSd7xwj9THsPJPx7GZ9PevkG46McA5NzfE5pqGaJxSp8MMp0m66cyUfmn9+s+pO8tarBYan1jm/4sIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kY6q0wLC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kY6q0wLC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TTJHFyPvwl5UJ7jZTmA8Khseeu7k96KuKcI2kuUD6eU=; b=kY6q0wLCZ02eLRBW+NgzyXgUV4
	0y01zLN8IKhBUW7Z5PYNRSiU7FfvYMIMg8VmzPNuNFyfy0KyP4hw4900tDKso1KyITEqCDCqusFvi
	SoXDKE1EFksFD9NImsjIdGVWNmz4jyIqNIYZnIxwWWJlC4GzrTzGdEpbittgz6WOGZv7MfuT830Cn
	YchiTLrR2y9Lyba45eJ4s61JIXhgjTR2u+iHnIRJDa+3HIJhLQcl2n9t12Rk0VozTm55XC0xSoKTy
	+ki4Hzr+PqlHeUtwOsx/sFvyskZpsAP0fkJ0H9KV4SaLmcuE7R9HyjNWkq1eJ4AC0U5xQ+97OsDxu
	T3UKLMOw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KQ5-00000005aP2-2PfH;
	Sun, 06 Sep 2026 21:28:57 +0000
Message-ID: <99e7859e-5656-4bc2-b75a-5cf0ded24bf9@infradead.org>
Date: Sun, 6 Sep 2026 14:28:57 -0700
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: RAS: Use the real EDAC PCI parity control
 names
To: Karl Mehltretter <kmehltretter@gmail.com>, Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260905092441.41401-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905092441.41401-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 2:24 AM, Karl Mehltretter wrote:
> The document names the sysfs control
> /sys/devices/system/edac/pci/check_pci_parity and the module parameter
> edac_panic_on_pci_pe. Neither exists.
> 
> check_pci_parity was renamed to check_pci_errors by commit 91b99041c1d5
> ("drivers/edac: updated PCI monitoring"), after the document had been
> written.
> 
> The module parameter has been edac_pci_panic_on_pe
> (drivers/edac/edac_pci_sysfs.c) since it was introduced, and the
> document described it as edac_panic_on_pci_pe from the start.
> 
> Use the real names.
> 
> Fixes: 91b99041c1d5 ("drivers/edac: updated PCI monitoring")
> Fixes: 327dafb1c61c ("edac: core fix redundant sysfs controls to parameters")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/RAS/main.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin-guide/RAS/main.rst
> index 5a45db32c49b..c1040e5a5b35 100644
> --- a/Documentation/admin-guide/RAS/main.rst
> +++ b/Documentation/admin-guide/RAS/main.rst
> @@ -623,7 +623,7 @@ Under ``/sys/devices/system/edac/pci`` are control and attribute files as
>  follows:
>  
>  
> -- ``check_pci_parity`` - Enable/Disable PCI Parity checking control file
> +- ``check_pci_errors`` - Enable/Disable PCI Parity checking control file
>  
>  	This control file enables or disables the PCI Bus Parity scanning
>  	operation. Writing a 1 to this file enables the scanning. Writing
> @@ -631,11 +631,11 @@ follows:
>  
>  	Enable::
>  
> -		echo "1" >/sys/devices/system/edac/pci/check_pci_parity
> +		echo "1" >/sys/devices/system/edac/pci/check_pci_errors
>  
>  	Disable::
>  
> -		echo "0" >/sys/devices/system/edac/pci/check_pci_parity
> +		echo "0" >/sys/devices/system/edac/pci/check_pci_errors
>  
>  
>  - ``pci_parity_count`` - Parity Count
> @@ -725,15 +725,15 @@ Module parameters
>  
>  	module/kernel parameter::
>  
> -			edac_panic_on_pci_pe=[0|1]
> +			edac_pci_panic_on_pe=[0|1]
>  
>  	Enable::
>  
> -		echo "1" > /sys/module/edac_core/parameters/edac_panic_on_pci_pe
> +		echo "1" > /sys/module/edac_core/parameters/edac_pci_panic_on_pe
>  
>  	Disable::
>  
> -		echo "0" > /sys/module/edac_core/parameters/edac_panic_on_pci_pe
> +		echo "0" > /sys/module/edac_core/parameters/edac_pci_panic_on_pe
>  
>  
>  

-- 
~Randy
