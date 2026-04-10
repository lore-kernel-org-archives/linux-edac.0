Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6007F3C0635
	for <linux-edac@vger.kernel.org>; Fri, 10 Apr 2026 12:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775824084; cv=none; b=hpoTA7COOWPOIZpFpHAhIUHc+JkfpULd/kRWL3i1a0HrCwyJqpycIrZfHFLGGYuf5GYwCcpA5fFjyNnX9r0vsVj8BugasNXklVTItvYJe5YOI123342R2VmOTpjn2IOzLqylcs7EWOacpEb0zPMLv/q2es5HI2drRKrXOlB1gHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775824084; c=relaxed/simple;
	bh=L7ngaATnPUsLbHCWA1TSRQReaL4UBAQzZqkCr9xCbp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opzJoMzjSRwAZ8koF6Sg5GGAhgjfQUwMkab3pTxHj3ohsURoTFldmP6hze6nhMfXRKIANNJE0bEobCLr5WVJHAcoH/NDlhUFNzGax954HkDT88zgmPdEONTXlolsqjRx2gbkpxnZVyzyMyFtsUnQex9VnUyzvIaNm58ZQ1GOasM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E5yxfQun; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E5yxfQun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775824082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JqWVbjGFjqEK+ntzjJzWg+L2/+VFH9nkKGGeQkx/IsE=;
	b=E5yxfQun512fW7+E5JkLSoqkeMX3f8IAyC7HwE57EHN7Ddzh8d1sr9NIK2KoHPUPdScuzi
	abiJ9s+VIkGi1jHhXCrB7NBec9t8hv0E9U6IqtKNa3iE4U286nxapGdSeHwEITMBJiE0BY
	hSj/K8Xoy1ImiLFYtDlNgjC1c90yRis=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-465-w7PCRV5BOrWN3EM5tK6v0Q-1; Fri,
 10 Apr 2026 08:27:57 -0400
X-MC-Unique: w7PCRV5BOrWN3EM5tK6v0Q-1
X-Mimecast-MFC-AGG-ID: w7PCRV5BOrWN3EM5tK6v0Q_1775824075
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3CE419560A7;
	Fri, 10 Apr 2026 12:27:54 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.33.165])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45CBE3000C1D;
	Fri, 10 Apr 2026 12:27:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS: Move contents from arch/x86/ras/Kconfig into drivers/ras/Kconfig
Date: Fri, 10 Apr 2026 14:27:48 +0200
Message-ID: <20260410122748.29978-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Thomas Huth <thuth@redhat.com>

Commit bc8e80d56c1ec ("x86/mce: Merge mce_amd_inj into mce-inject")
removed the last .c file from arch/x86/ras/, so that there is now
only a lonely Kconfig file in this folder. Its config switches
CONFIG_RAS_CEC and CONFIG_RAS_CEC_DEBUG are only used in code that
resides in drivers/ras/, so those Kconfig switches should better
reside in drivers/ras/, too. Thus move the contents of arch/x86/ras/
into drivers/ras/Kconfig now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/x86/ras/Kconfig | 23 -----------------------
 drivers/ras/Kconfig  | 24 +++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 arch/x86/ras/Kconfig

diff --git a/arch/x86/ras/Kconfig b/arch/x86/ras/Kconfig
deleted file mode 100644
index 7488c715427e5..0000000000000
--- a/arch/x86/ras/Kconfig
+++ /dev/null
@@ -1,23 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config RAS_CEC
-	bool "Correctable Errors Collector"
-	depends on X86_MCE && MEMORY_FAILURE && DEBUG_FS
-	help
-	  This is a small cache which collects correctable memory errors per 4K
-	  page PFN and counts their repeated occurrence. Once the counter for a
-	  PFN overflows, we try to soft-offline that page as we take it to mean
-	  that it has reached a relatively high error count and would probably
-	  be best if we don't use it anymore.
-
-	  Bear in mind that this is absolutely useless if your platform doesn't
-	  have ECC DIMMs and doesn't have DRAM ECC checking enabled in the BIOS.
-
-config RAS_CEC_DEBUG
-	bool "CEC debugging machinery"
-	default n
-	depends on RAS_CEC
-	help
-	  Add extra files to (debugfs)/ras/cec to test the correctable error
-	  collector feature. "pfn" is a writable file that allows user to
-	  simulate an error in a particular page frame. "array" is a read-only
-	  file that dumps out the current state of all pages logged so far.
diff --git a/drivers/ras/Kconfig b/drivers/ras/Kconfig
index fc4f4bb94a4c6..070e17639faa3 100644
--- a/drivers/ras/Kconfig
+++ b/drivers/ras/Kconfig
@@ -31,7 +31,29 @@ menuconfig RAS
 
 if RAS
 
-source "arch/x86/ras/Kconfig"
+config RAS_CEC
+	bool "Correctable Errors Collector"
+	depends on X86_MCE && MEMORY_FAILURE && DEBUG_FS
+	help
+	  This is a small cache which collects correctable memory errors per 4K
+	  page PFN and counts their repeated occurrence. Once the counter for a
+	  PFN overflows, we try to soft-offline that page as we take it to mean
+	  that it has reached a relatively high error count and would probably
+	  be best if we don't use it anymore.
+
+	  Bear in mind that this is absolutely useless if your platform doesn't
+	  have ECC DIMMs and doesn't have DRAM ECC checking enabled in the BIOS.
+
+config RAS_CEC_DEBUG
+	bool "CEC debugging machinery"
+	default n
+	depends on RAS_CEC
+	help
+	  Add extra files to (debugfs)/ras/cec to test the correctable error
+	  collector feature. "pfn" is a writable file that allows user to
+	  simulate an error in a particular page frame. "array" is a read-only
+	  file that dumps out the current state of all pages logged so far.
+
 source "drivers/ras/amd/atl/Kconfig"
 
 config RAS_FMPM
-- 
2.53.0

