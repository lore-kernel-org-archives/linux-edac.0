Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2D33B9608;
	Mon, 20 Jul 2026 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578478; cv=none; b=jFUEKW7sYvyoAt8o2/EHVTxpg/ZCcZccm9M7Gv6c78zG3zleZI3wOmLmyQMGyjcubJR1Uo2fCkMV2GC5h4q+cOhokbAGhIVsHRfy1O2outpp805owNUsSlThcp/1MBhLJTQySt2M1n/P6LbAO0iTP5tLKRKXkGWdbaMfO+K+lFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578478; c=relaxed/simple;
	bh=+4lRpCtaMwXv9gmdUjvFDskwhwHT3tAMrxScmaMLG4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZEnl8znxqL/3vmIOEuy/P+7JWV0GXcxGOOdsPT69Xqmq8QdlEF/qWZCEagjlWJMCCaIoCYkWDe2meqEyt1z0/Cl6I2J8xK0OEYV2ezQgc/lWScgZsJiH75bFGUnTOGa2yTczz2F6chjznxHnOFKYuoYSDeW2z+88FINlmA0wGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcLzKADU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcLzKADU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390A61F000E9;
	Mon, 20 Jul 2026 20:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784578476;
	bh=RX33iONCBkis0ZYpnQozWvsrJrEikkre/fo0G1Ps2RE=;
	h=From:To:Cc:Subject:Date;
	b=EcLzKADUZUbEPNDXIjwgtrprqtMO2RnxRTs5Y8Znge7L+UnKkiQALgoGyFx4qD7h6
	 KqhHYPqA+UTHx1KUv6GHCPg59w4Pwu7Tj1z9tj3m2dwnQZVqHccLofnBfZ4nBM9Cia
	 oBBTqM0rO9d0WiBtwtinJi5NpG0Chht9z1qGAXRAQVRp2zgkxp+bjM7xedbmQBPmnQ
	 1adHA918d7oFi93zNeFNLsHMJoj1SGj1lmACXvKNeIeZsqea39N7K7ZC3eeLkc7sgj
	 51vMMEqh24wW1fuPVR95uh3L4yMvolqTzecol5FzWOIURTvBtP9dRfTh8wOHxZ6nOn
	 6JDG6pzf7CiBA==
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
Subject: [PATCH 0/4] EDAC/altera: Add support for Agilex5 platform
Date: Mon, 20 Jul 2026 15:14:21 -0500
Message-ID: <20260720201425.1538771-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series add preliminary EDAC support for the Agilex5 platform. The
EDAC module on the Agilex5 is a bit different from the previous Arria10
and Stratix10 platforms in that it has the full 7 interrupts.

global_sbe    - aggregate single-bit error (chained, drives IRQ domain)
global_dbe    - aggregate double-bit error (chained; DBE is no longer
                delivered exclusively through Asynchronous SError)
io96b0        - IO96B0 DRAM controller ECC
io96b1        - IO96B1 DRAM controller ECC
sdm_qspi_sbe  - SDM QSPI single-bit error
sdm_qspi_dbe  - SDM QSPI double-bit error
sdm_seu       - SDM single-event-upset

patch 1/4 : dt-bindings: edac: altera: agilex5: document new edac support
Introduce a new dt binding "altr,socfpga-agilex5-ecc-manager" that is
specific to the Agilex5 platform. Document the 7 interrupts.

Patch 2/4 : EDAC/altera: use flag to differentiate 64-bit platforms
Use match data to provide a method to differentiate different platforms.

Patch 3/4 : EDAC/altera: Add support for Agilex5 ECC manager
Modifies the Altera EDAC driver to support the Agilex5 platform.

Patch 4/4 : arm64: dts: socfpga: agilex5: add support for the ECC manager
Populates the base Agilex5 DTSI wit the EDAC IP.


Dinh Nguyen (4):
  dt-bindings: edac: altera: agilex5: document new edac support
  EDAC/altera: use flag to differentiate 64-bit platforms
  EDAC/altera: Add support for Agilex5 ECC manager
  arm64: dts: socfpga: agilex5: add support for the ECC manager

 .../edac/altr,socfpga-ecc-manager.yaml        |  23 +++-
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  68 ++++++++++++
 drivers/edac/altera_edac.c                    | 100 ++++++++++++++++--
 drivers/edac/altera_edac.h                    |  34 +++++-
 4 files changed, 212 insertions(+), 13 deletions(-)

-- 
2.42.0.411.g813d9a9188

