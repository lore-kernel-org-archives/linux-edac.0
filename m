Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128075;
	b=WpA+D5bygxTyTTnoGaLHY9GX2zrf609nrdcNhiOymNqnXgoAQoiQX34LXPrzSwwP78B8
	 8t4TDPSJl2gHXL/lPaRmBv7DUlLRWj+TCbX15kRs6/xMsA9Y+KRxxbbd8KQvlyLmm+6b9
	 hRhllMuSkUAMQ7k4Dd1m8zFnXpEQ0xItAPR6JV4LeTp7qm9L1Jagk9/Jk+dXMdVdqHhGz
	 mA5rUWHOLUDf+taEHYTNkaekXr0uaz84igXCiJEHRyIHBEGxEo5q3fR68nQHMjFG/tBE0
	 LcFfqb4L2PJQMAxO4p+KYDTRkFf/nWX/PQmjJKWJtdhMFE64PQBSEisbOgVU+QgFi5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128075;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=Ix9yM4d5Xtx+niZfRaYVX3/vvAStkIgt4uKxhLjOfgY=;
	b=QmmpIFNv4RAb0DmwsPETaxCHaYOR45J+oxPvYRJCl6RwznS6qCQ0md3DUMGS6HHRzgDS
	 Qj8C/X7ZecEWIXISet/mLNDQkvjngb5glqrTYAjV8pbTpvnuimGFf0wjIEsKeLvgEoko9
	 +uZwAGSP5TUw0kaDXd2KT/R/1FcUcFs3ypzfRo4Jrcth3PoL2lFOerzC6jBAFF1S5galA
	 rVY7Bhc/8ssjs8SGYO4iYOtwgRT1fKdiJPiqk3kiFlzeHHDJn+jOJNUdK1m4OMOS/X/TD
	 a50U7nt7obalGnnJ32ftV8yQinZigYUWGk9AyICCTl4fEj4EB0G9J6oI5SVUW2wh1cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eoo2lLmT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969F6606A336
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eoo2lLmT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9DB1F008A5;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=Ix9yM4d5Xtx+niZfRaYVX3/vvAStkIgt4uKxhLjOfgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eoo2lLmTSIn1x9Pa8JnTvSSuv9J8xJhjqx8ctAGTnrSwmKL7b7sUdDC7crMYy83uh
	 WzYmmQZHVoyJMW7LSqSTJ2tofEl7MyWaIrKoT3JKeQ1DhO35CQwkaaJ76EFyh86F6h
	 0gO0zAauta0HgwZpwlEDud7sTP9MaWlTPDCt2BNcBCAgeEHNMhv7L2lHoUdz4XPvh1
	 FSH3CA0PmWfS874iWDpVGrtNslL0eTUNG+kqu4+antHQ9c4UGI2Fe4x96An429y4Yv
	 KT2bziTqp3oORwwQWeHimabuvQtj1vs73VwG+gF+Au/RfiQ2D4p7WtLJKgJ7FV3Nw7
	 MDA2mZTuCfulQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uj5-1T7b;
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
Subject: [PATCH 07/13] scripts/ghes_inject: exit 1 if command was not sent
Date: Sun,  8 Nov 2026 09:54:20 +0100
Message-ID: <0f4a1190c7ca0d89aca378130eb892265b52e54a.1794127710.git.mchehab+huawei@kernel.org>
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

add a return code to subparser func() and return 1 if the
command failed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 scripts/arm_processor_error.py | 2 +-
 scripts/ghes_inject.py         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/arm_processor_error.py b/scripts/arm_processor_error.py
index 73d069f070d4..d9845adb0c0a 100644
--- a/scripts/arm_processor_error.py
+++ b/scripts/arm_processor_error.py
@@ -473,4 +473,4 @@ def send_cper(self, args):
 
         self.data = data
 
-        qmp_cmd.send_cper(cper_guid.CPER_PROC_ARM, self.data)
+        return qmp_cmd.send_cper(cper_guid.CPER_PROC_ARM, self.data)
diff --git a/scripts/ghes_inject.py b/scripts/ghes_inject.py
index 9a235201418b..6ac917d0b5db 100755
--- a/scripts/ghes_inject.py
+++ b/scripts/ghes_inject.py
@@ -43,7 +43,8 @@ def main():
 
     args = parser.parse_args()
     if "func" in args:
-        args.func(args)
+        if not args.func(args):
+            sys.exit(1)
     else:
         sys.exit(f"Please specify a valid command for {sys.argv[0]}")
 
-- 
2.56.0

