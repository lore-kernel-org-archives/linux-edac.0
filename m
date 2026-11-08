Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128076;
	b=K7gx3bbLoc4FXPziCTnqGJqW15eJh+jdo7P6KiVViuvdbaxtyqa2i1HMJpDGdU2DQLSr
	 3VOPFVMZlGigXqWUPQdbk2IhrtDFaUQ8BUjxUmHlxz03VyzZccu3Vh1sQnYY7t4F9uDUV
	 DP8OttPUngZrmqk8wndxjolMvwjsKE8wi1dVDXNPF+VsE+RFn+MuCyRXSpMH9jy8BsscX
	 wx+A0wSZQaxyVjm7RliTVdny361Tqvr+n6rEPgx96K9Nhlbz8vEwMskmHFA/JUdyiMwa3
	 IGinKPdZZ2av213l/k9+TT4dYVm4X5F9KETe1IoFCzRL3qRWO5wYtbQxt/dA4gyI8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128076;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=u0jUfLYGHmTJKlqAJnMjIixgonBhWmwwfi1Y/EWZfAg=;
	b=NdN3L3x+YyHaRGv+mo/CKq84/3zNUylNWHFC2LiDT9bpn0nD2j0zTyEjMkGTooAG6q/k
	 mvUoHeV+GCpPbzLnl35QHf/4Fym0Axg9xNRDTWsYRoQUI4uYaKwEc9mnJZkLv0t1Q3NZw
	 ypLnzmcHgOnbx3cpjEYsvRnMftkW6xTkyVby4ashMJfDteK6GiYZI8rjzHCwMPdtOhesC
	 tYcvAj0jMFaGAOV1IvGqN227LQuway1PWXtlydaw2Wdknl4uso9pZHLq2c6dx/gsum1tz
	 LZ9CnrVhKMVSUk4BiOIfvY1GO7e7zdbVd3tPXABdfSSRukVfQaxOKoKmzxsoLuedZNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L91oacFW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB4606A326
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L91oacFW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40621F0089F;
	Sun,  8 Nov 2026 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=u0jUfLYGHmTJKlqAJnMjIixgonBhWmwwfi1Y/EWZfAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L91oacFWJhg7obp5TghRm7rIa46l8UIdmG3iDbMWMDZkPZP/1qnzm4j5IJwZmuljq
	 9SrkAbJyN3+aUKRNgLOsgRvMAXVgBHDuUF6f3oWA5uYhXWHtkmRNeBWW5Bt1kNP4SZ
	 etJV1SK/VDR5tDbiU+X4ChoVGDlvzAWJYKUmY+049Tp1J8CB1gStjt3cey8dm7rFDG
	 PtPkNjQkCFaZJTrHgU4cAp8k5QEFCvunIXkefckwSu3+xrKcxyt+1392ivSeqPlUIq
	 dGlWtELACaoinqqU0d7K0HyP58Mhypw+PX+S2sXINCLrYWefzmbJWZQZCQyd442//W
	 cPHtpx2sIJf0g==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uip-12aC;
	Sun, 08 Nov 2026 09:54:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Michael S Tsirkin <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-edac@vger.kernel.org,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH 03/13] scripts/qmp_helper: add support for FRU Memory Poison
Date: Sun,  8 Nov 2026 09:54:16 +0100
Message-ID: <66ea0a7cb79ea17a06217d56b82b00c21de4565f.1794127710.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794127710.git.mchehab+huawei@kernel.org>
References: <cover.1794127710.git.mchehab+huawei@kernel.org>
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

This GUID record descriptor was added on UEFI 2.11.
Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 scripts/qmp_helper.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
index f51a06bad8d4..7190c988558a 100755
--- a/scripts/qmp_helper.py
+++ b/scripts/qmp_helper.py
@@ -736,3 +736,7 @@ class cper_guid:
     CPER_CXL_EVT_DYNA_CAP = guid(0xCA95AFA7, 0xF183, 0x4018,
                                  [0x8C, 0x2F, 0x95, 0x26,
                                   0x8E, 0x10, 0x1A, 0x2A])
+
+    CPER_FRU_MEM_POISON = guid(0x5E4706C1, 0x5356, 0x48C6,
+                               [0x93, 0x0B, 0x52, 0xF2,
+                                0x12, 0x0A, 0x44, 0x58])
-- 
2.56.0

