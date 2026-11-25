Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795627349;
	b=g3b/lR9mDWPOLA+OqcTbo575Q3fGjfctQqlkG24KvXh6NxhPRa452JdwG2wO5nxh2hpN
	 P/LbGoLHzicnGY8Y1el6lmcsKOY8W5Umgf83mv7G5cf2OPS7G20FLULLLbtoHPkm3bJS4
	 281SL/mrnkWouLWPDKexghAtPaiQQJktqpiqRmgyi9fUJ9F1mlcx5zsAbhJVJYncoxt28
	 lrwOYoURd54QfW+ZnlDc0xFdS4ngKAYAJFpANnV+ixunzPnv+F19LKIgQ5iHwi8InGXrk
	 RS9wx2Q8tQA7DXtcy7+vdHXhSzp666ssG9Ej9Z2u0enLhZw6oijIprd05mpfP2eLlnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627349;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=J3KgT1H07SppIzi+Y6T9x84tNDZfDlSXqVlo2UZbZxA=;
	b=yXjzn9JBFJIL4qQk1KNfH1KK3SQnYx2XcYcko1nqJPF6FpQbMq/Ake8Jyb0DYx23Ca2w
	 /QPTbf2zyIbUDBPdEPhha+ZK4C50J0sIgXY2aO508Nz0SBmo90YbACtSvuC6PFgWZJYSK
	 cubjwspee2/U4rQA4uxOQX6HnGxwDN366yGiyPbKY/9pkX6i5rd8syXwtm/MQ1qS5uT4a
	 ABNmlgdWkmbdpMZZYXA5zjAETousFJenDA0xFqKivJ3AXjv2DhfyzmPT95Ia/gGLlUBuz
	 f5HKHy/w8RqElTufYNRdXtaALQk4RqJ9sIcK3y69hbFuOkLmagyyiG5S1aRtpVFpg/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e1PxPTQI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.1
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27A606A326;
	Wed, 25 Nov 2026 17:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B27A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=e1PxPTQI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1xl8Bq3AnkfuaXeEm0jM7+TksEYRTlDD81EGqFGPAvZa0OHYqY4NVyR4rgQihe+t/vV9WV4pxpfdJC77dRKCPpHyZtmXUPfTlilRFIHUOMh3UQuDrirCua6MskC4sNmY6yJel9XledhJj5pvEvZRmHCTstGn0K6/y9Mu0n8/2XwMfUBtKKG+/I0NElpM8/CD99mffeK34DUM3T0K38B2baYtBZAMNrIQPBpUOKxI0IjgfKeZa9UN3uevvQK/c6HfoM4luwCvaBB+6frZonk8+lGVKoZApvEh4b+AUAhwGuEoVY/Un+AaE8FkeMM09cQgLwxMyj41CkaKHnD22HKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3KgT1H07SppIzi+Y6T9x84tNDZfDlSXqVlo2UZbZxA=;
 b=QvneCo+2m1zoFuom6k+ZKuDix0QYgV0GsoLWUWTI2jsF0LWgRFfK0GBgvSjXGFmeVl1n6U5XGHON0pOvYABtH0bySNoQGhQ5EImAbFYa0ITStZiFwlbEO34vEhZqF3p0SpF5IqOLMbzhBReqkzrJet/KtWTNyOhjwu0NeTtLxDYnwa1m26rFuuuXYUFC0CC63fQ43L+PuSw5vCkHyoZ/mPz6gmwtYQCIhac2Yjucbh/y+Ev/3o3UfkuHVkL0ZMBOyLbIqStRgvKKSDGrZ1xXpREvcQNVYmvR6jO9kW+d2uLA3Nxxr/S5HOGDN7cimcPWSz4p1KGdMlAzmRvSAvsedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3KgT1H07SppIzi+Y6T9x84tNDZfDlSXqVlo2UZbZxA=;
 b=e1PxPTQIUu2fG/VeQ5vtRou1cCqDzseWWzwSi7uZcXWnJk3Cemuv9D4HU14uqIK9nwIqR71SWdS1EJaZjX5C8rAN/Nt9dbcYZIfGSSxecdS8HdOkzB5tQmk5SJyFYmaNHA+hPd4CoOkvSB1LwUG5yQdB4LYxMc6mPmPTjSsycnc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 17:22:15 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 17:22:15 +0000
