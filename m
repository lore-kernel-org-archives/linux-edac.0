Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A22489897;
	Wed, 29 Jul 2026 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353678; cv=fail; b=bFaF6KIAPf9BiUWCGm3ZIIrSL3qEpThMpNNGkfSkAIP+on7b6VtJ6XvJiPDUm5BPLJJhw5frrvsZzlY+HelehlozOrhC/MOUXNbObnbiKawl124Kdyz9P1o9jeTSOeKJyKyDVPssDpiVK/s/aRjUISQKGmI2yBRjlz8pSjp7Wow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353678; c=relaxed/simple;
	bh=X/8zxrAkglQhkC94DhcerE30D9zaQbN9Xqbx+8hVFdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GvmTO9Ajrs/JhLbZBMFjRS59DipMXTosq0WCdOCPCsdhTuSqRJ1GFBNT64pxS5VpZKfQX9YZw6l4omLkOug11MiG0dVnVfzMXXl1s9O5pnR435yoXy3QSLER9nSjlxxHT8B3s4t/VM9slTl0uIh+SoPqioT2Ncs5hrLpJZI0wiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bS/fXaXl; arc=fail smtp.client-ip=52.101.62.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bS/fXaXl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sp/3jVrrj+uqERcxBDEZbQgu6/gxR/dXXj2oaT6XglOpdKc2b317DfsAPnXBbD706j6OTQWk/HfEVP2ChXNRFjYNfMIxVef7LN4wU216LgBaLJX/JBrcjnQ+4HOgdD6WmCwgvCXN6KLIc0qzf5qFJeWvTMe/ay5LOKFlk7CaH+Dc4NJhJNnl361Zdvcs0EoimfWQ0L3Y7CNiN/g8yU6suiHAabqUhp2uvnXi+ALAZbZB4YXG9sm/PtjKzEx8kzr7yl1Ti+EqEzhITbMrIZdfCYK9IdcynfFjP6ijBYbmLhBLwSz+W8mGwqzrliw67uOdWmervr+Pp/y9UPCC/rwGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjySqCmlZpYfgFO+7CU60RAME+A8G80j54QyhTBwwI0=;
 b=oA3Gz7Kolk5zLwU3uXuMLIG8LZCO5woPGef7j7uS7Uv9xtyPYsp9Yeo+CVEo8aJ3VmlxK8/W7tLr0xh2Ls36kOLZYtb7wd3JDoA+iC6A3RHTOmc2F/T6Q7Pm1ip8dOG/hWs+rTrgG7ZeqLILJgrL26GlC2wJNmoHlQGKmInT1Hjj3giYADiTHMSjyBQ+BJ14de02AFE3eqXXMNFCgDO/HLZUNI9fJ7+cMqlL1/PBWEA/8twwAGbnmntASagNFarxNZunSbNK0DA8sNsKIRidRX1tMprdw1dudlGxvWMFGn1M38zSd0LTsDFnda8qLkcbxVH0FkyqqoIJJnXTNfTw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjySqCmlZpYfgFO+7CU60RAME+A8G80j54QyhTBwwI0=;
 b=bS/fXaXlNKjaxIqoM6CFpky95VDn7rPnYLaepeiMUpCp0ba/QPyY/zFWnVrajOsXKDlv1vsO3Xffsj6IbkJKwp1yUhv9WpiyDAIzmdUNJ4TGpNVBsnN8V1Zr/YysbJB5jx2e6RWxJlmgCbAxAlT0NbEae94eTaL2kdyvsVaUWTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Wed, 29 Jul 2026 19:34:34 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 19:34:34 +0000
Date: Wed, 29 Jul 2026 15:34:27 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v8 0/7] Incorporate DRAM address in EDAC messages
Message-ID: <20260729193427.GA1977085@yaz-khff2.amd.com>
References: <20260727212045.1810480-1-yazen.ghannam@amd.com>
 <20260729014410.GDamla6uSQ-ihlCIL5@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729014410.GDamla6uSQ-ihlCIL5@fat_crate.local>
