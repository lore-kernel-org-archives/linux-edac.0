Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F040D35B125
	for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786786988; cv=none; b=t830H9vHaoUmn/Cps9RNnerIYF15XOidD6ylhISjPBnnR36sP+Fi2mI1QIwtCFDHHPho1tgE3SVhcNnIjtKSpRcTpN+Eaip9i8VeYFTeV9imL7CtZ/uWfutugWF+hIImK3efInsPsM5KbLsiGrgyuAzPCh/G7SYgsiIObEKOwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786786988; c=relaxed/simple;
	bh=cUkp/eObMQbWuMZu5BAL4R/hl1W5Fs8UxHEZQWjIx5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pNMTX1ZiJfxbPXxttVO8Dc3UV/T3PhXWuqEO1uolX3tq/VIPh3MNq64kTV4skW0YAznEtghvNFYjbDtdUYJ/287t0ISDHA6x0MMkUsohpN2AzASmBnT5oVEAIfxrwu3dV/2lRzXnzx9qE7cfigtpYpxTZBFpOgEpapbvtkabrvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBikUP03; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBikUP03"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2252051a91.2
        for <linux-edac@vger.kernel.org>; Sat, 15 Aug 2026 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786786986; x=1787391786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rk/Jqs7+Z4c8iA5Y4+QWmox24PJ6guyzxyZaNgXEPXU=;
        b=gBikUP03urUgLKVlKir6eWVPnMKSYRY9EEhboUkpJcwgm57r6k8ItrB5cxuOzUR7l6
         ISW5sg9cp6/4Emt72cuIsXo+KOFp7zJ3b//f1JEThlsACQaXHt5MTXxm3rC6dI082anv
         5Ihbd2O60q6h7VjzGjLDNpCiNpBR6Jk0CKrbyP7AepyRpO5TDD8BGmkzO5S0H/6sJIvl
         Nzcqi4hZH0QsH8sacNsSvQCBuziGGJDkjAHO1vy9jU7DW44goIWBspHfmtD8Vo01jCoi
         1fFBf7met/TA9RcoUAANIcCDWZVb3Yz/+fjve1tMRTsGmYXEEWMRw8+uv6ULZKiLOmO6
         1wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786786986; x=1787391786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rk/Jqs7+Z4c8iA5Y4+QWmox24PJ6guyzxyZaNgXEPXU=;
        b=TBGa+j6voRJZOB7kZEuYa+B/872/Bbp309ly/ikeQXtpWOAuQXgxRDvYAhqm1tum5i
         b6+Q4zrC/ovaTMyIAXuaXeiSXbnb9++envW4fgXvKSd+5KYRYFlZJ4GuUjga8K6CPWRY
         LIXZJvLmUMm/Kc7NwDaqHOH0NwFWRjT0ekGwOkUV1eIdDA7aQDrZ+StQwdv1/huDn8wU
         Lx+AH/HYVPcQLUKuTFxEnzSItEbQ9h1noPtDD/HFQ34Zl4AQXdU7q5GWikJNzsIHBrEa
         tV386b8QY8J/Y1KMFzvGfFaxUJfhrTZFWc9pafzS7ZpwhBhpY5Wzjkrqo/anbuO/dHdE
         IThQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZLo9L82vBGLXv2XCOJ9X+udOUSAtUk5pEAmXYikfFQchG6RvI1wY7YIDdbKj+syh+XC9KEpwvvlkA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00uUzdvSa4C+WP/XuV+cMJpMuUvtvfjVi6Xrw9ptrT8g/vQ+8
	O0XULXWgJBA+qYGOwB3L+WMxPDxM9B1+yfrsf4+81a8/ZB3eQgNKdqzt
