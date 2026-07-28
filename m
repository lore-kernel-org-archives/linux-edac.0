Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC313B4E80
	for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 05:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785217718; cv=none; b=DU9iBKwl1mJVIK4zc274TpclHpRsPvQ3VadQ2SropuU6ruyFUl7vhERdNkqdG9fmkiXrILq2UDpR8vAi/MsBiUnS4quA8jTofSYoCzJlXzfb1mN8TI2UiBIzjZmWzMG9PKEG4NHtW8k6i6pngEL4PQPWpCsre6GqQy6xkcYT3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785217718; c=relaxed/simple;
	bh=tyAmUAZfOCJ1m4CzbrPXkOZ7J/hv4sI+SZEy9luhysw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krfq6yxXOpwQbISb6EuNZqH6bzR6QKJtUlUBjCliVkBiYFdxXjm4d3N4IS7886RpE4Yr3FoFhehtMWLdEl24vOYBPMr+S5ZPw+8qKmkqCfEcT5bP9sWmrHf7m065ATs7YP+WXtSoaB5vhdFHqUvEJz+gmynW2UrpxINKPqp6Kd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=h5FsTysB; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="h5FsTysB"
Date: Tue, 28 Jul 2026 13:48:09 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785217703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Yu4ZjvPLIKluIkVwr+ZO7GVBWFFGdggu8YAGnCkbIs=;
	b=h5FsTysBCISbrhTBZ9n5Zx2+/cu6QlXQnoeaezbgoSDsyeigex1nkY04/HGUl+ewt1WNTs
	9JKTyRAJChuCo0i5yzf12AMGtB465Xi0kt/ZSSJWBdqDttGovqMSIdWVlXgkSiHPzMOYKO
	YwNIkseS+7wHH9qTx9Rka6hIZ3kDm1c5WweTfjQb3AFUU+3vghu0JTPsn/AHZRnm9gdfNd
	wp5YbvIOFXgdyvFpSi59ohrJEdquTzox+FNMtt2g3stz0D94YW5RCL8GYuebmg3QsiCA3+
	jfQmrXQ/f/1DKF4SLp4nX+6ucg7UNGd6hHMW7JcyVq7nosTiqbfdVjZR+KiVrg==
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
Message-ID: <amhCmSxLtu4m6fXX@wyuan.org>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn>
 <amgu5cFN_imQgMf-@wyuan.org>
 <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Jul 27, 2026 at 09:31:35PM -0700, Randy Dunlap wrote:
> >> Signed-off-by: 岳秉坤 <yuebingkun@kylinos.cn>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Usually, your "Signed-off-by" should be the last trailer.
> 
> Hm, I disagree. The -by: lines are somewhat in chronological order, so this
> looks fine to me.
> 
> Documentation/process/submitting-patches.rst says:
> """
> Standard sign-off
> procedure applies, i.e. the ordering of Signed-off-by: tags should reflect the
> chronological history of the patch insofar as possible, regardless of whether
> the author is attributed via From: or Co-developed-by:.  Notably, the last
> Signed-off-by: must always be that of the developer submitting the patch.
> """
> 
> Yes, this doesn't address Acked-by: or Reviewed-by: lines, but in my experience,
> chronological order applies to all of them.

Ah, I remember this part. But I tend to believe that this description is
only relevant to the issue of the order of Co-authored-by and
Signed-off-by, if I were the newcomer reading this for the first time.
(In fact, I actually am a newcomer compared with you ;-))

That is to say, when dealing with multiple authors, we suggest using
trailers to represent the sequence of authors in chronological order.

Then, this will facilitate subsequent readers to understand the
development history of the patch through the order of the trailers.(?)

And, aren't these subsequent examples merely confining the discussion to
these two trailers?

---
<changelog>

Co-developed-by: First Co-Author <first@coauthor.example.org>
Signed-off-by: First Co-Author <first@coauthor.example.org>
Co-developed-by: Second Co-Author <second@coauthor.example.org>
Signed-off-by: Second Co-Author <second@coauthor.example.org>
Signed-off-by: From Author <from@author.example.org>
---

Besides the submitting-patches file, It seems to me that the probability
of "Signed-off-by" appearing on the last line is much higher than in
other cases. Is this a usual practice? It seems that everyone tacitly
agreed to write "Acked-by" and "Reviewed-by" at the top, even though
they occurred after "Sob".

But of course, you have much more experience in this area, so my limited
observations may not be very representative.

Thanks!

ps. The Git project explicitly stipulates "Place this `Signed-off-by:`
trailer at the end". So at first, I wasn't quite sure about it.
