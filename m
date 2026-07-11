Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581A14B977
	for <linux-edac@vger.kernel.org>; Sat, 11 Jul 2026 00:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783730638; cv=pass; b=lKLmC8Y6AeyCMeIupu8OC2sbgoZpvX3yJcjDpr8bMTxiGsNnqFr1BfvjfzinlFKmx/W+WmAUFqhn0gSXNbdzMYOKJEpln7KYXIdLUn+q7JOKfsmT2JeksRDoFL+UNN2oMDO8qZx5X90RsGOFuHWcub+Sn/7hEEW2R9X9IW5fXlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783730638; c=relaxed/simple;
	bh=Gq+LpXjjuDFhwsSf9BeC1njffhjf4uZbBP96nOGkoRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPTcDRED2WnTT8yqF78rlyramq1k5sclvj00avmd3U/Tons/SAKbk+G8AP4UCJXaSinRoiY3f2WHVowhmkrTNnSyA5W4zEbB6BgBTDyBicTfpRsB0/OQmrj8UKqt1b26uQ6BfjWUThYrg33bggADxphqrTvJQPfKm0dYHzn1XZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1f6805A; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1f6805A"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848d21bbaffso3433b3a.0
        for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 17:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783730636; cv=none;
        d=google.com; s=arc-20260327;
        b=WWTOCllnbi22VGsmNgk+ThXXw4dXYJ1K69Ai2WFbwidEIWPT4zt9gBz95eQH5mKJkC
         R35ZHhRS8X9rZrBntTx1J8g7+hLQUKUklvTFB5rLONCkWQYrJ3ETscV9h/iEpxHnXLl+
         63wHKI/1dyrseZ6aFXOibdYhUeRNJWHIlR0DGNM1hAmAoeP8d11n8lrCiXQr7DW91HhJ
         oTMYVko804ky03XUJ1iQIMn3ML2qSr3C3c6R1yzPSuCDmjMHwt/oG7T8gdNgTGPr1yuJ
         PFf84Ey2W1mXHFyPVbjGt50F94s397os4VoY/uMLfFTKyedUFrFTRrOpiZ6IA0OkIb+S
         01gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Gq+LpXjjuDFhwsSf9BeC1njffhjf4uZbBP96nOGkoRA=;
        fh=ao179LWelUrG960N+4G+TgAbES3A34hlF1gKTiBxztU=;
        b=nhlc6gzjz+2Xa95UR1uB0xMv36kTvmGdf1ko75EnUYbNaB8sPJ7pz1QYZcsuwkRUC+
         tgnz8mrUYIHACaYBPMRrgK2ipup7zHFK9ecIvKTbVco5gMnCRWtiye0glcHP/+pov88P
         PuR/NOAqQPDgOC+Yi/TPdiLz70pWY7sCuQlyOnfJ9TL+/UKl3DXrPW+x6v6aPiv7dIlY
         O0gDuAMyZm/VWQJc4lvIUdlQWtTOfkgrWleoqRIm2lpxI0cJ5JMeNhOwTuzezjdLMsEf
         Dc+zW+PpFgr74NBoUlG59Dr868VaGQMiG9p40/4EYrjQ2KQKk4+yZIgjxgcqdi9qTCrE
         GKTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783730636; x=1784335436; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gq+LpXjjuDFhwsSf9BeC1njffhjf4uZbBP96nOGkoRA=;
        b=n1f6805AqwcTNiZ+EbUWunP1S24pDoMxxpd0EQclq7qJoyTfp8IgQK7TMrFu3574jt
         UyHl4vYudhCWipwMr+oBSfLdsbQOpdc3izyo8qsW8/tBcaN2KcqFos3jXgbcYNUTCsTX
         aiOeVdqLqkV6FVovSIo5FaKTEylrbavymmBgmFUvyY4EFQy/3ARtMcBIKl5RcTJ9bSAD
         jKEdKy+nsU4IWZW6RwpVJ38MgBZ7mNLS+1UTwxLfcT27rQ9c7nJILktBT2FbHlll/EON
         PBYyM4POqZf5hdeW1GDrWUqjEs0SbZZ+Mv+KaOmQ++p5z/ZCaqBoNk0fY8J0pYnPTxk6
         RDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783730636; x=1784335436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gq+LpXjjuDFhwsSf9BeC1njffhjf4uZbBP96nOGkoRA=;
        b=RPeYj7n2Py+kHSbd0xSiCKx6F5PlPgEET4Y6SikcpQ2CKospNMeH38lTa5Gev6WmH4
         RblWXY5rLKzcXJBcpRxepLduMzG02Ybj5YuYmdlDUFIZ5xCQWOxdA5MiA6Kmxk3RN9NL
         KHwXVHv1HIoVr/LAAzG5YuvYzA7QzS/6T5vU7EnxdM806HNju83YyTnsPSurTLeLKStg
         iKQSAUAnZjs4jAnDpUMPEwPJ1QwAnblQYTBc4bM9u+D+7p9St2OvgWpGr29sPxHgl9xX
         ueZ2VaiFGp94aaHFq97xD7qlI3t7Q68OJO5ipYwoCEk1ifkNQibVSus9eWNBRJtgGKEX
         Nx8A==
