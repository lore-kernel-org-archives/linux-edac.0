Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247D1A2392;
	Sat,  9 May 2026 14:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337489; cv=fail; b=efEIrFZYJv7nYmq1kM0LNCIg6fqelRH1uJDacAPXtpqYzoAC8LZjLPexVxXiwzt878ZhuNcCqZ4MMJiuSHFIyDcN6WHjHv1pkrwDKrSH8wm+wqkBYdEOrcDbEHul4QFQPouZbB/X5yDpKgvmFr3tHnk+Wgw41uYACuRsHujfuuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337489; c=relaxed/simple;
	bh=YWa1xQWp4j9KiOuTC2yJa0R2w9QGg1iX1h02Mr+0pHg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZR4EHKSn+1Dkxp8QgGsd4Ng/mN+rz51sEKJOntSAF2egR1R22zRJYzAvIawsA6f1SyYk284i7aKniKkhL2NWPyXLabdiCf5iFCayWz7A/lD//QlvtdQ6tsTzu0Pnhv9stCt1d2B+jj6dcDvii/MsIQ3h17+QoM3CNs8U2t7lbw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=tsSci8iW; arc=fail smtp.client-ip=52.101.48.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="tsSci8iW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5DHpgWy+gsycL6Jjb/J5jIVOU/02oE5md9WVfR3057RJiOyFjgkxUFh16XE7ytqSXI7a7QOQsZOLcnqbGvib2PEzFgZY6q6zE/y3ermjb6SF9JBF3tgxA1igdnKhdJtur9Fook6nDy8p9env8bUP98VT7g7OeOOAnR81nqJ/dZXnTN0tZJ11YyAEUKeX6DTUuZJdtuscQ/IQAJP01b/PaOjh44Odknd2KHxRJs5+LhbiEKSp7VzGUOVl2W7zuO9LM+QtALwuxh9SVUC0o+t2tItWld1ZQIhi3fk2W61R8U5UXqvYDsAdqvhyZ5Xmuksdi8y1hXb0QBNA9lv/1kk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87WZK+0Ki+vIwya2tWprlTatpImM6jAj+om89wKvpKk=;
 b=fzYcn0CT8zLSbtc5EFLpzi0hnJHdSk1yzGnxzcrF+zkE5T67l9NIVTclklh4vVWrTQRsjRVic2YHXENnSxNl/OfhfvZlwQcyTEuifg+fXowcgEEkU391V7IFTPzlTYH4uxwyrUJDic+GnTY9Y8SdTG0V3BeojJ9CFqgEKSpTvY85ibtWj1UnGMPBcMyeqtg72uvn0tyB+uPiJfd6gp6HeRiywBjnaPJGdZlye+bH7t6N32B5FnWNskDk6sW29TfU3ZSmdDrcl36E6xmP+vzdfp+h+jsFSeZpbvjj5ApK1MOACzA9bsKWuQ3+gwo5jVcS82MKKwA+uaz6WmkuJfbYhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87WZK+0Ki+vIwya2tWprlTatpImM6jAj+om89wKvpKk=;
 b=tsSci8iWtJtjxdmDELLzL26WSbrk1LgDO4l1f/7Yi1msmxHosfR8QX/NdGHAs+He4vA2La2Q4+HkBJ6CLvIjtrO5z7u2i0Iv/ssq/JpfQccpF1sVPA0dYpuMUQjjJgWmtXEcyWvqc9LmFUFeDt+YkBjp/Ph7CPUheuSvOY1FCHEJpT3vqKdZzTmlhh2gWE/neOMc5omMSMyogoFmZGtFyirmYZNldqrCSkGkS88RH/1YQQZ8naPFgPTJXjNdzWCFPZpW5T80i2LOcez9fcpU10B7+1nv+o9Iu1ClT7u4gS50EPc0hxQFpRJcFzPQcd9hEhynfTFoeNR0VjAg2SZedQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BLAPR03MB5379.namprd03.prod.outlook.com (2603:10b6:208:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sat, 9 May
 2026 14:38:05 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 14:38:05 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	bp@alien8.de,
	tony.luck@intel.com
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Date: Sat,  9 May 2026 07:38:03 -0700
Message-ID: <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0126.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|BLAPR03MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c079325-da19-4543-a969-08deadd89485
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	m17AHsT/39OPEuqxtagjXPhYqjaRj0GraCsLQ6IDfMPv5W2FixTBYn+cyzLyZFMI3aZeowA0zjjaZK04ykrRCJOlAwwA46MEZM++23bgcDl5xBxq8d+aZt1EEfkHugmoWGAXjMYY/5NLu7KOjPOkbWyGKLZjGxojsHo5Xq24PYWpvKf4LETd/bldboDNCLt3Ijygy0ycQxMxJzNJr7tvUs8d8Nrwti0/ZXLUAGgEg2IbI1wYDyNiIBHfcqzR9byX3bIOxBKqI1QHk4wGqRudJaFSjYAKOXl7VirfBVfqASuw+mmSGvPj3+Jjn/RvgbmcMGI2UBJbcMzNXzUQUFmJ+820MGG2oXh1VALRnGTv/6uKMPY6Ol1M3dJXpqmNU30NHK6NXVH99QU53WBVG1Y1G4otOwSrTcjGwxToE+cdOxvbxbw8fAja64LpeF5r73eulcH9cJ9gWdiuFewHtinfT8Gga+g4dvrHmTFo8RZrY6sxaEefCnzQQLL7jISteREPHKOFgDpdmElo1pCElN3k+Eu3OivUmV19q74De/ehIW15fBXfDvHPXKhnlhGyjSAVzrrHoinJBXClnGSrZq0QmibAG5IHm+wgso1dLRTUu/FRBi/m2AuAH85LGg3V+jtiQIJnOk+P7qXzdkuk48tx0buUPNn6MeihyhUGssSQJ5SUHeKH5wYpmHImNTvepvlU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qwIcuhLOhgZy2IMlsB8sATb6FtWOZJ73DLM5Y/EeW6zo0CrVQWXTB725d4SG?=
 =?us-ascii?Q?UTxByM+JJ4vA+Shah9IK2PtBm+YQyKFxo/qDxA/U0/XI+UJ+j5dSyM96unhp?=
 =?us-ascii?Q?uO/5EgptwukCc5D7ceXD9lo7ISFWI9vRcVxXaH2Lv1MTr/hh+PivG+JQ2jjA?=
 =?us-ascii?Q?ENUMca4+a8wy4EmC1LUhkykx/Xz4iaI6HtSTZ55+trL+OdZlS7imIIqcLYCy?=
 =?us-ascii?Q?bnU+I5EdRxLUff39K9TSjFsR88Sch4tVLoBO0FVgKcSZwScv2eLF4YDtkmDA?=
 =?us-ascii?Q?J/9l/sXcPcHFZymQoDJ20KsC4pJgE5H0+6C0qkU5M+AuF6cSAuQrsn5vChi7?=
 =?us-ascii?Q?rCuy4BhDXKH6S947nvYBDuY1UC5k1pgb7MQiUQcij978m9Jdd/UyEHajJJd1?=
 =?us-ascii?Q?92e2HEPWrPPSN3kIoBcH65ZPcTvbqbQxnP4VCH6XGvTRghCRXfoiF/qUds3G?=
 =?us-ascii?Q?7ZAYtTBs8Cqi/Idyez6ql/rPWkkftiQPFTNHc4Ev6TEiZPCA2Le5mKpgtMfS?=
 =?us-ascii?Q?8O4a7f520akdqR7GW+t9a0DH+a+/2EVJ+dEaow2EInFon23PMdbk/KEr9pjC?=
 =?us-ascii?Q?mrK2a3P7qp7ij8nDCsHlWxSjOLW4iAGPxQHgb659QsTpvH8saQzM43k+FBgu?=
 =?us-ascii?Q?pZoM6L0eDqAnRJTd9bh1LJJyqgcqjeaWGftJFj88hAvgRvdG5oipAU/tBnWg?=
 =?us-ascii?Q?o1kCvv9wZAo6NetrtGJlQAqA0Xb3vSAyN72TbaYn8uOZ4BgOeXL87Ks19dLN?=
 =?us-ascii?Q?U4Bxvvuw0h/OigADFrKi0MVZWcO2iTJnff0/Ea4DTMCtV4FKvfouPXOXu/d0?=
 =?us-ascii?Q?WCuOsiq9qo8d35j19iEOSyraW89/8ppPkRg68p8COkdAAEWwQbp9anN9GwDl?=
 =?us-ascii?Q?BytD7vrLZvypwQJwDflojgIkSCxmy88L6xToR2J1ewsRbp3b50SbuIcFkmEY?=
 =?us-ascii?Q?Spi20oMkbZkWcCL4lx2rBRs8pnrN1rqVIINyyfeip2kk+d2U6vQwlLqXZXnj?=
 =?us-ascii?Q?qA+bpPyTtz//OJRtjG32l2QAQEVcQ+s+gV/UNpZ3wvdY2EHDJI85NHPgijmz?=
 =?us-ascii?Q?6RXaLKW5BEY3XDWNf69GaF/kLnW+PuxbGAWpkEbHQtFqVTefTKIpFGME1d33?=
 =?us-ascii?Q?YMYErA8oa8wq6gxMUPV6NKwzpXOtNXQU989HNtsn1rSnxV9woBYMQSQocGNe?=
 =?us-ascii?Q?Dj0UU6FyUGUY2iQOAAjEayORtHQdjDO6MemWY4OLLd7BRSnybqttWoJEiDky?=
 =?us-ascii?Q?Ok0wSK2XtMs1ozSe+oJFnLmVwFRxdB2yFL4tIa9seCgU5ZfhXqEOpjWjS6kv?=
 =?us-ascii?Q?K6VtgEFdy/Jc5SS37ToqW/IIidCzPfoLnngBWn5sLDeUbcgakMaswcybKT+p?=
 =?us-ascii?Q?nzyy6S/w9tIHNPHF4P7j8G7i3mXzTVOAOfxrVQ5XyOOTu2mZ5Q/LDrfYZ63V?=
 =?us-ascii?Q?cZPBnzvFGtuHj9P5Dwww15Mo6WusepOQybuxUR1B5CyG7yy/xOAudz+eF6IH?=
 =?us-ascii?Q?U8AY4tzaAyoXxCfI+HrV6b1q2lZ/AYbUjMcw2pVzxPzk6IphAyC8SKyFH1GT?=
 =?us-ascii?Q?xp8NOftpdy+azlr2iURNYAqt/uyWeNv/M2PZay4LkgjDaTg6ZS18uDLZ71pz?=
 =?us-ascii?Q?cflU4hwdZK4qeuYBZpmxp0r+P+UNJ/RJUwVmL1zDHQMStHaGnanRYgAzG7n5?=
 =?us-ascii?Q?WN4IExiuu4pqPhvneM1r48KWKQppfSkQaKOx3stCuUZCCZfnp/2mPAjCram2?=
 =?us-ascii?Q?crNqnUhJCSWE+rkHzfv43TS54mgQ+l3uSoeUZqjGZ7W1/mlMGHZ+/7pN7QtN?=
X-MS-Exchange-AntiSpam-MessageData-1: 3JujXkWchbQ4yw==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c079325-da19-4543-a969-08deadd89485
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 14:38:05.3142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVQEZAeCgiRC0N4ql2chKo5AzLqOmYTzndyXnWUfR+L9AQYVDCGw5UCDckAh2hoLjXrXjAzt6B4+bqEKb3yHtblILw9cy6y0ZEr6vokORHGMFrk/81TNKtG84K2dssI62iG6bc8CVk7WEkZot++Myw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5379

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

The OCRAM ECC is always enabled either by the BootROM or by the
Secure Device Manager (SDM) during a power-on reset on SoCFPGA.

However, during a warm reset, the OCRAM content is retained to
preserve data, while the control and status registers are reset to
their default values. As a result, ECC must be explicitly re-enabled
after a warm reset.

Signed-off-by: Niravkumar L Rabara <nirav.rabara@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/edac/altera_edac.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 103b2c2eba2a..9e6a9786a881 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1186,8 +1186,14 @@ altr_check_ocram_deps_init(struct altr_edac_device_dev *device)
 
 	/* Verify OCRAM has been initialized */
 	if (!ecc_test_bits(ALTR_A10_ECC_INITCOMPLETEA,
-			   (base + ALTR_A10_ECC_INITSTAT_OFST)))
-		return -ENODEV;
+			   (base + ALTR_A10_ECC_INITSTAT_OFST))) {
+		if (!ecc_test_bits(ALTR_A10_ECC_EN,
+				   (base + ALTR_A10_ECC_CTRL_OFST)))
+			ecc_set_bits(ALTR_A10_ECC_EN,
+				     (base + ALTR_A10_ECC_CTRL_OFST));
+		else
+			return -ENODEV;
+	}
 
 	/* Enable IRQ on Single Bit Error */
 	writel(ALTR_A10_ECC_SERRINTEN, (base + ALTR_A10_ECC_ERRINTENS_OFST));
-- 
2.43.7

