Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5168541CB5E
	for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379698; cv=none; b=qGAud80kTPAU+lp42f0cr0zTlu+s+j2KPU02wTsNCQNctiBq3y5BZ2er0NDUBsMKmNO561H3FJEWy+wJiro5Xhok7SvBgpU/9z0hvP7Fixo60M1huZhKHOgLQ1U8nGqeRIMaXjOUvxAl+CC6MMlRmwFjpQcml5OIrW4AYkgOcBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379698; c=relaxed/simple;
	bh=AZylGUQN3FOyOExthuRk7+ALVyRlRDv5nRJSPRc+2G8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aKGXRO0VJKlOpBfIzZCDvFroW2DLxne7Pl4prQW2iAOBeDBa4zXJMm3m6VPXa4Dtuhfe4yJDZuDQPEER41My3Ts9/MX8id2Y+BPA6o42MxeStrNI4VWJhTZwDMfBC8PincfVyZ0+78MOVOUtp/6vYmmOEGzgjGXQk3H0//j4tb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UlBKicDX; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UlBKicDX"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a17bf3d42eso1990238a12.1
        for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 09:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379694; x=1786984494; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=;
        b=UlBKicDXMikMZVeQyO72KakI/tsJ6wKXYzFsLuPL1asf5rWsA4gKCEYoR3Wt8rqjHx
         maJIOyYEvSldosLadPRCtnv0VKi0PxlY8doPERnl34LeQOgr8UzWj9msLNs8cd9IWvS/
         CuENHgkIUZ8Wn+/Us1unmtHTlr5KYA0uL0oTW4mpuRsRBMD9CjmF7ryzZhBRdPQfEmhc
         blix23+Wlz4hGVOJwP2TYSyqiuG+11Cv1JeBF9ZKiagXdqvCaqv4SI69KOLfFFs8tdRh
         iTxkEckI9J/b8rQ1PJYBhiqPfJdVhC7bbTfQvan1q2oHNK1ujulWUuM8VIe9RgEn3SKg
         IUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379694; x=1786984494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L84OjIpSeCWFBArdFIo9a7688YTN2+iL7sp2DP0ZJfM=;
        b=cmnciEu2Ecumu7XEczwZ7L9IT7+sXrpWTA8J/4r0rWjjSabPwzBfRh/Hvcmv4ef2oq
         rdQR6YYUrbRsX8lFxxesK83e3a5//DJbAwPUA2UQNHe9CaJcuC528notp9VqHaXzIg40
         208ekttGMrieMtZTQxMSmTUirFePd5SeT1p+yGoUa+4G/cICcoXYSyg8OgQuZYXmlrqQ
         QM9U3DP3YvDp5fp4cNzvG72a5zZlR76lyF2G0x0wUDkG3Zs99pKaCIC7Gr7BbkxIn2/U
         441j+iDJf1CHKa/r3Y0y8mYYSSI6deBEQG05kOudGOgw0/LtwwbhDO9Mz1SNwIm2pN+L
         e0XQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRnsR6R+WF4XNBhLVQ8ZeHOPAiD54aT9FAgD7Myk1FPVAxXhMimNpnsciU4quZ3SlGgQ8sg4WziBD0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/mtGbNfJmNqfF9htuTsQJskaV10hypknB7CdyPCfq3dkSJfCV
	k3syxg0dxj/W7gulw5dAMagk0tNA7UhoPd/egpKaK466Ay/DWn5GkTrlxA9U7Mx3MBg6Vz6zIOd
	jRYIRY2TFliXcCTzmZw==
X-Received: from edgj25-n1.prod.google.com ([2002:a05:6402:a5d9:10b0:6a1:fe68:3f56])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:278f:b0:698:af31:5a9b with SMTP id 4fb4d7f45d1cf-6a14f0b8fa8mr21454308a12.9.1786379693823;
 Mon, 10 Aug 2026 09:34:53 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:13 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-4-tarunsahu@google.com>
Subject: [PATCH 3/4] EDAC/versalnet: use put_device() on device_register() failure
From: Tarun Sahu <tarunsahu@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geoff Levand <geoff@infradead.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, Borislav Petkov <bp@alien8.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

When device_register() fails, calling kfree(dev) directly bypasses the
device_release() callback (versal_edac_release) and leaks the allocated
driver core structures.

Fix this by calling put_device(dev) when device_register() returns an
error, ensuring proper refcount decrement and release cleanup.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/edac/versalnet_edac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 97ec05d68bbb..2912b3658915 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	dev->release = versal_edac_release;
 
 	rc = device_register(dev);
-	if (rc)
+	if (rc) {
+		put_device(dev);
 		goto err_mc_free;
+	}
 
 	mci->pdev = dev;
 	mc_init(mci, dev);
@@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
 	device_unregister(mci->pdev);
 err_mc_free:
 	edac_mc_free(mci);
+	return rc;
 err_dev_free:
 	kfree(dev);
-
 	return rc;
 }
 
-- 
2.55.0.679.g6767b8d81c-goog

