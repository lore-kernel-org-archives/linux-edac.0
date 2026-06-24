Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369643E5EE3;
	Wed, 24 Jun 2026 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782336370; cv=fail; b=KMFxZ4p2dQB0AopLj+AhMgT/Fd5KbYfnJfcMzZ5HPRYK2uGXj5mFxeBkQO2lSya+YStWT9M3uPWy3wa6+rB6ZjPIXwvr502LM5Rxv8NwqsCGjVv0v6SNiazpUPWIiWuG2GLqs83cc12YeLBTeXdUG0YGtGHng7UDyIhIBRdWRyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782336370; c=relaxed/simple;
	bh=dFUdPjmamNyUuDCmpFer1R6QIs/stLHtNtv3xhf8uVM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4h64h+5tU8QfCyR/4T1DOFsMLKSlJcqx39RiRp9/zV7W1Xv+IptM6Im5v7qgvDA9jo5GdtbDsPlc1cUSsGp9Yp6PnkXIyeW1saKlAk95l8jhW+/k/sIFuYmYtXqALC+1dcZYO3jJNNtJ3qc8+ZHtF3CB4Sn/CngTwRmd67pFq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0RKUspsr; arc=fail smtp.client-ip=52.101.61.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0RKUspsr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyBCRggWmnr1mmta9wZYjV1biMQ6rBj7vLzCvDH8MMzspYPpMtUjEtakOScqmQ5MKF5LddHa0RAP8uoa7raMdfmIoEQqf8jtqYyqMu4R7N8H8UgTDm+7z8kGRygP02fKNc2eO2bhGr8yGIXAsGwZoRtRZWVYE8x+jd5DSgTSVYHv8kHg/I3ndWBJ+fshri52PKKH4nK4gygu8m+W3rELlu4kUxlJBdRXTjfs/saAj6BvOmTsI4AuHItfQgPcO6xyU4HqWpe13iA+2siVfmNdrvtSAF3MFw+E0zkMrcxKc/F6dm8QJq/Kxn+lxULGWAShIf8Si2pWApkJDy0dx++UXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWrQZ8Pwbqif86v1yKm3rMLC9I9EuS/FAnXhK9EdVj0=;
 b=n31JkP4+KDbQ4heTJYAQkbaIu2MQ5d55/fZwbKLKFYvEQ6VJ3weqAbgBETjT+UHL4sd8AnSKlYXSWTfbrG0w4qPMM3WqBNC0X9ymj8bjTvpBkO7pbm5KmC2jsxfGw2/kDTEvQGNMUN/eed5CCIn4KC8AseWGOk6Ey54gofk6zUD3SWwCTXYD58hnJavZx2cVfEGnmCUNp2DyXycdsUbc010DuvMCRPdQnW83oSToBZ40RZFnW387syPVcAvyR88f6aVyP5SwSvIcMWu0SS23xoYTE9Sazn0ACdIiELbFJ0+rHiuSgWN8IEmXzoMPtKWAvq3tGUa2C1Mt/zZktby2kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWrQZ8Pwbqif86v1yKm3rMLC9I9EuS/FAnXhK9EdVj0=;
 b=0RKUspsr7hKwn5DJSXH4ihyXcNBlEaWitIHO9rHq4xxeExIoglkjVwDme+IcTfupkRr1zYIFTIn7TofRiLoXC2dAIy45PHMFfhWjEo4qfw/aLljBGN5U9u3u0XQfTwmbutiIqOMThooHL6UfBLe2hIgVitsD3I5aRZA8tfAVSiU=
