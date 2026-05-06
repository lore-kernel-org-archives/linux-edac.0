Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B49522AE65
	for <linux-edac@vger.kernel.org>; Wed,  6 May 2026 13:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075272; cv=none; b=LqXwX1JSae+dXScnJp3ig5kr1CfKtVsuF5gsbGntjYDCMHU2514T6/3bN6Wh0HETUL1HKVtvTYtTCHhEvqraVB5rRWf54KftQk9kBG0kBzhhxOzxYVTmRWvM2DK6u++hbHrMWvoZ9cDLf4FGxZ8hsd2/FScMzDyYPOYnFdkKfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075272; c=relaxed/simple;
	bh=EyQ2TYDv7GuMCX2CwNup38B2RlmpOtyqxR+Cf0aiirU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cZww4/njhpf4u3IAFjkyeEsktHLgtQbfH7I/uINYvEM0DlbtP448iU4mZklE3HtLnuab8WlRb+BD9R4luCLoHnQCxSNT87lWCmZmuMkxwMGDMqBoFLypyNJnx2DthiqsIadBwVYDm+SmrQV5EhZt5RD4IXoznXKnrMCisv8lST0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OakMZv9d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OakMZv9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED214C2BCB8;
	Wed,  6 May 2026 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778075272;
	bh=EyQ2TYDv7GuMCX2CwNup38B2RlmpOtyqxR+Cf0aiirU=;
	h=From:To:Cc:Subject:Date:From;
	b=OakMZv9du2MPtPK6VKqqkC0hfTzpqPg8crc2HJ0nZ8BBCB4Sk3RM++0n//dRfCuDO
	 BXxDSCPhAQoHz0ukUxHhyvCdRIglikX/t772NshiZsdPI+hiP8GwonAvYmrwpeq5gb
	 x+xvjoUrAR9gh5cjr5VJxayp5mqKmv7o+BO9vpvBkvSJw9lupVRaJieuoTWtIKncJ8
	 VzLqQ0ihersa1JVOkIv1U18eZG1rCdi/Bc35WafRbYCiGTlr0mAD8fg/WxC3rospQj
	 xvBOC5Pk7Lk4mRMXa6MMHV/WgEazzy+BmAL1CXJdW9j0hSNmXFQSTo9+yb3OeGTSAe
	 foMOYAVWuoP7A==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wKcbN-00000008t0c-3ybo;
	Wed, 06 May 2026 15:47:50 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Thomas Huth <thuth@redhat.com>,
	linux-edac@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH] MAINTAINERS: update HEST maintainership entries
Date: Wed,  6 May 2026 15:47:37 +0200
Message-ID: <6316f5b788cdc6b63e808606649dc5862271b22e.1778075257.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Mark HEST code as maintained and assign them to me.

While here, add a "L" entry to EDAC ML as RAS discussions
usually happen there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afa178c5cce1..b6e1362e086d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2217,14 +2217,17 @@ F: tests/functional/x86_64/test_acpi_bits.py
 F: docs/devel/testing/acpi-bits.rst
 
 ACPI/HEST/GHES
+M: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+L: linux-edac@vger.kernel.org
 L: qemu-arm@nongnu.org
-S: Orphan
+S: Maintained
 F: hw/acpi/ghes.c
 F: include/hw/acpi/ghes.h
 F: docs/specs/acpi_hest_ghes.rst
 
 ACPI/HEST/GHES/ARM processor CPER
-R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+M: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+L: linux-edac@vger.kernel.org
 S: Maintained
 F: hw/arm/ghes_cper.c
 F: hw/acpi/ghes_cper_stub.c
-- 
2.54.0

