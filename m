Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507086;
	b=0pDLL4q4UMBtNslZ2uD1/uspERD4RlLx+EjUmqbPLGy4hWePjLo0sAAf22TIxsnxWmuB
	 9qBQMHGNcPCO/VS7W9c9t/aAgd2Knj3zY3CNqEyBA9GOFUna+x7YOoFcP78pLMStToZw9
	 WLphEZGUbrNJJzf7jlU9z6hDTKoSqCo/ch1VuEIz+4l6Y9az4ENWnnZKzVou1t1BwyaZr
	 xFcU9kp39NllH59na5Vo2d1Svk/LAUMJ6ycI8Za9a27niU8rakss++fkmhjv291eOmuF7
	 d5Aw9gnwrALqdp4XhMh9eQmgj/N6oPEsH+RMPyoYkiwv9g51w7ZopZRR92aXjwKIMgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507086;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h3F/2mZ2taGXkpMtbtIAiV+m8bah+vcbwSZcHemW22I=;
	b=Dosb3weUZo1/aH1Hfzl7q6gSxo2JXMi22ktTncRbWltxjvS3MHwzR8R7X0dJ5KIprN+O
	 DvyFyH3oiuIajAMXrSQ9CMPd5/dH5O2rOSxDY4vVUR1de8fbcsyUkSGO2lGgzpDepoBcj
	 JdvHAXQ709SMQswTdHwwJKhsAVbFjneK3XwigUOsaAf5a3EtQ+W7wCw+7MK4//wtsip2D
	 RnQhuVt3Vtw+XcZ6KjpwOz9/PUoXYyLhQIjpwi5bNSeOhBCB4ZrThjlHd1pT5l1kZP1XV
	 s3GY7IAdOs2kKgUM33dlDZ+gyPGQqxwXMH/Jwo/Kfrka7+avckaQU6w/L1n4CCS5hgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V76p3xkm;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00836606A321
	for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 18:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00836606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V76p3xkm
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so99926eec.0
        for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507085; x=1795111885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3F/2mZ2taGXkpMtbtIAiV+m8bah+vcbwSZcHemW22I=;
        b=V76p3xkm/46ZSUdU6l+M8k14Zk6kK+BM6b6JdhDJ9ccgYu9DviRjsfmv+nBR+OXvJN
         EvAbsyIUk3zfxLbZ8+tNgfOPuZob3Pk0o3yiybl/aLi7m9kYa30ZdxdNdB/WaBFAC1nq
         KTAUXv5rVWFZqYHw2CzTjKkxQQtdgusVHGSHEWedOPoTfOy/yOOhQvGuXWxFzoIMAWKX
         hfxdd0Zdox2KJteMi181hwXiMcHAvQzbD0yiEmpUlZQianqNUoyeZo+kOTfvWVgrI7x+
         bnVfrfkDbYz1Dhn6k4+q5u5bmaUvDaK4i6sPDXpoR1Ige4Ek57b3RGg9ZJTjc15yA8TW
         co0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507085; x=1795111885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3F/2mZ2taGXkpMtbtIAiV+m8bah+vcbwSZcHemW22I=;
        b=1dcvnGgZvYl0Wbtfkxr+9mZpVBiY1dJihy8unR5TX+g7P+TvPGH6l5mn1on5OcmorX
         kUff9dc11fXYkNFYLQJDErj8/cUEBqWqwxcTCXSsxtoiFhamMyOMWlwZ/srci9WxM8Lh
         fLBXexHFHvgRa+aHMFajY/LRKOJRQ2/8lwtLc17uIofN+vJ+Gu4YBSGotLxZN0JIRUQ8
         VUaAXepMSHT4DhP+xeRqgundXjN3FO4Y/aIpK5azwclJILtEvkAEqu+1rclg3ZQCULu7
         i2/C7b07A6w3ptCgMcWvp9IBqaM1U2588wMeaPnZlDj3ZKuVhix6XKX7e+x374t9XgOR
         0jtA==
X-Forwarded-Encrypted: i=1; AL+hErHJ1E1CUny9ZlHcNSCKqOw9BNgZN8Swf9VAof6+v0vbtLwno9lclcRE5h34EUVRs3U4dUkpsjOPecvD@vger.kernel.org
X-Gm-Message-State: APuU4Z/QLL4B7oehgu8tAHw41alNUf7NSWWNygfzW3dQX7mDVezQFtzS
	kAVqS6K1lnpWdzsmTIkWtQt7LEc+eB4Er7iLPicsV7UNQ+xuv4ZomRE8W6MN0KlR
