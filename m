Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961C83DD849
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 07:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788591844; cv=none; b=PR7qa2DNkpQpr2tpTkhTM8dASfJivCNEAwNKDiVt5AJG400dLa1j55ECVFutM3y9iLVtaiH5IFWaBxE24WlgNE9UnDfh62tqBZEPVLpY/DyYuYJDYgCQ4VZpz+TPjBoSJdTyhN6uDdcZEhsJTFblKd8FsVGsuTyHWZGUXpIk4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788591844; c=relaxed/simple;
	bh=BaEoG/6SLaF+j+PN5tp7+Wdp37OedR46Vcq2/qxVkD4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dVtZysW/QEDnsuEptxXPrutd+JsWRchlFrQMyl1pVLQRrzBe4yNNQrIxpT7kvMJZPExITBAubU8ooDamGXdjLSXDehG8Ii6UaWG0qM1gyui1l9x2euN+gNh0FWM9nBHREnQ+rmGKHsbQwwXQI/M/USMUUQ67fbwVZ0k8HusklZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXucSUZp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXucSUZp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso16516505e9.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591838; x=1789196638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=oXucSUZp2Ol3i2pEYHldD3DV+2ASo+RTBaAeQzrMSdJwFrR5JTHpquTfUGJO0VfRIE
         nefv+Ft9QF+dcQrSpTKb+iYlhkj58POTcznx68yNS2hDNCcTJdUCP88Zu0+afuCjy9IC
         7gNO6PgkNSM31jvqT0DA7Zwli22mUDcz0OfS/y8E7cQyIjV+TOQPD3EmJhc32MvzlrqW
         ppVUzNkWullisof5hdVTWYukpstjDvRQD28atGI2A/LQKX/B3ZXElMe7YWp7xNwWh2f/
         l1D/r8Xgl58iLGD3h9V85GVYvVjIuiwEHWZYDkvQtAcAyXa8xPaCYW6G+IShSsQN+ix/
         ncHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591838; x=1789196638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I1Jlm5MucKkfjFwaOiA/wi4L8q8pr7cNwUH5XJFU8M=;
        b=gxJwhTQbstM9go7N3oju+MFfRLmckpPkzBHioZwnx3DzyzNtQldYl7rA+3pgepnRmy
         zdqexYt+MYN/pvTFh0QB2oud+XJDCea3huF90mYjptKX50vpctFtVNZqQSaHIf5MzXX/
         WZHlvOd3HzQV7fHyWK08JuaLIrx11FInKRMAvwMnhn216Tojj2jpiWiW7pIL+dh+ecoA
         we16o7IhKC8z8jqTiNg13C0gBHgMMhfQnTEUPYAhExVPwUBPueaPtcYdw6+a/+P+oKMW
         KsnfAcoprN9JHCstcZHxHEghwm7WIgGtvUxAT7m4y/iHgRwcMYlWt8E6ar/MkV5OBicX
         yvfg==
X-Forwarded-Encrypted: i=1; AKwUvBwqkF1e+F5ITPPw5VR9CjcUFn1OLWGJgr2vu3QD8lUbt6Y1VY3PnfSA1MsIf6lhrflo3ZhXNyYMhdOz@vger.kernel.org
X-Gm-Message-State: AFuF++mm6Gh+biAmXhHdVko/yfJRyBvX0oiTr4P7b4t/yp4YpjI44Xd7
	1koYzt88kC3feHutjfjM/gzHEsIZzRixKkoH3bZSON5q2CslSLFIjHi2
X-Gm-Gg: AYBFou14FNNR5XR8xjypyT3uCimz7LF+bEeaqzcNP/TUvLXNTE2KJNqVV9w31lNYoMm
	8YBqHFOpR6NrYn8OPm4Ki65ezPF66GaMDKFlrApuSi6mt5xGi4oGuQFeTzoi1CFs0Hy8YxFrLUK
	ZtBJ9aW6+8lun298hJad5AoQTyDbMhquI/3OkGBrIePQg0hkNVfAfODAgYL9XqvymvaQsQmBTfE
	YAgjtV7U3caT2Oxz4zBuj0GeKE5QKDEqcPo7q9cuV4DwEVzXoXrAtDnjeC4YFIzrCf3e5TGJt6F
	UCHeTUQdRLIWEsZx6kexkb7pdjSnVVsqVbOjoBB9mFgQ+4RrKIWbS11qIeWxp07o++Z/180vUOq
	drAeLZvltDDwY+FUMiJitmRSgyw98NKGjiv18F2uOr3VZaAz+PbS8tcgH6a7LBgnKnO7CkbhB84
	GyzZELsymEkhp16VTEiETAV2qQI0lfZp7xMJBvXYPBbr+a/+a/NrB+bhcnR+j1qo3xsIgaU/73r
	U453P4nPiCmLmrSCUriDJpDURrJqUQYXVnAdj+IsLIOdMTNEF3vWBOLy7RIkoQRyEbS6utsEHuT
	W9OPCMVXZcUauYbPlwoqJVEdcqGVFZcstNEtFWKwk1c8VSBeEuHHhrPx5+YkZbH+M7zxBDQk
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr97941975e9.13.1788591838387;
        Sat, 05 Sep 2026 00:03:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:57 -0700 (PDT)
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
Subject: [PATCH 2/9] docs: kernel-parameters: Drop the bau= entry
Date: Sat,  5 Sep 2026 09:03:40 +0200
Message-Id: <20260905070347.25902-3-kmehltretter@gmail.com>
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

bau= went away with commit 39297dde7390 ("x86/platform/uv: Remove UV
BAU TLB Shootdown Handler"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: 39297dde7390 ("x86/platform/uv: Remove UV BAU TLB Shootdown Handler")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c8d96de4c00d..99d5bb68968a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,13 +624,6 @@ Kernel parameters
 			Format: <int> (must be >=0)
 			Default: 64
 
-	bau=		[X86_UV] Enable the BAU on SGI UV.  The default
-			behavior is to disable the BAU (i.e. bau=0).
-			Format: { "0" | "1" }
-			0 - Disable the BAU.
-			1 - Enable the BAU.
-			unset - Disable the BAU.
-
 	bdev_allow_write_mounted=
 			Format: <bool>
 			Control the ability to open a mounted block device
-- 
2.53.0

