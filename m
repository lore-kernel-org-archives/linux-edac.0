Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA783CB2D9;
	Tue, 25 Aug 2026 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787687827; cv=fail; b=svw56wkwJCJplmEo6/7Rh7ueOurDzNpDXZyNg2ED12ulKGD3cC1zoVpcHyi4tZ2UQHY08X/aOIi1AHjrtvC5oIHiR2wkpatzlEWk9TsumZHyDk8dIBUfXCIvoP43XCL1smW39TrpUFswxPXPKscO+GuuRx7HFwSxTBwBiEB1Wt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787687827; c=relaxed/simple;
	bh=v74RlJ2ULBgOdyAMTNYd7aM1izIOA/AeGMWd5rZRWk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UCFWwl+69tBcHv2u7zR+LPZdbFx4dNWw+empWOjtqImuFAK3ADsEi6M0nYPn9dkJUsVFAa4EPOvDaFepzIcT74cryljnY4xmm4Np63xTkEGVAIwFSlbJV5MewM7uGD10CKrGo3cgnIhnwob34cXbH1lyC5k36/E2mT3J7VA4lcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lvlCYUOu; arc=fail smtp.client-ip=40.93.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lvlCYUOu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJpr0we1S7GSTmq/kDTDfNmOp9pe4uBaBE1W60BNfb61kzVwfybfNVoZlzhG29bPEBMU75d9cdiDo2MatASE8HbD1+Nw+2EbuU3asMdcW9EFh6FY58l/HzyoMVinPfgTcXtgwx0JRXcWxVs1H6CoWZOwPhlugRh+K/Y7wren8DgDeXtPK0nyzD7TUcgj0SDvScV9aPZU3Ey44HUeZWAUCmQDLcBxtrfaNABaAMwAQsQwglCGLfhRDGT3RPmXrEa+og+RPiTybG1Gmfdoi23qXrTh38E/Ohh7b86HrK4CwXww3mgoXhR69D50GInQlmLK6H1+3jqhyV4IS8g9P+Q3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT68bFkOAxGubliMl5g+GF1LiGdAO/3e5p78zpQeUu4=;
 b=GoztLabgS6+QKqtQi+1cRy6GCRhv8f4Q3aOFn6ieIt42mHwtGVXYjmJ/WUe+uwY8MRkT6Udw20E1E5XVyGbnhYNIsAPCrdwJbbJ/r8EGBItHLbMH9zwLitXukdM4oCqC5bVsNP2kkoHiWoHW0VseLTeEKcpPpsyrQhWlferK1ECGw5dTExuX5dX5F1AaAQcdZM2ftJoWI3H0Il/8GUcthVWK0/sjzbLQiETpMJ9CeRM6L+9smmBcNdjmrWR47cxg18zUnB8RIkG4YC/fdJhinJ/ZeEXjdmDTgMskaCNNx2lvXa7q4XDMzOXUlXLhHoSFQLCOwYva2ypul4E4+937VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT68bFkOAxGubliMl5g+GF1LiGdAO/3e5p78zpQeUu4=;
 b=lvlCYUOuUflLrtFXt3jB2g7BvehUs6oZAfMKTs7XBhBMmsl5oEro0aHg5q/+LONMLsYLBxjWVyxCXG52k+5veg9GVks2R9PgV9d+UPQoHiP+SG22nG0IrcKLe0OM5h7xQ+wjqi6zYiHJpE0pIytLSpyyud0+g063BxyJ1Mf4XzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.6; Tue, 25 Aug 2026 19:57:03 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 19:57:02 +0000
Date: Tue, 25 Aug 2026 15:56:55 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rui Qi <qirui.001@bytedance.com>
Cc: tony.luck@intel.com, bp@alien8.de, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] RAS/amd/fmpm: Clear new records bitmap before
 rollback
Message-ID: <20260825195655.GE1500179@yaz-khff2.amd.com>
References: <20260821094748.145394-1-qirui.001@bytedance.com>
 <20260821094748.145394-3-qirui.001@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821094748.145394-3-qirui.001@bytedance.com>
