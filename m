Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128076;
	b=tD8m3XKC6q31deHRQ1i9uU8NMZGv1+Ol4IcfmswXypqErMNnriy+yp99ArSFNAOPdL8o
	 UGJ9PQ/DwLEVLFsEomTD0VYMJJjw9ahsrAh5S/CDhqQ5zmRGPYdxqIlNsdwaibAzkmI4h
	 dMD3FE+CJMXu+/io7+m5z+UqUBA8mcaNeXHx0Sh/85tJ0HmBf6ksKUj8CkAiMeNi/HH2c
	 cY/BAIGca7bFSprA3v7Zrlxgww5xSQjp2ytlfyGMXuqHii2zSu5MYPJw4U+XLsbPPLznP
	 eRLfwcSmfZjBCDzOG6mPFQGkPhe4iy5B24lb64EfnN4kkvOurtbiatdn7NkUOdv6joA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128076;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=AofEisHPa71V7e+1AJxK9WPx+5r7ivjgynVnO8nhMr8=;
	b=jsEKCcXXPFD1LLUYrrXVPzHNnnIdH6VJA3bkPuZcRlwwTeNBu5c8MWydgZOWKDDFXo2F
	 HQUQxA/mFBS6a3mFInepWqHJ+ijEbUXpPOM31qRw02JGslknN5mDcTm1bkBDvpdKAH+Qv
	 q6RXZW41GqVV+nDM1rcSEudlILBbgII/PXOv8YlyRt5SAPbIztS48WnDyWMNaEiB+mJqU
	 5p2zFW53j7fprbs4gn+UiSfY+fangq9rZ+4DBtA1VkER+W69WXmg41EXbNlK+aliZl7bN
	 8oUrj6Rqp1++pULMWLPd59W/nfVEichmk1ZfIS2ym3fb4ZdbYRuv+a7zPBUal38LYzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8zXAoOO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3E3606A33B
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b8zXAoOO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BBF1F00904;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=AofEisHPa71V7e+1AJxK9WPx+5r7ivjgynVnO8nhMr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b8zXAoOO6ZjTYRzNtfAXs/j6H9KwCMFJ0rwJLihz+zUqrhxo+MX1tfROLAkqSdeQz
	 k3FPYSK5c1MDpi6PRUnyJNo5oi7pfx8pk3aHczs+zwXPHf6m3FniR8xGUh8lfL+ZMv
	 rSb+N5zGEr89q4LMS22t6Dd8TI1axrsfQUbVqE6gLo6KLVMe69rPfPgaNWEDn4H6B3
	 4CtVMQlV1K46EsHqSWM+qt7uRhdc0aKaxP+9wJHmxkW4f33tZyNVmWSAxhoZZjmaPP
	 xlbhsdCuMxGaGszkkgUVTBvau2OwFLByciGGnslkMlPmwrZuN+2VvGchutEGabUs7q
	 3Ji33JNHs500w==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Ujm-27Io;
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
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH 13/13] scripts/ghes_inject: improve the retry attempt logic
Date: Sun,  8 Nov 2026 09:54:26 +0100
Message-ID: <c63cff02c016f1869ce5065225be3c1f1c1ed8a5.1794127710.git.mchehab+huawei@kernel.org>
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

Only retries if the cause of the error is:

{"error": {
  "class": "GenericError",
  "desc": "OSPM does not acknowledge previous error, so can not record CPER for current error anymore"
  }
}

As this is a transitory state.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/qmp_helper.py | 49 +++++++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
index ef3e46ee3fc6..158489e4cee6 100755
--- a/scripts/qmp_helper.py
+++ b/scripts/qmp_helper.py
@@ -343,41 +343,44 @@ def send_cmd(self, command, args=None, may_open=False, return_error=True,
 
         # Try up to attempts
         for i in range(0, attempts):
+            if i > 0:
+                print(f"Error inject attempt {i}/{attempts} failed. Retrying...")
+                sleep(0.1)
+
             try:
                 obj = self.qmp_monitor.cmd_obj(msg)
-
-                if obj and "return" in obj and not obj["return"]:
-                    break
+                if not obj:
+                    print(f"Command: {command}")
+                    print(f"Failed to create a QMP object.")
+                    return None
 
             except Exception as e:                     # pylint: disable=W0718
                 print(f"Command: {command}")
                 print(f"Failed to inject error: {e}.")
-                obj = None
+                return None
 
-            if attempts > 1:
-                print(f"Error inject attempt {i + 1}/{attempts} failed.")
+            error = obj.get("error")
+            if isinstance(error, dict):
+                desc = error.get("desc", "unknown error")
+                if return_error:
+                    print(f"Command: {msg}")
+                    print(f'{error["class"]}: {desc}')
 
-            if i + 1 < attempts:
-                sleep(0.1)
+                if not "acknowledge previous" in desc:
+                    break
 
-        if not obj:
-            return None
+                continue
 
-        if "return" in obj:
-            if isinstance(obj.get("return"), dict):
-                if obj["return"]:
-                    return obj["return"]
-                return "OK"
+            if "return" in obj:
+                if isinstance(obj.get("return"), dict):
+                    if obj["return"]:
+                        return obj["return"]
+                    return "OK"
 
-            return obj["return"]
+                return obj["return"]
 
-        if isinstance(obj.get("error"), dict):
-            error = obj["error"]
-            if return_error:
-                print(f"Command: {msg}")
-                print(f'{error["class"]}: {error["desc"]}')
-        else:
-            print(json.dumps(obj))
+            else:
+                print(json.dumps(obj))
 
         return None
 
-- 
2.56.0

