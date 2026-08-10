Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53B3429036
	for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786379696; cv=none; b=RAnCYNqZ+liMhv5BdJ5Dl3CZd+3Shc7R1BfobPZgLghIGR3szpEQIUFDC5PPoVCF1L7wRaQdvKMx1k/gvN2YFgwLPAGPgdPt5etT9QJ+Qxc9PNCPS4pG7ylm3Z+M6bjrsNdJyvDeg+7Oawuow3LYcW7PTYh6glk9HkeKap63yrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786379696; c=relaxed/simple;
	bh=GC+CJo5FlA/SE2/QVcHL36Xcw5XC5Gyu8Y+sDTlvf54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XEhIEpZD46U6/0bTr03zRXExlU1IVksPpp++hpIkF/Y4Kkc/2oSHY33sge32n9ph2747HHPHU6xUtQdO9eUndw6b/OClhQf7x/dKvCIHz1+9hXUAJ8GQqoJAhM6VXe7CuWZr712U4tFHLvqeZ+iht1sp74PYZOyt46jyBRjg87Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dXnoSpk1; arc=none smtp.client-ip=209.85.208.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dXnoSpk1"
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-69cd6606b19so1740382a12.1
        for <linux-edac@vger.kernel.org>; Mon, 10 Aug 2026 09:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786379693; x=1786984493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=;
        b=dXnoSpk1GvFIs/7MzjDDLVPtl0XkokwJi5OyqSbbOIEzmz75l5HDPlLNFvu1KPTfDf
         jyaFdRmH4POvkAhbdMOy9KFU6osfFDdpuMtlTvHuW4XOW+QM5NeY2dWjrg6e/0xRPa8w
         0t8Cy5NlPkgDaiDifX/nnv0ya8U3O8oi+6Ijb4RWPzoSwdbrLvO9bhpCzqr/7+VFqsK3
         hfuroVjBwa8zVx7+TV7RYSbLkgqtOSuc72XT6tuTmdkojby1US14V3/iDrBdZ/3CYvu5
         XdEjwKXsTpO3+vNyDL6erJRfRkHams8KFk6+ay3c4Mhlh8ulqaMA6EvUz8axjArtkQGc
         ya+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786379693; x=1786984493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2W9GjrX12XMdTPANAxHOJwxcvmu8lBZVUg7itISKfu8=;
        b=c54DK+nS0t00rQfb5RHnJhzDT9C5HQ1Ql+hoOBV1quxZOuavwByhZSC4sWGWCnaDqe
         yxo4M2bCJeFjXuc2Nma1oEaMeqaaFcd66VpxeM0Lp0RsyvPb3DPVUaoDXR24CUV3NhJg
         G15qLwowlTMFkeMSbPOK24RpDmqZCvZtOlCUsGajvckjC4MjndAnsvKhqJWvOlcz9/Jr
         APP2qvCNJNgMXsC1KLDiH4rj8PbZzWhJ/UhI55MAa1ZETkT7We9Ds8IIYmfzs8yYdDzK
         gF40PMe4iaew1s7GsjYb8zka4+aS2yIep2bGqdNfmDHSs72SAfbD9Ufqs/ejsuxf15OJ
         QzgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrHr8HwJTvauxPpN7tua6D45ETJxAPnfXKq2J3VZSecxAdvvQE5xXXEbeGNG3gZq+5lRuvpzQGRZCqQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8J+29vagdcrN4qrWLzPwo1VKlpXU7IJg/HqstRSio37zEZ/wP
	eewsdDk8OhPLCurgjJHnXJGruntHnfFBAKttaY15/ZObZMParZ5nsaTifW1O5bfKNEyGptyLl8i
	wIVoDgqN5ovdHa6t6MQ==
X-Received: from edbay18.prod.google.com ([2002:a05:6402:2032:b0:6a0:a508:c896])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:454b:b0:6a1:c908:1701 with SMTP id 4fb4d7f45d1cf-6a355e2d32amr1548538a12.13.1786379692937;
 Mon, 10 Aug 2026 09:34:52 -0700 (PDT)
Date: Mon, 10 Aug 2026 16:28:12 +0000
In-Reply-To: <20260810162814.1398016-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260810162814.1398016-3-tarunsahu@google.com>
Subject: [PATCH 2/4] firmware/edd: use kobject_put() on edd_device_register() failure
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

When edd_device_register() fails after initializing the kobject with
kobject_init_and_add(), calling kfree(edev) directly bypasses the
kobject release callback (edd_release) and leaks the allocated kobject
resources.

Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
registration failure.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
---
 drivers/firmware/edd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
index f980c5b56858..763e7b16d517 100644
--- a/drivers/firmware/edd.c
+++ b/drivers/firmware/edd.c
@@ -748,7 +748,7 @@ edd_init(void)
 
 		rc = edd_device_register(edev, i);
 		if (rc) {
-			kfree(edev);
+			kobject_put(&edev->kobj);
 			goto out;
 		}
 		edd_devices[i] = edev;
-- 
2.55.0.679.g6767b8d81c-goog

