Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313836212D
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788630815; cv=none; b=iHgGkoryOjbBLgJYwHEqAB/cR4nbbvEwZtT92zC0MVohRRTHP20oOLIcbU+lePX4EVdKAA1bwJjP26a5F0uOcPyfJCGCF7JcZl+J1sW2jDFdrtzyujn7i387QwVhIj+ICGzBsHMtxrsc3tmGqGpHWX8fyYgyZhzO+z/DfoPzRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788630815; c=relaxed/simple;
	bh=iA1Yzm8L9obN+tTPMSib+eRI89gwXiwOVY2nmjymSis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PcXyWE2MkudZ+rUsMYutfboLjYxQ74Frng/wqBX9Fge+X+cWR94/i8UQDorSqgC8Tfr457sX4UjT/wSyyryBytjBLQjyQvMCTpvkKVqGdqop23u51PKYFv2v5sz31HyUjfgm2kXUfMXcLUl2Rx/XZJV1tZVDjOzgPfv5bbPChkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZQ8y1kf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZQ8y1kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A531D1F00ACA;
	Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788630812;
	bh=1Ap2AaEX7QZiIBIMnM0SlLinjnztzgM3LmFtkWcHmJQ=;
	h=From:To:Cc:Subject:Date;
	b=AZQ8y1kfimIF9IrBWDEkBZhtOB7J6rZHW2X0Ih8sr9vhhukIZdeHuQwJFkgkuEB9X
	 3nU1YqTO1/L1dFewb19akLFc66Qu/IHtPPAp+CnAgQXanzokQKimvYRN2AXxsBMUgA
	 vCorgSVjQFgiNzv1uhUouUtCX0nb9qh3k6/l0Yy073XGzTXfSJiIWO9iMqesDjqFhg
	 xhTOeSpnOKWIFNyWHn7HTLWHQFmHnA4kJ33mHpTAv9iW6Sh89pv+kxeWyKQrRTAHTj
	 Dd9B0L1erQ65zWFZ+H3cEwCyPADbeeo3zStZ5hvZa0XZhQV05R+rL8eq+8cWPM7M3J
	 3pGaV1pN3aKXw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x2ua2-0000000Bkre-2jlL;
	Sat, 05 Sep 2026 19:53:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH 0/8] Add SCI support for APEI on x86
Date: Sat,  5 Sep 2026 19:53:20 +0200
Message-ID: <cover.1788630333.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Igor,

After a long time, I finally found some time to finish x86 support
for APEI. Right now, it supports only QMP error inject.

I did local tests here with q35 and it works fine. I also added
tests for both piix4 and q35 at tests/qtest/bios-tables-test.

My end goal is to do functional tests with:
- upstream Kernel + QEMU + rasdaemon.

I'm already working on a temporary tree to implement it.

NOTE: this series is based on v11.1.1. I tried to base it on
the top of master, but there's currently a problem with a
docker.py script that it is causing compilation issues here:

$ ./tests/docker/docker.py
Traceback (most recent call last):
  File "/new_devel/edac/qemu/./tests/docker/docker.py", line 657, in <module>
    sys.exit(main())
             ~~~~^^
  File "/new_devel/edac/qemu/./tests/docker/docker.py", line 653, in main
    return args.cmdobj.run(args, argv)
           ^^^^^^^^^^^
AttributeError: 'Namespace' object has no attribute 'cmdobj'

As this is a separate problem, I'm opting for now to keep it
based on v11.1.1, to make easier for you to review.

There will be a couple of trivial conflicts to be solved when
porting to upstream.

Mauro Carvalho Chehab (8):
  acpi_dev_interface: a ghes support state at AcpiDeviceIfClass
  tests/acpi: virt: reserve expected tables for PC GHES SCI support
  hw/i186: add support for HEST table with SCI
  hw/i386: add GHES support at ICH9 and PIIX4 PM
  tests/acpi: virt: add x86 DSDT and HEST tables
  docs: acpi_hest_ghes: document notification mechanisms
  tests: test GHES notifications on arm64 virt machine
  tests: add GHES tests for x86 piix4 and q35

 docs/specs/acpi_hest_ghes.rst        |  44 +++++++--
 hw/acpi/acpi_interface.c             |   7 ++
 hw/acpi/generic_event_device.c       |   6 ++
 hw/acpi/ghes.c                       |  30 ++++---
 hw/acpi/ich9.c                       |  19 ++++
 hw/acpi/piix4.c                      |  25 ++++++
 hw/i386/Kconfig                      |   1 +
 hw/i386/acpi-build.c                 |  99 ++++++++++++++++++++
 hw/i386/pc.c                         |  41 +++++++++
 hw/isa/lpc_ich9.c                    |   6 ++
 include/hw/acpi/acpi_dev_interface.h |   6 ++
 include/hw/acpi/ich9.h               |   2 +
 include/hw/acpi/piix4.h              |   2 +
 include/hw/i386/pc.h                 |   5 ++
 tests/data/acpi/x86/pc/DSDT.ras      | Bin 0 -> 8818 bytes
 tests/data/acpi/x86/pc/HEST.ras      | Bin 0 -> 132 bytes
 tests/data/acpi/x86/q35/DSDT.ras     | Bin 0 -> 8647 bytes
 tests/data/acpi/x86/q35/HEST.ras     | Bin 0 -> 132 bytes
 tests/qtest/bios-tables-test.c       | 130 +++++++++++++++++++++++++++
 19 files changed, 402 insertions(+), 21 deletions(-)
 create mode 100644 tests/data/acpi/x86/pc/DSDT.ras
 create mode 100644 tests/data/acpi/x86/pc/HEST.ras
 create mode 100644 tests/data/acpi/x86/q35/DSDT.ras
 create mode 100644 tests/data/acpi/x86/q35/HEST.ras

-- 
2.55.0

