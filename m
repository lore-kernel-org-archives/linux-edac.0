Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795635844;
	b=NcVMfsBLl1OMLk4qE8WILr6ztHsPz86q9PpMPZRleO4zXxfKn2jW9RGvCMNBaEq+DIbP
	 6iL39Caa4GvJ24xAZu+BBqQ5apEzlMvyK2sHBdPS2mlqJ2LCdRfnRY3ojatXUOdNX3Zj+
	 cG4MIsnYAfzwT3fTHsNZ32w3/agTerx8xkni+GbY/JFgkM6wUU/O5FDGxn8sIe0Oy6UiJ
	 otdiy5MHIZJxrw47yWkSGNpOkerHlKM89o8UDOx7TnApCbpRRY6fiMZlFOG9MHHIjw4nk
	 APu5Sbxu/2oxIiGbyhGoCgz8xoW1kP2axxYpHu58Le3UmWUpcD236+PRiKse/JRO6MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635844;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=IrFMzh7jsOYH+hpI6P7DM3Hviydow6MHknMrF58TqaQ=;
	b=Ylf/hUpNnHMMKi6tVF3yNWgIzU02Ssa6tlcruVVExVV++X+EzO+uZu0vz2bLpiL7JQer
	 Fw9BXczA2/YW7rt1iAmz7JxT/SfnCS6zuby+ADNE6+jxU6uOM7HX6YZpBR3TF+zNjukms
	 /IApOYT6bvzcXRYq8XApuQTuGE6PNuBmyVHPC6HwSxBPpl7YrC57xYbkdhdV77ld9/pAG
	 P5hg7y9s6akxEx2uieDVWyI0sE9WrNqfqOjD4VlfnWtuWa/EkWU5JliGIZiO+Qpg3VGyh
	 ywg+Rk1xjI9w3XOYn5gF6J858NXDRTEjyXLRJNaIS2sHUDBTo3BFSU4VsQaft97ey2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kEXY76IP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.38
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF53606A33C;
	Wed, 25 Nov 2026 19:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CF53606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kEXY76IP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQR/1LIURbfL0BQPQg1Md7+wCzhrv8xBXEITdU/c0O3358rJludMCK6n2xBZ74ZK7yiUxxmsuoJ3PGffzGYAqH1R9aTLChId2JAKfaChRpEPgyJc4/q1eYAWnU1Ht/ey0m46DlaVZAm4BQS4LJGH5IbsYn8wBsc5NUNcArperyN4GRAvVHbhRvn/yyHeEeQIGXshapUvvIwJ6Ba1QERx8ELvaSsbxA52GKXrkUVgUNf8J3EdoQH/nEG658BwJbZTQ4Z6RT6tLNH0FCiTbI/QeWoWBcGjaxiCTgwvQZbcxlXIOGLoYfDD7whc5+s7RwMbp8c8J1KvkXWWsisb8WDWDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrFMzh7jsOYH+hpI6P7DM3Hviydow6MHknMrF58TqaQ=;
 b=dV//suvm4VS4o8gJgZyPPSSlyQ9aR+12GQ+j6J/S/aQB9OLbOI1i17tkz+mNAk5cCobk9ZQhihN7ANg2K/1J9lGwjdyIyfHBDkCDp4xtOeAvTnOMOX3e0/SmJ7FlmMbWkFonUiOgATkl5CpSqGt2O0r6v+SG8etxcevVyIVOYTaCmnrqjJ/W2W/Ee06ai7OiStrANATgp64tYmFD+Pk52QyD3eypVKRhUgEkSy9HZHFGeW0rvnsnrqbDGEOtdqde3l/PTL0KSV8CTHkR69c5zv42VwSbKorsBXZAy9XpEcUMJzQoKSffCt00JQ86cRYQ5x+/6L3X0xXtS1MiONp7Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrFMzh7jsOYH+hpI6P7DM3Hviydow6MHknMrF58TqaQ=;
 b=kEXY76IPB99rnAnR//1i0acwcm4fII06nN60KWz4eY9t4lfiBqvOJBOgJzjn061BK8KAZnwKocWfGVmnLiUUkKBDrM0I6HQ1rz+XiLA+czPzO/qxQ2wlJvWvD5QsQpYcIhy2ivo21DgAOtUb984bmY+27SxCvbgZQo8oUQh0vv4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by LV2PR12MB5870.namprd12.prod.outlook.com
 (2603:10b6:408:175::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Wed, 25 Nov
 2026 19:43:16 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 19:43:16 +0000
Date: Wed, 25 Nov 2026 14:43:05 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/pci: Fix potential private data leak on release
Message-ID: <20261125194305.GN2156781@yaz-khff2.amd.com>
References: <20261104-db9e3c75b3-edac-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-db9e3c75b3-edac-1@mail.sdu.edu.cn>
X-ClientProxiedBy: BN9PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:408:f6::21) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|LV2PR12MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 82d963aa-be95-459a-b14f-08df4b2c599f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|261026140227099003|56012099006|11063799006|261028144727099003|10067099003|261102123227099003|261022105027099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	v46CYLCgu2PSIbZvj8vGiQj2tyedn9gu1KcssWLDHTlisolhrmFBaKAN5AEHqyQP9Ek3Kv5DqLTYpsDbCT2sTtd2Xj5pDHGOAqyiomY1KVoKvlygvKB6XK+45hvPsZYk/f86ObZaxwyrd+MWree7y0hMeVWzG6aEf0o67RSYA1gc9nkqJG5CL0DVk3ajSCE3by+Oy8ZlqVtcZE/AQtoXotnUDRJh9ql8yEz9fyYfrC1CQh9OuVQJHtLrVfJGgfNqDxJhIgrcvFhvFykZeYhuqzqX4z+Qvs+sPJy+Ty9HuxxJPAcpjbhomc/mJ/1EkbjXiXUu2/egOlVUkXYi8yODT93xQ0ICjMGGSxSYBobQ4QhBzrBc7P75k+zg+KteMu6lG5HTHUV34cEtoGv1+UPf65Qp45Ug/jhj5vmHE2C8RHiV9oMEq+KKOnflURt5QvKhvqp1OGly5hV/bFJbg/Hs9eKbnCzLfit/7lpWWostqJi66Z0i4EfUHsK8MJLTZVOWkB3wKKeREGqx01zLv0ZhVYNiIELvr4gx9wkcHC9mv+QFwiX1JhvQEBQr1Cu6iL7TudyzAfdwZbPfjfCDg5F0QXj+aTfB1xu+1ANqAx5GOgpKdqGekX5qYCWuAqFMhGhUITqwldtfSMeCBYDgfxNGe/s3uH3NEG04H/A6QHgW1Eg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(261026140227099003)(56012099006)(11063799006)(261028144727099003)(10067099003)(261102123227099003)(261022105027099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?83fL3yzo6NigoeQh+tgEtAgJvrRznWveu7/U2FrdOpsJ9J5NN8/BjE89EZ+W?=
 =?us-ascii?Q?ZXHSvTJiwcxoJdXdzVHnMv9m/PWM5/0/m7XpjTQ7Ew0hIFenxOkFpIxI4w7+?=
 =?us-ascii?Q?n5SM65ZgCO2QkonkTHhR4CWtVtjlQRwfW7GZ6wBhiT52SdT5F4DWjQWYq7/Z?=
 =?us-ascii?Q?lmDfbhZtRw6NcsENGEXNHrLvd0DRpoqJhRENlyXxzLqMKufuG3cQS0zlFYoc?=
 =?us-ascii?Q?6nagzhORIHefzLoF3v+exzFs3kL2gwPx5b1eHhdcTqCF9+yheufIwEq8SXIq?=
 =?us-ascii?Q?4FXmB3qN4OLBYI1jMIxZMmoVUCiJ1YaSdGNmmqaBk1wyUdJdHBbAPa1qJEbN?=
 =?us-ascii?Q?IX0E7NxNGFYvwxOCPeROUspyp/GLTd3hI5H5LLmG5A4TTDXsLAvVJjxM+eU/?=
 =?us-ascii?Q?tYnMSCHc/XpHozr7bVgca5iP6DW3SpaN129uWlL9IeEwSsSyUpD7Eme5FHeI?=
 =?us-ascii?Q?CXnM1pBjAxrw6zne0pIRJrMzSm4zQpMygIZeo53eVTfj8ZSHZ/2Q1fqlEweF?=
 =?us-ascii?Q?h5CGzPERbmaqfrv/cm4txsp/5UAkHcPiZyde/SyS4TNZfaqAy2CJtP9+WagS?=
 =?us-ascii?Q?dozAXjOX7Nkx8QPsOvuLWkDJjWvueyGGagIr2JTK52NbyvOpRHx95gy2ai0f?=
 =?us-ascii?Q?Mrt7d4eWfIqnAEXOhLezdJvv4kZLpMZO0ZeXyfnd+TNDYf6OTW4aNf8eRTjl?=
 =?us-ascii?Q?ETTZfUfB6/bVfX90RrLivzQSA6kY+/ADiWNvIZj2MaAD9j2DmPzgREA1xCmH?=
 =?us-ascii?Q?wcf59z9VdHSy1H/BKqSSxeC584+vd3bZuthSEisOtSH0kdOXki+NEgSnNeE7?=
 =?us-ascii?Q?r7uvnqLbnyY3EiwskvNCWxtFIdZttSasSMpOInAzdZuKxoyfYq3osNyq1Cv0?=
 =?us-ascii?Q?v8HnzyAfSxWaLgiYKO36J6tzFz4UyN21BV2RC9PROUcxRgJEz4+GO7lU2JxH?=
 =?us-ascii?Q?8XEJhWq/0GAahgVpIGz8UwIfRAZqFAKKW1q4b2KxnrWPzM23j8InC16ZoM8f?=
 =?us-ascii?Q?nSGKtimuX4kqiqqUKxvq2fKCPjZgr4+mTkQHCMojAunpioiGqGEqjeUDa10F?=
 =?us-ascii?Q?2YV7PoU9nrePbb/kzx7PgZS1o0dYrpwSwiMKKr7xTcORS7vNgbI1nCMyRx8j?=
 =?us-ascii?Q?6npncEtQ1ZLPaWQF0AU5SNVS+tSQBFu/KN1VqGGYy7y0801w2ULK15Jwsa0Q?=
 =?us-ascii?Q?eL6hDkUpevcHAb4aI4YX/Vk//Hm1S3YAHKzmWXdJbN1JNU+Ula2Q4IYxrqHv?=
 =?us-ascii?Q?EnPOgD8AbyCckfIeTBQKb05GAoxkHuF+UbiNqHHFkf8/uzro2V0535Hwp3W3?=
 =?us-ascii?Q?WA1BdwFfye5bGzWFGKgwlaJqYsWbNgzxFljoYuuAsYmdKs4LmcH9qzmF16XY?=
 =?us-ascii?Q?6JoNy9KKg/8nYg7i08ONeYBKCszvfUAWpcZos+GCQqzHWKo4kLZDx8Rd7M2K?=
 =?us-ascii?Q?xz6DqxoA32JBNQveNhMUfGQTUB6WZW62ROWM3QTATLbnAvXjiVp33hKXRUm7?=
 =?us-ascii?Q?d/XT+JZrq563QO38lgLe+Ufd9m9cvB38O1FzKuGZMmmfbMu6eoruGo7T2VVc?=
 =?us-ascii?Q?2wg5itMxTO9kdA7KQ5sf59RIscXAyfUkdUPYRpt3T62OQddxbsLdLeJ6IVmm?=
 =?us-ascii?Q?MpRXcKMeLBtIJasSTR6sXDJsAP2kxav7QPRFf0Oj+oYKZMXYes0k2fZOdIJi?=
 =?us-ascii?Q?pdEVuOsz0eLmzhTP1XmyoyO8S/thByYHnlVwT0m0JHIs/8mS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d963aa-be95-459a-b14f-08df4b2c599f
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 19:43:16.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DJ9koLi3UYfgWMccQ8WMO8F7lDcIGejDEur1Qp8UxK+Ki556UiP66hvqsp2wv3bFCSv7qO4pedyXMLBk24cUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5870

On Wed, Nov 04, 2026 at 10:33:33AM +0800, Guangshuo Li wrote:
> edac_pci_alloc_ctl_info() allocates pvt_info separately from the
> controller, but the instance release callback only frees the
> controller. Release the private allocation there as well, when
> the final instance reference is dropped.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: fb8cd45ca39b ("EDAC/pci: Get rid of the silly one-shot memory allocation in edac_pci_alloc_ctl_info()")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
