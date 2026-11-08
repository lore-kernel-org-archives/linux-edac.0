Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127517;
	b=Ugg/Tjyx1FEbKnf0Mxzh79D1iRSh6HCTEjPBs0H+QDXtD4hGKhfUXDd12wc97nPlWM7H
	 mYJk4bVvfwTPTIXCziGSD5N1CcY1U4TVxQsy8KTaQszEBXbQ36Jqegv8n+4zlgC1/OPTh
	 vI04zrYnvNrmxx8Nbvg+Fjr2K9aQVpEsclFi/SocASFAoxn2Zbe0Zqnu1Oy1q5bybvnEE
	 kDWNVyB1Uv5SdKNhRzfPNqTCzz97CHq3S0Prg4BEW/C7PEpUAJvg1yPHzVjLbiFt7IrtL
	 vum99oOhHeePD0X9cvpXTHmhF8edWmChpLVwUTziypTT0typBbFM0ezPodPy/otjR2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127517;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding:Sender;
	bh=NidcFtHwuLbcn5H1Iytqwfh0exSJ7mhFl0vV+H3Jc50=;
	b=RXGXu4l3452d0urObYOm6noBnuHuCifBceerVqIHas3IaOUSxyj2BKks+IGPCz0m2xB4
	 c4xvJ7IEpkvex6RtICzdbtoebif1Rkgj4RJWhTUT5GVuvks0KUAJu0PSUI+SKUiZti4wk
	 wHG1QWIX8nD277AilJgjLkX6PgaduPR/8BnITbwvbM836r9WOSkvayvJaxTSUhfUqTOEM
	 03Y1vPPlW+pevM18gOLyLEmtMR4cFiyFd0EszNsC3BzdFLsxJTdk0YiXQngd6veRvaIES
	 MeHriU5YNbxbJ4/jF8iLgucDrz/YcNnDaD1MX9Z3LOjBZNJeO6Aihgfxjm8N+lb4HiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAjZ6sMD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02B606A323
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAjZ6sMD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0821F008A6;
	Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127516;
	bh=NidcFtHwuLbcn5H1Iytqwfh0exSJ7mhFl0vV+H3Jc50=;
	h=From:To:Cc:Subject:Date;
	b=HAjZ6sMDG2FRboaBSuoHZgF0mwJ6yU8eMn7go/x/N6FXn08Gi58xfBCRokb8VQovf
	 0gXjvzUsS+FbKQ+XD53m2C2GBsy6GAn6sfzT6L/8dDVGTvPjGtKUNtyK2x65nVGnpN
	 aqzNzV/+5Tj58ZeahIb97EJTFsuz8Ab/wbZuh0oHLwahjFRuG8UDYKT7cps1GcATAS
	 WKtv/PaKZfFQkYv1XvKfiJBrRZxRVx8HO/o3rfugTY9CQkgOflobf/7lf2ZorYhg+T
	 TpRdDmaG6no4ruuoB1wncO7ajaxCkek2RKHhdyWm4LnNSLB/i7tKtYzfbg9mAS2JAo
	 Ig5zDZf0PeEcw==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyWY-00000005TMI-2A6N;
	Sun, 08 Nov 2026 09:45:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
	Ani Sinha <anisinha@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v2 0/8] Add ghes support for x86 via SCI notification
Date: Sun,  8 Nov 2026 09:45:01 +0100
Message-ID: <cover.1794124132.git.mchehab+huawei@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Michael,

That's the second version of this series. First version is
here:

	https://lore.kernel.org/qemu-devel/cover.1788630333.git.mchehab+huawei@kernel.org/

There was a precursor RFC patch series I sent in 2025:

	https://lore.kernel.org/qemu-devel/cover.1741094512.git.mchehab+huawei@kernel.org/

I opted to rename the subject on patch 0 to make it clearer
that the goal is to add GHES support on x86.

patch 1 adds a method to allow checking if RAS support
is supported in an arch-independent way.

Patch 2 creates empty DSDT and HEST tables for x86, in
preparation for testing them, adding them to allowed diffs.

Patch 3 adds support for _OSC at DSDT table, adding APEI
support bit on it, if RAS is enabledm adding a "ras" boolean
to allow enabling ras the same way as on arm64, using SCI
notification for QMP source.

