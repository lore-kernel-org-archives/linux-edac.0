Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62D73876A7
	for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 04:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212659; cv=none; b=Idn9/QgTW9yL+sZkKtXxY+StN8EZ/8UFyr6ZG8lK0KxEAyiji7mrzJ23srxkyUvqa/d1CIGSIuILj/CS8z/J78y/FfS4/ee7kcRtazRqp5ZU8Gc14+aVot3Zq5ocIgoT/7NBRgOeEcnc4gSvnRaVhNqzQtT3CtYbBEZUORXvAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212659; c=relaxed/simple;
	bh=MpvIIQNIJ0ROJhSJfeTcJDeX+LHTxPBJ1ncaeSzQw/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNrDSPw3zdLhAEzWnxFvUlrUGs9QswyxoH5f2eWWDFgWnAtGgV34CAr6qUAEERzg8G0jY0aR3591Lw1CtFCc4ydu+3bIVpW0msrfL7ZWa6gRbbTJKm6BBwhddLi287bOwloBindDO/SYwcbrFgx4Og9lnPW0cz5HHdfEJmLAe7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=GeOrLwwq; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="GeOrLwwq"
Date: Tue, 28 Jul 2026 12:24:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785212653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXUARuOmaJ86ymvTYoSBJEoyJRXwNThMLC1rJ7BHfnI=;
	b=GeOrLwwq4u6V5HdK01Ev5Lvlr+PYMOJezyX5N4A19DEYKi8D4q7m5eugZizKFO2d5qGlA7
	0tbA1HZwraRosq/ojhLsPX8EFRXowgB+afdi4JnU7Cm8ad0fqiGb6+xv13Z8UosJElx9sD
	dGQKjT+z3ZZ+4mDfvTk5jCT+CRGCeHZCHAbdueoMrpwd1Qm38vu8bukCj/hd6MXbTKYmJn
	bUcXYfuo2OvjLQYQXb/sFdG5nN4b7FTzbd2FIMhtGHqJkCjGipGZCUVRuiqOu+nf9YcTLn
	YTvnC/8Sp8ujUoPq+zxez7KtwWAkMsAPCH9UQHH/w2KbQQFZK3nVkpP/YiS3pQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: =?utf-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>
Cc: mchehab@kernel.org, tony.luck@intel.com, corbet@lwn.net,
	rdunlap@infradead.org, shiju.jose@huawei.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org, sakari.ailus@linux.intel.com,
	linux-doc@vger.kernel.org, linux-edac@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
Message-ID: <amgu5cFN_imQgMf-@wyuan.org>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260728041213.52820-2-yuebingkun@kylinos.cn>
X-Migadu-Flow: FLOW_OUT

Hi 秉坤,

On Tue, Jul 28, 2026 at 12:12:11PM +0800, 岳秉坤 wrote:
> Fix "should be use" -> "should use" in Documentation/ABI/README.

The diff below already documents that the changes is in
"Documentation/ABI/README". I'm not sure if it is proper to write like
this. But I also do not know what's the best practice to write commit
messages for typos. Hope some friends could provide a better answer ;-)
Of course, if the maintainer thinks it's okay, I'll be definitely fine
with it.

> Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Usually, your "Signed-off-by" should be the last trailer.

> ---
>  Documentation/ABI/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> index 315fffe1f831f..27c962e6a872c 100644
> --- a/Documentation/ABI/README
> +++ b/Documentation/ABI/README

Thanks.
