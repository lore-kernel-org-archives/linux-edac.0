Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58BC13A258;
	Fri, 31 Jul 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495684; cv=fail; b=aD0FlfFMYq2+J4VfPbZgwgEewZkDDQAOFjTs7fteclIWX7cUCs72xGiz2Xseoe00ZvoLxZhpfsKBxIiy1eEJQH4uPAza+nS0gbcNjvM2LS5d7we7kIlnVsdLc8oOQTlquW/c9V5XZ5wGYj61svKK/o2n4Ugw8+sDEYqb7nH+++0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495684; c=relaxed/simple;
	bh=D8/i7XYTVGYR7pzzh+2l8Icq7lbXgJ+NTJk7Cpi36Iw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eda8dx3O1ITW6bcrZ1Qs9HmwlL53y/DdGP6hiqdFgorQOPYMaXT2o0JaraYG72W3Hilv481GERBOgUokG6aGIYlWNjunKOhJzEt9EYS3NNNi0NlUVpb7vdIujlf/ncVxSVXfD4kyy04Ph6zZS0B+KFHsn71TCONSbJlZ/7fxxpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NAkf6ESn; arc=fail smtp.client-ip=52.101.53.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NAkf6ESn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsq2hkgnIZbCy2w+sNkwN3rbGh0yfV8j7/WZsFrsJE/u0SAWls0TfjLLd9eADXqqrUuO4iv76z5SsZvpGSYQIJIQdXVGl7RCp7tCgAmJ+ceUhm3JoIOU6nt80gwTljNiPFLRCYWjtzBCGAE/4TUUycBAp1Ov/d4h7B90q4cONqM4u3FUKtnjdXAqyxBOndzqUqMsrMI2qeq820QADEY6Krml9b2Mvu9sE83M7E7ShMWLuiiZps+s1q7YdkgrHPmz2PnVQvdaPDYEYnh76WnBOH+RJt0LWSyNe2BfzYyLIU7KnJp5RMBp0YbCeoS/ODP7w9u4p/Fw4N0BZqsxOh+QoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd9UenLdMIu2KiQnRh/YANPPxaZxajcmD4qSqIauJQU=;
 b=gtPuNYn/oe8sa+nuar7JAPKlpa+0C+bXrURvCdoKyxRIXEMEdrN5+QEYUw6cWNRN8Pr3eW7sSbcsEaiGCy+YuPYHH0sWNHNsSy32naLVbeHM1Yh7MfCX+nWQ1iaQ0RH2VvwMbyc2ZpXqdGmaAptOfDBFmsdkeWOf3wMh5eaMv84fYVoAOTUb/x/pZ3yxUN8WCOlr37pBa88mZZhe+Q58+DUFJ6U5nh5eOIBq4mklOzEAl3KMQUuDo0i44Ir6dTEbh5g2kkzkVWzGtLmi7Hxquc4t1V2ETh+3f0TZQx/xZEYbkvSlIQJTkOyjIUSB+kRFVsr4YB8HkDKtdburA9ouJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bd9UenLdMIu2KiQnRh/YANPPxaZxajcmD4qSqIauJQU=;
 b=NAkf6ESnqcm477Tjfvy9S6mONjY+FepRJI0KKVQEgvGL2BjHXllmmzxhyILmrGSfi3L2n+3u3R/rrM9TjoJrrL+JTwsOf9s8JHb6O+k6dxmSs/53df9sOgmZ152zbzojvMMBAUfKvbuN//rFtSLj/4zhGsOfzS5foZ16vKKvZ/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 11:01:11 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 11:01:11 +0000
