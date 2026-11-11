Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439535;
	b=VnPI3wIUDRyXR0KrjlUUhRgNuPFGOZB/FEDIIkj7HprRlgTAEa9jn785CXigl6fDiqP/
	 LwxKQ+npJsGIkguUnIbbrqnYONlDirO48XFyDgH7QbZQPgkfYn6eqAqs4uOuWQqsW7yhg
	 uNbxS+fzvgckvk6fhSD7rDGsbhLGMhA046A2v8xMr/B+TiIFeOFhGzpJZRYosMbkmelHo
	 9+AgqXiHLxLVx4a5VsGe+KfkPxvDkfp8wURktB1SO1iLXI82mnWoLwQ265uOb1HSu9wsw
	 yq2Fl6WjmzK+i1Dr4Cf7jUC17eTtHQ8NO7K2JbgmjTk01zK/2ZrTYA6aj7rbCI9Y2Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zeKs1Z2Pv2GV4AuEhN0bB0lWtBNEb9bqfYfvbaF4KSw=;
	b=083LKFIBPBL2OTan/sw4ztODjOh9naqRbxFhopxxx5lmJglrZk5aPKQNcSnAYbG9uH0m
	 z+MiZ6k1Fhq6q4478yQCO0nd412XK82g96X9c57WrJwUVgk9ZZ+fRXgD+DhVvcy0jOzCu
	 73jwqADjquYW76LSEJUXr0N1ZUtom2tIYr9KKk+b9wZ8d9q+v8wyitTOjIrYAu0FfMvzi
	 e9cgRoRQN88rhEW3CYPEpCFBmAFNJEYGaPXnXTPSu7fDatLr1fHNfHDB2wOzrsA14qP94
	 2ViwSWjS5T0/BxGRz+oKxtdWKu72PQHIEU2Z14fLaiiMKcvpOnjOi73cuxZnthyscFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6rDl+61;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE94606A332
	for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 23:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE94606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g6rDl+61
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso6298502eec.0
        for <linux-edac@vger.kernel.org>; Wed, 11 Nov 2026 15:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439534; x=1795044334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zeKs1Z2Pv2GV4AuEhN0bB0lWtBNEb9bqfYfvbaF4KSw=;
        b=g6rDl+61FuluwKbbZS7ohA76XPgzqchxtcwXJ3U+HFc1OENnRWxdAn32yXJDPMx/cY
         DLNbHcnYk7OaVfliE4zcBYnk8GZU2ryb6+ds6fRQj/xAAKwuXtzaaUbuW75CI+ylIu53
         Cm2yDRQuLlSfQRZhT+f7PCsmuVlqddZL+JrgUEBE/KrmsTiz/a6lG3PvoAjkyk7SRhXu
         gmhjdIl6uWGSxPwxh+kvHetunL2HG0oMdNCrAnakOR7loWLSPrTBcjJ/6czzZ27YeLdp
         dci6wLyO5Re90EgmB7ZVzkSPuwgJxgDhzx5Y3S9VjOeb1TTRlj7pUgu9h32zyR+ejNO6
         wVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439534; x=1795044334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zeKs1Z2Pv2GV4AuEhN0bB0lWtBNEb9bqfYfvbaF4KSw=;
        b=X9cJxpgX/U/yZJXZ8aYQuzCA546L+R31NRUtRP+pZysDXFx18VDmUqUgwHisPSU4ex
         oXrbyf32oJ47CLc2EEbZaqBTINmZ92e2Yr7z6yuTBcOUS+EnAA/8R7O9QleV3CmfEll7
         +DaSgG7C2j590r75kJTaw55rY4a4C37h28DV76u1K4p+s/jl0+NElZvuxYtCmRe+O7mu
         DYJCilRGORQXeDZdbqhwy3dbEjgphkx5LeAEUBRwLCY08yQuqR5ZS/UMoi1jmpiX0IPE
         ZoZ3RFoGSZ+Hl0F5/o2jxsXvuVlTwnci4ZW6aG2YuvN0tYrJVQZq+bAaDDBD12lgZPkv
         FuwA==
