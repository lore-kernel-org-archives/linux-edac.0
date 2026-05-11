Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010028.outbound.protection.outlook.com [52.101.193.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065971E32A2;
	Mon, 11 May 2026 03:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778470582; cv=fail; b=CBOxArIvOuP5JieYpwWBtjTd31Sx6gm1xhizW6RL1LtDZ7Kb0G3j288A58H8PxAoveeAj5RQfCxlgjhPPY0mcdxsjv3dYPLC9bRdMymSe/40fjXu9V3w2Ux/fYF7cknvKiTufkOiTNNx+j9mqT5vup8kX+V9/tImcvQsuK5o+Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778470582; c=relaxed/simple;
	bh=2lnlDKJn2CPMuIg5m6pFgFsw8EEQBkI+XMAdgX0S0ew=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e1ZNx3XN5BVIYG+RruoN7txC6PTVTGVkVcUk4UTvzyYS/ukIXxAMfR5Unon2uwm04KRwO9MoNULZZ68pdosCG5oKzxfGDpPPOOYKlsRsvsCFy6LJs8S1MA0snhkNLTrw5LIT0CCcRl6YHmWVln5TvYNaPIWOs3+Auq0BGdDQ9Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gZhGzDVM; arc=fail smtp.client-ip=52.101.193.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gZhGzDVM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGIw+xc1CthUuIzK2CKeQXKJkhwSBQqcFtcoropZZgXhJ/7tnrzCYHLcj5cKJiU6kMMvST09QKSi8L6z5oWCdFIof5Laj4Joh/DEv7o1lZLGWwspqCKqp8oa6wP6WqTpKznqgiRezk6rgMLipUF5qGfgAT5Vmm1quzG2gwGTIiiuLAM82zv/V9YV4Iam4Lqnc9Iz6ve+aJCUyuclo1YSv2v1LmVyVCN72HZ2LhKjh/tOsRjs/r88vXwI6hp17fHOw68owIUBSuuQqk4KYnXoV9k1U7AA3UecEs4L+Z+ySr70aEK8GlTg1BLevMYqAbA0++b5/mlD2/S28BNnudhG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lnlDKJn2CPMuIg5m6pFgFsw8EEQBkI+XMAdgX0S0ew=;
 b=SdTUuNniXqkGRQoj86oMjtpQExkNURmeUES81zGSFbdhQwsOzbPbmAVzODSt+CwEGKVHfrChLGfgUeTsu3HnFZxyeeAFAS4BLintJwZyJvnirfkELzy24dVQilHKNenPm/xH7BzGlRtKVU8bsT3GYKQVz3GlxvTABEZ+1nXZLvaz4J+/HDe8RF6a7HsXFd7Q2f2uG15d0EhuInVgdKyjvOdNKrdq0Djq+B8B9amQAyp74IIvjrL1mBYU91VOu8h9qaRZzsyjbW5H7ofZtHDT2WonMmjnzOeun0dKiPwy150Y2hCdkADLjmImj4CFKGWpRngFd9izq9hZdDmdO44K4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lnlDKJn2CPMuIg5m6pFgFsw8EEQBkI+XMAdgX0S0ew=;
 b=gZhGzDVMhAEVqgvsZKvI/GGTWQ4srqWTHxLCIgKYrR3jOBD55p0mhTpz1Scgv7gtkeTs7s7xfkyvejQbic/dLaBI5stSG7s1wLVR6+dsRZnNkkzX4AYbiigaFH4tau1fp6ptCGnYVelWL6tI+9KlGv5L6ju1Jp2RTg9Qzt2A2ZiYDZ84OL+Vq7oeuFsbl0lIZTT13pY2QwgP29itPtLjO3YVd4FWTJrDILoZnyKv7d2VqPve/za20u1BFlUlC14DqLfu38xNfWWf9XunOq7spFqc3R7Tup0UXNIlAYbFemzIzwZvECy+t6wviZcZl+1TKTP61/iJMCA7+YkKzSIyLA==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BN9PR03MB5980.namprd03.prod.outlook.com (2603:10b6:408:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 11 May
 2026 03:36:18 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 03:36:18 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Thread-Topic: [PATCH] drivers: altera_edac: Fix OCRAM ECC init for warm reset
Thread-Index: AQHc38FyQHp+xrS7x0CAlHo4uiADHLYHuJMAgAB2kIA=
Date: Mon, 11 May 2026 03:36:18 +0000
Message-ID: <3f3302fc-3708-4879-b594-0d001a128bac@altera.com>
References:
 <20260509143803.7500-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <59ce1037-b6fb-4af7-a213-d605ba5c9a3d@kernel.org>
In-Reply-To: <59ce1037-b6fb-4af7-a213-d605ba5c9a3d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|BN9PR03MB5980:EE_
x-ms-office365-filtering-correlation-id: 29990141-20ec-402d-a818-08deaf0e7667
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|55112099003|38070700021;
x-microsoft-antispam-message-info:
 D5P95CO/t6opaes5baaVltuBx9LlZxrm/W+zkqQyK5HA6gQdcFOM+wrz8WKKerLoZ6Txa4kqw9UZO/EeTHv1kpaHqJpXov+i9LWs6NrYRtvlTw//QO5B3XZQ7yzt4aGRpkFghVz2jVJhBlpjsoYdMZ9lBvdpi69KAlDR4uBwzy3RfHvwKWF1/Q7/1DgwYYyLsG27oRnf0/bu6w9bU38WbEhiZ9rjxYi8rgxW0TRNUs0iB86cfRxlZhT3oHyetT2ieAcx9e03oPbek8nHtyhWfIuZdDIRgm8TXc/COQpBWrpe6O6X4SzDOMyJ993c9KwI5O0D2pA1Sinr/REGndd392sksB7czupexFrxosBGI8R9haU/dm1/mRN2eTXuRIKI7AQDqlHZhfpeI3THKbTtxcN3JA9swjieJaD5/j7cG6NvNrOdjeehtY4PmvIxG/Oqr4ZvVc1Ee80wS3S3hWgkR9OE7dj5YBGKRUChCEpZkbwBP2vYR/Zask5YU9hirwFV5gTeGBQgmHui3GuanrVq7Iv+7SO2PHmSESwkKopLZNBzQ9lUemy4X6JODpt11/0JnSwCmntCfvcBa1OiR2bcq+AGMdEw5J+rJoWgZsCrdWevcnbSuII8IoXe03k7m/M0NXrNjuXoxryvQAlAdPjWyB6iVnqFDZ8yWnB6W7wwykb5hBiLwzPajhohv7a5zEdR1MiK8KdzOKa7O7h0AYJgCeQd+TnqlATIfTpTHj00dXDxRu3gPJsbSv3dL8RF2eBf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vi9rdk1RTjQ4Uk5LN2NZT0hiNG55ZlBZK2ZNc2NuSW1ZQ2Y5MCt2Zm84VThJ?=
 =?utf-8?B?YVcvSjRIblk2UVRrQ0dCZGlZRnVzTkY3K3QyQ0RuS3g2Zm5kaDRiaml5dlVN?=
 =?utf-8?B?dnpSbmU0TlFTcUVVUlJzZlo5RnR4RGVPOXQvZU40MTVLL3FkUlE1NU9CMVFw?=
 =?utf-8?B?aWxLZERVSlNMVlRlN0RNRHpGYytrdU8zampDeHJ3UFlCQUxqUVBtYWRMbXho?=
 =?utf-8?B?cXZZYzlPQzhSczcyRWN3WWVhK1Fwa2xXWmxIN3B4WVlScjduOVlDL2ZnWE5l?=
 =?utf-8?B?QWU2c3lORk1TL1k1YWN4QzFlbGwyZi83dmlaT3cvSXBkdnQwcmdMc1JESklO?=
 =?utf-8?B?ejNwN1RLa3Z6bUxyVUVpMndETGE2MlBzYmZqSStQSXpzck9HUEV6aWZwQkZh?=
 =?utf-8?B?ek1EQk51YVk1WjlqZnB5YVdQNk40eElCVzJWVFd3a201Slh4bXFIeEJtbER0?=
 =?utf-8?B?TVgzUjc0WG5uSGR2T2dLcktFaHN0a1hWcmszdmo5ekE3cE1HVkFLTXl3bmdn?=
 =?utf-8?B?T3JCalY1aVlGYkl0WGp1eHhiVlVMcndTc25qazR6WWtBTVdIcERIQU80NGs5?=
 =?utf-8?B?UUF6R0xxSTVtemtvQmtYNndjQmFvNlZVM0RJWVFxUVcvRVpOM29JaXNlWnl3?=
 =?utf-8?B?d015azY2aExuaXhESUs1ZklmMElnMVRaMGpFeXIrQVU5N3ZsN0tZdSsxWU9I?=
 =?utf-8?B?RmNGRm0yVXl5Z0FCcTFzNkpDZVZlN3psNTI0bHFhaHZiaXdlUEJHdW5xK2V3?=
 =?utf-8?B?TE14bDJFYjJxd0RueEJkVVlnSHhNeTNNYXJ0c0xyWHhBMGMzSE8zRytpQkUr?=
 =?utf-8?B?SlR3ZTVnV0h4WXNBQ1RNVitJSVoxRFhNaXhRZHUxSG56Y1Y4WG03d0F3K3FL?=
 =?utf-8?B?Q3BCdkdURGt1RmFVVXdxZFNhR1dLMmlLMWFoWmFNVklDYW0zWlh2OUVraVBL?=
 =?utf-8?B?ajd6ZzJ6NklLK0NKU3VWaVk5RTNlTGREV2dVYnNYekNCdmJCRjAyeVlhNHRW?=
 =?utf-8?B?ZFJZN2VyN0Y4cWYrcjRMK3VrZHlJR3FDQ0d4TWZRMUFwSkVYNG1nTDB3YmZH?=
 =?utf-8?B?dVJnTDZkM1pmYTNCQy8vR2t5S3RPMUVXSzFSNXJhN0FWUFhTdCs4aUJYR3R1?=
 =?utf-8?B?aHNCWG1FeDkvN2pscjhSeUpidGc4dVVzY0Jid3kxYkhuaDJEWVpRR1JCMWxY?=
 =?utf-8?B?YUtmWmpLVU5wV2w5ajdrQ1REd2xVY2FPYndVTXRGSEJPbXQwcFZ4ekJnUkIz?=
 =?utf-8?B?cFcyQnNsYkRQSDJYdFgzdkNuWExZMmxMVU44aWxVOXFxcStLYmNGVExOUVJq?=
 =?utf-8?B?eVJlK1lkR1FPZVZRV2h4UmF3Lys4cWNsYzRESWQ2ZnVQM1RSZVpPcS9UT2xh?=
 =?utf-8?B?RDVVN1I5MHY3NVVSbVFlVEhaN2lhOXZ1RXNjZmNLOXEvZzYwT0ovclJMaHQ1?=
 =?utf-8?B?V2Qvc3VnelJUWVJKR3RUUkFFaUFDenR6OU1sT3pUd01zUFFGWGdJZ2xjSnZN?=
 =?utf-8?B?aGdBN3FncE4zTm9TM0tRUnJBT3pNWHNlL2EwQXg4djFCbVJmODhiQnlFQnVN?=
 =?utf-8?B?dmtOWEhxMkJxNlZkSmx2RlJCaW9ZSW9MdmoxUUptVDFiZW0rbWJBaEJsMXU0?=
 =?utf-8?B?VVhSMmZhM0ZIbGJkM1JEa3dGeVViZG5vRWd6TGNyTGRhcXUrYjZaS1RaSldE?=
 =?utf-8?B?QkJGUWF5LzNRQzN6ZGw3cW1Hb1NiNTZSa1JvVXpIdnJHZUt4bXNidzNDT29Z?=
 =?utf-8?B?eUZhZHFCclpxcTNjNE5mTkZaZGNjb0EvNHZURjJqbGtTZWlvN1A3UHRXOHVt?=
 =?utf-8?B?R0x2cm5NNE5UNUplTFk5U09GZ01RL3dlTjNOWWxrTWVwQlZQNm11ZXRHK3pT?=
 =?utf-8?B?ay8wWmNZaS9CSjArSU95ZmZBSWwwUWZ3WFlkSmluN2hxaytOeWZoelVhZlcz?=
 =?utf-8?B?T0pqQUNDZzVvVEtlYStOMm1xN1ZHRXFhdm8vb0YrZnphVTZuMnFVUlBiTXZj?=
 =?utf-8?B?bHV5Q0xINU5MMHk1aVMrckU5SjMvOW5SemFsaG9YQTR4MDdVMFlHTzQxdXdX?=
 =?utf-8?B?YUdXWkdNRm5iOG8vOTh5Uk9GYW83ZFJFZE41NENvdHVSUEtXMldSazdTdlFK?=
 =?utf-8?B?a0hPOU1hK2FXVkhwVVFxUXQ1S1NaOFVadWp5NnpwRU5pZkoxNjVEdUNNMDhX?=
 =?utf-8?B?SVRCQ1FCSXVTMlZwTi8wNGEzeVBoaTVGZUZ6dDMybVQ4aE1ULzdhMkp6YzZs?=
 =?utf-8?B?NmVHV0ppTkp5cVpoTDNuQ1Q5OGg2MEtBSGtVMTNURjN6bldpWnJSUTgyZDdN?=
 =?utf-8?B?NStsM2pXeTgvTzFuSWdxZnBBcmluTVpVeW5mY1crdWVNWmx2WVZDOU9LSlRz?=
 =?utf-8?Q?1BQgAFwJeJhDbyoubwLmqxi/y6Sf1Sn5iOhN4TXR4uPHn?=
x-ms-exchange-antispam-messagedata-1: puXanZuxNWsZXw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4042135E4E16E0438F86D5CE2521C08D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29990141-20ec-402d-a818-08deaf0e7667
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 03:36:18.3975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fw1xJGFNEs1bKD5jiqY46rrjnV+OB5C3jIdTzB8JsM8p2sQgT4YQpYVE/65+9RRp7jIRcTArHle3lizf9D8dT+Qq3wP+yIXvDZF8rZHCJf790z/yrJ71abzonrSXASbMlZGEkCqCY5nYvka5BXDBQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5980

T24gMTEvNS8yMDI2IDQ6MzEgYW0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gDQo+IE9uIDUv
OS8yNiAwOTozOCwgbXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29t
IHdyb3RlOg0KPj4gRnJvbTogTmF6aW0gQW1pcnVsIDxtdWhhbW1hZC5uYXppbS5hbWlydWwubmF6
bGUuYXNtYWRlQGFsdGVyYS5jb20+DQo+Pg0KPj4gVGhlIE9DUkFNIEVDQyBpcyBhbHdheXMgZW5h
YmxlZCBlaXRoZXIgYnkgdGhlIEJvb3RST00gb3IgYnkgdGhlDQo+PiBTZWN1cmUgRGV2aWNlIE1h
bmFnZXIgKFNETSkgZHVyaW5nIGEgcG93ZXItb24gcmVzZXQgb24gU29DRlBHQS4NCj4+DQo+PiBI
b3dldmVyLCBkdXJpbmcgYSB3YXJtIHJlc2V0LCB0aGUgT0NSQU0gY29udGVudCBpcyByZXRhaW5l
ZCB0bw0KPj4gcHJlc2VydmUgZGF0YSwgd2hpbGUgdGhlIGNvbnRyb2wgYW5kIHN0YXR1cyByZWdp
c3RlcnMgYXJlIHJlc2V0IHRvDQo+PiB0aGVpciBkZWZhdWx0IHZhbHVlcy4gQXMgYSByZXN1bHQs
IEVDQyBtdXN0IGJlIGV4cGxpY2l0bHkgcmUtZW5hYmxlZA0KPj4gYWZ0ZXIgYSB3YXJtIHJlc2V0
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2LnJhYmFy
YUBhbHRlcmEuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogTmF6aW0gQW1pcnVsIA0KPj4gPG11aGFt
bWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbT4NCj4+IC0tLQ0KPj4gwqAg
ZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMgfCAxMCArKysrKysrKy0tDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2VkYWMvYWx0ZXJhX2VkYWMuYyBiL2RyaXZlcnMvZWRhYy9hbHRlcmFfZWRh
Yy5jDQo+PiBpbmRleCAxMDNiMmMyZWJhMmEuLjllNmE5Nzg2YTg4MSAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZWRhYy9hbHRlcmFfZWRhYy5jDQo+PiArKysgYi9kcml2ZXJzL2VkYWMvYWx0ZXJh
X2VkYWMuYw0KPj4gQEAgLTExODYsOCArMTE4NiwxNCBAQCBhbHRyX2NoZWNrX29jcmFtX2RlcHNf
aW5pdChzdHJ1Y3QgDQo+PiBhbHRyX2VkYWNfZGV2aWNlX2RldiAqZGV2aWNlKQ0KPj4gwqDCoMKg
wqDCoCAvKiBWZXJpZnkgT0NSQU0gaGFzIGJlZW4gaW5pdGlhbGl6ZWQgKi8NCj4+IMKgwqDCoMKg
wqAgaWYgKCFlY2NfdGVzdF9iaXRzKEFMVFJfQTEwX0VDQ19JTklUQ09NUExFVEVBLA0KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGJhc2UgKyBBTFRSX0ExMF9FQ0NfSU5JVFNUQVRf
T0ZTVCkpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKGJhc2UgKyBBTFRSX0ExMF9FQ0NfSU5JVFNUQVRfT0ZTVCkp
KSB7DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFlY2NfdGVzdF9iaXRzKEFMVFJfQTEwX0VDQ19F
TiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGJhc2UgKyBBTFRS
X0ExMF9FQ0NfQ1RSTF9PRlNUKSkpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlY2Nfc2V0
X2JpdHMoQUxUUl9BMTBfRUNDX0VOLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKGJhc2UgKyBBTFRSX0ExMF9FQ0NfQ1RSTF9PRlNUKSk7DQo+PiArwqDCoMKg
wqDCoMKgwqAgZWxzZQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7
DQo+PiArwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAgLyogRW5hYmxlIElSUSBvbiBTaW5nbGUgQml0
IEVycm9yICovDQo+PiDCoMKgwqDCoMKgIHdyaXRlbChBTFRSX0ExMF9FQ0NfU0VSUklOVEVOLCAo
YmFzZSArIA0KPj4gQUxUUl9BMTBfRUNDX0VSUklOVEVOU19PRlNUKSk7DQo+IA0KPiBUaGlzIHBh
dGNoIGZhaWxzIHRvIGFwcGx5IHRvIGJvdGggdjcuMS1yYzEgYW5kIGxpbnV4LW5leHQuIFBsZWFz
ZSBiYXNlIA0KPiB5b3VyIHBhdGNoIHRvIHRoZSBsYXRlc3QgYW5kIHJlc2VuZC4NCj4gDQo+IFRo
YW5rcywNCj4gRGluaA0KPiANCnNvcnJ5IGZvciB0aGlzIGNvbmZ1c2lvbiwgZHJvcHBpbmcgdGhp
cyBwYXRjaCBhcyBhbHJlYWR5IGF2YWlsYWJsZSBpbiANCnVwc3RyZWFtDQo=
