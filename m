Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924333EBF0C
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788601645; cv=none; b=Zq3du5GQ5RAVxDa4u62G+p0A68yzOw0mpJlHxWr7si8QKOAnBFc6eI01AtPkIPIkBVQVSHK/l9Y/npEW68mGGnAZfUVvlZ0Ca89pqLn8xfGGow5mnuLKywcrAERxnkvNgZXYuAi1eGKbTqX7rMlYcR6w8vOp1AlIz4cksPWO5cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788601645; c=relaxed/simple;
	bh=iIEWAYVGI2FzX5iZTyH81lDATptMQacAG0wTPy+abXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ms9KNF/kaSXZuywgBkkAsiwj6gkMz3uQB/3SGGdAMWp3Z+FgYyUEdA4hcmI0qI2PnktzUJHp15lZPnUjFwg40X91qSJCp9am5/c6tqivQzS+lDRNK/KHZG5S3NgiZrdRcXO7kT8+YvlHvBKBIO1MJVV4MwsCyNAQLIJGKB+y32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyvrpKrH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyvrpKrH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843e397f74so2283227f8f.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601635; x=1789206435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=WyvrpKrHJwVM/8ZcX1GSWFju4g14O4oDahiOI0OS+wcnypQuvsomCZxxoNsngGdcpS
         iMNMMyLbpjtmvW/EWl4iZ53rr0WuVL50Je9Pi/ewScX5oXjVlbyTy66vsM00pKJDHekp
         zbXJPoTpg2PVAHDnNeCDSEqB6+IXMYfMRVEYlxkySrV1FIftT3xdeKrCHXTmz2dCvBqi
         G7Nx24hz/S/2cGB8bDg0xlI/4JzXD2cIxs27X9WE+cEHW97xbSD60x2O4TuuUiiEtmMN
         gLz7tKdUexx74iuFiJ5OWz548lW326b3vnw9JZ0uUDJlkfikeabOhE0wjsV0JZs8aZoF
         EjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601635; x=1789206435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8xnteEJpCubomPwB6glv59IEZPm5BMjzUqWSxe52tsE=;
        b=lCCjMH2j6RH6Gl8Yv2gIXheJWADHyx6qt1hlZuo7VBkk6KQFgvc1Cdwc6wha6UgKfU
         +nkEqVyfuRv6XQrb+GYvCSj60n9HJ+Ky/m45vlOkJCe0lcjpysC76YSpZQjmkVDrS9IU
         DTSjST+9R9IwvUJILsG3sD+G1lYzg7TFo2zmhbu7lEfvSMbv5+dFj4p1wA9dOFmLSym0
         zH/MFBt6iQmx4hHmyKjaGCYsqkZAOszNosRAPsliNVvjH3ch2ikC/JmwAVMujsK5vDea
         Am6QFXlqroHjCjvCPxRc17hruYJxFHJv7zzfkcfgLkixOchFe2TRKj9JmW0PvqzrXPFK
         c1Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzLDl8uy5xhCUMWRFenqzn8nC65lO/dpN8/xW8kq5SRKu3DqhfEo2kceJwSgfkaeKIuf8frAjADbBgF@vger.kernel.org
X-Gm-Message-State: AFuF++nAUqIJoV6+BEjEQD94Jg4s3PTIxSDfOCndUJcdIH+6WdKYqXxB
	Dr/rAauhCEtf0eMsaDteRC5mAJljGeXJeNms9xAMmSq9/OEvR/saViM2
X-Gm-Gg: AYBFou1JjC8ZbxmpHYc4NaOJi0d9i9kpuQR9xWg9Jqiosf9yy53stIIJXgwSDNndga1
	qe7BJaXvRg0zd7xDUvt5tJW6et6vH+ciXJ4sQe5ynVcpv+JVsC/xX9FV9fDN2VRbUj5pMCo1irS
	RlP4Xetmz8z5Loqz7jUJwFsjIxYDKe/id+XuyKt1ZoPPBE0X0iGDNHswnn0CqeEasqMZ8Iiy+7/
	QWq+qPiywf2tG0IQaqxrQsriEnO5JUsy3QnRBN7qhNTuW46STGPG1IrZ3bya9NvKFKuEjT+77Jy
	/31ga9T9EWS9HRepvQ9CNrsCAPn/a0mTWb/01F6pINKVktj4FRuS4oHRGgZow4cWVCucEbrIVSf
	yVZ58oVMwtilol9CJnwUzqH4rEgFbEpXYLpPi7mD1pUpYw2hEfj2Th8Dck9tIRM+rv87i4sHLED
	lBlEPverOzxiDMWObHV4qinGQ7439wGZmQ02xZC2iltG3Z/rdLBqmIL/Mqh3Q4olgmnwqMrtOki
	p/vn+zRH32Jsdrxtshrai8IP0u7cakkr/kbwpB+J2efyVxrIXx0aIamWTrbzKWkCv8PFF6p9ZV5
	/Uh3SBTBmpZSns3VuI2jviQJFDCStayDN6M3UEqDBVM6/nxf3D0jNud2jRCDIcNNLAY=
X-Received: by 2002:adf:ecc6:0:b0:484:49f8:b56a with SMTP id ffacd0b85a97d-4857e4f4adamr18253955f8f.8.1788601634554;
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:14 -0700 (PDT)
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
Subject: [PATCH v2 8/9] docs: kernel-parameters: Drop the pcmv= entry
Date: Sat,  5 Sep 2026 11:46:48 +0200
Message-Id: <20260905094649.41996-9-kmehltretter@gmail.com>
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

pcmv= went away with commit 7aeffbf2ddec ("pcmcia: remove unused
pxa/sa1100 drivers"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 7aeffbf2ddec ("pcmcia: remove unused pxa/sa1100 drivers")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 48dd273eaf6c..4864e37005be 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5311,8 +5311,6 @@ Kernel parameters
 		nomsi	Do not use MSI for native PCIe PME signaling (this makes
 			all PCIe root ports use INTx for all services).
 
-	pcmv=		[HW,PCMCIA] BadgePAD 4
-
 	pd_ignore_unused
 			[PM]
 			Keep all power-domains already enabled by bootloader on,
-- 
2.53.0

