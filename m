Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD461287257
	for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 22:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777586466; cv=none; b=cSBNpRKm2u2O+z33DtaynG9eE6LJjE3XGZT0SQCOMsnhSVBcGWdM6I8NOe4XQ+GkPfFFKWqPG4g46MyCee6NHzjzuSLoTcix8aD4Dpg01AM5/x04IGzaeoW+fLRRU25aEuYYryd+qcWxzoNX2AKXalrYMMS28bpD5GSXI7pWnEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777586466; c=relaxed/simple;
	bh=DGuMJIWsm6jjz3crrcedfBxNadbe0NtXekfSHQ6hBa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JCmWCcwCYJDSjd4gsImFYseqv5sYQQfvkilnyLJLjYWVNpZGhNq8/IPLaIny8cbUYG/YjZYdXz1DsHaXw9yrbj3mtfK7SW0zBiE2VFKODjh6mqRlg0+Zb4H0XwdSXdVKRe1CBD5lAzWAuH/IpbktGr0N6qjHwQVGKVZFJsPPd6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sg6NVL8A; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sg6NVL8A"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-834f1075805so1021277b3a.2
        for <linux-edac@vger.kernel.org>; Thu, 30 Apr 2026 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777586465; x=1778191265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=on4wGCNRG/3dGd8H0dOw4sp7+EFiVE63Q4rGGK8QJkg=;
        b=sg6NVL8AiHHJ8oBrlQlfoEFMxVj2sSqUEgOjUI8gApvG8/beKdkdsvN/8XCuL9GTWR
         JUQ/u8FAO/EFkQeXGBV8ZLwB/EvuIGvKMLnlJ4jMTtVVEhuWtCjnm85LL5Wdmpndwsm4
         uhpDvYXK+YNmiz67xpCzqSoTy1+WX62Z3Sfdotc0UFyYD2FVRbzXofEr7E9Aw/wj1jsI
         kcYX4rj9+j/ACKEmZSFLgG+7tOaiLNx8Ba1R5GfUrQjp4HAdAmoxMHEjzakXxzzzuQgL
         bhBdJSEi0g8bLWrE2157dP5ur83ab3UYUj5OTmUr1AFYRgXT+J9wQeqDdr9oea2YBk1a
         Pwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777586465; x=1778191265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on4wGCNRG/3dGd8H0dOw4sp7+EFiVE63Q4rGGK8QJkg=;
        b=oJx+qKdX4W3vQMhqyBqAhn0CbgzQd/QrckcB6y7lihMq4gUyvg8II0a833s2oDXrKW
         PNYC65d6AEpqfwFemMAUSzKEZ7siqXhtFa3yUnUACI6uKhAkjmw2puczaTLrspa+UGuO
         S+yUTWiVE0oftLDzbJjaZplVe0nOm/B80qDPk0+x5gEm2IhmPTVDirCgNv1pOOUXJhl3
         zvs61X3Jlen7KkwcmJnyZhmiH6duOvil+C9xX+GR4EFENc8tyqqDaJLO3Q6z02+/HeVl
         ++rY504NpFt0x2c2gIT6boWDAF/vwVt4VWmJL7L3/a/8GblgTXrip8+3D3X7iJbspEIo
         kgEw==
X-Gm-Message-State: AOJu0YxYsq046IM9KH5pZJNM4UxZtGcXLFJmm/VVA+EuSFV5wcIyXWrG
	5EpcIGBkhzQXDNpYZEwXw1gZqyRylJ/XthIA6ZN8jo29g9cgJT37dfYeLEllVA==
X-Gm-Gg: AeBDiesBJnO1CXXQh/v8VHbZzT1OPssCqjb6j0hjF8hVosnGqGgQEVhiHPrB75mYIso
	FaZxrzXZRHdTLkpDHPdxNAD80Kaw2/HD8Kba2kgWYwA9qnRbW7vMMYjc9aTt0nY8rioEO2koQtA
	LazALcjVYfMWBs8mVa99Ih0LZQk9vd1yf+HTJlBDFPV8s2TriBQBws03E6DUrG1ZLdMNPCIdhMw
	BpipSu0ZLYgCwyhkd33cRLGLBmZ0GlWDWucF/g7O1Jw+QQ2ZmbdDiVYresZ2rOIgWj4QqKt7pq2
	rkgKCUIiHln6D80CgGy+pWPU7gsyRIZZV+f4Nk0CZvWuVa3bG9Kiyy3zu9rScW7FXVyOTRRv8Ey
	baunXKT7+R6EAYLc/nYXQG7f2Mq9+N5gi8+q4sN+gnEWVnHKQs3Rj+uM57cIptqZ2uPbk8C8t3g
	zjzpWvBuZ1OHcLUUEJJXJ6/JhgVjlk3/W8zNAJiGzfgPVqKocO5gfltS02QUxdEYrlPUDmzbvbw
	FEoMjxfzctB7ATLxRi9RidFKy/DyxhE7joH+QRpo6+rrQ==
X-Received: by 2002:a05:6a00:b86:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-834fdbe66c0mr5734416b3a.29.1777586464256;
        Thu, 30 Apr 2026 15:01:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad7873sm614130b3a.38.2026.04.30.15.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:01:03 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 0/2] EDAC/device: simplify allocation
Date: Thu, 30 Apr 2026 15:00:44 -0700
Message-ID: <20260430220046.72371-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a single allocation to remove a bunch of kfree calls.

Rosen Penev (2):
  EDAC/device: simplify info allocation
  EDAC/device: 3 to 1 allocations in edac_dev_feat_ctx

 drivers/edac/edac_device.c | 63 +++++++++++++-------------------------
 drivers/edac/edac_device.h |  4 +--
 include/linux/edac.h       |  2 +-
 3 files changed, 24 insertions(+), 45 deletions(-)

--
2.54.0

