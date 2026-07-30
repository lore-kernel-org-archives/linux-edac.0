Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D6386C39;
	Thu, 30 Jul 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440942; cv=fail; b=qqRCgskKQ9Zc9AjCpmGtNzgHsT1VSml7hUnztbSkcYM0ofYjI5HWuByuJJS6DqVyc5rhT3SfBgpkRYE8RHCqbfUbnZ/TcMTX6HuBETjfhU873y41NIuQrGaGR3LrAWerDIMg9NCSXgLMQoOCIn+pcrF9Y5YiK5jO25I3d24Cxo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440942; c=relaxed/simple;
	bh=WMq+OlHH/GsVcb8l/x5LPouk4I5DpvuzflokInOeaMA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WyBkv0G74w4bV0QrjCSljevXjqHj3OjqcMtqbr5sxgqPc15TLZGvXd5tIC5wlS7DIzpidj+hRwIbmqNpL8gLySn2Z3QrzpGuhSH/qxPOyAkB4l/7mn5h9dEwoZdulOKG7jevjjjobCs8zzFI5NRTULR6AwsQwieX47lw/XSUUjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D1weVK0N; arc=fail smtp.client-ip=52.101.48.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D1weVK0N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHd7Zon+cPLHiBhf3SF2d2turFHY1GYNw3+H1NSj1Dp+TpNBxlQVQIZFjrZKC3McECZx8PEWeXYuD0JOQnRY/FThWi9uogivMSy5VzohqEKTUlB9wwjGpGBT1w9PVtmoFan01IM3kg1V1rlY6ZEx52IlSOqsj+OaDsD5BqDGD6p7JGbDPAttJRecusBR2vhkI/gFjvp+IN1qZeMIjM8WmkqEfZs3ZI+BT9/5KS56S438Ft37UfMeFgzQiUJGWV2GcSWmdg0Tzbu513YGsHQpQEJtjvw1B5O5erYw3iyWt0BTShzYxs3XUjPDJJ35CrlEcwKdw/zqgCxf0s9vv5Tc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWV/NWwYuvUXkU5NBm+xD16zOEY9l3NqTLXvc2ZBXKc=;
 b=o3RQwAeaMYzu9Ab6oOUkY3L461A5vnQwYwk+OiCy9/wPpNdO/y5MCVVyY/bXbO7iNVzVqH8ucsbvPxdTN1HrVVjPluYZG4eK4DO6dJYmvHT9yzvTY38wBH0FpiPLSvMT9bbZ671CIuKw31Z3+jKQFiPRDiUdsgGws3CkoDZW9uPAJnhYH7CQ+6DYKRfKpWp629wR7wRn0bmhGWJ4gtN/Eb4P4a4XzGiTPvfZWXSetDW6kh75FuGdI95aLyMHMD1jdw+tAlR5MQHkuMcuHGclU9p79eMydM9PbsnB9b84qWMsPrPolsfot5hXzMouRijp4epFJu1uX+1ihq8N3Eaq+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWV/NWwYuvUXkU5NBm+xD16zOEY9l3NqTLXvc2ZBXKc=;
 b=D1weVK0NWsz6Lmnv4s3xYdaEWPMUgTEvCwB+kEG1X4tV3Q3XrsAHePNcSqPsFbalSx6Xn6Aiktf5gMaqikHcSbLjhyppF4NKGk7yf1zU6X1V52AJZbPh34fcrxfknNLzmWj7E674zExXXEnXn9+U3PXX1EChVHGwB40FDw7KUTc=
