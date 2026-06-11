Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7B2FD1C2
	for <linux-edac@vger.kernel.org>; Thu, 11 Jun 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781157339; cv=none; b=rJ1COdSdZ3VaSvH2OiGy6vTgv6ZS6pB7aqqeSoJueUZFieOKF4VlWfNxgpforVrvBP6+pOGerRSmgfAfzr+EpUmb4k4XJ4MhqyHo5x8yV2jclnKRmQRhewVT+IhtnpuEdFYEF+MwUkGawLA04yrGlKqUf54yN2bRoZ9mc85TLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781157339; c=relaxed/simple;
	bh=RZLVs9T1UdW2y8HpUyFYf5GXa3yfbC+pcLXe6YbtxQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z7gqhb+fmdRyHTcV1cJNn6YlWyxUJ2IhUkXWjBrVh3uB5Dbs6jls8UmZxklksVOHWpmbhHCNary3NDasNKWjiAHq2V8GZ+A+ntbmmmdFzDpSrZrrNjAbo9IrpT5necRitQ8MjxnJrMIKmiu5TrUS0jp2ec8Zhsyfwy6UKgs4k4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfJxd1Tw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfJxd1Tw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-460166910e6so3956676f8f.2
        for <linux-edac@vger.kernel.org>; Wed, 10 Jun 2026 22:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781157337; x=1781762137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWdU2/6rdccKg5f3mh4EJyd2JjLHq69/yRD28gSbdGQ=;
        b=lfJxd1TwtQMHU9gFlWMe9MPWnyOJh4gTj7VdP68ebP0ydgq1tCSa+B39RaiLwDcfyq
         X32cwtJYuvn+K55ierEoRxVaHRxNTwPRevE4QuZpsZn+V5VCRmEjlQ2QbS5Xj+NNlyW2
         dNH/VvCRDzgrQJ3/Sxy+4T/7mbzSKF9BQomZNplFsFvwyPjiw2lXTgOODgk+XSnhE+qj
         wZFb2HudpvwP06KHONTI9PZulVOENg88P2Bkzph9LU5s4IfnW/FDNSfSh6oNZMnDVYnd
         3bue68MMpE3JvQjbweX1rp/xuZYGZT9mfIlrxbpjkQHVonlb1gZSEaZ/l9LP3v5AzBsk
         RhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781157337; x=1781762137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWdU2/6rdccKg5f3mh4EJyd2JjLHq69/yRD28gSbdGQ=;
        b=bGe6fqfScDa06mXKiPenQP5pLeiUpMIf0ZOONTwPJYahQAj91fsFSdx07i4D9enMAK
         o1br9oVSJ+H5RLq7P2G/zPtOkw3HSuoIAMSTUbcfasjFr+T0h+LTCJUWl+tOM1VF8rCU
         TYwkL6AZDVQPUZeUTD1XbY4XFjabWapw1RXFP7QuvJYY+tH4BMj1ygkafJrppZoHAkFX
         ahNCGrfMx1qgCHNypwCnIZjobPkdopqUUo79sJSnDvAttBmkXGQ+OFomKg21FbSrkdWi
         FmQiXdpnHqgbf39Lv4APqYfNJgLeA9HF3FOhcPtH9O2Hu8nJLEPLKJBmSLriR7e7RLDu
         Gc/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+ijI+A4t4wYlHs9DwiUt/ld71UfF4v4ThQzDWRkF7ivFzWe+a5T8X7CbuWU9K+HVZsTKwMsXgb2ljX@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLPWcgAID878pRT7rmC4EDgv0cXyrV5dllF+MO9wzxreJtMMJ
	+21qrBGs9lsT/NSHlMpupLY5txDzxuCbY4HLcrFjLi6efClYQdbMK4WZ
X-Gm-Gg: Acq92OH4is1GnIVNoFC7sSgUCzLuWcstL3OOoxn/cJil8MNsLCeLGTrg7NRgeTMpKPf
	3zFnfVGK4u0X1VYAAUxKVct2oQQXQlkUhqpR7/c8xNQXr7kmQJcgZYjWY3/6jtfV+XKKVR7XVAl
	3QL4lc2ILlKTwPcEHEJagk3gt7tPy9aV80ZmJ1IAs+EqjA9eVR9bWp/C0VfHPtTuVUIVrPJGJHM
	5DkqTI5UbKuc6tufLA3AR09fY0voYCYnf9YajXKo+UOVOm1AOUvwNmBc8BpscdbftjMO+Hg52XS
	ju7uQB3ZDFZjP0jGIhuYs4oVOi5QoFIqa60IF7c+OQ3bJ5eWlpefdIimiPjNXQZnFHKEDKuf/Ya
	7Q/CEjTfbF0XCTt1/sq1RfFimKKFoxPfGNkv0Tg7IcXTdNaS1Tj0icDqwI3ImYgGDOn5u/542rw
	2/75uEk+gZhz0gMBHzi+M+8+1M5NLGSql9d/pBCfPGHWeXNQ1HXcZZ8QM0YJH9/Ft3KMOWluwrE
	295bTb8N408fKcLnZJqglcZFwsLXp66SOY44XnHy/3OE40ZsPiQWqzMoRS4qOzLqJHhxIkwrrg=
X-Received: by 2002:a05:6000:1ac8:b0:45f:1bd:a04d with SMTP id ffacd0b85a97d-4606757681fmr1888429f8f.7.1781157336541;
        Wed, 10 Jun 2026 22:55:36 -0700 (PDT)
Received: from ?IPV6:2003:f6:f70a:900:3c0b:876f:c20f:d04? (p200300f6f70a09003c0b876fc20f0d04.dip0.t-ipconnect.de. [2003:f6:f70a:900:3c0b:876f:c20f:d04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm76129023f8f.15.2026.06.10.22.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 22:55:36 -0700 (PDT)
Message-ID: <ef8107c1-92e9-4540-b88f-0191d1b7a4e6@gmail.com>
Date: Thu, 11 Jun 2026 07:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
To: Borislav Petkov <bp@alien8.de>
Cc: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, open list <linux-kernel@vger.kernel.org>
References: <20260603191908.5618-1-rosenp@gmail.com>
 <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
 <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
Content-Language: en-US
From: Johannes Thumshirn <morbidrsa@gmail.com>
In-Reply-To: <20260610173352.GBaimgACY4q6PkkkUk@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/26 7:33 PM, Borislav Petkov wrote:
> On Tue, Jun 09, 2026 at 07:59:41AM +0200, Johannes Thumshirn wrote:
>> Sorry for the late response, been on PTO for some weeks.
>>
>>  From what I can see this looks good, but as Boris already said, I don't have
>> access to HW anymore so I can't test.
>>
>> Anyways,
>>
>> Acked-by: Johannes Thumshirn <jth@kernel.org>
> ... and Sashiko has found a couple of issues too:
>
> https://sashiko.dev/#/patchset/20260603191908.5618-1-rosenp%40gmail.com
>
> So, how about we orphan this driver, considering that we don't have hw to test
> it on?
>
Yep fine from my side

