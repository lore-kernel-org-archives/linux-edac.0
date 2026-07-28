Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010004.outbound.protection.outlook.com [52.101.193.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259E8440A03;
	Tue, 28 Jul 2026 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263267; cv=fail; b=enAZDx31AGmytYGWem7O4EHgqBlf9rBCeZ1XKf5BVl4EKU48Yd6ScUdss6lJ7HJRPW9YGL6nG7XJfXQ6a+RnY+Dmi9+c8435ff9p8HVvi7eSbsKgJY6O1xPoCyFTa9pVsimtSOei2JNTx0T2Kf0UMJc59qpu6vLtyHWhEK0WuEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263267; c=relaxed/simple;
	bh=CQJRwERseLj/VR6YpoD0vN1+EDFRtQEpZe2OftDjIHE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mgvnwua65nYt0eINkUM02345oA7a73VuWhTNNPCSwP81/16a5kDi4Gx43Qs3FaAb/pHH6rz0i1aBoPdQ3aw3EmY8NKdzSAwMLWhAU2+0MS88bGv400Abc6AJz2q0zQVB8mvFrU+mB7QaegyeDH07jDknqyWBiTzrZkB9apZjzXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sYt7ePbw; arc=fail smtp.client-ip=52.101.193.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sYt7ePbw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dntqV7MAKKXE8vvCWceKPYKZ12QTjU9wWndwEyhNQIBYF4T27BtfwKT019rnA1Ux2cf48LStk95IwAQOn+/o7UrDDPNZcbXfZzhVu/d9gXO+90Jpi0LwggwtYHMrY8mpPburm9ekKTyaVPclZd6TNx9rWXXJsf2SoQj3kOiR2mto0vOTG9vf9B0PhCllgwmVxJkdSbm+cWqp1Srr5TGLwaQVSrbNhhjNJ1Qd+6YDWbjcVWFwP8RmMhGv/B+aQMKGFulpUVhrRMpMQRjAaVi7HrmNCzcR1/Bamv5Fq+36uF8YcQezRkMHjPp+kin/NnufT8y5aaY3oQ3p2Hq1caUWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H32I+RdQ/4NdnVS36XnWYk0/NVw4mtb6LdXfyQIDVYs=;
 b=P6LCzE8UNDwjb1Ljx/x83TA5tm3u69QM0Aj8pm2qLSlCrdo6ZSVMk6W9ApDuC8rYiwBAwQRHWkJqGFxufPbEDwxwxoepU5lRPPq3Zvef361kJAXEJ23Id6IxPkqNTs8AedxGqsy7znlpKECyOiXQIyjgiQN3vsdY0Z0sx/hTW0io/XKpyzS3OWrxyQTThe+ebzzN8KZi0jgdVQNe4a/CmU7WHG3/afLe+YzOkvLoFXe7Kjpmb7UBDE6fCuDfbzCdJt/sa413yArUx3Fmjt1gs3Cp+ZUBKFkkDHHlkrKiNuvBGm7nKz1GJHZdui4bCWv2G6LvDqL6gnyRE5yX4Qh1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H32I+RdQ/4NdnVS36XnWYk0/NVw4mtb6LdXfyQIDVYs=;
 b=sYt7ePbwODQghC9U5/SBv+a7tyT7/IIlY/dOghUlcakM27TyY/0iOGq35BOxON/NmmrNA7M7jwpIupnXcTBam2t9xtj5cUkjBlHzXuIcWMW4I/1Njqot/4pW0rmzs2jBNBPRVfyIKU7tNxVDleQ4yP7H5/POsSpi/gDukcVl0rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM3PR12MB9287.namprd12.prod.outlook.com (2603:10b6:8:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 18:27:36 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 18:27:35 +0000
Message-ID: <5554052f-398b-4507-b2af-152a7695abea@amd.com>
Date: Tue, 28 Jul 2026 23:57:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] EDAC/versalnet: Add NULL check for mci in
 handle_error()
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-2-shubhrajyoti.datta@amd.com>
 <20260726235228.GAamadvFK6GYNRx_dh@fat_crate.local>
 <511e62ae-79e6-4931-a7b0-4f0c3830cdcf@amd.com>
 <20260728013725.GBamgH1WcvOaEtAw4n@fat_crate.local>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260728013725.GBamgH1WcvOaEtAw4n@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b5::9) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM3PR12MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 80c92b16-181d-4dd3-7c0b-08deecd5e580
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|4143699003|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aUTUuF5PqhyT8FBsmLPZjNLGYNDyIyxE+6VLKA9wnOmP6MiqgIjSYQ6YALppiqyrQE+bEthJREaumpgu0Xjzpqz8UW9gwYqeXEhjrtii2EMes1pUObOuSFrKhNCzxduT36A+uheMFLuijYxVELoXTORrIvAt1+H2jQGtoMzLIGcC1AORamCaNVV5WbXFpHnHSKR2EtZShcYAvjh50+2xc7cgo1v/ArrybzKVR+yICzd9hfSd6zt+Gj/yrou8ZXP/4k12ZbR20RSQixMBpo8br5HhwqPdXmtzWfesmQ+9LD3jTSZ952btNxfb5FIZVd9soMCxJBg7BkRmRlq9FPGkZbEq2pR8ghWtVLp8UWRTceXgLgQjHTC/MMEbgiBPJu6j+Q4R4oHTaDAIoXeFZRCcpiBTdKH7VIYbUEiNcvZGUh+jI4hdgkN5Zus+tWTdivrfP5dWR8+QHpQ486qbBtfw3w8gXpubjrHCAValCGF+ydyv1Y4oAEKt7BQ4FkpQg2VfU0VZDiolj8/o5zBaky8XbII/bYwBJ2DfzTw2/QOxloNhIEvuDbYwoSCvfxmE0KkCqFRvoyJMPCo8+7a9DyRxRuP4bdE3WQmyxKtpv/MWmqcwwtUYjy9aP0y1RhvJX4b2djBR8CglTkEHdYF0f4nwmmdemx07zTZmOXtzEbYMo0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTdESUZoTDBSdmIxS2dvUFl1U2xzRWVTbVRLQ3RPNTI3S0RVUXhoaUdmbk9r?=
 =?utf-8?B?MEtFZCtOUVBjWXEwL21GN0s4R1pDSHBBMGZrM016NGJYenF0aGU2VzNSVzFN?=
 =?utf-8?B?Rk5lazNsZnloTXc2MXIyZWU3cHBKWWRHQktVZjd2aVpSVkp4eFhFdFFRNnIw?=
 =?utf-8?B?YVZTUUdlbFVUWk1iaFBRSWlVQnl0OE83bVJIdGFraHpsTmE4bDJCNHpRZmsv?=
 =?utf-8?B?OGFlUitsNTYzS1BkcnhESnYwNm8ya0VKMFdLYUh4Q2ZHZDJVRm5ORld4SmVv?=
 =?utf-8?B?ZjczZ0Y5SVg0aVJhUUpqcndOUWJ1eDJQSE02TFdtUDlocnVka3dtSFZjVkFN?=
 =?utf-8?B?RHlTbEZPMFVvRGRxdFhrUjhyUVIrOFFjeDdEa1dGMDVRZTZzV0NDSExya05o?=
 =?utf-8?B?dDRDSU1pVWtadFhmS1d1TXlhK0xUcnJZdTlLaDlVeS9QNkdNTTZ6MzBORzBw?=
 =?utf-8?B?ckZuckpxRE9STHJ6WmRZZE1pRlVBV2RIcWlyRjBJWTZId3FnZVBaSjhVYW9X?=
 =?utf-8?B?NDJKOGpkbjRYb3hVdFlTNkptcExCSkxCblFqelZMZFd2TVBsbElpeGRqK2ZY?=
 =?utf-8?B?WitROE4xbzYzSTkveXUzYnc2bVBxL1htdmZrcEUwUlJKWmJ2cmdYS05DNEpB?=
 =?utf-8?B?RFNMcDV1bGhLYzNJTGN1elJmbk11em5uZlRXYS91a0NWdHdBZTdFbUNMUnFK?=
 =?utf-8?B?TXJuYUxHbHY0ekhIUUhPcmhIclg2NGJTblhVVjU2QncrZkltWHZUUzBiTGMr?=
 =?utf-8?B?bmhqME1PWW5PRlRYQ3lYenpaVURmZi9hbUZSODNtNGlPbkljYWx3ZkFNL2tS?=
 =?utf-8?B?bk9zemZ4TU9adWtVUllqVmR3SHlqNTd1bGw0aUloVnJBZ285TjUrb3R3Yy9x?=
 =?utf-8?B?S2QwclNGUmtJSzNSemROQXp4TjhDUGNrbGV5djFIZW1mYVZhbC93dGtsMU54?=
 =?utf-8?B?UHZRZWs1d1RCc0xkdk4waG5IaFRrQ255ZWxtSHJtMjhOZ1FGYkwzRzhqUm8y?=
 =?utf-8?B?d1ZaVjV1b1B2cllrdFdhVS9YQVIxQ0F4aU5jWWVjcnRzMlAvaWdRRjhXejVl?=
 =?utf-8?B?dGNGZ1NXOW5PSVl0TkN0S2pScjBVZUwyZjB5TnYvTFJPSlMyWU9yTzJtN3pX?=
 =?utf-8?B?aGMwWGlTUUdXOGVDaVJTdUp1Tms5MGpnYk5SdDEzTWxmVGs3TmNSY1B6QnRs?=
 =?utf-8?B?YkFuUWNTM25aQTE1a1g1a05PdC9ZWnhjTWVHdm91WGZPNHlKdzZLdGNjd0pV?=
 =?utf-8?B?ZzV2MzltN3Y3N2M4WkJhc0UwQ3NFWDJLL0JISDhkMjJKMnN0WmRwNlNvSWpL?=
 =?utf-8?B?TjFCZHRmSVVIZ1Q1ZTFRZE1Ham96RDBzNnJYa2VGbmV5Rlg3V1hwY0VneW5h?=
 =?utf-8?B?Rjl3RlUwcHZqOGh6eUFLemw3MFJnc2lHY0Nyd2lkOVNKL3VBeVd4dDZ1Q2ZI?=
 =?utf-8?B?UStsOEZKY1lGV1JqUncyLzRqYmtlV2dSRlZPVFFXV2RucGF0ZlFpS2RBS2or?=
 =?utf-8?B?L1pGVUhhbTBjWW5DR0daYnhYZ3lybjQzeHdrbkExbzRGUEZBY1pMVkN5M2Zy?=
 =?utf-8?B?L2hyT0xFeHh5UmFCWmNxRll2VXlJdFVSSHAxbm91VWozbzRZb0czbjJBbzZr?=
 =?utf-8?B?dUxkMWUrV2VjYUZ5K0kxYjBmcUZMVTNDYlRvSXo3V24zdkRIUlZUTGZHNE56?=
 =?utf-8?B?T0Jpdm5YVTF5aGF5c0NjVnhPNy94UGFHL0I5WmxPRTl3ck16eWtQUDg1cEdM?=
 =?utf-8?B?OHV4ZUNNRjY3QnZkVWpLV3krVWp3Ti96ZWpjOE9aMDlnbmpiY0hGMS9TL21x?=
 =?utf-8?B?MGhRYysybTZ4NEQrdG9haHFoZnN5VG92Q0dOaVpxaG9mNWNlQ2lHR3ZiKzZz?=
 =?utf-8?B?MUdrYi9zTjlmakZJMERnM2orTGlRRXk4UjdEMGFNQjdFS28zeFdZSVl4WmFV?=
 =?utf-8?B?czZaVW9FVzB4QnRZR25wdm1vS0tONVlkSTRoMTBLVHp6QTNFZlRYUEtsNFN1?=
 =?utf-8?B?bWFVckpoWEdrOGxUbW92Z1ZpZGpLNlhzYko2S3BJWUx1V2RqNnQyd1VpOG9S?=
 =?utf-8?B?eitPeXF3MVdZeXlQS1R4YTNHS2Z6QjFpeWdHaC93L0FCSGxHQXMxc2F4QUZo?=
 =?utf-8?B?UDVPTGdZSG5kMHIycVJRdGVMZnRtTjhzcGFjM1lrZURLZWZQNkZ1eHBlRWgv?=
 =?utf-8?B?NUVmU1dXc2lvaHNHWW85YVlCbkFaKy9vdGVPbnVCRjVJdXdLTVVpa1R1U0hX?=
 =?utf-8?B?bmI4KzcrOU5xZFRPK1V0MC9kSEMzOXAyWEJHSHFZd0g3N05OTWI4dkFtN3do?=
 =?utf-8?B?RFhmNkFlbHd6N3g2ejJweHMxd1JNNmZaWnZwbEpwelJsZ1lXNWNQZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c92b16-181d-4dd3-7c0b-08deecd5e580
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 18:27:35.7519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uLdYgNlub8QeSKe2hfOGXwvpFhegPy4w1c3ulXSAABhUttghMuZeSGGS/Zj6422
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9287

