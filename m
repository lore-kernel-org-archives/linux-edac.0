Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D1035DA6C;
	Mon, 23 Mar 2026 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250733; cv=none; b=D6Ug5XIAQxCOf7XR/03XyIbv0chSSupcbkFNAaZZ64SXsO6/03xzTzFHa1tuBw3M6Ly6XvitegiZfWbW+eUPzm9lO1JCf7dn9uXTfcqffN+7Eye2G2ck3cwO/qBB2QI9kHPBNB+xploEPINLSMKTY6RsbfzjHg2tOmWWUS6mQ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250733; c=relaxed/simple;
	bh=QMPkI9C28s9dOKh7+HT5+gqKM+eJFdtngeELmK0v6NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2x6L68pSd+0LnUNkQGEh4SmkZVDMkUr12USVilh1N6PycifECXOp9M8P4cD/+W8Yb/1MAUMypTntv1Xq4EOFuT8G7Cwd+7dMBrTdW5KfSJYdCSYXgkhoG8WXbnsSpH0jIJ1a6cmZaX6SpMT0QVQRBsnTqzlQRW8ZJu4jpgioWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=tBYaJ/6A; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="tBYaJ/6A"
Received: from [10.94.160.76] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 913CD20B710C;
	Mon, 23 Mar 2026 00:25:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 913CD20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1774250732;
	bh=YuCeNaV2/BDTmsH1XZAMLctTHRvJc1V4TGzZ9w7DOFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tBYaJ/6ADkAzMrULIHAJtWUHGpa96StwZRjMa27Q+0Jg172nGhDFb9qy5HVsDX7Yl
	 mC2CzGSkTc1niQLFSRGJBmIrk1lwwZoqM+8RFQNHaL9B23zh2eUhoHY/pLpFFTadiC
	 XmqRewSzDj2grjAoPPgb0duhWeKmcclAcsAob7lM=
Message-ID: <a499a623-252b-433f-a2de-784fe2016b3d@linux.microsoft.com>
Date: Mon, 23 Mar 2026 12:55:28 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] EDAC/versalnet: Release reference to remoteproc
 device in remove
To: Borislav Petkov <bp@alien8.de>
Cc: shubhrajyoti.datta@amd.com, tony.luck@intel.com,
 linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260322131107.1684647-1-ptsm@linux.microsoft.com>
 <20260322131134.1684691-1-ptsm@linux.microsoft.com>
 <20260322155947.GAacAR8z1cKR7pG1it@fat_crate.local>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260322155947.GAacAR8z1cKR7pG1it@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Boris,

On 22-03-2026 21:29, Borislav Petkov wrote:
> On Sun, Mar 22, 2026 at 06:11:34AM -0700, Prasanna Kumar T S M wrote:
>> The rproc reference acquired via rproc_get_by_phandle() during probe
>> is not released in mc_remove(), causing a reference count leak. Add
>> the missing rproc_put() call.
>>
>> Fixes: d5fe2fec6c40d ("EDAC: Add a driver for the AMD Versal NET DDR controller")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/edac/versalnet_edac.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
>> index f70243bc8a7a..28f5036f381c 100644
>> --- a/drivers/edac/versalnet_edac.c
>> +++ b/drivers/edac/versalnet_edac.c
>> @@ -958,6 +958,7 @@ static void mc_remove(struct platform_device *pdev)
>>   	cdx_mcdi_finish(priv->mcdi);
>>   	unregister_rpmsg_driver(&amd_rpmsg_driver);
>>   	rproc_shutdown(priv->mcdi->r5_rproc);
>> +	rproc_put(priv->mcdi->r5_rproc);
>>   }
>>   
>>   static const struct of_device_id amd_edac_match[] = {
>> -- 
> 
> Why is this a separate patch and not part of patch 1?

I can merge this and the previous into a single patch. Will do as part 
of v2.

> 
> Also, do you have the hardware to test this on? IOW, have you tested those
> patches?

Yes, I do. Tested the change using 6.6 kernel with back ported driver.

Thanks,
Prasanna Kumar

