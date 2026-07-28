Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8D39099B;
	Tue, 28 Jul 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257755; cv=none; b=EGC0GbgzbZtte7552gQLzoJ74UkYP+L35cOE6X7YUmbqABirfyprz/21rwV/+Gl1/YWLvoldl98bLj7EfcHTYG30KUzx3yxuJPWvHXgJRVCANqJ3rmY64VtD7A5AEMuveSB4NRq9S0Vl7/RY4p8B2UanXF0qBQfRWzVUWxF6JC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257755; c=relaxed/simple;
	bh=NgbHZpVQ8/kf1iluMJBBDSuzlnizdyCmmijqCjCcOQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFu8pj3Tyn2WZIBuhJqyOwG+V9zfwSLYwpEem286ZrG38gfMvw6JDtPlDlc0dTBUr3CQQDXEyrj+gOYmkid4TE71dDss6jF76WJofYx5hXJAMcSvBAldwYf0rSVMXmCwWYOhB6l2e/gdZHsnFW3fdGht0LLM7QFYs0ASJm7ydWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BfPdBi9A; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BfPdBi9A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Zs6ggugRdYyXg9jsw/mL1a6CvW1NYKUX7RaqAdEwvak=; b=BfPdBi9AabkfDvxL3mkFSNs+sy
	vAoHdvmVW6hCJ+0FrBXCu+HCKgRXIFPax1w7b4IfuOR+3cAxECSfsprwqRKvPMfwxnwl8iQl3ZKO+
	Isfjb22HsfgfEfUkIlYQwabP2qbDlv9Oa8Nx55CxKiZSxSs/bGCO43HKefia8xtD+tGUC+yQUQqFw
	dPdjcK0ssgEaP+8TiSJGHqqskd7RdvJpvWAj3OyWsCm6oHcqFIPa6KVax9Zn5J6EpAFPxj8o0zkf7
	LXN6zJ7CWC0MKNW8/1j/uYSsGA1fGPEbMS0sDS8Z+AHh57522Y+AHtAsGL6x4bZH9Hp1EfZIKVIpw
	7cZH5iEQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wol5l-00000005tBo-28uo;
	Tue, 28 Jul 2026 16:55:45 +0000
Message-ID: <b7773638-12dd-44a4-b075-2e6994dd9971@infradead.org>
Date: Tue, 28 Jul 2026 09:55:42 -0700
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
To: Weijie Yuan <wy@wyuan.org>
Cc: =?UTF-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>, mchehab@kernel.org,
 tony.luck@intel.com, corbet@lwn.net, shiju.jose@huawei.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
 linux-doc@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn> <amgu5cFN_imQgMf-@wyuan.org>
 <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
 <amhCmSxLtu4m6fXX@wyuan.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <amhCmSxLtu4m6fXX@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/27/26 10:48 PM, Weijie Yuan wrote:
> On Mon, Jul 27, 2026 at 09:31:35PM -0700, Randy Dunlap wrote:
>>>> Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
>>>> Acked-by: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> Usually, your "Signed-off-by" should be the last trailer.
>>
>> Hm, I disagree. The -by: lines are somewhat in chronological order, so this
>> looks fine to me.
>>
>> Documentation/process/submitting-patches.rst says:
>> """
>> Standard sign-off
>> procedure applies, i.e. the ordering of Signed-off-by: tags should reflect the
>> chronological history of the patch insofar as possible, regardless of whether
>> the author is attributed via From: or Co-developed-by:.  Notably, the last
>> Signed-off-by: must always be that of the developer submitting the patch.
>> """
>>
>> Yes, this doesn't address Acked-by: or Reviewed-by: lines, but in my experience,
>> chronological order applies to all of them.
> 
> Ah, I remember this part. But I tend to believe that this description is
> only relevant to the issue of the order of Co-authored-by and
> Signed-off-by, if I were the newcomer reading this for the first time.
> (In fact, I actually am a newcomer compared with you ;-))

Yes, that's understandable.

> That is to say, when dealing with multiple authors, we suggest using
> trailers to represent the sequence of authors in chronological order.
> 
> Then, this will facilitate subsequent readers to understand the
> development history of the patch through the order of the trailers.(?)
> 
> And, aren't these subsequent examples merely confining the discussion to
> these two trailers?

They seem to be but that's just a documentation deficiency IMO.

> ---
> <changelog>
> 
> Co-developed-by: First Co-Author <first@coauthor.example.org>
> Signed-off-by: First Co-Author <first@coauthor.example.org>
> Co-developed-by: Second Co-Author <second@coauthor.example.org>
> Signed-off-by: Second Co-Author <second@coauthor.example.org>
> Signed-off-by: From Author <from@author.example.org>
> ---
> 
> Besides the submitting-patches file, It seems to me that the probability
> of "Signed-off-by" appearing on the last line is much higher than in
> other cases. Is this a usual practice? It seems that everyone tacitly
> agreed to write "Acked-by" and "Reviewed-by" at the top, even though
> they occurred after "Sob".
> 

I chose 2 files and looked at their "git log" history: MAINTAINERS and
kernel/panic.c. In those files I see corroboration of my "claim," so I'm
satisfied with it.

> But of course, you have much more experience in this area, so my limited
> observations may not be very representative.
> 
> Thanks!
> 
> ps. The Git project explicitly stipulates "Place this `Signed-off-by:`
> trailer at the end". So at first, I wasn't quite sure about it.

-- 
~Randy

