Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1539C3EFD34;
	Tue, 24 Mar 2026 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354770; cv=fail; b=EZROuFZa232nUJUzYkzCD/v6WuL3rYi40LfB61/V1aaPiQ7/1X3ok7UwitR55hL+Ycf3ztfarU918PdyPiP2FiBkaU21bpBMiZjL34/OZ5mOeac9ObCWU6okA8ak+SCY7oyUfYdyVhyU6x1anA1sWwBPAdfigaH1XBhyEhGHv/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354770; c=relaxed/simple;
	bh=5Bh+RsmqQFluTPECOWCPCq5OBLii6rEzW+KxaSH5w8c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EoqI0aP2HBG3gxrMTMEAWZh3cEmjVZD0YC5b+u0YTWzCR9y8xeqzUHJCyB4TyaBpVKKE9FOBoOiNAELYQwNtmdVToqkIWv6xqylq5yLatCSD4LcZJFxu+ODDFg5mnI6fu1VvwG9hHVYK+9S1O7ekI+KlpFzDPp/K9S2DVp1yZDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vzt18RG6; arc=fail smtp.client-ip=52.101.48.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vzt18RG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQh2JyLNL06EWHUP7amL9aJf28BLPJtixjTPRbGVQjSJ74BLOP/j4Scjoq7PtpMi1GR1DBIErALnC3eSkH7giO7urJGEPpw2dZgdwpTtypGwE4OSqp9GzfInuhe6CwbwkX5LYfJZ0snc9ephMywKYgdddCCVZZFek0Zdnsdp/y6ndpjEzn6J7+xJvC61y5FYLx+IyZeGaMAEeXPcARuEcjdTPDqmw7KdL2gsXa7ngSuG/Yo2Jy8XYTNOgkWwCLaMQpkk9V9r++HAEFHbr+NRulHMHFC5h2ETfGd50catz9sALjwse95HHrJ7XdJzCCxOg0QX7w5c8MzdCQyt1HPZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bh+RsmqQFluTPECOWCPCq5OBLii6rEzW+KxaSH5w8c=;
 b=cKleSNh5OrtqkUdU1m5lX0S5naGYChDGTRpOI0tJ1weMYaO+aLiurrkBawnx3XVs1BD5vxpW7hhFFHNg80ckWGsfZsm7ARoK1WZrqHEVRnLktLRduopOfaTvhxRjwv7HcnrriLG8Pvz/HJ3QKT4yTz7xHrqOuB10/7AjDLGtcc/QJHYyewBDic9k5RbAFrpEzQBcNO3L1Jrm8b0TVc8o12Kx+Vs1gLKMPl2LVynGXR3FOAOQD/c4Pa8PFcqjY0silgl6X5sxONBiempdYNRS70NuuZ5ZKRnIKzGFI1GVg2tmclVBuv2QEgqsQgp2ALoK752wZZyGf+qtHOFczpgbDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bh+RsmqQFluTPECOWCPCq5OBLii6rEzW+KxaSH5w8c=;
 b=vzt18RG6EebSJLj/zzslqUC17mqpxzTTwPNrou5mBwIFpy7yr5fiuZ24ptlO4HesQbeUXWqKHa1C0QCtG3TWH6gCXni57BiJLZuRC7uKwhIovEStJzLUof6W2pMg5a9B1V4l0e+lnAJI/4l0BJo31EoSzruYp6LyEml+/tGMxbs=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:19:25 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 12:19:25 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: Borislav Petkov <bp@alien8.de>, Felix Gu <ustc.gu@gmail.com>
CC: Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] edac: versalnet: Fix device_node leak in mc_probe()
Thread-Topic: [PATCH] edac: versalnet: Fix device_node leak in mc_probe()
Thread-Index: AQHcuhWJXpBfncR/DUaOS8KOdILGWrW6vkYAgALeGrA=
Date: Tue, 24 Mar 2026 12:19:25 +0000
Message-ID:
 <LV5PR12MB9828291FB475B938BF90C7528148A@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <20260323-versalnet-v1-1-4ab3012635ef@gmail.com>
 <20260322163040.GCacAZMAcIw81kqrNQ@fat_crate.local>
