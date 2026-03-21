Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A267836D51E
	for <linux-edac@vger.kernel.org>; Sat, 21 Mar 2026 20:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774124817; cv=none; b=hTuTtZDgpqbl3Qhro/1lENSp4XBmFyHsUWudnsgfgLUhHsKRp9rRUvLsUf4gS26eHJkdn/kLXrhgCbSKjSs82bQ4AHDm0u2n4QEsXTFO+AzGkUHgi6HYwPDqPVZIv4i4UnKU6Zsn/4gMO1APJAQoDvv9hpspxClcs/NO832Tolk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774124817; c=relaxed/simple;
	bh=B40/85/EwNiFKT9AGzh969lVHI0PuKHdvr5helZNNhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pv92zM/xNykqqkQw2lv8v4B3ADZJP/0q3FsuDKxlBWqwVof1kILjXtaHXFfP+ZjfZYVO/NKQyz+4BD0zfbvkiQ9jU97WJpVhqooRCN9t6/CFb1UpaZ1pQShhpDiwMR8E5jQKKlBJcTqQIkcP0sXbF+6WpcbDa4J9OTmdEO/6Xhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=paF2IYu2; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="paF2IYu2"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506a747448dso14511991cf.0
        for <linux-edac@vger.kernel.org>; Sat, 21 Mar 2026 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1774124814; x=1774729614; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+oaYo8jHe2ApWpMWYIZKZF5up13wXv0XFZv/uf7bYw=;
        b=paF2IYu2lTrSP8kRrx47cGAg8L8pAiIsBhqSrP4wbOF30gWBkmpwxZNrTDMaxeswsW
         MtxVqlT+uc9edd4UFIAWlay8+PppRzGkqTgue+r0crid1rsfhhq5EJjESHYhGu7Pni6i
         lFE93jNlVOS4xe5nG5yH4/MNwUgJ4kJ+3IuX9WDBihz9FDFfgaaLgdF83eweCYdpMAnk
         +ISLDpI1t2k7IUsa4JCVF92WgVeKNlfeRXirRJsGhVpJDCc7b7n2oGcGX75dA5fOR54P
         Zpozcli2OXqsaGA/tGZVTZHgTGpShmCPjCM1uuzq7Xgc4L2+hyc/d2TRj7VXHTFswpL5
         102A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774124814; x=1774729614;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+oaYo8jHe2ApWpMWYIZKZF5up13wXv0XFZv/uf7bYw=;
        b=Uqk9Adq8QVRnl0SERpKfgbFoWUN7C43VMxW/o6dMgcTpLprk/Vh/r3uDzB8J48lhp1
         B1JGTiecqcPjVYK8SaWVWNO3KdPrUHaUdv83xyQetW64MLKrPxW4l7ak5jfWy9B+c4Fs
         Y/1zeHXSt6i608Vr2XrW/G8FFbt2PM2n62XccnoJ+53Xbg1nX9emVe65HBrFZlyIF+Qn
         ga4/FYaAh+8xhHI2pv2bSUjOD440zhJ5glamnOzRpTsthrv01JY3Hr6flcoQOK/Jp/wy
         +QhSFAiPuhSruGuJoqoxVCwuhi64i/Fp7Y90f2/zKuvZrkRqbIpVcGEXgD3V1oL7MCHe
         BFxw==
X-Forwarded-Encrypted: i=1; AJvYcCV7kuX1z61wUGg9yxc9u1eXooP/ITVGvhuaGuiJQJraGxvExdEvtEyEI8Q+Wy+m56ajmQAOW/X9Pzg4@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg5CtTvzyu7h3R2IvnpPBUvN/BK4wzpI/ZJ/3ep5W4ClqPfEVs
	VRSlF9TwC5WFC8RvRHsk64ebV642G+JjmUsXFb7azhiOH6ig0q71bz1sq2LXn2s3AGc=
X-Gm-Gg: ATEYQzxL32YhRg7chy/xd0nry1z00laWo3M4X4lBG1hVLKRh4LYs9vmbgUzwA7NHT2+
	TYWww2LxkrOi8p7RKKWIjuyVCUDYJjZQ5eKzxtj77WkPny9vT4uQO02Dj4vcUOuEisJLJ6LKnLr
	wBSTs+i6kUPZnzCN9soIGQjKapFZVD2RY0fr9UffFyYn/xWKutcQcNffnVlx0Mw/l553pzpxpCa
	jxer4aXWQjbxALkdAHfRK1VME+g0nGi+Zt1TcON5teqCOlfd/w5dclBywnGdTFhJ627shBi69Xz
	7RJya4pE9UKb0epGo3WqtAPcJfVlGvDuDEFHrKcsaWVoxwVRw3FAAMqWbs6HsdUNy/GEDKbgDwf
	x/T/MxSJrwl8BY4FQv9iE27Pp30irGW0Xh3e9balYtULx+R5uIKu0ebL67/il/KqFwqV8yCO4u2
	duZfViisk2Jl4JKV/yW2gB6wvDto12J2zLZQsxnKRJ13J8dNs8
X-Received: by 2002:a05:622a:5c7:b0:509:30b0:831e with SMTP id d75a77b69052e-50b37448bdemr117018071cf.21.1774124814461;
        Sat, 21 Mar 2026 13:26:54 -0700 (PDT)
Received: from localhost (ip-24-156-181-66.user.start.ca. [24.156.181.66])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-50b36cb2b0dsm47429991cf.5.2026.03.21.13.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 13:26:53 -0700 (PDT)
Date: Sat, 21 Mar 2026 16:26:52 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	x86@kernel.org, linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>, Borislav Petkov <bp@alien8.de>
Subject: PROBLEM: boot hang on ASUS P2B-F (regression)
Message-ID: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="vivzc64ibw2vy4ql"
Content-Disposition: inline


--vivzc64ibw2vy4ql
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

After updating my PC (ASUS P2B-F w/ Pentium 2 CPU) to the latest versions,
Linux now just hangs early on boot.  The last messages printed are:

  clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x5c77f5216e, max_idle_ns: 440795213641 ns
  Calibrating delay loop (skipped), value calculated using timer frequency.. 801.87 BogoMIPS (lpj=4009380)

after which there is no further output or any indication of anything
happening at all.  (Complete log is attached, gzipped).

This is a regression from 6.17, which boots successfully.  Bisection
implicates the following:

  7eee1e92684507f64ec6a75fecbd27e37174b888 is the first bad commit
  commit 7eee1e92684507f64ec6a75fecbd27e37174b888 (HEAD)
  Author: Yazen Ghannam <yazen.ghannam@amd.com>
  Date:   Mon Sep 8 15:40:34 2025 +0000
  
      x86/mce: Separate global and per-CPU quirks

This does not revert cleanly on top of 7.0-rc4.  However, the only
conflicts are in arch/x86/kernel/cpu/mce/amd.c, so I tried reverting
just the changes to core.c and intel.c, and this results in a kernel
that boots without any obvious problems.

Let me know if you need any more info!

Thanks,
  Nick

--vivzc64ibw2vy4ql
Content-Type: application/gzip
Content-Disposition: attachment; filename="p2dmesg.gz"
Content-Transfer-Encoding: base64

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

--vivzc64ibw2vy4ql--