Received: from PH7P220CA0101.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::17)
 by PH7PR12MB6979.namprd12.prod.outlook.com (2603:10b6:510:1b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 21:26:02 +0000
Received: from SN1PEPF0002BA50.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::8d) by PH7P220CA0101.outlook.office365.com
 (2603:10b6:510:32d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.14 via Frontend Transport; Wed,
 24 Jun 2026 21:26:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA50.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 21:26:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 16:26:01 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 24 Jun
 2026 14:26:00 -0700
Received: from xhdvaralaxm41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 24 Jun 2026 16:25:56 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v3 2/4] Documentation: ABI: Add ABI doc for versal edac sysfs
Date: Thu, 25 Jun 2026 02:55:43 +0530
Message-ID: <20260624212545.2850787-3-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
References: <20260624212545.2850787-1-rama.devi.veggalam@amd.com>
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA50:EE_|PH7PR12MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 783dc6f7-8c85-4dbe-b995-08ded237311e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|23010399003|22082099003|56012099006|6133799003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	YDJtMCc57DI76AHe7fma2dJKX85kj29kt2XtMif7YsM0I8RRvVuxx7SZ+0qHMdkBHqiFULJX8kKt5vXS4geGRB7D1LgH03Et7FRwmiRsAp8qmpOdfdUkrV9fnYtisyYaBRC5FZlMAS82kUpzXDhTUTQXjVUuKRlUjwfC0FNg9kpJMerMeeJUFncVSTtsMA2Lkrs51iMzvGiP7pbO1Vu5ztlg2u65Z3al7CQc4MohCHHl/qtDkx4tARHK5RvuHDC7OpNB94WSzAGv6/a5zvlt2xlTkuyR/vh+0RPnMEN+crTLsJHcIT5XqS7/WgMbxet+V9iMD3FePnsVXWnEZIkAV7oA4Va3uRWmHyh/e6BnqZX5XjcOqipA0eJ6zhQ8MSxmvZDEmB5y6m+lPjNxKz9C6jd7kIGCczRuvvSJz4nYZ8Ae6llQEdHe6h9XaxDyOmivyr3+NnPHuwqDanYNHbhhs4DRY0gWc6030AHYo3Ty3No6SMtIJ9+TFac9gf/zJiCGvmyOGER0qL0XNCbRs+d1vX/2EVC+AqMjqLwfsl9cUOSpmCs+ql/E5B1VEl4PoayjqmshrvkIsbaWXUbBeUWI0p6CCNnrJGR56viTW0c9TzCwwdFRA6eurM/zmQA1ANkYIHiF2jPzsQHBsJHMwabkLVTICWhUc49toh5OVllap48ACO/gnVGLqWvmaivyKgJDEgvCx7uEBOS3NNDCBzvl7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(23010399003)(22082099003)(56012099006)(6133799003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ncc+OfYrbdrYxZj2Km3tOJbzXjz+suppFPcdqBdcYOUUaaom+eFjLJ60hS8nf+E+pzHo2IHd4cBwz/5qvKoChTFk8UuINsBta5wJw59BPKY3ZwoENzeUPn3oiBznzGaoLUDBKXPoekgzL7qd49ttlKGnBx+R0HXg5GX7cYVhg+U11fyeHIzscgprgPUmzhXt9eyYblMl+n1tABFcxWUA0ywPFebFnqaHgnRDlHMvOmT0Cw+fT4xkX8a2MG656Ru0ZTnE46zu/ZzJLfZvhoj2uDTSc1V50YcWAwWcxLsTHi/+qopEc/rQWvksi53/5Xp5lawMprgX34yEaQ3Pt3FLl1nysfFXIbmf43XPSbO84rdnW5qnhyWtjR5MoudCaDO+yeYvO4RHgRbNhCkVYJjOhDJP/bY2YIGIu1iB8/Ip5bTS3LKeeknWjxYBqf+KjsGq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 21:26:02.1655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 783dc6f7-8c85-4dbe-b995-08ded237311e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA50.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6979

Add documentation for the sysfs entries created for
versal edac (XilSEM).

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v3:
- Renamed file name from xilsem edac to versal edac

Changes in v2:
- Updated Date field in sysfs file
---
 .../ABI/testing/sysfs-driver-versal-edac      | 303 ++++++++++++++++++
 1 file changed, 303 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-versal-edac

diff --git a/Documentation/ABI/testing/sysfs-driver-versal-edac b/Documentation/ABI/testing/sysfs-driver-versal-edac
new file mode 100644
index 000000000000..c35d864fcbe2
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-versal-edac
@@ -0,0 +1,303 @@
+What:		/sys/devices/system/edac/versal_xilsem/xsem_scan_control
+Date:		What:		/sys/devices/system/edac/mc/mc0/xsem_scan_control
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing requested scan operation in
+		Configuration RAM (CRAM) or NPI of Versal mono/SSIT devices.
+		User needs to provide scan operation id (init, start, stop) and
+		SLR id (Versal SSIT device) details. For Versal mono devices,
+		the SLR id should be 0.
+		The scan operation id values are as given below:
+		1 - Initialize the scan
+		2 - Start CRAM scan
+		3 - Stop CRAM scan
+		5 - Start NPI scan
+		6 - Stop NPI scan
+		7 - Inject NPI error in first descriptor
+
+		When read, it shows the current scan status with error code.
+		The format is <0x1030 | operation Id> <error code> <Slr ID>
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
+What:		/sys/devices/system/edac/mc/mc0/xsem_cram_injecterr
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing error injection in
+		Configuration RAM (CRAM) of Versal mono/SSIT devices.
+		User needs to provide the location details of CRAM
+		(frame, qword, bit number, row number) and
+		SLR id (Versal SSIT device) details to inject the error.
+		For Versal mono devices, the SLR id should be 0..
+		When read, it shows the current error injection status. The
+		format is <header> <error code> <Slr ID>
+		Example: 0x10304 0
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
+What:		/sys/devices/system/edac/mc/mc0/xsem_cram_framecc_read
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading frame ECC values in
+		Configuration RAM (CRAM) of Versal devices. User needs
+		to provide the location details of CRAM
+		(frame, row number, SLR id in SSIT device) to read the ECC values.
+		For Versal mono devices, SLR id should be 0.
+		When read, it shows the ECC values for the requested frame.
+		The format is <header> <ECC_0> <ECC_1> <status>
+		Example:
+		Read Frame ECC Cmd: [0x3030a]
+		Frame ECC Word_0: [0x52f245]
+		Frame ECC Word_1: [0x7c5a6b]
+		Cmd Status: [0x0]
+
+What:		/sys/devices/system/edac/mc/mc0/xsem_read_config
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading Xilsem configuration.
+		When read, it shows the CRAM and NPI scan configuration.
+		The format is <status> <header> <CRAM config> <NPI config>
+		Example: Read Config Cmd: [0x30309]
+		CRAM Scan Config: [0x2e]
+		NPI Scan Config: [0x5016]
+		Cmd Status: [0x0]
+
+What:		/sys/devices/system/edac/mc/mc0/xsem_read_status
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request read the Xilsem status. User needs to provide
+		the module id for status. The module id values are as given below:
+		1 - CRAM scan
+		2 - NPI scan
+		When read, it shows the status of the requested module.
+		For CRAM: <status> <CE count>
+		Example: 0x10005 0
+		For NPI: <status> <scan count> <heartbeat count>
+		Example: 0xA01 0x10 0x1
+
+What:		/sys/devices/system/edac/mc/mc0/xsem_cram_ssit_getcrc
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read CRC of a row in CRAM. User needs to provide
+		the row number and SLR id (Versal SSIT device) for which CRC
+		to be read. For Versal mono devices, SLR id should be 0.
+		When read, it shows the CRC of the requested row.
+		The format is: <Header> <CRC Word 0 to 3> <status>
+		Example: Read CRC Cmd:[0x1030c]
+		CRC_Word 0:[0x0]
+		CRC_Word 1:[0x1f72d881]
+		CRC_Word 2:[0x0]
+		CRC_Word 3:[0x0]
+		Cmd status: [0x0]
+
+What:		/sys/devices/system/edac/mc/mc0/xsem_read_ssit_status
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read CRAM and NPI scan status information in a given SLR.
+		User needs to provide SLR id in Versal SSIT device for which
+		XilSEM status to be read. When read, it shows
+		the XilSEM status of the requested SLR.
+		The format is: <Header> <SLR id> <NPI status info> <CRAM status info>
+		Example: Read SLR Status Cmd:[0x1030d]
+		SLR ID:[0x3]
+		NPI status:[0xa01]
+		NPI scan count:[0x413]
+		NPI Heartbeat count:[0x1150c]
+		NPI scan skip count 0 :[0x0]
+		NPI scan skip count 1 :[0x0]
+		NPI scan skip count 2 :[0x0]
+		NPI scan skip count 3 :[0x0]
+		NPI scan skip count 4 :[0x0]
+		NPI scan skip count 5 :[0x0]
+		NPI scan skip count 6 :[0x0]
+		NPI scan skip count 7 :[0x0]
+		NPI error info 0 :[0x0]
+		NPI error info 1 :[0x0]
+		CRAM status:[0x10005]
+		Error Location High 0: [0x0]
+		Error Location Low 0: [0x0]
+		Error Location High 1: [0x0]
+		Error Location Low 1: [0x0]
+		Error Location High 2: [0x0]
+		Error Location Low 2: [0x0]
+		Error Location High 3: [0x0]
+		Error Location Low 3: [0x0]
+		Error Location High 4: [0x0]
+		Error Location Low 4: [0x0]
+		Error Location High 5: [0x0]
+		Error Location Low 5: [0x0]
+		Error Location High 6: [0x0]
+		Error Location Low 6: [0x0]
+		CRAM scan CE count:[0x0]
+
+What:		/sys/devices/system/edac/mc/mc0/xsem_total_cframes_ssit
+Date:		June 2026
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to read total cframes in a row in CRAM.
+		User needs to provide row number and SLR id in
+		Versal SSIT device for which total frames to be read.
+		When read, it shows total number of Cframes for the requested SLR.
+		The format is: <Header> <SLR id> <row> <total frames> <Cmd status>
+		Example: Read Total Frames Cmd : [0x4030e]
+		SLR ID : [0x3]
+		Row Index: [0x0]
+		Type[0] frame count: [38752]
+		Type[1] frame count: [262144]
+		Type[2] frame count: [20480]
+		Type[3] frame count: [16]
+		Type[4] frame count: [8]
+		Type[5] frame count: [0]
+		Type[6] frame count: [83]
+		Cmd Status: [0x0]
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing requested scan operation in
+		Configuration RAM (CRAM) or NPI of Versal devices. User needs
+		to provide scan operation id (init, start, stop) details.
+		The scan operation id values are as given below:
+		1 - Initialize the scan
+		2 - Start CRAM scan
+		3 - Stop CRAM scan
+		5 - Start NPI scan
+		6 - Stop NPI scan
+		7 - Inject NPI error in first descriptor
+
+		When read, it shows the current scan status with error code.
+		The format is <0x1030 | operation Id> <error code>.
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
+What:		/sys/devices/system/edac/versal_xilsem/xsem_cram_injecterr
+Date:		July 2025
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for doing error injection in
+		Configuration RAM (CRAM) of Versal devices. User needs
+		to provide the location details of CRAM
+		(frame, qword, bit number, row number) to inject the error.
+		When read, it shows the current error injection status. The
+		format is <header> <error code>.
+		Example: 0x10304 0
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
+What:		/sys/devices/system/edac/versal_xilsem/xsem_cram_framecc_read
+Date:		July 2025
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading frame ECC values in
+		Configuration RAM (CRAM) of Versal devices. User needs
+		to provide the location details of CRAM
+		(frame, row number) to read the ECC values.
+		When read, it shows the ECC values for the requested frame.
+		The format is <status> <header> <ECC_0> <ECC_1>
+		Example: 0 0x1030A 0x363B1A 0x8A0200
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_read_config
+Date:		July 2025
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request to the firmware for reading Xilsem configuration.
+		When read, it shows the CRAM and NPI scan configuration.
+		The format is <status> <header> <CRAM config> <NPI config>
+		Example: 0 0x1030A 0x26 0x5016
+
+What:		/sys/devices/system/edac/versal_xilsem/xsem_read_status
+Date:		July 2025
+Contact:	rama.devi.veggalam@amd.com
+Description:
+		It is a read/write file.
+		Writing to this file causes the software to initiate a
+		request read the Xilsem status. User needs to provide
+		the module id for status. The module id values are as given below:
+		1 - CRAM scan
+		2 - NPI scan
+		When read, it shows the status of the requested module.
+		For CRAM: <status> <CE count>
+		Example: 0x10005 0
+		For NPI: <status> <scan count> <heartbeat count>
+		Example: 0xA01 0x10 0x1
-- 
2.23.0