In-Reply-To: <20260322163040.GCacAZMAcIw81kqrNQ@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-03-24T12:18:07.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|DS0PR12MB7677:EE_
x-ms-office365-filtering-correlation-id: 41af8232-455d-40dc-0b48-08de899f96f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 QY3I1HMNowD1sfwyjB7o+W8IxkIB54toYA8YCRRXdN9VyqewHIt0s0UlzyNqXbK3xjOEgaXEqtmlieDONm9lLi+M/ckk1G85XOaOIlWCuPzcz276ES48Kb1is+FCZ4hFVN48TdJ36pZ71JfM57CZ1foGU06HK+Q6bVCVStMeYTCNHImoX+krJXtZGXtG+o+tN23q8GsgGD2/M1IPtW8dylCGzctQt3rmfET7w48gqjGoz2XE+oUh6C63qpb/tWG73UBB/r94rPzgR6MHzi9ufVcW42qf2EkxB1zHBV/QWLeUW7P7D2xKZ9k6bysptY5MU9d+ZNj1v6VBIHvHWy1p8bpgBp8hJjj5eeCb61JcoIfz1QhFeEmRBrb6r9nZgB0c/+7aRCoBiDbRwcalpEjEWqbOMXeDDUZFMUJLZJWG/uXoPKQK1S6cqeeY3LIiZUT+BoW95oYidcYU9V0NVItYgemYvuUwER2kGSbZQKMQgPQKf7CIsfirkCV6aTSVD7WXPXByBkJ8//yaLnVPzDr9m20wPkzQmdflDJPc2f75Ga3QHHAg8+j+xocWKXWlQ3TN6xQb4hmPrdRLrAc7Egbwj/wgJFmUS8UkAFiIPG3chBbA5DXN/SsdyFiQRj/pul6dzDal/GPvNuJYThOzLbce/C+lPKUc7afXgJ5cap3rBhIDpevL60eY+am48xkog3AUahaWHU9zFO5n1YkH570JQkJrdC0yO/D/OXiM9dKy68D6il14BcfDpSCqoYuI5VfN6Tyipb6bcrdz0ubJte4GSY2NteOBcHoqF+mfp22x8c8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WXMxenE2emQ4U1A2WkZ3Wms4SDVBQ1hvazE1cnZYUktxK3R0V29BSmthRzdC?=
 =?utf-8?B?KzExd1N0N1g4NHF0N0ZVNTU4a3BsQWM1Wm9SSmhKdzNseFVlK2pnWUZtb09R?=
 =?utf-8?B?MUNtTUwyY2pxeG5EUWN6eDV6RXpEa1QydU9ROUFtNXgzOWxUNEkxQkk3ZzBm?=
 =?utf-8?B?bjNQVkVPOGE4MmVQN0tPUitzbm9LM0NFZkVmQUQ5b0ZaeXR4N1ArY2J3Z3px?=
 =?utf-8?B?OU9OL2QrZFM4NFVuTmtvOUhLRGlWU2RnSGNmK2VJdytPTzEwSXl5Tmt0Z3Uy?=
 =?utf-8?B?cDFSYlJSZ0RqZlNJUnNib0NQeVR4M2JsMEtRVFl3dStEOUtuVUlhMFVMbWJE?=
 =?utf-8?B?OGlZU1oreVRzNnRWZXhJaVFPeGliUUYyeHpIendzUkJ6bzN0UHBUWFg5a1Zw?=
 =?utf-8?B?MU42aDk1cXhvd3V4Q3JyN2YxQ0RTc2tKVkMxdkFydWRLLzRDSzArcGExMzJM?=
 =?utf-8?B?czhrZmNIR3NncFl4elpua3JNRzFTcjFzTkxCcVExSXdZU3VJSmY2WWxrNmdx?=
 =?utf-8?B?eVZaaG14cjF6UU9GdytUMjR6K3NFSXRyeiszaVhvK2ptL2FmTk80S0I0NmhB?=
 =?utf-8?B?MWkralQ2d01vWDlLVktQUmpSVVdSK0ZVY3RFY0QvT3NGRmVtYlNKejBpSW9s?=
 =?utf-8?B?QjA4TEdPL0YvZ1c0Rk9LcnhhejNxMWpmQ0U2V0VRM2lJb2hmaWFBWVlQRnlh?=
 =?utf-8?B?NlY1U2Vtc3dNbDdBVTdGbTdCNVBiayswOG43OVNrTDFLR3haYkZFbEdDdWd2?=
 =?utf-8?B?QStHN011aUVWemxUTld2NVIrMEs2ZTVBVE45dnUvS1ZpYVlZWVEvYkJvUk5h?=
 =?utf-8?B?WXY2cU8ybi9TRjVEUmtaYXdhWmFaaFdRdWJrN3ZZbjNvRXhST1pOWjdzTU4r?=
 =?utf-8?B?RTRjWjQ1YWRCWE9ya1FFdiswMFlYVUxyak0xbGFRY0NIVCtaLzlTelVRWDdJ?=
 =?utf-8?B?N3ptbUxuL2pCVit2anNLTzVCdUxSdjRYdUdnNDd5SUI4cGJ3VGdvM3Z6cWhw?=
 =?utf-8?B?dDVnYjY5eTRKZklUeXZkL015bWRzY3NFS3lVRTBJbld6MmFreGN0b0c0N1FY?=
 =?utf-8?B?clI3eTVGVWJwU0NLdzJ1N2pPeFJmTzNhUzI1VnMyRXlSQnlvMm5GaGpieHdC?=
 =?utf-8?B?WVhydTl1S0ZiVkF4VEYvTSsvOFEycXB5YWtRQ2RqTUV3RUJrWUpZcElNTVhQ?=
 =?utf-8?B?V2R4SG0xMmZTamFoT2l0SVI1eUc3ck9pRXNCRkc2bkVCenI3S2w2R0Z4bHNp?=
 =?utf-8?B?Z1V3dnpQQkxaMlJuZlZyZUlYYVBRVWExbmlaZ2FBMTkvdmdlMEgvajdGMUds?=
 =?utf-8?B?cnVjTUphMlRDcjZBUk9ObGI1UytsdVFXOFFxQzVmaVBEOWw2bVZrOVBNaEVF?=
 =?utf-8?B?cjIwTm94NmsyamVGbWxrV3NNS2tQdFZUL3lKb2kzV3czanZLdWIxL2c5cEpy?=
 =?utf-8?B?Tk1aN2huYk9vdWN5TjFmNUlLYllHVSsvZ0VhazVLUUMxNXkwMDZXanFsUUdM?=
 =?utf-8?B?REpUN2VWVVFubFhzSUMxSGhvTXB1T3VQalF1bkQxNlI5OWRBU0NzQmxZRTZW?=
 =?utf-8?B?aFh3SC9FY0ZDR204NHB6Z1hzZS92b2RyV09hZnVQOTFTNnJLOWNZb0t4MTVt?=
 =?utf-8?B?WnRuK1NPYW5zejgxdTFKYkViRS9BamdFQ3NnczlSRFBpUlpNOWtZUUNWckZy?=
 =?utf-8?B?YkorMFExdUJkd01FZUxkT25VYUNuMlZkdGdxN1Q3WXllVXA4MWNzaGRlZy93?=
 =?utf-8?B?cUMzMkxFQ2VKK3dyVUNXYzFieU5FWDFYMFVOVng0ZzRnR1F1NlZrdTFkS3Az?=
 =?utf-8?B?RjE1MU4xai84NVdrU0VFeHFQcEVPQk9KU0dZelExQXkxcktJZEJjR2xPMzFY?=
 =?utf-8?B?T2xub3BxclV0b1ZUS0VPc3lRa0pDY3UzeU91NFlmZDl1bWduTG90VTVrOFBN?=
 =?utf-8?B?VFNvcVJ6SVRpSDBYVWZ5cjY4MkJKUytqdDBoTEFCMUp3Rzg0RWFEYysyUXNy?=
 =?utf-8?B?bUNuYUcxVzhRWmdzempRUG45dG5kWVBPa3VnZnJWRkZuMGFWSXBLb0pqN3Qw?=
 =?utf-8?B?R21uWkRPZS9aMzh4ZUtUTVgxdGJrdFYzTy9QNy9SbjkrVkhBMnY4OXFOclFs?=
 =?utf-8?B?aUFPK2dKalBUNG5md3BqSUMvRkFTbUplbi9rSW80VGhRU05JR0lKL1lpZzJp?=
 =?utf-8?B?c2FJY3VNWjdHRGtDY3NQeEZGbGk3WTJjMk8xQW1rbWlkUkx0eXZFY3UxSkJS?=
 =?utf-8?B?UlRES0FIcFNZU1RqZ2ZMa3ZOa3JqVGwzcWEwN0wxVmNaZmh4QldxNENaZ2xw?=
 =?utf-8?Q?qOTnvi+4igz6EDnRci?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41af8232-455d-40dc-0b48-08de899f96f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 12:19:25.8228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65WNwzK3H8810ZPjFdphzFDx2HptAiP3CDisKJA4r6pU2yR+7TVWN4w7jK7QD0RC0/9MNe78w0wTLdlZR2HlIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCb3Jpc2xhdiBQZXRrb3Yg
