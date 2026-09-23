Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738AA38F93B
	for <linux-edac@vger.kernel.org>; Wed, 23 Sep 2026 03:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135256; cv=none; b=g2/253yjw4dktCXBBJQj4KXYe9gfFFrfR5ojD4j0nZN3pECHo1K2cTxH60DLe+qU8tW6tb0HhZVgq93KvwxvWpYTpNKYamS/tdYBtxXrwf4ZLRpAeP3HgF9vlqiX3BA5LQzkVvbx/QCO2vCeR9V0F9H9TV3oY19rCu+leEixp8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135256; c=relaxed/simple;
	bh=mds5LaoDnAhtJZjxPhR+U5MDg4hOmQ59qLngSFzyKpE=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KXhzfN+HjcLYq1X5RZQnyKNzmzbwgA7KlcFtaNLfr9q7Ghloxdj3+jz2rZaGsdNH3jNGmD8+0SEw7MazDvxtmlgR2IP0rrhOFD6n9Z11LEEMqvrsw4ZDAn0qaF6D8q5cMUjUDPAYaIpnjHSX9wajadhaRa3hWzX3yiA09YTkRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieXr2VkQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieXr2VkQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so4561285e9.1
        for <linux-edac@vger.kernel.org>; Tue, 22 Sep 2026 20:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790135252; x=1790740052; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n50NtDqLH91LeFgcnpR6M94/AjIPFqSlb81bC/4TwTU=;
        b=ieXr2VkQxRTUzccch8PhcXMUGfi28PK6RxRLc8EmF4M3u44cR+nr9p5gLn3m86Us7J
         o01X//TZeghmOv58oRA1O+vGz0zCDN4k99t8uwnqvcgwzaQDNk+h9NXXRHSbtRNnYmjd
         SkzIAlTOErqFrXFUrizlkoAKwHWXQjGwhdm7y1yhWu5fjbXsxb+URMR+CczhiOUH6sPB
         6hhGkElzNRWVPpU6OwYjwT+Nbv9+ICGlf7qeI3ODXKzM6QSsVNuB9T1SqAd28qDCjY6N
         wNd1UbXZsewOrZ0FXV+faUIUs/Iw/aPLTBc3h7lWEpMA2XGEEd8ZoynFjUIVkOx5BZT4
         AQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135252; x=1790740052;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n50NtDqLH91LeFgcnpR6M94/AjIPFqSlb81bC/4TwTU=;
        b=F5PJoZtnTsu0hVl+qXvpfQEaNGl+HOJ8VxqSgq4mVintBwglVxe/jqR56ot5RmRKH+
         0RUXCLuB5cOfU8K+PpV//CB32StMMwMrhIxMmGejL4nqJ9NA8Gxon9sIpTARdwz6d0Xg
         lhN/sNqDhjE5gaF2Sx3oeakOgq3p9bUoJDM7Aa4McrIwbkvCs+8Vk1LpARP0Hc2ywP8z
         c6Zf4BdxCuY7bWYoSz5i+6lIavx7qLLLyL47AnHgCVJV51QbrQUZPjsCl08YzKeYgFgC
         JgKOAIKR9K+xN8mf4PRsRgt4NSTikiwz4NefnFMtbpK+1ln6b+lhS1n5CdTs8UNlZrEB
         0SDw==
X-Forwarded-Encrypted: i=1; AKwUvBw1D1LBenE9aPDv8VHBa/rWIP5Z8/4y9Xq6mrjHQJZ7Xq80fzcseBwz044oKflLvg2vsXKHp0YHyUkd@vger.kernel.org
X-Gm-Message-State: AFuF++lZLhnBgnTsEEGUh4kPlx/traxVmJ0Ql85nNeMZJYH3/AN4S6Zh
	MHzWNEKrZbPtWQUGTRqFxQN6hC5q4xk4/Ce3TvnuAPyTbCFvOXDxZaDyC7h0l1Sq+Sw=
X-Gm-Gg: AYBFou1i4rXoGYfQTb/02ldzKKviseNYKmxvEo5Mg9RPF0ypHoB2ePWEdrwTHdsLJOW
	IkRz4PQJcqg+qMxoIpcuwv3zRTzDSngQ4f6JhQoAnSdM9jzhkdJ+kGKafLFkQdjaUFf12rnImbC
	Lhj2ObqfVU2sITvSZn2NwJAA+ispZBjdBQwSlA0sl8QYP1j21HLGLxTxx0D2w984AoUPCjeM6Jo
	ebBIkXlapq3hGzerFy8vw458+9qkl9hYyFEbypubBLxCNil+VdJB/tAbhZ6WNYDFAsramqSJ8A1
	0ryeaRiPn8XcIbTK8JoLXXZJMqsYx5wqXthpAy9HwGp2IirT5ibAyQseFlUZkpDEscB2HVkrHBq
	0tWyX+BfnCY0Ts055whXpXx67q0r9pg90A56CMjB12k73H7vKd00EkbdoV6ylYd3yZa5ptB67S7
	aTOjW3DAIAYHGb2Nq+zNOrnA1Xj8DQDYM6g9LoVs4ol3vuAGO91003in+nHO8C8bColGGstkCZZ
	OAYlpLsGQheS7Uf3voH9VCf5l4HvM6Pw54H95mACqdkJRHw58A8k+uOw9aW1i7O4ZEur+d6pqQa
X-Received: by 2002:a05:600c:500d:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fdf139bb0mr13552775e9.26.1790135252023;
        Tue, 22 Sep 2026 20:47:32 -0700 (PDT)
Received: from [192.168.5.15] (brnt-05-b2-v4wan-169762-cust1351.vm7.cable.virginm.net. [81.101.101.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a3b46sm39159965e9.11.2026.09.22.20.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:47:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: RE: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical
 operator style
From: Bryan Chan <bchimhim15@gmail.com>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Bryan Chan <bchimhim15@gmail.com>, Borislav Petkov <bp@alien8.de>, 
 "open list:EDAC-SKYLAKE" <linux-edac@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260922231854.108188-1-bchimhim15@gmail.com>
 <SJ1PR11MB6083B6CEC6BA730C18AD450FFC822@SJ1PR11MB6083.namprd11.prod.outlook.com>
Date: Wed, 23 Sep 2026 04:47:30 +0100
Message-Id: <179013525089.122719.12798013417319991127.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-09-23 00:20 +0000, Luck, Tony wrote:
Hi Tony,
> > The code works fine and works how it should be, the fix is just for
> > uniformity/consistency of the bitwise operations. Also fix the compiler
> > warning.
> 
> Details? I don't see a warning with gcc 14.3.1
> 
> Which compiler, version, and any relevant compiler flags.
> 
> What is the warning message?
> 
> -Tony
> 
Sorry for my mistake, this is not compiler warning, but warning from the
sparse, here is the warning message:
drivers/edac/skx_base.c:359:46: warning: dubious: x | !y

The command and flag used:
make C=1 W=1 drivers/edac/skx_base.o

The change is a style fix rather than gcc warning fix. After change, the
whole operation will be bitwise shift and xor, instead of bitwise shift
and logical (not), which increase readability and consistancy.

My gcc version is 16.2.1 20260810

