Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050431715A
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601633; cv=none; b=sgiwcDZzEqnu8+rmdr/FGR4qVUxaXPw5Ml+FB6FK/v05NBtAuuQ9Jk+l61urF7rHuB/5IzUx7BD4Q+qrB/hXvDH9+wf+OKTnRzmMlQ54XMBecWT2xYr0TpwwMoToyMIFrZV2D9uCoCCIOSgUbp632/tTd7+wdxI7xDjC97psd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601633; c=relaxed/simple;
	bh=wms6AZfW1NQQQYXunQIXu+RBL1p7oQW8OzJU4DE4KcA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dG5aC65clQjkk9PUHWLnq/uO1ZekM69ntZK1FbxW5uCni65g3Ql9PrvtsRI4WCdFVy78KahvUKq6GZmp03celWleks/ZRqnd4VWbtkwvSMadDUDGBbWgniHzKTcVg7PFa3QFjCS0TBCuHIe7awd48jUclLr6pKqbToPFJwVrIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcyV/pf4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcyV/pf4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso20983015e9.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601622; x=1789206422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=ZcyV/pf43STgwXAI/5E1vUviU9OzxPvlwZ9xBkSHuk8z8faphK803rSxpq/eJC8OKl
         6LvecwFRpi4fzbknFvlRyv7soBl8C171GooHBbDQJHk+hJ6aBRBz2mQOp7vz6r6hUGmM
         CEZSPjrBqyXMffgVVdqz3gL1JyPqc+yVX0PFj/3xnvq49w/rU0FgzPBKydB6TGq2d0zp
         FNs9+jT0+bzbJl4t7pUuRj18OIsTXOpNz49VTcK/VhwWq/Z2e98q+kp2hTLk2LsI+tO3
         VMknB1r+bRs1RJ0nhe6PSE7/XgwcXoe9+9W9Z2IeStVLcGtTMByOCuV0uPw2R3pFduR9
         5QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601622; x=1789206422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=smpsb8JOBusjbgQAd2oPbIwCCUd6e4LdR3MPdw7+GWY=;
        b=BYstJMfIo6rr9CYWvSJFQCurMiV2eSE+PPS+xWmXI2KUyXHt3tWFgoaXD0UvIMet9W
         4x5/oE7ENAOaVEkETBURt/wBWocjuKVqtnu0VuJ1LSCUVVcgrcCP8v39nd0h+9wQV6Ns
         oM7GK5KOrq5U64OUKBF413np6cSAMlU1xaBqFtjZ4ErjnTpxRn5tR8Gd76F9c0+niBtb
         l55YiDHlNobJLgYHHfRxbSgzpkWRUVcxwNWryPlsKeYOBirdYtZcFixdiGc48dtlSqPU
         Gm81rUubQJE/tYuT2BVm8cKuXImCVz2V0GCC/1OKHla417nw8JjYukqA797ffYpqVqPL
         9IjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm6sjJomK6KTASlj5spM5SA7xpHxD6IYCXsgXBCGGsMMJmxGDDm+7a/cTYqmaeJ4DUoSbAb5rHZqYM@vger.kernel.org
X-Gm-Message-State: AFuF++nrVn3hGREm4n1216JlqS7i2PmlW82n/Cm0VUMyj/BhDjuCTfP2
	Ff+jEx9J8cWngoLjqI3dUW2xjiZbMK+N/grE4N7B2MO7pNg0G7hYGzfL
X-Gm-Gg: AYBFou1h3zZEqzlYEj6gbyXEkYEWAIs00yGzpKlR0Vgb9s56+uaz0QyMxdDtihCnU8K
	fQ/ZqhgMbnNOb++iFS5rUAIfQaRGqxRl30pdWRSj59O/TnBKNhokVPMSHc4EOhKklzwnzp5Esw6
	nCVcyA7yAE7vJUKqgYOshqOxs3zmPSWa/e+DhXipd4ZPAsaeEfRU43t9lbBfaOMeKBJ/15dJDwS
	1wVkxphe1tulKHoH8rdHifXYNjtylyu4/1sbd3f2XLohHVE5pN6lGuJ8jdK2twzrrmaXrzJfOjL
	nk0pWSUMSDDBsGsFJHj7WedV9miIY4AQUEv4YiD/ZY8dQPXabH7LZV1j9tOHJ5XsrtsLX4BEKQQ
	QJi1ln5LwWjM88prWJWL4jshO5PUeoqbGVBFNnVzZCMbVUyjlJa2mF0yBUuVKS5qb3cwwXmjIrD
	L/dnfbL1xI38rt3iODsB1NFqlKT4dXMbwf+CSQdgMFASQh0OK+16HWeJMVojZpooh83s/zrZUn6
	2x9P6W0FmjtE/CSH9ATm/E3ma+LgxGsvtJ3B+71WQjNOg3vLrt3N1hGe/jpRGcvNuVAP3hn5EVb
	D4/ZAsDPB5ADtWYEOX34aFbAT6gZlVoSuXrLsoIgfH0vBZ5DWY0TZtGXaADfIyLYdVA=
X-Received: by 2002:a05:600c:138a:b0:49c:fc6e:8cba with SMTP id 5b1f17b1804b1-49cfc6e8e34mr84919655e9.30.1788601621962;
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
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
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 1/9] docs: kernel-parameters: Drop the atarimouse= entry
Date: Sat,  5 Sep 2026 11:46:41 +0200
Message-Id: <20260905094649.41996-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing in the tree parses atarimouse=. drivers/input/mouse/atarimouse.c
only takes a module parameter, and git log -S finds no __setup() for the
boot parameter anywhere in the git history, so the entry has been stale
since before it.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Michael Schmitz <schmitzmic@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..c8d96de4c00d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -591,8 +591,6 @@ Kernel parameters
 
 	ataflop=	[HW,M68k]
 
-	atarimouse=	[HW,MOUSE] Atari Mouse
-
 	atkbd.extra=	[HW] Enable extra LEDs and keys on IBM RapidAccess,
 			EzKey and similar keyboards
 
-- 
2.53.0

