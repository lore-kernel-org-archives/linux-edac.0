Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A7049483D
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788630815; cv=none; b=C4H3AyVzYsoglHxP7XRS5d7lYVL/SKF2vRvOSxA+XVKOvYgFqswB8a42H4FH2lvwQ+JyD8uioE1y0aXmT7RBAbhR0gE4RnyZY8ZCNxQDADJRNBdU32mrAG4UzCheoqbfdExXbTAaRr4b4USF+3eUOkx6MNDTTJXilaYQOylb+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788630815; c=relaxed/simple;
	bh=mne6VxsyQ0zJkbmjf7yEsrjsUXU8JfLRdMur859ugQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0KJUVi9KGXPfz3lJtyp0zg13Mwp5XbPiwgxHOsgM8xO4iQji81m/cu6WYZBiump26WcKJltjDkvtX/8eiUwdMHCGPWt4Cl7RaWFDpRFKXDRIvRIgic3uiV2YLoXiddP6fjGJVasBhHK7yJZgIp+5FdrNtluBAqnklwzixGLBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow7QEv4L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow7QEv4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A734F1F00ACF;
	Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788630812;
	bh=iZMFXJG4YPvTIBsURsNf5N+2DcwOXXHAUugNxjcUsBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ow7QEv4LF3zgMu0XahMoKaqbZoX98jVoKQ1P3uRtTLw9EcurzYv097ac+iFsDCOSG
	 krCt7zt4TKdoMAryIPjXL/x0N8mEFJZD3ouPjH8Vdm47EOtrfsoP2nqq6nD1w1Chl8
	 +YIvV1NMEOqft6weoNljtKmFjioTxwYp1fKlLgPdxGq7THEENhIZhdn9vVj2kSkEbf
	 M+SBZSvROysuzZFbLWD7Zy5ybYNotTmUCeYepQMid7fVbmppnFp7yZKErGilHvSYNQ
	 tdQw++mXMmzoMZmrwO+/ERsQRg1TyW/Wkk9ol7Cq35G0twkD0MjgP5kWi34YyuwDhT
	 guxz4WaHYEfBQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x2ua2-0000000Bkrl-2xnb;
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
	Ani Sinha <anisinha@redhat.com>
Subject: [PATCH 2/8] tests/acpi: virt: reserve expected tables for PC GHES SCI support
Date: Sat,  5 Sep 2026 19:53:22 +0200
Message-ID: <bd387daaf58644a71258ebcff789d285da2ff8e7.1788630333.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788630333.git.mchehab+huawei@kernel.org>
References: <cover.1788630333.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Prepare to modify x86 firmware files, disabling DSDT and HEST table
check until we update it to new firmware file changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/x86/pc/DSDT.ras             | 0
 tests/data/acpi/x86/pc/HEST.ras             | 0
 tests/data/acpi/x86/q35/DSDT.ras            | 0
 tests/data/acpi/x86/q35/HEST.ras            | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/x86/pc/DSDT.ras
 create mode 100644 tests/data/acpi/x86/pc/HEST.ras
 create mode 100644 tests/data/acpi/x86/q35/DSDT.ras
 create mode 100644 tests/data/acpi/x86/q35/HEST.ras

diff --git a/tests/data/acpi/x86/pc/DSDT.ras b/tests/data/acpi/x86/pc/DSDT.ras
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/x86/pc/HEST.ras b/tests/data/acpi/x86/pc/HEST.ras
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/x86/q35/DSDT.ras b/tests/data/acpi/x86/q35/DSDT.ras
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/data/acpi/x86/q35/HEST.ras b/tests/data/acpi/x86/q35/HEST.ras
new file mode 100644
index 000000000000..e69de29bb2d1
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
2.55.0