X-ClientProxiedBy: BN9PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:408:fe::32) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f153db3-b447-4c39-1021-08df02e307e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	9CUZmMSUuHAROEGC+fUvn5FChto8B55wLisXefq6Nw92fwzBPiTcLgBDkmgQWTlwouCvLvpp+REWZAd3pAB9Bq1fdIKO/NuBIkcOXVGVn5XIy/bvHxTm6bs3auNc6gJUUvTc9vtZaYDVpmRlwYxLyAjHQ+8twbd8a59xjGRgT6mO7ry1TQ+xFZdkPgFoD29TerihsYud9MfdtxtRmpXtd/0PtI/ykWz3aX/CQ7YAL7a8nJ+BUBo9yIV32Fs79HaB8d+n/uYFy7iEnjsxdgtr1SaEZLZ7GRxnPrMQ6E7cGX5WrdWiHaijjnYcyxTChK0rakvgd1UGeEDL4Oyr9c41q8lhDGvipnpRPmiQPziYQNHF+epqEmUrmziqqs1zj9OmVFTQX+TvG/jaqV10CJOPclDXHI4fx05omPSU+DG1gMrtBz0gxvlqUL/2wQS3RzgcIv9y7DBPE+FX4mqrJWXZOyJx9TJfsZSDMHWfFwW59J5OglmamDotgxNEPQHaU9u43YLTpIZyEdt/bHVL/B1/OHW4gNmeXqJsmnG9rZ1BnPhuM0J7uMY8+QQB8h/kBIhwuQlm1a21cWvKCkCggcG3YY69UECcr2O1bFlaMx4kTPnPch6YN/BoEq61A/2dM4YePRX5aFhcp+XQsErBKX7nsyCl6z+4nWPUDf8VPu/nr+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RfDAT/immUA9Z4P5r+hNkix6CnYUby3xAHmhA3BF2l6MLIc1ehPiAIQBDDGd?=
 =?us-ascii?Q?qntir/bKu3tjo+o/W+mDCIquX8VRhoq5TivB9hgZXucvFGH7A+l1cte1RnEb?=
 =?us-ascii?Q?TNtoGzfeDgz/lrmp3//q7SqAdY8szsmInwfto71QdAqdQ4zSHVOH3oEtsSx5?=
 =?us-ascii?Q?gia9H/zgK2zpEpqcjgy4XAXbxZCHLFFJncmXYap2ir1Fzvh5urubiKzWyNmY?=
 =?us-ascii?Q?PnIN9OVSLhWNuYEsfsX8wJixTVH5/iiaZbfGsHt7c18IffY4mCAxTXUT7nCd?=
 =?us-ascii?Q?dRqkuCzEKcptFrtu+0f9SQ3XMGCuWkyb+mWOck8bzj7uT9i+03H/mBlqr1h+?=
 =?us-ascii?Q?sJBu090dOO2Jp4CgZyXwTHNgwx7ynGg9KoBOQvU7d8Cz01v0HK846dYh3hNk?=
 =?us-ascii?Q?zKm8YQ/UJKujBd0rulqn1OUE6bu0ombEaX/ET5SCj7zIV1vWL9vt8g25AjKV?=
 =?us-ascii?Q?7eTNUBSNtU7S0WpbOHTy+xxTZIDLTwJW5xeCjgc/TZkpxH4XEL2sS7pAKLc3?=
 =?us-ascii?Q?d6Ro8Ayhd7S2H4dkv6yaH1dPxumWTKEe13ZEgAAG5qxCeCKvWdaMHOcNJewi?=
 =?us-ascii?Q?MYGSW4hUDEPiFNNwb918DbWEFkyFMD8CUTiw8rcwIAo9qlP+7NKGd4qP4Ad1?=
 =?us-ascii?Q?rlC2x9e7rD8Ouz+Eyquy2kRzL+q9H0pQHy+TD3vZwMI4MqJX00iQPmLxsgE3?=
 =?us-ascii?Q?0xTjkBoQ6dTNSQaTN5bC8YQ7ff8FNcwkYnpDhkw5tUQswYR5eajOTQqOa9t5?=
 =?us-ascii?Q?Tzqqu/67YBonoSoDrgt7zuHSLTp3Hni50x/1ytXmliehV9D8C7QF1WGSDfMQ?=
 =?us-ascii?Q?w/XUTaQdRhvOIl3tsgr+NEdf/REUS4EgBZZ7e/eHfPvGoYzbh9heuaJRh919?=
 =?us-ascii?Q?eaXOmgoSMteycYsWDOYhX8OTe/m4iB2pFU+R0pnUJ07pXpS3RyZh9HxFfhTI?=
 =?us-ascii?Q?HRqd1eR6iDlZtxF91S/8RYIZKYNAmCuviGmJQGDuYjjR1ABRhELL/cxwAu4M?=
 =?us-ascii?Q?ndxWtnQoPQuCgJ+wIBseTL8WyhF+0eX1xdtsJFU7BKCggyldSL8gizCMB+TL?=
 =?us-ascii?Q?/REj09pseoIzyZ4LEbwf/Xs/JHEq3rMiX3Hcyp38E/OYIOpGd+HU3stYYNst?=
 =?us-ascii?Q?AYoRv4D1FA2Sg8YK3rD0NpsODHjprzYqnulWPKv1QBIG/jgG1pqOq7PoiHkk?=
 =?us-ascii?Q?FYhYC3Yht5n9Uf/mAwS4VpQ336OYBkKFFHn0tknnqGPj/6VLO3jQschFNMwu?=
 =?us-ascii?Q?NZFfOCeDMEoeB0WtG1wK8wRvcULvPyz/+K5jRrnWbeksIOcLF3RT9FfPzcHW?=
 =?us-ascii?Q?6qWcI0If7DBLxYet85+aEgADiVtUnZavHO0BYWofzrpYfn8Z4BqWzQ66ZGMT?=
 =?us-ascii?Q?ff2Xbyp7IrIIqSsaXgipz++QfyhSUf1MAs1UhkYy9pZ2Nf9an5D7OQY1zqsi?=
 =?us-ascii?Q?erBloyH2JWMPoiW2v0r924luuaBWlCCu45wcfphHS8UYwVPEywaVbRf1MBlv?=
 =?us-ascii?Q?5en7c6Yb9a32a1lamS36AwZMFz3i2KGfvKgZcD7WJMEPnW1Ed0HOjwQKDpZi?=
 =?us-ascii?Q?2uC/LnTZOKRWts20xSGPPdGPvRrWbgjVICouWarHfQKOVEM3cYemRNmQQTPw?=
 =?us-ascii?Q?p5xKy4MN2X4r0hK/bhTjUgiXB0beIHCYv8IaUtZvUH0EPJYJ67CUz2exc8Ed?=
 =?us-ascii?Q?8iLCEDntc067XTOB3/tg/0cCLI8KZtB9TpkeaLeYHAJnZHiuKydCOA93SITV?=
 =?us-ascii?Q?nDsHpULgXA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f153db3-b447-4c39-1021-08df02e307e5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 19:57:02.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieXqSK6y+TE9RzB9PjSfh1SF0aMJ7sBbUsMfKqdEd/lZjY7o/EXMVInSyH8OtbHMc7XnBNTA86lwV6hgixEXlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481