PGJwQGFsaWVuOC5kZT4NCj4gU2VudDogU3VuZGF5LCBNYXJjaCAyMiwgMjAyNiAxMDowMSBQTQ0K
PiBUbzogRmVsaXggR3UgPHVzdGMuZ3VAZ21haWwuY29tPg0KPiBDYzogRGF0dGEsIFNodWJocmFq
eW90aSA8c2h1YmhyYWp5b3RpLmRhdHRhQGFtZC5jb20+OyBUb255IEx1Y2sNCj4gPHRvbnkubHVj
a0BpbnRlbC5jb20+OyBsaW51eC1lZGFjQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZWRhYzogdmVyc2FsbmV0
OiBGaXggZGV2aWNlX25vZGUgbGVhayBpbiBtY19wcm9iZSgpDQo+DQo+IENhdXRpb246IFRoaXMg
bWVzc2FnZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNh
dXRpb24NCj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVz
cG9uZGluZy4NCj4NCj4NCj4gT24gTW9uLCBNYXIgMjMsIDIwMjYgYXQgMTI6MDQ6MDhBTSArMDgw
MCwgRmVsaXggR3Ugd3JvdGU6DQo+ID4gb2ZfcGFyc2VfcGhhbmRsZSgpIHJldHVybnMgYSBkZXZp
Y2Vfbm9kZSByZWZlcmVuY2UgdGhhdCBtdXN0IGJlDQo+ID4gcmVsZWFzZWQgd2l0aCBvZl9ub2Rl
X3B1dCgpLiBUaGUgb3JpZ2luYWwgY29kZSBuZXZlciBmcmVlZA0KPiA+IHI1X2NvcmVfbm9kZSBv
biBhbnkgZXhpdCBwYXRoLCBjYXVzaW5nIGEgbWVtb3J5IGxlYWsuDQo+ID4NCj4gPiBGaXggdGhp
cyBieSB1c2luZyB0aGUgYXV0b21hdGljIGNsZWFudXAgYXR0cmlidXRlIF9fZnJlZShkZXZpY2Vf
bm9kZSkNCj4gPiB3aGljaCBlbnN1cmVzIG9mX25vZGVfcHV0KCkgaXMgY2FsbGVkIHdoZW4gdGhl
IHZhcmlhYmxlIGdvZXMgb3V0IG9mDQo+ID4gc2NvcGUuDQo+ID4NCj4gPiBGaXhlczogZDVmZTJm
ZWM2YzQwICgiRURBQzogQWRkIGEgZHJpdmVyIGZvciB0aGUgQU1EIFZlcnNhbCBORVQgRERSDQo+
ID4gY29udHJvbGxlciIpDQo+ID4gU2lnbmVkLW9mZi1ieTogRmVsaXggR3UgPHVzdGMuZ3VAZ21h
aWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2VkYWMvdmVyc2FsbmV0X2VkYWMuYyB8IDQg
KystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZWRhYy92ZXJzYWxuZXRfZWRhYy5jDQo+
ID4gYi9kcml2ZXJzL2VkYWMvdmVyc2FsbmV0X2VkYWMuYyBpbmRleCAwYjQ3ZWQ3ZmVkNjMuLjkx
NWJjZDYxNjZmNw0KPiA+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZWRhYy92ZXJzYWxuZXRf
ZWRhYy5jDQo+ID4gKysrIGIvZHJpdmVycy9lZGFjL3ZlcnNhbG5ldF9lZGFjLmMNCj4gPiBAQCAt
ODg4LDEyICs4ODgsMTIgQEAgc3RhdGljIHZvaWQgcmVtb3ZlX3ZlcnNhbG5ldChzdHJ1Y3QgbWNf
cHJpdg0KPiA+ICpwcml2KQ0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgbWNfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikgIHsNCj4gPiAtICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnI1
X2NvcmVfbm9kZTsNCj4gPiAgICAgICBzdHJ1Y3QgbWNfcHJpdiAqcHJpdjsNCj4gPiAgICAgICBz
dHJ1Y3QgcnByb2MgKnJwOw0KPiA+ICAgICAgIGludCByYzsNCj4gPg0KPiA+IC0gICAgIHI1X2Nv
cmVfbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUocGRldi0+ZGV2Lm9mX25vZGUsICJhbWQscnByb2Mi
LCAwKTsNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnI1X2NvcmVfbm9kZSBfX2ZyZWUo
ZGV2aWNlX25vZGUpID0NCj4gPiArICAgICAgICAgICAgIG9mX3BhcnNlX3BoYW5kbGUocGRldi0+
ZGV2Lm9mX25vZGUsICJhbWQscnByb2MiLCAwKTsNCj4gPiAgICAgICBpZiAoIXI1X2NvcmVfbm9k
ZSkgew0KPiA+ICAgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiYW1kLHJwcm9jOiBp
bnZhbGlkIHBoYW5kbGVcbiIpOw0KPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4NCj4gPiAtLS0NCj4NCj4gTG9va3MgY29ycmVjdCB0byBtZS4NCj4NCj4gQFNodWJocmFqeW90
aSwgY2FuIHlvdSBwbHMgdGVzdCBpdD8NCj4NCj4gVGh4Lg0KDQpJIHRlc3RlZCB0aGlzIGNoYW5n
ZSBvbiBoYXJkd2FyZSBhbmQgaXQgd29ya3MgYXMgZXhwZWN0ZWQuDQpQbGVhc2UgZmVlbCBmcmVl
IHRvIGFkZDoNClJldmlld2VkLWJ5OiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5k
YXR0YUBhbWQuY29tPg0KDQo+DQo+IC0tDQo+IFJlZ2FyZHMvR3J1c3MsDQo+ICAgICBCb3Jpcy4N
Cj4NCj4gaHR0cHM6Ly9wZW9wbGUua2VybmVsLm9yZy90Z2x4L25vdGVzLWFib3V0LW5ldGlxdWV0
dGUNCg==
