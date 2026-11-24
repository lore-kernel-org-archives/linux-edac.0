Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795510622;
	b=nZtPkTaki+q3SPBeSk9fWx4xPaat65c5ER1f3+/Ny0ecTIAPW+J/x7oAnGxE/woiRMkU
	 owH0AMKUthK3HijpHKAwVDc+9b5KZufzMTd2toq8kx/cjsRbE794rc/y/Q6EMwNlzLmra
	 KBV1LI1rluLIFW8L7kyFdnTne3vX0tdfl3Q/ynFpNSAOHXjZhfbCI198S9Rc55CNN/1Ar
	 68xjvGvMvTq84Ddopy4ozETRYjflJnpmQhFpnljKwdL2HmN5WyP4UG49B2ebSMVXtQ9QU
	 xxOJ3KBnQkC58re7eVuTrbezy0TsXZdV3WOTn4F/LT/ndFea+hRW7XHlr0UcL96oOKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510622;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=xRFbWhxNKQIh8zEqErH54U+NlIR4X1Kp/0zNXnQzeGk=;
	b=IJKYy9MdtaosEGWDgb96tStJSB9MiuzTJAOq1GMGZMNav2bb1MRuLWutrxW1c6jL5MXh
	 LDAHQ2V6xCsf7cueXDeyESxCcq0j/yodS8eadsBkYMovGz0N7AqBeLI8kfQKe7qfhBw63
	 fTcVFhYwV/LMWDaecw8wj12fUuxuvQIqyF1+dqCJ1lwh1zgVi1jCGZtNQAzJoCDdnHyr9
	 dALxObbF18bmtzzWQOdI/DbkcZC40MBgKiqJY8CHxZBuC3KssZvWxFMWIoULDFtAjoNDi
	 ynifTjnmoD8MEedp7HkP/NFI4V+4fpwnt74EBk7GXuYD8tVh6yN/Zq4PoI8Q2+OXiGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FR+u76rA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.44
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C660606A31E;
	Tue, 24 Nov 2026 08:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C660606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=FR+u76rA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzt+qzYSOshv70zLIBQ3MYwB1OtY3JUo5Jg9t7zvFNzjc4uZ9xSgH736jOZrXRt6j77PqT/Y+zNLK0Yx/qfj91TZrxFY9RF4/WqxqvOKkiOiaNpTm9jliZWK7iA+U6MpbAqWvQal/buDa4PiCB0YDyifSrDqObUQirOAkscHCMNGO2jLxTpK78ebiQkGivZ08m7ECUfVtEyBTssABz7VYjKjD2ZqAGXzho32QnY9CjHU8lR6iFeSgIHveU9+z8bc2T9Q3tnusnvbtoF+DLjIlz9HHzW9ZjO31J4Qk43rpR6thxHKWgHizqoZvuKpIloT1g3Bh6MPKnoKzG6tkdvrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRFbWhxNKQIh8zEqErH54U+NlIR4X1Kp/0zNXnQzeGk=;
 b=YI9rUN1tRsU2HPZ00IGYXbwp/kNkgsoQV9xrRidmqZ1lhXR5bBaLDS/q+wIA2dKfSKkaMPSJ7F2ubFt8dsii0VTvB4ytutfKfwYRGD36c4+jhdzwvaBeYAPa0bGeUYMhCCPixbhpnTXhg1Lg7cQYvrcmmfZfnHSVSV8Qv2NQ/fWrEUYUKaL9YmDorSWO9MRLBLnJIVqNTzkf+JWGgddGTWORsXA4VxeXo2sXy1uWiHavY0ZB1BXuTreRiz6dbS2Ca7BTO9tqzCaQ+T//Q8kHkmsEJPWjL1RaY55kjQ2qPoIWLmVvLOmXKlCYKhu3bZ36PWVyv17B/pwb3m9Zerqw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRFbWhxNKQIh8zEqErH54U+NlIR4X1Kp/0zNXnQzeGk=;
 b=FR+u76rAsUzR2nSjdL+I4Rnln1MdK8OHqVBCeBn5b3gcE752ddqkcJdSaA174cJ2mhmxqwY3vD5u07lpVMmcucFGc9Z4Poq0orur2bf5G8gP/ZoOQXcB+Ncl8MFqccpWXdPHCg0Lk9voHcLyZZyPCiFoAKaWHkN27A0ikPofA9A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by IA4PR12MB068426.namprd12.prod.outlook.com (2603:10b6:207:12a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 08:56:58 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 08:56:58 +0000
Message-ID: <b1036e45-dfd3-42b8-bec5-34c59447a25f@amd.com>
Date: Tue, 24 Nov 2026 14:26:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] EDAC/versalnet: Make get_ddr_config() return
 errors
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-13-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-13-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|IA4PR12MB068426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6e3d01-e526-428a-3915-08df4a08e52e
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|18002099003|22082099003|261009223027099003|261021121427099003|261021133027099003|261021123027099003|261021130227099003|261026130827099003|261026140227099003|261022105027099003|261102123227099003|261026121527099003|261026135527099003|261022115727099003|261022113327099003|261022075727099003|261028144727099003|56012099006|4143699003|261021135927099003|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	JscW0Dg9N1nEirHlQE40ejaeoY6tmiCz4P42AMSKCxsWlRiYUk25eUjXETBrXIbiPDHJm/concl//iRXR+rToay4XD7AargzTMTLz5Hqvm6NmAfzqr7spTNVjtn9EAbzsSgcvCy/rPdXCOt/Va847Mh0bHQdf2YqMoFXjGn9Gc7Xt1yNkRg+EuHzShvUCmH/GCsmMrs1wCzLgCgAVxrWH+lpB3oN9dnUD/ZMk7QLCSaun7rTi45mjjTjMiP0/cL+hYA1/NjgdtU08MoCEgR90S11xrgEcPNB1zELjoxmZW0x1g4vTH6MKhhqwOpwNTDfvb4K+lyM7Is3Xv5iSepD48EIS/qEtUQaJ9pe8P3ppti+WPeJtd4Nl1ANKVaPkdwBxFLLOIOeIMBWqSazCPvnYJ6v6bncBX5PBIs8hZXTtL+OY+StPQte/FdKtB6MZkAEGLM+mDjvrcWGzsXog+svhQP5btEM1WII+oNd3DX+Ls/GZfjzr4Ye/yNDY97k2FTLKSmEWIxZ4jmMEdjFgr0c+93frV2nLLKdMuWFRRI4BFMVOh69FCKukVO9A+Dk+0FxuVH9KmqUgzUyrkiqxO/zuoh+zFN9bStzL3v6XBKs/qZpZv3iw6Y/QViOwU3U05Uw21iV/fcnoPJFDPJQY9hdCwIRkj4WLtuCfkLWA5FEXMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261021133027099003)(261021123027099003)(261021130227099003)(261026130827099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026121527099003)(261026135527099003)(261022115727099003)(261022113327099003)(261022075727099003)(261028144727099003)(56012099006)(4143699003)(261021135927099003)(10067099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWdQYU1WZ0Z4aktqcUcwZzBKVGFZTFB6UGRqdjJ4c2M0eFY2T2M4V3lrNVp2?=
 =?utf-8?B?elVEMmZ2L3gxN2d5M1RWV3dFTC81d1lPNUtwMVdpRXNlUDc0V2VwdldWMjV2?=
 =?utf-8?B?MkROem5BZWJiZm5jUXBEY2Z0UkdBZE5oQ1UyQWNrajdvb2dxNmJGTVVkL0xD?=
 =?utf-8?B?SVhBWHN1RUc2a2N5NDdiM044Y2ZCOTdQcHJJRzAyUURJRUFEQkVBdkJnMHdv?=
 =?utf-8?B?WkF2eUE0QjVBMjRsS3BNUytCTDZiTmI1WE84YW1EaUY0RXB3VUlhc0pJWXVa?=
 =?utf-8?B?L2RDdzE1ZlcxWlRpQTVtZE9OVDdZOUlLVlpOV2FIcmdsMXhRN2Joa2pvQlRi?=
 =?utf-8?B?TTR5bjZIWHFGQzYzSUdGZ0RDczhjUm9OUjZCU1hqNUhpVlduVHNwY3VBQVVW?=
 =?utf-8?B?WUhjWkt3UGJNazFRVzhjbzJzclVNdFgyci9wcW5tVC9nMTBoOHRiN1VSN0Zx?=
 =?utf-8?B?YkZHam5oclN4MitxNlQ2QXdIMlFNV0dlUHVKNFE2M3hXSHJIa1JCaWw3em9n?=
 =?utf-8?B?QmlzRXdEcHpQby92aklPMFRjbjBCYmJDeGtpSmE4bG1IcHlYK0pueEwrbnox?=
 =?utf-8?B?enJMSG9GUWR5ZDVEdGJyOVBWMHdjVVNuVjZDUGQ2SkZXN2JDU1Z6UWlxNHhW?=
 =?utf-8?B?Y0xVZUdHWkhnR0t6dS8vQlNNRXJ4cUdmQmlnYU0yd2Q3eExnRlNKMDVaQ2E3?=
 =?utf-8?B?NkdYeGNKVTBrWEFqZlRKcFJlVEZPNlF6NlI1cURJVVVyc3NoaVRUWXNSQ0Rn?=
 =?utf-8?B?TUtrd3VEN3J0dWdWMUhxYjRwNWVmM3BKVUprRlVMcDY4QkFVNTZuOWRUbFUz?=
 =?utf-8?B?M3lTSTNRSEtTRW5RaEVReWRjVzUxQmRGcm8wZ2loR1dxZm4wWkhlMmI0YlV3?=
 =?utf-8?B?MUo1Ti9Da1hTUnYrZnVTU00zYzJJRnJVOTA3Szc1Sk8ySzdlWkV0YjhUNzhu?=
 =?utf-8?B?VE1tMGR4MWl1MlptaEFkVnZQWFJxMG4vKzcyM2VZcFBpVVBhaG82WXdoRzVE?=
 =?utf-8?B?RnVreE8vYlYzK05HYjgrMWw2TW4yQm83ZmpDbXdJSDN3RDc5eWQ5VjlrUEs4?=
 =?utf-8?B?dGlCQW1zaWo2UnllVEp6ck9oZ3RCSjZLWjdPRnROOEI1T2JBZms1ZlVVWWZ2?=
 =?utf-8?B?Q21jdi8rb0lHbFR5QUNxVWdZcEllaURBbFFnb0JOVk1JZzBIemw2Rm9GeFlB?=
 =?utf-8?B?Nm0rMEpQbUdhT0hyM0UwV3J1THkzb2lSNDVwZnl4bkp4ajVHM0xqWG1VeUV3?=
 =?utf-8?B?Smt0WjNmWk1DVVcyNlVOV2VvaXpRS3pNNlZ2eTczaHZnTmlUeFVoY0ZFY0ZD?=
 =?utf-8?B?YkRqNXNvNUxGMisyU1l4dGtXaDlsdFpEUDBGMGxMdXZjQ1ZtUENSLytkbnVF?=
 =?utf-8?B?NGIrYlVwQythSXErckVNRDFIL0ZteHRnUndGWDBzOFRibUdNN29VRkVQMy9C?=
 =?utf-8?B?UDF3ajEwUHd4YTdKWExSR2t0ZEVQcCt6UGdSdUVscWoxc0o4V3YySGFicE5H?=
 =?utf-8?B?dDNoTjJzMElpOEdHaXJOQ2I5elUrSmdUOWV1UndhNFc2aEpQNVB2eEZOQUpm?=
 =?utf-8?B?eDRrTy96QVFUYzdMUlBDT3NUQjFMclZaeTRyNHlQRE94QmR1dW5MMTBpOXF4?=
 =?utf-8?B?NHkydTFZcmlQR3lOcTdzdWNlOUdONVVOMDZ2OGxtYWpmTm1RZkQ3L0pjQTFp?=
 =?utf-8?B?aHc2dVloVUx5eUxreGJRTHBuWTBjTVVReUxROGJrSHg0T2pheFV2WmFFZ0Uw?=
 =?utf-8?B?VTBTNTQ0V2N1dU0ybGxLZkdZYUZac0M1b2VmNDBPQ0xmaEVUelhpb2x6Y1lI?=
 =?utf-8?B?Y1NxUi95NGJ5bEJ5OWtCYnd0elVhTlBRcUQ3Zm1TV1Z4aWlCODZnL0dLVEkr?=
 =?utf-8?B?RUsvK1M4MjNhYVI4OFNFK2tydTdoS3JyZWFWTHdDdlUzdm9xeHVsSjI2alhK?=
 =?utf-8?B?Y0thUjFra3dhVWNTaHVNTko1NGRBaVQyb3VZUTdheUc5dTIwWmlJczJIN3ZZ?=
 =?utf-8?B?VHl4bFRIakx5bjQ3WDV5dHhwQ3Fxa2tVeDBHSStNSjZCdUpkbGszNnBBaks5?=
 =?utf-8?B?b0NiMjFDcWJILytsOFhCWWpLcW8zSjFWbGNKdHdlT25iTldkQ3FqTThkZnRN?=
 =?utf-8?B?cHdLbWQ1NHI2eUl5TndQYzB5NHFwVkl3T2t0Q2lZZzIwcmcxc2NPem0rZ296?=
 =?utf-8?B?RnJJZCs1MGF3R0FEdmN5Zm5jdGlPK2ttYTNGVGY5TDJSbGFIamJMTyttb2lS?=
 =?utf-8?B?K2xtemJaTU9wYjZ1c3JvSktyL1pzaUpuRm1ZWEIzNlg4dnZhd3lRaFlXUksz?=
 =?utf-8?Q?C92gYCnO6SSQuOEmag?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6e3d01-e526-428a-3915-08df4a08e52e
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:56:57.8659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoSOYO83UD+ybhFWAcElACBtLofjksykBSJkZbisorOpnwPJmeNicRjmGD+u4+Hh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB068426

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> get_ddr_config() invokes cdx_mcdi_rpc() but ignores its return value,
> and proceeds even if the cdx_mcdi_rpc returned errors. Also it

