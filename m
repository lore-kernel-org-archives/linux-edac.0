Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807A2DF15C;
	Thu, 14 May 2026 03:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730143; cv=fail; b=TJ4OvY1k8E5yeFxJ5OISOh38Yo0cruVriEmVNXpW6wqxoAlJHaj6ZDnDV0JgtAft1UxlzpwyYFwp3WHPL0ZNtBTXPQsU67mShrOmZakElA211J7EWzAG+D2ChhH6H+lObK0h3tqfvXavuEMBdO2NlP40ujF+XZ+ABW/yC73vb6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730143; c=relaxed/simple;
	bh=yCjHkeCpKeSBGK5FwXcvdqk6whcrj3Vd+myTxGCEVkM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnen8VSmCtRzmZJ6G5R9g184zIEOSfHulZPi7HIu36or4qBL+BpbdoQ0Q0FfywUv+RVzKXA5wlZOf6iSdHOUDYxLPnR6lAru0Nz6a4A5Ux6RUxhVTE9EV+u+31XPldePOdm4IUdsMGkL6sR799/9rk8Igv0tlRBDiiPuBcAK3lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=wK8gC2+j; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="wK8gC2+j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyWROH2fCbpYoLo/m+iumTRw2HDf9sq07YOFzrEFXeYqNalVZv6gS8aF/cv/ATPrgY3+yaNoVhkPR1BN1iwaP9Ui2IV9lOqMT9ILWIS0Q7ozsljvUBTiY5I+WWctr9IFatR89nD4nSUCSRzQl3rvt094bXnHBpW5OAcKZxPcBgaeiMAwC+9AocNyDIljtrlPdwQEIQ28NzrcglLa/Fz/FlaUnEnDwlLoXA84/cRwVMHfOWXb1CCMzs0zwDPABAxIljuZuNf2tEiQOOARtVMjGX82+PzBjTDOT3mw+FZ0GSQLA4ipaHNesUanToVUmoiHeMaalN1fANMhKDv2Gmhx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yCjHkeCpKeSBGK5FwXcvdqk6whcrj3Vd+myTxGCEVkM=;
 b=LEJ1ygvU33z1QPsxZOFCvPGC0af22qqSGd0UZPGWZ+y+FvWHYkSA8LF3yIhGAjW5ysRNCig/iyy2xGdQUVvzbBzMVcmhLGkhq647c5H0sEvx4IzSBBJ0B/j8SaQxM1fDJYDNcQkiH5GBe/BhREUlTU1NJZy85W85q5a2ioV2W4aHixdoHLjJeR91AO3cYosGX2nheAvLrP1TOEEYuxugUahcxh4VwUUz8a2Dj2rq2/Rye+EU38x6GlD7Z/yAl9ykdNOjbdhWRvU0NwLs5fRLvdAFv/OVEprOc9nxG9hwMvNeHKL2OUm7DMiz+MZK1E2K9mBZr9JOCFRuiP9SyaO3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yCjHkeCpKeSBGK5FwXcvdqk6whcrj3Vd+myTxGCEVkM=;
 b=wK8gC2+jKCjZzaod4pQLRNph8u+InexIv6P5y3b+QJaYRFEBAF7KN3eqVLESrs55Y+d2xyCdBiUdeRcZp+yMz/jHWOB92X5ibJo3leTKYDPtNlSV+REkbfJgQ8tfCvWngIdivkwahYoDHcJbK15ZT5p1poU8OBMqHGnYA9ocCub4ZZtc97zekm5iTiDlfFjLwIhe5MA40mIbY3icaL1c08jM9x7NfdD2mbjgbTHc4tLdc+KGPMOMYhA6sxQoQwor7C6A2UE+uJrE6P20bQ5eYoPY76MQJX4pAMztiuN1uMT4pEOFg6K0TKFEWjCkqDYhrZsDALQ+T3zPKMVIXwMt/A==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MW5PR03MB7007.namprd03.prod.outlook.com (2603:10b6:303:1aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 03:42:19 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 03:42:18 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Topic: [PATCH] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Index:
 AQHc3r+l7HrYYLKubEKb4hmldPqVcrYIvEiAgADl8YCAAKRSAIAABzMAgAGAEwCAARwCAA==
Date: Thu, 14 May 2026 03:42:18 +0000
Message-ID: <7a0b7dea-5106-44a2-8121-42c07d025c83@altera.com>
References:
 <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
 <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
 <de0f32eb-2216-47a8-80d4-bd66fcb253a9@kernel.org>
 <4f80ef77-a38b-4652-a1f1-1bea3e88de74@altera.com>
 <b88eb1df-6841-43b8-990d-506c8c4f2d4f@kernel.org>
In-Reply-To: <b88eb1df-6841-43b8-990d-506c8c4f2d4f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|MW5PR03MB7007:EE_
x-ms-office365-filtering-correlation-id: f4a7b2c8-d81d-43c1-fe67-08deb16acc8b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|4143699003|55112099003|38070700021|11063799003|56012099003;
x-microsoft-antispam-message-info:
 I7tWInocLz1h7YACeSf7OjbPielc6MMj+vtg2qruVXQgM74CD3YRlW/Qm3oANYLUDDB+jGuMTf1N+LwFjtme83W+sFwMBrHYSzWnsfvWj5xxr1AA5aA3T2pTgYqp3Tp8EdKIBKourY+SPbWzpPAEFz4R7TrXCfNoMkN/bfuLdX0jRKRfk7elQKEOlpmS42ZxlDZfOJ7/Wl0htFWPbT0Eirjpj1PGXdlc/tDDZ2eJFAKsrnxjKWeo3M6OeV0y/OOwIiTFvYxV2pMnXCqTm6+y0FKtsqiTjDBYcdOSYiTQ+Y3wlgQ/crHeDKlre6/2IVi6ljcxDw1wRiYw79hsKNGXImR4EYLoy212kKl4C7FzT2gbmoHHKzT+OvAN4x+byJ5y1wtmaX2MBu6Q9FmzyJze5ve5nZwSA+urKUcx4OF0YrJuhJmz+zInBQTBnqniVHOksyuho/HMg5FVr02rM5H6MYBLh5Jfgz1aSBYCMVFlZCTQ5zDObcot+DA1IBiAr8o8UhrhqrWW8+4tPuhbJ9FCBxW3VWmDaPBkumevG2dV3mhZ435FS7Gz4E6d1qD/qJQYS4/DKu3icx6jiKcMmoN25VouyzyNP83uF/L9BVrb8Kdw33vQQk9Z9jxkD0FodGUxsAA8O9MD+G0IWCjk3fU+rcrx4aoTnWtxO/R5xm0xUG18x63gs2gSpqxnH6UE+2/JRohkwmHSGn0onVnavZvg6RxMoae+x/xfbeAB78P0AaEPe4W54KWUyV3o4UzlaA/B
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(55112099003)(38070700021)(11063799003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a3FqTnVSajNiNGNma0pQaE1IY0ZSRm9tK3NKNkVVUS91czE0Qk9OZ2hySzJq?=
 =?utf-8?B?OEo4OVhUcWY1a2xYRHFPTlZCcElrU2pMdVVzUjRuejNLWGwzd2FmOWs3cHJO?=
 =?utf-8?B?QUhGb0t5bVNQRkYyOGhoWFY2eTNMWlRMSXpRUGtSQUxwYlpSYjc2MXVVUFlR?=
 =?utf-8?B?RGtnTmVtKy9WNi8xWThKR2FhbzBBODU5TjBWaXFKRGlZTDE4Zm5WU052SlFa?=
 =?utf-8?B?ankyRjRNd3pod2hsUWlFWi84YURCZExjWHpaMC9SdGZGUnJuemtKVCtRMzJW?=
 =?utf-8?B?R014N3BqQ2ZuRldkcVkySlRLclN0UzluaVdIeGxXaEY1MTJvNmZ0YlVUQURF?=
 =?utf-8?B?cWNEVmxGaUIyZWYzWUR0Vm1XWE0vdFZ2anc2RUpRMG1PdlBBdEhxVUVhM3V5?=
 =?utf-8?B?Ni9RU2hmYWlON1JXeDhOc3JBcDJYVXpMZTlKVzFjL1lyQXpYd3JDSEtVdEhn?=
 =?utf-8?B?QzFLRVNZQ2xuVUZQTWsrMlVjdXBhMHlFRTBUYkoxcWxyUjMvMDdiSzNad3hO?=
 =?utf-8?B?Zk80UEczWm92NWZUVjVIZnF2WGRWOUl0RXhaTTc5UzlEQXphSUp1RVZwRVVk?=
 =?utf-8?B?aGduTDZRUFRSdkM1bkNaYkN6bGp0WmJBcU1PZWFkZFBBNGVONzZhNzVKdlVh?=
 =?utf-8?B?RldqTDZNRlhLK2FIU3E5U1pUbXM2WjJDU2hveHZSZVFRVi9HRGxXTnI0QURI?=
 =?utf-8?B?dWNtcUpHbXB6ejFUb2RLMWt5WFhDTHFLWEtDU05xRTdjYmtXdVVMemwrOVZn?=
 =?utf-8?B?eHdUVkZaYTY3Sy9KMVZEV3V3Miswc3VsVnN3ZTl0MFpOdUZla1dsRkVwcTBp?=
 =?utf-8?B?ZjRqdGxrTWxFWUlUdTZhWlIyUEVVMlVrTkV3NEhGT3lWYlhHbUZvOEw3RE9h?=
 =?utf-8?B?c3VOemlQVUFmajlLbnl1cGNlc3I0WlZMUjNiSFl6N0JudFZNT2xaWktrd3l0?=
 =?utf-8?B?c20vTVVIVFZlMXBqWHdVaU1samdhZzhoV29jc2RWU2tUWUVyUnJzN2cvUWND?=
 =?utf-8?B?QllOV3doUUI2L2xpS2p1UkZoLzUrL2JCS2FNUnUzTy9ZVGFGdFVhRXBMNmhQ?=
 =?utf-8?B?dnlUZGR4bmhmZ0ZKMHI0bHdDRlNIMU9GWW1SSXBjOXo1RHJFeHFJSm5qRURL?=
 =?utf-8?B?WDd0VU1KaTJ1YzJIN21zalZQc0R1NzlwQjAwRXg0QVA3aytadDVyRWMxWGVm?=
 =?utf-8?B?OGpQcGI5cjEwSC8zSFkvU1BzZTJ2U0NodmRBeVFuTm1GTE16RWJUbFFaTnc2?=
 =?utf-8?B?NVB3eXFjVWRzM3ZrK3ZXSWcrSmVOelI5YUoyRTRmVjFMai94b1JTSnNOZkxa?=
 =?utf-8?B?UjhjSjl4OHdxV1RkeEk5V3pWQmgwQzJ0VEc3WlFTbFNvcUkzQmh5NjE4ZldT?=
 =?utf-8?B?Z3lXWHhRNkhxQzk2MnZMUWZ1QTBxN3pSOUE1MnlSOFNBMEdGcEVKNUFCS3lG?=
 =?utf-8?B?dzEyZnA3VXc0S0EzRk5KZkw4OFZYUkVnZDhjem5aZS9qUGQ2dzlDQTJoWFlK?=
 =?utf-8?B?bmdOTm9SZGRabnEreVhhWUp5WGl3clZIR1hwTVFVenhwdm9nMDdBTDR2T0dY?=
 =?utf-8?B?enZLb2IvbWtUdlE4MzZ1cTRFYVhYWitYdnUybHZqWEtwQkpneFJMTWd5bytw?=
 =?utf-8?B?alBTVDVXbThmUzIxSmtYOTAwNHV2RlVPSkdHTkxhL1EyM1czcUxjZjRnODh0?=
 =?utf-8?B?K0FwQTZ6SEZzZnArSHZYVEY2SFVCVlRCQi9OaW0rcE1tSTRFSjJUUHhCY2dX?=
 =?utf-8?B?N3JNWmgremRzVGpGNUROL3FGbEwwdjZVUHdEN3ptMWg0R2VLRloxVForZG5N?=
 =?utf-8?B?K2xIb0NucnlVUno4U3k5SFRyVnpOMTlUbUNHRnh1YkdFa2R5NnNGZUFocHN4?=
 =?utf-8?B?RjdlQk16dTRXV0w4QnduYUNiM0tIb0dtbUc0cnp5ZnIya01pb0NzWG0wMEJR?=
 =?utf-8?B?aE1ZekRQZFZvRDhGYVJHQkpJOTBBOTNja2dwK3BKaTNoOE0xenlCbWtDcWt3?=
 =?utf-8?B?aE1SY01ZRmh1UCtiMlhySWgrK3dvWnE4TzM4ME90dVFoVnFqSWlBVytLQzdv?=
 =?utf-8?B?aFlUczNMUHpsaVF0K3BUMCsvUHdkV3FkeUkwZUcwSmZ2b3FIU0FJMUN3WDJB?=
 =?utf-8?B?M1BkOWo4cGhmVGdaOEJONVdGQnMzSmp5OHY2bnBPLzY0VGRwTWxtY2Y4amR5?=
 =?utf-8?B?VUVicTFocExDdzVrR3QyMmpUSnE4WkV2TzdKcGRwcWdSQldROTFCcW1rQmJE?=
 =?utf-8?B?UG0wUGc5ekpTZTlEWGZDOUtGbFVJWTAxTjBEajV2MnRQOGwvaEI1d0Z6c0I1?=
 =?utf-8?B?Z0FqaDg3blNhVDdSS1NmMk93SGZZYllYUS80alltVU9KRUhLTUVNaGtPMkxQ?=
 =?utf-8?Q?G1Biix2eB6O6rweKrZatmikXMPNuvrlvHnGeo9FHvpVuh?=
x-ms-exchange-antispam-messagedata-1: hlfPuVX7BvGL/g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3901C444867B8428768B68FF8885377@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a7b2c8-d81d-43c1-fe67-08deb16acc8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 03:42:18.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4+DjAxMM6RwlFVqbFQ/r1auNZs0tpUFoyBQf3GZLI4UKSSLUrTfm4yx403aQzc6XnYNDyiFJV1e/cL90vIb2qp39y6tPJ9Hlae19UdjrBe46pkUbY3dLHV8VvDe4mhuASPxpMJJek/q1e5A370hKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB7007

T24gMTMvNS8yMDI2IDY6NDUgcG0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gDQo+IE9uIDUv
MTIvMjYgMDY6NTEsIE5hemxlIEFzbWFkZSwgTXVoYW1tYWQgTmF6aW0gQW1pcnVsIHdyb3RlOg0K
Pj4gT24gMTIvNS8yMDI2IDc6MjUgcG0sIERpbmggTmd1eWVuIHdyb3RlOg0KPj4+DQo+Pj4NCj4+
PiBPbiA1LzExLzI2IDIwOjM3LCBOYXpsZSBBc21hZGUsIE11aGFtbWFkIE5hemltIEFtaXJ1bCB3
cm90ZToNCj4+Pj4gT24gMTEvNS8yMDI2IDc6NTQgcG0sIERpbmggTmd1eWVuIHdyb3RlOg0KPj4+
Pj4NCj4+Pj4+DQo+Pj4+PiBPbiA1LzgvMjYgMDI6NTIsIG11aGFtbWFkLm5hemltLmFtaXJ1bC5u
YXpsZS5hc21hZGVAYWx0ZXJhLmNvbSB3cm90ZToNCj4+Pj4+PiBGcm9tOiBOYXppbSBBbWlydWwg
PG11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbT4NCj4+Pj4+Pg0K
Pj4+Pj4+IEd1YXJkIHRoZSBpcnEyIHJldHJpZXZhbCB3aXRoIGFuIG9mX21hY2hpbmVfaXNfY29t
cGF0aWJsZSgpIGNoZWNrIHNvDQo+Pj4+Pj4gdGhhdCBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDEp
IGlzIG9ubHkgY2FsbGVkIG9uIEFycmlhMTAgcGxhdGZvcm1zLg0KPj4+Pj4+DQo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogTmF6aW0gQW1pcnVsDQo+Pj4+Pj4gPG11aGFtbWFkLm5hemltLmFtaXJ1bC5u
YXpsZS5hc21hZGVAYWx0ZXJhLmNvbT4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBOaXJhdmt1bWFy
IEwgUmFiYXJhIDxuaXJhdi5yYWJhcmFAYWx0ZXJhLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiDC
oMKgwqAgZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMgfCAzICsrLQ0KPj4+Pj4+IMKgwqDCoCAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+Pj4NCj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMgYi9kcml2ZXJzL2Vk
YWMvYWx0ZXJhX2VkYWMuYw0KPj4+Pj4+IGluZGV4IDRlZGQyMDg4YzJkYi4uYjMwMzAyMTk4Y2Q0
IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZWRhYy9hbHRlcmFfZWRhYy5jDQo+Pj4+Pj4g
KysrIGIvZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMNCj4+Pj4+PiBAQCAtMzQ4LDcgKzM0OCw4
IEBAIHN0YXRpYyBpbnQgYWx0cl9zZHJhbV9wcm9iZShzdHJ1Y3QgDQo+Pj4+Pj4gcGxhdGZvcm1f
ZGV2aWNlDQo+Pj4+Pj4gKnBkZXYpDQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4+IMKg
wqDCoMKgwqDCoMKgIC8qIEFycmlhMTAgaGFzIGEgMm5kIElSUSAqLw0KPj4+Pj4+IC3CoMKgwqAg
aXJxMiA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMSk7DQo+Pj4+Pj4gK8KgwqDCoCBpZiAob2Zf
bWFjaGluZV9pc19jb21wYXRpYmxlKCJhbHRyLHNvY2ZwZ2EtYXJyaWExMCIpKQ0KPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBpcnEyID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAxKTsNCj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoCBsYXllcnNbMF0udHlwZSA9IEVEQUNfTUNfTEFZRVJfQ0hJUF9TRUxFQ1Q7
DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgbGF5ZXJzWzBdLnNpemUgPSAxOw0KPj4+Pj4NCj4+Pj4+
IFdoeT8gV2UgYWxyZWFkeSBzd2l0Y2ggb24gYXJyaWExMCBsYXRlciBpbiB0aGUgc2FtZSBmdW5j
dGlvbi4NCj4+Pj4+DQo+Pj4+PiBTb3JyeSwgYnV0IE5BSy4NCj4+Pj4+DQo+Pj4+PiBEaW5oDQo+
Pj4+IFRoaXMgZHJpdmVyIHdlcmUgdXNlZCBieSBjeWNsb25lNSBhbmQgYXJyaWExMC4gQ3ljbG9u
ZTUgb25seSBoYXMgb25lDQo+Pj4+IGludGVycnVwdCB3aGVyZWJ5IGFycmlhMTAgaGFzIDIgaW50
ZXJydXB0LiBUaGF0IGlzIHRoZSByZWFzb24gd2h5IHRoZQ0KPj4+PiBpbnRlcnJ1cHQgd2FzIGd1
YXJkIGJ5IChvZl9tYWNoaW5lX2lzX2NvbXBhdGlibGUoImFsdHIsc29jZnBnYS0gDQo+Pj4+IGFy
cmlhMTAiKSkNCj4+Pj4NCj4+Pg0KPj4+IFllcywgYnV0IGxvb2sgYXQgbGluZSAzOTcsDQo+Pj4N
Cj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgLyogT25seSB0aGUgQXJyaWExMCBoYXMgc2VwYXJh
dGUgSVJRcyAqLw0KPj4+IMKgIMKgwqDCoMKgwqDCoMKgIGlmIChvZl9tYWNoaW5lX2lzX2NvbXBh
dGlibGUoImFsdHIsc29jZnBnYS1hcnJpYTEwIikpIHsNCj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLyogQXJyaWExMCBzcGVjaWZpYyBpbml0aWFsaXphdGlvbiAqLw0KPj4+
DQo+Pj4gRGluaA0KPj4+DQo+Pj4NCj4+IEhpIERpbmgsIFRoYXQgaXMgdHJ1ZSwgYnV0IHRoZSBv
bmUgdGhhdCB3ZSBsb29raW5nIGF0IG5vdyBpcyBhdCBsaW5lIDM1Mg0KPj4gd2hpY2ggZW5hYmxp
bmcgdGhlIHNlY29uZCBpbnRlcnJ1cHQgYW5kIGl0IGlzIG5vdCByZXF1aXJlZCBieSBjeWNsb25l
NS4NCj4+IFBlcmhhcHMgYXJlIHlvdSBzYXlpbmcgd2Ugc2hvdWxkIG1vdmUgdGhlIGlycTIgYXQg
bGluZSAzNTIgdW5kZXIgdGhpcw0KPj4gbGluZSAzOTc/DQo+IA0KPiBZZXMsIHRoYXQgd291bGQg
YmUgZmluZS4NCj4gDQo+IERpbmgNCj4gDQpjaGFuZ2VzIGFwcGxpZWQgb24gdjIhDQoNCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUxNDAzNDAwNy4xMTU0MS0xLW11aGFtbWFkLm5h
emltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbS8NCg0KcmVnYXJkcywNCk5hemltDQo=