On 7/28/2026 7:07 AM, Borislav Petkov wrote:
> On Mon, Jul 27, 2026 at 12:18:48PM +0530, Pandey, Radhey Shyam wrote:
>> The gap in the driver is that init_one_mc() returns success without
>> setting priv->mci[i] when the bus width decodes to DEV_UNKNOWN, while
>> buggy firmware / future firmware rpmsg error path can still calls
>> handle_error().
> 
> Aha, right, so I missed that. So the right fix is to always return an error if
> the function fails. So that the proper unwinding in init_versalnet() works.

Thanks Boris.
One clarification on DEV_UNKNOWN: on Versal NET, the driver exposes 8
MC5 controller slots, but a given platform may not have all of them
configured. The existing path treats unrecognized bus width as a skip
(continue), and the refactor kept that as return 0 without setting
priv->mci[i]. For that case, returning -EINVAL would fail probe on
designs with fewer than 8 active controllers. Actual init failures
(alloc, device_add, edac_mc_add_mc) already return an error and
init_versalnet() unwinds as intended.

The NULL guards in handle_error() cover the skip path where priv->mci[i]
is intentionally unset. It can also be a check in rpmsg_cb() before
calling handle_error().

Thanks,
Radhey


> 
>> Happy to drop the check if you prefer otherwise we can keep it as a
>> cheap guard for a firmware/driver mismatch.
> 
> You already have that at the beginning of handle_error().
> 
> Thx.
> 