Message-ID: <e135050d-8965-4e13-a021-ed4674f4856c@amd.com>
Date: Fri, 31 Jul 2026 16:31:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] EDAC/versalnet: Fix device_register() error handling
 in init_one_mc()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-5-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-5-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::18) To CH1PR12MB9717.namprd12.prod.outlook.com
 (2603:10b6:610:2b2::8)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 11735d75-b6f6-475b-542f-08deeef30774
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	NFw5fKKZRSEqQnOT0EUamE7iA4fwBAIocsv44DEkkwsfldfgv6I2OVEN79RCd1dCddHB+kHe5ZTatuZQYC4mFQ+Zuk0ovedAtXi1QVd0tQ3pjbbPg70RIXtRLrvpuyV+3agvZPqSft8q/PxdseEg9BygulgHb6HcKi1OQb7+s0AhwpaU/AZKD0MRl8+MVlJDHZlp+njtM5gVllcr2AWVBO+PG0a/f7++ynWnty2RRil0KqQtCm19Dt178ogRLlIpDXcAHrXiauQ1+s0zxZFAlY5YQfPc4mzHxvOCoMPcJqm0zgraadjv9LH3SVz28UV4oisDJ03neqzIBChjRUnQZ1DSAtWHL3PPEnPYgVxenTnXzYr/CX3iSuVMsJyGScIJ22wRXhuIDbCtuHkKDcU7t4S+jhJIntHaHTGBGp+uEkw3ZJey787Z0lAJUVQ3afwzNusue6SJBDI8fjniBHMJ0EIETLYNb/MkSyIu2x6oAEa3kpH0KN2pV4Jdt06QvaNrup60ED0m3T4jjlI2Kv4KhKcqQuoPbHHaxYi8bLQPZBseuc+Otm7zgbZYrj4L+mg7aN+PM2G9k+OdErx1E5qSPH/zVFMnWnfdt6zXRBY1p1QJI83Wmksh8eeFNxECrsPG6gz8qysK9mr8mswG1m1pW4ehXZ3kUq5NEmk93npR+fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUFnWUpmeTFNalJoeklvZUFjazRXVldBR1k5MFpYa0t4YktmL1JJRGxiNHpt?=
 =?utf-8?B?U1poTGg5dGNlOVdkMlZLU2p0Q29KM0JzZmJCeW5BemUwcUdMQmpTTytxMWRB?=
 =?utf-8?B?dDhGWFhiU3RNVTRlZ1I3YWc4Z3lCUTdDQzVSaVJyYW56aGlnZ0o4QXBXb2l1?=
 =?utf-8?B?d21zODJrd2EwLzg3dlBPeFl5eThKeFFsSWJXcWdMeXJsZGExM3hLd25nemlT?=
 =?utf-8?B?Y3NWSy9qNUk2eVRXRml6Yk1QMGkwNk5IVHRhTG1pQUJrZ1NFU3F3SnhKdDZi?=
 =?utf-8?B?dnRnOGwzS09EaFJYcUk5RHJLNXpFUFNSaW9OQndtMlI2N3ZZNE1LZjlhcDBK?=
 =?utf-8?B?WVc2dEpySTMybTV2UThDN1FmZkZnSWtsZmRzYWppRlMxbTBvYVkzUnhLbjR5?=
 =?utf-8?B?NTZvSm5xdlRqLzhKc2tGbW1kNTZhQ1oraCtTR1BlcHZKT2dKU0Z1Ri9QbHBB?=
 =?utf-8?B?OGRqdmtQMERoL2VXT1dBUXVmblJnb3poY0ZBNW5sclFQUUd2UkxCTGswMm1S?=
 =?utf-8?B?Tnp2QmVNYllqQU5PMEUzcEk3UmwyMXlmU2R5dVhNejdMOXM1eWRCdHp6Q20z?=
 =?utf-8?B?S3dCUElnL3lHSHJIcFRPRWZEbXlNaDFYYjdVM2Z5TGtxNXlTV3ROcmw1a3Fp?=
 =?utf-8?B?NTdHUlYrd2ptWTVHaXJxOFU2WUZmRjRWZis4UkRMdm4zMy9icTI3NHBXeVFk?=
 =?utf-8?B?V2syNlV1WGlYZEF5YVpaREN0VnNFL3VrUVNRT28wUmlrWHlYR3d4aUk5WkVs?=
 =?utf-8?B?eFJzVmZWYnUvalJrU0RvMDZPVjdzM1ZOK1BCdGlKTysrUTV0SEo5dFZlODRB?=
 =?utf-8?B?blFGUzdVK2hVV2JncXZXRWdad3ZpZ1ZQZDZMdXF5T1RaUUZQd3VVcnpwZ2w2?=
 =?utf-8?B?T2EyU29DTGRhK29vRTM3TXlhbUtqcWUxQkZrYzEvZy85WGMySVBwOHpoY0NY?=
 =?utf-8?B?TDRmVTl5Sk11cmtSNkhuM0ovTXQ2ZXB2UnFabUlmdTdmd0wrcFo4ajYwVHZv?=
 =?utf-8?B?ay92TmhBU0xCS2tOc1k3cGJySDN6QVlqYjk1WmhudzBoQ0ZMQUMybnk0QXB6?=
 =?utf-8?B?eTNpTTljSnJOdm1kczAwTjVoZ0QvVnUwMGhKdE5xdmluZmpqc1IyT0hxQjlu?=
 =?utf-8?B?Zk5mb3haemNHRVloLzVvdzV5RnNkZlJNZENZL0ZuL2Noa1J2V2xlOTg2UHdV?=
 =?utf-8?B?Y3FvZDUyaFpDdURXZHdNdXFXcDYxc3lDQWRHeWhob1hKdnNzdjBPZDcvK3d2?=
 =?utf-8?B?OFNjNGtaY0NvRlpSMGRMRkVhK1pQYXozdCs4NFZkT2JJQU10Qk9pYUtsaE8z?=
 =?utf-8?B?QnF3d2NYMGZEYzZsdTNtZ2k4YVhWWnhKOWNsdjNmTEVZRnMxS2dwVXN1OUw0?=
 =?utf-8?B?bFNxL0owMm4vOWlhRkJpaFVJVFp0V0dqN24yMWdqN2Z1cXdNY2hYWFAvMXRY?=
 =?utf-8?B?VFMwNU02Rk5OOERtMS8wOU96bDdXOVBoQjYwbDlvVGhpc0wzaEdkSndnRzlB?=
 =?utf-8?B?RFg1OWZIdG9PVUJqRlRPNVZRQ2JUY2Z5M1ZKVS9pK1JvUmlnVlBUMUNNT3pU?=
 =?utf-8?B?aUM1cFdLcit6QURubi9WbDE1QXF3STdibk0vU3lOOVBoSjBhaTh3OE5vbkw5?=
 =?utf-8?B?TGYyczJFNGZEenlsNWZOemU1Snl2TUpmM3AyWTh6YVJYdWtUQmtVRktsNCth?=
 =?utf-8?B?T1ZpU3M2RnNXME8zV2dPSU5rYUdLSzhvQ0tkOGhBS29maWxTalBKZENqZENw?=
 =?utf-8?B?UEMwNmNvQmhtVVVuSTF5c1BHamdvSzVMZE5hWU1KWVVRRW1wTUVpVEFVS0hH?=
 =?utf-8?B?eWRLelhLZVFKVWpUZmZ5ZFVZR3BDMXl1c1N4Vk1Sei9JUmtlQ0cyN0o5azFr?=
 =?utf-8?B?eW8xWEZHUVR2QmczMEdGTGEwQ01kQUJGckx0OWMreTg5T1NhYnNLeFZreEVP?=
 =?utf-8?B?V05MVXQzUld0YldhUmNYZDhpNng3NEF4b2ZCZHdJL1dpMVp5czBFdnhiZ0hn?=
 =?utf-8?B?VzBkZmIrbWU4ZDFIU1NVNjBBUGRpSEJzQXJhK0U1c1paRmlIcXhOQlZQTnJv?=
 =?utf-8?B?bXZzLzVzUVV5SngweXoyQU5MSXhCMVJydEpPcGVIMVU3cjEyWXdhcHlNSDJn?=
 =?utf-8?B?TkNjaXkzRTdHd3hkajFmdDVsL1N4bHRLQ0RsYlJLVmJBTDE1L1hvamNNWjBD?=
 =?utf-8?B?L0Z6VkxZZ1JQN0Jrb1Q1a2hCbjlyZ3JyZTFwR3dWKzZtUmk3UlRDSVRXSW1y?=
 =?utf-8?B?WFFBTlBWVEJVU2hGVVIvRlQ2bVhoVTBVc2plWU1sVysxV254RzB5MGt1bUpr?=
 =?utf-8?B?cUJ4QUdVT2d6bmRMQk9XdElNc3pBRmRBSkRyN3EyYlJQOGl1Q0FBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11735d75-b6f6-475b-542f-08deeef30774
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 11:01:11.0688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93g2PGhoMB7dVno9CFsQnAQ7hJiIZ1Vtr6i06wFtTHuUKEnXsIWMnKYVQJMF5ASB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> 
> When device_register() fails, it must be followed by put_device()
> rather than kfree(), because device_register() calls
> device_initialize() which sets up the device refcount. The matching
> release function versal_edac_release() handles the actual kfree().
> 
> To simplify error handling and avoid complex unwinding, split
> device_register() into device_initialize() and device_add().
> Initialize the device early so put_device() can be used in all
> error paths.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>
checkpatch reports - warn.

