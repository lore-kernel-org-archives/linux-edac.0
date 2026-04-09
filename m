Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1689F3ACA7F;
	Thu,  9 Apr 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775727223; cv=none; b=La0kPBDpxm4NUCCGkMNZXZG0iiFFSqctCuvzE+FlI4gjgZgbM5BmDjEzhsfo9BbAhu2y/jImH0BXT6B3aqpVwO8wjoWuHYwy4viyO8dMYTRLbc7UF/iHqJjVFPgZ3an2o55Vv5NA0lbDLbSIx9KxKp0Z4NiDwDlr7HT/z3dy0BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775727223; c=relaxed/simple;
	bh=uwXownNwS2n9lt0biryXgrW+Xj1E7aO9KBDygpxJwyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsU/ybZ2wwKO3aNwI0TWRut9Gfh9DkH1VAPwgRLYMWMsfYDekPj22PcQ0HjNzA3M9aClW4rZXsdGwkFp8zz1C6F1Id1LMo6b1ptpyM5rSdRo61N+QuCxTEmwfETc/9UsyTzFU75t22h7LHowUdkCaq/tfrnpRgANYV2X+7DxVkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=iyo6z9Ba; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="iyo6z9Ba"
Received: from [10.94.177.52] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id BBBAF20B710C;
	Thu,  9 Apr 2026 02:33:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BBBAF20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1775727210;
	bh=QXR/oOQuAzwBjk38rFZEGJsqrmd/xFKNZ3n6QZ/hL30=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iyo6z9BaDX/c4yLDreLzX1YFfHzcJtQMQOMYAw4n/A4jQq9iiny5R9winmHfzZAWd
	 Ex5Dc9TmONUvEqFYSrpUVv9FNJQYv/Q1aXIkboRoBTIFUkLJHgfObZ61ZXSHZM234R
	 vxr7/Ix7lYgFHqaHIkW69gegUDFdEQgyjSG+uH3E=
Message-ID: <897f996e-1d43-4817-88af-d980f321d0c6@linux.microsoft.com>
Date: Thu, 9 Apr 2026 15:03:29 +0530
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
 <b6af31b0-0429-4092-8ec0-e0ab84a16f39@linux.microsoft.com>
 <20260406082353.GAadNtmUQqtwhw4yZS@fat_crate.local>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260406082353.GAadNtmUQqtwhw4yZS@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06-04-2026 13:53, Borislav Petkov wrote:
> On Mon, Apr 06, 2026 at 10:56:17AM +0530, Prasanna Kumar T S M wrote:
>>> Sashiko has found things, pls addres them:
>>>
>>> https://sashiko.dev/#/patchset/20260401111836.2342918-1-ptsm%40linux.microsoft.com
>>>
>>
>> I asked AI to validate Sashiko's comment.
> 
> So I asked *you* to address the Sashiko review. You go and ask another AI to
> validate the review.
> 
> Now, if I go and paste the whole conversation to a third AI, the f*ckup is
> complete.
> 
> Tell me: is that the goal of this exercise? Let AIs do the thinking
> for us and we can all go shopping?
> 
> Or maybe *you* should go review Sashiko's review and say, I agree because
> <proper, comprehensible explanation> or I don't agree because <also proper,
> comprehensible explanation>.
> 
> Then *I* go and verify that.
> 
> Hmm...
> 

Hi,

Sashiko review says
-------------------
If an MCDI response message arrives after priv->mcdi is freed but before the
RPMSG endpoint is destroyed, could the still-active rpmsg_cb() pass the
dangling priv->mcdi pointer to cdx_mcdi_process_cmd(), leading to a
use-after-free?
-------------------

The review is based on the assumption that priv->mcdi is freed before 
unregister_rpmsg_driver(). But priv->mcdi is valid till the end of the 
function.

The cdx_mcdi_finish() waits for the mcdi->workqueue to finish processing 
and the mcdi->workqueue is destroyed. Any subsequent rpmsg_cb() calls 
cdx_mcdi_process_cmd() which safely without doing anything if mcdi 
(priv->mcdi->mcdi) is NULL. The review can be safely ignored. Other path 
in rpmsg_cb() accesses priv->adec and priv->regs, both of them are valid 
and doesn't cause any use-after-free issue.

The review is a false positive and can be ignored.

Thanks,
Prasanna Kumar
