Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BD2E413;
	Tue, 12 May 2026 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549841; cv=fail; b=ngwG7DCXVpKyUAo6M5Nfb6Lc3myBi0IeLnh0aIkdncLemjY9oNGU3+Sax8dGzEkyvKx3wRo87iKQs/pA5GVP3f54YHusLroefgsDhqTMuYgv+eKVATst7gQla8fh57e+UqIBjqyIYjEnkU8pzdV1fyR8JT4FY3aaDBSDdcAqP2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549841; c=relaxed/simple;
	bh=EP2rACsXqzsaCKf6t/7H1nkDq/YjmeA5CiGnibHLm+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rJdJXuuNa4Glvug4i+B6Ytt5naRC/JSLZaOkrtQDQykrfVSC+h74ENy24i7eBc1z1TvhQ6LQAfSbC/oNJzuP5+MibXBwltzIfXjv6H2tu/jGlOMjdw9CO3tdXdy4Y/xbZJdnNfdOBHf5F8HG57z9LPPO1/s1j7yZhH74Ceb4CzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=ERD0ciN6; arc=fail smtp.client-ip=40.93.194.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="ERD0ciN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAT9wkFoLU+176ElaU2e6Ar0fbmzYSLa9VdJaYbmQ0/Gl7uNMIsm2BKbkcAWL1ggTVC6M1RE8qwtubYAQi0bIfh54Oiyna8Jgm1nWnLY2NB7kER7drR69Dn0Y9nVao4unhLWw79Pw5CBJPEbUjsjwnfbfAvv2Qih0LDwYaldk6Ck+39bmr0s8OdQYF9IfFRXZNaEtN1oVgdyR1vpBaLMVGSiRE+vsSxobgvRxnK6BKvXZoMplpXq2qjgId4MLBAETOazDuQNIuphpYtTaCAHiJl8TCtVdheIQgCvEC0RVtAHKdHg63mWJ/Qm2kQwskdWKM3sXmuzk5VFkFT/g95/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP2rACsXqzsaCKf6t/7H1nkDq/YjmeA5CiGnibHLm+Q=;
 b=O5GbvWhv/M6JzxB58muczjhad/gXED4C+ws/Na4bgqB5+moLgGDRzNEtsNs00aJmJeuEjNRGnkAR1sldpgiwSfeTrk6DeFJTpxPUksq+waMHu9c6JkLmpIEPChrJikyqnoApRX/XZNz9VVmT1zOC6fTAdeBDm7JBAlqFSJ41tnA/cFnehdv+cnfLQt9ydogfurAeTZ/7ntwGvLVSGAzZMe7zY/XPVkz1uZIx+dSghcfubwrKp1u99TKLt947TBMVzLUogR45w2EXbEBm7CiRNWqnTg4DPKZAfVfXYcRESuCAP5M7mcIf3OCgHxTv/z7EuABau/HX2eHAnXcP6QaKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP2rACsXqzsaCKf6t/7H1nkDq/YjmeA5CiGnibHLm+Q=;
 b=ERD0ciN6NSA8oFuHZ/8HZKC/xbk8sPOsNRj8PVPVw4KpnaputJtR69f2jM170PSHNvU8bcg254gYzG4OK6y70UOhJGz4SKU6FQcruV5KeN9JdC194KvbvhP5pXXBOiyAu+e+yrsaMlUb99YD2B1HDCgNMiFGD4Eai9lvNsKewHI9pxP8Zi6KK4Zrdb+nAzLJfcpJB0flBK3dC0KLGErStt6rcrWlDNwG5ZMQUk66Kv4iooHv7bjTbAinbOerCwRvWVr/uZNapfY+V0cwnkem+vdvo1OmtS8tK4+R4dPwlVupMjHFVl9Vd5va76+YGGs4LwBvgcmMgtLk/HglzzJ0xw==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 01:37:16 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 01:37:16 +0000
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
Thread-Index: AQHc3r+l7HrYYLKubEKb4hmldPqVcrYIvEiAgADl8YA=
Date: Tue, 12 May 2026 01:37:16 +0000
Message-ID: <275595ca-6044-4882-a9fd-ca9d496a27a5@altera.com>
References:
 <20260508075240.23638-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
