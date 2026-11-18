Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996401;
	b=2gNdp2DGFC4jNp3eL8i3ymbAttVOn1RAn3THynFa4O3oBOxeM8mKZsUQJtGkc9LoSRUH
	 1UhrRke8Fcsvl+94fpmKH3Zx/dZRVL7x9RfKunpcqVzliWLYkzGczEmz52XBnN7acOGlz
	 tAOQfJWPK2mFoZKLoIaoNAGtY/c86yDSiNljQu8hrc43KpaOoNvZetIDgQ8jmH3RrvslA
	 XLRR7aDvXHSjx7sgB2xbNNc4rwdeYQFoQmBa9kWw89wX2rTBXksOyCbhMEogQCGngcWE1
	 J4LHim2sFi0gnr6gWiDwloBoMW01eRbxaumhOAujIqf+z5V3Bcx+PniA0R0ILod9lQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996401;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=T+lM4tNsLJeM2FvoXJztTtHVlML1FsHF1dw/NnNTpFo=;
	b=0zcKzyVLj1GR3Wi9KXhtD2Ygtv4yLjeER7E/EzEKKq4T1ssS+RbhCiP6krB4+GJ12dQI
	 e+gIHv/OAN0LX+KXGWQIQUzu/MxhJ2IKjgBaF+B85/teDiQcfVz9ADC76EFiWBgVQdjRd
	 7qJIuI6Hf+xyZPjMQaIeLXTyuyFYlT5SCGeJclVWwc/87Rgzrl9t3NHIncsHJ+MonQ7fc
	 5TVeWw1rJ/9SRYsoaSBzkVl2+J8Mu5XHAYEbJbHm49OE+d2nkTtl/xOQvDm6gAnZmth4Y
	 qVenapduMeUJSKdvEU1jd9QW+qpxYv1JdIznuxpYeIuO+eaP/gaF+FKHYIctE+9eYYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FbTUkuNx;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F60606A32A;
	Wed, 18 Nov 2026 10:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F60606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FbTUkuNx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8A90A4E41607;
	Wed, 18 Nov 2026 10:06:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F56E5FE9B;
	Wed, 18 Nov 2026 10:06:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B98311BC0F2D;
	Wed, 18 Nov 2026 11:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794996398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T+lM4tNsLJeM2FvoXJztTtHVlML1FsHF1dw/NnNTpFo=;
	b=FbTUkuNxrvwAB+BhqYeFWQ7PSWttrhsEUQYDE9dWhVEs7BnMkbA+ZuR+camK+K/ar2hAhX
	AFiwBM5cISe9OytfTJPEJ//BiNe1aCZeUE6sHJuSiqHAvAdJfqCkeUrSbc4ARPvvUhupK2
	l8zacQqnyRupLbnFD+2L7xH+D9z+C1zyEVtynQrO9c1fwUBzo8EVDmf5HHt2NbVIJtO8g/
	cJjLqugFn4R4+ArbV477P9G7xAF+/hR1Kpk5OBaIEDSY1EdPEKBlGdz9M/YrauL1BAvJe8
	Io2ZrnpKPLjOJSmQgl/oQJF6udoEcc+OrneSZSTEHvSf7W5NHDVAwGXoPoZVgg==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 18 Nov 2026 11:05:57 +0100
Subject: [PATCH v8 1/3] dt-bindings: edac: cdns,ddr-edac: add Cadence DDR
 EDAC
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-paul-v7-3-rc1-edac-v8-1-ed791084cc19@bootlin.com>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
To: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "Paul Louvel (Schneider Electric)" <paul.louvel@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794996390; l=2885;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=TF4I7LtyYqhS9yFMz+leQYO6XIQFAZucDbe9OYToeKo=;
 b=UG35VbGgJFR+Zp1KWd3UqA9+kyvYLWkhS9Spk13WwbPMzxoyNOme0j8HGtJk4hZlROk9hgwTh
 hueHFGwWZI/DAdofgqfU7Obj6z6zdYkTLUAb/zojYwUqru7UUTJ7s4x
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Add the Cadence EDAC dt binding.
The memory controller optionally supports ECC SECDED with DDR2/DDR3
memory.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 .../devicetree/bindings/edac/cdns,ddr-edac.yaml    | 61 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
new file mode 100644
index 000000000000..9414cb9c59b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/edac/cdns,ddr-edac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence DDR EDAC
+
+maintainers:
+  - Paul Louvel <paul.louvel@bootlin.com>
+
+description:
+  The Cadence DDR supports DDR2 and DDR3 memory with or without ECC.
+  The bootloader must configure ECC mode in the memory controller.
+
+  The memory controller supports SECDED (single bit error correction, double bit
+  error detection). ECC scrubbing has to be done via software.
+
+properties:
+  compatible:
+    items:
+      - const: renesas,r9a06g032-ddr-edac # RZ/N1D
+      - const: cdns,ddr-edac
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: DDR controller clock
+      - description: APB internal bus clock
+
+  clock-names:
+    items:
+      - const: ddrc
+      - const: pclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    memory-controller@4000d000 {
+      compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
+      reg = <0x4000d000 0x1000>;
+      interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
+      clock-names = "ddrc", "pclk";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index a13f523431ce..5070e3e02bf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5998,6 +5998,12 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	tools/testing/selftests/cachestat/test_cachestat.c
 
+CADENCE DDR EDAC DRIVER
+M:	Paul Louvel <paul.louvel@bootlin.com>
+L:	linux-edac@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/edac/cdns,ddr-edac.yaml
+
 CADENCE MIPI-CSI2 BRIDGES
 M:	Maxime Ripard <mripard@kernel.org>
 L:	linux-media@vger.kernel.org

-- 
2.56.1