X-ClientProxiedBy: CH5P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::23) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db9e552-632a-4547-7152-08deeda86b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AkKeIYhefWkSmTbo52fOBUnbNcO2kjWtjGEIq1hT/Kuu09+/XdJotuuWDu3w44V6lvdZSTkOyURrT2q11HkvGlgpZVtVJS+G3ju0lYgrL0HOjrygjCJRTX8hPuUFi5DVYl6GhdVqQxUvmY6X72BT8/J3oGYMnYtqepfP7XHt06xUnYFZ6FWrvxmDTrXmiDxf+48gd8oNVQ4hNiLRO8MPaTYrHzU8FF3s6VGRzrXPm2GYlQ9jeV1IqWzUufBY6szuYtftDP7ffDbPtyr0wUBlkuu1/VDdRck3hWJ/KJRI9RB5W8peQZpBiVNL0O8urH1QVKduH9gZabsqVrIfL91IrwAds6ZKdjtAPehXL7ECIGGZsBcFhfkP2scrbAW7AFbwUi3hsrwCUE0UAZ8cJPsnrAF6j946qfi+MpqwOAs341bj5EOJ6AtYCuxbjtAiNXmArcajbeD7uaj4IrZKhkTLWZhC8+Qfvf2SuP0gr+7GJwa01FaXjDAYLdvl2QNgZxQqNw1lwdokChsIjFT16mK6WOdHpGujZBVWEts5VQBy6zD3EmRp9uPonhGWO2iaCgZ3LekZ1A/Deg0730F2VuihRw8JWR7o3Br98HeMi4gXG3o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3KG+BAQ1Uebu59BLOLK8e3VjGWcU9iJkIxLnnWL+/ByI0ZJIDtaGmT8UkkLE?=
 =?us-ascii?Q?moIOSPhsicuPGL2/6xubAN0lklShHeMjRwG2qSVetODT9a9+sV0R1e/9ZQA2?=
 =?us-ascii?Q?YuI/1T7K1W6ozRI8DdmHgTvy0MblwQXsKDWjhjrE3ais5tGmA8Xywk7hj22X?=
 =?us-ascii?Q?SuMTOtAfT1zMkuJRo4VSNE91ug5nR/2b9zsejYAlvvRqStBd43/q/+KlpIa1?=
 =?us-ascii?Q?rEwjqzejgTrqMJJC0qXE7AwS1azwUYfTt/hPc+zC0vN+eT2T9FpmR9aGK3Ew?=
 =?us-ascii?Q?qmUkc+Gb7LPkttbuDlPYdNvZWqN6V8c8FVsH8/04rhg9BkO8QdnYFnk8F5b3?=
 =?us-ascii?Q?46eLFeTT2c2Jzm9EgGt83gSMPX7WnGKNn5FsvQhfiurGntn1owlgm/Klw7SG?=
 =?us-ascii?Q?hmxt6BfEDeyO2mIIzF/DX2Vn1C6t1pmUzTpe202q6h2OmhhhL8Vch1MhF8hL?=
 =?us-ascii?Q?s+FIgauePAzMTSlcGYC81UBlQHbfzTXzQ40xtrHmz31Bunr6379zUrY2kCnV?=
 =?us-ascii?Q?Qa22F9v+UIvZP7eIKOJZyent6JT1sZWtvnzjPHf24H0Q2p46g5Tw6GH71fOL?=
 =?us-ascii?Q?hwy0Zeb//f846GWwqPbUduK3WyZ6dm9faXIxqsrM2ohC/O6lqKueNPbMQbDc?=
 =?us-ascii?Q?wgdABL+URm4pYumwg4EojF+YYUwmGthYWvzXXPyA77XXd+Pfeaic016Gs17c?=
 =?us-ascii?Q?7IC4gPyaovbqADVeusex2bdxwHJyJhXwN7NENg6he+t7VdK+IxRyPlaGv4ot?=
 =?us-ascii?Q?YCnQWCDyp+dOmfOFJjHembuC2cIO5eO8mVZOXUC1MY4xvFmnGsf2fHi1GKSH?=
 =?us-ascii?Q?GQ35xUrzaX40qZf7Gr8f6Ta1UYEgAE6vH9J6nYMZYJca5zr6frVhe2CSnE3u?=
 =?us-ascii?Q?XHiq2OEtgqk+SHhCnE34wSc9lkVSVhNQNPiLgyTsLV5LVy/9KiTz/tOt/p+7?=
 =?us-ascii?Q?EjcelSSGRPhUao6dk6IY+TfvEl9J2YyfWMryOhgNbhMC2p2HxPMQmeeUOdAO?=
 =?us-ascii?Q?oU3lt96X5BzH97qpcPcjnWiJYGsdrQoSgGaFp77O8IqkEotOVpna1bbsNu4i?=
 =?us-ascii?Q?BfrqBjdgF0m8mbnQAjpfTputvGCwmDwB7m7nMkMtWo67sa2ilvK3x+GfSX5c?=
 =?us-ascii?Q?4XH93xX1rcgWfyFvbES0Y5muW1km1B5Ac0ZYCIgchwao/4phYaxv5jkMsWtA?=
 =?us-ascii?Q?mEpStcBcdPEeW5MHJwRjQ59wwXV5IGmTfqwxPzhCk/miAoA0SPWqjZwnMcKG?=
 =?us-ascii?Q?y7NzVQN/whKbArb4cfE7e+2mKriM4CIDgDw5L+rQwtXQ4+zvmCg/ijBdC1DJ?=
 =?us-ascii?Q?VeydoNqB9tbl6qM+/dllk6MDzUAbBL+XMDPS1djkgOJ4m6cz2TMb9kaGk5uc?=
 =?us-ascii?Q?GsE96S7VghaqvoMfjkK4qYdm5VLWDaiKy0FPEQXRcXWf3/+RkTlH4Ds/A6+L?=
 =?us-ascii?Q?bqG5c+Ph0KqG3JK4+ILQdJigN4EXMueiJMsV9tfH0EEZWE2Jx2U+KiXhp1/u?=
 =?us-ascii?Q?E0XLWEx2ThFdnce+25w/TkYnU8TTd6UNe/8uJ/0/9AvgsrSff1h5hEJdJutt?=
 =?us-ascii?Q?F4+dlPb7R0NvYs/MiisTCadoGTiaQbb8u1WJkn10wwC2nwfcTeO2g4jiNcXY?=
 =?us-ascii?Q?4Kjay7NaRSQIv4fQqRp2idBtf8GF5Abn39OaqykvOfMzw8sGxBfMN0vTl1MK?=
 =?us-ascii?Q?heqHtRbLfhTrtg+BjhOIAZqKi7ShfmBuQvV8/N0I1mV46GUm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db9e552-632a-4547-7152-08deeda86b4e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:34:34.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3lDHRfCEwBtFT5SXTmtatSIE25RViCOH5q48yPLErcsqctGbZ4y9p5nt5dra3X5vgmR1hrrwJN3iGvoXxNjnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

On Tue, Jul 28, 2026 at 06:44:10PM -0700, Borislav Petkov wrote:
> On Mon, Jul 27, 2026 at 05:20:38PM -0400, Yazen Ghannam wrote:
> > Changes in v8:
> 
> More Sashiko:
> 
> https://sashiko.dev/#/patchset/20260727212045.1810480-1-yazen.ghannam%40amd.com
> 

There are three items.

1) Return code is different from PRM handler stub when
CONFIG_ACPI_PRMT=n. This just needs a small change to check for the
other value.

2) PRM inputs on MI300 are changed. This isn't a real issue because
MI300 systems don't have PRM handlers. Will add a code comment to
highlight this.

3) Dead code in patch 4. This is intentional. The code is removed in
patch 5. I wanted to have a clean set of changes to add/switch/remove
the code.

I'll send another revision with changes for #1 and #2.

Thanks,
Yazen
