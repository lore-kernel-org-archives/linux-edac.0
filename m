Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D73537CD;
	Mon, 13 Jul 2026 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783968259; cv=fail; b=St22wViGIWP+CDaIOX8zBdaw+0NFCv/yMpPJtTWGkHGvfnvddHch3JUMHBF0jNaNKyLOvuJnGxAH2NKPCou8T2DbX1EM+T8onJPuQTzW2dU4OIc1NIzPG6SwifIrjDT7k3nzmvXwKsUh0RecNwGOdhuqixa32rJwQHqWCzpIcrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783968259; c=relaxed/simple;
	bh=gmmZjtn1ITsKGBHVjVXfgPZr7pGILQxVMdCgqDkV8E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PB6fVtPe+tN9kYzHdGyWAXqXkDcDIeGGIyahrxqFTwQIbRFM9owXM5aPiJhfN+urry4lYxhOH+4kIDa/dw2/jM6ZVy2kj8sYbVQ0Kj2RGbB4LNs16BzMPoN7G+3y6pdJB28YPdzRtSK7L9sh2nB4OAuJ928ZGZq459Hlgxs2oE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aZh3LBud; arc=fail smtp.client-ip=52.101.53.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aZh3LBud"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZlFtOnyNi6TGP9zwqSGh9gfmbyICtDJLN09/jQfi5HXh79/RGusiw6oVnYUFsWJ8XAqKgtnfU5lRGrTV+F5zjYqCboJ70AsiaznhD3IDoR6BzJjpvMT+0assk8kwg9hKfYWJldgV9ITuHyzLm5D+uTroS/hUlxpyhOXWd/twDS+eGKSYciv0k4c8Bxgnaa0lqDM911Iew3cAsv9TPEdakAOLuzMQ1guHZVITrKNqcjAkgY9mjozprcdTfjftWXYsHNBp7GpZZ5iZVkH2m6gB36BSL6CiN66QGlxLSBS8jBHPaY40wU6vtElqkO5RKQkB0Wope2QqRfpz0E58ADFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ykum7v1DcC/Yl+yh14LBXspvV4h9xrr2olmiZ5Ib+HE=;
 b=PIYBb5ERdGi1EhupSAvx+0Gd93x3gySyRYyqtm+SDhUFiPbK6xH4tzxIp+akKoXoquHcilHCml5lkycbaLUTpV4gtA8ojqeyZJ6Zs247nWiPtKCRt/PO9wiIU4GZgiORSvAf2YJO7LeCjnNfoumYSMStNxyxxtzIzASpSIBJomaWSqc3nYpV79FKxx/3MyVbX88h1A5UxfcLTynMSwHBXAt9P38/zclevEBk/WhHsEFv7XSkNzdV64OCRjwz1MovwrBCey8FGMwRxQC3fM2XIIaA+jggS6nMk/6M0pLM2DM3Lzjwwt5dpbNVaLA3/24HNU/FlKjogUPJuBkAFVCXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ykum7v1DcC/Yl+yh14LBXspvV4h9xrr2olmiZ5Ib+HE=;
 b=aZh3LBudwxey7NtuVm8S1ozkZFtpxUrojNDIWvSNZJYHan5PA0jUntVh8IT0mW18mVdGv+8SnjekXRjxeapyBOybH2+YVOVcxIEZ9+PiWZKRLqxYQ7ZhO39bEKYLDE7YyFwWPwZArtPHE75m6qbRGeLU9AxW2N7G6+L1V/3krng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.18; Mon, 13 Jul 2026 18:44:10 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 18:44:09 +0000
