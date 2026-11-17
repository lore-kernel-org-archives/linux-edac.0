Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794875832;
	b=TfF9P2s0fm8Z6ARHd7rfFePIUD0hheJ0BGcdTWqQXOxT+zM9RK4aGx6+c4dY0OJCRuAB
	 wuiKQJjkbu+GBpKOOpz6efM7I25Jsbc6Np50XnDsvzp4GyL5LFHNqlb1Rvlvfg/7ZLmes
	 XI7Cfb8RvOjENLQUAPunuKEcBQBxiENScaDTH2lR9L5P3RYDv1CgnyDc8WySP8NaidJGZ
	 qtUZ18Sf5Arz6zriwyxGICwQiKZc5bxyDzy23T50AcPegOwF3D5n/bnBSH4XteG4vWXi3
	 6Hi0PQjIUqLJjvHvi2s3/UDjih8PystQYDojrkWNQbzZPsAeLM3ZAhYzls7ccvhPXxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BvA8A5YtY5vJyCFzt8yEZytKRl69fmGmQbkWHGd1V/0=;
	b=mL4nion0kydFWwAYAWtSQI/v6GcZ0fgttmXt8I47A8lH/JAWaSf50tDCJkHSmgNRka1B
	 8RKWcUsfjFhB2w7MUyWfU66rkP5SosQTM17Cr5Ps2ZM9AprNQOMu9Oa8oPCKt+bSYPUV7
	 chs+C17VHblzVOdpsUeTnYZBg5NGTg9YXp3CPp83lFmeBoCD6ZDfGaWURk7opxUM2UHqe
	 LX9Vnd3Ge5FNMgiq9S+1YblSaTubFr92bliLxLki9HCXFEpMskEJ+fsakn6BKfEDO3A2b
	 kjVIT4FKHOUGpGc6dp6Ao+fM1EOLFijEPxrz4PWESmF+jiBqx1lWkGY/dHtbORx8YLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fY9kdE6q;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73EA606A323
	for <linux-edac@vger.kernel.org>; Tue, 17 Nov 2026 00:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B73EA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fY9kdE6q
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3632216f8f.1
        for <linux-edac@vger.kernel.org>; Mon, 16 Nov 2026 16:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794875830; x=1795480630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvA8A5YtY5vJyCFzt8yEZytKRl69fmGmQbkWHGd1V/0=;
        b=fY9kdE6qFdlgspkO6DbKLiT6D/oNllBCGkM/Sjf5aX+Gd+rTsKXcM4FV8dDlwVs4GE
         qaGZO2MOe18oD1QAcvBJuHpbLKMoh1VgtD3fcSAetaz0KnlI3B5CL4pfiKg1FJYKmgjw
         gdAVfCZ/iqeS463Eru8+jvmOVoBgqTy/+k6jkChpeELzBjylkq7XvO/oO3oFHg3WV2J4
         BOjUOFarq6IV+gfbfbwsmCdH0C9SNmDmUCP6j2cQ1cyKw3SJD5FlAXmfayMMJimNWLfV
         zbS3OAbvHKbiTETVQThNWYDzx4Z22bHZccXrCQdpc3MJA2M70lbVWHcuDVOQnL5jgjOP
         HT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875830; x=1795480630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvA8A5YtY5vJyCFzt8yEZytKRl69fmGmQbkWHGd1V/0=;
        b=SRpmaHewO6Tr5uacecnoUNztE+v6z2CGzicNsb2QrV6WGujh9LB8ec7qnyzI8yT7ic
         PVvv7Eij0r7CgrcUFtQNLuJ5DWPgPXc+i5LCORUB4y9fUcL5Fy9BfMostV67ejxeig9J
         nWsuIcHY9nazJs059rBu+DaaCYbKNeQWYX2mpwiaRgL5izwUJ15dRtK0sAtYi7guSe2P
         wCLcWmpv8P+eLpoWSysJ9Wf0B8obFGvTAHwm5AkLdKi6QNeBWJhuCVyHpXsVmrNuANun
         ZCgcHq1Yh+GzsNOJdKGJ/9XEHtCjaSEA2WxMOD+3Nnjhe2RyyvW5g6hCYbJqZiFDjQ32
         dM3Q==
