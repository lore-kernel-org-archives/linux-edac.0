Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128075;
	b=IwtnimfuCKuhQkv8SY2vDSuftYOcBosjfmju5OXvVz+TQUCwE7ZhGvlkQbiFJvwHx40x
	 g50dQzE4g71gBwqT1SAvwsoMd3UGm4p9fl64eOpjriHGrbhTy2EQ9dBqgGvRuhCwWAOpU
	 no2tEQHxJmkMqv95AEWtbCIQDI33UNvVB+ti5oo3RnfNa/uwB1rhWcOXi1BZ7yAhUZPfN
	 iLXyKy4/5KHtg93Wke/+6dSNEr+URDSKntK+XGXsUH6PiMqpZ8CIHaoldJaYQl43BlYwF
	 j8CDgGxzd31CJbmY/eLKTMpMPD91xhwTkFMqpk+c5iALsPi6UgzRt2xl9Hh8JmG1bBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128075;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=s/CW4Lo86N8uedhjC71Ed80A3/qQNRmMfhoExm5L3SE=;
	b=Y6g4/XKrvEp8IMonHIpI/1qCkP+lm60INy29bLejLMWH08qWE7I4M+KQERWouDcf2tf/
	 6XHCX112Tbjyy5Ic1l/4//w5s4zEnbJ+DediQ1Z+6d/XijnApksAYJEWXlaoER039gh/+
	 kLILhMtbYOE2TsDboD95W3sAl2mhI0YomrbW+emKDF70rKZv8iJw399xqm+b3tWvS9GIv
	 vui5tGpldEFBHM9jiTC6/WofPH+T3lgltuOZ2fTN/MOFBUfnvwaXzYDuTHEEahZkXWPEm
	 OfGe/NxAM/OR/vYg6947sSj9DjdSTTyGgk2WMlysGHYtcjYCsUxmywEGQ6QBjk2aHag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JzTvOdbf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86C606A31C
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JzTvOdbf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D9B1F008A1;
	Sun,  8 Nov 2026 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=s/CW4Lo86N8uedhjC71Ed80A3/qQNRmMfhoExm5L3SE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JzTvOdbfcgKVBPi2BBsqnkCirnwyRnP603UjWKrTlVp9eRwLnNA1tGLUKbgMLSy/u
	 eBCj1Xo4OuwdRBmwZ2uaxo4eZjPXXPWp0ODeQ+Axggtz+fvg3n5MWol9jjdNyqJ579
	 E1+fMnFPidLidOPxeK684d+HLdAaAKD/JiRaqA997vUSPsU+lsia+udzGLxMbz8sRT
	 El80lvUW+HnPkLkFxccbiMtARlqdxoav0EchjN+G5lOeIIQLwYIEzAQ3gUiN7K3Dwn
	 EUFVDcXdRj7wXRQZ7BkNFBRvYiNr5JPtmu1uDLNzUj+k7ev8LMeweabXmLPO8CHGgf
	 VerL8D0bSDwJA==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uih-0p51;
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
Subject: [PATCH 01/13] scripts/qmp_helper: add a return code to send_cper
Date: Sun,  8 Nov 2026 09:54:14 +0100
Message-ID: <ca83c3f2cf9acc9abaabcddc1757744148921c3c.1794127710.git.mchehab+huawei@kernel.org>
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

When used inside a loop, it is useful to have a return code to indicate
whether a send cper command succedded or not.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 scripts/qmp_helper.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
index 521612fb9461..a921a114cdc8 100755
--- a/scripts/qmp_helper.py
+++ b/scripts/qmp_helper.py
@@ -526,7 +526,11 @@ def __init__(self, host, port, debug=False):
     # Socket QMP send command
     #
     def send_cper_raw(self, cper_data):
-        """Send a raw CPER data to QEMU though QMP TCP socket"""
+        """
+        Send a raw CPER data to QEMU though QMP TCP socket.
+
+        Return True on success, False otherwise.
+        """
 
         data = b64encode(bytes(cper_data)).decode('ascii')
 
@@ -538,9 +542,16 @@ def send_cper_raw(self, cper_data):
 
         if self.send_cmd("inject-ghes-v2-error", cmd_arg):
             print("Error injected.")
+            return True
+
+        return False
 
     def send_cper(self, notif_type, payload):
-        """Send commands to QEMU though QMP TCP socket"""
+        """
+        Send commands to QEMU though QMP TCP socket.
+
+        Return True on success, False otherwise.
+        """
 
         # Fill CPER record header
 
@@ -594,8 +605,7 @@ def send_cper(self, notif_type, payload):
 
             util.dump_bytearray("Payload", payload)
 
-        self.send_cper_raw(cper_data)
-
+        return self.send_cper_raw(cper_data)
 
     def search_qom(self, path, prop, regex):
         """
-- 
2.56.0

