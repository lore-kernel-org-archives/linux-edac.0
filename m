Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EA3B8D76;
	Tue, 21 Apr 2026 10:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776767518; cv=fail; b=sO3z72ujF6oOnYkORBlSK1rTJZQCzMPfeRKMtc/8HxSBKV5KQVcVlMN1JRHGiMHZFDoxsGheH8Besxpc5szupoIJdRRx06+s6O6+VO/DbxVML+7dmZpr7HY4/B7wl7D2RmBWGjUT+JbvxrZWLfMjFPCcz0cAkdah+8kdAASpV2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776767518; c=relaxed/simple;
	bh=zKl+j3KhNHA93g0w0usw1DXVdnwVOIvV/MXXPFeFFbs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=orjRyaI4N/1yS3pfMIq8VCS1ZvUFHkfFaEqH7ikxOUgnLz+NRhQgXhTNeE0G3nQ95KvyIq0iWw5DRJh3suG8mkicmqNcVlGdY4fFcbSKYKaDRAH5jPMrTlxTikEyE/bphAsWnPHQgYBYC6atxr+D013TMew/S+atClQttrsxHIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TYdVeW1H; arc=fail smtp.client-ip=40.107.208.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TYdVeW1H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZpECDP+UcK7ON8JE4J5wpy+MG7iaxykh6L/iNJrTXVqskRwV2YtpakyfX14Iu61pe361C8d5wLCBmsMI+Qk98fVHkgnk/mTPMRYlcgbEqpnWmquSzkHBGF4xZwGQOoNYhcKdMEYZ7gSMx2+XmKY/e5nacb2Pp8aT5p5Yi1wFQPk0UpYsipYt907Jm6ezfVJ6XixV6GnEd3DnZCerllM5Dir+/Occ+Fx9HWE/mzCM9YGaBZEx5j0wBIpjcV4g1px9oBzaPI0PtBEC81O9/nLq/8amErshj+iB9bH9SffLNzctPxLJRG+CVXmPWH9HkPUQRCZCA+8kjT3SpT0O+Te5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSld7a55uPPrygz+mzBi6gpn/zr/pE0MMeVhntqJE38=;
 b=dGIKhFhl08aNtaub1EfYVUPBud8g7VcCvFJgeizV0FcGtkwkyLswe1QqYLQfQZR043eA84oDUng6ndKZoq9b/skBJ7KWH5VbFwJ9RNvaGcDedioiNc0erMqGZToStj6bDe1WTh59Kl8F4bvhOrIpQzu2P9XwJDGaSoI50N0H1NkOvvcCxpGoPJIcLoTHkGMw2Diogw9svU9xhBfqN1yzbbd8FX0QzU4WrohqAslpEy0K4h6R0RXYglFas+8HjrkW2msjTArVrcbE3c92VI01BWRc9Mp6fViIsxJKlwwp/yp5NnDn++zX6z6iNEl4ObYI+d/pTJhrIisF9saaEnjJWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSld7a55uPPrygz+mzBi6gpn/zr/pE0MMeVhntqJE38=;
 b=TYdVeW1HMcdF6tMEp2YFx7Fg1fc0kOdxTAEWDqoX38RuA+ZS/CtZodrLeDH4bVrcPJpdEmQ/O7qY2+prQwRLl4zMmgnADlKPzwBndZU3UGM2EjBJFsuwvqgUcdRt5rNM8b+62p2xoL7xKtp8oNUKryLIugWB82rD6/yzyLGoA8Q=
Received: from CH2PR15CA0015.namprd15.prod.outlook.com (2603:10b6:610:51::25)
 by DS4PR12MB9705.namprd12.prod.outlook.com (2603:10b6:8:277::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 10:31:47 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::4f) by CH2PR15CA0015.outlook.office365.com
 (2603:10b6:610:51::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:31:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 21 Apr
 2026 05:31:38 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 21 Apr
 2026 05:31:06 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:31:03 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-edac@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: i3c: dw: Add VersalNet compatible string
Date: Tue, 21 Apr 2026 16:00:58 +0530
Message-ID: <20260421103059.2484623-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
References: <20260421103059.2484623-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DS4PR12MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: a1816160-0085-4054-509a-08de9f913102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	a8zjlcQcL6zF7SydMchQdLtoQf1sFx8MGGsbIoLhENNuGUqLPcJqP46Pcgp2KrRCrrfOVPnnFHhYMu4/mmcz72rwq/R8OG/9lRWONHnUmdAWotH0tPr4gCgMly2ObkV5ld+IVRuocqNf2CsEPkk1Qgii4EybveSCHqt7A/E9LiaArqqGsE+nsvEgak18d7IBZ0JeRdIco/sWHzPyGMhKoLAw/9JMVra+OR3Efdca/4QqmfrKOUyjxHX4/XwvjubKbTDB5yM7Q4Ft2/7+mREgmDu65c7aw0fLS25CFuWGqvKGIQN+Ssv8lK5ETbdUdPxOW68+Eq1atB+OyPS5iXeRbWBaIOmK3g7efBuHSuW7G80dbj9ckbx/O+LdurHKPnNboo29xtzLNGMvubB3RKnmNB1qUyBU9LLsbrBKTiiE6/2+xV9lj4vl6rh42NBmi6BYbNdSnDsyUUUX9Pwa5pyku9fk2OhWrfIoiPDNfb8KgMSXJt6uLOgJW7tk0xSXegO+mP/K5YpaAwgOHQapGOb/Wa/ZV6hzJW3UQdcgUCmUsI2Dz6FdaqjT72OE+657X2zECnAvA7f7QoTaJWNKbVfedizHVfqQesLiB7f+P0roz9BtgQ/oxiROyAdsXfxo0cMmtP0N1rU2tYzxyw4+jDhoONXBhp7sdYc6GcGi6WRX+pM5MGq52DjajYFVX9U1Ry/O6+oFkMZ+cw9GEdJmeJjkn6w9rrHnxDk4fbLPunow6roa1+gAAyGYscVRK6prcUBOj0nAcTfTSZuoT350Mjkn6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2gAqmVUreR7sI+jNPDn+4/anws8LfT2tQF5Xxykv6VFy06LafPtpTUMky624ggA0Ivs3R46qEgC0MFoe6uvdv2ufKoaMOqyXcj8GNyZpmr7vCeknPDfXCw7j1bjUCvK6nnazIrtQWN/jdq5j1eckvBJvaf3x828V3QS1Su9aF1rtOYwCRiSqI/8wosPMEOY6FZqeclZguB7Ju9ga8vmgxHlRpeSixJ/EWXfHr0TFKj25Ks5jzoRftYuD4bnPui+JtGD3JdADdt1Ca+Q4/Afk11PY15M+QFvygIifWueeAMAoIvDkbHEIUoteeUGzpHuhzpGxuUbuAQkc13WebgJyuLX3M1suovJslvluI3y+k8UdL6DT4w5Ud+HWmDQPyArRnqPG6Q9aRB3K9rdoX7djJBFAU5Ldq/Qdt9SDIcua4anxZOQeMVwRxmd1DI6OMm5C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:31:47.4236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1816160-0085-4054-509a-08de9f913102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9705

Add amd,versalnet-dw-i3c-master as a vendor-specific compatible
for the i3c ip available on Versal NET SOC.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..98dafec0ace5 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -18,6 +18,7 @@ properties:
       - const: snps,dw-i3c-master-1.00a
       - items:
           - const: altr,agilex5-dw-i3c-master
+          - const: amd,versalnet-dw-i3c-master
           - const: snps,dw-i3c-master-1.00a
 
   reg:
-- 
2.34.1

