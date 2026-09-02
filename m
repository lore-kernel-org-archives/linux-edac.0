Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4646348C75
	for <linux-edac@vger.kernel.org>; Wed,  2 Sep 2026 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320579; cv=none; b=Uhie7qUPL2CuvQerCrcZwF+RLK3f3sjoUDPa3WOEUb/xC01LWg5Mj1dqmVoFJDqOYxQ3mCw62MGq1CV/JH22VEZLJsLBF0fH/Nw78aKgfb1KF25CNFVAyHDsXlWXphLy2ZQKNLesg2gHbHWykSEIS4xiIhB2XXVD9fqiOvmU3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320579; c=relaxed/simple;
	bh=i3fo3pHteBDTj07Dr/Mi0B2AnpNZNlOf08y+DZE8ShQ=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LuUOavf6gHWZy66jNAGXyO1d25VjAw+gWSzpCoT2C/FIwlaZ0D4IKmy6WiuSDzXZd0kJSj1jK+hcVDYZimY7uAuHRI5PYLUlVhoEGzLmfYXVpQ7/44uEHAsq2X0fD+VQCm41Ek/Il7h4P1htgVbRMF6n2BqUcC/VUjQ2i/etEzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMCIUdT/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMCIUdT/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d71ae3455aso8647015ad.1
        for <linux-edac@vger.kernel.org>; Tue, 01 Sep 2026 20:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320578; x=1788925378; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6mGPcki/1a/Lf2s2/1dI66mP0jWfESO0B2O9tUlL+Q=;
        b=gMCIUdT/uUXyjF71g2To4LLwdSHF8jlWguTo+Vp/qw/8+NkRZ7qyxc1UN0ZO3WgHZ/
         Z4kerIj9RTU++4QFGkV5uJpmrXAXsaTYpw+PtJZcOVYx4VZTfnkPTduQZgsHz7JVumv5
         Qsu4/TjpX0Knpi+gPOp1stH4j3Axcb/QZQ5B/UaRcLCYt7d4Dq+3UAFXcZJoMp1NzGZd
         xcbf9AOKxT5rIFqVpidTHmgS7WrOFAetHOFf7FqUREphbSJcOYCblYfbN69icDlmvAwX
         1MeXAHDARqg6wIJuq2eY6liBFDfCiLawcGS5YcONwi6YkD1Jt3UWn26qFXj2VV37Qtuq
         89CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320578; x=1788925378;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6mGPcki/1a/Lf2s2/1dI66mP0jWfESO0B2O9tUlL+Q=;
        b=PFyN9mPaosGn38JEYIV6p4Mv6oe8NoKrl6ov9f9tD/h3Y7tmkMeBoNoKbtEY9KXQ/O
         4QvArUxXd85qokecTm/S+MrqaPxwjavVs5wbJ0ZPhyaMJkBNbMQh4FCH4O3KR971wOxG
         0cQuZIokPwYK94KPny+0sEgr2f5SBBYzjvM2kVjFZfBqxNaBArI2LPMUifLhdAuQEnIr
         HGCmmkBVU+vPiZ+FQ7RxNQ43yTSEiMMX9HZyu05dKMiPEoMI4ergty0shNB+Ct16W2Rs
         gHWyRR1Z7pwM7HeA2s0HZa1sYWSbN6lAhBRWxbgHXgRa5KCFLeo9ufjdMUtNPr5jrR6C
         lDYw==
X-Forwarded-Encrypted: i=1; AKwUvBzAhcEzRsdIpp3OE0bknKo+PaF/DoCu9x02cIiHrFB/cd/cXrLkQ81IhayERCaITZiFXfGyE51E28vC@vger.kernel.org
X-Gm-Message-State: AFuF++mup3R85hDz21anK5kQ5Xu8Ic6chLn1kZRQucs3DS+EOZMwVKMj
	UCQP/2bnULANwVS/wPgRWRI0x1Ju30uwLNlYUpVXbLW0wPhui41QdpgR
X-Gm-Gg: AYBFou0PavUE5jd2TJvsswnZjdSgFSSkzf1q1vaZlBnxvyVd0ALPjbBjoqfqWtn5hUv
	mTCCmFIvil1YimKYZzZefC2FEFrIRA853khnHufUeadgVPbey+LpQsju1UI5bSLvBcH4gkqafVI
	MzLKJ5koeukO3He1PkSHy3Qde8ZrDtWlxjG6VEB9aE3/neSL5Eo0zR3GXYw0UE64pd/lMJB+VaQ
	+6wamLHnauxfvIT6l5WUbINixV+OKBbt2ZUnOeWZ9GFjOP7f/FOU/lvqCnVNDNQ4Se+txHDGxHS
	Dw2k/2bzFI9NTBbEwHbxM3AUagh3Ulk+2jnHHsROBTsMpvTyneTK8Nf/jeZViqeFoSX7+zuoQf2
	NnnwHo3/pJCYkpqFIPSs3hPDufwH7qNqef6pa5LiYT1ZKsQLudXN7VTD5N46DU+5qDz/Uqk8uGm
	8vnijvelSmTJHzenEDrjp1FglPITUtrXJ8QBUL4SqiSr3uI9wI+KpScT4Sukmg4NMMCuJFRjyjj
	hVUCrAL4tG+vsqqhCoh7L/ZH9Q9dl1LSvxKf5tsJ1q6RGqh5U3Grg==
X-Received: by 2002:a17:902:e78b:b0:2d9:2fc9:570f with SMTP id d9443c01a7336-2daec738b38mr32120595ad.16.1788320577728;
        Tue, 01 Sep 2026 20:42:57 -0700 (PDT)
Received: from [127.0.1.1] (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4d7985sm5826315ad.84.2026.09.01.20.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:42:57 -0700 (PDT)
Message-ID: <6a979b41.d6e1292d.3d29a1.3309@mx.google.com>
Date: Tue, 01 Sep 2026 20:42:57 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] EDAC/octeon: fix kernel-doc comment for co_cache_error_event
In-Reply-To: <20260902012331.GEapd6k7g1DZxILLVW@fat_crate.local>
References: <20260821233751.2331272-1-hanzhijian1991@gmail.com>
 <20260902012331.GEapd6k7g1DZxILLVW@fat_crate.local>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, Sep 01, 2026 at 06:23:31PM -0700, Borislav Petkov wrote:
> I'm presuming your legal name is "Zhijian Han"?
> Because you should use your proper legal name when you sign off on patches.
> You don't have to send a new version - I can fix it up when applying.

Yes, "Zhijian Han" is correct.  Thank you for fixing it up.

Regards,
Zhijian
