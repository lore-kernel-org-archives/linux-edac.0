Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183A02DC764;
	Thu, 12 Mar 2026 22:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355481; cv=fail; b=IBzY2d0tceV2/cWLdVfVXbu8oAndIO4+7PfgpO9jGCwFw3zaajfCBC6xFj2w7f13AnvRD0BhhzuDyxCATGsCYC8ANHiW5Nm9pIb3Z4mr4G8QmwSCL8f+268+N2JCCxXSPd0cJtZGmGe+7+/WMnU0v70w605qnPhwttTShScSwGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355481; c=relaxed/simple;
	bh=ptYBTOgKb9wOuF5aEw51mGyv0P4sBhmfzSBNsB8cIvY=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=b+dQess5ie/wJsLg0Cgi0pDg0h43dSe59LAybm++niJA7cxeOIMB1C+V3rd14LgNPUDftxSsraLZe4yeQNXi0MRMb+5C49PoCZoUtGHOYooKXyYCb8gjiGG++53ztVYRmQ1UdeHK05Jph9cuxBdBLwXEAfp+sfqT9ZiPgUnZWCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TtJQXBzS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z305CYSO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TtJQXBzS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z305CYSO"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CLHUQm2144624;
	Thu, 12 Mar 2026 22:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FDW4+b0iksKXfV1Mwb
	TVshEJNPaigFiDuJo2z5Nkzn4=; b=TtJQXBzSgDvY1Nst0IDY2q0ZH9FM9+KTiE
	0uFR/zFZ8nQCCRrz2lw2YgZd4zNbWUZDsKPDGVKt+njUTz9z7fMBZOGelvaLZdxb
	R//8TsD7hPFi6oHxta/gXKcErrI+jWArocMO6m/q+svL8VIXW1QgojEXA9GHVlq+
	NFA9GGo3GV/urHIeKiuyFbmwvtSIwYKE028BO/fhxbEd9xgF9eI/p62mskEtBpbo
	YL8E0au9uIybH0v1xl+sl1A6ZDYqsGXdSEMLp+QvECdgkkaV+UmRPpIluPCGTPSa
	WFKGyYLAipKXG1MlVTXkZhD/I4quqPWWa01I0eEYHdef8ZIXWLgg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cuh4qsw47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 22:44:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62CMLB3f024073;
	Thu, 12 Mar 2026 22:44:12 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4cuh5gdywu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Mar 2026 22:44:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWhplNlyNKtaq+w5J7p8LTgAaI6ksDgmB0/K8oL4pi5wzeKXSBEo+N5jVChAQhgkGrJ/b8g0XeSRQhRdPjJTlYZOkhGLEcqIrRCnLbuFybejo9vjzoycKXOq6m7pwU7MfoKtAm2TUzE10kka4W+8xSnGTDcAPqZ6sjKNpn8XGGZQNDPskKFcoFVeNo/c6Fc2bNb0uYoSZanITPDFa1xqq0qYO2cfb7ITKHTxrwIm3kbpgDfb0YNLrZTyAICehDLPvLE+8j7OVVMlPxGxVHN9JDUhjs0bDktBGRK8HSKpjmqTpSruyBhdQctqTXJ8W1I4uaS3qBybthPbiT4yLX0n2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDW4+b0iksKXfV1MwbTVshEJNPaigFiDuJo2z5Nkzn4=;
 b=w/3EqGyRi+exSbU0sW6N6IksoSHOsK7ISTGrPyJppNIemH7sQkct5ar4/AOy3VhBnSLXkQEax4O4Jqhy7WDacQuwCmJOLyLftVTK6giJkvyEBWFA9P4KaINltquUmVbjS9zJe89Iu3hB+OtNZKy6R1CCDD/ARft/ZeAFzTsRQrV5peT7tg9VQkpBVBGdJoO+tce4PPIGBGN7YqmZ8SUv5uBJH5FLw0YunMT0xf3nj0CuKbxwRJ6jGdV20cIsg/0r074BeAMgfSkUCUac1VRH0BgPHY03P+Lr1RWvh36OqA0FiJ2FfJMgzTZglcWsX9E07I0STzfZZd13Fj/QojmOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDW4+b0iksKXfV1MwbTVshEJNPaigFiDuJo2z5Nkzn4=;
 b=z305CYSOXW2NrZURHbBWCL3mQTHxrxXIO25YncS5yd2suPQsDbG+6BRQ/hokGBXJQtZ3gOMQ6srKhjaNFjCfvywk1BSXlDkJK4B/j2QwamWemlq/+elHq2HZV+9kIUn7LgN67I/oY/NpzC57JUEfqYzrswA4aG1oPFarrc/0u4k=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by SA1PR10MB7633.namprd10.prod.outlook.com (2603:10b6:806:375::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Thu, 12 Mar
 2026 22:44:09 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.015; Thu, 12 Mar 2026
 22:44:08 +0000
Content-Type: multipart/mixed; boundary="------------hgRvAjcSRhNkYEg62iVQ0vZZ"
Message-ID: <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
Date: Thu, 12 Mar 2026 23:44:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
To: Borislav Petkov <bp@alien8.de>, yazen.ghannam@amd.com
Cc: tony.luck@intel.com, tglx@kernel.org, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        John.Allen@amd.com, jane.chu@oracle.com
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
 <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
Content-Language: en-US
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
X-ClientProxiedBy: FR4P281CA0326.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::19) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|SA1PR10MB7633:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efe788a-847e-4201-c139-08de8088df4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|6049299003|1800799024|376014|366016|18002099003|56012099003|22082099003|4053099003;
X-Microsoft-Antispam-Message-Info:
	do+vzc6Rpdnjvv3gNECYLKsGF7ZpMadAQ2PeaZEjIS9Ns4TPU/9HgjvGaOtKBQroPnQZxuWmg5hbAQjik/Qd+Nvur8Sn1veEb/Qq2tV9tAItMgkk4Qulo77eoThc+byOV7NMP6J610au7EJTU+UGAMToEiwtFxOJMtDNCUFzimDRjJj8SoyW1hTMciG5I8nNlrs8+bGSBVkb3z3WWZ1HEVCxS4xFMSHjohZ/jS+ttqWrrxoLELMulTJDkRk8pkbOa+r26k4IpUE6WcZX/lFZQFCpqV2y4teJJcRexpp6G9pgcEKlnrwHpODLdgzXv8sELgmrFNLj7APArkvxzwKdppUwL+/xLSDRdwYbaLGRTWkQO4xTLfkq1RJqycnVdNhOp9Mm1/U5NGIwbQPqdzxadvfUaNFXCBlzJIGnP5aaV6rtU9CG3WguHvBcR/jCq6z/mUgFGIsCDRtvs8n2EcEXm3yhW4wsbT3Odv9Gdyp1lwLWu8coR3h/4ykNPdRSM+M64QEx+QnEwAORz97q8C8nKW35cMR80Gws7Qamoc7wthhlxF2Pp+xqxNwtc2SOch4vvJEKcnFeliPT7NEGvN6AFDIrfrc6LN9ChAHlJKMlbSzBcMOT8TsOejmj+QF+oMFpAmtCww/Iy8nk0t14zmjT5b1wTM+PyY2nUN9JZtc0U/sNzghzk/N2gpc+9qMB/cZ9XQ5Rs0gIZ4lxIV2yPYkTLCoNgievl4GwwqxeMKkgVQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(6049299003)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkpudWVZcE0raTRaNzRVZ2RGS29peFlqWjc2ZkhHMUVhT0FYQWJCcUR3SzNa?=
 =?utf-8?B?MmtwMExrcW55Nm5zZkN5TE41Rm5JVDVXbGh1NGRaM3EzeHE1NWExU3BEbjM0?=
 =?utf-8?B?Nm5GMTJTeS9nNnUrQlZ3ZVhRaTVKb1U5TVo3ck5HR2Z6NHAyeDlDejNIS29Y?=
 =?utf-8?B?Zi9GM25ZQW4rYlhuUSs3UUozUElJT085R3hXT1VLOVJkS01TOUlQeWUvcWtp?=
 =?utf-8?B?b1JYenhPeUNEUzkxOE96VXlyMkljdlN2ZlpOVVdFU1picFhBN0szYjlhcEVS?=
 =?utf-8?B?WER0WmhnNEpVL2I2RXM2YStxQyt1VmRlYWpUVjVoN3c2Ym1LUUEzUFRncnRt?=
 =?utf-8?B?RFEyMlI2V3lSdUZZVVQxVGNVeGkrY3AzeWJXUWZIRjAzcmFvNUJtR2loYitQ?=
 =?utf-8?B?Vk5lUEVQSHFWdXNFeXpqeEdiMUhKMUN1eVdKRmFPcWMvZzJ1K3B3V1cwOW53?=
 =?utf-8?B?WjFFTmdnZUlpWmh0M3o2ekJRK3BNbFJmUEQvMUFZdlVKUXVGQVVDOWQ5SGg2?=
 =?utf-8?B?NTZnc1VpSzc4UXFKazBtUUJvVGwvVW5UbkpXUHgyVWJYd2NGTFA2ZW5aZTM1?=
 =?utf-8?B?VHlLTXluQXNyYUNlMXRpTUxiNms5cFJvb0p5a3RCbVBRbnJUVUhITkxwNUxW?=
 =?utf-8?B?S1FyM2V2cGFXeEtXN0tuM0tCbC9NV3N5dlJrQ3NheWxSRlB4eUNqK2laL0xl?=
 =?utf-8?B?NTBvRmhmdDVseUV2ODVBbmNCbFhReE5oWUdGRWRhV2lnYkdaNW1WanFXN3pu?=
 =?utf-8?B?WUxyNlU0K2FGY3h4VWdDc2g3dThKZTd4cG8xQkFuSEpkUFVGUWNEOUVTNW5o?=
 =?utf-8?B?aWczcjdzUndlVE1uSGtHeUV3TGtBVnRPcFVIQ09hVzVvUXBIWW1kNDBjWWpK?=
 =?utf-8?B?dHZJbmVmenZRUGQ4eGFiVjZFdmxhTTNIYlpiNkV1b0VRMkt5ZmZFaTRlNUpj?=
 =?utf-8?B?MlBtTUowdE9IT1cyK1Q3TWxrc090QXRCZGI4TGNqNWxWY2VCbnp6UU5OWTZp?=
 =?utf-8?B?WGVjVTdUNHFPSklCK2JvN3dpSDFIbmNUaVdoVTdjSlFWRDQ4YjNUR1N6K0M5?=
 =?utf-8?B?Tk1PZ3FkZ25GN1p6N0FPNU9yZEFYM2J5elNld2VLb1pabVZkNDAxWmdPcnV2?=
 =?utf-8?B?aEdVcDE3NnNIRWU3MTRYeWcxQ1ZrMjFWZzZrRlh3WkdZblJ4TDJRaDhGMkNH?=
 =?utf-8?B?bGpxVnFma3MySDFpYmp6TVBUMWpFOWFMWWVsQzZSMUN5S0g1U1lya245aDVR?=
 =?utf-8?B?Y1AvWDBGK1Y0TlFKKzh3WTFBWExvMUtpYS90Vm9MUmJvUWVpQU5FMmJZNDNw?=
 =?utf-8?B?UnZHVkpnZUFIUWFwVWJNR2wxSUczd0UzL3g4SERjdGxyRHpEa3Z3enQxMUdF?=
 =?utf-8?B?U1pkSjBEQXE2SU8yTy9STzVFR1liWmZLRVNuL1RzUkppNzl3TG1RdVBOSzQ1?=
 =?utf-8?B?MzNNTHEybWVqMStsRU9DakxReC8vRS9EZG43KzdwVWE4Z1U2UUlNOFgzdVFt?=
 =?utf-8?B?QTFPOXdyc3RhUGZDbmtBUlpUMjR3bG54cXlTVTRMbWNLZmpOYUc1a3YwUks0?=
 =?utf-8?B?UTJFdjFKZjlveDA3QWZmUTJUYWpITGNmb0pBYVZwMnNxTXVaNitab3BUMW9D?=
 =?utf-8?B?SHdEdDRheVFFVWJ1TUhSaUJoMURGWGNQWFNIU1hYNzJsSjFrNGlhdEpmdDdu?=
 =?utf-8?B?TUNkd1oxK05ZcnBabUQzZURUclh1dHF3amxqbTAzWHVESHp0RGlnK0dyb3du?=
 =?utf-8?B?YzlWaXhJdHk5RXhKcnVzR2RIS1JvdzF3Q1Z5czU3MzBuVHQxLy9hdUJsNFAx?=
 =?utf-8?B?dk1IWVlRWkJybmc3MDRSSFdtam03Z0Rtd1NLVXJFdXA4SEVPc3luL0VXL3gv?=
 =?utf-8?B?N3UzS0lSZkRmc2dzOUozMFdZYTByV3cwOTdLZ0djcURKL3JQc3pXalYreDZJ?=
 =?utf-8?B?cEMwUTJGYkdVajBVV2R2bU52KzAyOUltazNjK3dXbmhjNWtoYmRCRXlCYThu?=
 =?utf-8?B?N0hiZ1M4NmdBRzRxSko2dmZBVG1sS0RwaW4xMGRGdGp5Q1hWMzNsdkxsVkwy?=
 =?utf-8?B?cElLcFJUREpVckxYVk1GUG15ZEdlWkZKWDl5UGFMdTJibzMyNUtTc3NUbi8r?=
 =?utf-8?B?NUZxR0xSQlNqS1dMVGZ2dXBEZGN1Q0E3MlcvYTBiS05MMXZqRFEwT2F5Y29w?=
 =?utf-8?B?UlFNbmtUam9CbU5yeGdjVzE0TFRBbEpTS1lyNnJGOElzanRDeFl0bElPdUU5?=
 =?utf-8?B?OVMyanFIN01VZFY0SzV3by94K3ZDK3pCTU9wdmtxbmdHbGhCandDNWM2ZGFD?=
 =?utf-8?B?T0NsQktJK0ZPeXdoMnNTSkVFNnZxWlN2NmE4QVFaZm1PV09KeDNQWmJWS0pJ?=
 =?utf-8?Q?wBkYTZWjjarAZECE=3D?=