Nit - cdx_mcdi_rpc()

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
> 
> Changes in v2:
> New patch added to bailout if the cdx_mcdi_rpc fails.
> 
>   drivers/edac/versalnet_edac.c | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index c2025f5744cc..ac6e926a1918 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -587,7 +587,7 @@ static const struct cdx_mcdi_ops mcdi_ops = {
>   	.mcdi_request = mcdi_request,
>   };
>   
> -static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
> +static int get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
>   {
>   	size_t outlen;
>   	int ret;
> @@ -599,9 +599,15 @@ static void get_ddr_config(u32 index, u32 *buffer, struct cdx_mcdi *amd_mcdi)
>   
>   	ret = cdx_mcdi_rpc(amd_mcdi, MC_CMD_EDAC_GET_DDR_CONFIG, inbuf, sizeof(inbuf),
>   			   outbuf, sizeof(outbuf), &outlen);
> -	if (!ret)
> -		memcpy(buffer, MCDI_PTR(outbuf, GET_DDR_CONFIG),
> -		       (ADEC_NUM * 4));
> +	if (ret)
> +		return ret;
> +
> +	if (outlen < MC_CMD_GET_DDR_CONFIG_OFST + ADEC_NUM * 4)

I think better to use sizeof(outbuf).

> +		return -EIO;
> +
> +	memcpy(buffer, MCDI_PTR(outbuf, GET_DDR_CONFIG), (ADEC_NUM * 4));
> +
> +	return 0;
>   }
>   
>   static int setup_mcdi(struct mc_priv *mc_priv)
> @@ -1043,8 +1049,11 @@ static int mc_probe(struct platform_device *pdev)
>   
>   	priv->mcdi->r5_rproc = rp;
>   
> -	for (i = 0; i < priv->num_ctrl; i++)
> -		get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);
> +	for (i = 0; i < priv->num_ctrl; i++) {
> +		rc = get_ddr_config(i, &priv->adec[ADEC_NUM * i], priv->mcdi);

To be consistent: Every other failure in mc_probe() logs error message.
Inform user this failure as well.

> +		if (rc)
> +			goto err_init;
> +	}
>   
>   	rc = init_versalnet(priv);
>   	if (rc)

