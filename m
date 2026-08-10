Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD042884A
	for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379696; cv=none; b=hPiE/0FkSdX39G/cP/fXJ034413Q8IBPpIyIGTWu085rWJLmfrQXiXR+0CWyHWY8X4lEg3pe15LdXo5CHqsz+/ofwpGc7SQPOWVVcDE3BS1wh2wrF/QDOTc8G9aQdANmYQjRG8lZPINagEF9kbcer1bT9aKtkQic93wMBlf9vCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379696; c=relaxed/simple;
	bh=JtQlqs+VnfmqAU2g0ICeTfBNi0n5zYXAtKGUEtwOXP4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pKaMs8xsPN5h9hdg2Z499l/GFYN0E9MLujmq6bzZwpCbmnwL79O/OYk6q+ydJOzmNH8aPhOLeleRR79QhJv56LQtYS17mceNBL8DBYnAxyFEpX2vCgTFyS/AAYMWIkiBYRBAooIqrcss1XMrsD8bAdFxgettoSnc6AqSpBHtKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JYinrBaY; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JYinrBaY"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a14f110515so1988496a12.0
        for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 09:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379692; x=1786984492; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=;
        b=JYinrBaY1NB0Lhz763FwPtZW/HpsLU71zs638UL7M+UfX7qqwfNnZjSW0Ad7xlg+6S
         0bbd7n5jo8aRJLcsp482X8ElVkkUTpHrTOEsFeWHBMNBsZdpqnBbahoyUbpKS9uHfDJR
         uQXCc1gfolkSRn4o2xe+DbVWxW/jXuT20G8BDhLGgWjKkuSQr7I0PPGPvrmIJycKJ/YN
         Tt8imrX4tU478u0s1z3yqIQtiHgUAXvucVFtqRk7xOu5eIWEHLy4igO57XPin1x2gmPf
         wpXCtrvZMKUOXRunI0xBusO7zhF7/MYa7nVLJVb5ugLNX7npaZ3SHstIHQsrmBW7xc2W
         U1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379692; x=1786984492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1E8OcPKQa3EfyTN7DtxgAyhHDdwMTH4+JtgNWA55MM=;
        b=dXGKjKsGxSAHt4Cj0XqSUcblGKwI93BXy9Lb+pvF3mQv9dCmhRScMTxZ7DEN2WDz2T
         0ExLudHQl+sScD5DpQlIIXh13FHkhqPkkCcmir7WcZrM7xSzgC35kuTA13QQ4MIOmiwI
         Q+KGCQlw67Jue+DZqQl2EzYr1w83XYtdT7scZNlUcHrwBp2bTqpDVv0gzJgYEdPVsxwL
         JMIunO9Xgex3DgQnil8npn2Ju6Tg8XGEw7qXuADP6qrbsx/AiT1ZBzVqR+nmqKt20QuH
         hXDQ9hchYN82A3sC++TnAyUg6yF3WOVT0YUuamA9mOUkpQrHBDDUeVrVsxZ3je92cc95
         SPxw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7QAak5qgd8r4/wypr++As8qIQv5UOZnHd27vYBBt2djxS8r1ZbdwJsy3UYcEjgbe3MAf3S/Bpmvvp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPvNz92hlq+Bvd8kaoWh0kU40ETtKpPorzDoa1WMbUDOg6d3Ah
	YRmq/M9M8OtBDkU0n2b8d6isX1f6Q715ZdihyZnPU/kjWOqMHLUiUatB6HLTMembOlkMvRtDPlS
	/wbMBcTWwZKZvZz3H3A==
X-Received: from edzh5.prod.google.com ([2002:a05:6402:945:b0:6a1:c0a:e022])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2110:b0:698:6620:d988 with SMTP id 4fb4d7f45d1cf-6a355e1332amr1811578a12.15.1786379691640;
 Mon, 10 Aug 2026 09:34:51 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:11 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-2-tarunsahu@google.com>
Subject: [PATCH 1/4] ARM: locomo: use put_device() on device_register() failure
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
device_release() callback (locomo_dev_release) and leaks internal driver
core structures allocated during device initialization.

Fix this by replacing direct kfree(dev) with put_device(&dev->dev) when
device_register() returns an error, ensuring proper refcount decrement
and cleanup via locomo_dev_release().

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 arch/arm/common/locomo.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/common/locomo.c b/arch/arm/common/locomo.c
index 55e360452828..0f6689d343b0 100644
--- a/arch/arm/common/locomo.c
+++ b/arch/arm/common/locomo.c
@@ -223,10 +223,8 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 	int ret;
 
 	dev = kzalloc_obj(struct locomo_dev);
-	if (!dev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!dev)
+		return -ENOMEM;
 
 	/*
 	 * If the parent device has a DMA mask associated with it,
@@ -255,10 +253,11 @@ locomo_init_one_child(struct locomo *lchip, struct locomo_dev_info *info)
 
 	ret = device_register(&dev->dev);
 	if (ret) {
- out:
-		kfree(dev);
+		put_device(&dev->dev);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
 #ifdef CONFIG_PM
-- 
2.55.0.679.g6767b8d81c-goog