X-Exchange-RoutingPolicyChecked:
	uOZWY3Rt61g1jP+z2OYzR5pwrsCMIoNk8YsNqJI/UZH4if9obOt9jV3Rpb4u6PKtY/UcV+vy1967tMLhPW0cqypW7MW+HXfegXbdOJLGlCS3G3BJKb7kZcpOz4Z4U84BUHXfxkkm81esZM+sEPIvPZsYksRVzUXTxC7BHNpofvw1NHhc3SsUpAwfdvjTK4jtOB1WNSN/09hW37IB2VuUIRrHF7SV+Nh+qlDYncA74gWVg99Bc1j9w7auXV0uAFi/cJdUxox3Y/icm3+wV2E21CFcuDLFGSPp0jzJo1n/p6DYqA7epcQLSV00tjzrQV9JgiYPEMYKis6LYksptOMRVg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e8Da9XDew3dxLM5h9YaVXiBuKK8H/PpujSb71cc3hvoEd8c5bWbAPRdwOvTVrzbKtr7e+yVHSGkJ0vjdy8vIAze6xuLy+fV3NC6Bdsu25kgdJmSYina+6T85TJ5qBQu15L1pS7zVLC4JNZjYhGg0n9bCqgI7IHrCGcCgq+EiNdIh1pexpo1jQlUCSN5Jk3a8X63rVabBMXXYc0oQ7kjfZh5a9zVjcUHxw14rwT3pIyHBDQVGHZGeuLw/ZfJUP+EKbjnz2fyGqUYal/AS2P1IJ5PYQHcSbe4mfyoVGjOc4dTs/mIiYIo7QJFGeqh8haD7dBUfihgftpesI2c8W4v+erzCJ2Zf/MLqM+YybQjXds9+RMXbj1mM1xYpD2gCdLG4me5pB2uMjxJiOkWHH3U+MVy+wIJiALuQm7DEuhtFCHhsl4oMks8dLsA1Si/wRjzfhzsZkzfBTPTqVhh+82TCJOrHXYsWyc3bTUW60+MV/zqXN6M5IFMDwjW1BWj20Ilb3+RDK8kmayT1QWoJFAg+ezf+ggXr3qspkM2slDLzfm0S4W27MUF5/74znj0GvsXPw1zESUL+YhUNNRWJA65Qiiy6JT2SLqy8a/NFVbGqzSw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efe788a-847e-4201-c139-08de8088df4f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 22:44:08.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pbunBmwsG8NAAGlNSIqtGXWuKtSbEbW1ewaNDu4utod2zPFJd+zWmh5U+DTiuy14lviPVjFy58f1gH4mQnNiMf+LgSrox2OppTA4vu47bOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7633
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603120183
X-Proofpoint-GUID: giNuPDu_Qwz0kx9wis9Z3Y2gAMZWw606
X-Authority-Analysis: v=2.4 cv=ZdsQ98VA c=1 sm=1 tr=0 ts=69b341bd b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=WUd-ur9-quosQU6NfBkA:9 a=QEXdDO2ut3YA:10
 a=ICJoR34Z0lMm7dEa-HUA:9 a=JMNH9X61SiQA:10