Received: from DS7PR03CA0220.namprd03.prod.outlook.com (2603:10b6:5:3ba::15)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 19:48:47 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::21) by DS7PR03CA0220.outlook.office365.com
 (2603:10b6:5:3ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Thu,
 30 Jul 2026 19:48:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 30 Jul 2026 19:48:46 +0000
Received: from yaz-khff4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 30 Jul
 2026 14:48:45 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Avadhut Naik <avanaik92@gmail.com>
Subject: [PATCH v9 0/7] Incorporate DRAM address in EDAC messages
Date: Thu, 30 Jul 2026 15:48:27 -0400
Message-ID: <20260730194834.3203601-1-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DS0PR12MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: b1bbcf54-bbfb-48c8-8f84-08deee7391c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|18002099003|10067099003|5023799004|11063799006|56012099006|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	Vcd1+Qz53yCTWaDn1oZUuBNdp6TQCaRZmZY6jiYgsJqypSLuL/uC8fqyyi3q7lT12lmpc/bt5c9D/20+nrdXNKFEdTFLWPsbjxrwnRDz05qvcG400+3rlwVK7s9wW6GusWWC3Um/f+LlSCNERpMJ1fDnbzUO9tBQeaiqqwzwzKXLHVP00cE7d4yP3Oq8dWFpqwDXyjqFfSu+9G0xBaHCUH2izVsFecB4wYizpi5kAtp9LJMYXXqC57Li/XdQp1Mu2ZHiM4FKCGglCY/r3ys2M+Ieyd1RuggWCOBU1PmRA91UHdg+9NvVgNZZvKQwiUktMkZe5DD3zgahh/wGFVG3OItE1PsSj9Xnk4T6gOR3BxSCB14oZMhSAmn+ygQZsv1aswP/G8yZ6CweLo9n1BJ5ie+v68VrSoIHTLRumoeyCrFH9WFaBdagPTcjImTBvH1XC+bISNdzOWhGZJma5dcrGsy8XFDMAv/VTUKzeD/yMAaxTxzqKghDcohoYRQ6El9olut1G3LUJLCGr1D2G7Xohh6HwMkxL91ykqbZ3YVCRMsXH9HgFPnSxi+Di3uMWF8rJxHi3U4MhQ5RCKVLywL3AgQsd4AeZLzuxV+R3ZDPinwMYPVD10bOOUZZZpEKpoi6WMaZG72CwiodTV7sEZl/e1AAzX/pbUdG5F70Tj3A9KkdaYdNZ/tkzrNVK1DEozFB+JjS+PDWPQVeSjMr2opTZg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(18002099003)(10067099003)(5023799004)(11063799006)(56012099006)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ywK6yVDG+hWrfUmz92yZUVOISA/02JHzZfq8GSUFiDbEcXwniwaUdRPygwoehachZ2v0Lobtjk2OGY6pbaIQkZIoZemwIbyo42AHXPpe48HEWtQr4eZvJBTcrhe8d9H/Rc+6uvLYENg9YDGlJyYlyRuhEu1EJRPWmKwsS3YuLuo1DG6nB8clyS2pxLwRD9ZS7AFH/zONDG+bcAO/mMUwi/9/ryKRPA6g2q0XyWxlQNkXYAqt9wJ7vaX7FTFTKqpASSshxqC+dS+Z3LEezuSoFtb2MaDYFbaCMcIZim8C7hWwTStuLpok+Yn1x8y2ZUpkKZuA+0SnXvhUwYmkNwsoPqL+WwawIUCSSAfZZtZN7uLGE3CeySVmtltfR8e5sg+LVd01ItZQnHt0HkzQ5Tq7RF09qAzihb+ZlV8EYFUfArHxw74X3l129ktWXy73D4U4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 19:48:46.6718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bbcf54-bbfb-48c8-8f84-08deee7391c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276

Hi all,

This revision addresses the Sashiko comments, and also includes some
other minor fixups.

Thanks,
Yazen

Cc: Avadhut Naik <avanaik92@gmail.com>

Link:
https://lore.kernel.org/20260727212045.1810480-1-yazen.ghannam@amd.com

Changes in v9:
- Treat -EOPNOTSUPP like -ENODEV when PRM support is not built.
  (Sashiko)
- Document why the PRM handlers do not need the MI300 address
  conversion. (Sashiko)
- Clear the completed-operations bits in the translation entry points
  rather than at each call site.
- Narrow the operation bitmaps to u8.
- Note that struct atl_dram_addr mirrors the PRM output buffer.
- Widen the subject prefix of patch 4 to cover the EDAC changes.
- Reorder variable declarations and reword commit messages.

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
  RAS/AMD, EDAC/amd64: Use unified interface for SPA translation
  RAS/AMD/ATL: Remove the standalone SPA translation interface

 drivers/edac/amd64_edac.c      | 38 ++++++++++++++++------
 drivers/edac/amd64_edac.h      |  2 ++
 drivers/ras/amd/atl/Kconfig    |  4 ---
 drivers/ras/amd/atl/Makefile   |  3 +-
 drivers/ras/amd/atl/core.c     |  4 +--
 drivers/ras/amd/atl/internal.h | 13 ++------
 drivers/ras/amd/atl/prm.c      | 32 +++++++------------
 drivers/ras/amd/atl/system.c   |  4 +++
 drivers/ras/amd/atl/umc.c      | 58 ++++++++++++++++++++++++++++------
 drivers/ras/amd/fmpm.c         | 10 +++---
 drivers/ras/ras.c              | 31 +++++++++---------
 include/linux/ras.h            | 46 +++++++++++++++++++++++----
 12 files changed, 160 insertions(+), 85 deletions(-)


base-commit: 4020f22dccb18f04ace6c8481dddc01603d21173
-- 
2.53.0