X-Forwarded-Encrypted: i=1; AL+hErHpBsF+4MqzV/jckMVF1s246jGYDWlOfZv5hE8Rg7v2I9ca0rl8+lS/f8KlgorKl7yIzKbFJbKF64hl@vger.kernel.org
X-Gm-Message-State: APuU4Z9oOQbR6CSso3sQmFblrcC6FdUCqeNB60odxIpo6dc5Bd3UY9d4
	cJrgTEsOzjQg8VCZhfLbJ322L+X63cauaDa03gMiAXmIzuHwwVCB4aEc
X-Gm-Gg: AZFdTZfHVjjUfQ7xK9vGi2H/oQjWwM0pPD2fVQoXh29w07MGxMnKtLlUGJCphLmRfcG
	C/v60NJ5yAqy96BXNy6M+x0gmBsWmUPj9ywdeEKZjSIQKGpZ263+Jmv7j7hULz6FZXcZN787zlD
	j/GbrQ2PFaIEwvtfg3jM0Ii/neQjYcp5IO3so2Roxwta21YAl5Xy4iqHb6J7+sa9G0XwfzTHITf
	R1DwSP2eP4mHMexQGdPoLJmvph7U4Dr5V3vh3532sgwXfrAgiwnPlBLHsNOSH/ymTzKvMnoGpJl
	QKan9Lc1sYvSzljeIiDQkYrJiF2xA2VojgKwcG4g7zI75rgqhfuRMJzIqN8yKukfQ0zyTQr5rxk
	PBxjBqWTuVmLRcEWD8AJd3X4Nfd3u61DDzqyR1aLVPvX4z2zNYkbelsqLkJ0MJ18WLBh0etsmLg
	806szvJK0BBWghZu+PAAv/73r448EXwYMP2B//bJ2JYeuNnoavI1Ay9o763+Hhm+DEMV8cdqdrw
	QHAzqqJaSHa/RK3zTxGR6YXLLW9RG1Dx7Ni8G57Z6P4tmC6Qh6PPirjBpQSSRUqJwg83U/+Lv3k
	/071Qk1NPW/R3KNuPYBT1PQoLQIqo0E6P5nhu61QbgTS3E+YafjwaGIQLvzVdZi7jCjWrtLTKVp
	WSd58kw==
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-49c70b051bbmr27957716f8f.13.1794875829680;
        Mon, 16 Nov 2026 16:37:09 -0800 (PST)