X-Gm-Gg: AR+sD10pdFBx1UYu+gGd2M8x5gM/c47DTwGrGl2QTaiZSm6zsEfWFUopF4VfHZf1SEM
	pvBrvoLu7JBLk5ShN9pVyrWlXNmLdrNxz/NdU37o8SbEU0A7APTQWxZqukvruDCOlW7dgMFPjrR
	SbCgCGGtTQj2wR+/ZidsnWc0VkCnTyrAW3uiYVrNPFI9WPDsS2zfMLi1VQjZifb5XvLmbsoRvmN
	9hsDrIhYMpRlDp3lWMbGMO3YUFwnKQz4zbuNYf+eyuC2Mx71q4ym2yOwqtJsZo8xp8/9yyULM4+
	Q3W4pTKn9YBMH0ZALqt4cCLWxoP+TvW0KdUTsaj1rKayUBcFDbGpbo34Da5wzKadGF3BLCIOz8z
	jVy6OONJm5QAnudjXW07yfxNUR2v/LIMO4FTayvUuW6yZWmEKHzX4uxRIgUU4ikg4tcgLiqcqPO
	YAFJng/24u8TYNZLClSJdlvCJFS8ezLA/1Wi8Hev8Kvh1RmjlAk3t6BS+eIfj7uhw5FYGA7khLQ
	3CZ/YTPuXa0NqBU7w==
X-Received: by 2002:a17:90b:4a4b:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-3933b6ea12fmr12556834a91.1.1786786986172;
        Sat, 15 Aug 2026 02:43:06 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm6138079a91.15.2026.08.15.02.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 02:43:05 -0700 (PDT)
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: sashiko-bot@kernel.org
Cc: linux-cxl@vger.kernel.org,
	linux-edac@vger.kernel.org,
	x86@kernel.org,
	stable@vger.kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	dave@stgolabs.net,
	jic23@kernel.org,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	djbw@kernel.org,
	iweiny@kernel.org,
	ming.li@zohomail.com,
	benjamin.cheatham@amd.com
Subject: Re: [PATCH v2] cxl/mce: Avoid alias page retirement for corrected errors
Date: Sat, 15 Aug 2026 15:12:39 +0530
Message-ID: <20260815094239.23279-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812152835.DB33D1F000E9@smtp.kernel.org>
References: <20260812152835.DB33D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Confirmed, and I dug into this thoroughly before proposing a fix -
here's the full trail, in case it's useful to anyone else hitting
this.

Starting point: the full, current comment above
amd_mce_usable_address() (arch/x86/kernel/cpu/mce/amd.c):

  /*
   * Some AMD systems have an explicit indicator that the value in MCA_ADDR is a
   * system physical address. Individual cases though, need to be detected for
   * other systems. Future cases will be added as needed.
   *
   * 1) General case
   *      a) Assume address is not usable.
   * 2) Poison errors
   *      a) Indicated by MCA_STATUS[43]: poison. Defined for all banks except legacy
   *         northbridge (bank 4).
   *      b) Refers to poison consumption in the core. Does not include "no action",
   *         "action optional", or "deferred" error severities.
   *      c) Will include a usable address so that immediate action can be taken.
   * 3) Northbridge DRAM ECC errors
   *      a) Reported in legacy bank 4 with extended error code (XEC) 8.
   *      b) MCA_STATUS[43] is *not* defined as poison in legacy bank 4. Therefore,
   *         this bit should not be checked.
   * 4) MCI_STATUS_PADDRVAL is set
   *      a) Will provide a valid system physical address.
   *
   * NOTE: SMCA UMC memory errors fall into case #1.
   */

Case 2 in that comment is what confirms your original finding. Here's
the failure, broken into three steps:

1. Poison is defined for every bank except legacy northbridge - so
   poison-consumption reported from Load/Store or Data Fabric banks
   (non-UMC) is a legitimate, address-usable error, just like poison
   from a UMC bank would be.

2. mce_is_memory_error() only accepts UMC banks. Load/Store, Data
   Fabric, and every other non-UMC bank type are rejected here,
   regardless of poison status.

3. So a CXL poison-consumption record reported from one of those
   non-UMC banks never gets the chance to reach
   mce_usable_address() - which would correctly recognize it via
   case 2 - because mce_is_memory_error() already rejected it one
   step earlier.

Net effect: a real, address-usable error is silently dropped, and
the alias page is never offlined.

To make sure I wasn't missing context, I cross-referenced the AMD64
APM Vol 2 (24593, Rev 3.45): Sec 9.3.2.4 (MCi_STATUS/Poison, p.311)
and Sec 9.3.3.2 (MCA_IPID bank-type ID, p.318) describe these as two
structurally separate registers, with poison's definition making no
reference to bank type:
https://docs.amd.com/v/u/en-US/24593_3.45_APM_Vol2