X-Proofpoint-ORIG-GUID: giNuPDu_Qwz0kx9wis9Z3Y2gAMZWw606
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE4MiBTYWx0ZWRfXypk3E3ce9U2h
 zdW9PMAcYgkT5cnmnqXROpmFCe4yZ+XW0cOGml/OzeVXOoTIysEf5ljzI4rrCH15i2Wvbx8QGTE
 RUaJnr+Qo4gupDSxgD1voUhaO3fCCWBZG3VjDjKoSyfElg7qP/99cvWPzMXkFhDmQeQFg8s68Us
 sOl239F0mcqzamiotKQwuoLRlWNtanyh/UsAG63inqWaVkdZ8JNRTck224k3fX9ewdWOXmCEJ0i
 R+YakG2xwn/Kq45bTHnxoYxXxdIoKaRJcNI29q6Zl7le/GwapkFxH/KbInP74u45CLmcIVsrI+O
 pmAEzJ6Bn9YXO25ajU50piik9JGpTCGPTUz7bHT/v582qj7EDPXaAA2jBQNLp2ewLPDwyGGERIP
 mLkv7rJ4mewFtvvP5sJ9AKRf4wxFlosQkCx4eu2UAUt6Mezu1Odkl/hSQTcrwgS65luGV96vsQb
 Ue4ZNrWfh1oXGiJ4Rcw==

