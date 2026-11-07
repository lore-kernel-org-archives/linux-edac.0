Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049952;
	b=060mEzzOQ88zO/xdV3m/qUKe913ya3leNYhKVI0vhCdp2wCD1aB77yWRtZehKh8u14C9
	 ndnkRFO9YewloJ9YRX68TocXfEw5Re8a+XgGpRoHD292WuPAa5xAziRf4mGKKPyUE8gmO
	 8JV/fAJp+mlxNhO61oXl8ge7EXw46wq0sbjqaCKmntoCPRj9A0XXlDTVWFxKBpMwySM6r
	 SIBF4AZQO9sZfmMjhxN2iO7+kv8ehK0ov6EwxagbVX5IqtJ7+Ni59lizEnFK8zDGm5TGw
	 1GEgsk0FJkVfU+QbhxrzChy8HOvJJY1zWWa+gMmJsVsYUwHVJRsh/iEJf9vgP6WjTsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hHW2B0FaKE1KGEcWUYWoW9cO8EXd1WE8xiErFc3oxx0=;
	b=PyZjly1IU4PNWXPxTgIN9wZQiADg0YC4goOzAo5qUepVe40Bi+1guZeZc6+FOSO7BRg9
	 L29NeWEfy2kcuLgXIlt1v1koPDaBs8gjiZju/dWd/AEGsLchN8UFuK9pzbIz0qf2t/Az+
	 WgnoEOMAHuR+qT1azA/ra8xiB7av+w0zXwERmYgv0KwPjNDiPcbnkPubKADhOJaaZW0iM
	 JyF+j9q/387XR29IE441NLdroBimxTsWdTvwykA7b8Ez0QsBbKPzopZAvFsFKEe736oge
	 aApENx4I1WF/f3+r30fVh+BhmEBUAsbkMmoWq6gnut2ex569v8XkVOVIAR/uyONj71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0zZyb+B;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37450606A33E
	for <linux-edac@vger.kernel.org>; Sat,  7 Nov 2026 11:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37450606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0zZyb+B
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9475865e9.1
        for <linux-edac@vger.kernel.org>; Sat, 07 Nov 2026 03:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049950; x=1794654750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHW2B0FaKE1KGEcWUYWoW9cO8EXd1WE8xiErFc3oxx0=;
        b=t0zZyb+B7wVqE07CRHgSXM2gW7x8tssL1t9+EIjsfU3LpxjbiJ5eFYQHgm20uLsrl6
         JiuyKXjHVqpTle0TyU9NOqJ2v0yy/cJNLrmes4RzQTUlmIiLARn7s4hIWJG/+6Csb2A2
         k0xX+qOg+kICEJXQO+0yjDx/4pAFiCwEECh69nq7I/YO/uirQU+TO/II+EmPPdFEDZNz
         TtfppWbhZNGOCHSJ80rDET+CJPfgOxW1Cfr+OJtj5HeavT5qmaCBHOBT9tGFnStp2KSV
         85FhBtBBIK9af7yIZ8Hpk3VogHmxHCEsJ3dcho2SPeeMAcM73yCkEdovI+1hhIDrtZ4X
         9cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049950; x=1794654750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHW2B0FaKE1KGEcWUYWoW9cO8EXd1WE8xiErFc3oxx0=;
        b=CnFeuyOZ46UyG+QYDx0Y1oyMvKloOS4nRMZPPem2jAxNpGgPT851z9vR+CBpE8kGU1
         1Vho2uatTLCcMEKQjR0LG89TXpqm1JEkLd5ty3dY9ulVNwIDNI4O8HcXGJZTtxD3Xb8B
         hWAxwmhQoPwS6zuN6MUDaTDOr2Wp7a/VWn1Dvngwh9M8XaI78g2KyAFjFpYlgX0ualpY
         fpw7vegrvExfOBoxr+wcquQ8wQqWSM5QFaFu9woXSGm1O3GE5oUZR5MUjiFiSDZkvsLG
         tYVEaqmF/Biq/L4nu0NF4nivG3Es6xbhv1op3H8Y8Q8aelJUb8ga+TaHRAFmS0s+vs5f
         l1uA==
