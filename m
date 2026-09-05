Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771A1632E7
	for <linux-edac@vger.kernel.org>; Sat,  5 Sep 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600289; cv=none; b=hxZ6Z4YGf8yIvnwzhCr2hUVx2USOEqZNe4mrWZ3mcj8Wludc5b9XePfIRsUtkOYF4uPZuMiPPsz6SbrBZ89+t+qBOHCSGuQUIKBDqhAPncKQAabkPnw6kiQvCJSUPpwdja68n6vz4mg+RXuMhWT54aRzLLdEBWl43VQx4HBPEUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600289; c=relaxed/simple;
	bh=QaCebBQOpBVoyKU1YEampELmIKQVNwzsTR2of/MqDdE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u/Vu2px19bqs9C1zknRKl/NiQnakMgdeIPAWjYZ43oGVkJHrj7xibfRGXEOOhcv9C8NeVu9sTwu5d/xF3S0HgPaNwMxcplMmONtp2PfQgljOwhwv2JXaAPfRicfbeQs4tAiQktcv7mmuTSjWQptgrKd0O7UbMy9DzOPcv8JlszQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3RM0mTY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3RM0mTY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso20864055e9.1
        for <linux-edac@vger.kernel.org>; Sat, 05 Sep 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788600286; x=1789205086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1B6Q2UTc0NYJ9rjx4iyizU2jLsIDy7H6FgDj2PqGSg=;
        b=T3RM0mTYau8OmUyiTPKI0wuHRhucuVj1DrkaDJsAGRFirIIMomsywLoB8rohTS2ITP
         1ePUIuCygwHG1CUl++fYkh/CVUV383r8sgN4/ntt1TAyK6lHceDZedfb+v2EeslGBaE1
         99FK3lS8KQj9FupSsqj4bCRKZyvQ811t0jzQoFRLGq5J8B25subN3D7VQiVTCFFnu/a1
         DGR5mk/FMwRVwBP1Gehs8ZSe1urD9KuXSZnUnUOXiZNGCuLMuyg2ePudJC41CUBO1uUQ
         oaV9I/FsLnkOslgKHBfrTHX2AONbduLJolL8ua0KAvP+GwCk197LUC379Wl4Q6aP+d08
         SNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788600286; x=1789205086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1B6Q2UTc0NYJ9rjx4iyizU2jLsIDy7H6FgDj2PqGSg=;
        b=ZVbcwlUi7bHL2HSMxok+f3a0vCBWUb+G+A7VKjfgsqIGWCrCq8LpYRxvejPaOhioef
         tZ3DkbjIX8f0anJrwjAXijeC42Honr5g2JFGKmbjTYEbO1JCW0rFrucMYzpBmbOp8uFS
         VVCXpp6FTqBp4OsVXShtS+M23eXF52jMFu82fnvlkkNE2QdVfFuPIQX4NDttxpVfRqTz
         UWMoGSW9wOgXCVYkRnPqtxPkDndAOiruYRr4+vxwECDN6nBn3a9FqxxDXt97nB4iK6Qk
         VorZ4zSvKdVuiWJSfZiZU7aSgOd0HtksR1cVb97HIrYLHgzxBv2A7w04MT3bNky00WU5
         VLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwU2yJ6bLtS8JFQwofbslJhMj0wKS5+c0TZHOOjxn4deqANKr1SfezOTwrgJpcQOuqrG3qO7GzDNkWN@vger.kernel.org
X-Gm-Message-State: AFuF++lyl50YLiOOwElbdYHyiMniOCXG+4hjqdus81DMWByCettYFAMu
	vO8oX4Aw6QCvzganVgAnnGv2BLuJpCELez8/RbXCxQr0Ff6l8stDVSi3