On Fri, Aug 21, 2026 at 05:47:46PM +0800, Rui Qi wrote:
> save_new_records() uses a stack bitmap to track which ERST records were
> created during the current initialization pass. If a later write fails,
> the rollback path tests this bitmap to decide which records should be
> removed again.
> 
> DECLARE_BITMAP() does not initialize stack storage, so the rollback path
> can observe stale bits and attempt to clear records that were not created
> by this function. Clear the bitmap before it is used so that only records
> successfully written in the current pass are rolled back.
> 
> Fixes: 6f15e617cc99 ("RAS: Introduce a FRU memory poison manager")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/ras/amd/fmpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/ras/amd/fmpm.c b/drivers/ras/amd/fmpm.c
> index 91c49080873e..0231163e2634 100644
> --- a/drivers/ras/amd/fmpm.c
> +++ b/drivers/ras/amd/fmpm.c
> @@ -533,6 +533,8 @@ static int save_new_records(void)
>  	unsigned int i;
>  	int ret = 0;
>  
> +	bitmap_zero(new_records, FMPM_MAX_NR_FRU);
> +

Rather than clear the bitmap, it can be initialized to zero.

  DECLARE_BITMAP(new_records, FMPM_MAX_NR_FRU) = { 0 }

Thanks,
Yazen
