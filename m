Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C03CF213
	for <linux-edac@vger.kernel.org>; Tue, 15 Sep 2026 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437339; cv=none; b=plh7qdbviCrOx1GtKzCS4F2emY9cbPAnrgzLJFq0UNUWIZdMd1bEfJtp1LOhEdaJ3cvSMn+DxlZXLUWXMoxGgQgf3noYkHK80AnOdmU0VZ+o8f725jO23mYy5Bghd81jKrTC93cYn6/oGpDs2Y1NbyDxH9rPOrbeYiXf7NNJ9Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437339; c=relaxed/simple;
	bh=YSvTJwjDAjCvoWE2T05StqLkRwhDOCuesdzub+bU8P8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3bgw49PcwxzVvEC+5ZUzakWnbdgq+2gPhxG5vC5rswwk4nZpBLzctop/2r7QiVRsk3P5fj5w2MVZTDYI4GOZXiCjtKO0Ak7XFS8VccS6LnbjgjcOreMgAWa8vUHi1bpwaYXfYXMJZh5ne6WfqFH2IBJZN5y+b3ZRtbY1rgecQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+GZCKmf; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+GZCKmf"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530c602630bso29124161cf.3
        for <linux-edac@vger.kernel.org>; Mon, 14 Sep 2026 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437337; x=1790042137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQzxIfg2AQzCkVpbVYXrLDBgU99fKCXJvWhA7g6zSYM=;
        b=A+GZCKmfuOTbccApiqULuH46tzXOjRXMUGLUEbjteF8ZhP8mPCWRUQPre5tNan3k+S
         eS9mxuoij3LXCk7BG1EaILuTIJ/sPZ/8A1NkNX+3JvtnHGZ0+gZuBbNxQDPTCABeL9dA
         RmVcl2E2cQ6ruP0wmmvB4HacfnSYB5bD8fwtTkpcI6XhGfpgj/tVIoqywwrsFgT+z70j
         IgsAdp2N8Uiba5O67b0JAfWq3KQcEy0srgiyHr+nCoKLEl0rnKme/iZd/Zc8EEaPOVUu
         /I4v3Gcrko/eSTEjlp2qIb2DxlyJl7WOW4a2yl2lIS5nVQNC13aw2Ig9ESk/mONy5dmD
         Q/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437337; x=1790042137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQzxIfg2AQzCkVpbVYXrLDBgU99fKCXJvWhA7g6zSYM=;
        b=YvfjkswA6tVbTP+mP0Fs+9ZTpVktwRfrGK33rYxtkfsPcZwgoMj30uP0S0qKgQuTJS
         1vz1FQHYHF3bgwEbIJ+5iD7WsqIxEb0jQSZA3EfY2Gy/7Yz2q5+O/6uqE8TrjyOl2IBI
         4MxHY2Q+XHwsf/GwqURwZQp5ZAIso5DRP4xuP5gWTtUekBJCXMLIEqFw+eY2s5Iw5+Jd
         OFH1xQCp74POEi5cm8wbU9BKIZv6m3lzQJg0hXRiXTPZVh4MKCOhN89sg69l5EWqOhc+
         Qp2mF/fiJwk+z+l2Pl2NwjUkjH3Aq+L0/WO7qWCbSiK9upvOwyMJ91/b1Mxtmc/iwuYH
         XC9Q==
X-Gm-Message-State: AFuF++m+VR6uLqvbMNnvnSIvxyz8P4glVeNM1NT+aNVFpS1nZCWKTrPu
	kFPAwGV/GZkBVSxbYfmQOeyoGaT8mvHdtrC0BNc0uC5Jk44YD+dAzNY=
X-Gm-Gg: AYBFou1g65R3+t+cj6Oe81JfULvJJ9wiXPnBrGypL+msM3rFR7RW65qqOXxY/WLuMsw
	OS/HgI4zCTk6T1cmah8gU+PIMp+ijiDlq4YXI6LUILXpFtCsNaw1BsrRfWdVHOElplnLNh2Q1Nr
	/Lk/86JBQYeMG1AzuIMpqjz39tIbgRPyrdDW/oaifkKPFC/uy/sorteY5CZmD15tj74EwGipCGt
	NZgUy85VUyz+1VI4JCEpOvpHJZ0BT8aCSeQyFo6iRcOyvr99iEICBwsXWNzKppVAsVXksU9hgAu
	A9SnRqbVJjgf0da69PK0m9j6RH6S72SUgeGzU3c3VySyu4Y0z0HRXDAPGeeQjZuTHEFfcN+4CSv
	lh3U7oU4Jw3lQNojitMKsp87Nr5j65DIS8bfn/q9fGFd7fy4pZxtTKc7juQnmGAXyvREBiUuMW9
	jyCETEssZmxCUq87Hkz46sIep0XSx/E/2T2XB4mGonu62umqKqSGBHS2EvEQFjiqV4RwdEuvERw
	dHcHdrcZCbLylDWOF+s+jrZnaxnl3n1szI8Bb9BR/oCoGPcLrwwKqkic4rK5Y7S4Y94VNavKu2S
	PzroQcj5GJ9s1k/v0uAZgQB32pNKgkFWf5RjTVap3hrK9HyVeUXH/rhN2rbpVx2AKnbbnw==
X-Received: by 2002:a05:622a:387:b0:530:ba79:edd3 with SMTP id d75a77b69052e-5310d09f26emr80280201cf.62.1789437336690;
        Mon, 14 Sep 2026 18:55:36 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f5ebc79sm109264546d6.48.2026.09.14.18.55.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:55:35 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 3/3] EDAC/x38: Balance PCI device enablement
Date: Mon, 14 Sep 2026 21:55:19 -0400
Message-ID: <20260915015519.83833-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260915015519.83833-1-mhun512@gmail.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

x38_init_one() leaves the PCI enable reference held when probing fails
and when the controller is removed. Disable the device on probe failure
and after removing the EDAC controller. Keep explicit cleanup because
module initialization can call x38_init_one() outside PCI driver binding.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: df8bc08c192f ("edac x38: new MC driver module")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/edac/x38_edac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/edac/x38_edac.c b/drivers/edac/x38_edac.c
--- a/drivers/edac/x38_edac.c
+++ b/drivers/edac/x38_edac.c
@@ -423,6 +423,8 @@ static int x38_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -EIO;
 
 	rc = x38_probe1(pdev, ent->driver_data);
+	if (rc)
+		pci_disable_device(pdev);
 	if (!mci_pdev)
 		mci_pdev = pci_dev_get(pdev);
 
@@ -439,9 +441,11 @@ static void x38_remove_one(struct pci_dev *pdev)
 	if (!mci)
 		return;
 
 	iounmap(mci->pvt_info);
 
 	edac_mc_free(mci);
+
+	pci_disable_device(pdev);
 }
 
 static const struct pci_device_id x38_pci_tbl[] = {
