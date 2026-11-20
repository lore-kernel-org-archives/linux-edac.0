Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203225;
	b=HXTxsIs8UZDmkX1sdZeC/C83xqgjsE+OB57ZMzHnuf0IsMNcHIP/LJxKxGQOdoZKHmNG
	 cuQV34ChcJuta1EEHVvXzjswLiFprA3us6PZS1LVDg6CEqs5DCqAG5TyQCUVo0ooSWVyY
	 3TwyOBdxbDLzeJqjVpX6n7F4aRAS/OdOs4SyvElZ0gs9VJ1s8wZ37DUExh9mvzkK51ACc
	 g1ugDkgRs1VxGJvlDJU/vldbfM7nzb6HwkyczouGaLPvqyqHp2i/icoh/OXb8VebcxmR+
	 Oowd7AFApny7WMbO6LTlPTJnU3fC0csjXxGFqjU6qwIb14bFEm/8BX/vuZcieD8pkNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fxCNuWQvzJYmgA8gn7P/jRBw4XZXA/JTp0X0Bgf58pM=;
	b=dcNENfYAumOKj0v2stiTq59811JteZ886t/jWxT3Jnq6VbPl2T/WaM9uzCO+Kn7G+CMc
	 Os69wONFDLks8pC8F3fBWUlm7poKNpTVA48bHtGTss0Puh6nrH1PRwwlpc//iY7i83OPP
	 PfKLzuRpAgYv+GbRr7DhqUVZHvVjbgqggGKqwuRmfguuj/MviJ1/ed5wuEe60jB1cNV1W
	 vK5ZO48KHA/BJdaFNy+NpNnOwRQOTyKGaTFvn7CWgqiTNdB+/hmpX3xAWWxHaY3bRmVE4
	 7IVb3sS7FDqZFRVJgPhQpFKIRw5wTFC+Pih+TrVEjB+Jllv9VLjzML/c/KCEqtXwlPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pk3Ns9uP;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD6606A6DE
	for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 19:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84BD6606A6DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pk3Ns9uP
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6767d92cde6so1586808d50.0
        for <linux-edac@vger.kernel.org>; Fri, 20 Nov 2026 11:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795203222; x=1795808022; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fxCNuWQvzJYmgA8gn7P/jRBw4XZXA/JTp0X0Bgf58pM=;
        b=Pk3Ns9uPSbC296USVcIMhpBpob3m8nvnRtc1BnBuEkiY11Pvk6627aP3gQFWlWtxU/
         HCflLyw7CV8VLNRtnhqLFSHQg3aEPgHoXA0K5tUjtFM89Jv0/4bEuiLvSp4Cq1NHEqj0
         9qIdKRtokSniAsChsSuO+EsoXV61zVacoNo8TUYocRmf1J8mS1YuhZMhagMj3Yckr0wl
         K4bLh8+prL5v4Dr7hjAaIqY8+ntxJjyXaxFrOARxvXaffviSq9M3l6qK6gGm/D2JVQbj
         XR6JVafa6Ua5+YbUWOSUZFMy/ajEyE58X9OuxeJhDcDZZlCrrqa/Lcgl0Dn7JnHNDtQy
         llZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203222; x=1795808022;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fxCNuWQvzJYmgA8gn7P/jRBw4XZXA/JTp0X0Bgf58pM=;
        b=NCfdsNoy/7o3qaZnAe/+iZHm92MmPfg6TePepasV6lgZOSXkT77BLcet/rGfUB1YHS
         Iia7DdtPXdAxmhFcDuXDQsBhCR+O+TqGyedvl4Av/elROTJn+WuGYqo7FjxJ14hqC/QZ
         s6hichAJbAiHmjgIxUQhPZ4ZKyx8UfxIOEgee1cBvblhUXAWUC35Bp18BGTZoxUiKnIc
         RNrVCWJXTYgi85MRbozwRLUrlxz2O66/ngnb61zqUQ1PWN32GFo3Bu6fv9No51JBdaVp
         nR6sU6p+KUP0EfEsf+FtNTQxZz/UuhZSFcnM0z/jHUlJbSL+PyBaPzl3CoV9Z7e5BPkt
         V/iA==
X-Forwarded-Encrypted: i=1; AL+hErGnRszOtRhr6+Sza8JhwmfH66ILEtPOdP/RXp+P0cTWETrARUFzP0RYUJNOKkMHhQuzcf0iuj7uO+3l@vger.kernel.org
X-Gm-Message-State: APuU4Z+CEZ03u4MWFMHpRuATm2gfbKM+toqOWu6yqbUW48uo2aKEpUQV
	SW3NtT01nmVB4nBHnXLta4hEEwCknUXXvoYFaLy/lbMCLAMgw+HZ6YyF
X-Gm-Gg: AZFdTZfQeE2NsC3vsxdE9TCvzUIUCj+iWQZtsghqhQLX+PfjOXUaf/QFv3QuWXdaxbG
	NDRAubu+sLkGG4RHEILUXqpalLR5Qclb2oA8NE1ybhhPwhmgAMQV/R1vjRE02sGXEOGc4uJj0AE
	sYdkzYbTUL1nI2k2gTJa9XBAIk+x2cpu/8IZ7U7/gIt7GWBH3Ez1j49fgkZC54v07V7NYJee02g
	RCRwaVzo1Uj58iEi4r7x1tCHk85CEYCYAnNnd1dqBY8xsqLuZpHBpkhFTmyf8xmZStLgZYnxSM4
	XMbEjZCOY15U+iMplKlxWhfnJuYr81C6cj3ozd44YxQm2uejqDCiscfAWVwjIc0Gg5IPzz0Nz9c
	P7i7Z72d5xW3bMAGTojUo9LguM9e9KOi1v/wWa2+TVLYM955miMRQ5pnmGQIuTq5/CBvKjBVPQa
	ymNc1OIxvrD+sLiVqaHHBBXmKK2BxXzVXB4RxegPlvqfOEZo/d4W4l3JxGA5n5i9YVouZtXZ81Z
	qz6lGsCEy13l0GlU5LBh1rlZs416LXqFxMF5574SpaIBt7uafcAPe34aEjMqs8qxwyyC6XcXBn1
	CgQMVSDEIBbPoI41ritqYRDV3dh4nP8ra7tbqijkGrJ8YLk/ld3/QSrR7NEJEbWYO2mwUMEjImG
	UpRw6+WnE7mZv3qBA6FB+SMuPROI6TJRYhopd9AmnAgrnEW8qAYfT7Sk7LLtpeWc=
