Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4139021E
	for <linux-edac@vger.kernel.org>; Tue, 28 Jul 2026 17:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261102; cv=none; b=YmUDw0aC21bYl8bRy7PINyBTeJ0W0hjXhuSSsc3nqfAME7Udt2NZsikAHwlf8rAIAeWrzkfFY8urV8hVbGhwew/dOI293TzaaDJxN01C4jcKcXIyhU4NNvA9xTGG8Tuxd9gfUx81tF8IZ8vAw6zd+p+Bai5HMulTYPt1XDcChS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261102; c=relaxed/simple;
	bh=/zLE9zPszKTk4d6MX4nRb/aOATZ5vZXVt5SwaamjxgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AR7COwSpF2lbeVIxjuiwGdhLWTglv5FKFVhTma/vBTma/CwzR2MandX/9jo/m1rrwSj938ZK755wf4E5jszc7/Tg3eS9URF84SCC3Y/HFevqnMuPYDtsMVcYFG6xQeGqjjZB6LX3tfaALZwPI0cAG6q/ksh3iCh5xYsIRxRCQR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=pxK07HMk; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="pxK07HMk"
Date: Wed, 29 Jul 2026 01:51:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1785261088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWvabdyED2vHBfkbGCtXenrCWDdBzWohwfZjdmJhuJE=;
	b=pxK07HMkMs1n6LIlPaPOhvLBRiY9/VXFr9K0D+JdWJzYmpmhzem2EGLKoUzDXLhafA7035
	+VQy9xniMD/vyyKtOTttjsXpyOvEPpqFAQ+aiA2QCpU7yslnonzi5qOqTHaMEM/7oHZ2+k
	NCIhPT3hbA53V2Is/zKtRu4i5Oq41FHbWYyPIwUZb6be1KpQH2ypELjxMy/eSVevuKRS+M
	b5XhFGCeZ8vBN06xGu89ZBE68MS1RmOxLK2TJfxsLqWwJ+PZqfS8zKKbHs7rQdTqlfb9dQ
	6StZsyRlvAOnr26LcpHJgK0Ll4Jb/L2OxqMzetw/8O09RJ8N4NjwPqWgapE7SA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	=?utf-8?B?5bKz56eJ5Z2k?= <yuebingkun@kylinos.cn>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"shiju.jose@huawei.com" <shiju.jose@huawei.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"hverkuil+cisco@kernel.org" <hverkuil+cisco@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Documentation: fix "should be use" grammar in ABI
 README
Message-ID: <amjsCufED-hm3ixe@wyuan.org>
References: <20260728041213.52820-1-yuebingkun@kylinos.cn>
 <20260728041213.52820-2-yuebingkun@kylinos.cn>
 <amgu5cFN_imQgMf-@wyuan.org>
 <f7a7b4d8-d044-491f-827c-ec929ee429ce@infradead.org>
 <amhCmSxLtu4m6fXX@wyuan.org>
 <b7773638-12dd-44a4-b075-2e6994dd9971@infradead.org>
 <amjjwfSimXeZOWbA@wyuan.org>
 <SJ1PR11MB6083664AB26C2273CFC1B7E3FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB6083664AB26C2273CFC1B7E3FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 28, 2026 at 05:25:47PM +0000, Luck, Tony wrote:
> > Makes sense. Perhaps different subsystems simply have different
> > preferences, then. My observation may not have been representative.
> 
> Yes. TIP tree for x86 core work provides an explicit order for tags. See
> "Documentation/process/maintainer-tip.rst" in the " Ordering of commit tags"
> section.
> 
> -Tony

Hi Tony, thanks for mentioning this!

To be honest, I usually read the documentation only on docs.kernel.org,
and I'm only now realizing how much I´ve been missing... as many files
are not listed in index.rst.

Thanks! Learned a lot.
