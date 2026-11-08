Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127517;
	b=kuud2l1aW7CFHh3Fla1CrDPoDmBJnsMoR8bJB9Cc16R2zraqhPVYtvuVlascw2+pCKvl
	 SCaxys0T8z28ptgniftUiiODCuz8BOSq4w03PlqSA39PjfZ2I0R/Islybtzp7D2YEjVSx
	 Eng/Sb5H17STNvYoYynTDU7dSTFNZFSaVVHdRXydxb7H7jqK96t+k3BrIfxwbjpnzoGhH
	 E7EJS0pfGvOIXATGGiHRkV4Ybp2oBnMKjwX2XqhFwT8hnC9zQcIh0DFk6ovJ9T0MirapJ
	 CXQHn3uBgEvE0bTEFKQEzBePX20nL6ODlNPyiHMBiZDSuPk1kemYV0T4WWnP4XhwRFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127517;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=pKRyi/P8OXU4hT2prHBcACIMzgezdIbO+h5QJsXXbDw=;
	b=lhK60uNTr3SsOO7N6d3yScV6vDpxHX1B4MeOE6eVQ7q3kIu4csx+1KSJN2BPFA6jLmnY
	 HFAvgHADxH2S5Oqak6IOrt5QiUVfLYAQyvbW/gFfbJChm96/quB0b8h0KCrw2MYua84wb
	 XCBWXYgPnOsHFmpBHCVklVP+rRsCmyJkNBIj+yzUN2MSTQE4IIO8j+wIXQyS8CpYZt2kf
	 NyVC2B0nx/w3g+Ew1ZGo1UUQTdBmJsrMtKD1D2nViwE3fHNLdw9QLXCbVvSmYlQDpIwQx
	 I0h7ntuyEK2tSk9ensfTuyG+2RnT8hTjhCUYQLM1k5hFt2bfZPt3D1mvbKEvoUJNbLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkArkYCM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7E606A322
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BkArkYCM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C651F008A4;
	Sun,  8 Nov 2026 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794127516;
	bh=pKRyi/P8OXU4hT2prHBcACIMzgezdIbO+h5QJsXXbDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BkArkYCMZfwSckb55IDsFd454rLz/obmEjUAondI9pwNIZZXokQA8uDksjIE3nT/z
	 AxXZ+M1hquu9yfDv0NR1WpDbOubDBkixIbvuX0yjxKdnCsoK9UNKbeSNmYQcbpZNx2
	 SGrrf/GeYFySreSnOu2+n/E7SP00GA1u06IUdyR75IYJu23S5pswBGVTzKi/5qFrKB
	 sFXzeukaap7cLxA5t0DMTITjOHHm2zxP0Ey9UhH4Ulg7kjjw7YOZI87Tv/ksB7Yox+
	 Nv2jHSDnOB/STezmm/Hd7RphdRlDS/EATnYsnJISYZGpNJiqyB6Fra4hdSsPTZfVLh
	 g4U7NHUyS/l0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyWY-00000005TMf-2ovO;
	Sun, 08 Nov 2026 09:45:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 6/8] docs: acpi_hest_ghes: document notification mechanisms
Date: Sun,  8 Nov 2026 09:45:07 +0100
Message-ID: <5474e7a37809445a46c862c61f96005204cd0ccb.1794124132.git.mchehab+huawei@kernel.org>
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

Currently, the HEST spec mixes generic support with arch dependent
notification mechanisms.

Move the arm-specific notifications to a separate chapter and add
a new one describing x86 mechanisms.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 docs/specs/acpi_hest_ghes.rst | 44 ++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index aaf7b1ad11a5..1a32550ef3a1 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -7,6 +7,7 @@ APEI tables generating and CPER record
    This work is licensed under the terms of the GNU GPL, version 2 or later.
    See the COPYING file in the top-level directory.
 
+
 Design Details
 --------------
 
@@ -105,14 +106,39 @@ Design Details
     firmware will write back the start address of either "etc/hardware_errors"
     or HEST table at the corresponding fw_cfg file.
 
-(9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
-    "Error Status Data Block", guest memory, and then injects platform specific
-    interrupt (in case of arm/virt machine it's Synchronous External Abort) as a
-    notification which is necessary for notifying the guest.
+.. note::
 
-(10) This notification (in virtual hardware) will be handled by the guest
-     kernel, on receiving notification, guest APEI driver could read the CPER error
-     and take appropriate action.
+    GHES support requires ACPI and ``-machine ras=on``.
 
-(11) kvm_arch_on_sigbus_vcpu() reports RAS errors via a SEA notifications,
-     when a SIGBUS event is triggered.
+Notifications on ARM64
+----------------------
+
+The ARM64 ``virt`` machine supports two GHESv2 notification sources:
+
+* source 0: Synchronous External Abort (SEA);
+* source 1: GPIO notification delivered through a Generic Event Device (GED).
+
+Source 0 reports hardware-memory RAS events on the ``virt`` machine:
+
+* When QEMU receives a ``SIGBUS`` from the kernel, it writes the CPER into the
+  corresponding ``Error Status Data Block`` in guest memory and reports the
+  event through a Synchronous External Abort (SEA). The guest kernel handle
+  the SEA,
+
+* The guest APEI driver can read and process the CPER record.
+
+* ``kvm_arch_on_sigbus_vcpu()`` reports these RAS events through SEA.
+
+When source 1 is available, QEMU supports GHES error injection through the QMP
+interface.
+
+
+Notifications on x86
+--------------------
+
+The ``pc`` and ``q35`` machines support one GHESv2 source:
+
+* source 1: System Control Interrupt (SCI).
+
+When source 1 is available, QEMU supports GHES error injection through
+the QMP interface.
-- 
2.56.0