X-Received: by 2002:a05:690e:d49:b0:67d:ebad:8cbc with SMTP id 956f58d0204a3-67df448e14amr1534819d50.99.1795203222177;
        Fri, 20 Nov 2026 11:33:42 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:66f3:d5d6:2d12:d460])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df337bfd7sm2146401d50.15.2026.11.20.11.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:33:41 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/4] powerpc/32: Report MPC7448 L2 cache errors
Date: Fri, 20 Nov 2026 14:33:39 -0500
Message-Id: <20261120-ppc32-l2-ecc-v1-0-98fc8e6e0a32@gmail.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNNBKVeRRwkphqQWloQQby7x
 fEN/z9QNJsWGJsHsl5W7IwV1DYg+xI3RVurgR33RM5jStIxHowqgp5pUBIJqzqoScoa7P530/y
 +H9+5jD1eAAAA
X-Change-ID: 20261109-ppc32-l2-ecc-9217e1ccfde0
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, 
 Tony Luck <tony.luck@intel.com>, Matt Turner <mattst88@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3209; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=z9yjhfg1WB5tn8m2imu7WOYSvv7f5xJsD5QGreVFmFo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIZFkyJ6DuQ2XZd79L9ug/9jRPeM614HLNnuVtQYre4z
 0G5vaw3Oz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaFUUM/5P6VVTF3L
 IO3zP5J7Sie1F2SZbnietPS89qz+jcXRdsns3wP5eh/cNWWSkXmec54mFcS1IeJT/58fr0Yo2nc
 i8YmpZHMgAA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The MPC7448 has ECC on its L2 cache, but Linux never enables or reads
the L2 error registers. L2ERRINTEN resets to 0, so multi-bit errors go
unreported, and the single-bit error counter is never read.

Patch 1 decodes MSSSR0 for L2 and L3 cache machine checks on all 745x
parts, which are currently all reported as "L2 data cache parity
error". Patch 2 enables machine checks for multi-bit ECC and tag parity
errors on the 7448 and adds the L2 error registers to the decode.
Patch 3 adds an EDAC driver that reports the single-bit count, the
machine checks, and uncorrectable errors latched without one. Patch 4
adds error injection to the driver; it is separate because it is the
part most likely to need changes.

L2 machine checks clear SRR1[RI], so they are never recoverable. The
injection code masks reporting while it runs and reads the errors back
itself. Tag injection hung the machine, so it is not offered.

Tested on an iMac G4 (PowerMac6,1) with a 7448 (PVR 0x80040202):

- L2ERRINTEN is 0x18 after boot.
- An injected single-bit error is corrected and reported as CEs.
- An injected multi-bit error is reported as a UE at the target address,
  without a machine check.
- With the injection's masking removed, a multi-bit error raises a
  machine check, decoded as in patch 2, and the writing task oopses. The
  error in the target line raised a second machine check while the first
  oops was being printed, and the driver then reported both as UEs.

Suspend to RAM and resume were tested: L2ERRINTEN is still 0x18 after
resume, and injection still works. With CONFIG_STRICT_KERNEL_RWX enabled,
PMU sleep oopses in low_sleep_handler with or without this series; that
was tested with "powerpc/powermac: Fix low_sleep_handler with
STRICT_KERNEL_RWX", which is sent separately. No other 745x part was
tested.

Patches 3 and 4 use symbols exported by patch 2, so I'd suggest the
series goes through the powerpc tree with an ack from the EDAC
maintainers.

---
Matt Turner (4):
      powerpc/32: Decode MPC745x L2 and L3 cache machine checks
      powerpc/32: Enable and decode MPC7448 L2 ECC machine checks
      EDAC/mpc7448_l2: Add a driver for the MPC7448 L2 cache
      EDAC/mpc7448_l2: Add error injection

 MAINTAINERS                               |   9 +
 arch/powerpc/include/asm/cpu_setup.h      |   1 +
 arch/powerpc/include/asm/cputable.h       |   2 +
 arch/powerpc/include/asm/mpc7448_l2.h     |  31 +++
 arch/powerpc/include/asm/reg.h            |  38 +++
 arch/powerpc/kernel/Makefile              |   3 +-
 arch/powerpc/kernel/cpu_setup_6xx.S       |  38 ++-
 arch/powerpc/kernel/cpu_specs_book3s_32.h |  24 +-
 arch/powerpc/kernel/mpc7448_l2.c          | 124 +++++++++
 arch/powerpc/kernel/traps.c               |  28 ++
 drivers/edac/Kconfig                      |   9 +
 drivers/edac/Makefile                     |   1 +
 drivers/edac/mpc7448_l2_edac.c            | 442 ++++++++++++++++++++++++++++++
 13 files changed, 736 insertions(+), 14 deletions(-)
---
base-commit: d68ce4e71248e1ff5af9654b407541d9260b3ba5
change-id: 20261109-ppc32-l2-ecc-9217e1ccfde0

Best regards,
--  
Matt Turner <mattst88@gmail.com>

