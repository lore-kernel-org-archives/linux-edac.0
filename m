Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507087;
	b=ifqUwAYSlYEIw8H+49zThcJM9tbmW3SScc2K4ry/D/GH8YgSap9TcxGOQZJoQ+LFJvJ/
	 Gs1cU23qRBBn6gT79DpKHMi2EQ8i7b7Rcdb5zElEeWNIbKSaB4v6tecvV0QISDmNWOt1y
	 EF27btQg81mzo2JebV1bNDp2CD+d8TXsJMGi7C4VzLg4u5cBFyf+dzaGKdUI+Rnh2mvn9
	 HMg/crji4ylLs+3v4Ggu4P2TPFlbipnbSoodDWijH1PVEBLGyY2i2D2Xo9Q0riXOnADtK
	 RflYZtVPkHUrA+Nj1+HuYc6eLfcEuB3rpdV+GjKHixnKcyWV86fZbXdzsu11DEumknQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5w6mqCTcKdMQ0+HIJVXoAnc5nRWigyCX9Zocs+ktwwg=;
	b=H1eKnUpLn+oIsU7mr5KS2uMPBmVVrn61Bbh9kz4aeEEw8Va5+etYCLPKQQ6jiMAjQq2M
	 75ScY2aEiyNBgUk98esExSOqpUVnkMFZAm4Fi7FzULMdB5RgPX0WeFaVXHDbb2DMmMQdZ
	 0ZGvE1kKqKNxiaVtDV8bHKaGskqlV/3ysu1UAb52ZrWtAxc6izHnaTAv0yCZea1SES3kM
	 l0HzHTMEId8DW4Zcx7UYd8fGOAsHrFQ/1TfixKj6N5/OygEur9VN6I1RVMWvMSNo8fXaN
	 SS3enRYsvRBKgohVW3/Ispc2I7CG2gzWoypYDvwnG6McMSBGVbSNI+dxZPUd3qx7LpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svauu2uo;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC2E606A321
	for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 18:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC2E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Svauu2uo
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3acec6677so6877948c88.1
        for <linux-edac@vger.kernel.org>; Thu, 12 Nov 2026 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794507086; x=1795111886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w6mqCTcKdMQ0+HIJVXoAnc5nRWigyCX9Zocs+ktwwg=;
        b=Svauu2uoxhiMPDBRZNt90WK4V5W/BE2SlB4TIRuDa97xUkqbp6gSpm3HPMMWTdl0NC
         Iv3BFnhhVZE4SmzoH2NKoe+rAjZqQ+94jo9VX+j1J1MUASZXW18MMAs9Y/oF3m4MRPOq
         eaMGSY+qnJVaNrFg2mIyZXLyJ7aYGYjDlryrjgll+hK3zuBNsUyAXRVbSKs1MxYAwz5K
         gZJnAwRFKcAKS6/MJ3TtFsil/yqw/fjrtXD0GFl/d1EIxRgSQRAU82/YkMeRuA4kEcD3
         ql8q9CS2zjxmyLQZOQmCXVH7JI3jOwEmSiCo4WZF5jyLNLViWktJhydEgb0pXJYVhZBX
         43Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507086; x=1795111886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5w6mqCTcKdMQ0+HIJVXoAnc5nRWigyCX9Zocs+ktwwg=;
        b=ttm1raY2SzhsGB8Xn2tHs7j50SHMaztq9GbBuZyO4SQEX4DDJv5e7hPCig5v+//ij0
         eN158hu4h6KuzTL/EZcQhxBpz611foo4umZzpTuVqCS/eszEQG5stzZelMFgIhS9/lMZ
         wes+BXdL4QB00cs/A6h9kDLRcJGqC6vCSedzkjYZ0r+n0EwEd/5NG37eghPVRnVihvD6
         FVkdtMRDGeKuu4VveOekZLmByr9NZ6H/oAqhv/qs4CzvWSYwntMBGPJ1fVK0Jw0J7rdk
         +cfdOLOGzYUsdJBX7CYPy6tsLQdiAFA/I5ghUZbBkaflwzLkJKJ3l81fiXAFypiPzhFi
         gmLw==
X-Forwarded-Encrypted: i=1; AL+hErFOq3gZstChKWAMf9N0pfONcskg4YhcSsAk2Ns+DIbPf1ImsLYwT/xWsrlZesPOoHkVzDoGrZsfzQip@vger.kernel.org
X-Gm-Message-State: APuU4Z8b5UC5LkAEU/yO1OVdQiszXDKeTK5dRmLNBSUNnEnwLclzIj8N
	vIYIXvT0yA+XeWYqggvjI+gFJO0hmtzTe4y5FiyDshIjHBmN2IueIbuNt/qZ65uA
X-Gm-Gg: AYBFou1KKBEpiKUeizYaJCqOOxNBHJaYoyVmABgSkWVRfOnBXbB9Xq0DGLe+YJ6Squy
	e3mdSeNF+s4LLs79n5NbnQ9SGnnuXuQXtABvG/MzG27ymnxMzTkEuuSWynX/DRs7rfATPBWTV5y
	OtVjoTpZ48DNha3P6r7qJRG1KRyUrT8fV/rB/BSEypaNq4JGQubVSL4xljWXtav3WUtc7YELvoP
	dBK/tTr0JG86YBYFBBv0fIMQY68h6HEeiKpUjsZ1uzHna203rBasN/ANfzUnWItEr0V2kB4/Ac/
	I379JHnD8MAlR7JH5uNgKFalehyZKGYk09jDF+Y3iwlGNJZ43c80ZJneoKnn/Yceo7HjDLLN5R+
	r51TITWm/suLnmDgddjdsvrtxBmM+P7BMpOdXqzJ57/J6kpO7hFesgWtxvez19E3WUO8y+TBy3y
	5N3z6M+s+2Rylr4X8PHZvVmf83qWyXNk2RnWEB11EAQHWyyCDSFzkiPTdcwQQnVpoKHSYD5aNQT
	i6J24JVZvaCDWMh9ignn0MJftxonQdb/Cr8oPgSNdeRVJsnZTVvfqoBlp2tuqRE6MnkRlp+eQQx
	0aatccOvObDQDuRdVX6NCu+2xHwg07OIRwj9uP3feg==
X-Received: by 2002:a05:701b:454e:10b0:1b3:ac34:bd59 with SMTP id a92af1059eb24-1b50316df59mr233084c88.45.1794507085868;
        Thu, 12 Nov 2026 10:11:25 -0800 (PST)
Received: from Alienware-m16.lan ([79.127.217.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm215678eec.4.2026.11.12.10.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:11:25 -0800 (PST)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: Aristeu Rozanski <aris@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2 1/2] i5000_edac: fix slot number passed to determine_mtr()
Date: Thu, 12 Nov 2026 10:11:20 -0800
Message-ID: <20261112181121.565824-2-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112181121.565824-1-andrew.luebke@gmail.com>
References: <20261112181121.565824-1-andrew.luebke@gmail.com>
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
v2: no change

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

