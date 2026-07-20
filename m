Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E174C3B42EA;
	Mon, 20 Jul 2026 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578486; cv=none; b=DGBgxW3KKVWHBIxUocByYtnY5gx9X/J9n78QMEQ4hib5LBaYrn78AEbnYo4CZwFrdQKXOTqk0eQUqzkjQkAEWqMq2mM+2Jsn1M7rFzzsTdCt445OCXhhaAFhT3rsMXVfHT0I5H5M5Z7OGJND64rk10YmNCWN88lhxEed0sAjo6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578486; c=relaxed/simple;
	bh=G6Jvo8CB73SeI2n+WMYHDaxiePGTID81nBvN5AM0dQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ErXInsiFsHYhX/4vMcHGV/ziFYgFsxVhMfqf+cd9J0OiFOLK4N4GStdo5JRzQsI48jMDmmXrVSyyXPGuUvSI7Tgb89vuoOJcDwOhBtVFupZCU04+ouBlrDL0zCg/4i9AADfiBU40K4Tf7q/DjBMVtUFb43dbk6PQefRZrb+EMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPe3/MUt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPe3/MUt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E12D1F00AC4;
	Mon, 20 Jul 2026 20:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578480;
	bh=b7Gs+S/7u31vaSIsDabQTTJPkKaDyd0Xqb17szFxsH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dPe3/MUtocmxiVka5T5Ey1jQRsjy0KBgOMZXeTVbE4DKMFr5QKRsmxsXkYEmwxAp/
	 l/gus/tZWmUUY7Va0qz0cxCyZmtt+sdqCQXQF5DFAhLeLw6SbNzHNhdDW7fBjPwo+y
	 qbRxelXGBnwElP7ulSfB3QQsNOnVUYP20fpZKXFIBICjcOaL2IfK8fMilrry7sFX5W
	 q1/wkK4ptxHiCImUS0dKVxmhRoJYKa2ffQ7HjrgFNU+4Fviu1DrlwsSb3g3pLmTUsL
	 O2dQm6qj1j1OYWgJXFak8b6/Ft/bO923iEkJ/L1L7PG/lBUcnVIRaV7pOX5Nyc0yHc
	 KXvhJq4UJfB2g==
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
Subject: [PATCH 4/4] arm64: dts: socfpga: agilex5: add support for the ECC manager
Date: Mon, 20 Jul 2026 15:14:25 -0500
Message-ID: <20260720201425.1538771-5-dinguyen@kernel.org>
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

Add the EDAC device to the base Agilex5 platform. Add OCRAM and Ethernet ECC
device support to the Agilex5 platform.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60eed..f30d476683b4a 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -370,6 +370,74 @@ dmac1: dma-controller@10000 {
 			};
 		};
 
+		eccmgr {
+			compatible = "altr,socfpga-agilex5-ecc-manager",
+				     "altr,socfpga-a10-ecc-manager";
+			altr,sysmgr-syscon = <&sysmgr>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global_sbe", "global_dbe", "io96b0" , "io96b1",
+					  "sdm_qspi_sbe", "sdm_qspi_dbe", "sdm_seu";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			ranges;
+
+			ocram-ecc@108cc000 {
+				compatible = "altr,socfpga-a10-ocram-ecc";
+				reg = <0x108cc000 0x100>;
+				interrupts = <1 IRQ_TYPE_LEVEL_HIGH>, <33 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac0-rx-ecc@108c0000 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0x108c0000 0x100>;
+				altr,ecc-parent = <&gmac0>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>, <38 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac0-tx-ecc@108c0400 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0x108c0400 0x100>;
+				altr,ecc-parent = <&gmac0>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>, <37 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac1-rx-ecc@108c0800 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0x108c0800 0x100>;
+				altr,ecc-parent = <&gmac1>;
+				interrupts = <6 IRQ_TYPE_LEVEL_HIGH>, <38 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac1-tx-ecc@108c0c00 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0x108c0c00 0x100>;
+				altr,ecc-parent = <&gmac1>;
+				interrupts = <7 IRQ_TYPE_LEVEL_HIGH>, <39 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac2-rx-ecc@108c1000 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0x108c1000 0x100>;
+				altr,ecc-parent = <&gmac2>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>, <40 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			emac2-tx-ecc@108c1400 {
+				compatible = "altr,socfpga-eth-mac-ecc";
+				reg = <0x108c1400 0x100>;
+				altr,ecc-parent = <&gmac2>;
+				interrupts = <9 IRQ_TYPE_LEVEL_HIGH>, <41 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rst: rstmgr@10d11000 {
 			compatible = "altr,stratix10-rst-mgr", "altr,rst-mgr";
 			reg = <0x10d11000 0x1000>;
-- 
2.42.0.411.g813d9a9188

