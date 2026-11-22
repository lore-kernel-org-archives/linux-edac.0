Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795313141;
	b=EnvDoG9/Tq+BhMlMsk6l8aqsNSjNhKI5lhrsT1xAJzOtbRa/PKvhtItvEvZkhEOXOmh8
	 jxFuV8CbnTMLzUlDvLx897qJpZeO8WoHvLb+dABBpMgyDzubcxG1sbvEjgNhqZnc7etnP
	 WiyMbdIJph/G1fya0Ym4sq+CzxhOKKseCgN6wg3e8e7GvH4bUZd/DpTaxKyBm1TJRrawZ
	 bUg7DCgRim77XpdT0xAPq6bV8Ay+7Xw88yLZJVbfPq4jhN95o46+A+mkvVUdYOU9pZUdL
	 g2W2pGP8hpbsok7Lk7EYU0bqGUjVe4dpW9CVCM70cbAP+nTTAYQSrakI7q7a47GZacA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313141;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=UAsSM4uD1CrnVg+gxdWk+i5rQUyYB29VR1EXNLQslmk=;
	b=yPk62xMfh4qukkWoh7/PWrpgam9WYE80BRiIFDS8KWC38Z6iZZcmAiL8CynNrKTyhpZU
	 YjjSfhrMgtLTw/Tdey9G7mbYdqCjaPf4p/4ywZu0+98Q+UCLBwfUhu48PQVEBlQKGsie1
	 exLD41j4DQL1ZI1iFblfs8RjDAr6k/pOJeCxb1t+jpnU9Dl8YDtavVkgEj4RK8RMRB+Hw
	 aEU7U19F3lvJJeOB949LgTJZyxqeWxyQAdIax/MJEHLRa/8q+EyRCwBay9fiY2tkWLgPA
	 nnzKmPVbrZOzIoHhb1pVoT2rSOn6veeCE1OdOc7Xr8exMVHKNtH/4BECOkU6HSXd/sA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VjyW4htn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.53
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012053.outbound.protection.outlook.com [40.107.209.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890F9606A320;
	Sun, 22 Nov 2026 02:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 890F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VjyW4htn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sx6pTt2rVy4LW43tpDDSYVqDGNcTisA/5S6C4y4rYhw8b42yMnXf4rjXruicl0IxmtvSiNWCJ17e+NVUDP0qQDAVPWOlPxvSWcSSXqE7xV0PfRy6nS4kZIMitn4ysKwJKEnj43VGzSswq+OCXu2iqxnQx4wq3f74KUkZ4yzZKrkQRcPF47ZA1wwN8d6LSiS36oMDtnqUQyUlGVN9xcY3Kh77v0UcguNsyd7hr8JjPAhQYsWeFCAKq14/DNeGyIrNNi7TKi4cWpruS9rRqicz0b9U/e3Sm9q86V3+TGMz+VYM397jcIoA7iUzxs72g9R1Wi3KSOgWu1xsVUSm2PDrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAsSM4uD1CrnVg+gxdWk+i5rQUyYB29VR1EXNLQslmk=;
 b=MMSIoFDo3mOx/3OEliiXc+IjjI08ZXBa1wXGxTzOPp1uSwvKQhZVeA7is5nsT1X3gof2xtPe0wB/Rro5DvL45nSsxAJ0+85ECPi0x/SWMmfCP1tIu+jjxm9PMO8Q74s8o24LIdY7BAy+I6fKOCBk5ZFsfwx98guQqa3RtKPwG/iuEQtt9X/CtLMkJejAcgAl5kABT+40MgJbYR0b7BjmV1z3XCLnDijM27FEgxb4LWKpPzusD5b9zb29Z8ewwJk9n/W1lYw6wh/Wz85v9oZjpZ0NUCFPJVBoCZMCdy8zWgJ8V7//RTl1AIqzLZvkFT7sOr/kn0vI+XpAcVjwU3hbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAsSM4uD1CrnVg+gxdWk+i5rQUyYB29VR1EXNLQslmk=;
 b=VjyW4htnP4VWL3up/dOH4bEJRwu67bKjRmSjSWEzA7cxV4/6OFcT72bPny5f76Xor0IIm+72D4sAFeBkgUqfqkz7Sc0DLs+QlBz4U83yAHIiEc/D1r1KdkDpVZsp3iVfrKew4/HvPBXInekCLIalPfB6gs02h3YO4+4eKbneYa0=
Received: from MN2PR11CA0002.namprd11.prod.outlook.com (2603:10b6:208:23b::7)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 02:05:35 +0000
Received: from IA0PEPF00000046.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::7a) by MN2PR11CA0002.outlook.office365.com
 (2603:10b6:208:23b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sun,
 22 Nov 2026 02:05:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF00000046.mail.protection.outlook.com (10.167.249.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sun, 22 Nov 2026 02:05:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:32 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sat, 21 Nov
 2026 20:05:31 -0600
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Sat, 21 Nov 2026 20:05:27 -0600
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v5 0/3] EDAC: Add Xilinx XilSEM error monitoring driver
Date: Sun, 22 Nov 2026 07:35:21 +0530
Message-ID: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
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
X-MS-TrafficTypeDiagnostic: IA0PEPF00000046:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2ee524-b299-4ed3-a4d0-08df483d182e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|261026121527099003|261026140227099003|261022075727099003|261022113327099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|10067099003|261102123227099003|11063799006|56012099006|261009223027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Suicz14zIecFnvu+wPyG+Ujxb8mQ6iwg4KlwBpPppgICJXww41VwBsT4cn0mVL1lt3EJ6tK6LLeXwKJlFdFho7jmBTQFWOVEAoo2DmzWCMAYmPUP6EYTqQtGAHNkpXhM7rgWMpwiwDZZPgk9JsJWj8arAk3L6xGAF3yUkRb+cNx1Dxp+3w3bSSs8PWsvcPpaCY71/nvxVoeQYUFlKbfswcJkOD0vAOKIdadb2W/O5M2bZBx4FD/4hwIOnbq4ZsjiXzCF6IC0wj9PjullO5s6SFuB+7CmkHAI/qO5z1Wx1739ZgnJhNVxYa2sXZuEYzpn8EiOjR3tl46Iqe4tRl+OMrv8vYmAqNu209KbpBwe8w0eLFBeZSe85BDO/TN8D8tcrcLL9QrdZKvPOf5uReOyiHMEzp0m9J/4RO2NrCL1hNbFsDzrla8xoIy5v7Yu9XoDnrCVWJrOXZRPO0VuTA0Ne2bp2QRBWWxUC5nMbwe9jw7K3++ijU/E24OBGhgsG65bYQo5WIu5lr1TnVd4TowM6mWE9y2OYRplPzL3flCYmCCnIEuhHi+rPXv6wZKRg07+mhVep9rp/IVS8sohj9aBYPyefIKiKc9Ii0sbiSSzyPn0yvZasYz1Gf0m4Cazn4gB7dQFYhWklbfBWjvaJKGsLkqjZYNNbTs+nRIeBq83+4B0QyWmX+BTC1KZHr40jswFoKpIqTBPQKx3CuuS7MQKeQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(261026121527099003)(261026140227099003)(261022075727099003)(261022113327099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003)(11063799006)(56012099006)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d5SKuZUt+q/M4lxj8vreiLXzi7gHFV5/Zq9T9mDwovMs+9MXath68AwhdFl6ubo3QSG/mRrWSG9xnh73FFYQ/vE4X4TGVKNDcUPTzdNrgmGecm4rklCqi3D4VKJzz77/82mXOfbiCP8abpJYhajystB0OOWaGUpqo1EWrwREJJEKxREJ+XjB1h5bSj56YWpS1UE6P5zbcphQkQEShyzc8nN3Pq/Jo2QoNNyFTHp4iixwbyKDaT33Tpr6jna3c7N/+ZxZHKj7U1+PQUnFRMOC6eixmPvarlbbNsLfxjafxTE1POi24/Lsuk8lXM1y2aS6CzqgfaX71qsROEVkmZbeSfFjzJ7TjZGCwgmmeNwwtOFxybbBdvuot5gC5aXIoBX7jd3k8azJi6ZcfRHCovl+dHpivr1ozkQNCIa+K9PUlz4ZB6fPrKohyw/mQ0AvtChW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 02:05:34.5379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2ee524-b299-4ed3-a4d0-08df483d182e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000046.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891

Add a driver for XilSEM (Xilinx Soft Error Mitigation) on Versal and
Versal NET devices. XilSEM runs as part of the Platform Loader and
Manager (PLM) on the PMC and monitors Configuration RAM (CRAM) and the
NoC Programming Interface (NPI) for correctable and uncorrectable
errors. The driver reports these errors to the EDAC core and provides
sysfs attributes to control scans, inject CRAM errors and read status.
It is a separate driver, matched through a single "xlnx,xilsem"
compatible, because XilSEM is common to Versal and Versal NET. Only
monolithic devices are supported.

Note on CE reporting after a bitstream reload:
The PLM clears the XilSEM RTCA, including the CE count, when a new
bitstream is loaded. The driver reads the CE count to find the CEs that
are new since its last report, and takes a count below the saved one as
a reload. A reload is not detected if the count has already reached or
passed the saved value when the callback runs, so the CEs up to the
saved value are not reported, and the EDAC CE count is too low by that
number. No CE is reported that did not happen. The RTCA does not
indicate that a reload happened. A complete fix needs a reload counter
in the RTCA, added in the XilSEM and PLM source, which the driver can
compare. This driver is not changed for it.

Note on xlnx_unregister_event():
xsem_edac_remove() unregisters the event and then frees its state, which
is the normal sequence for an event manager client. It is only safe if
xlnx_unregister_event() does not return while a callback is still
running on another CPU, and the event manager does not guarantee that
today: it walks its callback list from the SGI handler without RCU or a
lock. The missing wait belongs in the event manager, where one fix
covers every client, so this driver is not changed. A fix in the event
manager is planned. Until it lands, unbinding the driver while error
events are being raised is not safe. The probe path is not affected,
because the event is registered as the last step of probe.

This series contains:
- A new devicetree binding for the "xlnx,xilsem" compatible.
- The firmware (EEMI) interface and the XilSEM error event node IDs
  and masks.
- The EDAC driver, with its sysfs ABI documentation in the same patch.

Changes in v5:
- Moved the XilSEM binding out of the Versal DDRMC EDAC yaml into its
  own xilsem yaml, with a single "xlnx,xilsem" compatible.
- Moved the driver out of versal_edac.c into a separate xilsem_edac
  driver.
- Limited support to monolithic devices and documented it in the binding
  and ABI.
- Added the xlnx_unregister_event() and CE reload notes above.
- Added the L: linux-edac entry to MAINTAINERS.

Rama devi Veggalam (3):
  dt-bindings: edac: Add Xilinx XilSEM
  firmware: xilinx: Add XilSEM firmware interface
  edac: Add Xilinx XilSEM error monitoring driver

 .../ABI/testing/sysfs-devices-xilsem-edac          | 188 +++++
 .../devicetree/bindings/edac/xlnx,xilsem.yaml      |  53 ++
 MAINTAINERS                                        |  12 +
 drivers/edac/Kconfig                               |  16 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/xilsem_edac.c                         | 859 +++++++++++++++++++++
 drivers/edac/xilsem_edac.h                         | 131 ++++
 drivers/firmware/xilinx/Makefile                   |   2 +-
 drivers/firmware/xilinx/zynqmp-sem.c               | 142 ++++
 drivers/soc/xilinx/xlnx_event_manager.c            |  16 +-
 include/linux/firmware/xlnx-zynqmp-sem.h           | 127 +++
 include/linux/firmware/xlnx-zynqmp.h               |  50 ++
 12 files changed, 1594 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-xilsem-edac
 create mode 100644 Documentation/devicetree/bindings/edac/xlnx,xilsem.yaml
 create mode 100644 drivers/edac/xilsem_edac.c
 create mode 100644 drivers/edac/xilsem_edac.h
 create mode 100644 drivers/firmware/xilinx/zynqmp-sem.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-sem.h

-- 
1.9.5