Date: Mon, 13 Jul 2026 14:44:02 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@kernel.org>
Cc: linux-edac <linux-edac@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: Re: [PATCH] EDAC/mce_amd: Do not print a stray newline
Message-ID: <20260713184402.GA364094@yaz-khff2.amd.com>
References: <20260712031648.486110-1-bp@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712031648.486110-1-bp@kernel.org>
X-ClientProxiedBy: CH2PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:610:58::32) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a824c1e-b5fb-44ad-3a5f-08dee10eb9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	H0IAjgYFIR3kL0i3z79Kt8zu0NWaJqsmEBOCegsiorymmOyMxcEH+zW6ulNGO+UWBe72UagS5IWf3doocDg32M+Vt0dtjMgSouA+uLdf86ELy3Ap/tK+HLHvACZoqKhKmN/Yn895MfKyeqDmlk+BFlFz1Lp1kKHR+8Lj9I57UG1heuzBm5G2+TZZ29L7I8IwtutvO0nYUsfcvEb6Zn7ayKPFHJZiFXZ+4o/yZTtrV9LZeTMG0XuDac0mfJWMSr0J8+lqi4R3mTGqsFTUOV4iT8jyaBjXq8dum+qn0uyWz8wlfgiq3wRDSezNjKtJyRRu7T9bZii9f64Crj2BbulPoDC+0KP3mETUNYtBZFPR7u2k+F6+YVxy0V4CSxFF7xya2yhZLTNUkZ96ybZu4Z3gWr2cRXULsrB9oDpwIoxggXxEnMO2G+e/7J857dvP9CKlC7xkXqHJnZzDuQBbtHNSayIjxYHpRq1o5Ar+tP+id6Y9UZEtMeRivRenm7CHPeqYBcqS3mN2sgqxLB/yfwt8UTdVHnnt/8Pu8P0J9XA+qcRMz4wm+/cpDQbTuroi3iHo6kQB76qPioRpbijbCXpUVi2UAZ+OEdiB3uZy3zz6afHzF14d3xhqbGQcaPAssqqgM/JxHTdEJhDCrHFWdqUxz+k1DgYh3yTKmAdL5sXPi8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?imK9HFLeS/FbFqUVQepJcn6bgmWRAry1RkG9LphBT9NLfwNYwP51OnrgON7s?=
 =?us-ascii?Q?gky070WL66SDHl+5AoEylwV57ORMuQI7M5rDcCLW/fpFwwgJaeWlIUwt16vt?=
 =?us-ascii?Q?p9O3VSHKDqq5X0RADcnW747zDkvFcSMFSX9ZUI1IV1KLoaKVYYnh8g1gju2y?=
 =?us-ascii?Q?IjnV8ibyBhipUB9OlN1sZ454T/6b2TAu2TSd3cC5GqFP9gAqsDmG2G1/IywS?=
 =?us-ascii?Q?pQQZyYNGTN43JBKZezVilME/L1AAKdyr4mDJ5Eq/dAWLGkI/c9mZ7EZqVgl4?=
 =?us-ascii?Q?zfpeDHYAKKf+2MJH8Ffn9C31fvZTZqqhh2gtEn7muxF1SiD1lde73jn1WB9Z?=
 =?us-ascii?Q?Liy7RgrEWN4caj3glHe9YVKneJITyIopfdRKFAxowyrm2iPekh52IEjjfr5P?=
 =?us-ascii?Q?wuZJBfD8lE9D+UQdwcyW8Xp6LnlB5Bv6m073pRXzBqJchGZ3UZZI5SgswkvB?=
 =?us-ascii?Q?JMTfYODJYxvgTSm/yNKVb7sDNy/Hhhk+NmWvY2y6hVGxX64g+B7vB31qWok6?=
 =?us-ascii?Q?lDqeuKu8M1HLhOcL7ejDHK8Fz/c6Cz45EuHltiV6KDwJCuSjhhJx46mgU4Wr?=
 =?us-ascii?Q?LhUlADnsdmikgYTwsC5Zf0I0NqINdmDR+mdIXsiWeSJJoUspbCNbr1Pj5Z/9?=
 =?us-ascii?Q?KegG02NlCbgJ4AGgH7HjFMcrb1UrnW+LoyqWtaSLvWkKXb6aZ+aoh9jf6Uev?=
 =?us-ascii?Q?sxvoRLM2h2mqjTr+vqx70ebkoutsNn3dSHLcBWWKAOOvv2q5AGn+UwIyN+6K?=
 =?us-ascii?Q?WEhQF+zEjjHSO+J2Bwd2Bwv/msbKYJBy0ZkgnO3CZB+x2FKhXOwMsQBMmvKh?=
 =?us-ascii?Q?4aJN7arFCKeoh/uqwFU5HuKeS43P5JKopi48MS63SIEA/yuEMzLYtjxaDFXw?=
 =?us-ascii?Q?Yk83D60NQm6dVhizB7ZQFYNloYJDIkVa+sKMFAzX03BNdcWUzuhzSJcPL39p?=
 =?us-ascii?Q?+7XGBwP5ABcSMqvGhi1sfQZZAYw+SLAG7itzNgq2GSc3O5ESK2jJf8gODJtM?=
 =?us-ascii?Q?zNZ27Trug+hz6p7ve+QfNLqnA3ya/ckAdRJv70bSBWNA41fjgtO7gcQaYuvj?=
 =?us-ascii?Q?XEZSuTbshykUse8kAlFPo0ILxprY2lH61xTkel8ZIotA3N7optiMvMzU5xos?=
 =?us-ascii?Q?KJ40uO8bgH95OkI/Zd+GUZTAvePjufBOyLYnTTeACjSOrJboMhDk7SydVfvS?=
 =?us-ascii?Q?z/Uwje5zUfYv4rfyH/xCpAmXFGPCUJ8f+jnhKFh7O0CEIhI1cViI9gH9xk+X?=
 =?us-ascii?Q?kcycDQBlqasYi0NglIG/rmakvLTDOHGgbKCEaW1qhIHzqRdwQ/BasjS1LsfQ?=
 =?us-ascii?Q?tieZBwiwCYw9K1QQfUlx++XiISeLvz1rKKLrebvCGuppqFnkzXARgSnuqw8u?=
 =?us-ascii?Q?MC0QdX80Rs7cEloIINhJ3AVnM1mk9IA1HulhBsSFqNR9roUps+8ylLH6kP1B?=
 =?us-ascii?Q?j0gBlB0VrYt117AFR7U04agvROwvCOo+MQquey2C2dhBkz0BjkIO66/5RCEb?=
 =?us-ascii?Q?XCzIuOPtZ05rkCa1+Smo9UB12k9SUmtyXTuPe6uo7VNrZdNcePAnhebuwvzq?=
 =?us-ascii?Q?DrVS+/gKp21Q3+FQ7cuiXJLseZlb1Q/vBy5I0ntsHIdlO2bzQ/V/66+WZiAS?=
 =?us-ascii?Q?YAa3NAMbzsSR+H7r3DSz6vFV/joU5Dl5Xs6JAEPo1ujV0JKq7YYR77z2qLC/?=
 =?us-ascii?Q?ZogV35fpMpsF/9n63SHDVa++LvvfsybuDB1N+iTfDwLbJfyzOG01GJSRr1hE?=
 =?us-ascii?Q?rGPDKQ3bRg=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a824c1e-b5fb-44ad-3a5f-08dee10eb9c7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 18:44:09.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEg0/8RX912wkkxZBEoTMj/JYG3MuO5tZ4ZH4ZGfE4uTesIZ1aUvP/fd4ZdGJY3skZOy2EaOu84M7KNTCeTNoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136

On Sat, Jul 11, 2026 at 08:16:48PM -0700, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> With error records which don't have FRU text, an empty newline is
> printed like this:
> 
>   [28014.094610] mce: [Hardware Error]: Machine check events logged
>   [28014.094674] [Hardware Error]: Corrected error, no action required.
>   [28014.094687] [Hardware Error]: CPU:11 (19:44:1) MC0_STATUS[-|CE|MiscV|AddrV|-|-|SyndV|CECC|-|-|-]: 0x9c20400001010135
>   [28014.094724] [Hardware Error]: Error Addr: 0x000000019ba9a974
>   [28014.094732] [Hardware Error]: IPID: 0x001000b000000000, Syndrome: 0x000000081a1f2505
> 
>   [28014.094744] [Hardware Error]: Load Store Unit Ext. Error Code: 1
>   [28014.094748] [Hardware Error]: cache level: L1, tx: DATA, mem-tx: DRD
> 
> Move the \n into the last printk() call where it belongs.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
