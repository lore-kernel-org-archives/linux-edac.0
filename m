Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20203A3834
	for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785258968; cv=none; b=i2COflm7gpTvEEi3rdFG0Oo1V4Bya+P4034f78MoJyUt0nl5uxAjKPPQEEwC0P0oElkjajICSCGu5754RCqgVzsLsscDAQVJPZsfqnRjfV4UIORY7j7UNkKpriLIWFbnr6noozp6X5wVWvR8KE/5CLj07V3HVI1uQ/1tdM8r1AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785258968; c=relaxed/simple;
	bh=OUbNJR0+UJfL9gasc1f9tZ7T+VPKTwBCMcunPXi/+ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTetk5pocBX63d2aY1g7VyIA4TLooXcjWTW822sHMpzNWW/oNkZywslU5XRPiuqizxwfrsZEegERQctw/lCT7vzNFKrIz4lQtG2wZnEGeexYBmsWJ1IL7mrPQCvwyvqnq82m4FnRJB9rs4t+AwL9uKZUS7DOtrCli6I2jz41R2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=NJ1BJh0J; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="NJ1BJh0J"
Date: Wed, 29 Jul 2026 01:15:45 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785258962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FyKBy9FQwVsc+qRA2GC+u9lRYdlYs8hPWPOQeWCaGfM=;
	b=NJ1BJh0JwFC8gPlQpNS47irr7vF7wPsXFrVZYH4UDzGH5Sd2HycIScqSjVjyc1cDx0wI13
	NxIcsL7a3FphqmYID5m85DGCfun8qWDUq3Z3LvuIEnft3+sFdal0JndFKMUqvxSQB46KNp
	+d8C0v/sckflPs1bUYPCAjCXs9u0DnJ6BlRZBTWky3FeCoqX8DVDlvbkEkSWDblJL0/pzN
	HefcwqyE1OidFsYqilCTJbNIykR305uBkdRL5i9BkiwQGJH6xqwN+VM9+zBYjSC1yqQ6Cw
	L0wrg7E8ozTLz/06IMmtJ0c+wXBVtVheYgrRNVS1c8vk/MJQnXMZ+MZlHBTuhw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: =?utf-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>, mchehab@kernel.org,
	tony.luck@intel.com, corbet@lwn.net, shiju.jose@huawei.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
	linux-doc@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
Message-ID: <amjjwfSimXeZOWbA@wyuan.org>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn>
 <amgu5cFN_imQgMf-@wyuan.org>
 <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
 <amhCmSxLtu4m6fXX@wyuan.org>
 <b7773638-12dd-44a4-b075-2e6994dd9971@infradead.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7773638-12dd-44a4-b075-2e6994dd9971@infradead.org>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 09:55:42AM -0700, Randy Dunlap wrote:
> > That is to say, when dealing with multiple authors, we suggest using
> > trailers to represent the sequence of authors in chronological order.
> > 
> > Then, this will facilitate subsequent readers to understand the
> > development history of the patch through the order of the trailers.(?)
> > 
> > And, aren't these subsequent examples merely confining the discussion to
> > these two trailers?
> 
> They seem to be but that's just a documentation deficiency IMO.

OK, let me take some time to look through the history of this file and
see if I can uncover any clues.

If this is indeed a flaw, it might be worth clarifying. That said, I am
not sure how many people actually find it ambiguous. In any case, it may
be better for someone with more experience to improve it, as I am
clearly not qualified to do so.

> > Besides the submitting-patches file, It seems to me that the probability
> > of "Signed-off-by" appearing on the last line is much higher than in
> > other cases. Is this a usual practice? It seems that everyone tacitly
> > agreed to write "Acked-by" and "Reviewed-by" at the top, even though
> > they occurred after "Sob".
> > 
> 
> I chose 2 files and looked at their "git log" history: MAINTAINERS and
> kernel/panic.c. In those files I see corroboration of my "claim," so I'm
> satisfied with it.

Makes sense. Perhaps different subsystems simply have different
preferences, then. My observation may not have been representative.

Thanks.
