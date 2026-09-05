Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C0370D4D
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788630814; cv=none; b=o3hQ+jwJJRL3dUugim9aP9Gi4wVpxV8tL1bXgDjmiHE8N1m0zXWFdfXp/j+uSxuwhGC+VZURr8eGJ6zv7jZClbVOCMg90OOEN3DwWEj6CwumnyIKHyihoLb2z9rkm8PKA8AF5RV74Nqvi4XNKcNwwSuKdR97iBP+8gbDuAAGRqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788630814; c=relaxed/simple;
	bh=io1zDvqM2H2cejV3QsujH+qfzDqDSj/kF+IwkXpgTeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzWThZPSDBt+tQ2LAGN5LaB2SREMq6vhomTTvwR7YG/M8/khDEjQeFCgs79yZukGqARPbzRE4Qu9T00yEtmOD/jhMXC1xNMmkTCuJ0SPgQ7tHLM8qtsbblQ72te993YQ0bzbJjwPfy5bRks+OOjDCzhAPvmAq0gE2ymYmqOeeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9Smco0s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9Smco0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7491F00A3A;
	Sat,  5 Sep 2026 17:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788630812;
	bh=wQgyAR83act1RsCI64W0ZhW7znuJEWe5RJhFGqpIHYk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E9Smco0sr8osi8vff1k/862N5+0EHe9XmUfcOTnEqXv0FhfFyzNYVfDsdbLtsv9MM
	 XrGWQzYsvTBIn50+2zojaJzvrJQ0K5VXBFFkoih+QW7TJQTzVSR29fVniExwpY16PC
	 RsEPCkqGRSN8oAafRLwMxp/jVGu1NYY037Mo2QWvvf9HkhOjKuYY8Y7mi0pf69wgzg
	 4teTh9C8l3nsro2qDPReMBfPzgBWk3lhdAoruF+h2afCWW2UHs4HKSq/IayhcNlqix
	 z2AAHEsUWHO3lVucuVucqVjskJmbEDtjZKNWy6in9dzbhxPI3aldUiatQ7O27BMQXT
	 U9Ih5ino80VYQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1x2ua2-0000000Bks1-3P5j;
	Sat, 05 Sep 2026 19:53:30 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 6/8] docs: acpi_hest_ghes: document notification mechanisms
Date: Sat,  5 Sep 2026 19:53:26 +0200
Message-ID: <ad5db180cbb52fe101c19edfcd1bf144e11fff76.1788630333.git.mchehab+huawei@kernel.org>
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
2.55.0