X-Gm-Gg: AYBFou0YJFGeqhkB3uDShVCjouY/DjG2akD/gRskvbKv9L6DFNULJd23+d4lV+wYQVK
	90XOTMyu3RLfkqBrfV6Ec2zAlBeOViynQ127zpH5dEwIt9c430k8cgLBhnWg9Fk5G0VZqx33eD/
	J7Qd49BEFSrgyN2dhV0P8ZT5TZ9K+N9lIlcM3q4O25yCyc69oby/InivZaF6axCWTPytaKhorCc
	2B/fsZSnOPl8wYKgJ6WAGyQfSPk1I8p1NEsghv02tnoHfm37ety6M0tZv3Z1lEk8wbJdLvFHABM
	l51z8SFxYb3rPTfPyNUEqKcxBjmzrbN95r5Q3Yq4LKWMPqb/AJxVAkhQXpwQqBBuOux8gCPWLEM
	hfHboOAMnP4tdKESFyRvqw9qadKEA3tNQpp51dsfYW6QGGOQfT2bEkFcJyPJ6xZ7GtsStNkL8JI
	fSCJiXc40nU99LJMehk6kULHjStgQV5CUBjRF8dHcGxAkaXbfs4DN7+yH2/FtVrz9uROtWZ9pgq
	a0K77+5/yfDLHDtgFuS1/Hxl98kPGqcAo+PhvUPlh6+QLzdE26mqmN6c0WLj7bAVIZfAuJGjes8
	iZU4RLye09WAX5711L9NdSTE/Z/RpairsesercuwPEG7rqIpv03C9qW+aeheTtG6ZUk=
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr112485365e9.4.1788600285882;
        Sat, 05 Sep 2026 02:24:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm107621925e9.11.2026.09.05.02.24.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:24:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-edac@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: RAS: Use the real EDAC PCI parity control names
Date: Sat,  5 Sep 2026 11:24:41 +0200
Message-Id: <20260905092441.41401-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The document names the sysfs control
/sys/devices/system/edac/pci/check_pci_parity and the module parameter
edac_panic_on_pci_pe. Neither exists.

check_pci_parity was renamed to check_pci_errors by commit 91b99041c1d5
("drivers/edac: updated PCI monitoring"), after the document had been
written.

The module parameter has been edac_pci_panic_on_pe
(drivers/edac/edac_pci_sysfs.c) since it was introduced, and the
document described it as edac_panic_on_pci_pe from the start.

Use the real names.

Fixes: 91b99041c1d5 ("drivers/edac: updated PCI monitoring")
Fixes: 327dafb1c61c ("edac: core fix redundant sysfs controls to parameters")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/RAS/main.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin-guide/RAS/main.rst
index 5a45db32c49b..c1040e5a5b35 100644
--- a/Documentation/admin-guide/RAS/main.rst
+++ b/Documentation/admin-guide/RAS/main.rst
@@ -623,7 +623,7 @@ Under ``/sys/devices/system/edac/pci`` are control and attribute files as
 follows:
 
 
-- ``check_pci_parity`` - Enable/Disable PCI Parity checking control file
+- ``check_pci_errors`` - Enable/Disable PCI Parity checking control file
 
 	This control file enables or disables the PCI Bus Parity scanning
 	operation. Writing a 1 to this file enables the scanning. Writing
@@ -631,11 +631,11 @@ follows:
 
 	Enable::
 
-		echo "1" >/sys/devices/system/edac/pci/check_pci_parity
+		echo "1" >/sys/devices/system/edac/pci/check_pci_errors
 
 	Disable::
 
-		echo "0" >/sys/devices/system/edac/pci/check_pci_parity
+		echo "0" >/sys/devices/system/edac/pci/check_pci_errors
 
 
 - ``pci_parity_count`` - Parity Count
@@ -725,15 +725,15 @@ Module parameters
 
 	module/kernel parameter::
 
-			edac_panic_on_pci_pe=[0|1]
+			edac_pci_panic_on_pe=[0|1]
 
 	Enable::
 
-		echo "1" > /sys/module/edac_core/parameters/edac_panic_on_pci_pe
+		echo "1" > /sys/module/edac_core/parameters/edac_pci_panic_on_pe
 
 	Disable::
 
-		echo "0" > /sys/module/edac_core/parameters/edac_panic_on_pci_pe
+		echo "0" > /sys/module/edac_core/parameters/edac_pci_panic_on_pe
 
 
 
-- 
2.53.0

