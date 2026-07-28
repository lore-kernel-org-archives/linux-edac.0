Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A53A6F0F;
	Tue, 28 Jul 2026 04:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213106; cv=none; b=nD+MeQOzhiRb/DX3owOuhepW+BVtPQRWKAbjfDPesppqafZnHZITFO+leiv+Ri8YYTDhu3PjFGrELDsXItj4ouB+M8rhuhA/P6J9ZWOpsXdBSJ4s7es1MDF7SYIPhnurlUE00Jdbrft+AxhXIg7sBrVgN6pNnj+Z6cPCmtodph8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213106; c=relaxed/simple;
	bh=hkgK3Sst3ZYouqI+2IO2iuiwmVGKV5zq4DF0IPxXutA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsiAzqUGI3CMMxP4f3RNYHLjaPySpRmBvqnGQTgniEm44dq8N1ySBw/s50fXkFi5Q5H4+JFS60cijnNZplWLU8BFrzePWmYZL+y8H5y1eySOtNMYLKiSBIY3DQ5yjOJQyes42onePyiCuNcPoN/lQft7HjExb2WmwFrUyJJPtoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CHPjQQqb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CHPjQQqb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=mQvstQd8Ta6ff8kZBOw0uOSIhhvnO3IJRb7R5oF+bsM=; b=CHPjQQqbx3YOAsNB8SfZxq1i7x
	2NzIG4euEGJeJwUyAlnjokOuw13yXWxAFjPFY/N525rHs0lFUVFfv3x4mWsGXWQhAuE2pH91JwE6u
	7/NBBbm1dyH1qVVq2IoxyqciS2dyUPMxUBG+VBwZzjvbqGaq3ceBqkvtNJmkwA5r63f8CZhdHQPtj
	sphWshuxEjVidVfTeT9OeRrtyJ8MnWMrQyIYfe8szECs0NzG4QWbhNOzs9v73sal96xx3gMSWjoWy
	1TjshUTjNx2C+CLr/aaIAjaqGBZiUUsTzpV43UiPy7qTAu7K3EfboCp4yDsVeyAx39rFET92Dgl3Z
	OsEIH77Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZTc-00000004Odh-43qU;
	Tue, 28 Jul 2026 04:31:37 +0000
Message-ID: <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
Date: Mon, 27 Jul 2026 21:31:35 -0700
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
To: Weijie Yuan <wy@wyuan.org>, =?UTF-8?B?5bKz56eJ5Z2k?=
 <yuebingkun@kylinos.cn>
Cc: mchehab@kernel.org, tony.luck@intel.com, corbet@lwn.net,
 shiju.jose@huawei.com, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org,
 sakari.ailus@linux.intel.com, linux-doc@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn> <amgu5cFN_imQgMf-@wyuan.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <amgu5cFN_imQgMf-@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/27/26 9:24 PM, Weijie Yuan wrote:
> Hi 秉坤,
> 
> On Tue, Jul 28, 2026 at 12:12:11PM +0800, 岳秉坤 wrote:
>> Fix "should be use" -> "should use" in Documentation/ABI/README.
> 
> The diff below already documents that the changes is in
> "Documentation/ABI/README". I'm not sure if it is proper to write like
> this. But I also do not know what's the best practice to write commit
> messages for typos. Hope some friends could provide a better answer ;-)
> Of course, if the maintainer thinks it's okay, I'll be definitely fine
> with it.
> 
>> Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Usually, your "Signed-off-by" should be the last trailer.

Hm, I disagree. The -by: lines are somewhat in chronological order, so this
looks fine to me.

Documentation/process/submitting-patches.rst says:
"""
Standard sign-off
procedure applies, i.e. the ordering of Signed-off-by: tags should reflect the
chronological history of the patch insofar as possible, regardless of whether
the author is attributed via From: or Co-developed-by:.  Notably, the last
Signed-off-by: must always be that of the developer submitting the patch.
"""

Yes, this doesn't address Acked-by: or Reviewed-by: lines, but in my experience,
chronological order applies to all of them.


>> ---
>>  Documentation/ABI/README | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
>> index 315fffe1f831f..27c962e6a872c 100644
>> --- a/Documentation/ABI/README
>> +++ b/Documentation/ABI/README
> 
> Thanks.

-- 
~Randy

