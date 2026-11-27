Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795762890;
	b=eA1MBc8cekrohv5CF9AeUXVFjWNfddmQRiYWJzjj2wSZ24SpYsHfjAKOBBzuZqEuInRy
	 x+8HRFFQneNT3n9+GbWrBKKe3Y6Kj4Q84Y3B36OTIUc4vCZlTfCCWc6E8Do4s1wEip9qm
	 ovgnDth6QoifgWix1P+Zmnw8dH1+JR/hmrlj2FpgLqCWXWjG2plgzpXIgdcziGUX/+gkC
	 176Ss8RDjZY2aXn3DhpyOeDaX7aMa7cVI/4yLAtxYW/Z0IHOy8XngsCBLYOafm20PEJXu
	 lSLO3CXWgNXiUC1jeMmRihbim+c7ZEjQhE73SeGq5y3+t4ZXwPw2CbbkvTt6bGytH7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762890;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=t2zA7MPyJBXpiDbllv10etlFZ5HW0Z9egckvSIAQLZk=;
	b=I6b5HgyQrXi5metG3XzKVYcal/tioDsXPxPBJD2LB0Vvf/r4id8P/0q1o+NS4wIvkydJ
	 6o8X5KbzkmFTS8oN4yKSrSW2sDeWQfkxUdcE26C1gRHlyFiA0JLOBbZbwmgRYv3ZkCOE/
	 p98W7mFaqWoDqpuQLksPqY5wg0D/dZFdzfGiikLY/2jAIQY3iSgW6bSCpIefSmbWLtIHr
	 QvraklP2nA/Bj+pnzF1rBxwck8zd/lhxJpc1WLvASQfZCO1sT86raLIxQLBuQu+h0Nwrl
	 a+bmreddST8kW3oyNew2sfMrisH2vl1ibbOuggeV5h7SZVOjYpiL7ExofVHXDEZac1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c9XQ4f0s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.62
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7CF606A31C;
	Fri, 27 Nov 2026 07:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c9XQ4f0s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJVtILVG+2ITDGzjQXOjDpu2bTo7twa3KSkIusK7v5p4y6UXk78GtQ4Ja4QlL+SYzJsIC51ha4Saz2Hje3tpGcj8sGof+lGtAyhOc/4n+A06ZbrcRwXAPyuJF+cfnSjVkJBnyHRehvdBhKKxzdOwI8mcLCWFcFZhCbQ2qDi1f8T61GkICmQ7ibHEpxPTPeSgLSlMqA2RnBjyyqypkSWIdNXzJm+f3ghFWkuGgzuO/iPprrnf7ByajFuVFc3AHEnNwahW+PshcDhdqPDj8coUtVoKytqSHU5iMRjmk+LopgvFJcMvEaheRmax3gxhH6NgaqYX6kpVuzNBpEjUYb5D/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2zA7MPyJBXpiDbllv10etlFZ5HW0Z9egckvSIAQLZk=;
 b=dL/tWxaSy1ioAL8B2Q52Y5poanBRBQndQsGS00kaRS4WWM4LMPdFZFuUTi1rz554bHH35sBU0UG9bK3k3rs0y0Q3bEl1j7Iqgzlkw/N+mWBHlAGFeYs9JspGBDXiYGYyOnDdj0ldlPMShK4kcJ+8vACIT9fwELtSOY79gbAy0wOn5cgZjzR/9T0aAZ1gmYygAdTistmkN3S7KPhg3vJ0r+3PY0JQ69UaL5BhKK62cvlJx88KtEYuhVniXzfYdYRt9FwvejxHJ0AoogY0IfXIoeVfgCgtOvZ9oXlnphUQ2Zri2n05fZK9iuMqNoQrZ6/tdBSU6e3z2DMfHIBOxUr7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2zA7MPyJBXpiDbllv10etlFZ5HW0Z9egckvSIAQLZk=;
 b=c9XQ4f0sH+fQBeuyw+F4+nmWdmdQJHP0xR0NRayDzQMKFpgR/zciVQGBLSU4X+5uPTnTMxb212VRFIoV5BMzOM351O0y1tPJcfJkBbsgarBkiYPQYjMP5uLbF/YCZ3wFW4MquG0tGaD8ADOGwPJ7ZmsItgZ8r+icb+Dd5zj1p20=