Then I traced the comment's own history, since the NOTE ("SMCA UMC
falls into case #1") initially seemed to conflict with case 1 being
the "not usable" default - i.e. how do ordinary DRAM ECC errors ever
validate at all?

- Introduced in commit 48da1ad8ba95 ("x86/mce: Define
  amd_mce_usable_address()", Jun 2023), three cases only - no case 4
  existed yet. The commit's justification for the function:

    "Currently, all valid MCA_ADDR values are assumed to be usable on
    AMD systems. However, this is not correct in most cases.
    Notifiers expecting usable addresses may then operate on
    inappropriate values."

  And its design note on the incomplete case list:

    "AMD systems do not have an explicit indicator that the value in
    MCA_ADDR is a system physical address. Therefore, individual
    cases need to be detected. Future cases and checks will be added
    as needed."

- Case 4 (PADDRV) added in commit 821f5fe4dbcb ("x86/mce: Add support
  for physical address valid bit", Nov 2025) - exactly the promised
  future case, arriving 2.5 years later. Explicitly scoped to
  "Starting with Zen6" hardware: two new bits, MCA_CONFIG[11]
  (PhysAddrValidSupported, per-bank capability) and MCA_STATUS[54]
  (PhysAddrV, per-record validity). Confirmed at the register-probing
  level too - mce_amd_feature_init() reads MCA_CONFIG and MCA_IPID
  via two separate rdmsr calls per bank at boot, populating
  independent fields with no relationship between them.

That resolves the apparent conflict, walked through concretely:

Before PADDRV existed (pre-Zen6, i.e. everything currently deployed),
amd_mce_usable_address() for a UMC bank had exactly two paths:

  if (m->status & MCI_STATUS_POISON)   // case 2
          return true;
  return false;                         // case 1, the only remaining option

A UMC bank error with POISON clear - an ordinary DRAM ECC correctable
or uncorrected-but-not-consumed error, which is the vast majority of
real DRAM ECC traffic - has nowhere else to go. It falls straight to
case 1 and returns false. So the NOTE ("SMCA UMC memory errors fall
into case #1") isn't a loose generalization - for any UMC error
without poison set, it's the *only* possible outcome, because no
other branch in the function could have caught it.

PADDRV, once it exists (Zen6+), inserts a new branch ahead of poison:

  if (this_cpu_ptr(smca_banks)[m->bank].paddrv)   // case 4
          return m->status & MCI_STATUS_PADDRV;

Now a UMC bank that supports PADDRV gets validated (or rejected)
here, before ever reaching the poison check or the case-1 fallback.
This is what actually gives UMC errors a validated-address path for
the first time - not by changing what "case #1" means, but by adding
an earlier branch that intercepts UMC records before they'd otherwise
fall through to it.

So the "conflict" was never a real contradiction in the comment - it
was a timing gap in my own understanding. The NOTE was accurate for
the hardware it was written against (2023, no PADDRV yet). PADDRV
didn't rewrite case #1's meaning; it simply gave certain banks (UMC,
on Zen6+) a way to be resolved by a different case entirely, before
they'd ever reach case #1.

This also points to a broader lesson: mce_is_memory_error() answers
"what type of bank reported this," not "can I trust this address."
Those are different questions, and only mce_usable_address() answers
the second one - through poison (all hardware) or PADDRV (Zen6+),
never through bank type. Even for the one case mce_is_memory_error()
does accept (UMC), it still doesn't tell you whether the address is
usable; that determination happens entirely inside
mce_usable_address(), independent of what mce_is_memory_error() said.

On nfit_handle_mce(): it carries the same mce_is_memory_error() +
mce_is_correctable() gate my v2 had, unchanged since commit
5d96c9342c23 ("acpi/nfit, x86/mce: Handle only uncorrectable machine
checks", 2018) - five years before amd_mce_usable_address() existed,
so it isn't independent evidence about this specific AMD gap, just
the same bug-fix pattern applied earlier for a different reason.
Might be worth a separate heads-up to the nfit maintainers.

Fix for v3: drop mce_is_memory_error() entirely, since
amd_mce_usable_address() already correctly and completely implements
the address-usability logic this handler needs:

  if (mce_is_correctable(mce))
          return NOTIFY_DONE;
  if (!mce_usable_address(mce))
          return NOTIFY_DONE;

Still setting up an AMD SMCA reproduction before posting v3 
