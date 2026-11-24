Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795486857;
	b=Dx/eNDPsTKzhttXWLYWPQNUIhLl1rav6x6p5NsKA5WN1MpRKmeruSOCIWh8oxuvCyaxX
	 51JlS8wXSzZiUyAViDkMfu5noMMJxVWe5AFdqfptI42dZvk7YhvEMfNadRGmQpX5zqcCO
	 ZyyoFdmQBvOkkoN1BShX27JgFkD1LDJWLwX17mAkm5l95yAB7dcWkB3IPvMOcVt/3IjMk
	 nTa2zyJkZP3XvknKcagT8Bho1oPU2GSs3TXA2GzjLXHrRC7QCJ6e2bMc8QPdczQnyKd2f
	 rm0QvyZhYwNJnTWPBvEY0GrulJkcdQLzKRZBxBdWf95NbLRz1otoegtWVJIttDKRowg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486857;
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
	bh=KOw1eCdGCe1f55JtPWR86TN/Rh+lhED4T1ENJjLEwI0=;
	b=rid/2VedH7GrWcHV3OthWCS1ziDH/FrKqzvu9NFTKei4JgV3JkR6x+oi1BbrnGWdm1gp
	 Xqv8cjCSqDwGVinHDvnKi61/G+RnK6eY0jK2oHhTD4Xn7+bFrNixVVdf+XRo2yh+BX1PC
	 twIhz2F3CglyjuYHluBSfnZR1XHi8TLYaR3TsACefsniFZqw6kiQ3+Nw4yBJxTmbcfsuv
	 rO5N0r5M1aGwWN7jUC1tEinkwaH8GH1yiR7oJBKQg9OVV4eiHgY1xG1g761Ez5iuwwcwF
	 YhCY7bxVCB8BUVVdqB1HxzHHjqwFCAIyF1+wROdl7oY0uEXuZ7ESjLX2KNsKsnP+0kQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=afwJ7v4k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.29
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC66606A31E;
	Tue, 24 Nov 2026 02:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBC66606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=afwJ7v4k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slLUwXBEIQL1Hf4gv7F0CYc2KFtWc7K2mDTZRj3uiP4o7ML4tGG652W38RbfTEBInvNu7wA7+6YfgQKtG3qUlqb3Eal5ZJMT/OJoBiuabO5veA71Gr9+1Y41wyUuqk/mBikyVKUJPVv3UzuUn/JZiDr7DAtIQVt34X0AFh0GKXJE6c74TLcTxXTAYGXwsknjby5/RJR/QJwMBWbg2FbOy1uk66+kE2S7sWhPAlZmYVMpWnStzWcKJJsDsi0LPzEVMZdWNN5ec803QAXqlTctC5vde8pgEJKtrHldCHT5K8IvHHb3i6ZN1gd87EyLU0tFuTXVLRC0APNHLC/9N42pbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOw1eCdGCe1f55JtPWR86TN/Rh+lhED4T1ENJjLEwI0=;
 b=PGnhRJdNw2yoYeLfOxAq6hL0F8ncrDDwt8pehoWkEB/RC2fZpijxtlQpf+3O5coRIdEWg3b11XwDnwts+G2jems/LNSjScWYa3hwZsij356jU8ixJeKRuzaMpOjQLvc/dvhqoJ8lYg3erMvMC6vIrbYcJIUCWtMLucZNCrT+1gKODbep8dahRgFrAEzHLEBu5j2fLrWk63iPug1CXl3fFBqtkix6dfqvAFEIIZ+lQlM4B0tDLum1OomMvbi7wppg1aA0dwyrtGmcDTNqzou0fdeMBjZLSvT2Xq4dVeKbeJseQVSywM3rfhuH6DQ3mK4wJOORrLqqn4m1mGZBXPokUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOw1eCdGCe1f55JtPWR86TN/Rh+lhED4T1ENJjLEwI0=;
 b=afwJ7v4kSpYZFAXH0leVD5oF0IZlJNJwuPehHPM3p5sgScpDLhybyeSO2Htxyn1m6stX35HmoaSwIqX7xmayVm8v8auG1XNIKyQWQDc/LtAJaSq/+eK+PLoafia+IVGyo6d1/+o1FKwwANl/v8G0/plpevkv8bIyoLh9uuHNG3vJigiDH5fyxOuv0PAUlHabYeD2n6CIavyvpvs0lRpxWGF1h7E9Y4biapXcKmJczNXSxgNc6PjV6fOz4e1Bx+VKyF7Cm1wRarMVL/IUbcflBxe8a0EPJWP3xTydXZnCRjc6HbADh1tQkVodZeUmXE1h3zEFw71HzSgzaRxrO5+3PA==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 02:20:50 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 02:20:50 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: RE: [PATCH v2 2/3] x86/mce/amd: Convert bank_map to a bitmap
