Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A96322DAF
	for <linux-edac@vger.kernel.org>; Wed, 25 Mar 2026 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471041; cv=none; b=UppSqQFfSue08eCHkJeKyjW5bFmvCv/D1jZSsoVhWKpZrY2Xzqvj/oln4JFvXHy+dp4LkIi1CvXy5e+43ZwgckaZulrrnG38u0tjExtmFNghLQMDXrFdNq2a1GY5mZCpLmOlB7gHStkHP3E+HmBtDvwNmwruBrvh0h7RoBlhjv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471041; c=relaxed/simple;
	bh=A7WM0pIZlTNQ6/sw4ggzrYQUodDKo0RefyCH/DquylI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rwUbDeSUwNqCS4WyOjzAUimZ0c9JBSTlFRqn5lxEebmDid+55JpqhqWetmKldmMxx/YAuFgj/pNP13nGSYrLIYd0x9Ma5ENSsknqQ0bdutvNqz6y4+qfOlfkbd56xpXop90V9n9tPsm/phL0vKRkGPKsQxrQOfxvBqAHsIggkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3mB/6uw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3mB/6uw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so2514045e9.0
        for <linux-edac@vger.kernel.org>; Wed, 25 Mar 2026 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774471039; x=1775075839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1DX4aAtegOD8vXyQbyF+aQ9WUFcHaqVvbbM+vAMIw7c=;
        b=j3mB/6uwynXPM/NnpPzo0HybwZFwSgzTjJ1ss1AAbTQrfrNw/YGDkbGAyQfc+Brs8D
         msgjexJQ+NzLC6nK+mHeIeZKCqLGeG0dpt1nmwrqHJHoM37cigtPVNUVzxeG21qKkzfe
         FepG5ebOvNCiy+zjdVnogNiMp+gf5RR1ITpSptCoAI1ihJUWNmuVCEvIkxKdpEeRNH/A
         1LliYCA5Z6FuuI7HChKor/H75fGOIYUoEaCOSvXL6sBBssd04IsQBi7e8QeociVVFXXc
         OYqyb/j/KMHIw+s7/dx3YyV/jlZwl+dMT7blha7wUy5OtU+pWQlArbKSBvPKfPgAepIy
         Y9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774471039; x=1775075839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DX4aAtegOD8vXyQbyF+aQ9WUFcHaqVvbbM+vAMIw7c=;
        b=k4dJwnzsefNmrSTTuaN6Kx8uZ7qp+mS73B9rdXGGCuKL+X9m/vDNQm2OirInOqq33G
         u0pGPvihhvrq8+eZbsX0SN0x+j9V6HgbqaIgs1Ex0aD8QUGbRS/dCdJealKbjDj/jKyi
         0o6DhcCJWJqmK6r4RhVbO+9EH5Q9RuBmKufYYeLwN0Oj/HEb6T5qbqkbOXj8HcTYaYVo
         NtsLc0XjNbZ14vUl6v2SYNs1PIg8f9ulmO/MfxpKEbdBRMrpp77e390wYzVf3fcT0Wku
         T1cd6U6OfJzPDpDYliVyZ4W1p0VBI3RQzHFMHFPVBx7hLAPAFbsNXP7oOcdqYbyumlOm
         8ipw==
X-Forwarded-Encrypted: i=1; AJvYcCUEGTVm9Ce+pW3X8fmDqGiNMwRXWgbnUpSPtM/W7KS2nbF5raFcgUMybqm+BYPM4I/PpqZasxGAE62v@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIEXBXK0RDIEov5EZuW4QUzWEjR+NwH13TZMkyTss5wbqFr1f
	3o1RlNOhQeOroQZYIJrEHp1rVmEx+UURRi2faCl0/n1pF89lgCA6As7P
X-Gm-Gg: ATEYQzwur1pU9jIFOoN406ltRFz/bogLGh9fTlVe/BBxbRtaKE6XfzcRvbe2GGliPJP
	sHB2SQxoh3hAr8eldcCMdxHoaieGd+z2P4irSIFy5fR3TiTFOvgauNcrOOi7qtHFZqvdt0Y1Ttk
	C2KNj9nJ+xqyn6Fz4MAepgHQUjFmhEj31g/1Fi72fKLybWPC5S0cC1twF0vKjXc6Pyz1o6ZCdB4
	xkiNolSkv6wiYCKCJReFzaZ4Iu4TBey90+Sjhbjo78oTSttbVJOHXtdFQPzaIE5HAGws+e+T69s
	u3p6nsCjOoh5zo7d+Nac4elGChGsIY5KwWVtVS0t6if4OAmdLxNBpDePqC/Z52B8gHLX382i1Ek
	FWJSBtA/6Bt+wxv5PHN2IVDb8kTdvs6K56LmB0vrmxv+byaletlQiLIpEOnJYonwDN7J8Ks0Hb+
	aPP7P0eZLEzuHGf6gR789jc9OhstQWZYf6
X-Received: by 2002:a05:600c:a402:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48715fef22dmr55320015e9.13.1774471038500;
        Wed, 25 Mar 2026 13:37:18 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb4bf57sm3459985e9.0.2026.03.25.13.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:37:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] EDAC/i10nm: Fix spelling mistake "readd" -> "read"
Date: Wed, 25 Mar 2026 20:35:55 +0000
Message-ID: <20260325203556.1228975-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a i10nm_printk error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/edac/i10nm_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/i10nm_base.c b/drivers/edac/i10nm_base.c
index 6f61b7614230..63df35444214 100644
--- a/drivers/edac/i10nm_base.c
+++ b/drivers/edac/i10nm_base.c
@@ -196,7 +196,7 @@ static u64 read_imc_reg(struct skx_imc *imc, int chan, u32 offset, u8 width)
 	case 8:
 		return I10NM_GET_REG64(imc, chan, offset);
 	default:
-		i10nm_printk(KERN_ERR, "Invalid readd RRL 0x%x width %d\n", offset, width);
+		i10nm_printk(KERN_ERR, "Invalid read RRL 0x%x width %d\n", offset, width);
 		return 0;
 	}
 }
-- 
2.53.0

