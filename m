Return-Path: <SRS0=ZJ4X=SH=vger.kernel.org=linux-edac-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C223C10F00
	for <linux-edac@archiver.kernel.org>; Fri,  5 Apr 2019 07:16:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAF47217D4
	for <linux-edac@archiver.kernel.org>; Fri,  5 Apr 2019 07:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="v4qYrdqU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfDEHQA (ORCPT <rfc822;linux-edac@archiver.kernel.org>);
        Fri, 5 Apr 2019 03:16:00 -0400
Received: from mail-eopbgr710084.outbound.protection.outlook.com ([40.107.71.84]:38426
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726694AbfDEHQA (ORCPT <rfc822;linux-edac@vger.kernel.org>);
        Fri, 5 Apr 2019 03:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjKak/X/Ja1crnxwahP+gy1hvK38Q1IX8YvHoWu4cK4=;
 b=v4qYrdqUvcSKd2njuOi4tGUkYw2hu/ONRu6GURfYlD3WTEGQZdEPKiCZGewtS4X1axQKrM+RLjZ0SIr59jegPIye8z7LQk279ZQgBR+PA4DlRIfBidh7hXRHMg29/a6mXT+W9FWD9pWvX3/7+vQvezqDE84hpLvoBM3h3c4Avr4=
Received: from MN2PR12MB3021.namprd12.prod.outlook.com (20.178.240.158) by
 MN2PR12MB3647.namprd12.prod.outlook.com (20.178.241.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.20; Fri, 5 Apr 2019 07:11:30 +0000
Received: from MN2PR12MB3021.namprd12.prod.outlook.com
 ([fe80::5c31:26b8:dba8:33eb]) by MN2PR12MB3021.namprd12.prod.outlook.com
 ([fe80::5c31:26b8:dba8:33eb%5]) with mapi id 15.20.1771.016; Fri, 5 Apr 2019
 07:11:30 +0000
From:   "Namburu, Chandu-babu" <chandu@amd.com>
To:     "mchehab@s-opensource.com" <mchehab@s-opensource.com>,
        "mchehab@infradead.org" <mchehab@infradead.org>
CC:     "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: rasdaemon: add support for AMD Scalable MCA
Thread-Topic: rasdaemon: add support for AMD Scalable MCA
Thread-Index: AdTrfRInlXjCFzcOTvCGnSpwO9c1OA==
Date:   Fri, 5 Apr 2019 07:11:30 +0000
Message-ID:
 <MN2PR12MB30219865B6FE2D2723CC0A97C8510@MN2PR12MB3021.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=chandu@amd.com; 
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef425ad6-a828-44f6-c2de-08d6b995ed8e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(49563074)(7193020);SRVR:MN2PR12MB3647;
x-ms-traffictypediagnostic: MN2PR12MB3647:
x-microsoft-antispam-prvs: <MN2PR12MB364772A3296E49EDE0F365D6C8510@MN2PR12MB3647.namprd12.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(376002)(396003)(136003)(39860400002)(189003)(199004)(476003)(66066001)(71200400001)(6436002)(53946003)(486006)(71190400001)(81166006)(102836004)(25786009)(33656002)(68736007)(256004)(97736004)(14444005)(5660300002)(9686003)(3846002)(2906002)(53936002)(6116002)(52536014)(74316002)(478600001)(8676002)(106356001)(86362001)(7696005)(81156014)(4326008)(26005)(55016002)(186003)(53546011)(99936001)(305945005)(105586002)(8936002)(6506007)(2501003)(99286004)(7736002)(316002)(14454004)(30864003)(110136005)(2004002)(579004);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3647;H:MN2PR12MB3021.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Zvq7v0zWHvzIYzno2P5h7DnRTb0ePjYeDULBM+xU9Ay9WY9Iem9Tf1vVPt/xHmX1BU6VSFsczS4FekYYQjTtfEHekbRvMIQ2c7lersxZYwp4AJggQ9WzD7d3OUiam6wZUxVBTqii7g43w/Vewg0/SEs3O9nN8OnPtA+CS3HKWEaGQrne95jgAa0V1jP/VAcsOLAgLuWIsm1f2SP0TYovKnpO0wB8/HzOctiEgew3Pj/q0HqWxSwvZwpYmsHSxjGXelmC1OxpGvOUmkI0Vt3JsMt//9W3dZvc3P6ztEqSg5UnHmfByeJls9Gj0nVb2FZFzmXJ1Qg2v1lSDCXCbUR7yl6YE7mEP00cWEivOzcIFa2C0IGkLGCohPoXlTx47wQUchEpldqMQ6+C2qf4CsGEvQzfXO++8NxazMB/spCsctE=
Content-Type: multipart/mixed;
        boundary="_002_MN2PR12MB30219865B6FE2D2723CC0A97C8510MN2PR12MB3021namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef425ad6-a828-44f6-c2de-08d6b995ed8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 07:11:30.4924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3647
Sender: linux-edac-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-edac.vger.kernel.org>
X-Mailing-List: linux-edac@vger.kernel.org
Message-ID: <20190405071130.lXWwT83JGcLVzFgOZ80CvlPeWOM0VI9y5sbSPuu3RSQ@z>

--_002_MN2PR12MB30219865B6FE2D2723CC0A97C8510MN2PR12MB3021namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mauro Carvalho Chehab,

Below patch is to support AMD Naples and future SOC's RAS architecture for =
rasdaemon.=20

Error messages definitions are taken from Linux EDAC driver for consistency=
, and these changes are tested on Naples platform.=20

I have submitted a pull request in github project also If had made any mist=
akes in submitting patch, please educate me.
=20
Thank you,
Chandu
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
------------------------------
From: Chandu-babu Namburu <chandu@amd.com>
Date: Wed, 30 Jan 2019 20:36:45 +0530
Subject: [PATCH] rasdaemon: add support for AMD Scalable MCA

Add logic here to decode errors from all known IP blocks for
AMD Scalable MCA supported processors

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Chandu-babu Namburu <chandu@amd.com>
---
 Makefile.am       |   5 +-
 mce-amd-smca.c    | 371 ++++++++++++++++++++++++++++++++++++++++++++++++++=
++++
 mce-amd.c         | 122 ++++++++++++++++++
 ras-mce-handler.c |  24 +++-
 ras-mce-handler.h |  15 +++
 5 files changed, 533 insertions(+), 4 deletions(-)
 create mode 100644 mce-amd-smca.c
 create mode 100644 mce-amd.c

diff --git a/Makefile.am b/Makefile.am
index 87b5a3a..011ddb2 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -31,12 +31,13 @@ if WITH_ARM
    rasdaemon_SOURCES +=3D ras-arm-handler.c
 endif
 if WITH_MCE
-   rasdaemon_SOURCES +=3D ras-mce-handler.c mce-intel.c mce-amd-k8.c \
+   rasdaemon_SOURCES +=3D ras-mce-handler.c mce-intel.c mce-amd.c \
 			mce-intel-p4-p6.c mce-intel-nehalem.c \
 			mce-intel-dunnington.c mce-intel-tulsa.c \
 			mce-intel-sb.c mce-intel-ivb.c mce-intel-haswell.c \
 			mce-intel-knl.c mce-intel-broadwell-de.c \
-			mce-intel-broadwell-epex.c mce-intel-skylake-xeon.c
+			mce-intel-broadwell-epex.c mce-intel-skylake-xeon.c \
+			mce-amd-k8.c mce-amd-smca.c
 endif
 if WITH_EXTLOG
    rasdaemon_SOURCES +=3D ras-extlog-handler.c
diff --git a/mce-amd-smca.c b/mce-amd-smca.c
new file mode 100644
index 0000000..6c3e8a5
--- /dev/null
+++ b/mce-amd-smca.c
@@ -0,0 +1,371 @@
+/*
+ * Copyright (c) 2018, AMD, Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+#include "ras-mce-handler.h"
+#include "bitfield.h"
+
+/* MCA_STATUS REGISTER FOR FAMILY 17H
+ *********************** Higher 32-bits *****************************
+ * 63: VALIDERROR, 62: OVERFLOW, 61: UC, 60: Err ENABLE,
+ * 59: Misc Valid, 58: Addr Valid, 57: PCC, 56: ErrCoreID Valid,
+ * 55: TCC, 54: RES, 53: Syndrom Valid, 52: Transparanet,
+ * 51: RES, 50: RES, 49: RES, 48: RES,
+ * 47: RES, 46: CECC, 45: UECC, 44: Deferred,
+ * 43: Poison, 42: RES, 41: RES, 40: RES,
+ * 39: RES, 38: RES, 37: ErrCoreID[5], 36: ErrCoreID[4],
+ * 35: ErrCoreID[3], 34: ErrCoreID[2] 33: ErrCoreID[1] 32: ErrCoreID[0]
+ *********************** Lower 32-bits ******************************
+ * 31: RES, 30: RES, 29: RES, 28: RES,
+ * 27: RES, 26: RES, 25: RES, 24: RES
+ * 23: RES, 22: RES, 21: XEC[5], 20: XEC[4],
+ * 19: XEC[3], 18: XEC[2], 17: XEC[1], 16: XEC[0]
+ * 15: EC[15], 14: EC[14], 13: EC[13], 12: EC[12],
+ * 11: EC[11], 10: EC[10], 09: EC[9], 08: EC[8],
+ * 07: EC[7], 06: EC[6], 05: EC[5], 04: EC[4],
+ * 03: EC[3], 02: EC[2], 01: EC[1], 00: EC[0]
+ */
+
+/* These may be used by multiple smca_hwid_mcatypes */
+enum smca_bank_types {
+	SMCA_LS =3D 0,    /* Load Store */
+	SMCA_IF,        /* Instruction Fetch */
+	SMCA_L2_CACHE,  /* L2 Cache */
+	SMCA_DE,        /* Decoder Unit */
+	SMCA_RESERVED,  /* Reserved */
+	SMCA_EX,        /* Execution Unit */
+	SMCA_FP,        /* Floating Point */
+	SMCA_L3_CACHE,  /* L3 Cache */
+	SMCA_CS,        /* Coherent Slave */
+	SMCA_PIE,       /* Power, Interrupts, etc. */
+	SMCA_UMC,       /* Unified Memory Controller */
+	SMCA_PB,        /* Parameter Block */
+	SMCA_PSP,       /* Platform Security Processor */
+	SMCA_SMU,       /* System Management Unit */
+	N_SMCA_BANK_TYPES
+};
+
+/* SMCA Extended error strings */
+/* Load Store */
+static const char * const smca_ls_mce_desc[] =3D {
+	"Load queue parity",
+	"Store queue parity",
+	"Miss address buffer payload parity",
+	"L1 TLB parity",
+	"Reserved",
+	"DC tag error type 6",
+	"DC tag error type 1",
+	"Internal error type 1",
+	"Internal error type 2",
+	"Sys Read data error thread 0",
+	"Sys read data error thread 1",
+	"DC tag error type 2",
+	"DC data error type 1 (poison consumption)",
+	"DC data error type 2",
+	"DC data error type 3",
+	"DC tag error type 4",
+	"L2 TLB parity",
+	"PDC parity error",
+	"DC tag error type 3",
+	"DC tag error type 5",
+	"L2 fill data error",
+};
+/* Instruction Fetch */
+static const char * const smca_if_mce_desc[] =3D {
+	"microtag probe port parity error",
+	"IC microtag or full tag multi-hit error",
+	"IC full tag parity",
+	"IC data array parity",
+	"Decoupling queue phys addr parity error",
+	"L0 ITLB parity error",
+	"L1 ITLB parity error",
+	"L2 ITLB parity error",
+	"BPQ snoop parity on Thread 0",
+	"BPQ snoop parity on Thread 1",
+	"L1 BTB multi-match error",
+	"L2 BTB multi-match error",
+	"L2 Cache Response Poison error",
+	"System Read Data error",
+};
+/* L2 Cache */
+static const char * const smca_l2_mce_desc[] =3D {
+	"L2M tag multi-way-hit error",
+	"L2M tag ECC error",
+	"L2M data ECC error",
+	"HW assert",
+};
+/* Decoder Unit */
+static const char * const smca_de_mce_desc[] =3D {
+	"uop cache tag parity error",
+	"uop cache data parity error",
+	"Insn buffer parity error",
+	"uop queue parity error",
+	"Insn dispatch queue parity error",
+	"Fetch address FIFO parity",
+	"Patch RAM data parity",
+	"Patch RAM sequencer parity",
+	"uop buffer parity"
+};
+/* Execution Unit */
+static const char * const smca_ex_mce_desc[] =3D {
+	"Watchdog timeout error",
+	"Phy register file parity",
+	"Flag register file parity",
+	"Immediate displacement register file parity",
+	"Address generator payload parity",
+	"EX payload parity",
+	"Checkpoint queue parity",
+	"Retire dispatch queue parity",
+	"Retire status queue parity error",
+	"Scheduling queue parity error",
+	"Branch buffer queue parity error",
+};
+/* Floating Point Unit */
+static const char * const smca_fp_mce_desc[] =3D {
+	"Physical register file parity",
+	"Freelist parity error",
+	"Schedule queue parity",
+	"NSQ parity error",
+	"Retire queue parity",
+	"Status register file parity",
+	"Hardware assertion",
+};
+/* L3 Cache */
+static const char * const smca_l3_mce_desc[] =3D {
+	"Shadow tag macro ECC error",
+	"Shadow tag macro multi-way-hit error",
+	"L3M tag ECC error",
+	"L3M tag multi-way-hit error",
+	"L3M data ECC error",
+	"XI parity, L3 fill done channel error",
+	"L3 victim queue parity",
+	"L3 HW assert",
+};
+/* Coherent Slave Unit */
+static const char * const smca_cs_mce_desc[] =3D {
+	"Illegal request from transport layer",
+	"Address violation",
+	"Security violation",
+	"Illegal response from transport layer",
+	"Unexpected response",
+	"Parity error on incoming request or probe response data",
+	"Parity error on incoming read response data",
+	"Atomic request parity",
+	"ECC error on probe filter access",
+};
+/* Power, Interrupt, etc.. */
+static const char * const smca_pie_mce_desc[] =3D {
+	"HW assert",
+	"Internal PIE register security violation",
+	"Error on GMI link",
+	"Poison data written to internal PIE register",
+};
+/* Unified Memory Controller */
+static const char * const smca_umc_mce_desc[] =3D {
+	"DRAM ECC error",
+	"Data poison error on DRAM",
+	"SDP parity error",
+	"Advanced peripheral bus error",
+	"Command/address parity error",
+	"Write data CRC error",
+};
+/* Parameter Block */
+static const char * const smca_pb_mce_desc[] =3D {
+	"Parameter Block RAM ECC error",
+};
+/* Platform Security Processor */
+static const char * const smca_psp_mce_desc[] =3D {
+	"PSP RAM ECC or parity error",
+};
+/* System Management Unit */
+static const char * const smca_smu_mce_desc[] =3D {
+	"SMU RAM ECC or parity error",
+};
+
+struct smca_mce_desc {
+	const char * const *descs;
+	unsigned int num_descs;
+};
+
+static struct smca_mce_desc smca_mce_descs[] =3D {
+	[SMCA_LS]       =3D { smca_ls_mce_desc,   ARRAY_SIZE(smca_ls_mce_desc)  }=
,
+	[SMCA_IF]       =3D { smca_if_mce_desc,   ARRAY_SIZE(smca_if_mce_desc)  }=
,
+	[SMCA_L2_CACHE] =3D { smca_l2_mce_desc,   ARRAY_SIZE(smca_l2_mce_desc)  }=
,
+	[SMCA_DE]       =3D { smca_de_mce_desc,   ARRAY_SIZE(smca_de_mce_desc)  }=
,
+	[SMCA_EX]       =3D { smca_ex_mce_desc,   ARRAY_SIZE(smca_ex_mce_desc)  }=
,
+	[SMCA_FP]       =3D { smca_fp_mce_desc,   ARRAY_SIZE(smca_fp_mce_desc)  }=
,
+	[SMCA_L3_CACHE] =3D { smca_l3_mce_desc,   ARRAY_SIZE(smca_l3_mce_desc)  }=
,
+	[SMCA_CS]       =3D { smca_cs_mce_desc,   ARRAY_SIZE(smca_cs_mce_desc)  }=
,
+	[SMCA_PIE]      =3D { smca_pie_mce_desc,  ARRAY_SIZE(smca_pie_mce_desc) }=
,
+	[SMCA_UMC]      =3D { smca_umc_mce_desc,  ARRAY_SIZE(smca_umc_mce_desc) }=
,
+	[SMCA_PB]       =3D { smca_pb_mce_desc,   ARRAY_SIZE(smca_pb_mce_desc)  }=
,
+	[SMCA_PSP]      =3D { smca_psp_mce_desc,  ARRAY_SIZE(smca_psp_mce_desc) }=
,
+	[SMCA_SMU]      =3D { smca_smu_mce_desc,  ARRAY_SIZE(smca_smu_mce_desc) }=
,
+};
+
+struct smca_hwid {
+	unsigned int bank_type; /* Use with smca_bank_types for easy indexing.*/
+	uint32_t mcatype_hwid;  /* mcatype,hwid bit 63-32 in MCx_IPID Register*/
+};
+
+static struct smca_hwid smca_hwid_mcatypes[] =3D {
+	/* { bank_type, mcatype_hwid } */
+
+	/* ZN Core (HWID=3D0xB0) MCA types */
+	{ SMCA_LS,       0x000000B0 },
+	{ SMCA_IF,       0x000100B0 },
+	{ SMCA_L2_CACHE, 0x000200B0 },
+	{ SMCA_DE,       0x000300B0 },
+	/* HWID 0xB0 MCATYPE 0x4 is Reserved */
+	{ SMCA_EX,       0x000500B0 },
+	{ SMCA_FP,       0x000600B0 },
+	{ SMCA_L3_CACHE, 0x000700B0 },
+
+	/* Data Fabric MCA types */
+	{ SMCA_CS,       0x0000002E },
+	{ SMCA_PIE,      0x0001002E },
+
+	/* Unified Memory Controller MCA type */
+	{ SMCA_UMC,      0x00000096 },
+
+	/* Parameter Block MCA type */
+	{ SMCA_PB,       0x00000005 },
+
+	/* Platform Security Processor MCA type */
+	{ SMCA_PSP,      0x000000FF },
+
+	/* System Management Unit MCA type */
+	{ SMCA_SMU,      0x00000001 },
+};
+
+struct smca_bank_name {
+	const char *name;
+};
+
+static struct smca_bank_name smca_names[] =3D {
+	[SMCA_LS]       =3D { "Load Store Unit" },
+	[SMCA_IF]       =3D { "Instruction Fetch Unit" },
+	[SMCA_L2_CACHE] =3D { "L2 Cache" },
+	[SMCA_DE]       =3D { "Decode Unit" },
+	[SMCA_RESERVED] =3D { "Reserved" },
+	[SMCA_EX]       =3D { "Execution Unit" },
+	[SMCA_FP]       =3D { "Floating Point Unit" },
+	[SMCA_L3_CACHE] =3D { "L3 Cache" },
+	[SMCA_CS]       =3D { "Coherent Slave" },
+	[SMCA_PIE]      =3D { "Power, Interrupts, etc." },
+	[SMCA_UMC]      =3D { "Unified Memory Controller" },
+	[SMCA_PB]       =3D { "Parameter Block" },
+	[SMCA_PSP]      =3D { "Platform Security Processor" },
+	[SMCA_SMU]      =3D { "System Management Unit" },
+};
+
+static void amd_decode_errcode(struct mce_event *e)
+{
+
+	decode_amd_errcode(e);
+
+	if (e->status & MCI_STATUS_POISON)
+		mce_snprintf(e->mcistatus_msg, "Poison consumed");
+
+	if (e->status & MCI_STATUS_TCC)
+		mce_snprintf(e->mcistatus_msg, "Task_context_corrupt");
+
+}
+/*
+ * To find the UMC channel represented by this bank we need to match on it=
s
+ * instance_id. The instance_id of a bank is held in the lower 32 bits of =
its
+ * IPID.
+ */
+static int find_umc_channel(struct mce_event *e)
+{
+	uint32_t umc_instance_id[] =3D {0x50f00, 0x150f00};
+	uint32_t instance_id =3D EXTRACT(e->ipid, 0, 31);
+	int i, channel =3D -1;
+
+	for (i =3D 0; i < ARRAY_SIZE(umc_instance_id); i++)
+		if (umc_instance_id[i] =3D=3D instance_id)
+			channel =3D i;
+
+	return channel;
+}
+/* Decode extended errors according to Scalable MCA specification */
+static void decode_smca_error(struct mce_event *e)
+{
+	enum smca_bank_types bank_type;
+	const char *ip_name;
+	unsigned short xec =3D (e->status >> 16) & 0x3f;
+	const struct smca_hwid *s_hwid;
+	uint32_t mcatype_hwid =3D EXTRACT(e->ipid, 32, 63);
+	unsigned int csrow =3D -1, channel =3D -1;
+	unsigned int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(smca_hwid_mcatypes); i++) {
+		s_hwid =3D &smca_hwid_mcatypes[i];
+		if (mcatype_hwid =3D=3D s_hwid->mcatype_hwid) {
+			bank_type =3D s_hwid->bank_type;
+			break;
+		}
+	}
+
+	if (i >=3D ARRAY_SIZE(smca_hwid_mcatypes)) {
+		strcpy(e->mcastatus_msg, "Couldn't find bank type with IPID");
+		return;
+	}
+
+	if (bank_type >=3D N_SMCA_BANK_TYPES) {
+		strcpy(e->mcastatus_msg, "Don't know how to decode this bank");
+		return;
+	}
+
+	if (bank_type =3D=3D SMCA_RESERVED) {
+		strcpy(e->mcastatus_msg, "Bank 4 is reserved.\n");
+		return;
+	}
+
+	ip_name =3D smca_names[bank_type].name;
+
+	mce_snprintf(e->bank_name, "%s (bank=3D%d)", ip_name, e->bank);
+
+	/* Only print the descriptor of valid extended error code */
+	if (xec < smca_mce_descs[bank_type].num_descs)
+		mce_snprintf(e->mcastatus_msg,
+			     " %s.\n", smca_mce_descs[bank_type].descs[xec]);
+
+	if (bank_type =3D=3D SMCA_UMC && xec =3D=3D 0) {
+		channel =3D find_umc_channel(e);
+		csrow =3D e->synd & 0x7; /* Bit 0, 1 ,2 */
+		mce_snprintf(e->mc_location, "memory_channel=3D%d,csrow=3D%d",
+			     channel, csrow);
+	}
+}
+
+int parse_amd_smca_event(struct ras_events *ras, struct mce_event *e)
+{
+	uint64_t mcgstatus =3D e->mcgstatus;
+
+	mce_snprintf(e->mcgstatus_msg, "mcgstatus=3D%lld",
+		    (long long)e->mcgstatus);
+
+	if (mcgstatus & MCG_STATUS_RIPV)
+		mce_snprintf(e->mcgstatus_msg, "RIPV");
+	if (mcgstatus & MCG_STATUS_EIPV)
+		mce_snprintf(e->mcgstatus_msg, "EIPV");
+	if (mcgstatus & MCG_STATUS_MCIP)
+		mce_snprintf(e->mcgstatus_msg, "MCIP");
+
+	decode_smca_error(e);
+	amd_decode_errcode(e);
+	return 0;
+}
diff --git a/mce-amd.c b/mce-amd.c
new file mode 100644
index 0000000..116df11
--- /dev/null
+++ b/mce-amd.c
@@ -0,0 +1,122 @@
+/*
+ * Copyright (c) 2018, The AMD, Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+#include "ras-mce-handler.h"
+
+/* Error Code Types */
+#define TLB_ERROR(x)                    (((x) & 0xFFF0) =3D=3D 0x0010)
+#define MEM_ERROR(x)                    (((x) & 0xFF00) =3D=3D 0x0100)
+#define BUS_ERROR(x)                    (((x) & 0xF800) =3D=3D 0x0800)
+#define INT_ERROR(x)                    (((x) & 0xF4FF) =3D=3D 0x0400)
+
+/* Error code: transaction type (TT) */
+static char *transaction[] =3D {
+	"instruction", "data", "generic", "reserved"
+};
+/* Error codes: cache level (LL) */
+static char *cachelevel[] =3D {
+	"reserved", "L1", "L2", "L3/generic"
+};
+/* Error codes: memory transaction type (RRRR) */
+static char *memtrans[] =3D {
+	"generic", "generic read", "generic write", "data read",
+	"data write", "instruction fetch", "prefetch", "evict", "snoop",
+	"?", "?", "?", "?", "?", "?", "?"
+};
+/* Participation Processor */
+static char *partproc[] =3D {
+	"local node origin", "local node response",
+	"local node observed", "generic participation"
+};
+/* Timeout */
+static char *timeout[] =3D {
+	"request didn't time out",
+	"request timed out"
+};
+/* internal unclassified error code */
+static char *internal[] =3D { "reserved",
+			    "reserved",
+			    "hardware assert",
+			    "reserved" };
+
+#define TT(x)         (((x) >> 2) & 0x3)   /*bit 2, bit 3*/
+#define TT_MSG(x)     transaction[TT(x)]
+#define LL(x)         ((x) & 0x3)          /*bit 0, bit 1*/
+#define LL_MSG(x)     cachelevel[LL(x)]
+
+#define R4(x)         (((x) >> 4) & 0xF)   /*bit 4, bit 5, bit 6, bit 7 */
+#define R4_MSG(x)     ((R4(x) < 9) ?  memtrans[R4(x)] : "Wrong R4!")
+
+#define TO(x)         (((x) >> 8) & 0x1)   /*bit 8*/
+#define TO_MSG(x)     timeout[TO(x)]
+#define PP(x)         (((x) >> 9) & 0x3)   /*bit 9, bit 10*/
+#define PP_MSG(x)     partproc[PP(x)]
+
+#define UU(x)         (((x) >> 8) & 0x3)   /*bit 8, bit 9*/
+#define UU_MSG(x)     internal[UU(x)]
+
+void decode_amd_errcode(struct mce_event *e)
+{
+	uint16_t ec =3D e->status & 0xffff;
+	uint16_t ecc =3D (e->status >> 45) & 0x3;
+
+	if (e->status & MCI_STATUS_UC) {
+		if (e->status & MCI_STATUS_PCC)
+			strcpy(e->error_msg, "System Fatal error.");
+		if (e->mcgstatus & MCG_STATUS_RIPV)
+			strcpy(e->error_msg,
+			       "Uncorrected, software restartable error.");
+		strcpy(e->error_msg,
+		       "Uncorrected, software containable error.");
+	} else if (e->status & MCI_STATUS_DEFERRED)
+		strcpy(e->error_msg, "Deferred error, no action required.");
+	else
+		strcpy(e->error_msg, "Corrected error, no action required.");
+
+	if (!(e->status & MCI_STATUS_VAL))
+		mce_snprintf(e->mcistatus_msg, "MCE_INVALID");
+
+	if (e->status & MCI_STATUS_OVER)
+		mce_snprintf(e->mcistatus_msg, "Error_overflow");
+
+	if (e->status & MCI_STATUS_PCC)
+		mce_snprintf(e->mcistatus_msg, "Processor_context_corrupt");
+
+	if (ecc)
+		mce_snprintf(e->mcistatus_msg,
+			     "%sECC", ((ecc =3D=3D 2) ? "C" : "U"));
+
+	if (INT_ERROR(ec)) {
+		mce_snprintf(e->mcastatus_msg, "Internal '%s'", UU_MSG(ec));
+		return;
+	}
+
+	if (TLB_ERROR(ec))
+		mce_snprintf(e->mcastatus_msg,
+			     "TLB Error 'tx: %s, level: %s'",
+			     TT_MSG(ec), LL_MSG(ec));
+	else if (MEM_ERROR(ec))
+		mce_snprintf(e->mcastatus_msg,
+			     "Memory Error 'mem-tx: %s, tx: %s, level: %s'",
+			     R4_MSG(ec), TT_MSG(ec), LL_MSG(ec));
+	else if (BUS_ERROR(ec))
+		mce_snprintf(e->mcastatus_msg,
+			     "Bus Error '%s, %s, mem-tx: %s, level: %s'",
+			     PP_MSG(ec), TO_MSG(ec),
+			     R4_MSG(ec), LL_MSG(ec));
+	return;
+
+}
diff --git a/ras-mce-handler.c b/ras-mce-handler.c
index 4030b8c..c11d489 100644
--- a/ras-mce-handler.c
+++ b/ras-mce-handler.c
@@ -55,6 +55,7 @@ static char *cputype_name[] =3D {
 	[CPU_KNIGHTS_LANDING] =3D "Knights Landing",
 	[CPU_KNIGHTS_MILL] =3D "Knights Mill",
 	[CPU_SKYLAKE_XEON] =3D "Skylake server",
+	[CPU_NAPLES] =3D "AMD Family 17h Zen1"
 };
=20
 static enum cputype select_intel_cputype(struct ras_events *ras)
@@ -190,9 +191,12 @@ static int detect_cpu(struct ras_events *ras)
 	if (!strcmp(mce->vendor, "AuthenticAMD")) {
 		if (mce->family =3D=3D 15)
 			mce->cputype =3D CPU_K8;
-		if (mce->family > 15) {
+		if (mce->family =3D=3D 23)
+			mce->cputype =3D CPU_NAPLES;
+		if (mce->family > 23) {
 			log(ALL, LOG_INFO,
-			    "Can't parse MCE for this AMD CPU yet\n");
+			    "Can't parse MCE for this AMD CPU yet %d\n",
+			    mce->family);
 			ret =3D EINVAL;
 		}
 		goto ret;
@@ -331,6 +335,12 @@ static void report_mce_event(struct ras_events *ras,
 	if (e->status & MCI_STATUS_ADDRV)
 		trace_seq_printf(s, ", addr=3D %llx", (long long)e->addr);
=20
+	if (e->status & MCI_STATUS_SYNDV)
+		trace_seq_printf(s, ", synd=3D %llx", (long long)e->synd);
+
+	if (e->ipid)
+		trace_seq_printf(s, ", ipid=3D %llx", (long long)e->ipid);
+
 	if (e->mcgstatus_msg)
 		trace_seq_printf(s, ", %s", e->mcgstatus_msg);
 	else
@@ -411,6 +421,13 @@ int ras_mce_event_handler(struct trace_seq *s,
 	if (pevent_get_field_val(s, event, "cpuvendor", record, &val, 1) < 0)
 		return -1;
 	e.cpuvendor =3D val;
+	/* Get New entries */
+	if (pevent_get_field_val(s, event, "synd", record, &val, 1) < 0)
+		return -1;
+	e.synd =3D val;
+	if (pevent_get_field_val(s, event, "ipid", record, &val, 1) < 0)
+		return -1;
+	e.ipid =3D val;
=20
 	switch (mce->cputype) {
 	case CPU_GENERIC:
@@ -418,6 +435,9 @@ int ras_mce_event_handler(struct trace_seq *s,
 	case CPU_K8:
 		rc =3D parse_amd_k8_event(ras, &e);
 		break;
+	case CPU_NAPLES:
+		rc =3D parse_amd_smca_event(ras, &e);
+		break;
 	default:			/* All other CPU types are Intel */
 		rc =3D parse_intel_event(ras, &e);
 	}
diff --git a/ras-mce-handler.h b/ras-mce-handler.h
index ede86bd..8aaecd1 100644
--- a/ras-mce-handler.h
+++ b/ras-mce-handler.h
@@ -50,6 +50,7 @@ enum cputype {
 	CPU_KNIGHTS_LANDING,
 	CPU_KNIGHTS_MILL,
 	CPU_SKYLAKE_XEON,
+	CPU_NAPLES,
 };
=20
 struct mce_event {
@@ -69,6 +70,8 @@ struct mce_event {
 	uint8_t		cs;
 	uint8_t		bank;
 	uint8_t		cpuvendor;
+	uint64_t        synd;   /* MCA_SYND MSR: only valid on SMCA systems */
+	uint64_t        ipid;   /* MCA_IPID MSR: only valid on SMCA systems */
=20
 	/* Parsed data */
 	char		timestamp[64];
@@ -129,6 +132,9 @@ void broadwell_de_decode_model(struct ras_events *ras, =
struct mce_event *e);
 void broadwell_epex_decode_model(struct ras_events *ras, struct mce_event =
*e);
 void skylake_s_decode_model(struct ras_events *ras, struct mce_event *e);
=20
+/* AMD error code decode function */
+void decode_amd_errcode(struct mce_event *e);
+
 /* Software defined banks */
 #define MCE_EXTENDED_BANK	128
=20
@@ -144,6 +150,13 @@ void skylake_s_decode_model(struct ras_events *ras, st=
ruct mce_event *e);
 #define MCI_STATUS_S	 (1ULL<<56)  /* signalled */
 #define MCI_STATUS_AR	 (1ULL<<55)  /* action-required */
=20
+/* AMD-specific bits */
+#define MCI_STATUS_TCC          (1ULL<<55)  /* Task context corrupt */
+#define MCI_STATUS_SYNDV        (1ULL<<53)  /* synd reg. valid */
+/* uncorrected error,deferred exception */
+#define MCI_STATUS_DEFERRED     (1ULL<<44)
+#define MCI_STATUS_POISON       (1ULL<<43)  /* access poisonous data */
+
 #define MCG_STATUS_RIPV  (1ULL<<0)   /* restart ip valid */
 #define MCG_STATUS_EIPV  (1ULL<<1)   /* eip points to correct instruction =
*/
 #define MCG_STATUS_MCIP  (1ULL<<2)   /* machine check in progress */
@@ -154,4 +167,6 @@ int parse_intel_event(struct ras_events *ras, struct mc=
e_event *e);
=20
 int parse_amd_k8_event(struct ras_events *ras, struct mce_event *e);
=20
+int parse_amd_smca_event(struct ras_events *ras, struct mce_event *e);
+
 #endif
--=20
1.8.3.1

--_002_MN2PR12MB30219865B6FE2D2723CC0A97C8510MN2PR12MB3021namp_
Content-Type: application/octet-stream;
	name="0001-rasdaemon-add-support-for-AMD-Scalable-MCA.patch"
Content-Description: 0001-rasdaemon-add-support-for-AMD-Scalable-MCA.patch
Content-Disposition: attachment;
	filename="0001-rasdaemon-add-support-for-AMD-Scalable-MCA.patch"; size=21640;
	creation-date="Fri, 05 Apr 2019 07:09:11 GMT";
	modification-date="Fri, 05 Apr 2019 06:58:30 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhMTZjYTA3MTEwMDE5NTdlZTk4ZjJjMTI0YWJjZTBmYTFmODAxNTI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDaGFuZHUtYmFidSBOYW1idXJ1IDxjaGFuZHVAYW1kLmNvbT4K
RGF0ZTogV2VkLCAzMCBKYW4gMjAxOSAyMDozNjo0NSArMDUzMApTdWJqZWN0OiBbUEFUQ0hdIHJh
c2RhZW1vbjogYWRkIHN1cHBvcnQgZm9yIEFNRCBTY2FsYWJsZSBNQ0EKCkFkZCBsb2dpYyBoZXJl
IHRvIGRlY29kZSBlcnJvcnMgZnJvbSBhbGwga25vd24gSVAgYmxvY2tzIGZvcgpBTUQgU2NhbGFi
bGUgTUNBIHN1cHBvcnRlZCBwcm9jZXNzb3JzCgpSZXZpZXdlZC1ieTogWWF6ZW4gR2hhbm5hbSA8
eWF6ZW4uZ2hhbm5hbUBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaGFuZHUtYmFidSBOYW1idXJ1
IDxjaGFuZHVAYW1kLmNvbT4KLS0tCiBNYWtlZmlsZS5hbSAgICAgICB8ICAgNSArLQogbWNlLWFt
ZC1zbWNhLmMgICAgfCAzNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiBtY2UtYW1kLmMgICAgICAgICB8IDEyMiArKysrKysrKysrKysrKysr
KysKIHJhcy1tY2UtaGFuZGxlci5jIHwgIDI0ICsrKy0KIHJhcy1tY2UtaGFuZGxlci5oIHwgIDE1
ICsrKwogNSBmaWxlcyBjaGFuZ2VkLCA1MzMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBtY2UtYW1kLXNtY2EuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IG1j
ZS1hbWQuYwoKZGlmZiAtLWdpdCBhL01ha2VmaWxlLmFtIGIvTWFrZWZpbGUuYW0KaW5kZXggODdi
NWEzYS4uMDExZGRiMiAxMDA2NDQKLS0tIGEvTWFrZWZpbGUuYW0KKysrIGIvTWFrZWZpbGUuYW0K
QEAgLTMxLDEyICszMSwxMyBAQCBpZiBXSVRIX0FSTQogICAgcmFzZGFlbW9uX1NPVVJDRVMgKz0g
cmFzLWFybS1oYW5kbGVyLmMKIGVuZGlmCiBpZiBXSVRIX01DRQotICAgcmFzZGFlbW9uX1NPVVJD
RVMgKz0gcmFzLW1jZS1oYW5kbGVyLmMgbWNlLWludGVsLmMgbWNlLWFtZC1rOC5jIFwKKyAgIHJh
c2RhZW1vbl9TT1VSQ0VTICs9IHJhcy1tY2UtaGFuZGxlci5jIG1jZS1pbnRlbC5jIG1jZS1hbWQu
YyBcCiAJCQltY2UtaW50ZWwtcDQtcDYuYyBtY2UtaW50ZWwtbmVoYWxlbS5jIFwKIAkJCW1jZS1p
bnRlbC1kdW5uaW5ndG9uLmMgbWNlLWludGVsLXR1bHNhLmMgXAogCQkJbWNlLWludGVsLXNiLmMg
bWNlLWludGVsLWl2Yi5jIG1jZS1pbnRlbC1oYXN3ZWxsLmMgXAogCQkJbWNlLWludGVsLWtubC5j
IG1jZS1pbnRlbC1icm9hZHdlbGwtZGUuYyBcCi0JCQltY2UtaW50ZWwtYnJvYWR3ZWxsLWVwZXgu
YyBtY2UtaW50ZWwtc2t5bGFrZS14ZW9uLmMKKwkJCW1jZS1pbnRlbC1icm9hZHdlbGwtZXBleC5j
IG1jZS1pbnRlbC1za3lsYWtlLXhlb24uYyBcCisJCQltY2UtYW1kLWs4LmMgbWNlLWFtZC1zbWNh
LmMKIGVuZGlmCiBpZiBXSVRIX0VYVExPRwogICAgcmFzZGFlbW9uX1NPVVJDRVMgKz0gcmFzLWV4
dGxvZy1oYW5kbGVyLmMKZGlmZiAtLWdpdCBhL21jZS1hbWQtc21jYS5jIGIvbWNlLWFtZC1zbWNh
LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uNmMzZThhNQotLS0gL2Rldi9u
dWxsCisrKyBiL21jZS1hbWQtc21jYS5jCkBAIC0wLDAgKzEsMzcxIEBACisvKgorICogQ29weXJp
Z2h0IChjKSAyMDE4LCBBTUQsIEluYy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyAqCisgKiBUaGlz
IHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29y
IG1vZGlmeQorICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSB2ZXJzaW9uIDIgYW5kCisgKiBvbmx5IHZlcnNpb24gMiBhcyBwdWJsaXNoZWQgYnkg
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZGlz
dHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBXSVRI
T1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisg
KiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBT
ZWUgdGhlCisgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgor
ICovCisKKyNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPHN0cmluZy5oPgorCisjaW5jbHVk
ZSAicmFzLW1jZS1oYW5kbGVyLmgiCisjaW5jbHVkZSAiYml0ZmllbGQuaCIKKworLyogTUNBX1NU
QVRVUyBSRUdJU1RFUiBGT1IgRkFNSUxZIDE3SAorICoqKioqKioqKioqKioqKioqKioqKioqIEhp
Z2hlciAzMi1iaXRzICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqCisgKiA2MzogVkFMSURF
UlJPUiwgNjI6IE9WRVJGTE9XLCA2MTogVUMsIDYwOiBFcnIgRU5BQkxFLAorICogNTk6IE1pc2Mg
VmFsaWQsIDU4OiBBZGRyIFZhbGlkLCA1NzogUENDLCA1NjogRXJyQ29yZUlEIFZhbGlkLAorICog
NTU6IFRDQywgNTQ6IFJFUywgNTM6IFN5bmRyb20gVmFsaWQsIDUyOiBUcmFuc3BhcmFuZXQsCisg
KiA1MTogUkVTLCA1MDogUkVTLCA0OTogUkVTLCA0ODogUkVTLAorICogNDc6IFJFUywgNDY6IENF
Q0MsIDQ1OiBVRUNDLCA0NDogRGVmZXJyZWQsCisgKiA0MzogUG9pc29uLCA0MjogUkVTLCA0MTog
UkVTLCA0MDogUkVTLAorICogMzk6IFJFUywgMzg6IFJFUywgMzc6IEVyckNvcmVJRFs1XSwgMzY6
IEVyckNvcmVJRFs0XSwKKyAqIDM1OiBFcnJDb3JlSURbM10sIDM0OiBFcnJDb3JlSURbMl0gMzM6
IEVyckNvcmVJRFsxXSAzMjogRXJyQ29yZUlEWzBdCisgKioqKioqKioqKioqKioqKioqKioqKiog
TG93ZXIgMzItYml0cyAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKKyAqIDMxOiBSRVMs
IDMwOiBSRVMsIDI5OiBSRVMsIDI4OiBSRVMsCisgKiAyNzogUkVTLCAyNjogUkVTLCAyNTogUkVT
LCAyNDogUkVTCisgKiAyMzogUkVTLCAyMjogUkVTLCAyMTogWEVDWzVdLCAyMDogWEVDWzRdLAor
ICogMTk6IFhFQ1szXSwgMTg6IFhFQ1syXSwgMTc6IFhFQ1sxXSwgMTY6IFhFQ1swXQorICogMTU6
IEVDWzE1XSwgMTQ6IEVDWzE0XSwgMTM6IEVDWzEzXSwgMTI6IEVDWzEyXSwKKyAqIDExOiBFQ1sx
MV0sIDEwOiBFQ1sxMF0sIDA5OiBFQ1s5XSwgMDg6IEVDWzhdLAorICogMDc6IEVDWzddLCAwNjog
RUNbNl0sIDA1OiBFQ1s1XSwgMDQ6IEVDWzRdLAorICogMDM6IEVDWzNdLCAwMjogRUNbMl0sIDAx
OiBFQ1sxXSwgMDA6IEVDWzBdCisgKi8KKworLyogVGhlc2UgbWF5IGJlIHVzZWQgYnkgbXVsdGlw
bGUgc21jYV9od2lkX21jYXR5cGVzICovCitlbnVtIHNtY2FfYmFua190eXBlcyB7CisJU01DQV9M
UyA9IDAsICAgIC8qIExvYWQgU3RvcmUgKi8KKwlTTUNBX0lGLCAgICAgICAgLyogSW5zdHJ1Y3Rp
b24gRmV0Y2ggKi8KKwlTTUNBX0wyX0NBQ0hFLCAgLyogTDIgQ2FjaGUgKi8KKwlTTUNBX0RFLCAg
ICAgICAgLyogRGVjb2RlciBVbml0ICovCisJU01DQV9SRVNFUlZFRCwgIC8qIFJlc2VydmVkICov
CisJU01DQV9FWCwgICAgICAgIC8qIEV4ZWN1dGlvbiBVbml0ICovCisJU01DQV9GUCwgICAgICAg
IC8qIEZsb2F0aW5nIFBvaW50ICovCisJU01DQV9MM19DQUNIRSwgIC8qIEwzIENhY2hlICovCisJ
U01DQV9DUywgICAgICAgIC8qIENvaGVyZW50IFNsYXZlICovCisJU01DQV9QSUUsICAgICAgIC8q
IFBvd2VyLCBJbnRlcnJ1cHRzLCBldGMuICovCisJU01DQV9VTUMsICAgICAgIC8qIFVuaWZpZWQg
TWVtb3J5IENvbnRyb2xsZXIgKi8KKwlTTUNBX1BCLCAgICAgICAgLyogUGFyYW1ldGVyIEJsb2Nr
ICovCisJU01DQV9QU1AsICAgICAgIC8qIFBsYXRmb3JtIFNlY3VyaXR5IFByb2Nlc3NvciAqLwor
CVNNQ0FfU01VLCAgICAgICAvKiBTeXN0ZW0gTWFuYWdlbWVudCBVbml0ICovCisJTl9TTUNBX0JB
TktfVFlQRVMKK307CisKKy8qIFNNQ0EgRXh0ZW5kZWQgZXJyb3Igc3RyaW5ncyAqLworLyogTG9h
ZCBTdG9yZSAqLworc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbWNhX2xzX21jZV9kZXNjW10g
PSB7CisJIkxvYWQgcXVldWUgcGFyaXR5IiwKKwkiU3RvcmUgcXVldWUgcGFyaXR5IiwKKwkiTWlz
cyBhZGRyZXNzIGJ1ZmZlciBwYXlsb2FkIHBhcml0eSIsCisJIkwxIFRMQiBwYXJpdHkiLAorCSJS
ZXNlcnZlZCIsCisJIkRDIHRhZyBlcnJvciB0eXBlIDYiLAorCSJEQyB0YWcgZXJyb3IgdHlwZSAx
IiwKKwkiSW50ZXJuYWwgZXJyb3IgdHlwZSAxIiwKKwkiSW50ZXJuYWwgZXJyb3IgdHlwZSAyIiwK
KwkiU3lzIFJlYWQgZGF0YSBlcnJvciB0aHJlYWQgMCIsCisJIlN5cyByZWFkIGRhdGEgZXJyb3Ig
dGhyZWFkIDEiLAorCSJEQyB0YWcgZXJyb3IgdHlwZSAyIiwKKwkiREMgZGF0YSBlcnJvciB0eXBl
IDEgKHBvaXNvbiBjb25zdW1wdGlvbikiLAorCSJEQyBkYXRhIGVycm9yIHR5cGUgMiIsCisJIkRD
IGRhdGEgZXJyb3IgdHlwZSAzIiwKKwkiREMgdGFnIGVycm9yIHR5cGUgNCIsCisJIkwyIFRMQiBw
YXJpdHkiLAorCSJQREMgcGFyaXR5IGVycm9yIiwKKwkiREMgdGFnIGVycm9yIHR5cGUgMyIsCisJ
IkRDIHRhZyBlcnJvciB0eXBlIDUiLAorCSJMMiBmaWxsIGRhdGEgZXJyb3IiLAorfTsKKy8qIElu
c3RydWN0aW9uIEZldGNoICovCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtY2FfaWZfbWNl
X2Rlc2NbXSA9IHsKKwkibWljcm90YWcgcHJvYmUgcG9ydCBwYXJpdHkgZXJyb3IiLAorCSJJQyBt
aWNyb3RhZyBvciBmdWxsIHRhZyBtdWx0aS1oaXQgZXJyb3IiLAorCSJJQyBmdWxsIHRhZyBwYXJp
dHkiLAorCSJJQyBkYXRhIGFycmF5IHBhcml0eSIsCisJIkRlY291cGxpbmcgcXVldWUgcGh5cyBh
ZGRyIHBhcml0eSBlcnJvciIsCisJIkwwIElUTEIgcGFyaXR5IGVycm9yIiwKKwkiTDEgSVRMQiBw
YXJpdHkgZXJyb3IiLAorCSJMMiBJVExCIHBhcml0eSBlcnJvciIsCisJIkJQUSBzbm9vcCBwYXJp
dHkgb24gVGhyZWFkIDAiLAorCSJCUFEgc25vb3AgcGFyaXR5IG9uIFRocmVhZCAxIiwKKwkiTDEg
QlRCIG11bHRpLW1hdGNoIGVycm9yIiwKKwkiTDIgQlRCIG11bHRpLW1hdGNoIGVycm9yIiwKKwki
TDIgQ2FjaGUgUmVzcG9uc2UgUG9pc29uIGVycm9yIiwKKwkiU3lzdGVtIFJlYWQgRGF0YSBlcnJv
ciIsCit9OworLyogTDIgQ2FjaGUgKi8KK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc21jYV9s
Ml9tY2VfZGVzY1tdID0geworCSJMMk0gdGFnIG11bHRpLXdheS1oaXQgZXJyb3IiLAorCSJMMk0g
dGFnIEVDQyBlcnJvciIsCisJIkwyTSBkYXRhIEVDQyBlcnJvciIsCisJIkhXIGFzc2VydCIsCit9
OworLyogRGVjb2RlciBVbml0ICovCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtY2FfZGVf
bWNlX2Rlc2NbXSA9IHsKKwkidW9wIGNhY2hlIHRhZyBwYXJpdHkgZXJyb3IiLAorCSJ1b3AgY2Fj
aGUgZGF0YSBwYXJpdHkgZXJyb3IiLAorCSJJbnNuIGJ1ZmZlciBwYXJpdHkgZXJyb3IiLAorCSJ1
b3AgcXVldWUgcGFyaXR5IGVycm9yIiwKKwkiSW5zbiBkaXNwYXRjaCBxdWV1ZSBwYXJpdHkgZXJy
b3IiLAorCSJGZXRjaCBhZGRyZXNzIEZJRk8gcGFyaXR5IiwKKwkiUGF0Y2ggUkFNIGRhdGEgcGFy
aXR5IiwKKwkiUGF0Y2ggUkFNIHNlcXVlbmNlciBwYXJpdHkiLAorCSJ1b3AgYnVmZmVyIHBhcml0
eSIKK307CisvKiBFeGVjdXRpb24gVW5pdCAqLworc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBz
bWNhX2V4X21jZV9kZXNjW10gPSB7CisJIldhdGNoZG9nIHRpbWVvdXQgZXJyb3IiLAorCSJQaHkg
cmVnaXN0ZXIgZmlsZSBwYXJpdHkiLAorCSJGbGFnIHJlZ2lzdGVyIGZpbGUgcGFyaXR5IiwKKwki
SW1tZWRpYXRlIGRpc3BsYWNlbWVudCByZWdpc3RlciBmaWxlIHBhcml0eSIsCisJIkFkZHJlc3Mg
Z2VuZXJhdG9yIHBheWxvYWQgcGFyaXR5IiwKKwkiRVggcGF5bG9hZCBwYXJpdHkiLAorCSJDaGVj
a3BvaW50IHF1ZXVlIHBhcml0eSIsCisJIlJldGlyZSBkaXNwYXRjaCBxdWV1ZSBwYXJpdHkiLAor
CSJSZXRpcmUgc3RhdHVzIHF1ZXVlIHBhcml0eSBlcnJvciIsCisJIlNjaGVkdWxpbmcgcXVldWUg
cGFyaXR5IGVycm9yIiwKKwkiQnJhbmNoIGJ1ZmZlciBxdWV1ZSBwYXJpdHkgZXJyb3IiLAorfTsK
Ky8qIEZsb2F0aW5nIFBvaW50IFVuaXQgKi8KK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc21j
YV9mcF9tY2VfZGVzY1tdID0geworCSJQaHlzaWNhbCByZWdpc3RlciBmaWxlIHBhcml0eSIsCisJ
IkZyZWVsaXN0IHBhcml0eSBlcnJvciIsCisJIlNjaGVkdWxlIHF1ZXVlIHBhcml0eSIsCisJIk5T
USBwYXJpdHkgZXJyb3IiLAorCSJSZXRpcmUgcXVldWUgcGFyaXR5IiwKKwkiU3RhdHVzIHJlZ2lz
dGVyIGZpbGUgcGFyaXR5IiwKKwkiSGFyZHdhcmUgYXNzZXJ0aW9uIiwKK307CisvKiBMMyBDYWNo
ZSAqLworc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbWNhX2wzX21jZV9kZXNjW10gPSB7CisJ
IlNoYWRvdyB0YWcgbWFjcm8gRUNDIGVycm9yIiwKKwkiU2hhZG93IHRhZyBtYWNybyBtdWx0aS13
YXktaGl0IGVycm9yIiwKKwkiTDNNIHRhZyBFQ0MgZXJyb3IiLAorCSJMM00gdGFnIG11bHRpLXdh
eS1oaXQgZXJyb3IiLAorCSJMM00gZGF0YSBFQ0MgZXJyb3IiLAorCSJYSSBwYXJpdHksIEwzIGZp
bGwgZG9uZSBjaGFubmVsIGVycm9yIiwKKwkiTDMgdmljdGltIHF1ZXVlIHBhcml0eSIsCisJIkwz
IEhXIGFzc2VydCIsCit9OworLyogQ29oZXJlbnQgU2xhdmUgVW5pdCAqLworc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdCBzbWNhX2NzX21jZV9kZXNjW10gPSB7CisJIklsbGVnYWwgcmVxdWVzdCBm
cm9tIHRyYW5zcG9ydCBsYXllciIsCisJIkFkZHJlc3MgdmlvbGF0aW9uIiwKKwkiU2VjdXJpdHkg
dmlvbGF0aW9uIiwKKwkiSWxsZWdhbCByZXNwb25zZSBmcm9tIHRyYW5zcG9ydCBsYXllciIsCisJ
IlVuZXhwZWN0ZWQgcmVzcG9uc2UiLAorCSJQYXJpdHkgZXJyb3Igb24gaW5jb21pbmcgcmVxdWVz
dCBvciBwcm9iZSByZXNwb25zZSBkYXRhIiwKKwkiUGFyaXR5IGVycm9yIG9uIGluY29taW5nIHJl
YWQgcmVzcG9uc2UgZGF0YSIsCisJIkF0b21pYyByZXF1ZXN0IHBhcml0eSIsCisJIkVDQyBlcnJv
ciBvbiBwcm9iZSBmaWx0ZXIgYWNjZXNzIiwKK307CisvKiBQb3dlciwgSW50ZXJydXB0LCBldGMu
LiAqLworc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbWNhX3BpZV9tY2VfZGVzY1tdID0gewor
CSJIVyBhc3NlcnQiLAorCSJJbnRlcm5hbCBQSUUgcmVnaXN0ZXIgc2VjdXJpdHkgdmlvbGF0aW9u
IiwKKwkiRXJyb3Igb24gR01JIGxpbmsiLAorCSJQb2lzb24gZGF0YSB3cml0dGVuIHRvIGludGVy
bmFsIFBJRSByZWdpc3RlciIsCit9OworLyogVW5pZmllZCBNZW1vcnkgQ29udHJvbGxlciAqLwor
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbWNhX3VtY19tY2VfZGVzY1tdID0geworCSJEUkFN
IEVDQyBlcnJvciIsCisJIkRhdGEgcG9pc29uIGVycm9yIG9uIERSQU0iLAorCSJTRFAgcGFyaXR5
IGVycm9yIiwKKwkiQWR2YW5jZWQgcGVyaXBoZXJhbCBidXMgZXJyb3IiLAorCSJDb21tYW5kL2Fk
ZHJlc3MgcGFyaXR5IGVycm9yIiwKKwkiV3JpdGUgZGF0YSBDUkMgZXJyb3IiLAorfTsKKy8qIFBh
cmFtZXRlciBCbG9jayAqLworc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzbWNhX3BiX21jZV9k
ZXNjW10gPSB7CisJIlBhcmFtZXRlciBCbG9jayBSQU0gRUNDIGVycm9yIiwKK307CisvKiBQbGF0
Zm9ybSBTZWN1cml0eSBQcm9jZXNzb3IgKi8KK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3Qgc21j
YV9wc3BfbWNlX2Rlc2NbXSA9IHsKKwkiUFNQIFJBTSBFQ0Mgb3IgcGFyaXR5IGVycm9yIiwKK307
CisvKiBTeXN0ZW0gTWFuYWdlbWVudCBVbml0ICovCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0
IHNtY2Ffc211X21jZV9kZXNjW10gPSB7CisJIlNNVSBSQU0gRUNDIG9yIHBhcml0eSBlcnJvciIs
Cit9OworCitzdHJ1Y3Qgc21jYV9tY2VfZGVzYyB7CisJY29uc3QgY2hhciAqIGNvbnN0ICpkZXNj
czsKKwl1bnNpZ25lZCBpbnQgbnVtX2Rlc2NzOworfTsKKworc3RhdGljIHN0cnVjdCBzbWNhX21j
ZV9kZXNjIHNtY2FfbWNlX2Rlc2NzW10gPSB7CisJW1NNQ0FfTFNdICAgICAgID0geyBzbWNhX2xz
X21jZV9kZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9sc19tY2VfZGVzYykgIH0sCisJW1NNQ0FfSUZd
ICAgICAgID0geyBzbWNhX2lmX21jZV9kZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9pZl9tY2VfZGVz
YykgIH0sCisJW1NNQ0FfTDJfQ0FDSEVdID0geyBzbWNhX2wyX21jZV9kZXNjLCAgIEFSUkFZX1NJ
WkUoc21jYV9sMl9tY2VfZGVzYykgIH0sCisJW1NNQ0FfREVdICAgICAgID0geyBzbWNhX2RlX21j
ZV9kZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9kZV9tY2VfZGVzYykgIH0sCisJW1NNQ0FfRVhdICAg
ICAgID0geyBzbWNhX2V4X21jZV9kZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9leF9tY2VfZGVzYykg
IH0sCisJW1NNQ0FfRlBdICAgICAgID0geyBzbWNhX2ZwX21jZV9kZXNjLCAgIEFSUkFZX1NJWkUo
c21jYV9mcF9tY2VfZGVzYykgIH0sCisJW1NNQ0FfTDNfQ0FDSEVdID0geyBzbWNhX2wzX21jZV9k
ZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9sM19tY2VfZGVzYykgIH0sCisJW1NNQ0FfQ1NdICAgICAg
ID0geyBzbWNhX2NzX21jZV9kZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9jc19tY2VfZGVzYykgIH0s
CisJW1NNQ0FfUElFXSAgICAgID0geyBzbWNhX3BpZV9tY2VfZGVzYywgIEFSUkFZX1NJWkUoc21j
YV9waWVfbWNlX2Rlc2MpIH0sCisJW1NNQ0FfVU1DXSAgICAgID0geyBzbWNhX3VtY19tY2VfZGVz
YywgIEFSUkFZX1NJWkUoc21jYV91bWNfbWNlX2Rlc2MpIH0sCisJW1NNQ0FfUEJdICAgICAgID0g
eyBzbWNhX3BiX21jZV9kZXNjLCAgIEFSUkFZX1NJWkUoc21jYV9wYl9tY2VfZGVzYykgIH0sCisJ
W1NNQ0FfUFNQXSAgICAgID0geyBzbWNhX3BzcF9tY2VfZGVzYywgIEFSUkFZX1NJWkUoc21jYV9w
c3BfbWNlX2Rlc2MpIH0sCisJW1NNQ0FfU01VXSAgICAgID0geyBzbWNhX3NtdV9tY2VfZGVzYywg
IEFSUkFZX1NJWkUoc21jYV9zbXVfbWNlX2Rlc2MpIH0sCit9OworCitzdHJ1Y3Qgc21jYV9od2lk
IHsKKwl1bnNpZ25lZCBpbnQgYmFua190eXBlOyAvKiBVc2Ugd2l0aCBzbWNhX2JhbmtfdHlwZXMg
Zm9yIGVhc3kgaW5kZXhpbmcuKi8KKwl1aW50MzJfdCBtY2F0eXBlX2h3aWQ7ICAvKiBtY2F0eXBl
LGh3aWQgYml0IDYzLTMyIGluIE1DeF9JUElEIFJlZ2lzdGVyKi8KK307CisKK3N0YXRpYyBzdHJ1
Y3Qgc21jYV9od2lkIHNtY2FfaHdpZF9tY2F0eXBlc1tdID0geworCS8qIHsgYmFua190eXBlLCBt
Y2F0eXBlX2h3aWQgfSAqLworCisJLyogWk4gQ29yZSAoSFdJRD0weEIwKSBNQ0EgdHlwZXMgKi8K
Kwl7IFNNQ0FfTFMsICAgICAgIDB4MDAwMDAwQjAgfSwKKwl7IFNNQ0FfSUYsICAgICAgIDB4MDAw
MTAwQjAgfSwKKwl7IFNNQ0FfTDJfQ0FDSEUsIDB4MDAwMjAwQjAgfSwKKwl7IFNNQ0FfREUsICAg
ICAgIDB4MDAwMzAwQjAgfSwKKwkvKiBIV0lEIDB4QjAgTUNBVFlQRSAweDQgaXMgUmVzZXJ2ZWQg
Ki8KKwl7IFNNQ0FfRVgsICAgICAgIDB4MDAwNTAwQjAgfSwKKwl7IFNNQ0FfRlAsICAgICAgIDB4
MDAwNjAwQjAgfSwKKwl7IFNNQ0FfTDNfQ0FDSEUsIDB4MDAwNzAwQjAgfSwKKworCS8qIERhdGEg
RmFicmljIE1DQSB0eXBlcyAqLworCXsgU01DQV9DUywgICAgICAgMHgwMDAwMDAyRSB9LAorCXsg
U01DQV9QSUUsICAgICAgMHgwMDAxMDAyRSB9LAorCisJLyogVW5pZmllZCBNZW1vcnkgQ29udHJv
bGxlciBNQ0EgdHlwZSAqLworCXsgU01DQV9VTUMsICAgICAgMHgwMDAwMDA5NiB9LAorCisJLyog
UGFyYW1ldGVyIEJsb2NrIE1DQSB0eXBlICovCisJeyBTTUNBX1BCLCAgICAgICAweDAwMDAwMDA1
IH0sCisKKwkvKiBQbGF0Zm9ybSBTZWN1cml0eSBQcm9jZXNzb3IgTUNBIHR5cGUgKi8KKwl7IFNN
Q0FfUFNQLCAgICAgIDB4MDAwMDAwRkYgfSwKKworCS8qIFN5c3RlbSBNYW5hZ2VtZW50IFVuaXQg
TUNBIHR5cGUgKi8KKwl7IFNNQ0FfU01VLCAgICAgIDB4MDAwMDAwMDEgfSwKK307CisKK3N0cnVj
dCBzbWNhX2JhbmtfbmFtZSB7CisJY29uc3QgY2hhciAqbmFtZTsKK307CisKK3N0YXRpYyBzdHJ1
Y3Qgc21jYV9iYW5rX25hbWUgc21jYV9uYW1lc1tdID0geworCVtTTUNBX0xTXSAgICAgICA9IHsg
IkxvYWQgU3RvcmUgVW5pdCIgfSwKKwlbU01DQV9JRl0gICAgICAgPSB7ICJJbnN0cnVjdGlvbiBG
ZXRjaCBVbml0IiB9LAorCVtTTUNBX0wyX0NBQ0hFXSA9IHsgIkwyIENhY2hlIiB9LAorCVtTTUNB
X0RFXSAgICAgICA9IHsgIkRlY29kZSBVbml0IiB9LAorCVtTTUNBX1JFU0VSVkVEXSA9IHsgIlJl
c2VydmVkIiB9LAorCVtTTUNBX0VYXSAgICAgICA9IHsgIkV4ZWN1dGlvbiBVbml0IiB9LAorCVtT
TUNBX0ZQXSAgICAgICA9IHsgIkZsb2F0aW5nIFBvaW50IFVuaXQiIH0sCisJW1NNQ0FfTDNfQ0FD
SEVdID0geyAiTDMgQ2FjaGUiIH0sCisJW1NNQ0FfQ1NdICAgICAgID0geyAiQ29oZXJlbnQgU2xh
dmUiIH0sCisJW1NNQ0FfUElFXSAgICAgID0geyAiUG93ZXIsIEludGVycnVwdHMsIGV0Yy4iIH0s
CisJW1NNQ0FfVU1DXSAgICAgID0geyAiVW5pZmllZCBNZW1vcnkgQ29udHJvbGxlciIgfSwKKwlb
U01DQV9QQl0gICAgICAgPSB7ICJQYXJhbWV0ZXIgQmxvY2siIH0sCisJW1NNQ0FfUFNQXSAgICAg
ID0geyAiUGxhdGZvcm0gU2VjdXJpdHkgUHJvY2Vzc29yIiB9LAorCVtTTUNBX1NNVV0gICAgICA9
IHsgIlN5c3RlbSBNYW5hZ2VtZW50IFVuaXQiIH0sCit9OworCitzdGF0aWMgdm9pZCBhbWRfZGVj
b2RlX2VycmNvZGUoc3RydWN0IG1jZV9ldmVudCAqZSkKK3sKKworCWRlY29kZV9hbWRfZXJyY29k
ZShlKTsKKworCWlmIChlLT5zdGF0dXMgJiBNQ0lfU1RBVFVTX1BPSVNPTikKKwkJbWNlX3NucHJp
bnRmKGUtPm1jaXN0YXR1c19tc2csICJQb2lzb24gY29uc3VtZWQiKTsKKworCWlmIChlLT5zdGF0
dXMgJiBNQ0lfU1RBVFVTX1RDQykKKwkJbWNlX3NucHJpbnRmKGUtPm1jaXN0YXR1c19tc2csICJU
YXNrX2NvbnRleHRfY29ycnVwdCIpOworCit9CisvKgorICogVG8gZmluZCB0aGUgVU1DIGNoYW5u
ZWwgcmVwcmVzZW50ZWQgYnkgdGhpcyBiYW5rIHdlIG5lZWQgdG8gbWF0Y2ggb24gaXRzCisgKiBp
bnN0YW5jZV9pZC4gVGhlIGluc3RhbmNlX2lkIG9mIGEgYmFuayBpcyBoZWxkIGluIHRoZSBsb3dl
ciAzMiBiaXRzIG9mIGl0cworICogSVBJRC4KKyAqLworc3RhdGljIGludCBmaW5kX3VtY19jaGFu
bmVsKHN0cnVjdCBtY2VfZXZlbnQgKmUpCit7CisJdWludDMyX3QgdW1jX2luc3RhbmNlX2lkW10g
PSB7MHg1MGYwMCwgMHgxNTBmMDB9OworCXVpbnQzMl90IGluc3RhbmNlX2lkID0gRVhUUkFDVChl
LT5pcGlkLCAwLCAzMSk7CisJaW50IGksIGNoYW5uZWwgPSAtMTsKKworCWZvciAoaSA9IDA7IGkg
PCBBUlJBWV9TSVpFKHVtY19pbnN0YW5jZV9pZCk7IGkrKykKKwkJaWYgKHVtY19pbnN0YW5jZV9p
ZFtpXSA9PSBpbnN0YW5jZV9pZCkKKwkJCWNoYW5uZWwgPSBpOworCisJcmV0dXJuIGNoYW5uZWw7
Cit9CisvKiBEZWNvZGUgZXh0ZW5kZWQgZXJyb3JzIGFjY29yZGluZyB0byBTY2FsYWJsZSBNQ0Eg
c3BlY2lmaWNhdGlvbiAqLworc3RhdGljIHZvaWQgZGVjb2RlX3NtY2FfZXJyb3Ioc3RydWN0IG1j
ZV9ldmVudCAqZSkKK3sKKwllbnVtIHNtY2FfYmFua190eXBlcyBiYW5rX3R5cGU7CisJY29uc3Qg
Y2hhciAqaXBfbmFtZTsKKwl1bnNpZ25lZCBzaG9ydCB4ZWMgPSAoZS0+c3RhdHVzID4+IDE2KSAm
IDB4M2Y7CisJY29uc3Qgc3RydWN0IHNtY2FfaHdpZCAqc19od2lkOworCXVpbnQzMl90IG1jYXR5
cGVfaHdpZCA9IEVYVFJBQ1QoZS0+aXBpZCwgMzIsIDYzKTsKKwl1bnNpZ25lZCBpbnQgY3Nyb3cg
PSAtMSwgY2hhbm5lbCA9IC0xOworCXVuc2lnbmVkIGludCBpOworCisJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUoc21jYV9od2lkX21jYXR5cGVzKTsgaSsrKSB7CisJCXNfaHdpZCA9ICZzbWNh
X2h3aWRfbWNhdHlwZXNbaV07CisJCWlmIChtY2F0eXBlX2h3aWQgPT0gc19od2lkLT5tY2F0eXBl
X2h3aWQpIHsKKwkJCWJhbmtfdHlwZSA9IHNfaHdpZC0+YmFua190eXBlOworCQkJYnJlYWs7CisJ
CX0KKwl9CisKKwlpZiAoaSA+PSBBUlJBWV9TSVpFKHNtY2FfaHdpZF9tY2F0eXBlcykpIHsKKwkJ
c3RyY3B5KGUtPm1jYXN0YXR1c19tc2csICJDb3VsZG4ndCBmaW5kIGJhbmsgdHlwZSB3aXRoIElQ
SUQiKTsKKwkJcmV0dXJuOworCX0KKworCWlmIChiYW5rX3R5cGUgPj0gTl9TTUNBX0JBTktfVFlQ
RVMpIHsKKwkJc3RyY3B5KGUtPm1jYXN0YXR1c19tc2csICJEb24ndCBrbm93IGhvdyB0byBkZWNv
ZGUgdGhpcyBiYW5rIik7CisJCXJldHVybjsKKwl9CisKKwlpZiAoYmFua190eXBlID09IFNNQ0Ff
UkVTRVJWRUQpIHsKKwkJc3RyY3B5KGUtPm1jYXN0YXR1c19tc2csICJCYW5rIDQgaXMgcmVzZXJ2
ZWQuXG4iKTsKKwkJcmV0dXJuOworCX0KKworCWlwX25hbWUgPSBzbWNhX25hbWVzW2JhbmtfdHlw
ZV0ubmFtZTsKKworCW1jZV9zbnByaW50ZihlLT5iYW5rX25hbWUsICIlcyAoYmFuaz0lZCkiLCBp
cF9uYW1lLCBlLT5iYW5rKTsKKworCS8qIE9ubHkgcHJpbnQgdGhlIGRlc2NyaXB0b3Igb2YgdmFs
aWQgZXh0ZW5kZWQgZXJyb3IgY29kZSAqLworCWlmICh4ZWMgPCBzbWNhX21jZV9kZXNjc1tiYW5r
X3R5cGVdLm51bV9kZXNjcykKKwkJbWNlX3NucHJpbnRmKGUtPm1jYXN0YXR1c19tc2csCisJCQkg
ICAgICIgJXMuXG4iLCBzbWNhX21jZV9kZXNjc1tiYW5rX3R5cGVdLmRlc2NzW3hlY10pOworCisJ
aWYgKGJhbmtfdHlwZSA9PSBTTUNBX1VNQyAmJiB4ZWMgPT0gMCkgeworCQljaGFubmVsID0gZmlu
ZF91bWNfY2hhbm5lbChlKTsKKwkJY3Nyb3cgPSBlLT5zeW5kICYgMHg3OyAvKiBCaXQgMCwgMSAs
MiAqLworCQltY2Vfc25wcmludGYoZS0+bWNfbG9jYXRpb24sICJtZW1vcnlfY2hhbm5lbD0lZCxj
c3Jvdz0lZCIsCisJCQkgICAgIGNoYW5uZWwsIGNzcm93KTsKKwl9Cit9CisKK2ludCBwYXJzZV9h
bWRfc21jYV9ldmVudChzdHJ1Y3QgcmFzX2V2ZW50cyAqcmFzLCBzdHJ1Y3QgbWNlX2V2ZW50ICpl
KQoreworCXVpbnQ2NF90IG1jZ3N0YXR1cyA9IGUtPm1jZ3N0YXR1czsKKworCW1jZV9zbnByaW50
ZihlLT5tY2dzdGF0dXNfbXNnLCAibWNnc3RhdHVzPSVsbGQiLAorCQkgICAgKGxvbmcgbG9uZyll
LT5tY2dzdGF0dXMpOworCisJaWYgKG1jZ3N0YXR1cyAmIE1DR19TVEFUVVNfUklQVikKKwkJbWNl
X3NucHJpbnRmKGUtPm1jZ3N0YXR1c19tc2csICJSSVBWIik7CisJaWYgKG1jZ3N0YXR1cyAmIE1D
R19TVEFUVVNfRUlQVikKKwkJbWNlX3NucHJpbnRmKGUtPm1jZ3N0YXR1c19tc2csICJFSVBWIik7
CisJaWYgKG1jZ3N0YXR1cyAmIE1DR19TVEFUVVNfTUNJUCkKKwkJbWNlX3NucHJpbnRmKGUtPm1j
Z3N0YXR1c19tc2csICJNQ0lQIik7CisKKwlkZWNvZGVfc21jYV9lcnJvcihlKTsKKwlhbWRfZGVj
b2RlX2VycmNvZGUoZSk7CisJcmV0dXJuIDA7Cit9CmRpZmYgLS1naXQgYS9tY2UtYW1kLmMgYi9t
Y2UtYW1kLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMC4uMTE2ZGYxMQotLS0g
L2Rldi9udWxsCisrKyBiL21jZS1hbWQuYwpAQCAtMCwwICsxLDEyMiBAQAorLyoKKyAqIENvcHly
aWdodCAoYykgMjAxOCwgVGhlIEFNRCwgSW5jLiBBbGwgcmlnaHRzIHJlc2VydmVkLgorICoKKyAq
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IgbW9kaWZ5CisgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhbmQKKyAqIG9ubHkgdmVyc2lvbiAyIGFzIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBp
cyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0
IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkg
b2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RS4gIFNlZSB0aGUKKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFp
bHMuCisgKi8KKworI2luY2x1ZGUgPHN0ZGlvLmg+CisjaW5jbHVkZSA8c3RyaW5nLmg+CisKKyNp
bmNsdWRlICJyYXMtbWNlLWhhbmRsZXIuaCIKKworLyogRXJyb3IgQ29kZSBUeXBlcyAqLworI2Rl
ZmluZSBUTEJfRVJST1IoeCkgICAgICAgICAgICAgICAgICAgICgoKHgpICYgMHhGRkYwKSA9PSAw
eDAwMTApCisjZGVmaW5lIE1FTV9FUlJPUih4KSAgICAgICAgICAgICAgICAgICAgKCgoeCkgJiAw
eEZGMDApID09IDB4MDEwMCkKKyNkZWZpbmUgQlVTX0VSUk9SKHgpICAgICAgICAgICAgICAgICAg
ICAoKCh4KSAmIDB4RjgwMCkgPT0gMHgwODAwKQorI2RlZmluZSBJTlRfRVJST1IoeCkgICAgICAg
ICAgICAgICAgICAgICgoKHgpICYgMHhGNEZGKSA9PSAweDA0MDApCisKKy8qIEVycm9yIGNvZGU6
IHRyYW5zYWN0aW9uIHR5cGUgKFRUKSAqLworc3RhdGljIGNoYXIgKnRyYW5zYWN0aW9uW10gPSB7
CisJImluc3RydWN0aW9uIiwgImRhdGEiLCAiZ2VuZXJpYyIsICJyZXNlcnZlZCIKK307CisvKiBF
cnJvciBjb2RlczogY2FjaGUgbGV2ZWwgKExMKSAqLworc3RhdGljIGNoYXIgKmNhY2hlbGV2ZWxb
XSA9IHsKKwkicmVzZXJ2ZWQiLCAiTDEiLCAiTDIiLCAiTDMvZ2VuZXJpYyIKK307CisvKiBFcnJv
ciBjb2RlczogbWVtb3J5IHRyYW5zYWN0aW9uIHR5cGUgKFJSUlIpICovCitzdGF0aWMgY2hhciAq
bWVtdHJhbnNbXSA9IHsKKwkiZ2VuZXJpYyIsICJnZW5lcmljIHJlYWQiLCAiZ2VuZXJpYyB3cml0
ZSIsICJkYXRhIHJlYWQiLAorCSJkYXRhIHdyaXRlIiwgImluc3RydWN0aW9uIGZldGNoIiwgInBy
ZWZldGNoIiwgImV2aWN0IiwgInNub29wIiwKKwkiPyIsICI/IiwgIj8iLCAiPyIsICI/IiwgIj8i
LCAiPyIKK307CisvKiBQYXJ0aWNpcGF0aW9uIFByb2Nlc3NvciAqLworc3RhdGljIGNoYXIgKnBh
cnRwcm9jW10gPSB7CisJImxvY2FsIG5vZGUgb3JpZ2luIiwgImxvY2FsIG5vZGUgcmVzcG9uc2Ui
LAorCSJsb2NhbCBub2RlIG9ic2VydmVkIiwgImdlbmVyaWMgcGFydGljaXBhdGlvbiIKK307Cisv
KiBUaW1lb3V0ICovCitzdGF0aWMgY2hhciAqdGltZW91dFtdID0geworCSJyZXF1ZXN0IGRpZG4n
dCB0aW1lIG91dCIsCisJInJlcXVlc3QgdGltZWQgb3V0IgorfTsKKy8qIGludGVybmFsIHVuY2xh
c3NpZmllZCBlcnJvciBjb2RlICovCitzdGF0aWMgY2hhciAqaW50ZXJuYWxbXSA9IHsgInJlc2Vy
dmVkIiwKKwkJCSAgICAicmVzZXJ2ZWQiLAorCQkJICAgICJoYXJkd2FyZSBhc3NlcnQiLAorCQkJ
ICAgICJyZXNlcnZlZCIgfTsKKworI2RlZmluZSBUVCh4KSAgICAgICAgICgoKHgpID4+IDIpICYg
MHgzKSAgIC8qYml0IDIsIGJpdCAzKi8KKyNkZWZpbmUgVFRfTVNHKHgpICAgICB0cmFuc2FjdGlv
bltUVCh4KV0KKyNkZWZpbmUgTEwoeCkgICAgICAgICAoKHgpICYgMHgzKSAgICAgICAgICAvKmJp
dCAwLCBiaXQgMSovCisjZGVmaW5lIExMX01TRyh4KSAgICAgY2FjaGVsZXZlbFtMTCh4KV0KKwor
I2RlZmluZSBSNCh4KSAgICAgICAgICgoKHgpID4+IDQpICYgMHhGKSAgIC8qYml0IDQsIGJpdCA1
LCBiaXQgNiwgYml0IDcgKi8KKyNkZWZpbmUgUjRfTVNHKHgpICAgICAoKFI0KHgpIDwgOSkgPyAg
bWVtdHJhbnNbUjQoeCldIDogIldyb25nIFI0ISIpCisKKyNkZWZpbmUgVE8oeCkgICAgICAgICAo
KCh4KSA+PiA4KSAmIDB4MSkgICAvKmJpdCA4Ki8KKyNkZWZpbmUgVE9fTVNHKHgpICAgICB0aW1l
b3V0W1RPKHgpXQorI2RlZmluZSBQUCh4KSAgICAgICAgICgoKHgpID4+IDkpICYgMHgzKSAgIC8q
Yml0IDksIGJpdCAxMCovCisjZGVmaW5lIFBQX01TRyh4KSAgICAgcGFydHByb2NbUFAoeCldCisK
KyNkZWZpbmUgVVUoeCkgICAgICAgICAoKCh4KSA+PiA4KSAmIDB4MykgICAvKmJpdCA4LCBiaXQg
OSovCisjZGVmaW5lIFVVX01TRyh4KSAgICAgaW50ZXJuYWxbVVUoeCldCisKK3ZvaWQgZGVjb2Rl
X2FtZF9lcnJjb2RlKHN0cnVjdCBtY2VfZXZlbnQgKmUpCit7CisJdWludDE2X3QgZWMgPSBlLT5z
dGF0dXMgJiAweGZmZmY7CisJdWludDE2X3QgZWNjID0gKGUtPnN0YXR1cyA+PiA0NSkgJiAweDM7
CisKKwlpZiAoZS0+c3RhdHVzICYgTUNJX1NUQVRVU19VQykgeworCQlpZiAoZS0+c3RhdHVzICYg
TUNJX1NUQVRVU19QQ0MpCisJCQlzdHJjcHkoZS0+ZXJyb3JfbXNnLCAiU3lzdGVtIEZhdGFsIGVy
cm9yLiIpOworCQlpZiAoZS0+bWNnc3RhdHVzICYgTUNHX1NUQVRVU19SSVBWKQorCQkJc3RyY3B5
KGUtPmVycm9yX21zZywKKwkJCSAgICAgICAiVW5jb3JyZWN0ZWQsIHNvZnR3YXJlIHJlc3RhcnRh
YmxlIGVycm9yLiIpOworCQlzdHJjcHkoZS0+ZXJyb3JfbXNnLAorCQkgICAgICAgIlVuY29ycmVj
dGVkLCBzb2Z0d2FyZSBjb250YWluYWJsZSBlcnJvci4iKTsKKwl9IGVsc2UgaWYgKGUtPnN0YXR1
cyAmIE1DSV9TVEFUVVNfREVGRVJSRUQpCisJCXN0cmNweShlLT5lcnJvcl9tc2csICJEZWZlcnJl
ZCBlcnJvciwgbm8gYWN0aW9uIHJlcXVpcmVkLiIpOworCWVsc2UKKwkJc3RyY3B5KGUtPmVycm9y
X21zZywgIkNvcnJlY3RlZCBlcnJvciwgbm8gYWN0aW9uIHJlcXVpcmVkLiIpOworCisJaWYgKCEo
ZS0+c3RhdHVzICYgTUNJX1NUQVRVU19WQUwpKQorCQltY2Vfc25wcmludGYoZS0+bWNpc3RhdHVz
X21zZywgIk1DRV9JTlZBTElEIik7CisKKwlpZiAoZS0+c3RhdHVzICYgTUNJX1NUQVRVU19PVkVS
KQorCQltY2Vfc25wcmludGYoZS0+bWNpc3RhdHVzX21zZywgIkVycm9yX292ZXJmbG93Iik7CisK
KwlpZiAoZS0+c3RhdHVzICYgTUNJX1NUQVRVU19QQ0MpCisJCW1jZV9zbnByaW50ZihlLT5tY2lz
dGF0dXNfbXNnLCAiUHJvY2Vzc29yX2NvbnRleHRfY29ycnVwdCIpOworCisJaWYgKGVjYykKKwkJ
bWNlX3NucHJpbnRmKGUtPm1jaXN0YXR1c19tc2csCisJCQkgICAgICIlc0VDQyIsICgoZWNjID09
IDIpID8gIkMiIDogIlUiKSk7CisKKwlpZiAoSU5UX0VSUk9SKGVjKSkgeworCQltY2Vfc25wcmlu
dGYoZS0+bWNhc3RhdHVzX21zZywgIkludGVybmFsICclcyciLCBVVV9NU0coZWMpKTsKKwkJcmV0
dXJuOworCX0KKworCWlmIChUTEJfRVJST1IoZWMpKQorCQltY2Vfc25wcmludGYoZS0+bWNhc3Rh
dHVzX21zZywKKwkJCSAgICAgIlRMQiBFcnJvciAndHg6ICVzLCBsZXZlbDogJXMnIiwKKwkJCSAg
ICAgVFRfTVNHKGVjKSwgTExfTVNHKGVjKSk7CisJZWxzZSBpZiAoTUVNX0VSUk9SKGVjKSkKKwkJ
bWNlX3NucHJpbnRmKGUtPm1jYXN0YXR1c19tc2csCisJCQkgICAgICJNZW1vcnkgRXJyb3IgJ21l
bS10eDogJXMsIHR4OiAlcywgbGV2ZWw6ICVzJyIsCisJCQkgICAgIFI0X01TRyhlYyksIFRUX01T
RyhlYyksIExMX01TRyhlYykpOworCWVsc2UgaWYgKEJVU19FUlJPUihlYykpCisJCW1jZV9zbnBy
aW50ZihlLT5tY2FzdGF0dXNfbXNnLAorCQkJICAgICAiQnVzIEVycm9yICclcywgJXMsIG1lbS10
eDogJXMsIGxldmVsOiAlcyciLAorCQkJICAgICBQUF9NU0coZWMpLCBUT19NU0coZWMpLAorCQkJ
ICAgICBSNF9NU0coZWMpLCBMTF9NU0coZWMpKTsKKwlyZXR1cm47CisKK30KZGlmZiAtLWdpdCBh
L3Jhcy1tY2UtaGFuZGxlci5jIGIvcmFzLW1jZS1oYW5kbGVyLmMKaW5kZXggNDAzMGI4Yy4uYzEx
ZDQ4OSAxMDA2NDQKLS0tIGEvcmFzLW1jZS1oYW5kbGVyLmMKKysrIGIvcmFzLW1jZS1oYW5kbGVy
LmMKQEAgLTU1LDYgKzU1LDcgQEAgc3RhdGljIGNoYXIgKmNwdXR5cGVfbmFtZVtdID0gewogCVtD
UFVfS05JR0hUU19MQU5ESU5HXSA9ICJLbmlnaHRzIExhbmRpbmciLAogCVtDUFVfS05JR0hUU19N
SUxMXSA9ICJLbmlnaHRzIE1pbGwiLAogCVtDUFVfU0tZTEFLRV9YRU9OXSA9ICJTa3lsYWtlIHNl
cnZlciIsCisJW0NQVV9OQVBMRVNdID0gIkFNRCBGYW1pbHkgMTdoIFplbjEiCiB9OwogCiBzdGF0
aWMgZW51bSBjcHV0eXBlIHNlbGVjdF9pbnRlbF9jcHV0eXBlKHN0cnVjdCByYXNfZXZlbnRzICpy
YXMpCkBAIC0xOTAsOSArMTkxLDEyIEBAIHN0YXRpYyBpbnQgZGV0ZWN0X2NwdShzdHJ1Y3QgcmFz
X2V2ZW50cyAqcmFzKQogCWlmICghc3RyY21wKG1jZS0+dmVuZG9yLCAiQXV0aGVudGljQU1EIikp
IHsKIAkJaWYgKG1jZS0+ZmFtaWx5ID09IDE1KQogCQkJbWNlLT5jcHV0eXBlID0gQ1BVX0s4Owot
CQlpZiAobWNlLT5mYW1pbHkgPiAxNSkgeworCQlpZiAobWNlLT5mYW1pbHkgPT0gMjMpCisJCQlt
Y2UtPmNwdXR5cGUgPSBDUFVfTkFQTEVTOworCQlpZiAobWNlLT5mYW1pbHkgPiAyMykgewogCQkJ
bG9nKEFMTCwgTE9HX0lORk8sCi0JCQkgICAgIkNhbid0IHBhcnNlIE1DRSBmb3IgdGhpcyBBTUQg
Q1BVIHlldFxuIik7CisJCQkgICAgIkNhbid0IHBhcnNlIE1DRSBmb3IgdGhpcyBBTUQgQ1BVIHll
dCAlZFxuIiwKKwkJCSAgICBtY2UtPmZhbWlseSk7CiAJCQlyZXQgPSBFSU5WQUw7CiAJCX0KIAkJ
Z290byByZXQ7CkBAIC0zMzEsNiArMzM1LDEyIEBAIHN0YXRpYyB2b2lkIHJlcG9ydF9tY2VfZXZl
bnQoc3RydWN0IHJhc19ldmVudHMgKnJhcywKIAlpZiAoZS0+c3RhdHVzICYgTUNJX1NUQVRVU19B
RERSVikKIAkJdHJhY2Vfc2VxX3ByaW50ZihzLCAiLCBhZGRyPSAlbGx4IiwgKGxvbmcgbG9uZyll
LT5hZGRyKTsKIAorCWlmIChlLT5zdGF0dXMgJiBNQ0lfU1RBVFVTX1NZTkRWKQorCQl0cmFjZV9z
ZXFfcHJpbnRmKHMsICIsIHN5bmQ9ICVsbHgiLCAobG9uZyBsb25nKWUtPnN5bmQpOworCisJaWYg
KGUtPmlwaWQpCisJCXRyYWNlX3NlcV9wcmludGYocywgIiwgaXBpZD0gJWxseCIsIChsb25nIGxv
bmcpZS0+aXBpZCk7CisKIAlpZiAoZS0+bWNnc3RhdHVzX21zZykKIAkJdHJhY2Vfc2VxX3ByaW50
ZihzLCAiLCAlcyIsIGUtPm1jZ3N0YXR1c19tc2cpOwogCWVsc2UKQEAgLTQxMSw2ICs0MjEsMTMg
QEAgaW50IHJhc19tY2VfZXZlbnRfaGFuZGxlcihzdHJ1Y3QgdHJhY2Vfc2VxICpzLAogCWlmIChw
ZXZlbnRfZ2V0X2ZpZWxkX3ZhbChzLCBldmVudCwgImNwdXZlbmRvciIsIHJlY29yZCwgJnZhbCwg
MSkgPCAwKQogCQlyZXR1cm4gLTE7CiAJZS5jcHV2ZW5kb3IgPSB2YWw7CisJLyogR2V0IE5ldyBl
bnRyaWVzICovCisJaWYgKHBldmVudF9nZXRfZmllbGRfdmFsKHMsIGV2ZW50LCAic3luZCIsIHJl
Y29yZCwgJnZhbCwgMSkgPCAwKQorCQlyZXR1cm4gLTE7CisJZS5zeW5kID0gdmFsOworCWlmIChw
ZXZlbnRfZ2V0X2ZpZWxkX3ZhbChzLCBldmVudCwgImlwaWQiLCByZWNvcmQsICZ2YWwsIDEpIDwg
MCkKKwkJcmV0dXJuIC0xOworCWUuaXBpZCA9IHZhbDsKIAogCXN3aXRjaCAobWNlLT5jcHV0eXBl
KSB7CiAJY2FzZSBDUFVfR0VORVJJQzoKQEAgLTQxOCw2ICs0MzUsOSBAQCBpbnQgcmFzX21jZV9l
dmVudF9oYW5kbGVyKHN0cnVjdCB0cmFjZV9zZXEgKnMsCiAJY2FzZSBDUFVfSzg6CiAJCXJjID0g
cGFyc2VfYW1kX2s4X2V2ZW50KHJhcywgJmUpOwogCQlicmVhazsKKwljYXNlIENQVV9OQVBMRVM6
CisJCXJjID0gcGFyc2VfYW1kX3NtY2FfZXZlbnQocmFzLCAmZSk7CisJCWJyZWFrOwogCWRlZmF1
bHQ6CQkJLyogQWxsIG90aGVyIENQVSB0eXBlcyBhcmUgSW50ZWwgKi8KIAkJcmMgPSBwYXJzZV9p
bnRlbF9ldmVudChyYXMsICZlKTsKIAl9CmRpZmYgLS1naXQgYS9yYXMtbWNlLWhhbmRsZXIuaCBi
L3Jhcy1tY2UtaGFuZGxlci5oCmluZGV4IGVkZTg2YmQuLjhhYWVjZDEgMTAwNjQ0Ci0tLSBhL3Jh
cy1tY2UtaGFuZGxlci5oCisrKyBiL3Jhcy1tY2UtaGFuZGxlci5oCkBAIC01MCw2ICs1MCw3IEBA
IGVudW0gY3B1dHlwZSB7CiAJQ1BVX0tOSUdIVFNfTEFORElORywKIAlDUFVfS05JR0hUU19NSUxM
LAogCUNQVV9TS1lMQUtFX1hFT04sCisJQ1BVX05BUExFUywKIH07CiAKIHN0cnVjdCBtY2VfZXZl
bnQgewpAQCAtNjksNiArNzAsOCBAQCBzdHJ1Y3QgbWNlX2V2ZW50IHsKIAl1aW50OF90CQljczsK
IAl1aW50OF90CQliYW5rOwogCXVpbnQ4X3QJCWNwdXZlbmRvcjsKKwl1aW50NjRfdCAgICAgICAg
c3luZDsgICAvKiBNQ0FfU1lORCBNU1I6IG9ubHkgdmFsaWQgb24gU01DQSBzeXN0ZW1zICovCisJ
dWludDY0X3QgICAgICAgIGlwaWQ7ICAgLyogTUNBX0lQSUQgTVNSOiBvbmx5IHZhbGlkIG9uIFNN
Q0Egc3lzdGVtcyAqLwogCiAJLyogUGFyc2VkIGRhdGEgKi8KIAljaGFyCQl0aW1lc3RhbXBbNjRd
OwpAQCAtMTI5LDYgKzEzMiw5IEBAIHZvaWQgYnJvYWR3ZWxsX2RlX2RlY29kZV9tb2RlbChzdHJ1
Y3QgcmFzX2V2ZW50cyAqcmFzLCBzdHJ1Y3QgbWNlX2V2ZW50ICplKTsKIHZvaWQgYnJvYWR3ZWxs
X2VwZXhfZGVjb2RlX21vZGVsKHN0cnVjdCByYXNfZXZlbnRzICpyYXMsIHN0cnVjdCBtY2VfZXZl
bnQgKmUpOwogdm9pZCBza3lsYWtlX3NfZGVjb2RlX21vZGVsKHN0cnVjdCByYXNfZXZlbnRzICpy
YXMsIHN0cnVjdCBtY2VfZXZlbnQgKmUpOwogCisvKiBBTUQgZXJyb3IgY29kZSBkZWNvZGUgZnVu
Y3Rpb24gKi8KK3ZvaWQgZGVjb2RlX2FtZF9lcnJjb2RlKHN0cnVjdCBtY2VfZXZlbnQgKmUpOwor
CiAvKiBTb2Z0d2FyZSBkZWZpbmVkIGJhbmtzICovCiAjZGVmaW5lIE1DRV9FWFRFTkRFRF9CQU5L
CTEyOAogCkBAIC0xNDQsNiArMTUwLDEzIEBAIHZvaWQgc2t5bGFrZV9zX2RlY29kZV9tb2RlbChz
dHJ1Y3QgcmFzX2V2ZW50cyAqcmFzLCBzdHJ1Y3QgbWNlX2V2ZW50ICplKTsKICNkZWZpbmUgTUNJ
X1NUQVRVU19TCSAoMVVMTDw8NTYpICAvKiBzaWduYWxsZWQgKi8KICNkZWZpbmUgTUNJX1NUQVRV
U19BUgkgKDFVTEw8PDU1KSAgLyogYWN0aW9uLXJlcXVpcmVkICovCiAKKy8qIEFNRC1zcGVjaWZp
YyBiaXRzICovCisjZGVmaW5lIE1DSV9TVEFUVVNfVENDICAgICAgICAgICgxVUxMPDw1NSkgIC8q
IFRhc2sgY29udGV4dCBjb3JydXB0ICovCisjZGVmaW5lIE1DSV9TVEFUVVNfU1lORFYgICAgICAg
ICgxVUxMPDw1MykgIC8qIHN5bmQgcmVnLiB2YWxpZCAqLworLyogdW5jb3JyZWN0ZWQgZXJyb3Is
ZGVmZXJyZWQgZXhjZXB0aW9uICovCisjZGVmaW5lIE1DSV9TVEFUVVNfREVGRVJSRUQgICAgICgx
VUxMPDw0NCkKKyNkZWZpbmUgTUNJX1NUQVRVU19QT0lTT04gICAgICAgKDFVTEw8PDQzKSAgLyog
YWNjZXNzIHBvaXNvbm91cyBkYXRhICovCisKICNkZWZpbmUgTUNHX1NUQVRVU19SSVBWICAoMVVM
TDw8MCkgICAvKiByZXN0YXJ0IGlwIHZhbGlkICovCiAjZGVmaW5lIE1DR19TVEFUVVNfRUlQViAg
KDFVTEw8PDEpICAgLyogZWlwIHBvaW50cyB0byBjb3JyZWN0IGluc3RydWN0aW9uICovCiAjZGVm
aW5lIE1DR19TVEFUVVNfTUNJUCAgKDFVTEw8PDIpICAgLyogbWFjaGluZSBjaGVjayBpbiBwcm9n
cmVzcyAqLwpAQCAtMTU0LDQgKzE2Nyw2IEBAIGludCBwYXJzZV9pbnRlbF9ldmVudChzdHJ1Y3Qg
cmFzX2V2ZW50cyAqcmFzLCBzdHJ1Y3QgbWNlX2V2ZW50ICplKTsKIAogaW50IHBhcnNlX2FtZF9r
OF9ldmVudChzdHJ1Y3QgcmFzX2V2ZW50cyAqcmFzLCBzdHJ1Y3QgbWNlX2V2ZW50ICplKTsKIAor
aW50IHBhcnNlX2FtZF9zbWNhX2V2ZW50KHN0cnVjdCByYXNfZXZlbnRzICpyYXMsIHN0cnVjdCBt
Y2VfZXZlbnQgKmUpOworCiAjZW5kaWYKLS0gCjEuOC4zLjEKCg==

--_002_MN2PR12MB30219865B6FE2D2723CC0A97C8510MN2PR12MB3021namp_--
