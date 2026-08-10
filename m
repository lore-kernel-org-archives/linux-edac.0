Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FE5428463
	for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379694; cv=none; b=fRr3Qb+zk+VYitQwPCTw8jBTbx7fL9t/v9LyCqb0jOBC/rikZxOA6GHWguEmMJva6x1seGtVN8kjIgDL/7I5YIrs1z6mNf0zhEj/1gByVpkaCaS0X2KVhjEpyUs5UqpQVFpBuk43zalRZNe5Q+fbomL7QvbTZiBdCN4Ae6NCIhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379694; c=relaxed/simple;
	bh=ajbvcjZXnT3+iWpd7dWUGsxzHJKakpxdBrDOcC2Np+8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OOrpKQyQEvSgRVyecq41+KQQDCawQaS0O7XaBa1U6lvR42f4PZH/2j5jBdeHfkgcbPliyYptfKMbnbIGDmZ0uT+Uz9YGWM2CAhD4NUzjoecPDJeSwEupGsNJIEcvDfDwOLSgCMsnPoX6lrJ0Pkgh9Iyem9lhMaiAIWSRc1Tg7r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M+3IDqfO; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M+3IDqfO"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15c6a68406so144729266b.3
        for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379691; x=1786984491; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=;
        b=M+3IDqfOe3y7bA+FRgPh423ArHZo1vzFt3qJvVPc8bKKuUuFEWqXMtm1XZap/V+Pj8
         P74ke092X7oxGUf4Bx1A2q06FINsWV6eXU/MMKYb5+/PbT7zAjl5N5KgYssAl5zq8EWI
         36J0vkkGKk+Bn9wQ0+QiirgHmSFaestTw22WEeqeWR5fcre5MiMCwSyWSqReQ4w6xmwu
         gA806VBdFgLfRhnWl5X2hqMBszqQ/EPoh5Riqs+lOlaYITX5YAOy0Z20GWND4EQWJV8d
         f++uw7EvwuTX+5adKXxjh5q8TXZcyEf+LR/v+VdX315X9vudBrSeAcZhY4wRcbWPGbS2
         Pudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379691; x=1786984491;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDGvS9HpsrPtLNw2H79kc5fyPEaWVAB8Beu1OXPCfRo=;
        b=Zy9u3Ei5S4rHS9vaxMiLT9LYAuHxmRo338oPCzvjhNt/7dBvUvn3PrRgFk2ITOemGm
         LpIys9UCIzh8u+DUW5yVLjLpXPZjuxl+TpbZZAZbjv0rwmxoSIwl6EMTatHxiqoZRt69
         xka5R6gB6ath674vGcuXNCWTup63UghOcAdE4bQQLP+uRzS4CvMIHqMU/1yO1VNWmDvl
         zmCB/dinmXTlSIgH+D/kggVTB/CSEvirt83XUkBB5IG+EWZELwsCSAbWaFuJjEN00ilb
         71Y4zRwe5rv6hfGcCScdUDQ3m2JTHhGcY3rG0UNfyU2SLGIAb1RLsI/orLUjt0LxCWGz
         CvRw==
X-Forwarded-Encrypted: i=1; AHgh+RqmqBA3vkPGw5VJD/iyTt7VfHfOPbJy0xIzMfBWv6vsBzFehDEOxPwbhACAJ2D7CzVvoNvH+QvZ04Lk@vger.kernel.org
X-Gm-Message-State: AOJu0YzCWPuqE7NvN2KB7ltMppll+1rhor2v4mSjCv60vD4Pftk3cPsO
	pzCi6eSxPRykAQIdm4527ZySMlHmRGKwREkeqOBtJW6l5vvqcteBlQaupzjorvu5cFXjniK65dE
	OZ7+gkXTPwWuc5XmmNw==
X-Received: from ejzq2.prod.google.com ([2002:a17:906:b282:b0:c1c:22c5:732])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7ba5:b0:c15:f26a:342f with SMTP id a640c23a62f3a-c2073392a89mr1505099466b.23.1786379690769;
 Mon, 10 Aug 2026 09:34:50 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:10 +0000
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-1-tarunsahu@google.com>
Subject: [PATCH 0/4] Convert manual kfree(dev) to put_device()
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

Hello,

As per the guidelines, no devices that are tried to register with
device_register or to add using device_add, must use put_device on their
failure path. These series contains 4 patches that update these
instances.

Tarun Sahu (4):
  ARM: locomo: use put_device() on device_register() failure
  firmware/edd: use kobject_put() on edd_device_register() failure
  EDAC/versalnet: use put_device() on device_register() failure
  powerpc/ps3: use put_device() on device_register() failure in
    ps3_system_bus_device_register

 arch/arm/common/locomo.c                 | 13 ++--
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 drivers/edac/versalnet_edac.c            |  6 +-
 drivers/firmware/edd.c                   |  2 +-
 5 files changed, 63 insertions(+), 43 deletions(-)


base-commit: dbaafe9cc56a996931eedfe043eb34418cc9cd9b
-- 
2.55.0.679.g6767b8d81c-goog