Patch 4 wires SCI support to the x86 driver at ich9 and
piix4.

Patch 5 adds the new DSDT and HEST binaries to be used on
tests and removes them from bios allowed diffs.

Patch 6 updates acpi_hest_ghes.rst: it splits arch-dependent
notes for aarch64 from the ras support, adding separate
sections for ARM and x86

Finally, patche 7 and 8 add BIOS tests to check that the QMP
interface is working on arm64 and on x86. This would allow
checking for possible regressions on GHES on those two
architectures.

---

v2:

- rebased on the top of upstream;
- patch descriptions were improved to make them clearer;
- moved an uuid on patch 3 to a macro and did an ajustment
  at the code that generates _OSC at DSDT;
- temporarely added SPDX macros on patch 2 just to shut up
  checkpatch warnings. Those are removed on patch 5 when
  the "empty" files will be replaced by binary ones.

Note: I've been using this patch series for a while now, to
help me to release rasdaemon 1.0.0 at the end of September,
which took significant changes on its code.

To ensure that my changes won't be breaking rasdaemon code,
a new CI was created as a separate project, aiming to do
end to end tests using QEMU, Linux Kernel and rasdaemon
on an error injection and error check logic at:

	https://github.com/mchehab/rasdaemon-ci

Its goal is to verify that all mechanisms are in place on
hardware error handling scenarios.

The rasdaemon-ci is written to be completely independent from each
project, with a primary goal of  detecting regressions at the
Linux Kernel and at rasdaemon. Indirectly, it also detect issues
at QEMU x86 and aarch64 RAS error injection logic via QMP.

Right now, it is using my QEMU tree fork with those patches on
it, together with another series I'll submit in separate carring
improvements to scripts/ghes_inject.py.

The rasdaemon -ci got several regressions that were fixed at
rasdaemon, and one regression due to a race condition at the
Linux Kernel:

	https://lore.kernel.org/all/d472a9a3ccfa8c0359d7d7acabed92c8927d8e47.1793174996.git.mchehab+huawei@kernel.org/

Mauro Carvalho Chehab (8):
  acpi_dev_interface: add ghes support state at AcpiDeviceIfClass
  tests/acpi: virt: reserve expected tables for PC GHES SCI support
  hw/i186: add support for HEST table with SCI
  hw/i386: add GHES support at ICH9 and PIIX4 PM
  tests/acpi: virt: add x86 DSDT and HEST tables
  docs: acpi_hest_ghes: document notification mechanisms
  tests: add GHES tests on arm64 virt machine
  tests: add GHES tests on x86 piix4 and q35 machines

 docs/specs/acpi_hest_ghes.rst        |  44 +++++++--
 hw/acpi/acpi_interface.c             |   7 ++
 hw/acpi/generic_event_device.c       |   6 ++
 hw/acpi/ghes.c                       |  30 +++---
 hw/acpi/ich9.c                       |  19 ++++
 hw/acpi/piix4.c                      |  25 +++++
 hw/i386/Kconfig                      |   1 +
 hw/i386/acpi-build.c                 | 102 +++++++++++++++++++++
 hw/i386/pc.c                         |  41 +++++++++
 hw/isa/lpc_ich9.c                    |   6 ++
 include/hw/acpi/acpi_dev_interface.h |   6 ++
 include/hw/acpi/ich9.h               |   2 +
 include/hw/acpi/piix4.h              |   2 +
 include/hw/i386/pc.h                 |   5 +
 tests/data/acpi/x86/pc/DSDT.ras      | Bin 0 -> 8818 bytes
 tests/data/acpi/x86/pc/HEST.ras      | Bin 0 -> 132 bytes
 tests/data/acpi/x86/q35/DSDT.ras     | Bin 0 -> 8647 bytes
 tests/data/acpi/x86/q35/HEST.ras     | Bin 0 -> 132 bytes
 tests/qtest/bios-tables-test.c       | 131 +++++++++++++++++++++++++++
 19 files changed, 406 insertions(+), 21 deletions(-)
 create mode 100644 tests/data/acpi/x86/pc/DSDT.ras
 create mode 100644 tests/data/acpi/x86/pc/HEST.ras
 create mode 100644 tests/data/acpi/x86/q35/DSDT.ras
 create mode 100644 tests/data/acpi/x86/q35/HEST.ras

-- 
2.56.0