X-Forwarded-Encrypted: i=1; AKwUvBxLwc7TzjQX5Fmka/sHDljjyZ6v/LTpovCgjNFLHwhqANpzlv5DpVE4rIMVeOMmYLig0ERF0/v3IQqI@vger.kernel.org
X-Gm-Message-State: APuU4Z818aGlpXvsG+vHrXgmlxidKYrFF3OVvNODli5b3/DVM1Lx44Ty
	bB/pb63OZEjQApunh4AsDgjWuyStzTEbvYwL+Omu9oWLGgmD2/1QaIqX
X-Gm-Gg: AYBFou3jitKPBMm5QOMo2PvsY44xaYxkI+6wB25WV0upyNTFjVN/nV1dUliQwuBu2BP
	2DOMpeQGUw2GyEfqKF6a8uAhBbic+PBD9C71yQKmibH9BUet3I3RJPHZreIEeRDGdneiBb6h3WM
	eiH1u3DZ3tMMuAM8w1LArxA5K1KUgVdhd/k3kVu1ySFB4hPOa45o8rQBkTBInoZRmYhAcMEukPr
	MrVXPhnnNGa9DJ7abYKv7LfCaHMggh9hBTj/QE0KCXuQGil4a1pryUfQeEa53Qx7E6B/VX3I9V6
	e0Wx76AKg0gw5qZTf3QqXavnIiNmG/DdDURjZnoTAnO8rj13rM6JSy3wHL+PrAeaO1Tlks3jGdz
	TpHiL82p4On6Nt8VhGqqkKaXA0ZQoyTCcPxxLvgG1B8efg49RCHEKGontnS1Nhz9HzrCIv2E7Ze
	iZ09A3oCcNQEkrOtnpKoK21XC7LzErRHlFbIR1eJVmEfFqzaySv75126iiHiQi5bGvzBhkPT0um
	+b2Y1/FwUMaMi9nPL6lAo/K6igLNRDV43F/X/XenMyVcrhtJJB/VqQdsPP3kTlWSYN9dL4YbNCG
	tdML08vWCWDoPEyw46KJg+p01XS4NH4mLpRntTRgY0vQaFsjB+P+OP4ai5AHTmvSsiVwvpyJpjV
	iAxJt
X-Received: by 2002:a05:600c:6095:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4b6df9bf214mr89569235e9.18.1794049950230;
        Sat, 07 Nov 2026 03:12:30 -0800 (PST)