Date: Wed, 25 Nov 2026 12:22:10 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	michal.simek@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/12] EDAC/versalnet: Make get_ddr_config() return
 errors
Message-ID: <20261125172210.GL2156781@yaz-khff2.amd.com>
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-13-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118142213.100581-13-shubhrajyoti.datta@amd.com>
X-ClientProxiedBy: BN9PR03CA0437.namprd03.prod.outlook.com
 (2603:10b6:408:113::22) To EAYPR12MB923140.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|PH7PR12MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d093244-687e-481c-9656-08df4b18a649
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|261028144727099003|261026140227099003|10067099003|4143699003|261021121427099003|11063799006|5023799004|261022105027099003|56012099006|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+Z56YLQxYdc89U6a8E8bb2X4pFe1FMd5VCmsUEp9ydxytTE+cX+1G23BBp8t5h39JJyulvJxdkDqdByTqTiX79FNq0PtnN2plBJmEqsBipxCKBKnEUv1NxDHz7ajPR0FUTOJPuIQp3kFFeoaL8B5Aqm9IVahnHsPtq5S3LAHhzkdYnf+X7/a7wx6I7pbXQvrda2d79s4VP/rnFdY76a63RaTjOO2xZGgB4eefvinD/whOos6k4nmF8U8G4j8HJ9aCAssOWc7JsxhEASUARMWG5bzly5T2YQqjs4TxNwF9aSLoLBqtZfaMKIkjsZ1A4qRvYfrjTP1Yt1a8lEJ+mJghPTLYcyZ3RYMcDklvZTEHbUbx3MdP8MVA6wleLVbjttYDeiZpo9eyc7YAPE1ossnuREGg7lIdwwKGSKzjIM0H7BkAUZo1wxbQgB5hT3t8PpYwppMEyAeRvcY87ZNKqH7oHQrnr7RV5xn5wl0H6dMyA9kLmDE//D9hBwqQKItlYo77pJB3jY+tJ2+fWXcU9iRWcaBlIsIplWndj2/tL5xthAfiLyFsc7TVjVApfgWD/24JZgiHyByMZ/li6vbE00mM20gLg82kLFgNDFlMrXuPJ6k3RFq4QrR17WOh09DkO+xJ4q5mvlkfYgXns1pCfFfyalr5RlgiVqiuymby+Yvxoo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(261028144727099003)(261026140227099003)(10067099003)(4143699003)(261021121427099003)(11063799006)(5023799004)(261022105027099003)(56012099006)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k3eUPGrLuzcIIOQWCBA1oQxklvSd8WrJxO/2XOnnTWKt/giNRQCxvOi75awF?=
 =?us-ascii?Q?FRnPtBGv9JyDTAgvS7Scu8xgXuo4nsWFTbN56Jj24U4u9/y+Ci7pSi4m2Ll6?=
 =?us-ascii?Q?D/Ynum74iqZMdDs/pTyePoAGP7GsrLWBjf/6OvcqE4vvUpnA9kQspZNIwoYh?=
 =?us-ascii?Q?/SeX40im9dDPQZscdTmYBo9Ewx0AdNLDd+l9tN6yGJ0JCFYC67bHAqJLz6vt?=
 =?us-ascii?Q?UJy8qF2CV/3bw2P6bDgrW7ZDm5il9AzYMYTk674U51Z2eblkEgPxguNrb+3X?=
 =?us-ascii?Q?qkjRYq3Bj+l2cqbeHGNqvZW66qz9iUyB7MTKkdcQ6luhnaFpvD5fDpkaLE7x?=
 =?us-ascii?Q?dsguPRfSUfnWH/cyoFzTvKKk9Vcvi5J0SG6wBhIhCzaEe7UdP4lBZpJqIpOx?=
 =?us-ascii?Q?87hQHa6VTmbRfdlu/WcTnkwK5NkLJMQiTV7VCdFLVCdKaMYSFCdWnzK07oh1?=
 =?us-ascii?Q?lcmIzD1fa8ZYAnms5392k7mqmhaADhbfduEN0zZnpsvbDI6aoGH547papSoS?=
 =?us-ascii?Q?dW/kqooElmbS4r3Y8vbnmbpaC6FBWjFAfKoXUtvbUUFQ7LzmFFK2O2d7zO0C?=
 =?us-ascii?Q?EgPRK68IFoF/gLFxPlUc3KiHdiz1C+7zO6keb5cT+e/lwflf1ghwWIAwxlye?=
 =?us-ascii?Q?G1ILXi8eI0/JaglmGtq+/nZNpt/1UNf5CuRhR+ulwQUJtYkMh9pk7MisZwl8?=
 =?us-ascii?Q?7vZhRnsZT/DyQSWLAt+CiNngR33QKtArlwr7gHfJGHidnZNFfdoKmbpfLr/E?=
 =?us-ascii?Q?JN9z+ty3ICXvxWc8DmwQeT52bgB9mTqBuLbSgWANQUbm7CU42VP2MdRkp338?=
 =?us-ascii?Q?qYI14fFUDgXTTb0/cxHjEbs85f0LYqkVaBQjkh7l+qrnV72wcibvzahrC3Ms?=
 =?us-ascii?Q?2YQQTnpisHbTTKu2/OgTEap2WoAMOINqRftJOu9GTFG+geBHdJk3DMuj6mP3?=
 =?us-ascii?Q?aqodkqzVFJMLHSwmhniEt/FB7bAltKlcND9IVB+9JDekoWo5DZkKD2KdPEeA?=
 =?us-ascii?Q?AHoWppVgeqvWAzUD3dkAJ1UMOSIytzvZOeNkcl2m1qnxR1GAeJBseT+7bNEb?=
 =?us-ascii?Q?EeSjJqRltP6VAyA7vQhN/iWoWGVx4OGCu5SBQEsZVciaXPe5gHWZCFFS4nG5?=
 =?us-ascii?Q?yTNl+0bo9ZWhh01Li9sppUHxPCM4FyCCbouDxw7D9TC4jCLb59Jis1E0kJLd?=
 =?us-ascii?Q?hzLj/DD5REGXFEi/TeW4eqw01teZpMW10KUzcOsMiCb/08td76hqcDhg8GO5?=
 =?us-ascii?Q?4rTraEgHFGCrnnTr1xZsVUXM2wluaA+xLG+x27QVud/y4ZHt+gGn0gL8ziDR?=
 =?us-ascii?Q?Bq49TpXfHhWAeqv9tiZBv80dlbQ0KDz0qyvYD4d1wumR2SheR/PZKbeXAMJg?=
 =?us-ascii?Q?EbYmZhKIWvz5/1WFAUFx3ni7Q39eG1y2d7/DyXfxeyJAi27IW47OErjgJ+TH?=
 =?us-ascii?Q?JOfWxQR4iwinQuxu1V4Ay2MhsCY7TySQkJ9od7PyPMpikL5u4hX0PppwlRHE?=
 =?us-ascii?Q?AcvMKwOgapU3htTkK55DpLlyWX5+NUJ+LGJmOoO2A+BxdAT5IaAPd5yILEVV?=
 =?us-ascii?Q?WdsY8SSpni/bdh4bMR7J8iachAPmhgKpzvhHVGNiFNxLmZv9YA822HDzM5i7?=
 =?us-ascii?Q?o5XUpz3YBp7wJ40h1FOB7iZxw8S2MIrRF0z0EUfSaALTYDLADnyQzx6VWG1F?=
 =?us-ascii?Q?+AgvyRzM8WWWnS8sVZgqAYxc142BXen9VP04w0Wkh03eO9/l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d093244-687e-481c-9656-08df4b18a649
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:22:15.2497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOrGTyLohqr1F/wasO7A8AenfXoxPTdSlz8OQoS+c5Q8Q0VnR3juKEwHz2K/RXtFXrGayzovFF8Nt7XPukgyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951

On Wed, Nov 18, 2026 at 07:50:36PM +0530, Shubhrajyoti Datta wrote:
> get_ddr_config() invokes cdx_mcdi_rpc() but ignores its return value,
> and proceeds even if the cdx_mcdi_rpc returned errors. Also it
> copies the data out of the response buffer without checking that
> the firmware actually returned that much data.
> 
> Make get_ddr_config() return an int: propagate cdx_mcdi_rpc()'s
> return code on failure, and return -EIO if the response is shorter
> than expected. Update mc_probe() to check the return value and bail
> out through the existing error path on failure.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---

Fixes should generally go first in a series. Any reason to leave this
until the end?

Thanks,
Yazen