WARNING: Non-standard signature: Co-authored-by:
#20:
Co-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>

> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Nit - this is Co-developed-by: candidate as you did changes on top.

> ---
> 
>   drivers/edac/versalnet_edac.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 03b6e0958f17..3c9eaea5a106 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -785,7 +785,7 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   	char name[MC_NAME_LEN];
>   	struct device *dev;
>   	enum dev_type dt;
> -	int rc;
> +	int rc = -ENOMEM;
>   
>   	config = priv->adec[CONF + i * ADEC_NUM];
>   	num_chans = FIELD_GET(MC5_NUM_CHANS_MASK, config);
> @@ -817,23 +817,23 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   	layers[1].size = num_chans;
>   	layers[1].is_virt_csrow = false;
>   
> -	rc = -ENOMEM;
>   	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>   	if (!dev)
>   		return rc;
>   
> -	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
> -	if (!mci) {
> -		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
> -		goto err_dev_free;
> -	}
> -
>   	sprintf(name, "versal-net-ddrmc5-edac-%d", i);
>   
>   	dev->init_name = name;
>   	dev->release = versal_edac_release;
> +	device_initialize(dev);
>   

There was a comment earlier from sashiko: After splitting
device_register(), the edac_mc_alloc() failure path calls
put_device() with dev->init_name still pointing at a stack
buffer before device_add() copies it. That's unsafe in
principle (dev_name() would follow init_name) and worse with
CONFIG_DEBUG_KOBJECT_RELEASE deferral.


> -	rc = device_register(dev);
> +	mci = edac_mc_alloc(i, ARRAY_SIZE(layers), layers, sizeof(struct mc_priv));
> +	if (!mci) {
> +		edac_printk(KERN_ERR, EDAC_MC, "Failed memory allocation for MC%d\n", i);
> +		goto err_put_dev;
> +	}
> +
> +	rc = device_add(dev);
>   	if (rc)
>   		goto err_mc_free;
>   
> @@ -843,7 +843,7 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   	rc = edac_mc_add_mc(mci);
>   	if (rc) {
>   		edac_printk(KERN_ERR, EDAC_MC, "Failed to register MC%d with EDAC core\n", i);
> -		goto err_unreg;
> +		goto err_dev_del;
>   	}
>   
>   	priv->mci[i] = mci;
> @@ -851,12 +851,12 @@ static int init_one_mc(struct mc_priv *priv, int i)
>   
>   	return 0;
>   
> -err_unreg:
> -	device_unregister(mci->pdev);
> +err_dev_del:
> +	device_del(dev);
>   err_mc_free:
>   	edac_mc_free(mci);
> -err_dev_free:
> -	kfree(dev);
> +err_put_dev:
> +	put_device(dev);
>   
>   	return rc;
>   }

