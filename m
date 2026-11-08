Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128076;
	b=q/5XpoB8rVXHLedyhrAybHlwZ1CqPOzAlrK1eKdpxbkHfM4maf9UaldoFNijcElmd+oY
	 ARqRsPqpFI8Err+7GYm7youCPl0E3TBjPJWTNaXegOuMs5adwzPBzHd9AOUBgeLVf/IjJ
	 eWFzsUp+iYjbY6PxE4h6lb09IC02cgEm2QRVBtwFv1CcJ+k00Mp6jopMbRrIcOVEPTgc9
	 gGZvqvZ6nbpn+XNPr5U2EZRCM8LBImFOhwjUs8hboYDashFcuLnOzcDcOlyErAJVMxr8g
	 MI+NKIo5IYxMXYxbJ/+xtfwPbnN4jNF94ENCZN0PMawvBPSOYHggeggrHrY8fZL/e+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128076;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=dmVa1860X/7ajspCqh1w6fAF4yPYQKt73v9KQI6jTlY=;
	b=xnkRify71+QWyFLegLfVAu1d2En6JZLstvm7oJJwT/xYXBxFuH1FJLn9NbGbASWnAVDy
	 M2cddwbU1uaO6TMYYkAD/NsNZi2PrREr2ky3micwKPAdufdcIBRhdTvb/IHaid12muR+I
	 GVh2f7UrkRl+M2hnJNFPDkNSU32CU1O+YPqzXiNvcMYqGQ0TkeVTSctzSq4jcZgdd+QTu
	 LsFASiObjNJzNV8aEoNT9rJw+WUntoez6xRbjPU0WJdZ8FaewjNYSbuCZ2qdPCvehc4Fw
	 I7yuaQyRcvCGQf0xgO4GVtj1guXeZyVENcIHja8aDjzvUqq5KQVEMIYFRthIgKlFNNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCTUwcyS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF18606A323
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCTUwcyS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066311F008A3;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=dmVa1860X/7ajspCqh1w6fAF4yPYQKt73v9KQI6jTlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QCTUwcySwQV09daQU8gJX6cYhZmL0IkydoYONdv0of+vQT6CJb7RzujtEyi3yrFIr
	 gtkC0Smgw6UclXQfO7ksce/e0oBJ/EbKCZKhahLBNopaAImvlC8igpKkFQkZ3xAlkD
	 G8fQmucsR+/1PtO6KG2ZQN8tYA7Z8nI82QpCld9zQU9HrbS5X49TbTNFWo9Z5vPffh
	 egIoPDL23uMyPjk7Kdrqx6ywfKCsx+L+DxPDOd2M288vZrY6fpxAdE6NVnZz4ixAjA
	 cmhMoYM5XW8SbxzXxp6l4t2GtugKq56iZKSW+cwM27aH0ixMikOib6E8bsmR5cbMg/
	 uNv3kyaEizXxQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uit-19G7;
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
Subject: [PATCH 04/13] scripts/qmp_helper: make send_cper() more generic
Date: Sun,  8 Nov 2026 09:54:17 +0100
Message-ID: <c7d0bb25fce98f0924b632dd3116c83d55b10408.1794127710.git.mchehab+huawei@kernel.org>
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

Allow the caller to set GEDE, GEBS and raw data. This can be
useful if one wants to replicate a CPER with the same parameters
as the original one.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 scripts/qmp_helper.py | 69 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 55 insertions(+), 14 deletions(-)

diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
index 7190c988558a..7d9f955bc57f 100755
--- a/scripts/qmp_helper.py
+++ b/scripts/qmp_helper.py
@@ -546,22 +546,11 @@ def send_cper_raw(self, cper_data):
 
         return False
 
-    def send_cper(self, notif_type, payload):
+    def get_gede(self, notif_type, cper_length):
         """
-        Send commands to QEMU though QMP TCP socket.
-
-        Return True on success, False otherwise.
+        Return a Generic Error Data Entry bytearray
         """
 
-        # Fill CPER record header
-
-        # NOTE: bits 4 to 13 of block status contain the number of
-        # data entries in the data section. This is currently unsupported.
-
-        cper_length = len(payload)
-        data_length = cper_length + len(self.raw_data) + self.GENERIC_DATA_SIZE
-
-        #  Generic Error Data Entry
         gede = bytearray()
 
         gede.extend(notif_type.to_bytes())
@@ -574,7 +563,13 @@ def send_cper(self, notif_type, payload):
         gede.extend(self.fru_text)
         gede.extend(self.timestamp)
 
-        # Generic Error Status Block
+        return gede
+
+    def get_gebs(self, data_length):
+        """
+        Return a Generic Error Status Block bytearray
+        """
+
         gebs = bytearray()
 
         if self.raw_data:
@@ -588,6 +583,52 @@ def send_cper(self, notif_type, payload):
         util.data_add(gebs, data_length, 4)
         util.data_add(gebs, self.error_severity, 4)
 
+        return gebs
+
+    def send_cper(self, notif_type, payload,
+                  gede=None, gebs=None, raw_data=None):
+        """
+        Send commands to QEMU though QMP TCP socket.
+
+        Return True on success, False otherwise.
+
+        Arguments:
+            notif_type: Notification type (GUID)
+            payload: bytearray with the payload
+            gede: Generic Error Data Entry. If None, the code will generate
+                  one using the defaults and generic error data arguments
+            gebs: Generic Error Status block. If None, the code will generate
+                  one using the defaults and generic error data arguments
+            raw_data: Raw data to be added after GEBS. If not specified,
+                      the code will generate one if Generic Error Data
+                      --raw-data parameter is specified.
+        """
+
+        # Fill CPER record header
+
+        # NOTE: bits 4 to 13 of block status contain the number of
+        # data entries in the data section. This is currently unsupported.
+
+        if raw_data:
+            self.raw_data = raw_data
+
+        cper_length = len(payload)
+        data_length = cper_length + len(self.raw_data) + self.GENERIC_DATA_SIZE
+
+        if gede and len(gede) != 72:
+            print(f"Invalid Generic Error Data Entry length: {len(gede)}. Ignoring it")
+            gede = None
+
+        if gebs and len(gebs) != 20:
+            print(f"Invalid Generic Error Status Block length: {len(gebs)}. Ignoring it")
+            gebs = None
+
+        if not gede:
+            gede = self.get_gede(notif_type, cper_length)
+
+        if not gebs:
+            gebs = self.get_gebs(data_length)
+
         cper_data = bytearray()
         cper_data.extend(gebs)
         cper_data.extend(gede)
-- 
2.56.0