In-Reply-To: <cc767b60-3b91-40d5-aa70-c5f252d1d39b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|PH0PR03MB6366:EE_
x-ms-office365-filtering-correlation-id: 06914754-4f05-4739-3752-08deafc6ffd0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|38070700021|11063799003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 kWZfRUZcE+QrIy4r7qq8aaW51hQDHjwUBd1lrpzfU0UpM0dUQlZXB6Y1sX3tl19RjadPVVw0NBeaV5cWDIfFAf7dT5LaPF/m3EOz1wNKrIzkRGLspDsARFgmAjCpZqOQytSU7HhF7dv4xprjkzoCHOpdhcvGYMFKMqB8VL19rNz/hrojkoOUqtriiAhF7QZREsVJB6etg/3ctDY/qLaExPBwJC58bmYXMq1UeQ+aD+1cDURLguZqRGvViIHcFfZiTt8nsyAfWmzWJBHZ2pQY1IcTgaAC1tGjDP6Fo9kh6AQBNWCEZ8QOy9QcPafmeBIfvXwSfd4pl4xWy2Wk21Fqd4juCyWgb2LE1+vBCKBbaHe8MVPIxjdruKmUXNn9eHzbh1ql5h7G/hnTPPGHme1jPGiZmrdqTcx/4zvcv/qVNA/YOg93psHozDzTLNzkBBba4IPEfHLdRSWGAQFxOaUuAs0ehZ+6x5STAzKpiNaDejyVTWbT5aj5DehzJbhH1eY7WQIuCENNJzrH7d5WCQJJpJXzZCur3m26/Mac86WNHQYkSPIutiZfpc2oZqSL6JaZnrOOaeetc3+jGqWX1LR3hCFoOHKSzU9kNWB4+JIGAyK4lS5mRRJYAAVZWBWZYY3YNToRMYHZ5h/fQ4ath4NVCPtjZZdQl0oq5SbMq/buvkU5Egr6vTcaJvD36y0r4j9e4/5WC74JG2yIuEC7nugllUTm5W5Qwpnfa+3JcRm3MtfAPg3kwOypYz2Cln+eCtay
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(38070700021)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q21PS0xZZWJEM1pIK1FkOGg4MURVcDQyNHpBbGhLazJJRFVMYmZ3U0dUa3Y4?=
 =?utf-8?B?RkI4b0lMM1VjQnBKc2JoQmY4bkljNXFRYXVhWlY5a3BMQ2dleHMxb3p0Ryt6?=
 =?utf-8?B?L2lkaU94WHFJK3V4K1VUL1Jqb3JYc1VmaER0c21Va1FoTHN1NTcxcEtqQzUv?=
 =?utf-8?B?blFBMWNsOG1wM1phQ2RreVZaa0RkVFA0OGFsNHhGaXRiWThNRnlXVXVESEcx?=
 =?utf-8?B?SkxvU3h0UG8rNHJ4d3RsenplcnByT3F6TW1FcFBiVGhnME5nNzAvelk5d2sy?=
 =?utf-8?B?WDAxNzZSSWl6cURBUjRiWUxZMmVTeldUYWxHbit2VWhHODJMOU81a2JQVTl2?=
 =?utf-8?B?ckxaVmZtdjFRQ2VxRmdkOWZqUUwwS0hYemRjUWw3emVHSEp1eWw0VkJoNUxt?=
 =?utf-8?B?THlzK2J0MTlVZUNDZlZMSzF0TEI3WlZFWlB2NnBzLzczR09XTS80d1dhZ3lh?=
 =?utf-8?B?SGZkR1FPT1RXWmQvM3R0NGpTOXRHa2pHY3pRZVZ4WXd3VGw5cWFoU2xVR1R3?=
 =?utf-8?B?SXY4dXluTGNKSDBkT3ZTMEdjbS9IbS9MbVJya1kyVU01VzJOTGV2ekpROFg5?=
 =?utf-8?B?bXI3Wk85akNveWoyL3Y5YUVMbTR5eDYzN21hUGx4RU54bFl0M2NGZDZ3eHh5?=
 =?utf-8?B?U3NXSkkwQ1JkRms5N1RsbGRwRU9oQTJ1RnZnSDRaY0pCbEowSzRUVmhUMHNS?=
 =?utf-8?B?WjFna2dqbW9OVXUxMWVBRkRNRjhpYkJWbjBnbStjejZkK2Ryb0h4VkVqK011?=
 =?utf-8?B?dGVFOWhkcmI1eDBVY2dNWVY3cXNlakljVDFGdXR2NEtNN0lZcTJ5NjdWQ2Q2?=
 =?utf-8?B?M2VrVDNId3lmbXlGRDhQaHZYTElaclZOaStVUHBlYzlVbnRoTlU4Z0NiMzJy?=
 =?utf-8?B?ZzZwM0lFclAvZVRpWlpHZG5uTEFmeURWc1FuV0dtWmIzYkNKWk93WHFtNDlO?=
 =?utf-8?B?dE5RazZ4amZjUnhySEJhNjFTTngrSFVnWHVsTkR1TTBiNVNrNHB0OVBLOE0y?=
 =?utf-8?B?WldHYTVkS3ZROHhJUGRqWlJYNW1oQURyZ2JOT2VmVFU3WUduK1FhQjU2WmZO?=
 =?utf-8?B?NzlBU283UzFFRWtkWlRFZFRYTE8rWjVDeGtBL01GQkxValo5b3JmQnBhak1F?=
 =?utf-8?B?SGJEWUNCZEFCVDFKcWNwTks1RW9FN243UEMrRkJDblljZXdmamsvc3NYSW5T?=
 =?utf-8?B?WGNnL2RYQ1RibVNjQnJqSkdtTzZ1UG5rbWxaaEdKR2xCWGcvSWRqUnJ1c0Zm?=
 =?utf-8?B?a1VTYi80QzRseFJUWnhnSk11VFhZdXZwcW9idTdRdnJUOS8vUmNRUTFQMi9u?=
 =?utf-8?B?aU5YT0FVaGRhalBtOTZOdlFKT1pJenNPZ1N6b0paUXNwUFJYWHFRVndsY0JJ?=
 =?utf-8?B?WVA5NFpkVXNOVEtmdU9HdXJUNFpxYzhVUEQ5cVFQTlA3RGxaNTJNa2dOeWNO?=
 =?utf-8?B?Y1pTQ0JnRXRrMUVKdkdseHpINHBGeGF1bkRvKzVDdTQrcVZiU0UrTE9Ib01q?=
 =?utf-8?B?NHlEbk1jd0x5WWR2SWpwTXlwa3FWd0N3MWRXY2pKRU95MG14aTVQVmU2OFYy?=
 =?utf-8?B?cUFwakxNai9MQTVqM2dodFlMLzNxVEtBM2o3Vk1yMlROSHkrc2tObmhWUWhi?=
 =?utf-8?B?aHVxWVYzMkltNkhacGN6UHZ2K3h6M2taeExXTFRsSnFscjdCY3VPMFY0Uldv?=
 =?utf-8?B?OHlSeHVIR1pxQmllc0JvK0hDOU4xQ0pRbzBFMW5rSzhlNkE4UEJiTVlFaGlC?=
 =?utf-8?B?VGhDMWljbmptTnJVZ2gvdDJyd1k0dytDd204aHVKRktMdGtvQmtWdERWSS9w?=
 =?utf-8?B?dDFXNHIwZ1RwTzg0TUlTMFRmTlUrUFpyUG0ySFBWQ0N6ZXhpblRDa2xZTlkv?=
 =?utf-8?B?bTZlUjViLzE2R1oxMDlaNEQ1ZVJ0bTVWMmpJVjF2TTNsd3hNbVRNNWVrc1kr?=
 =?utf-8?B?Tnp2KzB1L2VQVm9zSS9sS3Vrb21YR2h5UmJ4bW5UV0FDMk1iS2tTaFE5SU03?=
 =?utf-8?B?cFllN3NQRDZrVkY5bFphMjBqRG9vaDVLL25IOWJUbzRIT3JVRHZGR1V1Z2ds?=
 =?utf-8?B?SUlxMzUrVFcybXcwbjc3T2ZITUR6U3FoNkVWL2VUMGhxa05zSHRLNG52L2U0?=
 =?utf-8?B?QnRGdDB4R3ducGZJeVJTQ1k0WDlZVERJV2M5S1lydVlzQXZDZFdzd09tOFNR?=
 =?utf-8?B?YTU0T0tPamgvMGJEbU9hcnFEN05GQUg4TFlQZkJvL3JDd056MHlsS01ZYVBO?=
 =?utf-8?B?M2NVNkkwd3c4MzJRelBIbDV2cFZxaHl1djB0bnBIamZYTGFOcWNGVU1VNVZl?=
 =?utf-8?B?MUFDZHAxVGJTRFlUMG41QWVKWFppaUVRNXlWOGlUcEJDdXR4MnBPellVWUdL?=
 =?utf-8?Q?EK5BlTshUNn3SPDDsl4aMJ61hW0R+ZCDbCetFmHulDIlb?=
