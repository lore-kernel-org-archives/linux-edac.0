Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4003D3012;
	Thu,  9 Jul 2026 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578740; cv=none; b=UjXcoiM3M6CjWOdSt5BxHIARGZ/QSx/Ec7PrW1L7e2mJhRtj75bnVHlcvxQQO8lp1lGUp0DTTExcOx8e1IVr4I+OWixHtEP4mvhevCfOISSYOumzl41eWE9D3y3KrFGXP9HM0ckFLFJ0aAOnDaF5oRiWzrTNXA8qVioRh0TYj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578740; c=relaxed/simple;
	bh=5y7fhb3SCxHRrciTkhqoShbNghZqGXZ8i2Tk1Og5WSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RcAz5EIt696C5nkv0HhyegTgf2dnoRS8IQcqtPZ/n7uXO9ooF9bpHlqdfoJLKEWQAPOCzjhaWMyemLasH1rJ/p3fzmeyLOZRADqALNtT7oFxnWLdrHrz1Mvo/ihEHbnwaLu3eKFN0N7BbffBcG2KiSzfW59qwrRM9FaBBPXc7w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=gvbPrKf6; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="gvbPrKf6"
Received: from [10.94.177.11] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6482E20B716D;
	Wed,  8 Jul 2026 23:32:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6482E20B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1783578733;
	bh=KG7nQTQV2sZ9PobG4lEMmwTbxpq4W3MbiqxpAso6zKs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gvbPrKf6IbNhyXrRGWM3roPxpQRw2XaBcl9F/hMZs5jbF+ahCRQrMWM54VQhb5CJ5
	 G1nI5PtRKm2CtD6tLFAD9w0R+EYDBE1tqvdv7bFQO/H2Pp5aiMeXYNJcONCxoEMpYN
	 s9OffXQnF0q9Bf3IsQog0Cz27gUpdCMC8xU4Yz20=
Message-ID: <acc5b2b9-6821-4e12-9efe-69c24037490d@linux.microsoft.com>
Date: Thu, 9 Jul 2026 12:02:14 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in
 mc_remove()
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com, bp@alien8.de,
 tony.luck@intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
 <CAKfKVtHUqcvv97E2CoETtU2tN5+9SYAgDde=bYQw16hirPM4yw@mail.gmail.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <CAKfKVtHUqcvv97E2CoETtU2tN5+9SYAgDde=bYQw16hirPM4yw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Shubrajyoti,

On 08-06-2026 16:41, Shubhrajyoti Datta wrote:
> On Wed, Apr 1, 2026 at 4:56 PM Prasanna Kumar T S M
> <ptsm@linux.microsoft.com> wrote:
>>
>> The teardown sequence in mc_remove() does not mirror the reverse of the
>> initialization order in mc_probe(). In particular,
>> unregister_rpmsg_driver() is called before remove_versalnet(), and
>> cdx_mcdi_finish() is called after rproc_shutdown().
>>
>> Reorder mc_remove() to reverse the probe initialization sequence,
>> consistent with the probe error-unwind paths.
> 
> I think that the remote proc should be quiescence first so that no
> more messages will be
> queued. and then the edac should be removed. See below.
> 
>>
>> The rproc reference acquired via rproc_get_by_phandle() during probe
>> is not released in mc_remove(), causing a reference count leak. Add
>> the missing rproc_put() call.
>>
>> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>> ---
>>   drivers/edac/versalnet_edac.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
>> index b87fe57aa842..acd51b492772 100644
>> --- a/drivers/edac/versalnet_edac.c
>> +++ b/drivers/edac/versalnet_edac.c
>> @@ -955,10 +955,11 @@ static void mc_remove(struct platform_device *pdev)
>>   {
>>          struct mc_priv *priv = platform_get_drvdata(pdev);
>>
>> -       unregister_rpmsg_driver(&amd_rpmsg_driver);
>>          remove_versalnet(priv);
> 
> Here we are removing the edac but the remoteproc  can be triggered.
> calling the remote callback.

Thanks for the review.

This suggests that my change is not complete. I am not sufficiently 
familiar with this area to provide a correct fix, so I will leave it to 
someone more knowledgeable.

> 
>> -       rproc_shutdown(priv->mcdi->r5_rproc);
>>          cdx_mcdi_finish(priv->mcdi);
>> +       unregister_rpmsg_driver(&amd_rpmsg_driver);
>> +       rproc_shutdown(priv->mcdi->r5_rproc);
>> +       rproc_put(priv->mcdi->r5_rproc);
> The put is a valid fix.
> 
>>          kfree(priv->mcdi);
>>   }
>>
>> --
>> 2.49.0
>>
>>

Thanks,
Prasanna
