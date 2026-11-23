Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795455401;
	b=PSOTsFWdpr6U6OJbqa3F1Y2GKFIGiJlHpK6VVvsDgW+cfTQxPa2mpZeYOqBcUoKY7Jmy
	 m/5BPxjxQzS4e8oGcqgfYy4Z4YXT4USYGP/qh05WHSuFiChuVahybICwXu+wsboWYSv2C
	 OdOUF5brrwhmNVdqYkBa5eoSbTVtrnKLvi42hpINwKbTc+ud5ciPVh02JAwfM8jnGVpyV
	 zMrNzO3rW22oWc7ZVvgyXYJc0gCAPci7Q5yhGwwnd3y3H1iCBTtv+086sP8A/FWPKQk4b
	 C+mRQquCuXCNwQJMd52RXxVQJiEX6XeHvSYcfo44YSV6apMwqY6mCRmcDrO9cXPJV8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455401;
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
	bh=IoeQaJgRnZca8nW1qkK1GdqfW9DaFSh2xXGZkYIjxCU=;
	b=s+VVbj4UOto6sVIpr12Xm6xU7fGo0t6R2IDtDSLSvWHrqzXagihvnhmuPhTJIOfBZYa1
	 3G+BrzDSLkcZtX1Laa0/jHAVPGBRCSsigLn+DRL756nA3J2Fajd2OEIDNWmNW0bPhuIV4
	 6/s4AcUQyRcimEzcxzafNkwyzzlLHHh4l/VlBEMM5EwjklGAORWyXxCDP61Op2CXITxTo
	 FlzNFTLtuljcc/F/YQJWQPt02QpDwRC2EheH05j5gTq8awP2p0qnoMqHWiVP/yztZ8Cb8
	 d0Zwb7c623/BDuROtR8bL9pTyRLPdSmBVPnz79bWWoYErHzb3K63Z33tfGSwMhIEPrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VPfIpFjt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.64
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECA606A32A;
	Mon, 23 Nov 2026 17:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AECA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VPfIpFjt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wd+PSOr84qOQc8/ToWJPYNZ2Tr4cosgEmizNgts28gH+/pRmxpzMTegQoC49W2nbyfKoIZAYtP7uWSLSCp2Q/yqc1weUlpkx7FTXoikxvFz5QBVKzbF+EE70GQP7TYNmp2db/CuQk2kYGjeetyzLUGoRCoOTIXcWcg5AfUpEVJ2VRisgZlhBzkyy6zsxfZq1LiYSMioPcYd3J+yIHdDr9woAQHrJdWQ8oNLKE8EQPBkw3uLf3d1WYOahO4dIxawMh7pPSskovkqBAyu08IE4gDGsnEU08ikaMhnl3AzEBVoKnl/houHSv7CVdVI2Zf7QaUfKtncSMkwxHWQFfGYZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoeQaJgRnZca8nW1qkK1GdqfW9DaFSh2xXGZkYIjxCU=;
 b=bLwTw2LN9P6e14lMc56LCTDtZ49hhZhhhfN5ndAOKFw0XL27bXvpqqjgX/BuEcnLQI40dM3aWna/a43WN2lPjOTiXC6xtU/srogvpZgxTGU5XC92cv5R400mJEvlEvgxF/FdI3oWwcld1qjWbGUdUJWigwHXGH7f/9WxYcamSACAku/Nj7OvqqxjbHwnzVf5c8Yb5oI/2AOnneL4BCw1DL34oLeZjyIiT+CqKgn51RP5RrokoWkS0w1jY3HP014tQpf80cCGcKUuDrZzBlfTLrPvm3dkh5VoB7s/iMP8ue7HMIe1KFUkUGzGWRET5MxP2+9UJ3vedIqD8oZmerHjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoeQaJgRnZca8nW1qkK1GdqfW9DaFSh2xXGZkYIjxCU=;
 b=VPfIpFjtKDfE4JzkB/NIJHy76KUdQfzKA/XWTH6h61tOwIXw7KOBHkjPPXa3o6hyD/+f1JGJBxe6XYQ52zqhpONbZ5hnBaUS3CK9Sz7Yj1AP2cZ8VPe77rCen40mE6NOjHIghD1NQlBsi04cbomIXpBVV7dmFELXfnXlwHetP3M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 17:36:30 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 17:36:28 +0000
