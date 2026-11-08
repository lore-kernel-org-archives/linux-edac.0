Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128076;
	b=kEB0JenC1/3hFgX/7jrH8jJIiBpHTGoT0PbNExLNDrNqn6kaXWu9Pj1HSAYOKqvHAEzn
	 LuhdJxkCXnMmGig6Mvdf/DndKoj6jupQZjg6UxNV1PRRxH3ImTeX/zSM9EfVccic9Tgbo
	 qvfD+A8Ne03IQmJtN+5x+8yGmUGYavUasmvZy2XAsaR5WmOvTv79L/kiSkgrjfBAOoTyD
	 HWGc7mDsgIozvBLm2I742zi9IVafKEcjyT6+BslO6w4OEPIQpDgZoo3sKtWqivTpckN/A
	 lA9eYl8GsrVjsCiGcGHfWDGwr6xc+ElHi1LWZdn9jIzx74QD+j+PMd7UpeTZnjGxRGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128076;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=/N4xNXyoUmxr5nKsU/tkQ8X73+Q0bw96PTZ1n78L9QI=;
	b=uCLElAkvVUesAFxQf02aqVO8zFCSxVp1fOMlGTzDTz+gA3Wggdgl9yjUM4meVo6mVa3x
	 9JC4CS7hxkMrBZWxlGncgN5IW7G1sKBYuK7uV7KCm5IyMY/JRtyMzmtRb+2b9hJl5cHIO
	 tX1LJPG7tXcClw3HqPBsU7L4K+lrohz5p8g7bRooDB/yhc19Fkte90i7tY55zW2S6N7l9
	 ZiP9V14B6+Vr/p7535wOGfQyuX5L9m2Pncutnf5OaWAcYJkNjQqzhuhx2omxoGC6489co
	 +96QKOT+go1F3fNYgSEdnCh+Q0D4raOlszQk1hDBJta+G0gqZJwrqQ0ePAsdeEjRMEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aW9uXPE9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36FB606D802
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aW9uXPE9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5E81F008A6;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=/N4xNXyoUmxr5nKsU/tkQ8X73+Q0bw96PTZ1n78L9QI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aW9uXPE9AtByWbMPfUn7KwBiy5sjivXtIldT9PN5s1X/ktKl3dUOzDIKnIrrlMWrC
	 OlX8G4hwWWcckCh81rWVbvc5Wn03a6xxZQlOTS20Y5bAU6IpwWbVJETg/pXe9KwT6L
	 2smgB3Eg/43a9JPl7wZOu0dJX0PJiY34KLqFTPyfqDC4DJL34wLs3rGhDcBHskBb0d
	 8IErYwNFs7uiLbrgtmC8yh4LoJ1wwmcdMz6G5vMoN90ZC7e24D+lcV1Akz3aaEH71l
	 tmllYTdptEOVlFW4rocadIx7I1ivhhJYDN78d+GCeND+lXJG3B+2ZLPZrguC7AHQBC
	 vXPHpJkhYnWqQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uix-1Fl1;
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
Subject: [PATCH 05/13] scripts/qmp_helper: fix raw_data logic
Date: Sun,  8 Nov 2026 09:54:18 +0100
Message-ID: <770e85f1a7de95a275ea5e0a9f25215036abbac7.1794127710.git.mchehab+huawei@kernel.org>
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

According with UEFI 6.4 spec Table 18.11 Generic Error Status Block:

Raw Data Offset:	Offset in bytes from the beginning of the
			Error Status Block to raw error data.
			The raw data must follow any Generic Error
			Data Entries.

Data Length:		Length in bytes of the generic error data.

So, basically, we have:

        +----------+                 /
        | GEBS     |                 |
        +----------+   /             |
        | GEDE     |   |             |
        | header   |   |             +--> raw data
        +----------+   +--> data     |    offset
        | GEDE     |   |    length   |
        | payload  |   |             |
        +----------+   /             /
        | Raw data |
        +----------+

where:

- raw data offset is relative to the beginning of GEBS;
- data length is only for GEDE header and payload.

The previous code was not calculating it right, as it was
filling it with the size of GEBS and placing raw data before
payload.

This is not a problem with default values, as they set raw data
length to zero, but, at the moment raw data is filled, the
generated CPERs becomes invalid.

Fix the code to calculate the offset according with the specs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/qmp_helper.py | 71 +++++++++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 22 deletions(-)

diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
index 7d9f955bc57f..f44118638c91 100755
--- a/scripts/qmp_helper.py
+++ b/scripts/qmp_helper.py
@@ -13,6 +13,8 @@
 import sys
 
 from datetime import datetime
+from os import path as os_path
+from time import sleep
 
 try:
     from qemu.qmp.legacy import QEMUMonitorProtocol
