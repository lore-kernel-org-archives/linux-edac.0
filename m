Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6342F2E3391
	for <linux-edac@vger.kernel.org>; Thu, 13 Mar 2025 01:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741830284; cv=none; b=AeQLHn8BaXLzl2jy1MvQuBKOtbTVMaHm0rZpTuKeUPy1rNPaDLTjhj7UokTsCrBEioRiSBZsHKD8fgUpp94F3LY8iKY8srPznjQ6ID8VK+8LLnscyVE3f+Yyio3f71wsQkJ5So4JBZTS/NCxkn+QqEv2diTn6FbwhAUdRXsQI+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741830284; c=relaxed/simple;
	bh=YYlpCkJulNi5p/XGo77WRx9Pzfz/1qQs48uR6a7fUAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2Pwwm0t/ufnOTYa6pTpr2jeLCG3nKXZ6wHiStJlxqlaIc3xpZs1kUOwIgUkvEx+zAUQzWG6afin3LknTqDf5SH4f8mWyI3tfoT0tP0la1vX9LTMKAyttOiYTbMh388e+IMxnf2Zj8IINbmHHBZfim2cIdC774CavKrKFQutFLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Yjno+ko+; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Yjno+ko+"
Received: from [100.75.64.24] (unknown [40.78.12.246])
	by linux.microsoft.com (Postfix) with ESMTPSA id 278AF210B15B;
	Wed, 12 Mar 2025 18:44:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 278AF210B15B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741830282;
	bh=Gmh/yp1T+xa5IJ6SgT9wvfwiGO15xa88j8hcZM3as4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yjno+ko+xkPcFNUwyDamCfrWXtJZZKlTTchkrEoV22obxTFqrZSQeKxTFXHgYnhWZ
	 EsJ2p4VuhDkZEG6qNHMw19y7VZHtCV2q8um5kLXku/TdnLBZvz0f4ygQ4hK0qOur2Q
	 QzurBYqsB+XD5iJkuVmX25jkM0aKZdCBDnGS42yY=
Message-ID: <ff79f33d-91fd-49e5-9a6f-fa2c32c7021d@linux.microsoft.com>
Date: Wed, 12 Mar 2025 18:43:55 -0700
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add L1 and L2 error detection for A53 and A57
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rrichter@marvell.com>,
 York Sun <york.sun@nxp.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
References: <20210401110615.15326-1-s.hauer@pengutronix.de>
Content-Language: en-US
From: Vijay Balakrishna <vijayb@linux.microsoft.com>
In-Reply-To: <20210401110615.15326-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/2021 4:06 AM, Sascha Hauer wrote:
> Hi,
> 
> Resending this mainly because Marc Zyngier and Mark Rutland raised
> concerns about using implementation defined registers and I forgot to Cc
> them with the last version. This version, like v4 already, should fix
> these concerns. Looking forward to feedback.

We aim to revive and adapt this patch series for A72 and A78.  Is anyone 
actively working on this?  Please share any information on why it wasn't 
pursued and thoughts on adapting it to A72 and A78.

Thanks,
Vijay