Message-ID: <c4ff37f3-c99a-4f56-9674-5ebb04b1a7e8@amd.com>
Date: Mon, 23 Nov 2026 23:06:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] EDAC/versalnet: Guard against NULL drvdata in
 rpmsg_cb()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com, michal.simek@amd.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261118142213.100581-1-shubhrajyoti.datta@amd.com>
 <20261118142213.100581-9-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261118142213.100581-9-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::6) To CY1PR12MB9697.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|SJ0PR12MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e89f15-1012-4a00-7443-08df49884dce
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261102123227099003|261021121427099003|261026121527099003|261022113327099003|261022075727099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	vuUZ+mrkznlbDZesFKqrEb8mJLf9NTMt40evZVjLgcX4QfXGbxPG1oTxQ1+SQ0EfRyGcNJ1x3U3BuVLN7+giNlSZSwVHDNSktennnP0kD8gsuv8SNZ0ClR7o9DaYJAAYUfxNGFqimZG5Kk0W2VdesGnF+03T67Vj9vSjfGpb3VRbFHkXm0cywuzLQTGTe3IoRmTu7uYSAbQmjOFSCaJylZVISR0My5bKW1OEFZkvKn1ePyYcyUBMwebrHW3UHt8yB4RSyIy4exS0tgu2sbZEeFIbGq4UafhlKH3VcgLDmuJhxcTzLJsqBshEgxYI8aFQf6TXJvF9xlFYofdroIsC3RPmz0K2eGpuHGwInh3cFLtYw9HkrFekrixzqUQSfLko9/QpQ+olyymNxLvj1j/0EcXVcsmPZ7AcypyornvM5CWkHytYJlhpR547ff8fEwjfg34nDbyKsrqlUlld9muL43useQE412s7DyZAH/0bL8krLqRrb1E+N1P/MzXvFos/mwpoyh18/9ygc6BH2X6Y8G8GbW0SV/9lPwHtwjuAxzY90/KnmCOKaK614oPPH7i4Zl1x4roSld1TfjEN8LSa116mcC+D5c4gk89uYqrAeFBEYBqmhr0QicK2VtUzvQZnyCTJxXzWKV22xL2jQe+ck9SKewJyPcPJZajEaZbCGcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261102123227099003)(261021121427099003)(261026121527099003)(261022113327099003)(261022075727099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRwS0cvcHF5SEswbVYvYXJUcDd5MmVTbmtsZXc2OVAvTk13cmhXb0hrZmZF?=
 =?utf-8?B?blk0K2ZPc21GdkpjeCtiVzViU1hZK1JSNkYzMktQNkExd09rVGJ2dzFrM0N4?=
 =?utf-8?B?LzFZZGR4UVBwRU5ZZW8zbVByRG1TZkdjRGg1K3BOc2NsTHRhcnFyaU1TL3p5?=
 =?utf-8?B?MEtCZUFISW9oUEtBUUhXSlk5aVM5ZXo1emJ3SVlpZk4xT3RabkZ4aDRkSndT?=
 =?utf-8?B?MzNUZUJTZWJWZSsreXZjUDNLQ3VsRnEvWmhIeHhTdGR2ZlF6M1A0LzVQTTVQ?=
 =?utf-8?B?akRmWmM1VjhTdWNTNDZqNTZQamt3dmJsbk90a05VVndTenN3V1VLUXB1eVpa?=
 =?utf-8?B?cEJseGhNZ25NVVlrOWx4b0ZLSXNObjRkdEpycWdCMTFGai9yYWpucjE3V09z?=
 =?utf-8?B?S0YxQnJHVkNjZkFYdVJKcjhkQU42ZVVxeHN1S2hrWktMdVpNeVd3bCtET0I3?=
 =?utf-8?B?YUNnbzNxSzFteUkvWmhnKzRlSVljTmdaTmd6akd0SGV1NE43TFJuN0tYdTNh?=
 =?utf-8?B?SVRQcDJaZElWYUI0YnM2Q0ZFcUJ3ZmlhYXNNYUZLK0ZRa1gyQStyd0FzeTVJ?=
 =?utf-8?B?OE1TTTd5cFYzYzZhUnI0TTRMdW5hQTVMQ1BSSUNSVkg0ZTlFM1dHMVZRK0lu?=
 =?utf-8?B?c0JqTmN5UWFjTG40UzJkdldRZDBMaU9EZFlEOUYyajZIa3hNTmxLK2wxcGpq?=
 =?utf-8?B?RzlHYzdTMTRXUkhzT01Kam5sVnV2UEk1RWQrRXU1YVBMNXBsSGhlUitFdWpC?=
 =?utf-8?B?OFV0R2crWDhpajZTWkNITW0xQ0hmOXpoMTFhdEliZGtOdUpMZmZscFJjbTZt?=
 =?utf-8?B?dk9jbDBlWnE1eGtWY21FemU1OUwvb1Q5cVhTNE5zdU5qRWFQaTZULzc5eTIw?=
 =?utf-8?B?STVXZUZhYlo0YTZENlpKczJHZUVUMWY2ekkzU0lpYzhQM1FWckE5ZXkyaHdQ?=
 =?utf-8?B?dE1abXd3TzRsWHdnaDVDRkJSZHoxZnpaQ29NVzFndUFsVzNpUGpqZ20wRTE5?=
 =?utf-8?B?S3lVS1BCU09ERjVFeVEwS2lWcDZ4cEsxTFpOK3dsZ1VCQ3J4dGdWcW1ObGVB?=
 =?utf-8?B?UVM3STkrRTllV0NtajBZbS82TzRnTjI3UUx1NnI2eVVWdGJGc1l3OTBCbGo5?=
 =?utf-8?B?RjZWZmErQUtza2RDaTVrTW9KalNsN2JhdFpHNGJEQytLbjVHRVdoWmZQYWZB?=
 =?utf-8?B?Rm5ldTBadE5BVnUza1dQZWhGTnpFUzBuNVc1andEcHBraVdiWDlDdG1SREJX?=
 =?utf-8?B?eEtUclkwZGQvWk5HaEVudnJMK1hDODBDQ2x6dHkraTBzQ015TVBFSUE4bHVE?=
 =?utf-8?B?OGxQNGw5M0FrQ3pMY1h3cVdodE5UaXZ1YktQNWRBR0dPRmFaR0REemlSZ1Rh?=
 =?utf-8?B?YzYyaGFjd2dqK0pXa2wvOEN3MG1YOFUzNVdoNVhic1VxQVFPTUZmdU43VnM2?=
 =?utf-8?B?TkFMTlprWmRMOHhLTXJ3cmUxY0JXQmJzempMU3BNbGp5SXNsRHNvZHhFQi9p?=
 =?utf-8?B?WXJ6cGN0dTRFMnArTlZ5eEpsdldxSVYxQnZlYnZZZWhCcG43ZVQ5WkZmOXp2?=
 =?utf-8?B?UEJkM09GK0d2L0RNbG5xbW5MWEpnMnd1T0ZNUGI2MEtHYndLRDFkZE9hbUlU?=
 =?utf-8?B?bXZ4R3JnYnpndWJ5RUJkMVEyTG5nOUVmK3IrSnF6TUkzVWVHV21BTmZtR0ly?=
 =?utf-8?B?ajdUc3ZueG5BSnpERytKSXgxQ3MzU3BQRldBd0tvR0J4bFg5MVZXMDIxY1FV?=
 =?utf-8?B?dkNIbFBKNWJua3FYMzNsWm01c29XdXFDMm9LaEZ5ZldsK2pEaG95Q2JJNjNk?=
 =?utf-8?B?RXVGVkl0VXo4VDBIaGh0NzAzVFlINnA2dnBxN2F1Z2VRVmFKNHBFMk5GK2hQ?=
 =?utf-8?B?NG9zNmZqcmJaYjM0SS9PN3dhd0xGWkpSU09yWkdYTmo0R1RORnFJekVlak50?=
 =?utf-8?B?d3VZZzJRNXNEVkZpV2VnNVZ4VFlVdTZmcnZBRGxCbUJGNWc1bW1EMWhPL3Az?=
 =?utf-8?B?R1BRSmtDU01wMEtyT0FuTXJhQ0xoNkVobHdMb1d1KzBUM0dyNlMwZjVWQ2Ur?=
 =?utf-8?B?akUxZ0dKQWxOQVU2bWcrbVU3eHkyb1VvM0orK1RvbDAzeGJ6MHFRU2dDbXcw?=
 =?utf-8?B?V3c1Rm1yRjBzQVVrdWRJY012eG15M1EzN2M2bUZsbDllZEh5cWN1MUhjQjhT?=
 =?utf-8?B?endHbWpQMHlzTmp6Z1YrVmZ2MThZb3VEWktjSXFDVkt3NUhmdC9NY1VaWXhx?=
 =?utf-8?B?cDJZQUVTVmVLYkVISHJqMHdRVUVDQXozdlc1WDEwNG0xQ1pkcWZEeGtzZUx2?=
 =?utf-8?Q?Rh3TVIbbeuGaVcU2kg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e89f15-1012-4a00-7443-08df49884dce
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:36:28.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j/tizrHpLZ/eZJJxrS15f0s2LovmEsCAs3zEjLNDVx9NWlz8YR/SeicIdVj92UI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758

On 11/18/2026 7:50 PM, Shubhrajyoti Datta wrote:
> The rpmsg core creates its own endpoint bound to rpmsg_cb() in
> rpmsg_dev_probe(), before rpmsg_probe() runs and attaches mc_priv via
> dev_set_drvdata(). A message dispatched to that endpoint in that
> window would dereference a NULL mc_priv and crash.
> 
> The same race exists on the teardown side: rpmsg_dev_remove() calls
> rpmsg_remove() first, which clears drvdata back to NULL, and only
> destroys the core's default endpoint afterwards. A message arriving
> in that window reaches rpmsg_cb() with drvdata already NULL.
> 
> Check for a NULL mc_priv in rpmsg_cb() and drop the message instead
> of crashing, in either window.
> 
> Fixes: d5fe2fec6c40 ("EDAC: Add a driver for the AMD Versal NET DDR controller")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>


Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
> 
> Changes in v2:
> Patch addition for the rpmsg drvdata race
> 
>   drivers/edac/versalnet_edac.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index 046293d54d40..1a327a2dbda7 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -639,6 +639,12 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   	const char *err_str;
>   	u32 *adec_data;
>   
> +	if (!mc_priv) {
> +		dev_warn_ratelimited(&rpdev->dev,
> +				     "Dropping rpmsg message, driver not ready or being removed\n");
> +		return 0;
> +	}
> +
>   	if (*(u8 *)data == MCDI_RESPONSE) {
>   		cdx_mcdi_process_cmd(mc_priv->mcdi, (struct cdx_dword *)data, len);
>   		return 0;

