Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795313157;
	b=IhJ7SJYhxhlndqbf6OSgbZkRr969x4DYq5UHzZvTNPAEXpKsDqhH+XkQJaqkmwsrFi+I
	 jtJRbhIBxTOtglqFmgpA18+2BnE6m/d0e1boSvVOT4BMlCiXfC/xVT1Ul8h43mAnHQj7v
	 Irbew30oXJISOJqAdSSCAmsPjNDIzoeRJsd0PgHX52KgHhfKzj4g41HYgy/N0r0RA1Wwz
	 7NjTsjbNpDUbnXN2jzL/fjo33e0LoziY+yx25oDbQjjP1nbyytzU1Oj0f8/ZlgAIbO/fR
	 baT3ZDxdyeLbxH2ithXJ4nxiRottnoHflPnf144AzqlibxHZNdzjSTZHrHlXArxysHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313157;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5c7ETMqFAk7Sbrp+5ZEGTTcpv1M1RHgYRDb2oTZvD9U=;
	b=LgqQ9+qS91y5wUKnDVE08b2C7dgGw/EC6f7Ig7XVxMwFg3gNK3yo4QbWwozu8UQ8knd4
	 n5yDWK+PShxxrxsXaq7Uud6JIvAWClIjyvgXjVhSqrGQ3AR7bxhRI6aDj2X8VWlu3WzqV
	 0mctLxZNJwp8ie5CMay9Go6ve9X8qOAL+7mpIPRx5ixqApN67NsO8CgiSTzbP7lsesVk1
	 Vz2/MlfFbGjMVXOTeDzQmbLek7ObYBS/J5ADK8uXwwO8IELEuEbUznUNzrE3Z2cRils3y
	 vZ5XImOYMaLYiV8heth4lIJRnmGLnt6vZRGlg708uZNaUYVBtBGx7gMOP3+MF9qc6kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RoJIjpVF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.52
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136F606A320;
	Sun, 22 Nov 2026 02:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C136F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RoJIjpVF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6fPIvtvP5K+ijKf2TjgDY8S/ctrGG0zek9POarLHx/AsmSpFe0PUAOnDFDigC6Ttn0DNA5kH7GElmEHzBbiciX5wsG9RqcUS00Namuh2+/B6NZOtQ8GwVYrm/MJVqSG2UJKtagRk3qaNVvs9U3wEhhcJu+GeZ7XIIFH0UPuRns+DwUceYwlbuymuXltZvo48QdM8F86gErsYomyztJjD11bgkVen65e9RkGnmQO2Q3GUqTlVsmYvrAd7SUhZGv0jjfvp1/xqh2fGj1Dmr4PfNqd7NLNDgaa8R7hH37+LTSOVsIODn7Rz9aXr71qSiTLoMJhmXO/27mbnovy1gf9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c7ETMqFAk7Sbrp+5ZEGTTcpv1M1RHgYRDb2oTZvD9U=;
 b=Pf8K3TkcwvKDgzQA5XnlrI5QuB3YZM8sFNxu0Sp/a/ljeWFf8/ZFE7YpCH4qRFA61LTebg+rSwHqjockYv0r5Jv3XEe8rJ7eG/TZ4utss6Si0+W4fkl1PfupyGdubSsASEMJNQuEJqQReHodUP5Q0cSBgfvsBnv1wpr3lNAtVwCfksEFvXlDVwqTGghVK7ysOY9vGMOBXgIwEqvlu1f5+OoUsy5Lm8dAX+Ki31IMrtGQoQmL3R/NUxOHCzekKcPYVJ0B8seVarROqyf4WKYSupPCV4UBeiEVQOyXYikp66mor41IM8nHfr302YZpnTAyemj5c8wHoO7YDOdk/mzxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c7ETMqFAk7Sbrp+5ZEGTTcpv1M1RHgYRDb2oTZvD9U=;
 b=RoJIjpVFNOyCEqNnV5I2tk/2Y2GZ5r08q0+KspP/8t9XIXM/ouA8pNOjxn9oqf1n1kyfYJkcSka/7AcindWWraNIO4pRzvKCC9iR4lLKlXSAhAuZSsOgZhZ8q1ww4K1vRc2Z7X7e+QmlzrBxOwjYAFoXx8l7q+OsB+KvOYsg1co=