Received: from SJ2PR12MB8136.namprd12.prod.outlook.com (2603:10b6:a03:4f8::6)
 by LV8PR12MB9689.namprd12.prod.outlook.com (2603:10b6:408:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 07:01:24 +0000
Received: from SJ2PR12MB8136.namprd12.prod.outlook.com
 ([fe80::e5a6:6049:4f4c:afe2]) by SJ2PR12MB8136.namprd12.prod.outlook.com
 ([fe80::e5a6:6049:4f4c:afe2%6]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 07:01:24 +0000
From: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "bp@alien8.de" <bp@alien8.de>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "Simek, Michal" <michal.simek@amd.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "rric@kernel.org" <rric@kernel.org>, "git (AMD-Xilinx)"
	<git@amd.com>
Subject: RE: [PATCH v5 1/3] dt-bindings: edac: Add Xilinx XilSEM
Thread-Topic: [PATCH v5 1/3] dt-bindings: edac: Add Xilinx XilSEM
Thread-Index: AQHdeiYDQBhcbNdGbUStaMChRVFhIrc6QNGAgAdCq3A=
Date: Fri, 27 Nov 2026 07:01:24 +0000
Message-ID:
 <SJ2PR12MB81365438AEB5464EF8D2B9E4CE412@SJ2PR12MB8136.namprd12.prod.outlook.com>
References: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
 <1795313124-2138932-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261122-devout-ant-of-tact-31896b@quoll>
In-Reply-To: <20261122-devout-ant-of-tact-31896b@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-27T06:52:38.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB8136:EE_|LV8PR12MB9689:EE_
x-ms-office365-filtering-correlation-id: 36514fa3-78a2-4f60-155f-08df4c543ff4
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|38070700021|10067099003|56012099006|11063799006|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|4143699003|6133799003;
x-microsoft-antispam-message-info:
 AwQSoLYkUxzwQWkce2hU9mYDq9alcZvxO7FS/RlPOaxSJtLWQuh7XUBd33wxGeeaN/lWQqlvgcvx0+UxIu7V430XYj546LzJ/+2ZW+vt2xm4FhNe8TO2fRgAGNZmX1Qe7M4btvMZS0YYD8Otq3Nqw7JWoxXFilAR7nZsuaJECblLyg7SyZhiGwz4zYK9kSGZm82nzRTMLhO7/6eAzaQMH6wFP/WkjsHnHuxyNigPV2ZSol/UR2KQrz7T9WSXefCC/Utn+qSJvBj7VFtSnKb6zkaDni2EF4WYa/gqrsXeSNYFtRXSEyNlAeDpP9RMkP29QW6TqTASlZChgaqw8+LTSTA+mzsVp6TvMsXKMSdTLjT4KnlxgZPBbifngE8iMM8uuseGr2m1QNqmqU+xf6L50lNXNqq08R0wTfFvP2f7P2BOQt/7DtBoKmRUX3rKFMrIaTuYk2U0WMOPO+aXdGhE6J7zeaB/qkgH2SLFgkXLde9AbpTI4RacKlh8kVltWGknE2isqkeW/Cps8I44OiMFdzeDm1Y/VdjBktx2k2SG12cuDgzCEtV5/b0bKY1oIsgH7VdATkrQdC519kwTmuZGnzNipO1nuSVFSzpxf4tjhjA+COhmncQz4RRGvWO98wz5C7GMnjcJ86ItWIfOh1zaTUVTay2X6+Jm1Lx1fLiwJIllYnz1hSouwWReKjJzHTeJgHjIG/2/RpB3feNRijriGQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8136.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjRhM281Y0R1NnlTdlc3NkFMRGJ6MW1lakxxR2hlb1dybjBVMVF4aGJBMm53?=
 =?utf-8?B?ZTRGQU1ROGo5cmJpeEFXMmMzcHU4Vm8yMEFmQ09naitwaVFiN09YVzBOQ2lu?=
 =?utf-8?B?bm51L01PZUI1QUd5bk5IZkVDOWZjS2lrOG1mZXlJcEVxdllVSE9vdlkvNGVr?=
 =?utf-8?B?bm5wU3cyYzE4VVZhN1BjR3Yxdmg4NmhpY2N4YXMzUlBCZG43dWlBclpNVTBP?=
 =?utf-8?B?VjFReUhoSjlrRE5yT3VpU3RqM3VtbFI1Z2g3bGJZUStid0Q3bk4zWHhldXJk?=
 =?utf-8?B?VVpvWnBVbjN6YjkxYmU1U1Q5dzkvR2l0Z2ZHbC9uVVdJL2hydUZHdTlteWtN?=
 =?utf-8?B?aXZuTGxhL1h5UzFROThGUk1NQlhRa0Y1RzUxMVp6aUhndVJJMmczOUZ4R2t3?=
 =?utf-8?B?bjJkRTBNMTRQc1pBM1ZRYW9ncDREQ1VGNXhmeFU3Ri9rRk9tY0FPaGowVlNP?=
 =?utf-8?B?MWQyanZnenF5bzVhdUpCS01yL1haUXAzMmZNcmpNK2gyT3hRVVFkaWFWZFBY?=
 =?utf-8?B?WmZ0UkgvR2R6TjBqMnVYeDFqd3JIUlNlcXhuQmVFNlhaK0Q0ZzVOOXpCSnNt?=
 =?utf-8?B?djdVMWg5dFFHSU5QMUQ0SlVNSWNQZ3pJQksxMDNEd05adTJMUFp5RHVVNkFi?=
 =?utf-8?B?MWJEeW1jSEovdVljMHRvblpKTVdDTDhSYW41OVFOVlNkUnIwV2EzMlRpRGpQ?=
 =?utf-8?B?SzV2NXhCWW5IVUhaODlBM05jRDNjSkxmUGpKZWY3V09vSmZ0aExsRWJ4cnFP?=
 =?utf-8?B?eW5uR0Voa0JPeHZzYTJ2aWpwTXozd3NKcnJaSnhMdWIvampXREhVd1d2enI1?=
 =?utf-8?B?NVVvdUJPRHNGb0lWU2p5ZUZUbC85SDluMDJyeUJKeVdCcGorY3dIREF4djlT?=
 =?utf-8?B?Y08vY1FCRHlJd0dvRGlkbUU4T0NpMWEra1NyYlNVcGQ1ZFI3bExpMHkwZnJy?=
 =?utf-8?B?eFVpQUVZQjRtK25Vd1JOVE0vTXVSY1BMNzkyK1d2S01jblZOUXBNYWpIU1Jp?=
 =?utf-8?B?aHh6cUNXdzRMRERWWGhMV1Z4WlFJdlU0Y1hQM2FVVTVMZ2drM3E3aWxXOFRT?=
 =?utf-8?B?TXJHQ1ltdU1yWHhoUDI5Nm9IOW1RcU81bExzczRKZ2ZHcldtaitIdkd5aXo3?=
 =?utf-8?B?L1RROXNDS2g3OWxLb1JuaG9BN2VnUjRobUFMdVpLc2t3cmJ4TmJ0WVNMeFRC?=
 =?utf-8?B?WktRMDg3NlVlbVBBZHRCblJZcVNlK0dlVThUYXgrUGUxUHZFd2ZYS3FPOGRP?=
 =?utf-8?B?ZFVUYUJVVDY0OW9wZ1N3aE1oOFlTaVdHakkvdlh2M1lFWW5iMG1FeGR4Vmhx?=
 =?utf-8?B?TXdmVUliZEFDMXZqMlpmYXZPRGw0enNqK3gvYkcweS9EbXZUQU9jck5RRkk0?=
 =?utf-8?B?RUxvYUNWcWlLSXQ4TlNPY0JSZE5iaUdZVUR2QnFtSW05U1FJYk02SlJtSmdF?=
 =?utf-8?B?SjdCNWplWXNKN3p5WlR3YmJVdEZaOHAyQ0dUS3duUHdpVHgvUUhnMHlLTWxY?=
 =?utf-8?B?TjNjZnBQMHBITEVLTW01NGRxRFM0ejNJendENHN0bjZNZlZXT3lUSnNCbE1T?=
 =?utf-8?B?eEFHT1BXZFYvVXFtd3BkUEovZDUwMG4rWWpwV0ZGNmFkNVM2NGpYSk9KNnNY?=
 =?utf-8?B?Sk9NY2x6VnQydmpLZ0tPZWppTkpmZlROZjMySzVkY2haZlYrV0xsYk52Qlhj?=
 =?utf-8?B?aittMmkzZHRubmNoeG5kOFR6V1YybERpSzlZamlBd0hSWCtEV0FTN3BCbVF4?=
 =?utf-8?B?NFlrVGFMd0tYU0pmT25Cei85S1RzMHE2ZVN2Y1RicnZFeVB5eFkyaHJHV1p5?=
 =?utf-8?B?OElHQTlDTks3ZmFyZWZ5ZjRJR0h6TnlKSDhJZ3JKbXhNZjhGQWVzSHYzdGh5?=
 =?utf-8?B?eUdwWXUxMWtTRkxKSUNEVnJCVzlGa3BLMU5tb1pQZVp4TmFHeGNzSEpBRlhB?=
 =?utf-8?B?OXczejRPY29meDBFblVlNWRSaGI1bGY3WXpoaFJOV01PZjVxTVRNVFhHcm90?=
 =?utf-8?B?VWt4ZUhTQlhyMGZ3L093Y0NYbUdiZzIzUGYrVzRab3VJOWJwbkhLRytrUzNU?=
 =?utf-8?B?MGJSK29IeWlBUjdHZlY4RThBYWdJbHp2NFZyY0p1SVhISXZ5YmxGWmhCc3ZH?=
 =?utf-8?B?OWZBeFh4cWJxS2NaL3FPMEdWL2U4OGtwRVlDeHNlVmRCWFQ3NGo5Q1gwZWxl?=
 =?utf-8?B?SDlHUTlrbWE5VnFBY0djSjVIQ0ZRWFhPc3NHakd2MkZoL3RDM3U2VlRJaTZj?=
 =?utf-8?B?NHNydXFCdlFpZCtJdXJkWmx6dldIc291WFpqbDdkOVZaK0N5U3BoQUszQVlh?=
 =?utf-8?Q?kZoSNbLp/yGJr8ekjo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36514fa3-78a2-4f60-155f-08df4c543ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 07:01:24.3483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HiCB2UA3oC5fvpET1vin1sWP3Qefh+DM56sXxa5oOff5ZlN2Z866p7iPqjCxIZU2US0aJioCzVMkiVISe0T3Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9689

QU1EIEdlbmVyYWwNCg0KSGkgS3J6eXN6dG9mLA0KDQpQbGVhc2Ugc2VlIG15IHJlc3BvbnNlIGlu
bGluZS4NCg0KUmVnYXJkcywNClJhbWEgZGV2aQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2Vu
dDogU3VuZGF5LCBOb3ZlbWJlciAyMiwgMjAyNiA5OjMwIFBNDQo+IFRvOiBWZWdnYWxhbSwgUmFt
YSBEZXZpIDxyYW1hLmRldmkudmVnZ2FsYW1AYW1kLmNvbT4NCj4gQ2M6IGJwQGFsaWVuOC5kZTsg
dG9ueS5sdWNrQGludGVsLmNvbTsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFtZC5j
b20+OyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGVkYWNAdmdl
ci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgamFtZXMubW9yc2VAYXJt
LmNvbTsNCj4gbWNoZWhhYkBrZXJuZWwub3JnOyBycmljQGtlcm5lbC5vcmc7IGdpdCAoQU1ELVhp
bGlueCkgPGdpdEBhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDEvM10gZHQtYmlu
ZGluZ3M6IGVkYWM6IEFkZCBYaWxpbnggWGlsU0VNDQo+DQo+IENhdXRpb246IFRoaXMgbWVzc2Fn
ZSBvcmlnaW5hdGVkIGZyb20gYW4gRXh0ZXJuYWwgU291cmNlLiBVc2UgcHJvcGVyIGNhdXRpb24N
Cj4gd2hlbiBvcGVuaW5nIGF0dGFjaG1lbnRzLCBjbGlja2luZyBsaW5rcywgb3IgcmVzcG9uZGlu
Zy4NCj4NCj4NCj4gT24gU3VuLCBOb3YgMjIsIDIwMjYgYXQgMDc6MzU6MjJBTSArMDUzMCwgUmFt
YSBkZXZpIFZlZ2dhbGFtIHdyb3RlOg0KPiA+IEFkZCBhIGRldmljZXRyZWUgYmluZGluZyBmb3Ig
dGhlIFhpbGlueCBTb2Z0IEVycm9yIE1pdGlnYXRpb24gKFhpbFNFTSkNCj4gPiBibG9jayBvbiBW
ZXJzYWwgYW5kIFZlcnNhbCBORVQgZGV2aWNlcy4NCj4gPg0KPiA+IFhpbFNFTSBpcyBwYXJ0IG9m
IHRoZSBQbGF0Zm9ybSBMb2FkZXIgYW5kIE1hbmFnZXIgKFBMTSkgdGhhdCBydW5zIG9uDQo+ID4g
dGhlIFBsYXRmb3JtIE1hbmFnZW1lbnQgQ29udHJvbGxlciAoUE1DKS4gSXQgZGV0ZWN0cywgYW5k
IG9wdGlvbmFsbHkNCj4gPiBjb3JyZWN0cywgc29mdCBlcnJvcnMgaW4gdGhlIENvbmZpZ3VyYXRp
b24gUkFNIChDUkFNKSBhbmQgdGhlIE5vQw0KPiA+IHByb2dyYW1taW5nIGludGVyZmFjZSAoTlBJ
KSByZWdpc3RlcnMuIEVycm9ycyBhcmUgcmVwb3J0ZWQgdG8gTGludXgNCj4gPiB0aHJvdWdoIHRo
ZSBmaXJtd2FyZSdzIGV2ZW50IG5vdGlmaWNhdGlvbiBpbnRlcmZhY2UsIHNvIHRoZSBub2RlIG5l
ZWRzDQo+ID4gbm8gaW50ZXJydXB0IHByb3BlcnR5LiBUaGUgb25seSByZXNvdXJjZSBpcyB0aGUg
cmVnaXN0ZXIgcmVnaW9uIHVzZWQNCj4gPiB0byByZWFkIHRoZSBDUkFNIGFuZCBOUEkgc2NhbiBz
dGF0dXMuDQo+ID4NCj4gPiBPbmx5IG1vbm9saXRoaWMgKHNpbmdsZS1TTFIpIGRldmljZXMgYXJl
IHN1cHBvcnRlZDsgbXVsdGktU0xSIGRldmljZXMNCj4gPiBhcmUgbm90IGNvdmVyZWQgYnkgdGhp
cyBiaW5kaW5nLg0KPiA+DQo+ID4gVXNlIGEgc2luZ2xlIGNvbXBhdGlibGUsIHhsbngseGlsc2Vt
LCBiZWNhdXNlIFhpbFNFTSBpcyBjb21tb24gdG8NCj4gPiBWZXJzYWwgYW5kIFZlcnNhbCBORVQg
ZGV2aWNlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJhbWEgZGV2aSBWZWdnYWxhbSA8cmFt
YS5kZXZpLnZlZ2dhbGFtQGFtZC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2NToNCj4g
PiAtIE1vdmVkIHRoZSBYaWxTRU0gYmluZGluZyBvdXQgb2YgdGhlIFZlcnNhbCBERFJNQyBFREFD
IHlhbWwgaW50byBhDQo+ID4gICBzZXBhcmF0ZSB4aWxzZW0geWFtbC4NCj4NCj4gV2h5IGRpZmZl
cmVudCBkaXJlY3Rvcnk/IFNvIG5vdCBhIG1lbW9yeSBjb250cm9sbGVyPw0KW1JhbWFdOg0KWGls
U0VNIGlzIG5vdCBhIG1lbW9yeSBjb250cm9sbGVyLiBJdCBpcyBwYXJ0IG9mIHRoZSBQTE0gZmly
bXdhcmUgYW5kDQptb25pdG9ycyBzb2Z0IGVycm9ycyBpbiB0aGUgY29uZmlndXJhdGlvbiBtZW1v
cnkgKENSQU0pIGFuZCB0aGUgTlBJDQpyZWdpc3RlcnMuIFRoZSBkcml2ZXIgcmVnaXN0ZXJzIGFu
IEVEQUMgZGV2aWNlLCBub3QgYSBtZW1vcnkgY29udHJvbGxlciwNCnNvLCB0aGUgYmluZGluZyBi
ZWxvbmdzIHVuZGVyIGVkYWMvLg0KSW4gdjQgaXQgd2FzIHVuZGVyIG1lbW9yeS1jb250cm9sbGVy
cy8gb25seSBiZWNhdXNlIGl0IHNoYXJlZCB0aGUgRERSDQptZW1vcnkgY29udHJvbGxlciBiaW5k
aW5nLiBJbiB2NSBJIHNwbGl0IGl0IGludG8gaXRzIG93biBiaW5kaW5nLg0KPg0KPg0KPiA+IC0g
UmVuYW1lZCB0aGUgY29tcGF0aWJsZSB0byB4bG54LHhpbHNlbSwgc2hhcmVkIGJ5IFZlcnNhbCBh
bmQgVmVyc2FsDQo+ID4gICBORVQuDQo+DQo+IE9kZCwgeW91IG5lZWQgdG8gZXhwbGFpbiB0aGUg
cmVhc29ucyBmb3IgZGV2aWF0aW5nIGZyb20gdGhlIHJ1bGVzLg0KW1JhbWFdOiBUaGUgbm9kZSBk
ZXNjcmliZXMgdGhlIFhpbFNFTSByZWdpb24gaW4gdGhlIFBMTQ0KcnVuLXRpbWUgY29uZmlndXJh
dGlvbiBhcmVhLCB3aGljaCBoYXMgdGhlIHNhbWUgcmVnaXN0ZXIgbGF5b3V0IG9uDQpWZXJzYWwg
YW5kIFZlcnNhbCBORVQuIFRoZSBvbmx5IGRpZmZlcmVuY2UsIHRoZSBmaXJtd2FyZSBldmVudCBJ
RHMsIGlzDQpzZWxlY3RlZCBieSB0aGUgZHJpdmVyIGF0IHJ1biB0aW1lLCBub3QgZnJvbSB0aGUg
ZGV2aWNldHJlZS4NClNvLCBJIHVzZWQgb25lIGNvbXBhdGlibGUuIElmIHlvdSBwcmVmZXIgU29D
LXNwZWNpZmljIGNvbXBhdGlibGVzLCBJIGNhbiB1c2UNCnhsbngsdmVyc2FsLXhpbHNlbSBhbmQg
eGxueCx2ZXJzYWwtbmV0LXhpbHNlbS4gUGxlYXNlIHN1Z2dlc3QuDQpJIHdpbGwgYWRkIHRoZXNl
IGluIHRoZSBuZXh0IHZlcnNpb24uDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoN
Cg==