Received: from gandalf.magpie-herring.ts.net ([87.74.56.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c651esm25475233f8f.47.2026.11.16.16.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:37:09 -0800 (PST)
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
Subject: [PATCH v2] x86/mce/amd: Don't poll unpopulated SMCA banks
Date: Tue, 17 Nov 2026 00:37:00 +0000
Message-ID: <20261117003700.4155635-1-zakbrightonknight@gmail.com>
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

By default, the MCE init code will attempt to set MCi_CTL for all MCA
banks on a CPU. This includes unused MCA banks which are read-as-zero
(RAZ) and writes-ignored (WI). The init code will check for this by
reading back the MCi_CTL register. If no bits are set, then the bank is
marked as "not initialized".

However, "not initialized" only affects the MCE sysfs interface and
later writes to MCi_CTL. The bank's "ctl" value is still set, and this
is checked in the MCE polling functions.

Normally this is benign, since an unused bank would return '0' for
MCi_STATUS. But in some cases, the MCi_STATUS register will have a value
with the "Valid" bit set. And this results in logging bogus errors.
They're determined to be bogus based on the combination of status bits
set. Also, they are logged from MCA banks that have an MCA_IPID value of
'0', i.e. reserved/unused.

Clear a bank's "ctl" value during SMCA init for unused banks. This will
save an unnecessary MSR read during normal operation, and it will avoid
logging bogus error values that may be present on some systems.

Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: stable@vger.kernel.org
---
v2:
- Changed commit message based on feedback
- Shorten the code comment to Yazen's wording.
- Move the background and the test results below the cut.
- Add Yazen's Reviewed-by.
- Rebase on today's tip master. The code itself is the same as in v1.

v1: https://lore.kernel.org/all/20261107111211.578991-1-zakbrightonknight@gmail.com/

Thanks to Yazen for the review and the new commit message.

The background from v1. On a Ryzen 9 5900X (family 19h model 21h) the
kernel logs a bogus "System Fatal error" every week or two. It always
comes from CPU 1 and from a bank that CPU doesn't have.

  mce: [Hardware Error]: Machine check events logged
  [Hardware Error]: System Fatal error.
  [Hardware Error]: CPU:1 (19:21:2) MC14_STATUS[Over|UE|MiscV|AddrV|PCC|SyndV|UECC|Deferred|Poison|Scrub]: 0xffffffff8b416928
  [Hardware Error]: Error Addr: 0x0000000000000000
  [Hardware Error]: IPID: 0x0000000000000000, Syndrome: 0x0000000000000000
  [Hardware Error]: Bank 14 is reserved.
  [Hardware Error]: cache level: RESV, tx: GEN

Only CPU 0 has the shared banks like L3, UMC and PSP. On the other CPUs
banks 4 and 7-27 are unused. On CPU 1 their MCA_STATUS and MCA_DESTAT
now and then return a non-zero value. The values look like memory
contents rather than error status. They include page table entries,
instruction bytes and kernel pointers. If bit 63 happens to be set the
value gets logged. This machine logged 39 of them between July 2025 and
October 2026. Owners of other Zen3 desktop parts (5800X, 5800X3D and
5950X) report the same thing, also always from CPU 1. Commit
0422b07bc4c2 ("x86/mce/amd: Filter bogus hardware errors on Zen3
clients") filters a related signature but only on Cezanne A0.

The junk can reach more than the log. On 24 Oct 2025 one of these
records came out as a deferred error with AddrV set. The kernel then
tried to take page 0 out of use.

  Memory failure: 0x0: unhandlable page.
  Memory failure: 0x0: recovery action for get hwpoison page: Ignored
  [Hardware Error]: Deferred error, no action required.
  [Hardware Error]: CPU:1 (19:21:2) MC9_STATUS[-|-|-|AddrV|-|-|UECC|Deferred|Poison|-]: 0x84453c75c085c589
  [Hardware Error]: Error Addr: 0x0000000000000000
  [Hardware Error]: IPID: 0x0000000000000000
  [Hardware Error]: Bank 9 is reserved.

It did no harm only because the address read as zero.

The testing is the same as for v1 because the code hasn't changed. With
check_interval set to 1 second, stock 7.2.11 logged 34 bogus records in
22 hours. The same change on 7.2.13 logged none in 8 hours 10 minutes,
where about 12.5 were expected. Reading the unused banks directly
through /dev/cpu/*/msr shows that CPU 1 still returns junk under the
patch. So the clean run is down to the patch. Updating the BIOS to 1.D3
doesn't fix it. The full test notes and links to the other reports are
in v1. This version builds without warnings with W=1 on tip master.

There is no Fixes: tag. Every bank up to MCG_CAP[Count] has been
polled since long before SMCA. The v1 notes list the two closest
commits.

mce_no_way_out() reads every bank whatever its ctl. So junk there
during a real #MC on CPU 1 could turn it into a panic. CPU 1 here still
returns junk from these banks about once every few million reads. I can
test a change there if that helps.

Claude Code (Anthropic) did the log analysis and wrote the code change,
the v1 changelog and the test scripts. I ran the test kernels and the
probe on this machine.

 arch/x86/kernel/cpu/mce/amd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index 1cc20b855b7e..9e6fe5798181 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -345,6 +345,10 @@ static void smca_configure(unsigned int bank, unsigned int cpu)
 	hwid_mcatype = HWID_MCATYPE(val.h & MCI_IPID_HWID,
 				    (val.h & MCI_IPID_MCATYPE) >> 16);
 
+	/* Skip init for unused banks */
+	if (!hwid_mcatype)
+		this_cpu_ptr(mce_banks_array)[bank].ctl = 0;
+
 	for (i = 0; i < ARRAY_SIZE(smca_hwid_mcatypes); i++) {
 		s_hwid = &smca_hwid_mcatypes[i];
 

base-commit: be3c65835ade4d487ccbeb08c827662db09ee7e2
-- 
2.56.0

