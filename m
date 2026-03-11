Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB1A2EA159
	for <linux-edac@vger.kernel.org>; Wed, 11 Mar 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239345; cv=fail; b=g5jRS6i6xG2ysB9zFTd8FafSlYscSf4QShdYnb/1xP5FBKNF+96guZSzlChHwYVBbdCUZvGCcRowvMJkSBFvHxODjcvQ7C6qOMFw3uwoxVc0YFqIlr6fSRqpAR1Ue3fP8E/6EDU4SFbOdEW6raCWPU8XCC7mZp6OkYPdCyCTUUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239345; c=relaxed/simple;
	bh=ub9dOQYJYlJiO5JjcJDZuAsVujDSQ0j1XpSmaxSxR+Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mKFQ4S9j+5hFZdPNCIbVHrXcEdz/HmqZFYyDJ19veTiavls6UkWAeywEvdAHWWnEZnxBcHKHLHQJ9lfKgDXtbxG/zjMtoqJkD/hLyGT6uPpJbqLUMJclBzQugjlHdKk7ykkSXXXyxHcQe+VudI0omM2AJULJPcFKx4saxvT2dnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mKh9J/AR; arc=fail smtp.client-ip=52.101.53.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mKh9J/AR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9b63HQ9d3n8+oK01qIGUfZH3Egiu6Syi/jXKHV9HKDxoBrh9y+PGxFkMjVt3kxjx+79ZwotFw2NV4cy99GfAwlu53+JQRl90kEoEURmzgQfB7uOT6zFPutQZtYs2bRCib/PzSgoHfDE2acaOeLZvY3R0EQMfjDajUHWewvO6TG5n6PEgxDZVmfKBPse3L6eBtOV/XOC6Y2N4Ojt3BKezUUucyeLPUeuQPlRP5qXii8iYrESA0Z1pQM/WhqBbEfh2BOz4k2Tn19bN926bKQGswfbZMyiu7Sb5a0YYnp9zKf4/fOMoU/FevyDGDaPZ2CWVl0b+wr+W/9KpnbzlNZMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4Tubd8HYDPsOCrS5HEqIluWc2FWJ3eIDKmQaco1uUI=;
 b=YfJNgxnBuBuRx+CxoGqMh+obx6r5rsG7lO3Rj1LLtcCHq2jb+Wjo5N7oyj8YOFCj0CeRdkhu0mLKR3h05vL2RQ5Ku+4y5M5wYoA5ueJOxl6YV+JhuKmb86V4F86HmhMNNywNRpMBzJKVIb+A4j5crdX5RDd6OlKhS71aFHT99i41HdMAOynAR5cX42DLWh19qf1E8uJuQKSi4fstp/XMMR1061Vg4izGBkaxpa+UiYpF/+kyEVV9mJaSIJiprp41ylTwpi8qwsp3ujPlRhnp1FVQOAJ/irrGz5zcerUhD2HnrosX2jPWWgm0/USKPoVSb/hJsgFxqy8bMHF4SBqbfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4Tubd8HYDPsOCrS5HEqIluWc2FWJ3eIDKmQaco1uUI=;
 b=mKh9J/ARZxMwM1jKl2H1qE+WM1xxfAyXCLgFBAhgGfXl7lQBDl5Z7xjr9pwATUVdXAw5sjwT1a/kSCK2E+0sTSaCkVNO8/2kZaxtyhn7PCXMCrzIiYTgi6b18c1G3TjcFA/J30CwEgaceKZjvpU5Q54E465O0F+7iqMel9DFwJw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DS0PR12MB8246.namprd12.prod.outlook.com (2603:10b6:8:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:28:59 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.000; Wed, 11 Mar 2026
 14:28:57 +0000
Message-ID: <12a16f9b-84df-485a-a445-770c34017186@amd.com>
Date: Wed, 11 Mar 2026 09:28:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 superm1@kernel.org, linux-edac@vger.kernel.org
References: <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
 <20260310125422.GB890303@yaz-khff2.amd.com>
 <e6fa4686-5bff-43f2-acdf-b4442452d4dd@amd.com>
 <20260310165225.GA1166706@yaz-khff2.amd.com>
 <943824a1-d5e7-4801-a0a9-c4e875ad286c@amd.com>
 <20260311133821.GA1495223@yaz-khff2.amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260311133821.GA1495223@yaz-khff2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::9) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DS0PR12MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e8499f-e8b7-4787-06f6-08de7f7a877f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+CKmPGuC5DpkA0MuZBzEKmSx5qw0nbQZW/Ao2E4JUt4D33JZ0aA69zoFr0bWJHRItm4jT+L3NhPU3w27zvtZgpJc0hmLpyZjzQpPFVngODw0AJ9Yymj29bA4svFlzeyNKdyuo8+BtGE8Suf17BoxDwSWkb2Rt9AK6gZGE2OY1P+hvgh+ezztn1PZOrbdeCMEUpigz+fy2UvBGPB/CyLG9yuyDhqKkoN7k139vYTqefi5ZsqVQB4xxE98rVjSY39CBnG9Dzv8BJ/s8fFBHhZqCffvTsBSmcWYL1oRslKEpkMBvCFZ9U4qHryCbgdkNzC+9iuE5lLfQHhQbdm1ADjPEeARV0gyUGn3KnKriJbSLMYysGyB3cawm7QGLRStF3df9Ea8LCcaSvk65iM/2gD/IEZu2Oqv+Q+hcTv6IrxY1pm1hJ2FGXLRXe439Xn0VMMgTb/LkUanybDEWxVkFe2G30D97FZeOgbLnFbp826bBJXy8iqC1j0bZyJ+Is/nBfZbOI14AJCmDIZ9dXr33dTGdUK6cDlw4+2afUMVp7BbwhJY0nyEN2na5oFSLrLJPouFXyiLIwRyxrTvMzXjEDV6HnXxEYG0FSICAQ7fadHeRWJ9StkU5i40NTgIrgWdNhMAXF5YRXnaZbIOvS7DbWyqp1vn3hy9frmHpvWb3zhNm72gRsiTKDqG2n+3cCrRZgnSbpK/Dl7d0du+alHVVlIAwt5rvAjo0qluqp2HWzEz+qY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnZDZFlvU1BpR1VSWjVvTS8wc0FMZ3d2ZzNXWWQyMXdlUmlRdWxLT29PMnJx?=
 =?utf-8?B?djRrcTNkNkNrWTR0Um5BaG9sOWZoY0hvUXhSVWRTbXNjM1ZzUnc0ZjhmVm9l?=
 =?utf-8?B?UklPR0pDaTBSYXU2NDRrejA4VHJTR3Q3MmtNeFlwK0F1Qm5TSWpCak9zYWVk?=
 =?utf-8?B?WndJdmRuazZuS1dlckNZUmdSR0ZFenpJZjQyWGI1QjhNdFQ5Ulk5bTdNb3lK?=
 =?utf-8?B?VGZVbE53VHdzYkFQdzZpcHRBaGdlRCtKVmNsVnFETjFoa3AycFJ4M3VXZE5l?=
 =?utf-8?B?KzVRekdPTHhSMmY5NUV3STA0UDN6NTJJd3ljQTk0ckd4aThXQS9KVkkrazhQ?=
 =?utf-8?B?V1d5eUVCQVVFZXJwUHZvWXFsY25YWjAyOEg3a1RBazkrMFJ5YzZNTDQ2eVhI?=
 =?utf-8?B?STloSUhHcE9XbElYZnI5K3Y1d2tWbzYzOFRHMk8rUk5za01Tb1VrRDdOMFpV?=
 =?utf-8?B?dThZbWYrMys0dGlLRVdwOTJ5U1F3TGNFOXAvb0kzYWhOVERHS1dSZU10Q2pn?=
 =?utf-8?B?U3ZnSE4ybHJxL0g5cUFVZDNTZU1Nc0xlQ21WZHZvOWdlUzVMRmRWRmxwRU5X?=
 =?utf-8?B?TFlZTlhnUWVaV05IanpDeW5jMlN4SXozZGFmNk5PSHg0dFFRclYvcFpUZitk?=
 =?utf-8?B?WjlNWkxXcVJCNW5lQ3VZQzRyZWNMQTVIeEE5WmV4WVhKNTdEeGhzVnc5VCtq?=
 =?utf-8?B?M0I1d3JMcXp3V1U2NW9TMjdRdkRreTBseVRpOHFqanRxYWloc3dUWU9tQkZ6?=
 =?utf-8?B?NndEbUt6cnByQWE1SGxNVjZTR0U2NHFqZ292MXp3ODM2VDdwN1N5T3JwcVNo?=
 =?utf-8?B?S21LeTdOY0gvOWYvcElQbjA0ZzVjWUdFVmxlUDNvZy94ZXRzZFdoTUdrc3Jy?=
 =?utf-8?B?RmU0MUljUnJjeERxTVNRVkluZG1tTjI1SkpYRGhpeEFVU25JWlRZbDZCRXNM?=
 =?utf-8?B?UGhTK1NVOVYrMFpyRjk5NzR1NDJxTjlWN0h1UGFqMW9VbEVwWnZzZ0k0SFlm?=
 =?utf-8?B?dFRrL3VpbytaV1RtdVNCWnJFSjFPRzRFRTRrajJuRHo3M0IwTlpGTTE4aEd5?=
 =?utf-8?B?NEZVSG40NS9odzlsZXNSUHU0RW55N1lxTUcyNktNRDNtUHRsV3ZYcUVTU0Rn?=
 =?utf-8?B?amN3bEUwMGh6VzROOG1pci9qMjdndmp3S1dydDFvQnhjeXcxRENOYzNJL2I1?=
 =?utf-8?B?bmp0dFk3ZW5hT29wV1I0Y1RFb0YxbDJSS3YvKzYyRFJyWXN1T0hNSjM5NTBV?=
 =?utf-8?B?Zzh3aFo5SU9xajVBSk9uODRnclU4NUZqN2lBR01WbFRRamhmNS9JZm9GNlNN?=
 =?utf-8?B?eFArN2h0YlN4b3dGMVE4cnRibFVaZVF1K2NPdkNMTjZDb3VGWW1UVlVSSy9v?=
 =?utf-8?B?aTNPeTY1RXhoazNjb2xlQmJFbVZUdjhKVllSTDk4dDFFaEFkYStCeXdaVGJR?=
 =?utf-8?B?S0FQQ294OUdicGJpWnBNZjUrbmNEdFZFWENGelpuTkw4SjJKblBqbGMrQ3V2?=
 =?utf-8?B?SEZubXMwT3ZWZW1SUkRjSlg5WTBZM3lpTHlYSHdzTWJMTVloSTZWWDRSUVlG?=
 =?utf-8?B?emNTZXJOMEFVSEJpYkI2N1N6eDVZSkRjM2dnU0JtUmxFY3ZkK1QxeU5aQ3ZL?=
 =?utf-8?B?MFUxdGlkOWx5bjZYVzIrTUJ5Q1dFaHo1M2I0Mng2bVZVbngvb1VCOHJGblRZ?=
 =?utf-8?B?L0w3TklsUkNheXo1Z2pqaWZZK3FvUTBpSlRGZk12Wk84Y1o3VkdRREptcU1U?=
 =?utf-8?B?Rk1LR1N3RWlHd2VtdWsvaG9aNFlmREo2dy8vaHN1SStXbElleUVaL2RucmdO?=
 =?utf-8?B?d2ljR1k3RUhmQzVGSVNCem5VQzhySCtXVGlDTDlaejdDVlN5bUdSZEZybXR1?=
 =?utf-8?B?M3Fxa1ZLRnloc2lsMFpIK1VkOEFqRldZaDdmWVpCNDI0NysxWXc0MlBrdW1y?=
 =?utf-8?B?aVArUmNWSjQ1U0RIUGxiV2I0OFg0VS82OUNrdk5nQ1laaHhsVzZWODRmVkZY?=
 =?utf-8?B?NldvWm85QWpRblZrY3hCdGRlT09BWlBzRVJwUFFBdm1pL3JZbzh2Y21vdW5m?=
 =?utf-8?B?aFJsajN4Y2RneXRJbWJrNWxmSE5TNXRxaG1VcGVYZHY3QTIzL0pCUUk2VGFU?=
 =?utf-8?B?OEsvRkc4RHQwMHdJbGFCYVNxZUtQcldXTklEZUE5T0lZQUJuNk90SWhJS2Nx?=
 =?utf-8?B?RFJrNjRiYURyMkk3L3RSQ0VXWjVJUzNDNDRwWG5vZElPc3JRWWV5RHRwdElL?=
 =?utf-8?B?UDY0R1pZSmVhdjZCNTdtTU9sdld2N3BNaXEzQlJHK1MwWnVUdE84SHRGVEJs?=
 =?utf-8?B?dnZORGcwOSthZ3JUNXgwblVvNGEya29ySW9haVBybUo5cDgwd0Jydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e8499f-e8b7-4787-06f6-08de7f7a877f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:28:57.1530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkknJMYy8Lko7t9WW3mI+WtP1Jt+nCKR7rnTSeOeQJ8PyWYtVVLSrwXpuWmqucgdX/sG3EMogPhrLWUk8DibRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8246



On 3/11/26 08:38, Yazen Ghannam wrote:
> On Tue, Mar 10, 2026 at 12:47:39PM -0500, Mario Limonciello wrote:
> [...]
>>
>> I don't think the assertion that amd-atl won't load by default on most
>> systems without ECC is correct.  It has a modalias that looks for features
>> (X86_FEATURE_ZEN specifically).
>>
>> alias:          cpu:type:x86,ven*fam*mod*:feature:*00FC*
>> alias:          cpu:type:x86,ven*fam*mod*:feature:*0223*
>>
> 
> Is this with the patch I attached?
> 
>>
>>
>> If you look at this all in a vacuum - is turning down the messaging to debug
>> for amd-atl so bad?
>>
> 
> That works for me.
> 
> Thanks,
> Yazen

Sorry; I totally missed that patch!

That should improve the situation for most people.
