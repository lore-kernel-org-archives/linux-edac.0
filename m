Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25140A93F;
	Mon, 27 Jul 2026 21:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785187262; cv=fail; b=Hd0dsMF2MWefjl1FNlqTOEltFs9LF9veXi56oXDmH/sgyIYjaBo4gVtFVHDMwAlVyFYcfG7Ln+PCiCKxvMn24pfwcVDEMKT+EFu210u5bKvl8qW7cy4HP8pee5KJOKtOCu4FXTaW1suaqgQWChJJ67y1z7scIxPRiojsPDBl1FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785187262; c=relaxed/simple;
	bh=GrYXH79D1l+EZG7RNI9rKDp2LoXdLcvlfoOx4CUVIgI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S4U9OWM+kdslqyqvKxqTik8+I6GxsGTJpJYBrBJHbaE5+O9uqbMfMgc+3UfK7Oxe9Z7hl4th6r0Ic4W5If/nctjdYcLs/SPH6npTt+MOuKbLu7GcjBUlaG8/dpr9Tzyo86/pyHKk+U+EX0feHw8Tl9NkSA5pJt5MuKGDwp8QR80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YW+p2cSE; arc=fail smtp.client-ip=52.101.61.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YW+p2cSE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz8S3rsZCA/w9Bpu904pH6DUgDEMEqoEJ3hAaaFt7iKYl6ws/C/IE1rigBo31QVyATSI+OxmJU5OLMUvnIO5ZSRkLOW9bZxjg6afrhOjkhipDRhNuj84R5UgEPsZXyNBWfzf38NKzm/ASBhrml2k9SayfbMg3W28U20S8XLdKulU65YG+DFzsV6hiArCZXHx17yKVvAPhSoTAAF8LQ7iC0kd1ItqCSGG7J4mwSer7LhgtQfYZ7bdU7odsjdBC8c8ZGgB5/lG/AbI8V+KwvwIzRFNDzqB4oloyICHuFM6PjrB/EclHJ/A837wv75FZofkZYDWLV+4Eqcn3tc2huqZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2evN/Z5pKYhKfYV4+IOlRDP9ZTJ+FuW1aIvs7tjVsPc=;
 b=bGpiBRU4iNGCd6pRZ3b7ovWjQb/62dl82au3/vBsRJbzGK6Ok4cujQEoKCwJp80fbamgYMYRJ9xI4yIBd6rr5G/TUyPnUaDvICfCl0joZV3xFs2voXjAIaC0vmIYv7xEyrXMqbEOhAFrEqDyn2g/+cp1yRuf9/Qhnd8p6lbY+u48ujulpTLtXzy1nNYc4VSYYNzf2TCuAXRLSB2pZ9CSWjRGIgmbpgslVEAJy84Xn6/tqdOeNDr+q4Ff8EGYgdxlxrAd6QQXM9yAx82KZ0s8uK7kNq15DuoN+2ry6w34Qo8FkmobSFp+rqlPZjUKfyFJCuR2rzDXLJPPG08IbJ/vRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2evN/Z5pKYhKfYV4+IOlRDP9ZTJ+FuW1aIvs7tjVsPc=;
 b=YW+p2cSE8DorxUodGP5w6Zu9HhcEq9OTVa8TuWMrxXrvCZlaujXUfsZk6yi0LG4eM7LcOyd2ABdAKmJ2iEgFgixSoO3aM3l5Hf5wJT0wrrFL9iobMc8rR3ihTILzC7QiTpRIM/MzARWlK9X5bCDzKbF0r0ZxS70l02KL6bgrdVA=
