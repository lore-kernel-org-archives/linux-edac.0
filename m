Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115C83EE1DC
	for <linux-edac@vger.kernel.org>; Wed,  8 Jul 2026 09:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501906; cv=none; b=XG3ZqEKrlQI6MnyQynPxSu+1pneJSiBzZ+1QGbuLSMJW1GPGiwMRUUXwjy2Zh8Mq8mJhHXljAOg5Br4/WvSIeuyioYQ5tTDGvIcppoqKUrulpQemga5bRCE8u9UMtHXKYncmQ1GXgGI/9jMCAUkmMCGQcoWI/kaoRMA5qtJoDGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501906; c=relaxed/simple;
	bh=2A7STdxmzYXGb4MRNZHKHbklKFV6upIxiT9YosoQOkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiDKg3COAoMbYpVQVe0nDaMp1+l/LyDVNAAsQ9HE29/dvkSF/u5+3Cr6BjG450ro9P0cuyD9TZq0lExJwb7hpI/5I18La/ue4XVmQ5RBt3aTn5SeFO0eWxpZCg0OVBFTw/ka8OeqHwOC6YQ/KeYKCQMj6XKt0V9BUTaGr8By7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJFiN77S; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJFiN77S"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b7612475so3201535e9.3
        for <linux-edac@vger.kernel.org>; Wed, 08 Jul 2026 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501903; x=1784106703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpLkIujVSy0m+uVozCHDe0mKz/u6o59P2YeTbdyCkmg=;
        b=NJFiN77SNkOfVlIyAvA42RHdEr5v9k3CUZKNpKKyhpY2VdB8hDeRpaJWNT9JHnMTys
         yh0gSnjStdINCRnzeUVgf+hNjXiGcegf8iU63DYdofiDBmel9OgfvHZtVULj2c0LE6ST
         ox1TTRX5vZ7n+q/eNCTY6g/GSZjkClEQpJ2giXWmtm9nTkbPlHRA9QZAfTptrsK09NYa
         I1vQfSm1fQsxqzl6HZo5411AhlvS5M8iDByF7u+ammnq6WAJ707CROfc6rnh1r2umPlx
         RsLc9NHM4ilbySe8wwK2rA4yqml/kogHzq8WkojfAif8eenm2VjDAWWevddeZ6+NZZhx
         4PiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501903; x=1784106703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NpLkIujVSy0m+uVozCHDe0mKz/u6o59P2YeTbdyCkmg=;
        b=CmwroRruCssjGrPd6/ux62MKWJYj0Q8XHViEZhSjSopMaVZGYERbNuGOQNsCGmBfSu
         Jl1SWUOvSEfMscgz6s0cAK+mezfss4C8tSBAWPSEO7aFAXDCU8M3AFjGuQxbOjsMxbGr
         VszT4VSwWmdxovi+9Q9aIUlcCrCSC5/4mCLYkD024bcYDyRVCP2r6lZdu1/8E9oNnf5g
         kpt2VmYCv9iB3m2eJe7MlOfWv7VPHzaW1lB/jiRi3iqzVrxmWgdjdyJ2vGU3JfrtkvMi
         xZKJ5F/FKXTrlJG1Vpwspwh06RjLpVCIcHPlHJ+7b6eksRWsx7sW1zkpz6tjOin3VlBl
         TtBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSI0YSTVVQ5QfL+BFn2X0SwRUUsX39asDqbX464GGI9k59EPWIexPg8fKjboJh6HU+mwAJ/jRSMCex@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFnFVDe9720E0JctHdGlC4AaioFbxAuN2qPqT/OF6YzRnnepO
	pcZIpl1+7K1Jf5qx7/kjT8dwGHT8WRHWsAjueDdgDaB2Go9fDF6uDYH8
X-Gm-Gg: AfdE7cmRSedOxpadJqNgflmZADcJXuHsWKsk1pqFm7v6cXTZAbID/W4q2Qdw1E6vUs8
	MS3IF41OPcW5LOxYFuSI39oLkczh8XtFkynVnScP2s7lgwmsiLaQHgxE1CIovbp/99e5kl4XWGu
	BOAVpW4+9Sn5dNUJHwHVwi030BQrwGYdYhvUIuaekzJ0x0TX/CJVH3Llp/AdaiylzFrGQc9GupH
	+jtKYdXQtvjRhb2eRNKkpYvE1SNInVF1HEqznQCgn34zyheSXF1aA7B/LkZz39SiAv+dK0g/pfg
	9/itsZHtQ1GGHVqF8qEyOhFbbGs89/5ImyB0UglpO9UyqnqFMHiByVUt7E4XcHjpLIxERoMA0VT
	hUDJssnRBgm2e78dXXaynMZ9LOQeKWbCJ5E4ZB5GrVH8FSiCo2Q9AZBrqcajLLHdg301kQ6p1Xy
	tZmTeHAmsTS7eRYwO5JCU1MyzfwpxT9t4X/HiM+zKKRAmY1/t5C6znzw==
X-Received: by 2002:a05:600c:6208:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-493e6843fb6mr15953885e9.13.1783501903003;
        Wed, 08 Jul 2026 02:11:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:1670:1b:3626:64e6:9d2c:1204:3e04])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f32660sm127772895e9.2.2026.07.08.02.11.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 02:11:42 -0700 (PDT)
From: Rounak Das <rounakdas2025@gmail.com>
To: dinguyen@kernel.org
Cc: bp@alien8.de,
	rounakdas2025@gmail.com,
	tony.luck@intel.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] EDAC/altera: select A10/S10 behaviour by ECC manager compatible
Date: Wed,  8 Jul 2026 13:11:33 +0400
Message-ID: <20260708091135.94114-1-rounakdas2025@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the CONFIG_64BIT-based A10/S10 selection in the Altera EDAC
driver with the ECC manager compatible. Patch 1 handles the IRQ-layout
selection; patch 2 removes the remaining ifdefs in the double-bit-error
path.

v5:
 - New 2/2: remove the remaining CONFIG_64BIT ifdefs in the DB-error
   path, converting them to is_s10 (Dinh; tested on 32/64-bit).

v4:
https://lore.kernel.org/lkml/20260627061723.43014-1-rounakdas2025@gmail.com/
 - Carry the distinction in the match table .data, read via
   device_get_match_data() (Dinh).

v3:
https://lore.kernel.org/lkml/20260617000711.60804-1-rounakdas2025@gmail.com/
 - Use altr,socfpga-s10-ecc-manager, store once as is_s10 (Dinh).
 - Fix checkpatch alignment.

v2:
https://lore.kernel.org/linux-edac/20260616081709.48774-1-rounakdas2025@gmail.com/
 - Use legal name in Signed-off-by (Borislav).

Rounak Das (2):
  EDAC/altera: use ECC manager compatible to select A10/S10 IRQ layout
  EDAC/altera: remove remaining CONFIG_64BIT ifdefs in the DB-error path

 drivers/edac/altera_edac.c | 127 ++++++++++++++++++-------------------
 drivers/edac/altera_edac.h |   1 +
 2 files changed, 63 insertions(+), 65 deletions(-)

-- 
2.50.1 (Apple Git-155)

