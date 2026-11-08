Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128076;
	b=mPwmAuUm0tBeMzzJbzDDkwWP3DaYAYokN7Rx9fwXZ5q7qwMraPhj6XjF8CEgovl9MGVp
	 RjjqQeBFNkRblXR8m8QtkmR2Nt1Rlcn8HDKC4rNzmWTxVgbU7SAZ39DCpOXNyU3s5JjxJ
	 pftEPK0cDe7m9bMkBBmiJJMrxmnGJU/bQeSf/hP6uF6ikhcm5KzrqdDPdhmCWoCJpcivm
	 k4DdVoSrmVGg1QMoQh5aqmkCPG5wL39D2RQ++Qc9OcnWkpiTC3TzTrQfcGPgGmnha7ZFa
	 S7roGmuq6BPqXmMcm9FpHWaywYEZy/exJjbh33bt9KBSwtHt1bJQvgaj/BttzgwvJoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128076;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Sender;
	bh=7ps7t1q+1ZnkBB8ervqOgfqODYFjMD2Zuupi3Z12HRo=;
	b=AOhmOZiC3lOtnM3xhefs/1ubEVHcE1+7APdEbsMUJtNEtBOhVbf84GqQwdWBLRxZJ6FX
	 d3H+AQFPlbv3A3+keJAhuJmFiZisDM61mIdzRYW5/Pd7YSjACE0ufHxsagvXo/SMbu12R
	 ndd1KzU3mVEWYSCVSC9BKMceff011dMl+X7OVyp5se6fcLPGAveUyluBv65DJKauDUqnT
	 I2KAcSeKQfdIWLSWqnYI77z4N2S356dSOb5SdjieCRapv6aYMJTfp+bo7J7AMQx89DQIh
	 Erw4nAXHpcbklKVnBS0qhWfnZD4dn+TqqQONPNbagUJqmgscvmbD2gwSmOyaKGSsOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FNeC+ekm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711D8606A330
	for <linux-edac@vger.kernel.org>; Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FNeC+ekm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A601F008A4;
	Sun,  8 Nov 2026 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794128075;
	bh=7ps7t1q+1ZnkBB8ervqOgfqODYFjMD2Zuupi3Z12HRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FNeC+ekmRTcYchQnuNekhQ5UMCrqq1NG313zzwd4bhTPoiIaLHpF2mfjbdlqIFj8I
	 198Bl2DTsUt7cvibmOu22Tj+83ynEafqZukIXvrH/9y8B3pcURZNW1lrrA1B5o+RnF
	 QY5KNHTQjHdAlAXI+Quscxd+P5ohfIlUup0uEM6zBTNJhU32Sk/mzbzAVf1rEN3XAn
	 xHaW0OAZ8nuAdYJ7OqRA1TBwnZ9zdFV27ED9/NrcAu1KphwRal2LeKfOEEu4vCVGqo
	 ZKntwCGnE3Tt8K1UEx2uM6UcoLJwStr6haoL7leEhGFlbrj6HgS8HWlQYsS//VLghY
	 jloDS7I4Yro0w==
Received: from mchehab by mail.kernel.org with local (Exim 4.100.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xPyfZ-00000005Uil-0vzJ;
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
Subject: [PATCH 02/13] scripts/qmp_helper: add missing CXL UEFI GUID
Date: Sun,  8 Nov 2026 09:54:15 +0100
Message-ID: <acf152014e17c9c646445b097b7cf3e8c666f58e.1794127710.git.mchehab+huawei@kernel.org>
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

The UEFI 2.11 - N.2.14. CXL Component Events Section states that
CXL events are described at CXL specification 3.2:
        8.2.10.2.1 Event Records
	Table 8-55. Common Event Record Format

Add the GUIDs defined here to fuzzy logic error injection code.

It should be noticed that, while the section states that:

	"This section defines the standard event record format
	 that all CXL devices shall use when reporting events
	 to the host."

And the field at byte offset 0 has all the GUIDs below, in practice,
not all those events will reach the OSPM, as some are fabric
management events and OS management flows for dynamic capacity.

Yet, it is easier to keep the table in sync with the specs than to
filter them out and justify why they won't need within CPER scope.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 scripts/qmp_helper.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
index a921a114cdc8..f51a06bad8d4 100755
--- a/scripts/qmp_helper.py
+++ b/scripts/qmp_helper.py
@@ -706,3 +706,33 @@ class cper_guid:
     CPER_CXL_PROT_ERR = guid(0x80B9EFB4, 0x52B5, 0x4DE3,
                              [0xA7, 0x77, 0x68, 0x78,
                               0x4B, 0x77, 0x10, 0x48])
+
+    # CXL GUIDs, as defined at CXL specification 3.2: 8.2.10.2.1 Event Records
+    # on Table 8-55. Common Event Record Format
+    #
+    # Please notice that, in practice, not all those events will be passed
+    # to OSPM. Some may be consumed internally
+    CPER_CXL_EVT_GEN_MEDIA = guid(0xFBCD0A77, 0xC260, 0x417F,
+                                  [0x85, 0xA9, 0x08, 0x8B,
+                                   0x16, 0x21, 0xEB, 0xA6])
+    CPER_CXL_EVT_DRAM = guid(0x601DCBB3, 0x9C06, 0x4EAB,
+                             [0xB8, 0xAF, 0x4E, 0x9B,
+                              0xFB, 0x5C, 0x96, 0x24])
+    CPER_CXL_EVT_MEM_MODULE = guid(0xFE927475, 0xDD59, 0x4339,
+                                   [0xA5, 0x86, 0x79, 0xBA,
+                                    0xB1, 0x13, 0xBC, 0x74])
+    CPER_CXL_EVT_MEM_SPARING = guid(0xE71F3A40, 0x2D29, 0x4092,
+                                    [0x8A, 0x39, 0x4D, 0x1C,
+                                     0x96, 0x6C, 0x7C, 0x65])
+    CPER_CXL_EVT_PHY_SW = guid(0x77CF9271, 0x9C02, 0x470B,
+                               [0x9F, 0xE4, 0xBC, 0x7B,
+                                0x75, 0xF2, 0xDA, 0x97])
+    CPER_CXL_EVT_VIRT_SW = guid(0x40D26425, 0x3396, 0x4C4D,
+                                [0xA5, 0xDA, 0x3D, 0x47,
+                                  0x2A, 0x63, 0xAF, 0x25])
+    CPER_CXL_EVT_MLD_PORT = guid(0x8DC44363, 0x0C96, 0x4710,
+                                 [0xB7, 0xBF, 0x04, 0xBB,
+                                  0x99, 0x53, 0x4C, 0x3F])
+    CPER_CXL_EVT_DYNA_CAP = guid(0xCA95AFA7, 0xF183, 0x4018,
+                                 [0x8C, 0x2F, 0x95, 0x26,
+                                  0x8E, 0x10, 0x1A, 0x2A])
-- 
2.56.0