Received: from BN9PR03CA0493.namprd03.prod.outlook.com (2603:10b6:408:130::18)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:20:56 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::4c) by BN9PR03CA0493.outlook.office365.com
 (2603:10b6:408:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 21:20:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 21:20:56 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 27 Jul
 2026 16:20:55 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>
Subject: [PATCH v8 0/7] Incorporate DRAM address in EDAC messages
Date: Mon, 27 Jul 2026 17:20:38 -0400
Message-ID: <20260727212045.1810480-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7f273d-c916-4168-9524-08deec24f29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|11063799006|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	2WapzFjP35dAy9xpv9QjIoSWvkEcjmqNsnoW555nWISSiyCVUwG9S4CzfXXfyHYyApk1pjIuUmtSbLAY0ZrfEr2tfiAn8jlA1JYs/1HJomc1ehMXV8+Nbhhj2CdsdThRHlbZUAy2qHIBaU723Z7yPmM/P3YmDcNL5wvl5QDX+y8vPFzGl2ksmhBho6dEnoLabxPWjX3ZafOL3rJLoa42RotniGQXvpxAme6fyc35zWwLxD50mMAl5mI4mSCIdpCnmiG6tSDLrSwTAjNFJFH8422tRx3U6H6BQrojVD3TXk1w0CZFZBkhvgup7d/3xKzuZmwy0sL2gkPJJHFOsN65vYARy9vHp/IRsBa9kC0opsOZLJIg2UYS0O8rB9OznQ+jNQWlq/kNsv40BQEO7agM6loIeI05BVdwiydETSNvsd0+8KDJl9ZIcWg++gaHvCxcbFdUZWU6rzClyFH4NnHlF9Ims8DsReobF1upZJyjjid8G1/Ov1Ub6/PUtE9GBkWZg9KvzdP2iIvu5ogDXZ+4dwM0l00R3JOs5ErRLa+Er03Cb1JjW8FWCQzzD2RjNbOouudlcHRTTGlDJUl48twMK/hJo/FaSAdx1RjlFDcFMU2dcJd3/z+ZkePvOU+U+VYuYCp0hGf2WbQLYlOZgAuQPa/cE5RlOCrWGH2CcbzpeaSy2lnXSaQ7aZKVKfiKOqyjg7+7x4QxIr6BVMNi7/OGwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	of9TzaIrMk4VSsx8XgWGQfb8mr8nMIqD8aJKBtXUGHKIDYVBsWX/EX5vodd+nN4kDXT93HzRwse4dbI1JmKTQJwlqExogQ41CdcU5G/e3xdCe6TrQXh11b5ncsSZ+f8ObxUflpSid4B04t8JFWv5Tk5m8w0IIZzyUlFrFe39fAqlNL14LeuC7fZPGsxktHgOYtHGpyAJhPgFH1bgiT62C2yYht0GSeQcCbdODXtwWuNsvSliRkhslJtYblDIgE3m2Bb/92d+yC8WemwE1Odz6qgs4G9AXT3worttEe13QpOO3BN4bzhdFPzN7OCtbKFOwTxUT20USL+plIi9y1qtwpSxE7nOmYKnuvI7Mlzyzx7yvdHcC+mkTODjlC7qpwxCmozzuUS9crXa5DQxwaHni2vGd0WUoCCPdcRC/nB6SS3AeCFemZ9ABlV6FyEH2aRZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:20:56.6233
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7f273d-c916-4168-9524-08deec24f29e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791

Hi all,

This revision includes a larger ATL/PRM rework in order to have a single
translation helper. There are 6 UMC address translation PRM handlers
defined today in the AMD ACPI Porting Guide. With this set, we'll be
using 2 of them: NA->SPA and NA->DA. There's a use case for a third
translation: DA->SPA. This would be used to convert specific DA values
to an SPA for preventative actions like row retirement, etc. I'll do
that in a separate, future patch.

Address acronyms:
  NA  = Normalized Address
  SPA = System Physical Address
  DA  = DRAM address 

Also, the "function pointer registration" is back, since that is what
allows the library to be an optional config. I was reminded of this when
the following came up recently.

  4c3da04827dc ("RAS/AMD/ATL, EDAC/amd64: Only load ATL when needed")

Patch 1
* Removes the AMD_ATL_PRM config option.
* New idea in this revision.

Patch 2
* Rework the PRM handler wrapper.
* Based on feedback from Boris.

Patches 3-5
* Bulk of the 'unified interface' rework.
* Suggested by Boris.
* Basically, a three step conversion:
 * Patch 3 adds the new interface.
 * Patch 4 switches users from old to new interface.
 * Patch 5 deletes the old interface.

Patches 6-7
* Mostly the same "Add/use DRAM address translation".
* Updated to use the new interface.
* Minor formatting and miscellaneous changes. 

Thanks,
Yazen

Cc: Avadhut Naik <avanaik92@gmail.com>

Link:
https://lore.kernel.org/20260630210640.680758-1-yazen.ghannam@amd.com

Changes in v8:
- Drop "Directly export address translation helper".
- Merge the two PRM translation helpers into one. (Boris)
- Build the PRM support unconditionally and drop CONFIG_AMD_ATL_PRM.
- Formatting and other small changes.

Changes in v7:
- Drop fake_inject patch that was already accepted.
- Remove function pointers. (Boris).

Changes in v6:
- Remove fake_inject interface. (Boris)
- Add two more values to 'other_detail'.

Changes in v5:
 - Address a comment from Sashiko in patch 2.

Changes in v4:
 - Drop a "handler available" check in patch 1.
 - Reword commit message in patch 2.
 - Reformat string in patch 2.

Avadhut Naik (2):
  RAS/AMD/ATL: Add DRAM address translation via PRM
  EDAC/amd64: Include DRAM address in output

Yazen Ghannam (5):
  RAS/AMD/ATL: Always build PRM address translation support
  RAS/AMD/ATL: Refactor PRM address translation into a common helper
  RAS/AMD/ATL: Add unified UMC address translation interface
  RAS/AMD/ATL: Use unified interface for SPA translation
  RAS/AMD/ATL: Remove the standalone SPA translation interface

 drivers/edac/amd64_edac.c      | 38 ++++++++++++++++++------
 drivers/edac/amd64_edac.h      |  2 ++
 drivers/ras/amd/atl/Kconfig    |  4 ---
 drivers/ras/amd/atl/Makefile   |  3 +-
 drivers/ras/amd/atl/core.c     |  4 +--
 drivers/ras/amd/atl/internal.h | 13 ++-------
 drivers/ras/amd/atl/prm.c      | 30 +++++++------------
 drivers/ras/amd/atl/system.c   |  4 +++
 drivers/ras/amd/atl/umc.c      | 53 +++++++++++++++++++++++++++-------
 drivers/ras/amd/fmpm.c         | 10 +++----
 drivers/ras/ras.c              | 31 +++++++++-----------
 include/linux/ras.h            | 44 +++++++++++++++++++++++-----
 12 files changed, 151 insertions(+), 85 deletions(-)


base-commit: 4020f22dccb18f04ace6c8481dddc01603d21173
-- 
2.53.0