--------------hgRvAjcSRhNkYEg62iVQ0vZZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for taking the time to explain your worries about the context 
of this fix integration, and I do hope my feedback can help to convince you.


On 3/12/26 17:04, Borislav Petkov wrote:
> On Thu, Mar 12, 2026 at 04:11:10PM +0100, William Roche wrote:
>>  From the kernel point of view (regardless if it is running on bare metal or
>> in a VM), access to these registers registers is provided by the platform:
>> either the Hardware or the emulation framework.
> 
> Except the emulation doesn't emulate the platform properly. We test on real
> hw. If your hypervisor doesn't do that properly then that's not really
> upstream kernel's problem.

There are several aspects that are worth considering here:
First, I totally agree that the emulation has to emulate properly ! :)

The problem we are facing is to consider non-SMCA platform reaction to 
updating and SMCA specific register.
And is the QEMU/KVM VM reaction as a non-SCMA machine a valid case ?

In this VM case, the MSR handling emulation is done by KVM which doesn't 
implement a "permissive" access to unimplemented registers. I also 
agreed with you when you said that it is working as advertised.
Now if emulating an AMD platform requires to provide a "permissive" 
access to a specific set of registers, the fix would not be absolutely 
necessary. But I may have missed a specification about that. And if such 
a thing exists, it would also be all kernels (including upstream) 
responsibility to take that into account.