Received: from gandalf.magpie-herring.ts.net ([87.74.75.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbdb9cdsm58269335e9.1.2026.11.07.03.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:12:29 -0800 (PST)
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Zak Brighton Knight <zakbrightonknight@gmail.com>
Subject: [PATCH] x86/mce/amd: Don't poll unpopulated SMCA banks
Date: Sat,  7 Nov 2026 11:12:11 +0000
Message-ID: <20261107111211.578991-1-zakbrightonknight@gmail.com>
X-Mailer: git-send-email 2.56.0
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

On a Ryzen 9 5900X (family 19h model 21h) the kernel logs a bogus
"System Fatal error" every week or two. It always comes from CPU 1 and
from a bank that CPU doesn't have.

  mce: [Hardware Error]: Machine check events logged
  [Hardware Error]: System Fatal error.
  [Hardware Error]: CPU:1 (19:21:2) MC14_STATUS[Over|UE|MiscV|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffff8b416928
  [Hardware Error]: Error Addr: 0x0000000000000000
  [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x0000000000000000
  [Hardware Error]: Bank 14 is reserved.
  [Hardware Error]: cache level: RESV, tx: GEN

On this system only CPU 0 has the shared banks like L3, UMC and PSP. On
every other CPU banks 4 and 7-27 are unpopulated. Their MCA_IPID reads
as zero and their MCA_CTL doesn't keep the value written to it. So
__mcheck_cpu_init_prepare_banks() marks them as not initialized. But
their ctl stays at the default of all ones. machine_check_poll() still
reads their MCA_STATUS on every poll and smca_should_log_poll_error()
reads their MCA_DESTAT.

On CPU 1 these reads now and then return a non-zero value. The values
look like memory contents rather than error status. They include kernel
page table entries (0x8000000100c0d163), x86 instruction bytes
(0x900000000000841f) and kernel pointers. When bit 63 happens to be set
the value passes the MCI_STATUS_VAL check. It is then logged as an
uncorrected error with nearly every status bit set. This machine logged
39 of them between July 2025 and October 2026 on kernels 6.15 to 7.2.
All of them came from CPU 1 and from unpopulated banks. Users of other
Zen3 desktop parts (5800X, 5800X3D and 5950X) report the same signature.
For them it also always comes from CPU 1.

Commit 0422b07bc4c2 ("x86/mce/amd: Filter bogus hardware errors on Zen3
clients") filters a related signature but only on Cezanne A0.

An unpopulated bank has no hardware behind it and nothing to poll. In
smca_configure() clear the ctl of any bank whose MCA_IPID hardware ID
and MCA type are both zero. machine_check_poll() and __mc_scan_banks()
then skip it like any other disabled bank.

An AI coding assistant (Claude by Anthropic) helped find the cause and
draft this patch.

Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
Cc: stable@vger.kernel.org
---
I tested this on a Ryzen 9 5900X (MSI MAG X570S Tomahawk Max WiFi with
microcode 0x0a201213). I set check_interval to 1 so the banks are polled
every second instead of every five minutes. That way the bogus records
turn up within hours rather than weeks.

  - Fedora's 7.2.11 on BIOS 1.B0 logged 34 bogus records in 22 hours.
    All came from CPU 1 and from 16 different unpopulated banks. Nothing
    else was logged.
  - Fedora's 7.2.13 with the same change logged none in 8 hours 10
    minutes on BIOS 1.B0. The unpatched rate predicts about 12.5. The
    7.2 code around the change still uses the 32-bit MSR helpers but the
    change itself is the same.
  - Fedora's 7.2.13 without the change still logged 14 in 21.5 hours
    after I updated to the latest BIOS (1.D3 with the same microcode).
    So the firmware update doesn't fix it.

This version against tip master builds without warnings with W=1. I have
only booted the 7.2.13 version.

Reading the unpopulated banks directly through /dev/cpu/*/msr shows the
same thing. CPU 1 returns a non-zero value about once in 1.6 to 6.8
million reads. It does so on both BIOS versions and under the patched
kernel too. No other CPU ever did in over 250 million reads. So the
clean run is down to the patch and not to quieter hardware.

One boot of the patched kernel ended after 17 minutes in a hardware
reset (a data fabric sync flood). The MCE kept across the reset is an EX
watchdog timeout on CPU 16. Its address most likely points at the WRMSR
in native_write_msr(). I don't think it's related because the patch only
changes which banks get read. The next boot of the same kernel ran 13
hours without trouble. I mention it for completeness.

There is no Fixes: tag because every bank up to MCG_CAP[Count] has been
polled since long before SMCA. The closest candidates are two commits.
d9d73fcc8784 ("x86/mce: Detect and use SMCA-specific msr_ops") started
polling the SMCA registers. 068b053dca0e ("x86/MCE: Determine MCA banks'
init state properly") marked these banks as not initialized but kept
polling them. Happy to add either.

mce_no_way_out() still reads every bank whatever its ctl. So junk there
during a real #MC on CPU 1 could still escalate it to a panic. I left
that alone. It could skip banks with a ctl of 0 too if you prefer.

I don't know why only CPU 1 (APIC ID 2) does this on every Zen3 desktop
part reported so far.

Other users report the same signature in these threads.
https://forum.proxmox.com/threads/ryzen-5950x-uncorrected-software-containable-error-events-after-upgrade-to-kernel-7-0-x.184025/
https://discussion.fedoraproject.org/t/hardware-errors/193072
https://bbs.archlinux.org/viewtopic.php?id=304584
https://github.com/8do-abehn/lab/issues/435

I used Claude Code to help triage and write the patch.

 arch/x86/kernel/cpu/mce/amd.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 1cc20b855..1de43386c 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -345,6 +345,15 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 	hwid_mcatype = HWID_MCATYPE(val.h & MCI_IPID_HWID,
 				    (val.h & MCI_IPID_MCATYPE) >> 16);
 
+	/*
+	 * An unpopulated bank has no hardware behind it and nothing to
+	 * poll or scan. Its registers should read as zero. But on some
+	 * Zen3 parts MCA_STATUS and MCA_DESTAT can return garbage that
+	 * would then be logged as an error.
+	 */
+	if (!hwid_mcatype)
+		this_cpu_ptr(mce_banks_array)[bank].ctl = 0;
+
 	for (i = 0; i < ARRAY_SIZE(smca_hwid_mcatypes); i++) {
 		s_hwid = &smca_hwid_mcatypes[i];
 

base-commit: 4f08fc2dfebccc28b7a7645dd81d28a755815e47
-- 
2.56.0