x-ms-exchange-antispam-messagedata-1: exJ+q6RfN32GENJqg5gf236Rh/lN+4C2kEc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22F7636867B3824B9A5FE15DB87B0802@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06914754-4f05-4739-3752-08deafc6ffd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 01:37:16.3050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lOWvE6yA2XWGaDxUFyHujlCKUUraa1ZJIvrkppK0uaVlnv7SqrtFXbUuMlk60sDNkQ9GAWiC6VWyV37FHBnTpO2T5YNhL6tiiydy3L8vCmOO2kIv3dIvVqZMA4L6dWQPK0RYYMzeY5mrGyKWd2faYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6366

T24gMTEvNS8yMDI2IDc6NTQgcG0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gDQo+IE9uIDUv
OC8yNiAwMjo1MiwgbXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29t
IHdyb3RlOg0KPj4gRnJvbTogTmF6aW0gQW1pcnVsIDxtdWhhbW1hZC5uYXppbS5hbWlydWwubmF6
bGUuYXNtYWRlQGFsdGVyYS5jb20+DQo+Pg0KPj4gR3VhcmQgdGhlIGlycTIgcmV0cmlldmFsIHdp
dGggYW4gb2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCkgY2hlY2sgc28NCj4+IHRoYXQgcGxhdGZv
cm1fZ2V0X2lycShwZGV2LCAxKSBpcyBvbmx5IGNhbGxlZCBvbiBBcnJpYTEwIHBsYXRmb3Jtcy4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBOYXppbSBBbWlydWwgDQo+PiA8bXVoYW1tYWQubmF6aW0u
YW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogTmlyYXZr
dW1hciBMIFJhYmFyYSA8bmlyYXYucmFiYXJhQGFsdGVyYS5jb20+DQo+PiAtLS0NCj4+IMKgIGRy
aXZlcnMvZWRhYy9hbHRlcmFfZWRhYy5jIHwgMyArKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9lZGFjL2FsdGVyYV9lZGFjLmMgYi9kcml2ZXJzL2VkYWMvYWx0ZXJhX2VkYWMuYw0KPj4gaW5k
ZXggNGVkZDIwODhjMmRiLi5iMzAzMDIxOThjZDQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2Vk
YWMvYWx0ZXJhX2VkYWMuYw0KPj4gKysrIGIvZHJpdmVycy9lZGFjL2FsdGVyYV9lZGFjLmMNCj4+
IEBAIC0zNDgsNyArMzQ4LDggQEAgc3RhdGljIGludCBhbHRyX3NkcmFtX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgDQo+PiAqcGRldikNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDC
oCAvKiBBcnJpYTEwIGhhcyBhIDJuZCBJUlEgKi8NCj4+IC3CoMKgwqAgaXJxMiA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwgMSk7DQo+PiArwqDCoMKgIGlmIChvZl9tYWNoaW5lX2lzX2NvbXBhdGli
bGUoImFsdHIsc29jZnBnYS1hcnJpYTEwIikpDQo+PiArwqDCoMKgwqDCoMKgwqAgaXJxMiA9IHBs
YXRmb3JtX2dldF9pcnEocGRldiwgMSk7DQo+PiDCoMKgwqDCoMKgIGxheWVyc1swXS50eXBlID0g
RURBQ19NQ19MQVlFUl9DSElQX1NFTEVDVDsNCj4+IMKgwqDCoMKgwqAgbGF5ZXJzWzBdLnNpemUg
PSAxOw0KPiANCj4gV2h5PyBXZSBhbHJlYWR5IHN3aXRjaCBvbiBhcnJpYTEwIGxhdGVyIGluIHRo
ZSBzYW1lIGZ1bmN0aW9uLg0KPiANCj4gU29ycnksIGJ1dCBOQUsuDQo+IA0KPiBEaW5oDQpUaGlz
IGRyaXZlciB3ZXJlIHVzZWQgYnkgY3ljbG9uZTUgYW5kIGFycmlhMTAuIEN5Y2xvbmU1IG9ubHkg
aGFzIG9uZSANCmludGVycnVwdCB3aGVyZWJ5IGFycmlhMTAgaGFzIDIgaW50ZXJydXB0LiBUaGF0
IGlzIHRoZSByZWFzb24gd2h5IHRoZSANCmludGVycnVwdCB3YXMgZ3VhcmQgYnkgKG9mX21hY2hp
bmVfaXNfY29tcGF0aWJsZSgiYWx0cixzb2NmcGdhLWFycmlhMTAiKSkNCg0KTmF6aW0NCg==
