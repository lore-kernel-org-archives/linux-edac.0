Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990DA3B7B70;
	Mon, 20 Jul 2026 20:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578479; cv=none; b=ga9+zqJ07NHg0yBCNk02bwFRJvGQ85Jc0Sofuj6qnais//B7vQcHgQLAcBJvFyK9Jq8YRI9yGLKiOZHSlrEF/8JJfR9YPF9kjcOIgLAi0FBgiRioDOpbiJOAGjfKL9xv32n0Paoo5UndUb1fB+OWS1x/0PuiMVUkOcYNEpbq7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578479; c=relaxed/simple;
	bh=ebhUd/B6oI8gob8xTVXousjvzYIa3YEIfz2b6IXL5pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjHHZDcexc2Aq+jkwVAcDPlJG5mUHmfOLARbt0y0K9sZyYYasbO5ToKqOmLZn3kKXw3qzkLcewCJ7q4EZofSHZAdkEqgYnrXD96qnJ3n/qK2/GrEpJ6Ja2oUN2I+vQlzpJx9R2IB1yjmVHlCBLvaVbTSv4rlwgm2jaf5zaZlijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3DJl7kR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3DJl7kR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4011F00A3E;
	Mon, 20 Jul 2026 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578477;
	bh=2KWGX0x3qOioC14dHP2ZBC/2H5Ygy5xXkmlzDj6IWr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g3DJl7kR6pIXjGwod0yixQ5XLH7dljYTxTzBoLcR/VbrbO7YeYda9QqTMfyJvWO85
	 wwNIsHOnwRVHQrFFpP9qM8UTMbv2dDmXquTwzdar8SzobGiwNCPVQA5zS7EYDZBtIy
	 B+rLysrKKdcjxe3ZfSTatsgRpc3Tn66EhLQggGXRTYha8UYynXQyms9/kFDlEGDbkD
	 C8etwMWrwyXMbBPyXNvjuyZyIVavHEMwUEsofm2Xr5Bi4vRD+gZ4STjVSqJQFxcG7b
	 JCuWJPplZ4qkurwXRxSmbHhxI8dszj8qqWVp6556luCxueep9R2p9UIc1Z9QlEqEVU
	 njbB8qhumwlLg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: edac: altera: agilex5: document new edac support
Date: Mon, 20 Jul 2026 15:14:22 -0500
Message-ID: <20260720201425.1538771-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260720201425.1538771-1-dinguyen@kernel.org>
References: <20260720201425.1538771-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex5 EDAC module supports ECC on a few additional peripherals. Along
with support for ocram, ethernet and USB, the Agilex5 EDAC adds support for
SDM QSPI, CRAM SEU and IO96B.

The Agilex5 EDAC also exposes up to 7 named interrupts on the manager
node. global_sbe and global_dbe are aggregate single/double-bit error
interrupts that fan-out through the manager's IRQ domain to the child
peripheral ECCs. The remaining named interrupts are routed directly from
dedicated controllers (IO96B memory controllers and Secure Device Manager)
to the GIC.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../edac/altr,socfpga-ecc-manager.yaml        | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
index 136e8fccd429a..2ccb0f2163185 100644
--- a/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
+++ b/Documentation/devicetree/bindings/edac/altr,socfpga-ecc-manager.yaml
@@ -22,6 +22,9 @@ properties:
       - items:
           - const: altr,socfpga-s10-ecc-manager
           - const: altr,socfpga-a10-ecc-manager
+      - items:
+          - const: altr,socfpga-agilex5-ecc-manager
+          - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-a10-ecc-manager
       - const: altr,socfpga-ecc-manager
 
@@ -33,7 +36,25 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 2
+    items:
+      - description: Global single-bit error
+      - description: Global double-bit error
+      - description: IO96B0 DRAM controller error
+      - description: IO96B1 DRAM controller error
+      - description: SDM QSPI single-bit error
+      - description: SDM QSPI double-bit error
+      - description: SDM single-event
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: global_sbe
+      - const: global_dbe
+      - const: io96b0
+      - const: io96b1
+      - const: sdm_qspi_sbe
+      - const: sdm_qspi_dbe
+      - const: sdm_seu
 
   interrupt-controller: true
 
-- 
2.42.0.411.g813d9a9188