Yazen may help us on this aspect: Could you please let us know if there 
is an AMD specification for accessing SMCA registers on non SMCA machines ?


Now if we had a valid case of an existing non-SMCA AMD hardware that 
could crash on updating an SMCA register, the fix would be needed not 
only for the VM case.

Yazen, could you also please tell us if an existing non-SMCA AMD 
hardware could crash on updating an SMCA register ?


The commit 7cb735d7c0cb [x86/mce: Unify AMD DFR handler with MCA 
Polling]  written by Yazen,
introduced an upstream kernel problem on non-SMCA platforms that has 
been revealed by the emulation framework on AMD. That's the reason why I 
think it should be fixed in upstream too. And Yazen himself agrees with 
that.


> 
>> Errors are injected into VMs by the hypervisor when real memory hardware
>> errors occur on the system that impact the VM address space.
> 
> And?

The injected error is received by the VM kernel to deal with it.

> Why?

The VM kernel executes the same mechanisms used on bare metal in that case.
As Tony said on Feb 9: The guest may be able to just kill a process and 
keep running.

> 
> What's the recovery action scenario for having errors injected into guests?

Just the same as running on real HW.

> Where is that documented? Why does the upstream kernel need to care?

Sorry I don't have a kernel documentation pointer about that, but the 
MCE relay mechanism sure is an Hypervisor functionality.

> 
> Basically I'm asking you for the use case in order to determine whether that
> use case is valid for the *upstream* kernel to support.

Yes, of course, see below.

> 
>> This is not only a test, this is real life mechanism. With the fix
>> 7cb735d7c0cb that has been integrated, VMs kernel running on AMD now crashes
>> on Deferred errors, where it used to be able to deal with them before this
>> commit.
> 
> Because we don't know of your use case. So when we do upstream development how
> can we test your case?
> 

I have a procedure to verify the behavior: It consists of running the 
upstream kernel in a VM (on an AMD platform) and injecting a memory 
error from the hardware platform to this VM to mimic a real hardware 
error being reported to the platform Kernel.

To do so:
Run Qemu as root (to help with the address translation).
The VM runs the upstream kernel.
Run the small attached program in the VM as root, so that it gives a 
guest physical address of one of its mapped memory page.

[root@VM]# ./mce_process_react_x86
Setting Early kill... Ok

Data pages at 0xXXXXXXX  physically 0xYYYYY000

-> DON'T Press enter !   (just leave the process wait here)

Ask the emulator (QEMU in this case) to give the host physical address 
of the guest physical page:
  (qemu) gpa2hpa 0xYYYYY000
  Host physical address for 0xYYYYY000 (pc.ram) is 0xPFN000

 From the host physical address get the pfn value (removing the last 3 
zeros of the address) to poison.

On the host, use hwpoison kernel module:
[root@host]# modprobe hwpoison_inject

and inject an error to the targeted pfn:
[root@host]# echo 0xPFN > /sys/kernel/debug/hwpoison/corrupt-pfn

Than wait until the Asynchronous error generated reaches the VM (it can 
take up to 5 minutes on AMD virtualization) to see the VM kernel deal 
with it.

Without this suggested fix, the VM kernel panics, with the stack trace I 
gave:

mce: MSR access error: WRMSR to 0xc0002098 (tried to write 
0x0000000000000000)
at rIP: 0xffffffff8229894d (mce_wrmsrq+0x1d/0x60)

    amd_clear_bank+0x6e/0x70
    machine_check_poll+0x228/0x2e0
    ? __pfx_mce_timer_fn+0x10/0x10
    mce_timer_fn+0xb1/0x130
    ? __pfx_mce_timer_fn+0x10/0x10
    call_timer_fn+0x26/0x120
    __run_timers+0x202/0x290
    run_timer_softirq+0x49/0x100
    handle_softirqs+0xeb/0x2c0
    __irq_exit_rcu+0xda/0x100
    sysvec_apic_timer_interrupt+0x71/0x90
[...]
   Kernel panic - not syncing: MCA architectural violation!


With the fix the VM Kernel deals with the error:

[root@VM]# ./mce_process_react_x86
Setting Early kill... Ok
Data pages at 0x7fa0f9b25000 physically 0x172929000

(qemu) gpa2hpa 0x172929000
Host physical address for 0x172929000 (pc.ram) is 0x237129000

-> Injecting the error with:
[root@host]# echo 0x237129 >  /sys/kernel/debug/hwpoison/corrupt-pfn

-> The VM monitor indicates:
qemu-kvm: warning: Guest MCE Memory Error at QEMU addr 0x7f3ae2729000 
and GUEST addr 0x172929000 of type BUS_MCEERR_AO injected

-> A few minutes later, the VM console shows:
localhost login: [  332.973864] mce: [Hardware Error]: Machine check 
events logged
[  332.976795] Memory failure: 0x172929: Sending SIGBUS to 
mce_process_rea:5607 due to hardware memory corruption
[  332.977832] Memory failure: 0x172929: recovery action for dirty LRU 
page: Recovered
[  355.056785] MCE: Killing mce_process_rea:5607 due to hardware memory 
corruption fault at 0x7fa0f9b25000

