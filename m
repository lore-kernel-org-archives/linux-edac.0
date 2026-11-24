Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795486213;
	b=Ubr4tcWajlxb41agRs4vVJ7JhO46PxCfs99PCua31GlMoQveCj9E8JXhse0rqriIHX6u
	 UlN1qsx9uoJksEUL66lDczKaYpw9W0X55BSeb7hIe0y3GIWpk2I13FwRDJXIwzvfMBQVB
	 DdrOuI0mkCZtUjLCN4+aO8H64q+1UIZkE9klN7CWd6xxhMop+1Bv1UCeHkHQFByeUNlAU
	 3BoALGCJKKZoRMQSReUGXtaaJz/bK2/+ROwe3BPdBq5nZ86CqKUSkpB2pXuONAO5dZbjf
	 h7/HS3C7qzifDy9OBtKvBEhrynBJq9cqsP6pwA3UQnrX8MM8gywk/X3pW/Qh+Yglkxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486213;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=8Z5OW6eJxbgsOizWCu6L42mhygwZjx8dxeA9GAbq+/8=;
	b=CH7zAKGxAAWLRvoMy6yhlciFVA2YoR8dyRfHAFFODvUVuVQ18qbIx5Q+bKjWUlnKHx+O
	 2byqolmsz+zVmBpejd3sPZr3LajkbCX59+OE7MJQN8SNUzpdohXBL2j6fzHulvhkVKFsr
	 jG59wHgOrpTw0bC+cwPlSnue7lcNArNFysgVnq6o0u52pUw6MjvGZvolRnAielKi4pI8K
	 IaNwD+7FtZ7RuguthfSsshC+7foVARQr7F4HuVEMD/3Uuvrc1b1sr56MtPlb5MezUHjq8
	 E0YVsyhCT3khaROdHHkBssszXNlL1K3cZI4oedK5jyN8t8RVEYn4c0puGlQoBQLIWhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oJsZiKqh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.31
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011031.outbound.protection.outlook.com [40.107.208.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40A606A31E;
	Tue, 24 Nov 2026 02:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D40A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oJsZiKqh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJlWC4SUsM0cprOtL+g6mij+QYtySkj/SnBiuzetBr0+L33vpi9UEakY1/zQNY/Tb8ojqFOqZUJtcAB+10XgHKqwVvokjpdqixcz4gDhGTUb0l0/UYY3Qdj2aLLMIzaiwOQvXsHIFhLZWANbODzAfOAIlUg65z97NfQrsWcV9PpE4vkx4ASLsRJ7WENwdlI3noFI9v0rL5RauUNcFUCrVYW/1RMAMo/CNXiMzbnHGb34Tu9WNDpqLJwBrqXjQAa2BR0L9059MRPllT5lMlLxxESfwhLweJjnuceJPUJvlpJ+gWntVDTR/Z9cJhNWkkT2kpHurDevCqXXklzSLJNsjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Z5OW6eJxbgsOizWCu6L42mhygwZjx8dxeA9GAbq+/8=;
 b=RU8YsLRIk+IQJ5gxp+eNEnKs0IC3xbSE0W3Q4g/27TmXUaQQn68hohQOF3cacu8aNyL2pPBEhi4VXJ1tgYoZPb60Uj+9DVqKsnHFVON9XHjCbjQQ1xw98eSi9r+Hh8b/lwPGQZP5wwDL3WAn4Tmius5GOZILsv5UOQ4nsmFHovG7CyYVzz9xsxa4OvWAjxVNsAGbxYnSzN74YjWqvEsV0mWFkccIcRIAzZljEd0jW1FpX4lE7EGFx7/n0Clw/TyLpCASppe0/BcstwLTDp6c5ytcvkDjHL3M9dil3S2Z1xSDSdv8fFyi2Ah0fir85ohDfsI58Sc8oMmGWzUEu5YL3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Z5OW6eJxbgsOizWCu6L42mhygwZjx8dxeA9GAbq+/8=;
 b=oJsZiKqhUx9EOQa+CbC4z0IO8qVebaONJ4Cx8Q4Y6ccwHHd/8by5fYxH28HswRgOp861eonNMwIiCJM/6fkDQ6PE8f5L6fJr6UTXlcOChVoWFgWuFO/lKy6X1AnPhQ35hWMczvvkDYxQEYZ2S4QDAB8AzM2rPGUVPQakAaUF5n4Q3M6vNgH93fAlVnJyqJ3XiFuImoPMiROAlVqk+zklsaLmufbUV8QlIVbyuGOlhvza2KrREBdqBxkcf1OCEQPh6SE5rsn4snp5JtoLpRcKT1PcBxz0Hdz9LyF6LMO300S9V1vBSBKnDLaHMiAb9RZ4UUCYfMkGGcOmc0tCl1Ouwg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 02:10:08 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 02:10:08 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: RE: [PATCH v2 3/3] x86/mce: Increase MAX_NR_BANKS to 255
Thread-Topic: [PATCH v2 3/3] x86/mce: Increase MAX_NR_BANKS to 255
Thread-Index: AQHde6JWIp6dqeo04ESapy+XDyYHZrc8eOcQ
Date: Tue, 24 Nov 2026 02:10:08 +0000
Message-ID:
 <CY8PR12MB72909343EE7AA50BB36ED3CFD1442@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261123232701.1923094-1-yazen.ghannam@amd.com>
 <20261123232701.1923094-4-yazen.ghannam@amd.com>
In-Reply-To: <20261123232701.1923094-4-yazen.ghannam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|IA0PR12MB7651:EE_
x-ms-office365-filtering-correlation-id: d641283e-c94d-44a9-3531-08df49d01035
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|10067099003|261021121427099003|261026121527099003|4143699003|11063799006|56012099006|261021123027099003|261022115727099003|261022105027099003|261022075727099003|261028144727099003|261102123227099003|261026140227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 dvgcsrk80QQJjl1ADo60UveexQtlh440Rwlbhh/3tyfgP74QpZJZ03wOjT1r9E2bSRWTjDNuJF9yAO/br+W5j7B1oF8uuiPuW+Rg0fCMwpYoPVjsemBVg6glwzOZlkpd81iciKI/uiqYwyc9M7MU1rL1nnqpE3Sqo4nlg+xvhX7ot4Gggr8xJNdXI6xqZ+gSMvcAR3SKPWDrkCkfiOQHXcK2bxYJxyKg7BUtYHoHiYjoa9sh1oq633kydnlX7EQDYkGxcOYRybQtU4RjHjcdWMxF4lvVvKml6Ti6iv4bVjuUUqo5ahcOGn1swdCPkOwxCgjaCtThVJ1+N1O8EVBlvATl6uCuL39oSLSm549gCersi3bX6CmcCavOilGWQ/WWASMZkLbwGu4YgCSJzoQj9vBQmn8L8dOsy/7BTzbobpGa6nQlrglclumZi3uCbJULRffbTJVA19dt1ZxRh+VobVk1n35DVpv426C1ldMqA/yXfVxMxYg+vhAsjXsYgbXUOHjrHOiRSEDo8uTQ5efwc8vlwRqgjq3VxdbSdeRaxqxRyQ53r2HNALDvcD4TLoj449mOG/k/nkrAVfISVC7yviHaDVUBXwgp8py52RaQ6iw+FMQLsqjvLkZOw+olv/Epcint/+/jz4MH4fhpxde0KuIsQnKv9Vy0iaju6mc1iiPbAdU0mhaKYR7LSyQ5Xg5QPdBTtIKdBytK/HQFc4EQVMTDUK4Nl1vjFlcGKzGRDnw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(10067099003)(261021121427099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261022115727099003)(261022105027099003)(261022075727099003)(261028144727099003)(261102123227099003)(261026140227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WF/vpUzyhkMalqCPpN5RoqIoyi51RO6kWGaOazHQwPSI/ujrmFfLwCk/nMSU?=
 =?us-ascii?Q?KOePOeJOFwp3eJWw8tXsaawW1eEqqJP5tnN/aAieBJGIEGN3PDuW5Bm6yxSu?=
 =?us-ascii?Q?K9EMYAwDS59+ARO4r+gzpVqziUEvOhZN535Iq6cnpIn//OKodZ4+J2BtRZRT?=
 =?us-ascii?Q?pJYWkCQC5VHen6FtO02rvSbge/TQ8QuvgG5jCfgolVWMSS6QeG4ETWQQFdom?=
 =?us-ascii?Q?Rr4LSZrKkeUr/l/GN268iIq3IbRXAfIywZ8MIeo36TQ8Ao7o9AukHf/G6EBu?=
 =?us-ascii?Q?GrfTGMagkforOcVTgJqMxpvVy5oABDYM9Vwv+b7vv1AeGo0/MhPQpKJudFr1?=
 =?us-ascii?Q?aLzwfD/f2L1dw6dx1deqiuLrUiGQx54cMHddi6Kvkyfqy5uGRfDpo+tqSgiT?=
 =?us-ascii?Q?omNKRKVbRqoKVKOHeez+bjvyNWI3UW7e6wrTWut8j/294ffh5gxgtUZzeZ2N?=
 =?us-ascii?Q?OoOOpzTX+SepXa/AGMof0RehfPvU4asI9Zr6jw3IwSIv6CwFYMWuqovUKRJf?=
 =?us-ascii?Q?2utDM5jEP3Ppv2P0oBtGj54F7KF0/ue0S2KOsStmieWxMFoMqihiSU9YOMjX?=
 =?us-ascii?Q?dzcImxaAVKTJObRXAyzzidLVIYT0zOAnX6pHZppr+qhH4LRJhjjs37NfbUop?=
 =?us-ascii?Q?higSieDJJsl8MuWDN8j2uqaOYAr/Sj9Ht+6vw8lLOwNBi7CCw0I9cqdTQuNr?=
 =?us-ascii?Q?PJiQq7ztOrWLglZ4VEA6ck88rOE6lI4GgdSDPHVPhZAcdWaWAKClcJqcqaDP?=
 =?us-ascii?Q?WeacuOILsXl37qacYnKsC5mY6YlFX1rGZg0orZrAOxYK6HucAtNakI3rVw3N?=
 =?us-ascii?Q?YO/X+eicqLLiN98vXygwA3D1sNLIdAWcAwt8nC3lapuqaPKmIFwC3k7htEsX?=
 =?us-ascii?Q?IKn8CJ92jrcCIdpH7R3yvIUcq/jDijJn+67JG866ZNGH+qhxM/J0MjJmwtfm?=
 =?us-ascii?Q?SXFb1iqYfRW0ZWbVqd12P5zytNhXv5SZkijpIGo/sQ3lfGnK/UehQsh9+7DT?=
 =?us-ascii?Q?wh93X1xyBZ85WXDmPUTStN8yYYT1PltaB49Y5OZFbi8NAnf859i4Iy/mAXjU?=
 =?us-ascii?Q?3kR8EI7vZVs+6soiQ+yeotT9ixawYCVeibVGNXmJhcf5B5f/o69pc5tOyUOT?=
 =?us-ascii?Q?oMK5FBNiASUVQBGm4iiMopeWhpyW0yC1ZB/ejIC260fbuS8ioN6RjH5T4lb0?=
 =?us-ascii?Q?d03UITvBip7m+bxJioFpDlH8K+jFIa8x9pq+TvQyYtUsQcD3ZXF3Wnbd5qbk?=
 =?us-ascii?Q?5J/7ZPywi+K4hG8s699txchjOg2FexrHUyYQd9cL53ffZ5iNzhUlX4OBoiQi?=
 =?us-ascii?Q?qOKqfs61wyFZA/LDF0/FZahQ5b94jiuiaQrIvK6mbdn7p3NphWkrVcAAs6qt?=
 =?us-ascii?Q?XNV3wT9e2brs9XkXphGfYrhAOw/YgT+Udpcu4hpTjb7hRoi6hkC9ec3qPCkc?=
 =?us-ascii?Q?3KX/pO57rI+7eYXXV36Uv2gQ3oKbdz7rzfNqi2ATWd3WP/NP6v8GhJ5dXKNq?=
 =?us-ascii?Q?jmyu09rGBKF+fLAqVMMixHH4nnISFi9/88OO2TI6RHJ9moL/BjlcqOC97vM/?=
 =?us-ascii?Q?GPsQkSrcCBXDgxD0LuB9aNEkID2LAC+MVneoP82yxc4gYjZYO3nvs8wkq53/?=
 =?us-ascii?Q?FVRCMo5rljYmAs22EnCWfTZsQUeKUQX07DSc5lRKZq4YCArHbQz0LeDOyVuI?=
 =?us-ascii?Q?6qH55L8Al2wMjb+/C4DyG52H+OH1ioh+iqwBsV6AKkWaxZmZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d641283e-c94d-44a9-3531-08df49d01035
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:10:08.3289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWaQSupX19WWqRSF4nSiCO5mPdP7HRaCuxSIvNl7E9D2DSBqTAf76wXwZ0UENVXBdvlBRwXWacwUhuQSHJoapg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651

> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Sent: Tuesday, November 24, 2026 7:27 AM
> To: linux-edac@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; tony.luck@intel.com; x86@kernel.org; Ya=
zen
> Ghannam <yazen.ghannam@amd.com>
> Subject: [PATCH v2 3/3] x86/mce: Increase MAX_NR_BANKS to 255
>=20
>=20
> Machine Check Architecture (MCA) allows up to 255 MCA banks per CPU threa=
d.
> This is based on the size of the "Count" field of the MCG_CAP registers. =
The "Count"
> field is 8 bits and holds the number of MCA banks per CPU thread. So the =
value
> range is 0-255.
>=20
> Change the MAX_NR_BANKS value to match the architectural definition.
>=20
> Drop the clamps in __mcheck_cpu_cap_init() and cmci_supported().
> MCG_CAP[Count] can no longer exceed MAX_NR_BANKS, so neither is reachable=
.
>=20
> cmci_supported() now takes the bank count from mce_num_banks instead of
> reading MCG_CAP[Count] again. mcheck_cpu_init() sets it before CMCI is se=
t up, so
> the two agree. A CPU that skipped MCA setup now reports no banks instead =
of the
> hardware count.
>=20
> MAX_NR_BANKS sizes a number of arrays and bitmaps. Growing it by 191 bank=
s
> costs the following, measured with size -A on the MCA objects built from =
x86_64
> defconfig.
>=20
> Global bitmaps:
> - core.c / mce_banks_ce_disabled
> - Total: 191 new bits =3D 24 new bytes
>=20
> Per-CPU bitmaps:
> - core.c / mce_poll_banks
> - intel.c / mce_banks_owned
> - amd.c / bank_map
> - amd.c / mce_amd_data: thr_intr_banks and dfr_intr_banks
> - Total: 191 new bits * 5 bitmaps =3D 120 new bytes
>=20
> Global structs:
> - core.c / struct mce_bank_dev mce_bank_devs[]: 56 bytes per bank
> - intel.c / u16 cmci_threshold[]: 2 bytes per bank
> - Total: 191 new banks * 58 bytes =3D 11078 new bytes
>=20
> Per-CPU structs:
> - core.c / struct mce_bank mce_banks_array[]: 16 bytes per bank
> - amd.c / struct smca_bank smca_banks[]: 24 bytes per bank
> - threshold.c / struct mca_storm_desc storm_desc: 24 bytes per bank
> - Total: 191 new banks * 64 bytes =3D 12224 new bytes
>=20
> Section totals, which include alignment padding:
>=20
> Total global size increase: 11152 bytes of .bss Total per-CPU size increa=
se: 12368
> bytes
>=20
> The per-CPU total is replicated for every possible CPU. In the linked
> image .data..percpu grows by 12352 bytes. The first per-CPU chunk is page=
 aligned,
> so each CPU retains three more pages, 229376 bytes up from 217088. That i=
s 5.7%
> more per-CPU memory, or 6 MiB on a 512 thread system.
>=20
> On the stack, the two bank bitmaps grow the frame of do_machine_check() b=
y 48
> bytes, from 232 to 280 bytes, on the 8 KiB #MC exception stack.
>=20
> One module outside defconfig also grows. Measured with size -A on
> intel-bff.o:
>=20
> Module read-only tables:
> - edac/intel-bff.c / enum bff_bank_type dmr_mcbanks[]: 4 bytes per bank
> - Total: 191 new banks * 4 bytes =3D 764 new bytes of .rodata
>=20
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> ---
>  arch/x86/include/asm/mce.h      | 2 +-
>  arch/x86/kernel/cpu/mce/core.c  | 6 ------  arch/x86/kernel/cpu/mce/inte=
l.c | 2 +-
>  3 files changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/x86/include/asm/mce.h b/arch/x86/include/asm/mce.h inde=
x
> 9995176d6879..e5fa0f58b305 100644
> --- a/arch/x86/include/asm/mce.h
> +++ b/arch/x86/include/asm/mce.h
> @@ -273,7 +273,7 @@ void mce_log(struct mce_hw_err *err);
> DECLARE_PER_CPU(struct device *, mce_device);
>=20
>  /* Maximum number of MCA banks per CPU. */ -#define MAX_NR_BANKS 64
> +#define MAX_NR_BANKS 255
>=20

Out of curiosity , are there any existing systems with more than 64 MCA ban=
ks per CPU thread?



