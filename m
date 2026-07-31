Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22172221DB6
	for <linux-edac@vger.kernel.org>; Fri, 31 Jul 2026 01:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460894; cv=none; b=hjCYJywn0QWJlFGjqi6O9dw81HHEZGP8+bEUB3g82ZlbiIpsuyY55+CIeyh2f/Q+Yg4cJZqyvJi5U6LLnw3aXS5oj6P2J6rjROiuqxxevhWMz5EEjft/axA0ZxTGQzm4z4HP1U4DdgTKaW+X6v9uNyNeSi5CEifXLkcXqgt/bxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460894; c=relaxed/simple;
	bh=+4rmNqUCv5cZ7pndOhXrQMHAQ4UxfWW+wlQP/2xHpmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=StjcfHBya2bUZSSMUOdbYIb/wjhaVuPeCF0WHON8e8RaZBfFrSzshNJ7KcNaNrTnMvWsnOMMUT2jCw9GgA0utfDyyypJuKOtkCC/VyqVrCag/EpenT7NVWXF9JiihnNV7zJ2ADrENGO74yPhG1kKYGmmmZu6HCh9hZWVrBWXlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxfrMR47; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxfrMR47"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca2fad0ae38so289275a12.3
        for <linux-edac@vger.kernel.org>; Thu, 30 Jul 2026 18:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460892; x=1786065692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M0IyVD+1y/522lnq/7Lp1HsNfM3GsCs6wBHZ3/ZAaR0=;
        b=AxfrMR476kd/2dRGxTuRS6qbxGzZ5Guo2t/lPfPJIXcFwnEW7mnpV5qgOBHu3Ryg36
         re3n6kaTQ7Xb7wiTA0ZW1KW3MrH6p7nC7bRqjrOAJKSqKaJBkT8lsSIrmikmJ0pACLDV
         U5WmWveGLyUU76/sZ9/cB1teTAQg8lNCtq2rgPyIw9ycJ+GAycl608iVenI61p704j98
         GEEHehNSEgSxDfxzafSE6MKHWltEeAsrVeYS6zVfUkmTRSZLTfkWdks7Ne1R4nqsr1RH
         S6vVHQvjEaBx1r9zrofQsDVIIiTzokNDPyix62pJ1Vr3T8qhxcflZrf1H9VJWUvwRgSe
         M8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460892; x=1786065692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0IyVD+1y/522lnq/7Lp1HsNfM3GsCs6wBHZ3/ZAaR0=;
        b=eVhC84LY+S2AUU8I9oE3rJOzcbquHvymncqkmTrGeHq65GtIkoYH6BZ2ua/dG6SpbO
         ZEL7fWY7YHqpXm6msTk4oE7hWjBgTdaQHaQiK22qwR0HgUDYvb40i2NJwo/mmG35qjFS
         aZqi8cnJG2i112UYVunu1EzAVqCJVOwI9uEOz3eXzCgDJ05RpBnaMpOHMw86MUwimGgf
         R0IY93NtNszLju3uJULAV6KsddQTxR/XATUL/FOwdJXevHSGHR2KXR3ygN6XXr/mm8se
         JPYGbnhHyWx7FTlPB0vLW5kLu50kzJ658DPmXNELHo1ExHq7qPLnLVljKVqos5cImioH
         VwGg==
X-Gm-Message-State: AOJu0Yzn7BgXVvCdKjPqGykFDL0j0UdysxoKhyhlM/PqTgBBgFPJ73wM
	9wx9GaGMz4tYd4+AsJuPE+0X2ocxPLdo3q6LXzHQvdFzg/L8bXV70gV7M1+pqw==
X-Gm-Gg: AR+sD13xsTonoFhlKwRub7yjX9soDjgQMVQe+Sfzi6OifdQqkBKMG5pvQ5YW5cOZ+NY
	DKUbfAcESRK8UJvnpcHB9SpwjazlVl5LC+1r5wZMMO8kjvVD7UCMOXFqb9fxpubZNMn+Nxj5Dzq
	kxp9yq127F3NpFSHEr/++z6ezJ22wabS5H9fpEGmuN00Xji2IMN/VN3Y++ta5sPz3KRVL0P0Fod
	7bsmclTa4tNlXB0+Pir4d9CwisZbNDukiyZQYMS+k850iq5O5UNSUKLDDPoVBH5NeG/5pzAX1kz
	bO19X1PGZHpF4dk9pYUwrUJ7ioXMUBVkBolBTkybk5/d0SeZWu2efRn2sx5l4YQqhj++Z/5UY91
	n9zQ/LYWea8ZMmRXkCrCj5BC0scbAXp/Gdq60Pu1R0bpM8kWZIkS0jec/IhO8quaESxXVbXrJ4H
	x5gNP/SwBfCwbl/iBeFpRVPM5ur0FaM5aiE0+uuuARmgipWGRMwNPZFl/StoUftOjvD+ZlYn82W
	w/lGlzXZxvuT3qTyCfq9y8shGEkBNXCcqjPRUH7TannfpmKO2DkP6TGZFuqZDmmmckoxBSf+NRs
	cbOdIMvkaZMFF6PS/WmWFAaiJEMN5dHOBruJEg==
X-Received: by 2002:a17:90b:5188:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38fb14917afmr92506a91.40.1785460892423;
        Thu, 30 Jul 2026 18:21:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 0/3] EDAC/fsl_ddr: some cleanups
Date: Thu, 30 Jul 2026 18:21:27 -0700
Message-ID: <20260731012130.1212640-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First one is a cleanup for devm_platform_ioremap_resource() and some bugs.

Others are issues flagged by sashiko.

Rosen Penev (3):
  EDAC/fsl_ddr: use devm_platform_ioremap_resource()
  EDAC/fsl_ddr: use non devm for request_irq()
  EDAC/fsl_ddr: restore MC error registers on probe failure

 drivers/edac/fsl_ddr_edac.c | 56 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 38 deletions(-)

-- 
2.55.0