-> The process shows:
Signal 7 received: BUS_MCEERR_AO on vaddr: 0x7fa0f9b25000
Signal 7 received: BUS_MCEERR_AR on vaddr: 0x7fa0f9b25000
Exit from the signal handler on BUS_MCEERR_AR

-> Works as expected: AO error is relayed by the VM kernel to the 
application running.



> Before that, is that case even worth testing?

If we accept that relayed MCEs is supported by the upstream kernel 
running in the VM, than yes.

> 
> I hope I'm making sense here. The MCA and other low-level hw code works on
> baremetal as that's its main target. If it is supposed to work in VMs, then
> there better be a proper use case which we are willing to support and we can
> *actually* *test*.

The above detailed procedure can maybe help with this aspect, even if it 
is virtualization oriented. As I do hope that upstream kernel supports 
memory error handling in a VM.

But Yazen's answers about non-SMCA hardware can also help to decide what 
to do with this fix.

> 
> If not, you can keep this "fix" in your guest kernels and everyone's happy.
> 
> Thx.

I hope my explanations helped to better understand the context.

Thanks,
William.




--------------hgRvAjcSRhNkYEg62iVQ0vZZ
Content-Type: text/x-csrc; charset=UTF-8; name="mce_process_react.c"
Content-Disposition: attachment; filename="mce_process_react.c"
Content-Transfer-Encoding: base64

