Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4753DAAC3
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591849; cv=none; b=KD1zjk02WUqitO4LISX641SUxSx8CsgY7f/2Ww9YjqxMecAxf9Da2HuvRnkhYIt4PDyfoCw5Rtf5K7oX3yszIlnQd/zT0zObSK+yNVmWQviNBfYRLp6VFiKFBjdmCYovXqnsr03wf7nS0r/6a7NOHVLlUZNHTVIJvaMoNCSe31I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591849; c=relaxed/simple;
	bh=zqIZgn7Zgj5WSQepFgJtQ9GMMyKpvR8InLxOiqTa/8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c8NUzdIivZxE71iQF0LDoDFxdT/DA1V4IEVCq9pQ0fXk88uY0P8wqzwgi8Z7PT3//ZY7cDzVVi23B/szDHTF2DWJoedJZ8Funv4m9Usb8IPCDqt7UDvxMFUT5/aupkO6Ra++gw0oYpCqsdvyhNEBuApxaTL8Mj8UwWns5WzCxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsSYwLwK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsSYwLwK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2672336a12.0
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591841; x=1789196641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=XsSYwLwKu7HA+M9qQDLAv4qyhXqLO3Y3B2nrMauWYL5U/x9gMoPFVblanGk8nChIvd
         le6ND8o0ZGm4oLALDhgc8N7ll0NDm2ZuPPkg3BJ06DJiogDlzQZ7zgsVhbbx8LbTWTMz
         mJUu/Jy2EurM5VuMdsk3Uh3EF78ZdYkgcASPo4/iFhmVEz3GAbWH7dHmqsvIEDnJUq5t
         lb/gNVUNWETamXJAzcASXkot7DuMJvhXDEsA1GTzHxHbB2VyBuB5mB8CDW0siMQqovX/
         k/fP1XF6rKWc+9P18y9oJQoOw4mcO+2An2bQ56vnNdwBBSq7VrcBgCOkAHtz/ZsR5Mq9
         3s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591841; x=1789196641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=Wnekn0BLvDozr8ZehHWaiVzInflWoIvJYXcJPdQa02dyoX+YYDotIprSXCEEFBVsGN
         NKmlYN3CmHKWXE+zXDe9BoeIr+2DkiF4s738iCm+XLoM4ydvz9mUW+5hoWZP1n1dXQOs
         +SUk/FPvw3C8a7fl/ot6R3fVNUlANTu+cavYpJpOWFBZd94+Q5/CR7BJIQ3pepl6gFz0
         qL7DAzl82X/3/y0JhXeC8Z/pF7RhTZxywEscskjd1bUsfUokAdd4JXabsM/JdRcti0Im
         tcWn+pPDmGFleGS0KxLhsdpJMqVDUnYFKOZvG/yWMdZkOBLdimZEv0IlkzG2ZIIP76Oc
         vesw==
X-Forwarded-Encrypted: i=1; AKwUvBzATVW+UKtm9dGJxJV5wgfiqz7KViJUWwi8wFEsYlDmnikDtIIfdHIzniZfDl/RL3Ew/N5QdLl21t0A@vger.kernel.org
X-Gm-Message-State: AFuF++mnr4Xcwm5pV0hBr9kLJ8t9aTP6MzyG6SqeD8L3VFlwJkpApVJf
	1H56DmNpcKhQ/l1RVkD2bbr0SCZCiMC6hc5mzk7dhmzbMbxvlrP8JWgJ
X-Gm-Gg: AYBFou2vlYoCHC5KVmxBmJrtPLki2seMcxIELq9wbLhby6qB7E4JVOhjzjlNDUejpIQ
	D02hfDc6pbdxSLNuJ1Jgk8JP79IbJuoA/WFeq0OK+u0heZzv/f2M6CRIfGnNkpbWS1SGq467wj/
	IAiMYLXDAyzRw3rEtzRzQimcfw3JQAitm5v+vL6QxH1PYiOiMobZiDWYgsZOkmKDlIfT9poK++x
	fKAFETA86ZKjVx9CiNdwqC5GpUetwFw4KndDLGCA68kQX/wZDsdX1C/Yh53rZctK5rToDK8gGE9
	2UPMyU9CamVeEOncQ55fUK8jTLTvcn0qpn4GiTGoY8dvn40u4HIh4vM2NS+euYxoK6VTY7Wixlt
	StHXnH/jHpiqoEWIEs91vjpXTO8XcT3R8J0Fi6KTWnYSoOk892Wg7C6z+CFM98dkZGAZ6k222+/
	6dOIGjEf6PcwrJrKHqE5tfcQT/N3embE6mCnP2JdbqdQbesutp71D/mRljlJFtav5jrirZRTD42
	ZHWJ0eyNi1Q4l26g2H5t/fJru78wxgQxSvBN9JxAZG5YEQC37spJ5aVS45jhl9iQLHNqwOscU1a
	WcaQ6HFFQft8hX4La+tfo8NXcZ8mQK/co9Q2zgqfycULcrPjJX0YChH5TjHYjuNu+jJUGjmI
X-Received: by 2002:a17:907:1c9f:b0:c26:1691:b374 with SMTP id a640c23a62f3a-c261691ba04mr359894966b.45.1788591840842;
        Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 09:03:41 +0200
Message-Id: <20260905070347.25902-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0