X-Forwarded-Encrypted: i=1; AL+hErEuNSfthsikf645kdrrzZz9HzbuQJAbZMdg9X3VIkv6fwWQmiyrmJ7ZRO3mG4f5C4bxQXezepxfgZLi@vger.kernel.org
X-Gm-Message-State: APuU4Z/yB63H1l4pl7ap91xKpzjsFFHg6Pp1jN8nZTMJ6+8RQAeWGwj5
	h0OwOKxllq+w6DFvNjeENVm/mA5p/ynWIHOjqhR0mqsSZ6xzsI1gPsDL
X-Gm-Gg: AYBFou0styqE0nMeDTddZv5mQJO5wIXarXvNpxGqTU2ybg7rrs8VFaTeT/nTLD8b7Sx
	N823rWHmrJ/q7HYB6jzvYOcGhyP352rBh4o+Pcj8+qFv6o/nw/YDO+jhqnawCjw+T/f11x+O4iE
	FIdAdnpCGjFc7JKOYKdKSJpZmHL3s0Jc3JwHD6i8gXSG2HWBBsLElwjXOK9SBZ/1Xry6894xTNa
	9Wosl+QxZVhck+OIltPpNzOaqZGM8gwrRqtrqz7F6ie3CHa/jde9QOcDiuhAsRvwomml0XGyAFM
	dsbu6D5pRX93Z41PhOsdHCN+jr/dLWx0o9HfYetmRwKWD4giK1zG33LO9E+I+Wo8olnPmVzV0OG
	BkQcHcMQQG0LlofQeYFjkrDod0aQUIdO25kWVVII5GoUWsNo3P/LCx8FVQnviSvVU9/Cp7C79N7
	OKniBMpKqTZLrUqth66jVDUPA+/pwYLaLsztVJEplGge/SqjtAXKUlZ5KBvd0XRJAW8ot2bdIOy
	crQObtB2Hc8hDG1kxKynxilkAVOiHIIa3TXY8y6N8vRQjK9ts0Rvzm4CrJONf4eG6A3+3eztwtv
	mDUpJGtVuOHy8bKo+RfHXW107nLlyK11cWcebSV33Wk=
X-Received: by 2002:a05:7301:d807:b0:378:2e89:3958 with SMTP id 5a478bee46e88-3782e893b15mr219848eec.19.1794439534310;
        Wed, 11 Nov 2026 15:25:34 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212ec002sm22626946eec.26.2026.11.11.15.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:25:33 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH 1/2] i5000_edac: fix slot number passed to determine_mtr()
Date: Wed, 11 Nov 2026 15:25:28 -0800
Message-ID: <20261111232529.407154-2-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111232529.407154-1-andrew.luebke@gmail.com>
References: <20261111232529.407154-1-andrew.luebke@gmail.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aristeu Rozanski <aris@redhat.com>

When the logic mapping branch/slot/channel was reworked back in
64e1fdaf55d6 ("i5000_edac: Fix the logic that retrieves memory information")
i5000_init_csrows() was not updated and kept passing twice the number
of slots to determine_mtr(), which leads to acessing past the end of
i5000_pvt.b1_mtr[]. This was found by KASAN.

Fixes: 64e1fdaf55d6 ("i5000_edac: Fix the logic that retrieves memory information")
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Borislav Petkov <bp@suse.de>
Signed-off-by: Aristeu Rozanski <aris@redhat.com>
Link: https://lore.kernel.org/all/20220921181009.oxytvicy6sry6it7@redhat.com/
Cc: stable@vger.kernel.org
Tested-by: Andrew Luebke <andrew.luebke@gmail.com>
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---
 drivers/edac/i5000_edac.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index c0faf55f7812..342b69909600 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -1253,14 +1253,12 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 	struct i5000_pvt *pvt;
 	struct dimm_info *dimm;
 	int empty;
-	int max_csrows;
 	int mtr;
 	int csrow_megs;
 	int channel;
 	int slot;
 
 	pvt = mci->pvt_info;
-	max_csrows = pvt->maxdimmperch * 2;
 
 	empty = 1;		/* Assume NO memory */
 
@@ -1271,7 +1269,7 @@ static int i5000_init_csrows(struct mem_ctl_info *mci)
 	 * to map the dimms. A good cleanup would be to remove this array,
 	 * and do a loop here with branch, channel, slot
 	 */
-	for (slot = 0; slot < max_csrows; slot++) {
+	for (slot = 0; slot < pvt->maxdimmperch; slot++) {
 		for (channel = 0; channel < pvt->maxch; channel++) {
 
 			mtr = determine_mtr(pvt, slot, channel);
-- 
2.47.3