X-Gm-Gg: AYBFou2GKqW12roz3lPaF2kOAOysgRVSOVznPHsiNGDFsx5EvE21VLmHGWAItEYfDF6
	+ZmM/1Y5hqE6mrtLM5x8FH6yXjRmKLyfaWUwS4STR1mvty/GfMM4soSNVf4LLC0BlgP6rZP/sJ8
	IKD4z1GyHVu/R5+xJcpl8REFBFHlyZ+R2zyQN47QaX2tJv0XAYXVkNpUsJoR72tmFdSDrh6tP9s
	r4ucgoWINj73sEbjKjtNKDSrSz3MJRJUHrVhlUjcEOpfzaNvA87ODErrNVgG6+n7sLOBKuWxVW1
	TAjLiDE3lmvyUWmqsIJ5G2BISbxMGae8n21o+Sh2TIne/bi8BUaXkN20U5LTGpmBmxYyQRoVb9w
	o5WlLtIhkP9bQwTlV0qdzoSX4jkz5EctOAQMlkyaVUNKnlUb8yv8D2KClf3LgCdYpXJe3h0trAy
	gETwZzxAGUywkc55aRm6PnybafQerRK5brAoWz46/OT4nGcWNcgorMO1aeBeuJjfi6cI4bT7L3O
	UUdvyLobXno+Ox8aPB+giyOU4jhaXwHTePuTmSMgYTcvRHwABGVXu0cyJ/UVUUCRYK+FMo7U5kX
	oTNzxgmRcRIbxAHJ6DkctVQYdh+Y74Xjbgvusaf0Xw==
X-Received: by 2002:a05:693c:8115:b0:36d:bcd7:2347 with SMTP id 5a478bee46e88-377e093db88mr2800214eec.4.1794507084838;
        Thu, 12 Nov 2026 10:11:24 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm215678eec.4.2026.11.12.10.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:11:24 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2 0/2] EDAC/i5000: Fix the slot loop and re-enable the driver
Date: Thu, 12 Nov 2026 10:11:19 -0800
Message-ID: <20261112181121.565824-1-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2022 i5000_edac was marked BROKEN instead of taking Aristeu's fix for
an out-of-bounds read in i5000_init_csrows(). Nobody had the hardware to
check that the driver handles both single- and dual-ranked DIMMs [1].

I tested on an HP xw8400 (5000X, four channels) with v7.4-rc2, KASAN,
UBSAN bounds and EDAC debug. Without patch 1, UBSAN reports at driver
load:

  UBSAN: array-index-out-of-bounds in drivers/edac/i5000_edac.c:959:20
  index 4 is out of range for type 'u16 [4]'

and the same at line 961. With it there are no reports, and all eight
slots (4 x 2 GB 2Rx4 in slot 0, 4 x 512 MB 1Rx8 in slot 1, both branches)
show up at the right branch/channel/slot with the right size and rank,
10240 MB in total. On 7.2.14 the same holds, also with 4 x 1 GB 2Rx8 in
slot 1 (12288 MB). A two-pass memtester run with the driver polling (two
DIMMs) saw no errors.

Not tested: two-channel boards (5000V/5000Z) and error reporting, as no
memory errors occurred.

Patch 1 is Aristeu's patch as posted, plus my tags. Patch 2 reverts the
BROKEN marking and adds me as a reviewer in MAINTAINERS.

6.1, 5.15 and 5.10 do not have the BROKEN marking, so the out-of-bounds
read is live there. Patch 1 applies to them as is.

Analysis and test kernels were prepared with LLM help; the tests ran on my
hardware.

Changes in v2:
- Patch 2: add myself as a reviewer in MAINTAINERS (Boris)
- Patch 1: no change

v1: https://lore.kernel.org/r/20261111232529.407154-1-andrew.luebke@gmail.com

[1] https://lore.kernel.org/all/YyxpbRkuLPIcW1Om@zn.tnic/

Andrew Luebke (1):
  Revert "EDAC/i5000: Mark as BROKEN"

Aristeu Rozanski (1):
  i5000_edac: fix slot number passed to determine_mtr()

 MAINTAINERS               | 1 +
 drivers/edac/Kconfig      | 1 -
 drivers/edac/i5000_edac.c | 4 +---
 3 files changed, 2 insertions(+), 4 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