X-Forwarded-Encrypted: i=1; AHgh+Rpat//Pbc+bUkevl4V17fWCGrcpC4vsbDnUk8mGwcG4zIhdJv8zTj5b0BECVCZlP64Wrdv5dBNUNlaU@vger.kernel.org
X-Gm-Message-State: AOJu0YykD9MbYEnriP7I2nQ3NB7U4OaO3ASU4gJcOn08UpN4Py17eZFp
	BcAaZHR4HFRcFY7gUloU5gO5ReBDpxTMh7akP6kcAsiRJfrj3wfY+K3P832h8fdJs3WYYP6fKb6
	pxaE75O+pjZt6eBsnwfDPR6rcVvYoChU=
X-Gm-Gg: AfdE7clawZLfpm9yVD6xjn6KC0Fcvv8cGUb0gYLrxafk+4GKHjEJN2Z2FcfzHqAeD1/
	2Z2gjDn3a6iKWBryOFF9GLN26Jd7F/nCkmuerFchPKluOaQIhYZXRj6Dx3pls1fBbsn8mGKdNHH
	sH8FbtPpsxoCWEfqkMua+IBqc0rJAscDtV+7071fiMJMgboxdBXxrt1kIxH4V2BKBcRf50uojDy
	0qAJ7kYwcPaaFThgpzo9WXCZp+whCeU8jzUUc47/saVg8KYQ+wGa6kQJUbtuHFsDmjWjK0HUZrs
	s2swH/tNFmEO4wGWty2iwjJ7p7KK
X-Received: by 2002:a05:6300:6705:b0:3c0:9c19:658d with SMTP id
 adf61e73a8af0-3c110d3a4c5mr1146807637.71.1783730636253; Fri, 10 Jul 2026
 17:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5060a303-0389-4c62-9c0c-fc4307c24897@kernel.org>
 <20260708091135.94114-1-rounakdas2025@gmail.com> <20260708091135.94114-3-rounakdas2025@gmail.com>
 <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local>
In-Reply-To: <20260711000801.GCalGJYR1iaup7oCwY@fat_crate.local>
From: Rounak Das <rounakdas2025@gmail.com>
Date: Sat, 11 Jul 2026 04:43:44 +0400
X-Gm-Features: AVVi8CeQSU_NwS7p5d6V_6Ejomtm4Q7H22jdTVei4gmW2pNrLZNrRZHxqmrLhTg
Message-ID: <CAPYTKoMLXheN9HjQEPNtvK_JCJfZY6HabrC27UGVnHzC2zDbGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] EDAC/altera: remove remaining CONFIG_64BIT ifdefs
 in the DB-error path
To: Borislav Petkov <bp@alien8.de>
Cc: dinguyen@kernel.org, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for reworking the commit message. I apologise for the
initial wording, and your revised version sounds much better.

Best regards,
Rounak Das
