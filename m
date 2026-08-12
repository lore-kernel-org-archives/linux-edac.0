Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BD4403AE0
	for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 22:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572959; cv=none; b=Nn9mqypdR6O6VHdrvJG40vmWphx9yNivS4b0Q7pliXYCZeRKnPKVuqKyDR221nQ9caTFVYIXexxBm03CfgnN6TY/J7j6rEmxCmehkq5hyEz1xZeAPf90Y7PEjI5WupIgqX8LLQg4e91k4gWgeTCincqsZXZGOyq/RzEqKwstTq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572959; c=relaxed/simple;
	bh=iIazRueLgCwdpQVvBzVvZ3MoLhiaggQsU7v7PgtD+mk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMC4EwyzUbdAiau09eoJz3m5Eci7oX5iYXJQixPxQmmHxCI0OhQwjv/i4HMCiQphhhdbYbG48DDqyNyQ2RXOUXhzkaMCwm5/BfrDGaxXgtsSnqSLHVcW2eEhG8lNw9RDOcVyFkkcLkNXyOHQzlnMztOZnIA+VOewG+bQfUtHV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IAh0RxaC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IAh0RxaC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so18235835e9.0
        for <linux-edac@vger.kernel.org>; Wed, 12 Aug 2026 15:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1786572955; x=1787177755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uo5EFl7Rsrbk3IVJayjNPBdLiBo/0qtTpRx9EcPPCkA=;
        b=IAh0RxaCxipOh5bIRlDuq+yxpmi9JeToDrbupWf3q76SgC+yU20ya+d6HvJQXh41N8
         bvlzhFwGA2eqO5JYVS9pBu++nrVplLjQe0DI7hTAjDY55Jw+X0PK7f6MHR6hXbeVFoLO
         w28fk4BhLuALDAbr1AdWcg/7pHyZDwCBQ+7qUepQNvwC0vUmKHL//7j8CdornRgXKQFr
         R4IEls1qwMjeev68UYOivcxiGFNnDOvepvxBRM1idyAeuO6nWfBgVC/lmzHBe801n8PN
         JPAWiR/CpYnSRdagXZEFzjzoGAvB/QhXqSdjV2irwtLV4VTxurBlUijYMmSOi4S9f+gU
         Xl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572955; x=1787177755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uo5EFl7Rsrbk3IVJayjNPBdLiBo/0qtTpRx9EcPPCkA=;
        b=SZBwjWZAKDSA1Bxg6P97qMMbBSEOJOW4LoJGI3J58nS300WIUs0gfkjzYAv6UmBMFI
         EZf/j3F5akoZieTohPwzBW2hJXXdtE7s6cndSuRnFZg28DBAYdEp03mNn+gvGYI+VrNa
         CqQjxD1uWmRgGtg8HJ3cUITPuwosj0Nc3vuIclvT0sW1G24vEfFub8ZxAHVEVl/fO+xl
         /aMNFDgzNcUdkdromq3rtIrwIKNy7KHjD5MJ8VNJEBf2bY9yllIsX4bTK0VTh6laWR3a
         Ym2u3oWRt0X0cmWEmvS6yVzwSFL0cE8GGUnCnzHcsJ7duaVtuD1H5ysY/Qqy9ip9kyAi
         hcOw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5tsAWZG8+SfpJpLXl+uGA0Cp+FKyhvCrdklghLXRHH7DQwRYEJ5HvDNArb6AAuQqR1i/O5ZIKDdDt@vger.kernel.org
X-Gm-Message-State: AOJu0YzBAIP7TvE89wYyjPDRK+CnCi91dVGP9ntAhs2JPSBVtg2lox84
	x0OYHhK8NcT2rKYUdrryDElyW2kSWXhaTfL5Jd5tshdxgaE7SPxgEZCY0TZNIVX13J0=
X-Gm-Gg: AR+sD12ibd2awC1i2xKxSIrlwh0KO9xtGF/p2XL4V8oz5ei9x2pjIceeVK3PuP+aIu2
	CzSj5WtPy0sSO+Sf69ag2cdUlJ73k/TN8fBpeCdpu1Pucph5ssB0CRM71oKFCJRywb6QZSy7s+E
	v2IOf443jNdloFELqPDVG5E9+hPEeI7+1fMmegaSW/fY/O7sZtWdldzcMrVf2/Uv7BiyCmXDD/z
	igyzo2j26Rkuh6lksP0QEW671M9zDDvKWv0RDhrvFVUh/foW5u/DaRP7bthPPLxGZ6kuq5wkoJq
	v0HxG9ZtTDtb/tSvkn/HI4PHik5JFgZ94C8gMm9IEafrxC7U8YrfK76T1pGc9JRxgHrHfbR8/pK
	LMRzU0bKtaGF66D6H2oXVY9yFPAiZmwzaSN50ZeFKm2/3MJRZZJlgqd50J9JkEdEah5G5RcP4/Q
	MQhcPbEWb4CDiMaWS7xpfRt5pIRRcz0RxyGpvoZsVPHzuoS/I4ganjrjgxaWuqFufb36uteZTn4
	1BKMPHoK3thWjU=
X-Received: by 2002:a05:600c:19d0:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-4998218db78mr9601255e9.8.1786572955377;
        Wed, 12 Aug 2026 15:15:55 -0700 (PDT)
Received: from dev-jrangi.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4815a569ab3sm933792f8f.11.2026.08.12.15.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:15:54 -0700 (PDT)
From: Jasjeet Rangi <jrangi@purestorage.com>
To: x86@kernel.org
Cc: jrangi@purestorage.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@kernel.org,
	mingo@redhat.com,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	linux-edac@vger.kernel.org,
	stable@vger.kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	yazen.ghannam@amd.com,
	msaggi@purestorage.com,
	rjethwani@purestorage.com,
	rhan@purestorage.com,
	dgiani@purestorage.com
Subject: [PATCH v2 0/2] x86/mce/amd: Fix inverted interrupt enablement during storm handling
Date: Wed, 12 Aug 2026 16:15:12 -0600
Message-ID: <20260812221514.598842-1-jrangi@purestorage.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This set fixes a bug in AMD MCE storm handling and renames a variable
that could have led to this bug. The variable rename patch is split from
the fix to keep the fix minimal and to allow easier backporting.

Patch 1: Fix inverted interrupt enablement during storm handling on AMD

Patch 2: Rename MCE storm handler parameters for storm mode

Thanks,
Jasjeet

Jasjeet Rangi (2):
  x86/mce/amd: Fix inverted interrupt enablement during storm handling
  x86/mce: Rename MCE storm handler parameters for storm mode

 arch/x86/kernel/cpu/mce/amd.c       | 9 ++++++---
 arch/x86/kernel/cpu/mce/intel.c     | 4 ++--
 arch/x86/kernel/cpu/mce/internal.h  | 8 ++++----
 arch/x86/kernel/cpu/mce/threshold.c | 6 +++---
 4 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.50.1

