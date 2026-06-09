Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC301A6823
	for <linux-edac@vger.kernel.org>; Tue,  9 Jun 2026 05:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984786; cv=none; b=FtEzoto5GdaQ4pjCgnU/tM1dS0P+YJdaz5dLZBFNyD1uvB9uWJvYLzGuKfZBwXiUBAGIYf4ApoZd6yufZVYxVoan/pFx/lTJLg3VnBGaXP4JOOvWaLDaXVvX6lUKj6M7JqAkw9vCrVsAJu7bJUu9IfwHNpXXR7mp7O9geryGUjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984786; c=relaxed/simple;
	bh=pZZKBX9B3zBLVLIO5fCgH1S3Z7kQaVQtFcDmSUiDAcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnOgi/u6QQHU/EPoZdcAWvGxDQU55pU0e1386AgHPG78cbe0EjawZQ7yCTJPZDX4Kr6LP2LIs+633Iy1w5GkpUfJDGt2VwDD04jvrbT//Zjoqab3zC+1DiJm8TK6e53tm0WuYMOijoU8P5T/nLGABQYkzUlrIIh5B63rSG8DBpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMGkkdMP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMGkkdMP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso57544155e9.2
        for <linux-edac@vger.kernel.org>; Mon, 08 Jun 2026 22:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780984784; x=1781589584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VRzKnh7wXlV+i/kp57l4JTJawSwXoELQ/JZCCsqIrgE=;
        b=WMGkkdMPrnt1IZ2qjJIJIaMQfpEc3SLOQ8XA5ilVUVU6PH6xO7kSSoq2udcDQpi/Du
         mU2DDD7dqKwsGgx5TUl8AgBzOlPTHYuby8NJk0tZEmlfRj0xuXEhcvkkdXwQ5y2WDMJk
         131qyemyZh9J8uYjo1j9UNY1a92ltHOuS9nox/KQmJLg/0hFHeB2oCD+1aflpDKzQkOr
         I9B8xbx4ckKKe8Aks9blTNVtNJvA7Vpn7F4nb1PNwoUveTlLsUBldOA5XOE7vTW7/NSF
         qtvB7aCAi9RU0rVsrxwmRJOvlujKpZEu49vKvT9KBCRBbDq01Z6d+scNGNeadr0wKAtP
         azCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984784; x=1781589584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRzKnh7wXlV+i/kp57l4JTJawSwXoELQ/JZCCsqIrgE=;
        b=KToYpy1VrMS/YJSqNbHdLjbYc8c39Y9C724ePU2D9r+/Q/wyp9E8sva+XP2z/OVqmV
         HwQy2l1BrCu7arnqCneadO3669cmR/hc6ydaDhMdp714zFb/A0gfCgi+ivjyOmoMGJVC
         scfDr9sn82MLeWjdAn4/g3Q4So3U6ayYGS0vTtTCfWbTbIIMD2/5HSiTWytwsZgKSJtl
         YXaX+rP+tT1+0DasBcpEjVJXDB6K28wu5cCOu824/E7AWdEexiBQS5aCXrAtWxXn6h33
         Gi+NIfSCK5YW33NXfuscgF0BbmQxbFFUStMl/w81j4pJvDW6WB7ASdzZNMop2IHviO1P
         E6cw==
X-Forwarded-Encrypted: i=1; AFNElJ/MpWjdUZ88DiOXly9/rEvdXzu4DbFLkSSg/X3vKdjqLekA3Wf9mZ/FbYOM6/OIJ6W9mrRWWtpnIZrM@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4e66mFE/WLYKZOL2i30xwap/smW21z3sKmteASxEKqbZnUld
	QEBFGKvnQJITkF30e0qYc+9KMmCW+df4fpkGZ/i/Fs2Nn5IP2Ciep7Xa
X-Gm-Gg: Acq92OHB3kRF9vMl4MAP35/fbVC5l5Dma/5NsBK3WXI6Zdsxt2dPtjl6pd2QGLfTI++
	V4ncjC//mtpRWGxwjM9o0L98QFFF04HdiB/OklA5k+fkzW/GUK9Xrkauln5rcDZ3Nugcu4vvy89
	kKkG99sHa1gyqkLWJG+90CUcmkBCfF1XrLXYG8WzLs4w7Ifzpfzo5PHB4WFyw60FiBKdFvlc+U0
	tbixvSvZYxNamMW4TTB3WkuHWDb2oXuH7b7jjUl/vv8E87KBC7kUIOX89Igj7pXxP/Uo1gCgprs
	VgyHLBn105RrTjU9BzDttozmd4cFeIck4J17o/KWk5uLBIsunZWCrWUGNGozMVIApkdTYRqNbpi
	7l5w+akW+QmjhLGYQRqtYXojVBMyMlrZEDWjW0EjOrZd3yIMY75PzrraXJh+AOpKBMqyKkhymZA
	/R9Zg33tj4YIM85jpHtve7r4LVANpLqe37GE4dtL2Sq9MOiOw/g6fGC0rsna6pMvQdVnq650loJ
	BV33KmkOttRZNebGsolzdeMXevNenMQTpYYt4NH+HjmByuePnt5u5PqmZnBlQnI
X-Received: by 2002:a05:600c:a011:b0:490:58ef:cea7 with SMTP id 5b1f17b1804b1-490c25ee058mr313921845e9.22.1780984783669;
        Mon, 08 Jun 2026 22:59:43 -0700 (PDT)
Received: from ?IPV6:2003:f6:f70a:900:3c0b:876f:c20f:d04? (p200300f6f70a09003c0b876fc20f0d04.dip0.t-ipconnect.de. [2003:f6:f70a:900:3c0b:876f:c20f:d04])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm45793819f8f.10.2026.06.08.22.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:59:43 -0700 (PDT)
Message-ID: <16fb1ca6-447c-42b6-b4f3-aade5ce7f90c@gmail.com>
Date: Tue, 9 Jun 2026 07:59:41 +0200
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EDAC/mpc85xx: Use platform_get_irq() to get interrupt
To: Rosen Penev <rosenp@gmail.com>, linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20260603191908.5618-1-rosenp@gmail.com>
Content-Language: en-US
From: Johannes Thumshirn <morbidrsa@gmail.com>
In-Reply-To: <20260603191908.5618-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the late response, been on PTO for some weeks.

 From what I can see this looks good, but as Boris already said, I don't 
have access to HW anymore so I can't test.

Anyways,

Acked-by: Johannes Thumshirn <jth@kernel.org>

