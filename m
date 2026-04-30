Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E023FD15C
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538714; cv=none; b=RvXsSHPsoEW8WGyFGLkqDunA28xcjQWd2N566St2Fa0hn9nTzBjnwr3TGIa/7Vtza70+7lrmvxutD+BeTpPk1wzli9x8AT7zjYTPEpe8X5pfzMvyphJ5rwqyxcRE/dQ319+5On6WDxcNdfirR3XcMJDDYsym+iF//3yUWv/HUXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538714; c=relaxed/simple;
	bh=CVM0KMyaJBA4Ph2OGsjn6k9KlgtGlUoxnMtz5AQn2go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U4LQC26MJUtJ22YZ5IzeLDJao4p3VPDTCb3T6jcFaUYeRsjdUvZnL8FoJQVDIHlfhQxOzAPI0P1tPselqQJ0IHkkGSr+iRSKx6oAJTWpQ/euZs4iemVV9guNi/3hXZqAM/XgeHNg3HITTtyCGNQ3BbZwWi3e9O4UsRPFAF4Ck1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uei7bo5s; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uei7bo5s"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-364c5317d67so381739a91.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777538712; x=1778143512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pESvpfIowOzDAN5Pnz4q/qVOEDRZg53og9gjUPZ66M=;
        b=Uei7bo5s6JQwS9CXguQm6J88DnfqwNjwR57TS33uF4A3A3VEw0Iccnev2ZtvTdA6o7
         rtbf4TwOE0RnhdYzulgzM1xDBcHxtjJT5xYXe+gPeASoufuaunGfqVpGwpXcHJU6+XBB
         ixyCmdn7IWpGZQ8Bu3XvWDVqZ5V0DiHdyZn/5+qxk5eju9v0I6nbWmZumVPQRvNfrwm7
         BfEX23Oxbf9iiQ7qSCqhecofyl5b9mDSqbHtZLWVEeGQOEr/aEnNBqhBcOEFGKfkaxZN
         BNMp+MYtvi3BeV0YhAs28aBswxB5H+PR6XTuks0u9BnhyplzRPFRyT8quhFhagKSKIzv
         u8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777538712; x=1778143512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pESvpfIowOzDAN5Pnz4q/qVOEDRZg53og9gjUPZ66M=;
        b=Gfdf0HATCRPUtOYWja+2OE0GNMSoM8xvuNNB1TWzZmLdhUhRO2fxGbhMyOGqE5oB6v
         +RaWBt2dQ1Hoou8fLnUhCOd3hgxC53jffLbnn3jX5t0ouNBSRaNGMQaepEI1bG7/4kRi
         c/wxjizyY0uc7wkESCJxXCZcJ9dIqXDC90QAS8ysPb5Br9DA5HatwfQnKVQrpTiFK7XV
         1M+qt3wrPxzkPUtO5EoDZzhZmvuDi7s7c1SDdJIpRx17tZW2joQP7j0SNVCijUQvfqId
         wdW9OBrv/RvM4PrsHEAMt/zjXOM+XaFZxmQffk9/tmPstdLUe+lno2hz0eUandg13SnL
         9pzA==
X-Forwarded-Encrypted: i=1; AFNElJ/Nn8osfPJe9WahNJK5PNawilqFfmQFJ7UwKnHHt35QXAu4O8RxNuodl0q6BaKeHFHK806zqjE5l6VH@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ0tGVSA81UuwUpW3+IqF9BQNogeKEsB72PAIAigD0Z8C3TpcA
	qKF2KA8DUjWVprq0pZMMs/G8G/UBP9DUS+0b9W3aF4rptCUTH2TGYB6X
X-Gm-Gg: AeBDiesZMOaqj6MvqgsKCeWOn52xizWHlwv6di+ZBJFGuW2LSUBBgOSgAvzrBGBTwWO
	elpeuaI+T9Xyqqt+SKB2GYqutZIUaS+i1EU7Ce2ssBfsvK0xV8F2kD+duFqW8hoDsS02eXh7rpA
	h2ohn+xvu3wrzorLxZbnKQOfnFNGKUV5b6npmaQCGyqAAEDUtN3BMC9XGlgh6zaDl18hSpnfa6t
	y1XQWo43ifC2JM7/My9ZY1094+UF2a9fkVtymxSeQNfdLqQojemYYzw9FuuuTEsfLQs8jzlby8+
	LwSBxQIBR9wf8gL5GI8RWzSMrGzwqsGE7X4zDDJBx3q7TA3CmMPNr9mmwtkl2WIX+QnnAkxrOdl
	IrXXMQab9uq8Yns3WNuNoI7Iv6LELdt64av4YIprZjvQvj+I+YVRTG8rYng1tx7GSh/wTgtTXwO
	rgI9/mqtys3biOeGb+J+VZqrh4VVOGCzd69Al7DQwdG6QaXVSDGhnA3HEGlD0T7eSyDk9fKd8=
X-Received: by 2002:a05:6a21:338f:b0:39e:f994:f697 with SMTP id adf61e73a8af0-3a3cf5ffbe4mr2381697637.17.1777538712174;
        Thu, 30 Apr 2026 01:45:12 -0700 (PDT)
Received: from pop-os.. ([103.100.151.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd606a079sm4133130a12.12.2026.04.30.01.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 01:45:11 -0700 (PDT)
From: Tushar Tibude <tushar.tibude1000@gmail.com>
To: mchehab@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: qiuxu.zhuo@intel.com,
	Tushar Tibude <tushar.tibude1000@gmail.com>
Subject: [PATCH 0/3] EDAC: fix error reporting handling during init for
Date: Thu, 30 Apr 2026 14:12:20 +0530
Message-ID: <20260430084223.9298-1-tushar.tibude1000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For some drivers, during initialization error reporting is enabled,
but not properly handled during teardown or init fail, and this leaves 
it enabled in the register on exit.

This inconsistency was first identified for i7300_edac.c and a patch 
addressing it was reviewed: 

Link: https://lore.kernel.org/linux-edac/20260429094806.25097-1-tushar.tibude1000@gmail.com/

It was then discovered across multiple i5xxx drivers:

i5000_edac.c
i5100_edac.c
i5400_edac.c

This patch series aims to implement a fix for each of them.
