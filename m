Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA518A6DB
	for <linux-edac@vger.kernel.org>; Mon,  7 Sep 2026 06:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761923; cv=none; b=HIM2JMwFZzkc8ooQV5cpyR30vqJtuLF70y9DhiAGZlpfG+LybwdveUNfUtfcWZAfrFGlzSEEwzffSbwmkbwsWoBWQw5N8am15PUxUEdbQcgAC4/HvJJb6Qm2JZhrgXDLFzwNkRjt38DMBtcu/E49TdAnsq+URaEu3sGj8qaoYAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761923; c=relaxed/simple;
	bh=Q4LLtUC/9zyY2h13ud9mSFDS4OWjjV6vx8SQFtbhqOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBeBdRoC8RpVB0UhFrUXy5/TGmiT+LoU3Orc4WnFrjRGX5R1qkIHsWzdIa1fOxYCk4P29Rmn0CQ/2bhEtpB/o8CHTf4NDRG0nxLMHtFRSTrGoNKg7y4zzyr/bTbpYU3PVXl7KlrU9BwXHxVJqrTVar+3MGBa/35/s21HrJaIDI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lz8f9y/U; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lz8f9y/U"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39b35105ba4so2677207a91.1
        for <linux-edac@vger.kernel.org>; Sun, 06 Sep 2026 23:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761922; x=1789366722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=USv9M1kYFctEolm5xBEMg+3syhXq8YqrYCwILkWBZu0=;
        b=lz8f9y/Uu78X7p1qyx0sJbxBToeUmZrO286ABPJchaBDk+vUZzNld2kzrjVoDZ88/A
         VgSce2KWnY++BsIo9UUCSCHZN/Rw59BotDwKXvINqOTcreUv6vyUNRq2jgBDW1yRg8ik
         On1ctg1vZjbGyNjzc1+MtNLJ/RSvPEgJUnn+EvQPcaWSLT74PNQDFiF+N8DOycWzHM+D
         Wn4mbMfcnkpR75YI1p8Deg7eAezThB47RHbbION0VNxayHuIuJzGH6VoEyhJNiRPuCmk
         fjqtQyO3d6WWgzGF/zcBZ8yyDVFgjKyBEURvqMFjbQRmso703DGN7Ev1IyudEsAZMI94
         4ROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761922; x=1789366722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=USv9M1kYFctEolm5xBEMg+3syhXq8YqrYCwILkWBZu0=;
        b=pb0ZrCNQj9rbcH1Y4bApqueyPpAXyIEjXgBKf9tDEDMBWj+dugXCz0sEV1kceoY+Nj
         IT8D4QAvfs1gQcAa6Aa9O5j9737z1YQq1kub1j33JwF+jEHIFLlKyW2SvmuRElfHKTa9
         +HxtPA3nGnGslq43YzgW2WFX9pESGhS+AxF47f+3k2gEj9fST5dPws22t2B0rbIM+BEz
         Rdt0HPrhAAKloAUmUe1ae6/S17rlOJPGoFVif7ymlAytAlqOzdINCUgRZUL5THuoG7MB
         TZO8cv3ZOvqaMRhG5sSJiLWXkxwYsZ9aVO67937lsHc6QaJzG21Qf7NhFth6u6owzqUI
         3Y5g==
X-Gm-Message-State: AFuF++ltYnZnGnxQfNG4+QyJTr3/R6Mqc2mUMxkR3EhWL3dNJVTjSbNg
	q7s9fSXQSAk4Yyu3pDDptd7ab6h3T5hUdE4j+7GbycSbS+/6cn84Il4p
X-Gm-Gg: AYBFou290nk+am4YwDjp6V+f5S65YjJUNKRh50WpDMZLmLChwHNdiJ5ZIfIuEXmO9ah
	LZZWsQ/EAe7wOz6+igODLNqmhDeUvxB6k60opuqn4mb/5KuENKcgVu1us3nbl82yHcFo02xs5VX
	pT6T+a3/NjfydwBSh8IMwicGHNGe5tTMmaXeGrsJjf2X2+JpyN1r1dH7ldAJdGlG0wHQ99Ekyf4
	wn2CdluIPYUIUadjubYIv06UorvG7kOIvHGf64tD03AYMNBiLEihW8i4Pwm5EnU33bUN+SUyJSE
	hfkf1rw1aOVEg0iLk2IBbZkG8Cj/d4ZjfZFEH8B91sbJR9eHjmKwdo+gM+1UrZPlkXlXpHGfUSf
	U05BGRYshWQdu+k23R0nFQEV4c3dveZCFRp4PSpFTw6vJNMsI7pLWG9sRgMNUkSj6t204lI3mNL
	QMRD1T7rjZ4tLsWWMMjYpUyQywTOplk0TFQdoYOiBcqW+gZ7+DL2n+PsXdGglyhVyY/fPLgPdVz
	673/9hASfKung==
X-Received: by 2002:a17:90a:e18b:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39b26155274mr30100957a91.10.1788761921573;
        Sun, 06 Sep 2026 23:18:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm27508896c88.15.2026.09.06.23.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:18:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] edac: fix typo "enqueing" in comment
Date: Mon,  7 Sep 2026 11:48:37 +0530
Message-ID: <20260907061837.40929-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "enqueing" to "enqueuing", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/edac/i5100_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/i5100_edac.c b/drivers/edac/i5100_edac.c
index d30919ceb22b..235a3a46585d 100644
--- a/drivers/edac/i5100_edac.c
+++ b/drivers/edac/i5100_edac.c
@@ -557,7 +557,7 @@ static void i5100_check_error(struct mem_ctl_info *mci)
 }
 
 /* The i5100 chipset will scrub the entire memory once, then
- * set a done bit. Continuous scrubbing is achieved by enqueing
+ * set a done bit. Continuous scrubbing is achieved by enqueuing
  * delayed work to a workqueue, checking every few minutes if
  * the scrubbing has completed and if so reinitiating it.
  */
-- 
2.48.1

