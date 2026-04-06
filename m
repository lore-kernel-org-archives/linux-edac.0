Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B49417736;
	Mon,  6 Apr 2026 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775453184; cv=none; b=OKGd14lvRIFa/s3Td5GYecEfuaLQ6pVqKMkefEC7R51uTr3oEKSGTWt6hcBCVZpxCqPqZihUS/WAoEWLNm1jhJKWPTnw8JfkfPvhV2i/++KXXmXOtTJVRzu4i/9aPpEh2Yci10eCPnfoh1BY/AUZCcsaEmvVTWzMc4HiilOmhOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775453184; c=relaxed/simple;
	bh=+NJjJhGKiMXJHl6OYEBaH3MgpS9yK8p8TMiHpwa7B0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpCiarsBJkdLkbmsh93qdh3QNceuR/5xEs8Ig1C3OOAybCRJejSeywIOLvkhw6gZP8/bRQK9cHFrVLue+/d92TRRjQ3Jv+iReLLBGFrL6tN4Fci5Cjs1WAOZjm1DAt+atMGYQhmXo6bb4qwzisNPQiz7Z7h0oX0p/cqY1fIvhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Grp/75Um; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Grp/75Um"
Received: from [192.168.0.9] (unknown [4.194.122.144])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0167020B6F01;
	Sun,  5 Apr 2026 22:26:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0167020B6F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775453182;
	bh=UkJTPcONd/1fg/dU0LRQSpefHc1/L0ZHMkT0gknWj5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Grp/75UmT5895EPqGchSXJcgRvYzA9ifgYrIljPz47nA1DCRe3RzxFfrDfaaIKOsh
	 6YKo5V/4UtdhTgxbCtGn5U+9/8FiHDWpvEkinydOsbA4Kkkp8wl0DdyTM5ab1pdIc2
	 5d4pPAujbkp/7BPHRuOaCU0tiXG+B4FsSZqqzosc=
Message-ID: <b6af31b0-0429-4092-8ec0-e0ab84a16f39@linux.microsoft.com>
Date: Mon, 6 Apr 2026 10:56:17 +0530
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] EDAC/versalnet: Fix teardown ordering in
 mc_remove()
To: Borislav Petkov <bp@alien8.de>
Cc: ssengar@linux.microsoft.com, shubhrajyoti.datta@amd.com,
 tony.luck@intel.com, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401111836.2342918-1-ptsm@linux.microsoft.com>
 <20260403103457.GAac-X0SzsO9MtwAVE@fat_crate.local>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260403103457.GAac-X0SzsO9MtwAVE@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03-04-2026 16:04, Borislav Petkov wrote:
> On Wed, Apr 01, 2026 at 04:18:36AM -0700, Prasanna Kumar T S M wrote:
>> The teardown sequence in mc_remove() does not mirror the reverse of the
>> initialization order in mc_probe(). In particular,
>> unregister_rpmsg_driver() is called before remove_versalnet(), and
>> cdx_mcdi_finish() is called after rproc_shutdown().
>>
>> Reorder mc_remove() to reverse the probe initialization sequence,
>> consistent with the probe error-unwind paths.
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
> 
> Sashiko has found things, pls addres them:
> 
> https://sashiko.dev/#/patchset/20260401111836.2342918-1-ptsm%40linux.microsoft.com
> 

I asked AI to validate Sashiko's comment. This is its output
------------------------------------------------------------

   Analysis

   The review comment is not valid (false positive). Here's the detailed 
reasoning:

   Data structure hierarchy

    mc_priv
      └── mcdi: struct cdx_mcdi *            ← kfree'd at step 6 (LAST)
            ├── mcdi: struct cdx_mcdi_data *  ← kfree'd by 
cdx_mcdi_finish() at step 2
            │     └── iface: struct cdx_mcdi_iface (mutex, cmd list, etc.)
            ├── r5_rproc
            └── ...

   New mc_remove() order (after commit)

    (1) remove_versalnet(priv);                  // tear down EDAC
    (2) cdx_mcdi_finish(priv->mcdi);             // wait_for_cleanup → 
kfree(cdx->mcdi) → cdx->mcdi = NULL
    (3) unregister_rpmsg_driver(&amd_rpmsg_driver); // destroys rpmsg 
endpoint
    (4) rproc_shutdown(priv->mcdi->r5_rproc);
    (5) rproc_put(priv->mcdi->r5_rproc);
    (6) kfree(priv->mcdi);                       // frees outer struct

   Why the concern doesn't hold

   The reviewer's premise is wrong. The comment says "after priv->mcdi 
is freed" — but priv->mcdi (the struct cdx_mcdi * pointer passed to 
cdx_mcdi_process_cmd) is not freed
   until step 6, well after unregister_rpmsg_driver() at step 3.

   What IS freed at step 2 is the inner cdx->mcdi (struct cdx_mcdi_data 
*). But cdx_mcdi_finish() also sets cdx->mcdi = NULL. If rpmsg_cb() 
fires between steps 2 and 3:

    1. mc_priv->mcdi → still points to valid struct cdx_mcdi (not freed 
until step 6)
    2. cdx_mcdi_process_cmd(mc_priv->mcdi, ...) is called with a valid 
pointer
    3. Inside, cdx_mcdi_if(cdx) checks cdx->mcdi → NULL → returns NULL
    4. if (!mcdi) return; → exits early, safe

   Additionally, cdx_mcdi_wait_for_cleanup() inside cdx_mcdi_finish() 
ensures all pending MCDI commands have completed before freeing, so no 
legitimate MCDI responses should
   arrive afterward.

   This ordering exactly matches the probe error unwind path (err_init: 
does cdx_mcdi_finish → kfree → unregister_rpmsg_driver → rproc_shutdown 
→ rproc_put), which the
   commit explicitly states it's aligning with.

   Verdict: False positive. The NULL guard in cdx_mcdi_if() / 
cdx_mcdi_process_cmd() protects the window, and the outer struct 
priv->mcdi remains valid throughout.

------------------------------------------------------------

So the comment looks like a false positive. It will be great if someone 
from AMD verifies this.

Can you please look at the other 2 patches in this series? They are 
independent of this change.

Thanks,
Prasanna Kumar