I2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8c3lzL3ByY3RsLmg+CiNpbmNsdWRlIDxz
eXMvbW1hbi5oPgojaW5jbHVkZSA8c3RkaW8uaD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVk
ZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHNpZ25hbC5oPgojaW5j
bHVkZSA8c3RyaW5nLmg+CgojZGVmaW5lIFBBR0VNQVBfRU5UUlkgOAojZGVmaW5lIEdFVF9CSVQo
WCxZKSAoWCAmICgodWludDY0X3QpMTw8WSkpID4+IFkKI2RlZmluZSBHRVRfUEZOKFgpIFggJiAw
eDdGRkZGRkZGRkZGRkZGCgpjb25zdCBpbnQgX19lbmRpYW5fYml0ID0gMTsKI2RlZmluZSBpc19i
aWdlbmRpYW4oKSAoICgqKGNoYXIqKSZfX2VuZGlhbl9iaXQpID09IDAgKQpzdGF0aWMgbG9uZyBw
Z3N6OwoKLyoKICogU2V0IHRoZSBlYXJseSBraWxsIG1vZGUgcmVhY3Rpb24gc3RhdGUgdG8gTUNF
IGVycm9yLgogKi8Kc3RhdGljIHZvaWQgZWFybHlfcmVhY3Rpb24oKSB7CiAgIHByaW50ZigiU2V0
dGluZyBFYXJseSBraWxsLi4uICIpOwogICBpZiAocHJjdGwoUFJfTUNFX0tJTEwsIFBSX01DRV9L
SUxMX1NFVCwgUFJfTUNFX0tJTExfRUFSTFksIDAsIDApID09IDApCiAgICAgIHByaW50ZigiT2tc
biIpOwogICBlbHNlCiAgICAgIHByaW50ZigiRmFpbHVyZSAhXG4iKTsKfQoKLyoKICogUmV0dXJu
IHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFzc29jaWF0ZWQgdG8gYSBnaXZlbiBsb2NhbCB2aXJ0dWFs
IGFkZHJlc3MsCiAqIG9yIC0xIGluIGNhc2Ugb2YgYW4gZXJyb3IuCiAqLwpzdGF0aWMgdWludDY0
X3QgcGh5c2ljYWxfYWRkcmVzcyh1aW50NjRfdCB2aXJ0X2FkZHIpIHsKICAgY2hhciBwYXRoX2J1
ZiBbMHgxMDBdOwogICBGSUxFICogZjsKICAgdWludDY0X3QgcmVhZF92YWwsIGZpbGVfb2Zmc2V0
LCBwZm4gPSAwOwogICB1bnNpZ25lZCBjaGFyIGNfYnVmW1BBR0VNQVBfRU5UUlldOwogICBwaWRf
dCBteV9waWQgPSBnZXRwaWQoKTsKICAgaW50IHN0YXR1cywgaTsKCiAgIHNwcmludGYocGF0aF9i
dWYsICIvcHJvYy8ldS9wYWdlbWFwIiwgbXlfcGlkKTsKICAgCiAgIGYgPSBmb3BlbihwYXRoX2J1
ZiwgInJiIik7CiAgIGlmKCFmKXsKICAgICAgcHJpbnRmKCJFcnJvciEgQ2Fubm90IG9wZW4gJXNc
biIsIHBhdGhfYnVmKTsKICAgICAgcmV0dXJuICh1aW50NjRfdCktMTsKICAgfQogICAKICAgZmls
ZV9vZmZzZXQgPSB2aXJ0X2FkZHIgLyAodWludDY0X3QpcGdzeiAqIFBBR0VNQVBfRU5UUlk7CiAg
IHN0YXR1cyA9IGZzZWVrKGYsIChsb25nKWZpbGVfb2Zmc2V0LCBTRUVLX1NFVCk7CiAgIGlmKHN0
YXR1cyl7CiAgICAgIHBlcnJvcigiRmFpbGVkIHRvIGRvIGZzZWVrISIpOwogICAgICBmY2xvc2Uo
Zik7CiAgICAgIHJldHVybiAodWludDY0X3QpLTE7CiAgIH0KCiAgIGZvcihpPTA7IGkgPCBQQUdF
TUFQX0VOVFJZOyBpKyspewogICAgICBpbnQgYyA9IGdldGMoZik7CiAgICAgIGlmKGM9PUVPRil7
CiAgICAgICAgIGZjbG9zZShmKTsKICAgICAgICAgcmV0dXJuICh1aW50NjRfdCktMTsKICAgICAg
fQogICAgICBpZihpc19iaWdlbmRpYW4oKSkKICAgICAgICAgICBjX2J1ZltpXSA9ICh1bnNpZ25l
ZCBjaGFyKWM7CiAgICAgIGVsc2UKICAgICAgICAgICBjX2J1ZltQQUdFTUFQX0VOVFJZIC0gaSAt
IDFdID0gKHVuc2lnbmVkIGNoYXIpYzsKICAgfQogICBmY2xvc2UoZik7CgogICByZWFkX3ZhbCA9
IDA7CiAgIGZvcihpPTA7IGkgPCBQQUdFTUFQX0VOVFJZOyBpKyspewogICAgICByZWFkX3ZhbCA9
IChyZWFkX3ZhbCA8PCA4KSArIGNfYnVmW2ldOwogICB9CgogICBpZihHRVRfQklUKHJlYWRfdmFs
LCA2MykpIHsKICAgICAgcGZuID0gR0VUX1BGTihyZWFkX3ZhbCk7CiAgIH0gZWxzZSB7CiAgICAg
IHByaW50ZigiUGFnZSBub3QgcHJlc2VudCAhXG4iKTsKICAgfQogICBpZihHRVRfQklUKHJlYWRf
dmFsLCA2MikpCiAgICAgIHByaW50ZigiUGFnZSBzd2FwcGVkXG4iKTsKCiAgIGlmIChwZm4gPT0g
MCkKICAgICAgcmV0dXJuICh1aW50NjRfdCktMTsKCiAgIHJldHVybiBwZm4gKiAodWludDY0X3Qp
cGdzejsKfQoKLyoKICogU0lHQlVTIGhhbmRsZXIgdG8gZGlzcGxheSB0aGUgZ2l2ZW4gaW5mb3Jt
YXRpb24uCiAqLwpzdGF0aWMgdm9pZCBzaWdidXNfYWN0aW9uKGludCBzaWdudW0sIHNpZ2luZm9f
dCAqc2lnaW5mbywgdm9pZCAqY3R4KSB7CiAgIHByaW50ZigiU2lnbmFsICVkIHJlY2VpdmVkOiAi
LCBzaWdudW0pOwogICBwcmludGYoIiVzIG9uIHZhZGRyOiAlcFxuIiwKICAgICAgKHNpZ2luZm8t
PnNpX2NvZGUgPT0gND8gIkJVU19NQ0VFUlJfQVIiOiJCVVNfTUNFRVJSX0FPIiksCiAgICAgIHNp
Z2luZm8tPnNpX2FkZHIpOwoKICBpZiAoc2lnaW5mby0+c2lfY29kZSA9PSA0KSB7IC8qIEJVU19N
Q0VFUlJfQVIgKi8KCWZwcmludGYoc3RkZXJyLCAiRXhpdCBmcm9tIHRoZSBzaWduYWwgaGFuZGxl
ciBvbiBCVVNfTUNFRVJSX0FSXG4iKTsKCV9leGl0KDEpOwogIH0KfQoKaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiogYXJndikgewogICBzdHJ1Y3Qgc2lnYWN0aW9uIG15X3NpZ2FjdGlvbjsKICAg
dWludDY0X3QgdmlydF9hZGRyID0gMCwgcGh5c19hZGRyOwogICB2b2lkICpsb2NhbF9wbnQ7Cgog
ICAvLyBOZWVkIHRvIGhhdmUgdGhlIENBUF9TWVNfQURNSU4gY2FwYWJpbGl0eSB0byBnZXQgUEZO
cyB2YWx1ZXMgaW4gcGFnZW1hcC4KICAgaWYgKGdldHVpZCgpICE9IDApIHsKICAgICAgZnByaW50
ZihzdGRlcnIsICJVc2FnZTogJXMgbmVlZHMgdG8gcnVuIGFzIHJvb3RcbiIsIGFyZ3ZbMF0pOwog
ICAgICBleGl0KEVYSVRfRkFJTFVSRSk7CiAgIH0KCiAgIC8vIGF0dGFjaCBvdXIgU0lHQlVTIGhh
bmRsZXIuCiAgIG1lbXNldCgmbXlfc2lnYWN0aW9uLCAwLCBzaXplb2YobXlfc2lnYWN0aW9uKSk7
CiAgIG15X3NpZ2FjdGlvbi5zYV9zaWdhY3Rpb24gPSBzaWdidXNfYWN0aW9uOwogICBteV9zaWdh
Y3Rpb24uc2FfZmxhZ3MgPSBTQV9TSUdJTkZPIHwgU0FfTk9ERUZFUjsKICAgc2lnZW1wdHlzZXQo
Jm15X3NpZ2FjdGlvbi5zYV9tYXNrKTsKICAgaWYgKHNpZ2FjdGlvbihTSUdCVVMsICZteV9zaWdh
Y3Rpb24sIE5VTEwpID09IC0xKSB7CiAgICAgIHBlcnJvcigiU2lnbmFsIGhhbmRsZXIgYXR0YWNo
IGZhaWxlZCIpOwogICAgICBleGl0KEVYSVRfRkFJTFVSRSk7CiAgIH0KCiAgIHBnc3ogPSBzeXNj
b25mKF9TQ19QQUdFU0laRSk7CiAgIGlmIChwZ3N6ID09IC0xKSB7CgkgICBwZXJyb3IoInN5c2Nv
bmYoX1NDX1BBR0VTSVpFKSIpOwoJICAgZXhpdChFWElUX0ZBSUxVUkUpOwogICB9CiAgIGVhcmx5
X3JlYWN0aW9uKCk7CgogICAvLyBBbGxvY2F0ZSBhIHByaXZhdGUgcGFnZS4KICAgbG9jYWxfcG50
ID0gbW1hcChOVUxMLCBwZ3N6LCBQUk9UX1JFQUR8UFJPVF9XUklURSwgTUFQX0FOT058TUFQX1BS
SVZBVEUsIC0xLCAwKTsKICAgaWYgKGxvY2FsX3BudCA9PSBNQVBfRkFJTEVEKSB7CiAgICAgIGZw
cmludGYoc3RkZXJyLCAiTWVtb3J5IEFsbG9jYXRpb24gZmFpbGVkICFcbiIpOwogICAgICBleGl0
KEVYSVRfRkFJTFVSRSk7CiAgIH0KICAgdmlydF9hZGRyID0gKHVpbnQ2NF90KWxvY2FsX3BudDsK
CiAgIC8vIERpcnR5IC8gbWFwIHRoZSBwYWdlLgogICBzcHJpbnRmKChjaGFyICopbG9jYWxfcG50
LCAiTXkgcGFnZVxuIik7CgogICBwaHlzX2FkZHIgPSBwaHlzaWNhbF9hZGRyZXNzKHZpcnRfYWRk
cik7CiAgIGlmIChwaHlzX2FkZHIgPT0gLTEpIHsKICAgICAgZnByaW50ZihzdGRlcnIsICJWaXJ0
dWFsIGFkZHJlc3MgdHJhbnNsYXRpb24gMHglbGx4IGZhaWxlZFxuIiwgCiAgICAgICAgICh1bnNp
Z25lZCBsb25nIGxvbmcpdmlydF9hZGRyKTsKICAgICAgZXhpdChFWElUX0ZBSUxVUkUpOwogICB9
CiAgIHByaW50ZigiXG5EYXRhIHBhZ2VzIGF0IDB4JWxseCAgcGh5c2ljYWxseSAweCVsbHhcbiIs
CiAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpdmlydF9hZGRyLCAodW5zaWduZWQgbG9uZyBsb25n
KXBoeXNfYWRkcik7CiAgIGZmbHVzaChzdGRvdXQpOwoKICAgcHJpbnRmKCJcblByZXNzIEVOVEVS
IHRvIGNvbnRpbnVlXG4iKTsKICAgZmdldGMoc3RkaW4pOwogICAKICAgLy8gcmVhZCB0aGUgc3Ry
aW5nIGF0IHRoZSBiZWdpbm5pbmcgb2YgcGFnZS4KICAgcHJpbnRmKCIlcyIsIChjaGFyICopbG9j
YWxfcG50KTsKCiAgIHBoeXNfYWRkciA9IHBoeXNpY2FsX2FkZHJlc3ModmlydF9hZGRyKTsKICAg
aWYgKHBoeXNfYWRkciA9PSAtMSkgewogICAgICBmcHJpbnRmKHN0ZGVyciwgIlZpcnR1YWwgYWRk
cmVzcyB0cmFuc2xhdGlvbiAweCVsbHggZmFpbGVkXG4iLCAKICAgICAgICAgKHVuc2lnbmVkIGxv
bmcgbG9uZyl2aXJ0X2FkZHIpOwogICB9IGVsc2UgewogICAgICBwcmludGYoIlxuRGF0YSBwYWdl
cyBhdCAweCVsbHggIHBoeXNpY2FsbHkgMHglbGx4XG4iLAogICAgICAgICAodW5zaWduZWQgbG9u
ZyBsb25nKXZpcnRfYWRkciwgKHVuc2lnbmVkIGxvbmcgbG9uZylwaHlzX2FkZHIpOwogICB9Cgog
ICByZXR1cm4gMDsKfQo=

--------------hgRvAjcSRhNkYEg62iVQ0vZZ--
