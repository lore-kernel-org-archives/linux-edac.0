Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C387239183A;
	Fri, 31 Jul 2026 13:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506195; cv=fail; b=gaSTlkpV83wj7a9AB3r2zyF4Z7puJ0lQqctPTDilcqMhGE8+Z0L9s0FX95+Nv8hyjP3EdnrwZ7LIsg847kV0VU9x4iTuNP9PmKo+QeCDKqHgDpk+++IxHuN+8e3O5qWwSapnxPyn7ZQDe9di1H007ZnKgWGya9h59ngiT0sCb1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506195; c=relaxed/simple;
	bh=rPYg8rChNtvb0Oh3ezOx9YMejkLYdEe/w6RkyeAzViY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oXcfSa8CAMlV4JolNY3jwg23Fd8SF4ppGjVTTs0h1VLOCB0q2l+hd76M8R1Z+TYfb/TE4+pCrYU3x190DGXs/FMwf68s8T087fIB9GqQ4UV1CQOTcpi+Olz3RTrMaW9xYoznkONlTXBpsiPZ3bitp0ynRanxiFrws01gmZBsogw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wTXASXhj; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wTXASXhj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHITZ/pm/bisVoxWOO1se+xG3EIGsnN/zdJG9YGEmnWpPArJcwB+5Gw1zGdIvGx1USoCrxyw8KPEi7c6bVbpOxE86ap9VbTJsKQtaUxF8059IBMTTdNRx9l496eaP4qaEZOnM+LGMd9WVfE77h22VrrdtfN8w+IQ8eJnY0vZfSAbbFDjGm6/Xo7CENTj2i46tZCAHzwXhaJoILcSruSnImWRhmjcgb+d1M86nhUuSckFKjCabm/meyOpJhEvvOhsyZmdDuopTGfFe77Nk9mRNybnKdEI6AkpK8lHH1mXq/ZcrsckQYYKhXrFY0xw8JUQMCbHazdtS3OItCmiMZ0Jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5/9GG4+3Kn+FlS1SxA5JK1K/5c6f/DlpE/cKDeBHUw=;
 b=cNrw6jz/HbRgQdW18TsYVW/yohdBVlhX/vnja4ly/ZoSGF2QQIm0iZDwPbZHJf9LBeOwx/Mx2nlp7XiXwaS8JkH8Ws3lsMfbIa7Uu6H4jz6ESLpT0VTIeYHUU0eASde0Udrbzb3B0IiTHMD/nvEF1C1r0DK3Nye+B8JBc9b6DGlEoSXdRHsk3K1XEAcpMc37UcrhXVi0k/G4p6LEa7JCgrisHRjloej4cboQcgkc4HH3qnz4poFBXI+UbEruTs4cHCsKpRtpzq+MNDJnV791ISqifUNXZzqjZnnrnfWJ/FW2bZDzcq9xrZZmfakqtqF6OGDbopKBbnh1ljLTtEClPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5/9GG4+3Kn+FlS1SxA5JK1K/5c6f/DlpE/cKDeBHUw=;
 b=wTXASXhjuqFhzPyiM1j6cJPlmZsqe3E9U5E5VDbbZNzdVGSyPk/RxqyI/ZPpdHjgFBxCIT8UaXmRiJ/952+HyxGxgRRMPnoCNWkEt9SWNbgKC5bqSTr24GTmWw7h9DajuF+ttT0fgK4+qInJmO6JnjWK7y+p81oz+mH3BCRIn2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS7PR12MB5934.namprd12.prod.outlook.com (2603:10b6:8:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 13:56:27 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 13:56:27 +0000
Message-ID: <4b17c6da-3eba-4591-910f-9fe26b4d422c@amd.com>
Date: Fri, 31 Jul 2026 19:26:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] EDAC/versalnet: Add bounds validation in rpmsg_cb()
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 linux-edac@vger.kernel.org
Cc: git@amd.com, shubhrajyoti.datta@gmail.com,
 Michal Simek <michal.simek@amd.com>, Borislav Petkov <bp@alien8.de>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20260724171945.2812749-1-shubhrajyoti.datta@amd.com>
 <20260724171945.2812749-8-shubhrajyoti.datta@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260724171945.2812749-8-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0240.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DS7PR12MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6b1a05-cb3f-41e7-f729-08deef0b8404
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|11063799006|4143699003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	l08z7eTu/qsFSkDu+NkoGEKQxS3MTy9m3t22TkNd6lftxNQPqTYGPs2u12DOMwqpGBZ2+2A2TxnBil5iNrNSwDg0yfGUzTd2bVIkKLD2Kmdil2W+wK9g/6H6BRs0MqoQeJXkLhBDEVLqvGLCnfb2iMCT4UyL1kkfPvcJgV0sFeMX44nUnNeJxRobRIafUGhZ3ERNJAoopZWqWuDesgs5nSwLnDlO71RV2+PLyRWY11ugXvur8Eiif1JWqN8gQ8TqOtoJIdmoOY8tsT7loT5KciYzQqGfFM4QcTdqoVYM1rPgU/D7WHmvhKUgbwS+EiuEsN05htTqqXBLXdGBxq+0BCPTdr4mBLVmir3EfT2TyuJXXiT0WSHGtFY4anRkafCuhwXV5MIKPEXUM+jSyjgPwl0UQvwRMZDp21krW4P4d7AwqzuoMs3mlEXMeLXG9CKLKnxNuHce+RY5g/sRg8Ts4Y0UmR/O2HJg26oNF3t7AQ/fBU9wrwoS/vNS4PfK+0Ndi9BFPUT6dBZwPNlwhveHfVs8vwpv/IAoabnFAaU7e9dF1TptdigXHqwP48lkbogY1g8u9EI6dc6OyajXim0I/Nuh4DYjqHX3/ebVbxfd47OeUb5kqMS3Z1S9tfJzBa4skOr6LzBaMx7aNp8EGurcMa+Z8PgppG4Q8CnAcjAhl/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2UrWTRMN2MzNlJFTXhvY2Qza1VnTjZvTVJ4d21WQ1NnN0dVVHhBbTA1bFZN?=
 =?utf-8?B?WmhYSDV3VTJVaFFiemFtZDZvYVFvaDZ5cElJWXZMT2QzckJTclgwMCs1eHJm?=
 =?utf-8?B?OHBpSFRzKzJuSG4vSzhvRWhYdmZLK1dEbUsySGZiazgrRWhiZnpCQllRRGVV?=
 =?utf-8?B?cCtZSlh2VUZBZFhGTUM1L0xDSlNpSzgwVlJKZVF4eGVFazB1ZGJ1UndiZ25l?=
 =?utf-8?B?V2NZU3puRi9SRVl6Ui83Umg3c08rcmkrQ2hEMGl3SGt6SFFRT3p2a1FJWVlD?=
 =?utf-8?B?QktJK1Y4QlNwRDVUSmZxNjFMMVN2TWtQeS9yN3hxQ29BcGUzVk9RQnR5VnVI?=
 =?utf-8?B?Sit0L0xYd09Ndm90RXA1dDRxN2JQSTA5Z2FhVU5CU1ptenl3KzBpNWZXMmxD?=
 =?utf-8?B?Ni9xV3RiaUc0R0lUR09vMmU5b2h3RkdmK0JNZUVLcUg5Tm5lKzllWWFuNGx0?=
 =?utf-8?B?YjNCMmVpdUMycG40bnNGUUE3OHVrL01BVWg1SnNpTEJnQ3B6OGk2bldIYnBX?=
 =?utf-8?B?MDFYTE9SRmZnVWE4bjZCVm1neFUvc3RUZVl4Ky9ZM1pSelVMTGlkNklOWGJL?=
 =?utf-8?B?UmpkVk9PVHkya3dyNnpLS2xMek9aM2hYbUFwUnJxSEtrSmVKc3RHY1RiN01H?=
 =?utf-8?B?b2UrNjQvck9nMmpuK3Q3d0lLOUplRFBMTjlkbGF5YnVCaE9hbHc2cmVDU1Np?=
 =?utf-8?B?Y0dmK3g5bGxBd2lsY3Z5bGFNS0k0RkhnMXQvLzZXWlNlMUNJTUpiTzZ6aGNp?=
 =?utf-8?B?VWVuYXZ0S3djSTEvVUw2Z04xdGF0NS9pNS9BN3FoMlBNcFVRT3FmWWR4R0tX?=
 =?utf-8?B?L1JTdGlkNjdDdXdNSkN4M0lYMG04dmhIaVF2SlNDa0JNVFBhWHVJTEZtNVNt?=
 =?utf-8?B?cldHeWdJR3RBWlNKTDJmc0V3ZjJYY3pyZ1BzL0Vteis5SU83am40SGNMeS82?=
 =?utf-8?B?K0ROWXlHTEh6d1RacWh6eEYvVUtIdDBWSWpPb0Y1QVQ3a0hIcTQyOXQ2ejJG?=
 =?utf-8?B?aEpnMTMyVXZ1SUdIQkkrUGtRenRRV1daRmtlMTU3V0p0N0UweExKcjRwV0VN?=
 =?utf-8?B?QVR4NmxEWGxTTnRnZGMyMzduSHUrZ3RrbjNGaFlMMmxtbkR4bXd2aHBPdHJm?=
 =?utf-8?B?KzNRNHVhSVlNbWxaVmlucXN5T3NZQkNlWitxRXJuZVl5U1pMN0prdXZ3ZWpU?=
 =?utf-8?B?V1Nqb0ttRGdHcHhWK0NUNVdUb21EN2Vxd2JQYTMrWkJSeC9QTGlrMUpNTU5H?=
 =?utf-8?B?cDVhTjc2MDBPZVJXZWlmRG1YaUVUNGdCUkxIT2pzZU1tY3ZBZTg0YjFLYStZ?=
 =?utf-8?B?cnJzaWtiblFoY1NGNTdSa1I3VFk0TCsrREdvOTQyTVE3SG5kbHBMQjFOSFNE?=
 =?utf-8?B?ekdJSlV4ZitDRi9ZMW5XY1piTFVZV3N1bGV0YitYcXUwbTc0VjF1WWhIaXkv?=
 =?utf-8?B?VUR5SFQ2TFdQaTRFYThULytiU2dmSnQzTmFaR2J2MGl1QXdpYnVTYXpmNjYy?=
 =?utf-8?B?V0dReDJ3d3kxOUFwazBQeVJ3VEpmak5ZQW9ZeitLREZGZ3NXWE45bHZaM0Z5?=
 =?utf-8?B?bkYyNDBVUUZFRFUzRmgrcGdZOUN2azdWdERrS3c1cGpFTUZpV2xxRmRDdXNG?=
 =?utf-8?B?eERsMnQ4UXF5WW5NODBXWC8xT1Y0TG1VYyttcnVEWm9JSDludTYrWmFwcWlL?=
 =?utf-8?B?WWF3Tll1T1VMUXlGMXdVTUNJVFFEd3p2WUVSdytPVi80dUVHK2VwdmxFWTZK?=
 =?utf-8?B?anJVNDdZb0ZqRXc4TURJb3J2R2tBY1ZJakNKd0lIc2VaZys3aEdRL25vNXlO?=
 =?utf-8?B?ZG1sSVRUTlprTmoyb0s3NFhlYlJ6ajlPNm01aGFYbEVtNjJWa0hIQ3hxVU1D?=
 =?utf-8?B?U0k4bnRacjJWUVhFNGFET081Nkw0WXY0dXJGR2RuTjdDSU5icjFyaVhNMmps?=
 =?utf-8?B?TmlQd2N6aENOSHRJaHpkbWRoallkNDAxOG1yYWlMRWZvcDlBTHdSMlpkTUZU?=
 =?utf-8?B?WG9kUkFOSSt6QVJLY0JySFo5RCthM0x2eUlWN21JSjRqbjhNNFF1RVBqUjlC?=
 =?utf-8?B?alN2SnNnNEtnTWVNY3JFaUFodHpXSitNQ0Q5ejNmMkRMZllWVFJDY1hVZ29K?=
 =?utf-8?B?SlNNb1hHbXE2REpIbUNuYU9tbkdQcENhWFBRYzdjRGdrbnVwTk93cjV5N1VQ?=
 =?utf-8?B?TWxQWi90QW5SeFdhS2pZSXBUNjEwQ1Z5RTBUbXJJUWlGUU5lT0Y3TklXKzdm?=
 =?utf-8?B?bDlaZ05CTWw0bW1iQ3FFOUhobmFzMTlWMFV4SHhicW81bjF4VTdNTTloOVho?=
 =?utf-8?B?NTlXTWJFeE5uc09RWjIwTUYyUGRoc1J6VVZtazJndDZZT2hpak4rQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6b1a05-cb3f-41e7-f729-08deef0b8404
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 13:56:27.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ESnV9KtBtwPwj4hzp4rVcPHykITWcz+LVLmzy7Q4OfURk4SpFshFGe+R41Ospk7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5934

On 7/24/2026 10:49 PM, Shubhrajyoti Datta wrote:
> The firmware-supplied offset and length values from the RPMsg payload
> are used without validation to index into mc_priv->regs[] (REG_MAX=152
> entries). A malformed or buggy firmware message could write past the end
> of the array, corrupting adjacent structure members and the kernel heap.
> Add check for the same.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
>   drivers/edac/versalnet_edac.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
> index e9561242f292..baca90f44c58 100644
> --- a/drivers/edac/versalnet_edac.c
> +++ b/drivers/edac/versalnet_edac.c
> @@ -602,6 +602,9 @@ static int rpmsg_cb(struct rpmsg_device *rpdev, void *data,
>   	length = result[MSG_ERR_LENGTH];
>   	offset = result[MSG_ERR_OFFSET];
>   
> +	if (offset + length > REG_MAX)
> +		return -EINVAL;
> +

Nit - Integer overflow on offset + length

>   	/*
>   	 * The data can come in two stretches. Construct the regs from two
>   	 * messages. The offset indicates the offset from which the data is to

