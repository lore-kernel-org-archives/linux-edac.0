Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B13B0AD4
	for <linux-edac@vger.kernel.org>; Mon, 12 Oct 2026 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833608; cv=none; b=g2C0PCvlXYKiyRIT3yawe43YNZ6e6DoTaqyaN9ZiKBvhD6OkLAoXqYIFBVZlIfK8sGfiSMyab6Kkw9NhdtO7o8gPM5sn3b9RKGrgecKjeOSnGnrlq9bsLmU4Oyfc7aPETpxCqfyWzmGNIMIFqPR18FBTnkW7HPh9/WQGymVMIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833608; c=relaxed/simple;
	bh=K3vL916hwAzIEhpMQoKwDIcw4kalgkk+rOVRXH/u/q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uViQ3braQnjlpUBcYtyfAWCFT7eFqb9CESxufAY+3rQseI0ZTR4b9nA+ByniS47in7ygbnUyphfpjQvluIOm9V5o8U94tFH9Ce40FaLihZpbJNfh6P6sb4qjaxb6VH83WsZUYB7WBh4M76BC6SJhGjrdNFbdeDBo0sRSOw301LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com; spf=none smtp.mailfrom=adrianschlegel.com; dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b=XXIf3e5w; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=adrianschlegel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adrianschlegel-com.20251104.gappssmtp.com header.i=@adrianschlegel-com.20251104.gappssmtp.com header.b="XXIf3e5w"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so22541535e9.2
        for <linux-edac@vger.kernel.org>; Mon, 12 Oct 2026 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adrianschlegel-com.20251104.gappssmtp.com; s=20251104; t=1791833605; x=1792438405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lXnE2SxGJ5rLYuIMSksp63RAMKlg3urlDD6GhDVjHOI=;
        b=XXIf3e5wTRXopiqCvr0hU83zZWWxYWOmRKZhvkYQKVDNr0nNJcEH8uTstzBgbbiVsN
         sp2b07jf37g9yvJBy92qyZ37F1F2J/br2819a4sCtGmgKIk0QafmL3sFHgNF1iK/Rucn
         sXoOygaXICDozzEASbX2Vo2ACc+jBIuBPZeqQTrwhazo89cirKQfmx5F5ZJ5VRpoLxNA
         HrEFvXBdZakOyJt0SSPEyPQgTx6kNfJVvYI27Y8DATWwJyLvkRqTuDfIacs6YmG5O53Q
         L9a5q1Zo0wCilzrtn7Co2/iO19lOXcUuY8USI+0uIJC7hK+f6081AZDCNKKxbk/kyEB9
         hLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833605; x=1792438405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lXnE2SxGJ5rLYuIMSksp63RAMKlg3urlDD6GhDVjHOI=;
        b=gRi4r4IXUNm4z+MY2HJYwhDQjjwbOrQ2r4io4dKcJSx4eLosSiVvf/3xjL4ftf6vSp
         6VLwN0a5Jlv8iXYgpcjlx1oOp8DvhkxDzQtqdwfdKeLVMMDqxeIk0FimmASUV9OllG/A
         HF3WUFHUyPvrP9wIK2KfC391xTTdJ/YWd+L2GY1FnWNL7SShKUXQayBL+gBaWWD7gAOa
         0nXe8tI2GzQ20ka17BZVDRrID9RtLy4blQ+U2VSz4pPT9oNS5Np5S7qdzGR13d1t5Cuy
         6LFPVULPyi8dJk5fiycRMhvzaC+qdlm6DKfph2hHlZAsA5F+IMTpmW3wWJMDetkqBclq
         2Z2g==
X-Forwarded-Encrypted: i=1; AKwUvBzZqriNVIBr8vrpXwQXSD+fdAWhXt9DlM/lRpQG3YW/Rw4RcPN5E19ClJOS0DpCdjzY44Eo11MdtYzd@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6OgyAqGtAGQ5Zk84fW3GFniEdexlUPMW2nEOKvfbN/y+acgCQ
	N3/pxr8rDwMK6Cv7DzjdkbFQwz/MGbJUydauiQ1v4yZaH4NzYTLCUjl9MgDx1y2sKg==