Thread-Topic: [PATCH v2 2/3] x86/mce/amd: Convert bank_map to a bitmap
Thread-Index: AQHde6IzlrW0+Iw4hEeFzZMqzc9A9Lc8fWXQ
Date: Tue, 24 Nov 2026 02:20:50 +0000
Message-ID:
 <CY8PR12MB729038CF0EBEA25EABF83484D1442@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261123232701.1923094-1-yazen.ghannam@amd.com>
 <20261123232701.1923094-3-yazen.ghannam@amd.com>
In-Reply-To: <20261123232701.1923094-3-yazen.ghannam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|IA1PR12MB7517:EE_
x-ms-office365-filtering-correlation-id: c4978e16-5913-4da9-ba97-08df49d18eaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|11063799006|261022105027099003|4143699003|56012099006|261026140227099003|261022075727099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 p+YKo4e1mxKg5PqjPhqg8+nIZjEx7Wnhbz0ZVf6XQUOWJYD6fxwun+mf8Gq5C/oTlMyxAsJvEDl0ie1qn32ykxZRXl9pp88kkrTHKYdrFyYCv4SoKwA/4z/cxWlcMOMXQE+UkQkdBExuW2ejEv/HJSm3VLcsHW/lljTVYB5p2L+fkxUUFupdXwRRNwsyBTfVxkXWxKU/20TAhpco/RnY0zNt7QXgJ7oOypWhPV/wRPOyw7ZQhvIQ6CkeMGlDqBnuAD79RDfFliJuxORCp0VS4TsWqSFzwzrLcIdAfBFvRFkH3AvHQ3KqDroEfpztB0eSCqZDNk0E9AbXTAJSxI6dbJ+PGSXyMe9Kk20A29/nfT/SIwJpy2oxu0WJQHdEKCv6PlUf8zrFzlIwbuQpbf0knE2NHQ7odRf7N9/rMnqMEH2zIgjNxmTRzIDiszj/SrJIvYqVH7eSaFyS/v8khhBgML1uahco393M12OIIoUBAtlGOZe4bD0VlxJd3zusNKy962fWL9u2H8fS8JxJkaEfjRil8PYN7o7KJQjNLIr5oZeCA7qVfqvHtjD7/6jvh20haeVEJ43k1GIX/afK1CS2Ou3/aeFyzCxA7RAAjWrHauqcU0KKCmiButbPZQtgXmqbv9fHiaeGF/WIywHkiMQQDEjGvHhUyiz12lL5Vi2WqZgV/MZHPDSBEAAuFZt3YMYTb/DrCjO2sdAAkSr+SJkoHSzPJzUzyNRlRYqkQvwOnIs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(11063799006)(261022105027099003)(4143699003)(56012099006)(261026140227099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?T0LkinGLDmwQEUqZsKTFLDHDYHyE0OS1YatV8aqztIbng2oq+56/VnA/DC3o?=
 =?us-ascii?Q?HZ0B+QH5GjvKj1cN3fnHuHbE2zcAtQ4gzRh3WbWK1mlm5fa4VrlWhGd2Wghl?=
 =?us-ascii?Q?ChoaqasUBkIcj4RvPNWx8ikhuWJG+mnKUh98OpKgPEelJGr8evdbKNWVt0j9?=
 =?us-ascii?Q?zUZyzdrc8HpprCzr68pMjWRqTRWilE+MRrf9ed8KL0Ept5PbOg0IYj4rwoSb?=
 =?us-ascii?Q?8Bh4UIC5IJPGDBAlzX1ZIp0bvGiKCeTaD+ULnMMRixGH6A9Yvv5ukOZhj/s1?=
 =?us-ascii?Q?KB1YvbS02A4bizLLPEUTNecWx2j/a102inok8MUPmLP85/UezvixK5BF01VU?=
 =?us-ascii?Q?SLUDmtiLSmAmsEfhgREblXY+OkGAR+dR/ir5JQiE7a0Uc5/fugzg1FtYBKMr?=
 =?us-ascii?Q?wPEcB3VGtVhR3pH1Cxlqqu0TmTPYM5tx4qA+dh0+B9Ker8HxwNuQh8NjcF+N?=
 =?us-ascii?Q?biwnZZi+i912XNmpf3aIKAz52TYZe1MB+dKund4QCb+zvsxlQRYq+/Ygu0Kf?=
 =?us-ascii?Q?Fd1/sSUsBKvQaZYsNo11Dehyz5j1hIHvIvTMdpATwFl+YLI9vUNIPEXVCmFt?=
 =?us-ascii?Q?Q/HDf/A/ZVMGZcb3oIhhWW2UPOugF8OJtYqf6IKuJXXe63GRz5pdx8isd9eQ?=
 =?us-ascii?Q?1NjfdbnaWDX/PEDuam86HfUfgu9F+rZIPhoT03Enrp16lvBDjL6iRA82RXLm?=
 =?us-ascii?Q?B2k+hqNuBbK9HY6x/AINb/9q/D5cJXbohgomg20xrkxUfYkvS9f/bfpPTcGw?=
 =?us-ascii?Q?QRMGqEmtNr5PHf0xnhddPalNIJ8HvE7NLVQmapQaLBLsOrrMExKbEGN+7Abt?=
 =?us-ascii?Q?D7NvQuWhGld0SDuxDv+sR5FS8an7zPzX65B6Nj9JK7Q2G4B2a7S0l0sy1Bgn?=
 =?us-ascii?Q?hDuozF3zzVoF0myWpHTDbxZR0m1cEtAnf5m5AZzyqlDt9AvVy1otN7+PZYZ0?=
 =?us-ascii?Q?x7L0gbugPyTLs5ETxiOR5lLUcl1xMaJdBw98cc8ygDHvsCH2Vw2xnrQx7FOL?=
 =?us-ascii?Q?GkTHvPC3f4rn8EzxNDa5rYKT9N6klcvLAEaY9cJjVjEVBa02IdbWHT8N8iB6?=
 =?us-ascii?Q?JCbu+sHNthujCgNvx9rAj3uRC4T1zmTMGW+h03P1vAOOVjCbPsTdSM6WYU/v?=
 =?us-ascii?Q?5RN8rnmawWO5xLHNItavZo6z64DZVODrjkBjEom0308DiQ5Y+WzSCXYRx4AZ?=
 =?us-ascii?Q?ew8pHEl01Gj3pIR/3Tx2J5t8k6Ksvvd5P43t0bJ4hWS+66rG7bfBK82YnZXp?=
 =?us-ascii?Q?FEj/2P5oYBb+xkC3b0yYLaP1he0+AOhc22EIw1MbLqdwA5412FFyLyIbfA2f?=
 =?us-ascii?Q?vOLI9Fm7v+qVKgeVHfix9DQF9mB+NHrXHW61/bSm5P22kcYG5SgW/NB1KE2+?=
 =?us-ascii?Q?X1bCnyHl1/jcvCsOwUWWdxGba6aNzQXESmo9xOhatgcDEHHCj6B8N/K49PDF?=
 =?us-ascii?Q?6S0cEJxEOcoNznBb3mPNmKXWu7bfmxSHU0trG0Kyq8THGsxB/emdDlncVpxr?=
 =?us-ascii?Q?sRLmKgeiQzilKP1D3dVFFC26BGZvTWWDIYpw5xdZIm36cEChOOsSVZqjH1r4?=
 =?us-ascii?Q?J23K2Y9xG4cXXPd4Oh+RADiznxvmCfHd9bQnPo6Fzr10zdIptQXmdA3VJrwx?=
 =?us-ascii?Q?/MxNZhdBIpkLGOivf/7FNxZEbT6RqJ+nt4neKU8+fczLqwZ4aL9uyHLvPGar?=
 =?us-ascii?Q?EpSSOuOIfXu6rL2PSFxlVvS1tpH15W7EnQWSEV+xX3PcQSY7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c4978e16-5913-4da9-ba97-08df49d18eaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:20:50.0577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7mPK5oXKNUz1QulXdG8frvA0oCFvMVXKc92RM5kZSnhFCOcUPbZCBA8NpYp1Vl+RGp8lUXOl4G8m38Mg0keKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517

> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Sent: Tuesday, November 24, 2026 7:27 AM
> To: linux-edac@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; tony.luck@intel.com; x86@kernel.org; Ya=
zen
> Ghannam <yazen.ghannam@amd.com>
> Subject: [PATCH v2 2/3] x86/mce/amd: Convert bank_map to a bitmap
>=20
>=20
> The per-CPU bank_map records which banks had their block 0 prepared durin=
g
> mce_amd_feature_init(). It is a u64, so BIT_ULL(bank) is undefined once t=
he bank
> number reaches 64. That caps the usable bank count at 64 regardless of
> MAX_NR_BANKS.
>=20
> mce_banks_t is the existing type for per-bank bitmaps. It is declared wit=
h
> MAX_NR_BANKS bits, so it follows the macro instead of fixing a width of i=
ts own.
> thr_intr_banks and dfr_intr_banks in this file already use it.
>=20
> Convert bank_map to mce_banks_t and use the bitmap helpers. This is prepa=
ration
> for raising MAX_NR_BANKS.
>=20
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>

LGTM. Thanks.

  Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
