Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127517;
	b=mZtVFUtam0DjthmXRMjCSbhWSFhi5id6CA488HJEKfKXwIWceZpgFobKwvZmRppcYm7A
	 mmeChsJPPidhAMpndBwOO8XiLBk7mxdAlYv+Hl0D0z4od4pJYTIa8d9728Ei1Sjm/VZrh
	 qdxMVlUNmm7vtWOQ283JiPcQsg1xraIdpMbK6zI7wM0oTfKtjnKHI3nePumvix4Q3k9sM
	 50i0rSTFWaNtno7h/iTfj1iUvPvYIrsTVLMydjilE21BVtnCuGvgxebJCN1/Fpank6sR2
	 TwakiBITtjQnnFpKnN9JiGeVK0LBt+k7XVJf00d+PKK0VTrvAMLI6hKKYjmFmIAXcVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127517;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=/CSl8lAcUCmig49S7F/exLJyC2folrj9gXTelPXpoAg=;
	b=Ocg7AyqmLStOWBy7yLMdrsQo0wD2/nOcfSTTQb3GwTUzmhINlJURXEdfkluG51PQ0YF/
	 KujavFDgohBWKcJAZmmdEJrMSr0OXfiEwTGpoG+aux5kYPj0Q4pKJshEWHQe5APJFiM7q
	 DOFDTQzwDzNdDip0XTTvduDVfLzPrd3vt8AmPxYyqoW6/+xMBlXNyd4fCZlAtKT7Ba7kF
	 Tsxz629IXqoyBfWBWCxGP7l9dCgq5+eNQ07zzDnoN9VZSw58ZubmyAbOGhd9fjSNNqI2z
	 kjojjgv4Nlf74GQj15q351cCawFBCwwI3FZ1H8jKbOtAySfGpxpa7akyyjmk1Dy6eoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/Sre320";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8365606A31C
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/Sre320
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816AB1F008A2;
	Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127516;
	bh=/CSl8lAcUCmig49S7F/exLJyC2folrj9gXTelPXpoAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E/Sre320ala3SG+5ghsxVgo07C0h4hsouEMMu5Pgc/8f8oZtwAdhexNNAyA5DMvss
	 Nfr+KuhOPpl69p7lshjmwbWJMF48WMUj3e1pksl4xkZFp/uDYUg4lzD8bopJDHy0pB
	 2zzKpdXPYAC3dllPw/xsx8taXag2Ua08BKv9h8jAp1jwHzg9ORqHiGsZZi4cqa1Hzm
	 7GaNA42ng0F3IE125dsBA8dVDItRdrJ7ZPWG8Q0Al4aC6ucWvh91rvaQpZCOXXFL03
	 bGL5dLZNXQIkw87fz2E4QPtft/qeY8oo6mgDUz1lSK+5r05v2yNK9q21IQ+Ku04Ye6
	 FkjiSra4Zbh8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyWY-00000005TMP-2OCc;
	Sun, 08 Nov 2026 09:45:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org,
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH v2 2/8] tests/acpi: virt: reserve expected tables for PC GHES SCI support
Date: Sun,  8 Nov 2026 09:45:03 +0100
Message-ID: <ecf4f7a15c96d4cecc51e4bbd88d71a9af4f3619.1794124132.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794124132.git.mchehab+huawei@kernel.org>
References: <cover.1794124132.git.mchehab+huawei@kernel.org>
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

Prepare to modify x86 firmware files, disabling DSDT and HEST table
check until we update it to new firmware file changes.

Notice that we're adding a SPDX header at the new files just to
shut up checkpatch. This will be dropped when we add the BIOS
binaries there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/x86/pc/DSDT.ras             | 1 +
 tests/data/acpi/x86/pc/HEST.ras             | 1 +
 tests/data/acpi/x86/q35/DSDT.ras            | 1 +
 tests/data/acpi/x86/q35/HEST.ras            | 1 +
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 8 insertions(+)
 create mode 100644 tests/data/acpi/x86/pc/DSDT.ras
 create mode 100644 tests/data/acpi/x86/pc/HEST.ras
 create mode 100644 tests/data/acpi/x86/q35/DSDT.ras
 create mode 100644 tests/data/acpi/x86/q35/HEST.ras

diff --git a/tests/data/acpi/x86/pc/DSDT.ras b/tests/data/acpi/x86/pc/DSDT.ras
new file mode 100644
index 000000000000..73fa78ef14ea
--- /dev/null
+++ b/tests/data/acpi/x86/pc/DSDT.ras
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/tests/data/acpi/x86/pc/HEST.ras b/tests/data/acpi/x86/pc/HEST.ras
new file mode 100644
index 000000000000..73fa78ef14ea
--- /dev/null
+++ b/tests/data/acpi/x86/pc/HEST.ras
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/tests/data/acpi/x86/q35/DSDT.ras b/tests/data/acpi/x86/q35/DSDT.ras
new file mode 100644
index 000000000000..73fa78ef14ea
--- /dev/null
+++ b/tests/data/acpi/x86/q35/DSDT.ras
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/tests/data/acpi/x86/q35/HEST.ras b/tests/data/acpi/x86/q35/HEST.ras
new file mode 100644
index 000000000000..73fa78ef14ea
--- /dev/null
+++ b/tests/data/acpi/x86/q35/HEST.ras
@@ -0,0 +1 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..b3761468accc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/x86/pc/DSDT.ras",
+"tests/data/acpi/x86/pc/HEST.ras",
+"tests/data/acpi/x86/q35/DSDT.ras",
+"tests/data/acpi/x86/q35/HEST.ras",
-- 
2.56.0