@@ -319,7 +321,8 @@ class qmp:
     Opens a connection and send/receive QMP commands.
     """
 
-    def send_cmd(self, command, args=None, may_open=False, return_error=True):
+    def send_cmd(self, command, args=None, may_open=False, return_error=True,
+                 timeout=None):
         """Send a command to QMP, optinally opening a connection"""
 
         if may_open:
@@ -331,12 +334,31 @@ def send_cmd(self, command, args=None, may_open=False, return_error=True):
         if args:
             msg['arguments'] = args
 
-        try:
-            obj = self.qmp_monitor.cmd_obj(msg)
-        # Can we use some other exception class here?
-        except Exception as e:                         # pylint: disable=W0718
-            print(f"Command: {command}")
-            print(f"Failed to inject error: {e}.")
+        if timeout and timeout > 0:
+            attempts = int(timeout * 10)
+        else:
+            attempts = 1
+
+        # Try up to attempts
+        for i in range(0, attempts):
+            try:
+                obj = self.qmp_monitor.cmd_obj(msg)
+
+                if obj and "return" in obj and not obj["return"]:
+                    break
+
+            except Exception as e:                     # pylint: disable=W0718
+                print(f"Command: {command}")
+                print(f"Failed to inject error: {e}.")
+                obj = None
+
+            if attempts > 1:
+                print(f"Error inject attempt {i + 1}/{attempts} failed.")
+
+            if i + 1 < attempts:
+                sleep(0.1)
+
+        if not obj:
             return None
 
         if "return" in obj:
@@ -406,6 +428,7 @@ def _connect(self):
         "simulated":    util.bit(2),
     }
 
+    GENERIC_ERROR_STATUS_SIZE = 20
     GENERIC_DATA_SIZE = 72
 
     def argparse(parser):
@@ -525,7 +548,7 @@ def __init__(self, host, port, debug=False):
     #
     # Socket QMP send command
     #
-    def send_cper_raw(self, cper_data):
+    def send_cper_raw(self, cper_data, timeout=None):
         """
         Send a raw CPER data to QEMU though QMP TCP socket.
 
@@ -540,13 +563,13 @@ def send_cper_raw(self, cper_data):
 
         self._connect()
 
-        if self.send_cmd("inject-ghes-v2-error", cmd_arg):
+        ret = self.send_cmd("inject-ghes-v2-error", cmd_arg, timeout=timeout)
+        if ret:
             print("Error injected.")
-            return True
 
-        return False
+        return ret
 
-    def get_gede(self, notif_type, cper_length):
+    def get_gede(self, notif_type, payload_length):
         """
         Return a Generic Error Data Entry bytearray
         """
@@ -558,22 +581,27 @@ def get_gede(self, notif_type, cper_length):
         util.data_add(gede, 0x300, 2)
         util.data_add(gede, self.validation_bits, 1)
         util.data_add(gede, self.flags, 1)
-        util.data_add(gede, cper_length, 4)
+        util.data_add(gede, payload_length, 4)
         gede.extend(self.fru_id)
         gede.extend(self.fru_text)
         gede.extend(self.timestamp)
 
         return gede
 
-    def get_gebs(self, data_length):
+    def get_gebs(self, payload_length):
         """
         Return a Generic Error Status Block bytearray
         """
 
+        data_length = payload_length
+        data_length += self.GENERIC_DATA_SIZE
+
         gebs = bytearray()
 
         if self.raw_data:
-            raw_data_offset = len(gebs)
+            raw_data_offset = payload_length
+            raw_data_offset += self.GENERIC_ERROR_STATUS_SIZE
+            raw_data_offset += self.GENERIC_DATA_SIZE
         else:
             raw_data_offset = 0
 
@@ -586,7 +614,7 @@ def get_gebs(self, data_length):
         return gebs
 
     def send_cper(self, notif_type, payload,
-                  gede=None, gebs=None, raw_data=None):
+                  gede=None, gebs=None, raw_data=None, timeout=None):
         """
         Send commands to QEMU though QMP TCP socket.
 
@@ -612,8 +640,7 @@ def send_cper(self, notif_type, payload,
         if raw_data:
             self.raw_data = raw_data
 
-        cper_length = len(payload)
-        data_length = cper_length + len(self.raw_data) + self.GENERIC_DATA_SIZE
+        payload_length = len(payload)
 
         if gede and len(gede) != 72:
             print(f"Invalid Generic Error Data Entry length: {len(gede)}. Ignoring it")
@@ -624,16 +651,16 @@ def send_cper(self, notif_type, payload,
             gebs = None
 
         if not gede:
-            gede = self.get_gede(notif_type, cper_length)
+            gede = self.get_gede(notif_type, payload_length)
 
         if not gebs:
-            gebs = self.get_gebs(data_length)
+            gebs = self.get_gebs(payload_length)
 
         cper_data = bytearray()
         cper_data.extend(gebs)
         cper_data.extend(gede)
-        cper_data.extend(bytearray(self.raw_data))
         cper_data.extend(bytearray(payload))
+        cper_data.extend(bytearray(self.raw_data))
 
         if self.debug:
             print(f"GUID: {notif_type}")
@@ -646,7 +673,7 @@ def send_cper(self, notif_type, payload,
 
             util.dump_bytearray("Payload", payload)
 
-        return self.send_cper_raw(cper_data)
+        return self.send_cper_raw(cper_data, timeout=timeout)
 
     def search_qom(self, path, prop, regex):
         """
-- 
2.56.0