X-Gm-Gg: AYBFou2I68O/N/ocCQiMf8OgQ1VToNgs6gQ2e4PyrGzSPylW3Qjc2eg9NRj8zspmquR
	LwF7Eo2z+7WCNRra58obEkNgiviggtl8GmgmBiTw31rMmzhCg4c4ynI2+TVw2QkADWf8yrx5Mt3
	IpX88YMzyJzF2E6ofPMZZWC2D6O/HKhvnkagzvYU06PyfNBtRpQ3gvQk5oW73X+Vqzr+PWauQqW
	y0QVILNP+02aQMtyVJ7JF9WoZ6hfULMGzvSIbcIgoTRY3GfGAFABdVxifQI8xye1gATKWgTJItr
	KGfeYPeFY/K9JDvcoIDTyGZmFJsX8Ks3A0RBuoSTN2cmUtenThZD2gxbEgTXtOQY225+6NgdHLn
	79kQv1qmnVL/6tfXDPX5HkQHqdjQpj6yVr84LY1pvbS/fJXqpV/GWSftxdhiuv4yTeZwLsW9xSE
	K8ln3f4wDQyrP6mQ4yg7Aj8XPvwzqdwkCcC/r+ssbVePOVBToJdpHhVch6dOJcrw6pS0i22gWSO
	zt+AahsZYS1xkVVN1DAsBjPBDqHDJn8/aW0NVG3vQ==
X-Received: by 2002:a05:600c:5489:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a18e4a5244mr199061695e9.8.1791833604640;
        Mon, 12 Oct 2026 12:33:24 -0700 (PDT)
Received: from Adrian-Arch.home ([2a02:1210:1c09:3100:bf3b:aefa:a3ba:26f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm570950955e9.9.2026.10.12.12.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:33:24 -0700 (PDT)
From: Adrian Schlegel <me@adrianschlegel.com>
To: tony.luck@intel.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Schlegel <me@adrianschlegel.com>
Subject: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory errors
Date: Mon, 12 Oct 2026 21:33:05 +0200
Message-ID: <20261012193305.38931-1-me@adrianschlegel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003222012.19685-1-me@adrianschlegel.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel and Zhaoxin, mce_is_memory_error() also returns true for cache
hierarchy errors. All callers expect it to report memory errors only.

The CEC uses it to count corrected DRAM errors. A corrected cache error
only names the cache line that was affected, not a faulty DRAM page.
With a faulty CPU core, the CEC therefore soft-offlines healthy pages.
On an i9-9900K this caused about 500 soft-offline attempts per hour.

Report only memory controller errors on Intel and Zhaoxin, as is
already done for AMD.

Fixes: fa92c5869426 ("x86, mce: Support memory error recovery for both UCNA and Deferred error in machine_check_poll")
Signed-off-by: Adrian Schlegel <me@adrianschlegel.com>
---
v3:
- Shorten and wrap commit message (Boris, Tony)
- Refer to the SDM section by name instead of number (Tony)

v2:
- Fix mce_is_memory_error() itself instead of adding a CEC-local helper (Tony)
- v1: https://lore.kernel.org/r/20260927151904.30524-1-me@adrianschlegel.com

Tested with mce-inject (sw) in a VM with an Intel CPU model. A corrected
cache error (status 0xcc5ffc0000100179) is no longer counted and its
page stays online. A corrected memory controller error (status
0x8c0000000000009f) is still counted and its page soft-offlined.

 arch/x86/kernel/cpu/mce/core.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index ab469605f..54ed053fa 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -540,21 +540,13 @@ bool mce_is_memory_error(struct mce *m)
 	case X86_VENDOR_INTEL:
 	case X86_VENDOR_ZHAOXIN:
 		/*
-		 * Intel SDM Volume 3B - 15.9.2 Compound Error Codes
+		 * Intel SDM Volume 3B "Compound Error Codes".
 		 *
-		 * Bit 7 of the MCACOD field of IA32_MCi_STATUS is used for
-		 * indicating a memory error. Bit 8 is used for indicating a
-		 * cache hierarchy error. The combination of bit 2 and bit 3
-		 * is used for indicating a `generic' cache hierarchy error
-		 * But we can't just blindly check the above bits, because if
-		 * bit 11 is set, then it is a bus/interconnect error - and
-		 * either way the above bits just gives more detail on what
-		 * bus/interconnect error happened. Note that bit 12 can be
-		 * ignored, as it's the "filter" bit.
+		 * Memory controller errors have an MCACOD of 000F 0000 1MMM CCCC:
+		 * bit 7 set, bits 8-11 and 13-15 clear. Bit 12 is the "filter"
+		 * bit and is ignored.
 		 */
-		return (m->status & 0xef80) == BIT(7) ||
-		       (m->status & 0xef00) == BIT(8) ||
-		       (m->status & 0xeffc) == 0xc;
+		return (m->status & 0xef80) == BIT(7);
 
 	default:
 		return false;
-- 
2.55.0