Received: from MN2PR04CA0016.namprd04.prod.outlook.com (2603:10b6:208:d4::20)
 by LV2PR12MB290147.namprd12.prod.outlook.com (2603:10b6:408:3a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 02:05:50 +0000
Received: from IA0PEPF00000044.namprd04.prod.outlook.com
 (2603:10b6:208:d4:cafe::17) by MN2PR04CA0016.outlook.office365.com
 (2603:10b6:208:d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sun,
 22 Nov 2026 02:05:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000044.mail.protection.outlook.com (10.167.249.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 02:05:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:44 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:43 -0600
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Sat, 21 Nov 2026 20:05:40 -0600
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v5 3/3] edac: Add Xilinx XilSEM error monitoring driver
Date: Sun, 22 Nov 2026 07:35:24 +0530
Message-ID: <1795313124-2138932-4-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
In-Reply-To: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
References: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000044:EE_|LV2PR12MB290147:EE_
X-MS-Office365-Filtering-Correlation-Id: 3300cfa9-e0a9-4d62-3439-08df483d2182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|23010399003|82310400026|10067099003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261021130227099003|261022105027099003|261022075727099003|261022113327099003|261022115727099003|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	fkfEOBZkbYubfqH8/v7Jz/dwptrtRBFDHv+lmRRSehe8DhO1GFqJkYeOANAOMOQgfbAUFq7T4jU+YvBe9ODqumY388nXviCYz5KRC8WSpz3s5bLNzuOCrM1Uex1pjczW4MmsZ3OsHMuDys9hP4t8yItlyrM60OwU8DK4Dvx3jjkGdcsKgyrsPbuMFcWcHeGGYy8mDZZLrBn9yVZ1y10kkhTPqJBypRPJagoeNZYMVCysdBbcep4B+FggeCcSU+Qx2gt++HwHUP6C+HYDnElfKtCmM9e+EY71TVSfSjwPT7L+YjmVU/XsEUhIMmVuS+F+WEZ56IoQ0JRHkmizQ7K+DSfW/j4cOdJQQ7Bbh8tAsnxCXdLQ7OnEFc2/H4hJ/XQ8LHXRB0IvtpqhQ3has1qjnurqU6KwYQT6UIOOzPqOdlJFod0ITn4P2915pVGCBfYu5l1rvE9WdElMIRwpCTJDmQIMUb3wNZ7PZT1ugoo+1vCpc7VzF+3TCev5QnPbylPfBU5JnZmWyEARhjOh0XWdz1fvcwsiZtJriQVQs4II7iXtB77RDB+TM4pjmm8PqRhPBwNWblMU0TBz0Tou8QFAvvzYCJaIYvJrvGZyWozuWbNAaAebKw3VCSAopXdKQ4+QHoCWb6UctgUs3vlKAEMcDsa9Cj8bp5bJb06BA5Ey7StHzC0yOSjK/A3J+FJSWEB+3dWHdJEAm4VP9HcwxKdO+g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(23010399003)(82310400026)(10067099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261021130227099003)(261022105027099003)(261022075727099003)(261022113327099003)(261022115727099003)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZXZpDh48rtJr/5gKr4t8ppkUTx2NzpcM1zN9IAApySwV3AQIS0LDbNB8/O8ZOngTp+pM1MQDwxR3pP4UYpKDGdmoWkJH9H38coJQBtCdV5zAk8/tpMRiCEXK05MxfL3fn0VVdS7f+cTHdlEYNL0iaysobvb1mKSIaIq30f7zpqC0AL91dHeQ2cafJiWKarPJBcJiWWYV0/FYF3NEN+TPu1ynddFwWhB4dVFrPGJr087B/sa4fMcrGR+MY0h9aFuivP9CYrqlswhbgWmjLrvcTKFVkvcvBehn7L/aGXz5wkRp6DMVZYaQd1aP/QD+jDeb+x/scOLENExd20gFh7yBVxwNJwYK25LsCPdp2sFiRAGPbcr1UJ/w6lOhzgRHxseX1yoDUxyfWEcV4IDCHGTfmkdYVPDpxBEkWz/uzhENbGayw5qDdomr6taaDLaYxJ3E
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 02:05:50.1940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3300cfa9-e0a9-4d62-3439-08df483d2182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000044.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB290147

Add an EDAC driver for the Xilinx Soft Error Mitigation (XilSEM) block
on Versal and Versal NET devices. It reports correctable and
uncorrectable CRAM and NPI errors, received through the firmware event
notification interface, to the EDAC core, and provides sysfs attributes
under /sys/devices/system/edac/xilsem/ to control the scans, inject
CRAM errors and read the status.

Only monolithic (single-SLR) devices are supported. The driver cannot
tell at probe time whether a device has more than one SLR, because the
firmware interface has no query for it, so this is stated in the
binding and the ABI and is not checked by the driver.

The PLM raises one event per corrected CRAM frame, which can hold up to
four CEs, and it can merge events raised back to back. The driver
therefore reports the CEs from the CE count register, which gives the
number of new CEs, and reads their locations from the PLM log, which
keeps the last seven. A bitstream reload clears the count, and the
driver detects it when the new count is below the saved one. It cannot
detect a reload once the count has reached the saved value, as the RTCA
has no reload indicator.

The XilSEM interfaces are exposed through sysfs rather than debugfs
because they are intended for runtime use on production systems and are
not limited to debugging. They allow applications to initiate on-demand
CRAM scans, retrieve scan status, configuration, and frame ECC
information, and inject CRAM errors to verify the scan and
error-reporting paths while the system is running.

The result of the most recent request is maintained per device and
returned on the subsequent read of the corresponding file. Concurrent
users are responsible for serializing access, as documented in the ABI
file.

Add the EDAC_XILSEM Kconfig option, the Makefile entry, the ABI
documentation and a MAINTAINERS entry.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v5:
- Made XilSEM a separate driver, xilsem_edac, instead of an additional
  EDAC device in versal_edac.
- Made Kconfig depend on ZYNQMP_FIRMWARE && XLNX_EVENT_MANAGER.
- Dropped the SLR ID from the sysfs output.
- Removed the duplicate command enum and unused counters and fields.
- Rejected extra values in written input, and accepted repeated spaces
  and tabs.
- Reported every CRAM CE since the last event, each with its own
  location.
- Stopped printing unused data for CRAM uncorrectable errors.
- Moved the error event registration to the end of probe.
- Updated the ABI: -EIO on firmware errors, corrected frame ECC
  example.
- Documented that only monolithic devices are supported, and why the
  interfaces use sysfs.

Changes in v4:
- Registered a second, independent EDAC device for XilSEM alongside
  the existing DDRMC device, under the same driver module.
- Added drivers/edac/xsem_edac.h with XilSEM register/structure
  definitions.
- Added xsem_edac_probe()/xsem_edac_remove() and 8 xsem_* sysfs
  attributes, with matching ABI docs in sysfs-devices-versal-edac
  (same commit).
- Updated Kconfig help text and MAINTAINERS for the new files/
  maintainer.

Changes in v3:
- Merged Versal XilSem edac with Versal edac

Changes in v2:
- Patch created on top of dependent patch series
"enhance zynqmp_pm_get_family_info()"
- Fixed maximum length warning in patch description
- Added details for eprobe_defer conditions
- Updated copyright information
- Removed ARCH_ZYNQMP in dependent list of XilSEM Kconfig
- Added error code for invalid versal device type
- Removed redundant sysfs details in function headers
- Included MAINTAINERS to this patch
- Added more description in commit message
- Removed print for probe success
- Removed function comments for xsem_edac_remove()
---
 .../ABI/testing/sysfs-devices-xilsem-edac          | 188 +++++
 MAINTAINERS                                        |  12 +
 drivers/edac/Kconfig                               |  16 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/xilsem_edac.c                         | 859 +++++++++++++++++++++
 drivers/edac/xilsem_edac.h                         | 131 ++++
 6 files changed, 1207 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-xilsem-edac
 create mode 100644 drivers/edac/xilsem_edac.c
 create mode 100644 drivers/edac/xilsem_edac.h

diff --git a/Documentation/ABI/testing/sysfs-devices-xilsem-edac b/Documentation/ABI/testing/sysfs-devices-xilsem-edac
new file mode 100644
index 0000000..2677215
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-xilsem-edac
@@ -0,0 +1,188 @@
+What:		/sys/devices/system/edac/xilsem/xsem_scan_control_ops
+Date:		November 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing requested scan operation in
+		Configuration RAM (CRAM) or NPI of Versal and Versal NET monolithic devices.
+		User needs to provide the scan operation id (init, start,
+		stop).
+		Write format: <scan operation id>, in decimal or 0x-prefixed
+		hex. Extra values are rejected with -EINVAL.
+		The scan operation id values are as given below:
+		1 - Initialize the scan
+		2 - Start CRAM scan
+		3 - Stop CRAM scan
+		5 - Start NPI scan
+		6 - Stop NPI scan
+		7 - Inject NPI error in first descriptor
+		Id 4 (CRAM error injection) is reserved for the separate
+		xsem_cram_injecterr attribute below; writing 4, or any other value not
+		listed above, returns -EINVAL.
+
+		When read, it shows the current scan status with error code.
+		The format is [header][error code][status word 1]
+		[status word 2][status word 3], where header is
+		(0x10300 | operation Id) and the three trailing status words
+		are additional firmware status data returned alongside the
+		error code.
+		The different error codes are as given below:
+		==========	=====
+		Error Code	Cause
+		==========	=====
+		0x0			Scan operation success
+		0x1			Failure in NPI scan
+		0x80		Calibration timeout
+		0x2000		Internal error
+		0x500000	CRAM initialization not yet done
+		0x600000	Start scan failed
+		0x700000	Stop scan failed
+		0xF00000	Active CRC/UE error
+		0x1000000	ECC/CRC error detected during calibration
+		==========	=====
+
+		Note: the result read back is that of the last command the
+		firmware executed for this attribute, held in state shared by
+		every opener of this file, not per-caller state. If the firmware
+		call itself fails, the stored result is cleared and reads back as
+		all zeros, including the header. A valid result always has a non-zero
+		header. A request that the driver rejects (invalid input) leaves the
+		previous result unchanged. Concurrent writers must serialize their
+		own access if they need a guaranteed request/response pairing.
+		A write fails with -EIO if the firmware reports an error for the
+		request; the error code can then be read back from this file.
+
+What:		/sys/devices/system/edac/xilsem/xsem_cram_injecterr
+Date:		November 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing error injection in
+		Configuration RAM (CRAM) of Versal and Versal NET monolithic devices.
+		User needs to provide the location details of CRAM
+		(frame, qword, bit number, row number) to inject the error.
+		Write format: <frame> <qword> <bit number> <row number>,
+		space-separated, each value in decimal or 0x-prefixed hex.
+		Extra values are rejected with -EINVAL.
+		The row number must be in the range 0 to 4; a larger value returns
+		-EINVAL.
+		When read, it shows the current error injection status. The
+		format is [header][error code].
+		Example: [0x10304][0x0]
+		The different error codes are as given below:
+		==========	=====
+		Error Code	Cause
+		==========	=====
+		0x0			Error injection success
+		0x2000		Internal NULL pointer error
+		0x500000	CRAM initialization not yet done
+		0x800000	Invalid row
+		0x900000	Invalid qword
+		0xA00000	Invalid bit
+		0xB00000	Invalid frame address
+		0xC00000	Unexpected bits flipped
+		0xD00000	Masked bit
+		0xE00000	Invalid block type
+		0xF00000	Active CRC/UE error in CRAM
+		==========	=====
+
+		Note: the result read back is that of the last command the
+		firmware executed for this attribute, held in state shared by
+		every opener of this file, not per-caller state. If the firmware
+		call itself fails, the stored result is cleared and reads back as
+		all zeros, including the header. A valid result always has a non-zero
+		header. A request that the driver rejects (invalid input) leaves the
+		previous result unchanged. Concurrent writers must serialize their
+		own access if they need a guaranteed request/response pairing.
+		A write fails with -EIO if the firmware reports an error for the
+		request; the error code can then be read back from this file.
+
+What:		/sys/devices/system/edac/xilsem/xsem_cram_framecc_read
+Date:		November 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading frame ECC values in
+		Configuration RAM (CRAM) of Versal and Versal NET monolithic devices.
+		User needs to provide the location details of CRAM
+		(frame, row number) to read the ECC values.
+		Write format: <frame> <row number>, space-separated, each
+		value in decimal or 0x-prefixed hex. Extra values are rejected with
+		-EINVAL.
+		The row number must be in the range 0 to 4; a larger value returns
+		-EINVAL.
+		When read, it shows the ECC values for the requested frame.
+		The format is <header> <ECC_0> <ECC_1> <status>
+		Example:
+		Read Frame ECC Cmd: [0x3030b]
+		Frame ECC Word_0: [0x52f245]
+		Frame ECC Word_1: [0x7c5a6b]
+		Cmd Status: [0x0]
+
+		Note: the result read back is that of the last command the
+		firmware executed for this attribute, held in state shared by
+		every opener of this file, not per-caller state. If the firmware
+		call itself fails, the stored result is cleared and reads back as
+		all zeros, including the header. A valid result always has a non-zero
+		header. A request that the driver rejects (invalid input) leaves the
+		previous result unchanged. Concurrent writers must serialize their
+		own access if they need a guaranteed request/response pairing.
+		A write fails with -EIO if the firmware reports an error for the
+		request; the error code can then be read back from this file.
+
+What:		/sys/devices/system/edac/xilsem/xsem_read_config
+Date:		November 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading Xilsem configuration.
+		Any value written triggers the read; the value is ignored.
+		When read, it shows the CRAM and NPI scan configuration.
+		The format is <header> <CRAM config> <NPI config> <status>
+		Example: Read Config Cmd: [0x30309]
+		CRAM Scan Config: [0x2e]
+		NPI Scan Config: [0x5016]
+		Cmd Status: [0x0]
+
+		Note: the result read back is that of the last command the
+		firmware executed for this attribute, held in state shared by
+		every opener of this file, not per-caller state. If the firmware
+		call itself fails, the stored result is cleared and reads back as
+		all zeros, including the header. A valid result always has a non-zero
+		header. A request that the driver rejects (invalid input) leaves the
+		previous result unchanged. Concurrent writers must serialize their
+		own access if they need a guaranteed request/response pairing.
+		A write fails with -EIO if the firmware reports an error for the
+		request; the error code can then be read back from this file.
+
+What:		/sys/devices/system/edac/xilsem/xsem_read_status
+Date:		November 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read the Xilsem status. User needs to provide
+		the module id for status. The module id values are as given below:
+		1 - CRAM scan
+		2 - NPI scan
+		Write format: <module id>, in decimal or 0x-prefixed hex. Any other
+		value returns -EINVAL.
+		When read, it shows the status of the requested module. The
+		format is always [value 0][value 1][value 2].
+		For CRAM: value 0 is status, value 1 is CE count, value 2 is
+		always 0 (unused for this module).
+		Example: [0x10005][0x0][0x0]
+		For NPI: value 0 is status, value 1 is scan count, value 2 is
+		heartbeat count.
+		Example: [0xA01][0x10][0x1]
+
+		Note: the result read back is that of the last status read for this
+		attribute, held in state shared by every opener of this file, not
+		per-caller state. A request that the driver rejects (invalid module
+		id) leaves the previous result unchanged. Concurrent writers must
+		serialize their own access if they need a guaranteed
+		request/response pairing.
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ed1991..71aa9d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30817,6 +30817,18 @@ F:	drivers/dma/xilinx/xdma.c
 F:	include/linux/dma/amd_xdma.h
 F:	include/linux/platform_data/amd_xdma.h
 
+XILINX XILSEM EDAC DRIVER
+M:	Rama devi Veggalam <rama.devi.veggalam@amd.com>
+R:	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
+L:	linux-edac@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-devices-xilsem-edac
+F:	Documentation/devicetree/bindings/edac/xlnx,xilsem.yaml
+F:	drivers/edac/xilsem_edac.c
+F:	drivers/edac/xilsem_edac.h
+F:	drivers/firmware/xilinx/zynqmp-sem.c
+F:	include/linux/firmware/xlnx-zynqmp-sem.h
+
 XILINX ZYNQMP DPDMA DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	dmaengine@vger.kernel.org
diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 4c70729..a066c87 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -569,6 +569,22 @@ config EDAC_VERSAL
 	  Support injecting both correctable and uncorrectable errors
 	  for debugging purposes.
 
+config EDAC_XILSEM
+	tristate "Xilinx XilSEM (Soft Error Mitigation)"
+	depends on (ZYNQMP_FIRMWARE && XLNX_EVENT_MANAGER) || COMPILE_TEST
+	help
+	  Support for monitoring the XilSEM (Soft Error Mitigation) soft-error
+	  detection and correction block on Xilinx Versal and Versal NET, which covers
+	  configuration memory in the programmable logic (PL) fabric and the
+	  NoC Programming Interface (NPI) interconnect.
+
+	  Report correctable and uncorrectable CRAM and NPI errors, and
+	  support injecting both error types, which user applications can use
+	  to run on-demand CRAM scan tests and which also help with debugging.
+
+	  Only monolithic Versal and Versal NET devices are supported;
+	  multi-SLR (SSIT) devices are not.
+
 config EDAC_LOONGSON
 	tristate "Loongson Memory Controller"
 	depends on LOONGARCH && ACPI
diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
index 4020ea6..8f14990 100644
--- a/drivers/edac/Makefile
+++ b/drivers/edac/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
 obj-$(CONFIG_EDAC_NPCM)			+= npcm_edac.o
 obj-$(CONFIG_EDAC_ZYNQMP)		+= zynqmp_edac.o
 obj-$(CONFIG_EDAC_VERSAL)		+= versal_edac.o
+obj-$(CONFIG_EDAC_XILSEM)		+= xilsem_edac.o
 obj-$(CONFIG_EDAC_LOONGSON)		+= loongson_edac.o
 obj-$(CONFIG_EDAC_VERSALNET)		+= versalnet_edac.o
 obj-$(CONFIG_EDAC_CORTEX_A72)		+= a72_edac.o
diff --git a/drivers/edac/xilsem_edac.c b/drivers/edac/xilsem_edac.c
new file mode 100644
index 0000000..c71ddee
--- /dev/null
+++ b/drivers/edac/xilsem_edac.c
@@ -0,0 +1,859 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx XilSEM EDAC driver
+ * Copyright (C) 2023 - 2026, Advanced Micro Devices, Inc.
+ */
+#include <linux/edac.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
+#include <linux/firmware/xlnx-event-manager.h>
+
+#include "edac_module.h"
+#include "xilsem_edac.h"
+
+#define EDAC_DEVICE	"Xilsem"
+
+/**
+ * xsem_scan_control_show - Shows scan control operation status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows the scan control operations status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_scan_control_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = scnprintf(data, PAGE_SIZE, "[0x%x][0x%x][0x%x][0x%x][0x%x]\n",
+			priv->scan_ctrl_status.hdr, priv->scan_ctrl_status.status,
+			priv->scan_ctrl_status.status1, priv->scan_ctrl_status.status2,
+			priv->scan_ctrl_status.status3);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * xsem_store_prep - Copy a sysfs store() write into a kernel buffer
+ * @data:	Pointer to user data
+ * @count:	Number of bytes written
+ *
+ * Return: Pointer to a NUL-terminated kernel copy of data, to be freed by
+ * the caller with kfree(), or NULL on allocation failure.
+ */
+static char *xsem_store_prep(const char *data, size_t count)
+{
+	char *kern_buff;
+
+	/*
+	 * Allocate one extra byte for the NUL terminator: strscpy() copies at
+	 * most (size-1) bytes from data and always writes the terminator at
+	 * kern_buff[size-1]. A "count"-sized buffer would silently drop the
+	 * last byte of a full, non-newline-terminated "count"-byte write.
+	 */
+	kern_buff = kzalloc(count + 1, GFP_KERNEL);
+	if (!kern_buff)
+		return NULL;
+
+	strscpy(kern_buff, data, count + 1);
+
+	return kern_buff;
+}
+
+/**
+ * xsem_parse_token - Parse the next space- or tab-separated token as an unsigned int
+ * @inbuf:	Pointer to the remaining unparsed buffer, advanced past the
+ *		consumed token
+ * @val:	Output value
+ *
+ * Sequences of spaces and tabs between tokens are skipped.
+ *
+ * Return: 0 on success, -EINVAL if there is no token left or it is not a
+ * valid unsigned integer.
+ */
+static int xsem_parse_token(char **inbuf, u32 *val)
+{
+	char *tok;
+
+	do {
+		tok = strsep(inbuf, " \t");
+	} while (tok && !*tok);
+
+	if (!tok)
+		return -EINVAL;
+
+	if (kstrtouint(tok, 0, val))
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
+ * xsem_parse_end - Check that no unparsed input is left
+ * @inbuf:	Remaining unparsed buffer, as left by xsem_parse_token()
+ *
+ * Return: 0 if only whitespace is left, -EINVAL if there are extra values.
+ */
+static int xsem_parse_end(char *inbuf)
+{
+	if (!inbuf)
+		return 0;
+
+	return *skip_spaces(inbuf) ? -EINVAL : 0;
+}
+
+/**
+ * xsem_scan_control_store - Set scan control operation
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for doing Xilsem scan operations
+ * (initialization, start, stop)
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_scan_control_store(struct edac_device_ctl_info *dci,
+				       const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 cmd;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Scan command */
+	ret = xsem_parse_token(&inbuf, &cmd);
+	if (ret)
+		goto err;
+
+	ret = xsem_parse_end(inbuf);
+	if (ret)
+		goto err;
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cntrl_ops(cmd, 0, &priv->scan_ctrl_status);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_injecterr_show - Shows CRAM error injection status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM error injection status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_injecterr_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = scnprintf(data, PAGE_SIZE, "[0x%x][0x%x]\n", priv->cram_errinj_status.hdr,
+			priv->cram_errinj_status.status);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * xsem_cram_injecterr_store - Start error injection
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for doing CRAM error injection
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_injecterr_store(struct edac_device_ctl_info *dci,
+					 const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 row, frame, qword, bitloc;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Frame number */
+	ret = xsem_parse_token(&inbuf, &frame);
+	if (ret)
+		goto err;
+
+	/* Read Qword number */
+	ret = xsem_parse_token(&inbuf, &qword);
+	if (ret)
+		goto err;
+
+	/* Read Bit location */
+	ret = xsem_parse_token(&inbuf, &bitloc);
+	if (ret)
+		goto err;
+
+	/* Read Row number */
+	ret = xsem_parse_token(&inbuf, &row);
+	if (ret)
+		goto err;
+
+	ret = xsem_parse_end(inbuf);
+	if (ret)
+		goto err;
+
+	if (row > MAX_CFRAME_ROW_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cram_err_inj(0, frame, qword, bitloc, row,
+					    &priv->cram_errinj_status);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_cram_framecc_read_show - Shows CRAM Frame ECC
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM Frame ECC value
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_cram_framecc_read_show(struct edac_device_ctl_info *dci,
+					   char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int offset = 0;
+
+	mutex_lock(&priv->lock);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Read Frame ECC Cmd: [0x%x]\n", priv->cram_frame_ecc.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Frame ECC Word_0: [0x%x]\n", priv->cram_frame_ecc.ecc0);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Frame ECC Word_1: [0x%x]\n", priv->cram_frame_ecc.ecc1);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset,
+			    "Cmd Status: [0x%x]\n", priv->cram_frame_ecc.status);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_cram_framecc_read_store - Read CRAM Frame ECC
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading CRAM frame ECC
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_cram_framecc_read_store(struct edac_device_ctl_info *dci,
+					    const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	char *kern_buff, *inbuf;
+	u32 frameaddr, row;
+	int ret;
+
+	kern_buff = xsem_store_prep(data, count);
+	if (!kern_buff)
+		return -ENOMEM;
+
+	inbuf = kern_buff;
+
+	/* Read Frame address */
+	ret = xsem_parse_token(&inbuf, &frameaddr);
+	if (ret)
+		goto err;
+
+	/* Read Row number */
+	ret = xsem_parse_token(&inbuf, &row);
+	if (ret)
+		goto err;
+
+	ret = xsem_parse_end(inbuf);
+	if (ret)
+		goto err;
+
+	if (row > MAX_CFRAME_ROW_ID) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_cram_read_ecc(0, frameaddr, row, &priv->cram_frame_ecc);
+	mutex_unlock(&priv->lock);
+err:
+	kfree(kern_buff);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_read_status_show - Shows CRAM & NPI scan status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI scan status
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_status_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = scnprintf(data, PAGE_SIZE, "[0x%x][0x%x][0x%x]\n",
+			priv->xilsem_status[0], priv->xilsem_status[1],
+			priv->xilsem_status[2]);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+/**
+ * xsem_read_status_store - Read CRAM & NPI scan status
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem status
+ * Return: count argument if read succeeds, else error code
+ */
+static ssize_t xsem_read_status_store(struct edac_device_ctl_info *dci,
+				      const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	unsigned long flags;
+	u32 module;
+
+	if (kstrtouint(data, 0, &module))
+		return -EINVAL;
+
+	if (module != CRAM_MOD_ID && module != NPI_MOD_ID) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Invalid module %u\n", module);
+		return -EINVAL;
+	}
+
+	mutex_lock(&priv->lock);
+	/*
+	 * CRAM_STS_INFO_OFFSET/CRAM_CE_COUNT_OFFSET (CRAM_MOD_ID) and
+	 * priv->baseaddr's base register (NPI_MOD_ID) are also read from
+	 * hardirq context by xsem_geterror_info() via xsem_err_callback().
+	 * priv->lock is a mutex and provides no protection against that IRQ
+	 * preempting this critical section on the same CPU, so take the
+	 * same irq-safe cnt_lock xsem_err_callback() holds around its MMIO
+	 * reads to keep this snapshot consistent.
+	 */
+	raw_spin_lock_irqsave(&priv->cnt_lock, flags);
+	if (module == CRAM_MOD_ID) {
+		priv->xilsem_status[0] = readl(priv->baseaddr + CRAM_STS_INFO_OFFSET);
+		priv->xilsem_status[1] = readl(priv->baseaddr + CRAM_CE_COUNT_OFFSET);
+		priv->xilsem_status[2] = 0;
+	} else {
+		priv->xilsem_status[0] = readl(priv->baseaddr);
+		priv->xilsem_status[1] = readl(priv->baseaddr + NPI_SCAN_COUNT);
+		priv->xilsem_status[2] = readl(priv->baseaddr + NPI_SCAN_HB_COUNT);
+	}
+	raw_spin_unlock_irqrestore(&priv->cnt_lock, flags);
+	mutex_unlock(&priv->lock);
+
+	return count;
+}
+
+/**
+ * xsem_read_config_show - Shows CRAM & NPI configuration
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ *
+ * Shows CRAM & NPI configuration
+ * Return: Number of bytes copied.
+ */
+static ssize_t xsem_read_config_show(struct edac_device_ctl_info *dci, char *data)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int offset = 0;
+
+	mutex_lock(&priv->lock);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Read Config Cmd: [0x%x]\n",
+			    priv->xilsem_cfg.hdr);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "CRAM Scan Config: [0x%x]\n",
+			    priv->xilsem_cfg.cram_cfg);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "NPI Scan Config: [0x%x]\n",
+			    priv->xilsem_cfg.npi_cfg);
+	offset += scnprintf(data + offset, PAGE_SIZE - offset, "Cmd Status: [0x%x]\n",
+			    priv->xilsem_cfg.status);
+	mutex_unlock(&priv->lock);
+
+	return offset;
+}
+
+/**
+ * xsem_read_config_store - Read CRAM & NPI configuration
+ * @dci:	Pointer to the edac device struct
+ * @data:	Pointer to user data
+ * @count:	read the size bytes from buffer
+ *
+ * User-space interface for reading Xilsem configuration
+ * Return: count argument if request succeeds, else error code
+ */
+static ssize_t xsem_read_config_store(struct edac_device_ctl_info *dci,
+				      const char *data, size_t count)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = zynqmp_pm_xilsem_read_cfg(0, &priv->xilsem_cfg);
+	mutex_unlock(&priv->lock);
+
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/**
+ * xsem_handle_error - Handle XilSem error types CE and UE
+ * @dci:	Pointer to the edac device controller instance
+ * @p:		Pointer to the xilsem error status structure
+ *
+ * Handles the correctable and uncorrectable error.
+ */
+static void xsem_handle_error(struct edac_device_ctl_info *dci, struct xsem_error_status *p)
+{
+	struct xsem_ecc_error_info *pinf;
+	char message[XILSEM_EDAC_MSG_SIZE];
+	u32 i;
+
+	for (i = 0; i < p->ce_located; i++) {
+		pinf = &p->ceinfo[i];
+		snprintf(message, XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM CRAM error type :%s\n"
+			 "\nFrame_Addr: [0x%X]\t Row_num: [0x%X]\t Bit_loc: [0x%X]\t Qword: [0x%X]\n",
+			 "CE", pinf->frame_addr, pinf->row_id,
+			 pinf->bit_loc, pinf->qword);
+		edac_device_handle_ce(dci, 0, 0, message);
+	}
+
+	if (p->ce_unlocated) {
+		snprintf(message, XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM CRAM error type :%s\n"
+			 "\nLocation not available, log overwritten\n", "CE");
+		edac_device_handle_ce_count(dci, p->ce_unlocated, 0, 0, message);
+	}
+
+	/*
+	 * CRAM and NPI UEs are tracked in separate info structs (not one
+	 * shared field) and reported independently, so a callback that sees
+	 * both at once still reports both instead of one silently
+	 * overwriting the other.
+	 */
+	if (p->cram_ue) {
+		pinf = &p->cram_ueinfo;
+		snprintf(message, XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM error type :%s\nstatus: [0x%X]",
+			 "UE (CRAM)", pinf->status);
+		edac_device_handle_ue(dci, 0, 0, message);
+	}
+
+	if (p->npi_ue) {
+		pinf = &p->npi_ueinfo;
+		snprintf(message, XILSEM_EDAC_MSG_SIZE,
+			 "\nXILSEM error type :%s\n"
+			 "status: [0x%X]\nError_Info0: [0x%X]\n"
+			 "Error_Info1: [0x%X]",
+			 "UE (NPI)", pinf->status, pinf->data0, pinf->data1);
+		edac_device_handle_ue(dci, 0, 0, message);
+	}
+}
+
+/**
+ * xsem_read_ce_log - Read one entry of the PLM correctable error log
+ * @priv:	Pointer to the xilsem private data
+ * @slot:	Log slot, 0 to XILSEM_MAX_CE_LOG_CNT - 1
+ * @info:	Output error information
+ */
+static void xsem_read_ce_log(struct xsem_edac_priv *priv, u32 slot,
+			     struct xsem_ecc_error_info *info)
+{
+	u32 error_word_0, error_word_1;
+
+	error_word_0 = readl(priv->baseaddr + CRAM_CE_ADDRL0_OFFSET + (slot * 8U));
+	error_word_1 = readl(priv->baseaddr + CRAM_CE_ADDRH0_OFFSET + (slot * 8U));
+
+	/* Frame is at 22:0 bits of SEM_CRAMERR_ADDRH0 reg */
+	info->frame_addr = FIELD_GET(CRAM_ERR_FRAME_MASK, error_word_1);
+
+	/* row is at 26:23 bits of SEM_CRAMERR_ADDRH0 reg */
+	info->row_id = FIELD_GET(CRAM_ERR_ROW_MASK, error_word_1);
+
+	/* bit is at 22:16 bits of SEM_CRAMERR_ADDRL0 reg */
+	info->bit_loc = FIELD_GET(CRAM_ERR_BIT_MASK, error_word_0);
+
+	/* Qword is at 27:23 bits of SEM_CRAMERR_ADDRL0 reg */
+	info->qword = FIELD_GET(CRAM_ERR_QWRD_MASK, error_word_0);
+}
+
+/**
+ * xsem_geterror_info - Get the current ecc error info
+ * @dci:	Pointer to the edac device controller instance
+ * @p:		Pointer to the Xilsem error status structure
+ * @mask:	mask indicates the error type
+ *
+ * Determines there is any ecc error or not
+ */
+static void xsem_geterror_info(struct edac_device_ctl_info *dci, struct xsem_error_status *p,
+			       u32 mask)
+{
+	struct xsem_edac_priv *priv = dci->pvt_info;
+	u32 ce_total, ce_unreported, slot, i;
+
+	if (mask & priv->cram_ce_mask) {
+		/* Read CRAM total correctable error count */
+		ce_total = readl(priv->baseaddr + CRAM_CE_COUNT_OFFSET);
+
+		/*
+		 * The PLM raises an event after it has updated the CE count,
+		 * and keeps the locations of the last XILSEM_MAX_CE_LOG_CNT
+		 * CEs in a circular log. One event can stand for several CEs:
+		 * the PLM raises one event per corrected frame, which can hold
+		 * up to four CEs, and it can merge events raised back to back.
+		 * A callback can also run after more CEs have happened. So
+		 * report every CE since the last report, taken from the count,
+		 * and report nothing if the count has not changed.
+		 *
+		 * The PLM clears the XilSEM RTCA, including the count and the
+		 * log, when a new bitstream is loaded, so a count below the
+		 * last one means the count started again from zero. A reload
+		 * is not detected if the count has already reached the last
+		 * one when the callback runs, as the RTCA has no reload
+		 * counter to tell it.
+		 */
+		if (ce_total < priv->ce_total_reported)
+			ce_unreported = ce_total;
+		else
+			ce_unreported = ce_total - priv->ce_total_reported;
+		priv->ce_total_reported = ce_total;
+
+		/* Locations older than the log size have been overwritten */
+		if (ce_unreported > XILSEM_MAX_CE_LOG_CNT) {
+			p->ce_unlocated = ce_unreported - XILSEM_MAX_CE_LOG_CNT;
+			ce_unreported = XILSEM_MAX_CE_LOG_CNT;
+		}
+
+		/* CE number n (counting from 1) is logged in slot (n - 1) % log size */
+		for (i = 0; i < ce_unreported; i++) {
+			slot = (ce_total - ce_unreported + i) % XILSEM_MAX_CE_LOG_CNT;
+			xsem_read_ce_log(priv, slot, &p->ceinfo[i]);
+		}
+		p->ce_located = ce_unreported;
+	}
+
+	/*
+	 * The event manager invokes this callback once per event bit, so
+	 * @mask normally has a single CE or UE bit set. Each UE source keeps
+	 * its own cram_ueinfo/npi_ueinfo, so xsem_handle_error() reports them
+	 * separately even if more than one bit is set.
+	 */
+	if (mask & priv->cram_ue_mask) {
+		p->cram_ue = true;
+		p->cram_ueinfo.status = readl(priv->baseaddr + CRAM_STS_INFO_OFFSET);
+	}
+	if (mask & priv->npi_ue_mask) {
+		p->npi_ue = true;
+		p->npi_ueinfo.data0 = readl(priv->baseaddr + NPI_ERR0_INFO_OFFSET);
+		p->npi_ueinfo.data1 = readl(priv->baseaddr + NPI_ERR1_INFO_OFFSET);
+		p->npi_ueinfo.status = readl(priv->baseaddr);
+	}
+
+	if (!(mask & (priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask)))
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Invalid Event received %x\n", mask);
+}
+
+/**
+ * xsem_err_callback - Handle Correctable and Uncorrectable errors.
+ * @payload:	payload data.
+ * @data:	controller data.
+ *
+ * Handles ECC correctable and uncorrectable errors.
+ */
+static void xsem_err_callback(const u32 *payload, void *data)
+{
+	struct edac_device_ctl_info *dci = (struct edac_device_ctl_info *)data;
+	struct xsem_error_status stat;
+	struct xsem_edac_priv *priv;
+	unsigned long flags;
+	u32 event;
+
+	priv = dci->pvt_info;
+	memset(&stat, 0, sizeof(stat));
+	/* Read payload to get the event type */
+	event = payload[2];
+	edac_printk(KERN_INFO, EDAC_DEVICE, "Event received %x\n", event);
+
+	/*
+	 * CRAM and NPI events can invoke this callback concurrently on
+	 * multiple CPUs. xsem_geterror_info() reads MMIO registers that
+	 * xsem_read_status_store() also reads in process context. priv->lock
+	 * is a mutex and cannot exclude this hardirq callback, so both paths
+	 * take the irq-safe cnt_lock around those register reads.
+	 *
+	 * cnt_lock is also held across xsem_handle_error(). That serializes
+	 * the calls to edac_device_handle_ce()/ue(), which update non-atomic
+	 * u32 counters in the shared EDAC device info, and prevents lost
+	 * updates when callbacks run concurrently on multiple CPUs.
+	 */
+	raw_spin_lock_irqsave(&priv->cnt_lock, flags);
+	xsem_geterror_info(dci, &stat, event);
+	xsem_handle_error(dci, &stat);
+	raw_spin_unlock_irqrestore(&priv->cnt_lock, flags);
+}
+
+static const struct edac_dev_sysfs_attribute xsem_edac_sysfs_attributes[] = {
+	{
+		.attr = {
+			.name = "xsem_scan_control_ops",
+			.mode = (0644)
+		},
+		.show = xsem_scan_control_show,
+		.store = xsem_scan_control_store},
+	{
+		.attr = {
+			.name = "xsem_cram_injecterr",
+			.mode = (0644)
+		},
+		.show = xsem_cram_injecterr_show,
+		.store = xsem_cram_injecterr_store},
+	{
+		.attr = {
+			.name = "xsem_cram_framecc_read",
+			.mode = (0644)
+		},
+		.show = xsem_cram_framecc_read_show,
+		.store = xsem_cram_framecc_read_store},
+	{
+		.attr = {
+			.name = "xsem_read_status",
+			.mode = (0644)
+		},
+		.show = xsem_read_status_show,
+		.store = xsem_read_status_store},
+	{
+		.attr = {
+			.name = "xsem_read_config",
+			.mode = (0644)
+		},
+		.show = xsem_read_config_show,
+		.store = xsem_read_config_store},
+	{
+		.attr = {.name = NULL}
+	}
+};
+
+/**
+ * xsem_edac_probe - Check controller and bind driver.
+ * @pdev:	platform device.
+ *
+ * Probe a specific controller instance for binding with the driver.
+ *
+ * Return: 0 if the controller instance was successfully bound to the
+ * driver; otherwise, < 0 on error.
+ */
+static int xsem_edac_probe(struct platform_device *pdev)
+{
+	struct xsem_edac_priv *priv;
+	void __iomem *plmrtca_baseaddr;
+	struct edac_device_ctl_info *dci;
+	u32 family_code;
+	int rc;
+
+	plmrtca_baseaddr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(plmrtca_baseaddr))
+		return PTR_ERR(plmrtca_baseaddr);
+
+	dci = edac_device_alloc_ctl_info(sizeof(*priv), XILSEM_EDAC_STRNG,
+					 1, XILSEM_EDAC_STRNG, 1, 0,
+					 edac_device_alloc_index());
+	if (!dci) {
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Unable to allocate EDAC device\n");
+		return -ENOMEM;
+	}
+
+	priv = dci->pvt_info;
+	platform_set_drvdata(pdev, dci);
+	dci->dev = &pdev->dev;
+	priv->baseaddr = plmrtca_baseaddr;
+	dci->mod_name = "xilsem_edac";
+	dci->ctl_name = XILSEM_EDAC_STRNG;
+	dci->dev_name = dev_name(&pdev->dev);
+
+	mutex_init(&priv->lock);
+	raw_spin_lock_init(&priv->cnt_lock);
+
+	/*
+	 * Only Versal and Versal NET monolithic devices are supported. The
+	 * firmware interface has no way to report the device topology, so this
+	 * cannot be checked here; it is documented in the binding and the ABI.
+	 */
+	rc = zynqmp_pm_get_family_info(&family_code);
+	if (rc) {
+		/*
+		 * -ENODEV means the firmware driver hasn't registered yet on
+		 * a real ARCH_ZYNQMP build - defer and retry. On a
+		 * COMPILE_TEST build without CONFIG_ZYNQMP_FIRMWARE reachable
+		 * the stub always returns -ENODEV, so deferring would retry
+		 * forever for no reason; let it fail outright there instead.
+		 */
+		if (rc == -ENODEV && IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE))
+			rc = -EPROBE_DEFER;
+		goto free_dev_ctl;
+	}
+
+	if (family_code == PM_VERSAL_NET_FAMILY_CODE) {
+		priv->sw_event_node_id = VERSAL_NET_EVENT_ERROR_SW_ERR;
+		priv->cram_ce_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE;
+		priv->cram_ue_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE;
+		priv->npi_ue_mask = XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE;
+	} else if (family_code == PM_VERSAL_FAMILY_CODE) {
+		priv->sw_event_node_id = VERSAL_EVENT_ERROR_SW_ERR;
+		priv->cram_ce_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5;
+		priv->cram_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6;
+		priv->npi_ue_mask = XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7;
+	} else {
+		/*
+		 * Bail out here instead of continuing to register an event
+		 * with a zero node id/mask (what edac_device_alloc_ctl_info()
+		 * leaves in priv) for a family we don't recognize.
+		 */
+		edac_printk(KERN_ERR, EDAC_DEVICE, "Invalid Device family code %u\n",
+			    family_code);
+		rc = -ENODEV;
+		goto free_dev_ctl;
+	}
+	/*
+	 * Report only CEs that happen from now on. Read the baseline before the
+	 * sysfs attributes appear, so that a CE injected through them is not
+	 * folded into it. A CE before the event is registered is reported with
+	 * the next event.
+	 */
+	priv->ce_total_reported = readl(priv->baseaddr + CRAM_CE_COUNT_OFFSET);
+
+	/*
+	 * Publish the sysfs attributes only once the per-family event
+	 * constants are resolved, otherwise a write from userspace during probe
+	 * could start hardware scanning before this state exists.
+	 */
+	dci->sysfs_attributes = xsem_edac_sysfs_attributes;
+	rc = edac_device_add_device(dci);
+	if (rc) {
+		/* edac_device_add_device() returns a bare 1 on failure, not a negative errno */
+		rc = -ENODEV;
+		goto free_dev_ctl;
+	}
+
+	/*
+	 * Register the error event as the last step, so that nothing can fail
+	 * after the callback is live and dci is never freed while the callback
+	 * is registered on the probe path.
+	 */
+	rc = xlnx_register_event(PM_NOTIFY_CB, priv->sw_event_node_id,
+				 priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask,
+				 false, xsem_err_callback, dci);
+	if (rc) {
+		/*
+		 * xlnx_register_event() returns -EACCES if the event manager
+		 * driver is not probed yet. In this case, defer
+		 * xsem_edac_probe().
+		 */
+		if (rc == -EACCES)
+			rc = -EPROBE_DEFER;
+		goto del_dev;
+	}
+
+	return 0;
+
+del_dev:
+	edac_device_del_device(&pdev->dev);
+free_dev_ctl:
+	edac_device_free_ctl_info(dci);
+
+	return rc;
+}
+
+/**
+ * xsem_edac_remove - Unbind driver from controller.
+ * @pdev:	Platform device.
+ */
+static void xsem_edac_remove(struct platform_device *pdev)
+{
+	struct edac_device_ctl_info *dci = platform_get_drvdata(pdev);
+	struct xsem_edac_priv *priv = dci->pvt_info;
+
+	/*
+	 * On failure the callback is already gone: the event manager was
+	 * removed and dropped it, or only the firmware unregistration failed
+	 * after the callback was removed.
+	 */
+	xlnx_unregister_event(PM_NOTIFY_CB, priv->sw_event_node_id,
+			      priv->cram_ce_mask | priv->cram_ue_mask | priv->npi_ue_mask,
+			      xsem_err_callback, dci);
+	edac_device_del_device(&pdev->dev);
+	edac_device_free_ctl_info(dci);
+}
+
+static const struct of_device_id xsem_edac_match[] = {
+	{ .compatible = "xlnx,xilsem" },
+	{ /* end of table */ }
+};
+MODULE_DEVICE_TABLE(of, xsem_edac_match);
+
+static struct platform_driver xilinx_xilsem_edac_driver = {
+	.driver = {
+		.name = "xilsem-edac",
+		.of_match_table = xsem_edac_match,
+	},
+	.probe = xsem_edac_probe,
+	.remove = xsem_edac_remove,
+};
+
+module_platform_driver(xilinx_xilsem_edac_driver);
+
+MODULE_AUTHOR("Advanced Micro Devices, Inc.");
+MODULE_DESCRIPTION("Xilinx XilSEM EDAC driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/edac/xilsem_edac.h b/drivers/edac/xilsem_edac.h
new file mode 100644
index 0000000..bd08665
--- /dev/null
+++ b/drivers/edac/xilsem_edac.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Xilinx XilSEM (Soft Error Mitigation) EDAC definitions
+ * Copyright (C) 2023 - 2026, Advanced Micro Devices, Inc.
+ *
+ * Constants and data structures for the XilSEM EDAC driver (xilsem_edac.c):
+ * the "xlnx,xilsem" compatible, xsem_edac_probe(), xsem_edac_remove() and
+ * the xsem_* sysfs attributes.
+ *
+ */
+#ifndef _XILSEM_EDAC_H
+#define _XILSEM_EDAC_H
+
+#include <linux/bitfield.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define XILSEM_EDAC_MSG_SIZE	256
+#define XILSEM_EDAC_STRNG	"xilsem"
+
+/* XilSem CE Error log count */
+#define XILSEM_MAX_CE_LOG_CNT	7
+
+/* Maximum CFRAME row number */
+#define MAX_CFRAME_ROW_ID	4
+
+/* XilSem_CRAM scan error info registers */
+#define CRAM_STS_INFO_OFFSET	0x34
+#define CRAM_CE_ADDRL0_OFFSET	0x38
+#define CRAM_CE_ADDRH0_OFFSET	0x3C
+#define CRAM_CE_COUNT_OFFSET	0x70
+
+/* XilSem_NPI_Scan uncorrectable error info registers */
+#define NPI_SCAN_COUNT			0x24
+#define NPI_SCAN_HB_COUNT		0x28
+#define NPI_ERR0_INFO_OFFSET	0x2C
+#define NPI_ERR1_INFO_OFFSET	0x30
+
+/* XilSem bit masks for extracting error details */
+#define CRAM_ERR_ROW_MASK	GENMASK(26, 23)
+#define CRAM_ERR_BIT_MASK	GENMASK(22, 16)
+#define CRAM_ERR_QWRD_MASK	GENMASK(27, 23)
+#define CRAM_ERR_FRAME_MASK	GENMASK(22, 0)
+
+/* XilSem Module IDs */
+#define CRAM_MOD_ID			0x1
+#define NPI_MOD_ID			0x2
+
+/**
+ * struct xsem_ecc_error_info - ECC error log information
+ * @status:	CRAM/NPI scan error status
+ * @data0:	Checksum of the error descriptor (NPI UE only)
+ * @data1:	Index of the error descriptor (NPI UE only)
+ * @frame_addr:	Frame location at which error occurred
+ * @row_id:	Row number
+ * @bit_loc:	Bit position in the Qword
+ * @qword:	Qword location in the frame
+ */
+struct xsem_ecc_error_info {
+	u32 status;
+	u32 data0;
+	u32 data1;
+	u32 frame_addr;
+	u8 row_id;
+	u8 bit_loc;
+	u8 qword;
+};
+
+/**
+ * struct xsem_error_status - ECC status information to report
+ * @ce_located:	Number of correctable errors with a location in @ceinfo
+ * @ce_unlocated:	Correctable errors whose location was overwritten in the PLM log
+ *		before it was read
+ * @cram_ue:	True if a CRAM UE was seen in this callback
+ * @npi_ue:	True if an NPI UE was seen in this callback
+ * @ceinfo:	Correctable error log information, oldest first
+ * @cram_ueinfo: CRAM uncorrectable error log information
+ * @npi_ueinfo:	NPI uncorrectable error log information
+ */
+struct xsem_error_status {
+	u32 ce_located;
+	u32 ce_unlocated;
+	bool cram_ue;
+	bool npi_ue;
+	struct xsem_ecc_error_info ceinfo[XILSEM_MAX_CE_LOG_CNT];
+	struct xsem_ecc_error_info cram_ueinfo;
+	struct xsem_ecc_error_info npi_ueinfo;
+};
+
+/**
+ * struct xsem_edac_priv - Xilsem private instance data
+ * @baseaddr:	Base address of the XilSem PLM RTCA module
+ * @cram_errinj_status:	Buffer for CRAM error injection
+ * @scan_ctrl_status:	Buffer for scan ctrl commands
+ * @cram_frame_ecc:	Buffer for CRAM frame ECC
+ * @xilsem_status:	Buffer for CRAM & NPI status
+ * @xilsem_cfg:	Buffer for CRAM & NPI configuration
+ * @sw_event_node_id:	Error event node Id
+ * @cram_ce_mask: Event bit mask for CRAM correctable error
+ * @cram_ue_mask: Event bit mask for CRAM uncorrectable error
+ * @npi_ue_mask: Event bit mask for NPI uncorrectable error
+ * @ce_total_reported:	Total CRAM correctable error count at the last report, protected
+ *		by cnt_lock
+ * @lock:	Serializes sysfs show/store access to the buffers above,
+ *		which are shared between all xsem_* sysfs callbacks.
+ * @cnt_lock:	irq-safe lock protecting the CRAM/NPI status MMIO registers,
+ *		which are read from both xsem_err_callback() (hardirq) and
+ *		xsem_read_status_store() (process context), where priv->lock, a
+ *		mutex, cannot be used. Also held across xsem_handle_error() to
+ *		serialize the calls into the EDAC core.
+ */
+struct xsem_edac_priv {
+	void __iomem *baseaddr;
+	struct xsem_cram_errinj_response cram_errinj_status;
+	struct xsem_cntrl_ops_response scan_ctrl_status;
+	struct xsem_cram_readecc_response cram_frame_ecc;
+	u32 xilsem_status[3];
+	struct xsem_read_cfg_response xilsem_cfg;
+	u32 sw_event_node_id;
+	u32 cram_ce_mask;
+	u32 cram_ue_mask;
+	u32 npi_ue_mask;
+	u32 ce_total_reported;
+	struct mutex lock;	/* protects the status fields above, read from sysfs show() */
+	raw_spinlock_t cnt_lock;	/* protects CRAM/NPI status regs */
+};
+
+#endif /* _XILSEM_EDAC_H */
-- 
1.9.5

