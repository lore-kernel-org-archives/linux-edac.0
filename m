Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021124.outbound.protection.outlook.com [40.107.39.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F487345750
	for <linux-edac@vger.kernel.org>; Thu, 16 Jul 2026 06:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784183796; cv=fail; b=u1WP+Pc0ccQBUciVC7ayUPkMZDKkyJJA6f4Zv1ubOgpA7LWA/942zTyvssm1cqK3BhnoEVGtKzj5ZExQqJVEtC/7IzzV7a119bI2RH1sZBjTuzZa5QV6jIexSzWH+YcM+FGyiXwfztx9MNa39OHghwtLCa7OtcsFpspOOkeN2AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784183796; c=relaxed/simple;
	bh=GgTdH7YBoLhMy37oL6dr3eOcJjv/kOzs0OlTxWRvNFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iv1zz6OQydi3dO3FK2c3MZxco2CJ3IaAi9opMkgigQOIi9rRq8IkoK08hXxf0FzYH62zyst4KrnMW5X7latkUS64R6IIyjUCZ+LR4dfquikwg/rycRqGKv2VkAn6nIYC/SeiH+fDBQ2VfUeyso3w528JW5Aliwz0RzRQvCeRJFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=SC3xfbl8; arc=fail smtp.client-ip=40.107.39.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="SC3xfbl8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH6dRvWvE7V2tgGIM4DwRlsI7NuGmBgZ2yfa/yajUN+wTlFD4hbFwQwMM5Mxdd3VTRgBZxeMezv/D7eJwX3SD0/29QnKUmaOH4eUQWXL9y0vrOqaYHpzsi9InB9RpqhLyQ6WzYOAbLoq/dT51TMYmBHhl+B4bLGqlopVwGZps7B9X1xjISMDvfvod5ViuPbUyHV6fetUlKo5wADetYI4hxP9EnWr5P+IdAHl2wYjL46hsTH/qkCXT8ErLipFnAjhgrIjeBnAOBOi97jivRA7QIynSw4fbkCG+ImrbtOjl2RzgZ8Q6opdR8tARdUkDPBDJCCt+wdHId45sk5WYlr4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgTdH7YBoLhMy37oL6dr3eOcJjv/kOzs0OlTxWRvNFg=;
 b=Ftv3Z2Xaxdp3eq/8ntRplMiyjy4uJ0ochgAxUCTctmh1vTOgNh9SY7IbweZKU8jvHQ60xB/+/YeiNsWgDP+8R1j1BgiB8VNffPXNKyIL6L/1FayDYJSHzTNbb3k6rSjhdlSnriJHn3Zhg+BG0SICKx14MHrgDD+PmrgOWFqf6w38Hcd0GY/njlcAgmHyQ/l1147EQULPcAGulxE5lvYZo1d/9LlUBi2pE+VCCbAJ1xeRiZ4AHliYtBeF6BKTboMLIarCeIwqd2xEwM1wphJTv/AvO61z9OdBf6jC773zxcSNNF57+dgZ6ys0ZerNII1WC1g+3WB/yK0KY+hcK2rtZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgTdH7YBoLhMy37oL6dr3eOcJjv/kOzs0OlTxWRvNFg=;
 b=SC3xfbl8n6NhzJJchuurflG055+93OK8wqTB1GaE1kuZsLIblpjLH1rsmuTV5ukZOpQlo0TGmGH543wZV4rOrALJ5ppevhjMwMwxUyCwIeLGso1PW83sncHHQKQ3UT+nSp23wfIKf18muZfDJIz+ZocUHS0yV+rJ/MUUF+xk8yBAQqqZxSJlqTmqFoIHFKGmPrYWYo5KzAGTWFIGDE374tIMdjRpQW5fozvoTAQ9+FLnnHyeZ4jgBQUZRfRDytJ81EJfJ2iZ5Xtm0cZIwTLFIuH+/nwhaxdbwXZ+xlhgxI1EqmYR6qqJKYtmo3QAgT79BmST2h+JfDwXOOaDgDFjOw==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by ME6PR01MB10645.ausprd01.prod.outlook.com (2603:10c6:220:267::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 06:36:29 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 06:36:29 +0000
From: Emba Consulting <hello@emba.au>
To: Chaoyi Chen <kernel@airkyi.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>
Subject: Re: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Topic: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Index: AQHdEDl8giR33UKdQUiabq1WYsVwErZvuDCAgAACOnQ=
Date: Thu, 16 Jul 2026 06:36:29 +0000
Message-ID:
 <SY9PR01MB108527C9D8DE65B937DF1C220A9C72@SY9PR01MB10852.ausprd01.prod.outlook.com>
References:
 <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <SY9PR01MB10852E9F6484A7DDBF3E8D898A9FA2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <0C9D891E25801298+57a8987c-8158-42dd-93d3-22d8985cce99@airkyi.com>
 <SY9PR01MB108529ED20B30732B9070D40AA9C72@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <1722CDE4641C6924+5f120e9e-f8c2-4209-92cf-b167e327a426@airkyi.com>
In-Reply-To:
 <1722CDE4641C6924+5f120e9e-f8c2-4209-92cf-b167e327a426@airkyi.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|ME6PR01MB10645:EE_
x-ms-office365-filtering-correlation-id: ccc71c81-2017-4489-b001-08dee30491bc
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|22082099003|18002099003|55112099003|38070700021|10067099003|4143699003|56012099006|7055299009;
x-microsoft-antispam-message-info:
 8JE7etFzT6PmFgdYXPRfd1ucM9in6suf1AyG4UodsbqSdblTXLrtBYzKOs3gQnaomXZdRmcrJejj3RgKC6ghcioPbOeSJBEzQo27YLHLGFSvyYp0sqk32s25DkECjVbjrWsaCLaiqLScwZc9qkd1MMSrcPB/aX+A8Z9TVYuiaijVcB2rtS4l/O3gok5PE1XdMtc9xCL0TYshINIFZMtduZ4/aVR5bT+B5ktrks5JykLBxgSpxyDK+DR1SV1vMf1l927WMWVTw66ScH/2E/xQ5p88hVifA5mKC0eucC0Q1EJmDxLPEslsR6EPGm4QSNbO3Au+pHPVTCoQqE1DEjTnnPKwBfoOEqxTDZg/knlaVBWJ9iz6iUx+PkTj1IE8+RlVx5kSb7WHR2wAPLbhKdoWCw1CPguBx/WSdAyyYpQw7h7nqsZ72lWqNN/jv6AzPu6EK65qaMNZdM+opBl2W4mCoAkIhJxA9V1SFTjuKxYUjV5w9CuYcBeiQoqzlAQe/4LHRjgGzy7Q0XvTzR1hNw+hMUCgqWr76LlADUZh/65aLTV+Pf/7zizfR8qT+mriDwsXAr3T2ML4dwRX7vrrpR/eYzLZkYjMaUbbSrYkKdSYcdD/zLiZiJK4gepCB6j31REHDIowWZuQqXqRh3gDhTQHvzPmzFHwuBsApsDZaKDDo52CmJXkw3ffActXE0IehSB1e6clEpEtfj/LgyXwQZHH+MKAM4ewgkItA5CPZoEgTRFDWBQ00Gi6QgVQl71TQzVx
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(55112099003)(38070700021)(10067099003)(4143699003)(56012099006)(7055299009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mOwukD1VFaTwRlVOpd5wz1tMNp6kQpxBY2FOz3UF24s3kberkqzrJCrzRoWN?=
 =?us-ascii?Q?u6Soy4c5tTaL9QkH2M0mWrfF244S/D3sVuBBBG+4ptqFJCnS+9KRXR+5W7tA?=
 =?us-ascii?Q?7t4fVDoTIlFcDy6xOiFxduPrzScuvkYHx7Tk35Mvd87DHqAlU1v5hZudnUFK?=
 =?us-ascii?Q?Pu2kNVw6Zf6ONc/3z1bGy8N8JpaqgWw27alc4CYzp0y4+Luw5NB0OV/XPuR8?=
 =?us-ascii?Q?PA7YyY1N72Ho/swwC6wiCzBHyYKQNmFxbElI4PfQGLug8WPsEMcJiOuO3fGe?=
 =?us-ascii?Q?n75VKeACTHE2UjC9iJGn2rbqNGZG4TQZOfT/Lc+WiqF94020mQzn26PKvIWL?=
 =?us-ascii?Q?Jc+kjTpeNvoPZ1knrvlAfspezHXiFQM0D7omTQYGiKOmA0bFUmIULm1QeDeJ?=
 =?us-ascii?Q?ybuCK7Mr4MKvFCvZA0NHYu9c4FcqUmHsR3x2CEnTNqed5mYus/fmMS1IecZF?=
 =?us-ascii?Q?yj2xxTgS8OQcv7OqB463ZqR9DlXJGFcoXCWpz724YqHs9sfvPxtSeWohL5mP?=
 =?us-ascii?Q?gtrpBYkuabf2hImv5SkWM3hwizLVvn8T+/F32fF1mbk4TFbuW+W9oqsd1K5D?=
 =?us-ascii?Q?k0z/RX6ZS1mzd1neRSXlubSphcVGO51xYNBX4ib/iwNI/W4UaQi0j3UA8+z6?=
 =?us-ascii?Q?3qEEyjCC2BMwI/DcNu6e/TMZwNFZHkbnYaM6oAXKXmXCm0BhVW01huaqih7v?=
 =?us-ascii?Q?nul29PkQkLwMyoFqg3jOj09kCxaZ8TTY6nUFGJYbxqw4hb7Lio2jsWv+G4uu?=
 =?us-ascii?Q?ibnuIlbO2kjMQWwiLITgVJZXw715ATsTPiLmJkscV7dFobf7WrhmiJQqy0mb?=
 =?us-ascii?Q?iXSEbtGzrTI3pYxknB1EMB0WCHP5NyfrSjrVQcgG7b3r/IIn338rT8p4Zg61?=
 =?us-ascii?Q?cAUtX1XhUmDr503WoL1+R58BqA9+ulVxMQ9rYeWxsUYnV7nz5YG9snRafVXX?=
 =?us-ascii?Q?pLMBkGPemKIy/Zjt7K/qm4Fspzpawanja6GAqtyJNCZXnj/aERXYsOkUS9sD?=
 =?us-ascii?Q?73+sDfufqhbR5FAlGQvyqr606qWSpUQ8Y8BMzQ6yHjyI9lh9ClxPStbwxTDL?=
 =?us-ascii?Q?E1C7ogres4DG8wKOMLkFxzSmxREhiREEHAayw7KClIRlpzhAgfnutMkBkIjQ?=
 =?us-ascii?Q?BTjgKFgV9ShrM/NQaKkraix/aCYZ2DzlbVFLrD4t2k5pUK3yA6wjbdPDRTfC?=
 =?us-ascii?Q?6/WQtTjb3FI5v9mQHjjMtDUeDjEdmY53DzmoEK4bqSdjj2AJbhmUuSf0JmSJ?=
 =?us-ascii?Q?VUDqV60M7Tttz4I+R2Lh1Qdp4ppsQqz4qnj9J1whpNQ0NA7jNRwVgDgth51f?=
 =?us-ascii?Q?2b3m2LIshIXOfCkD5+0mXeTFMYdOTU3zdmSoRbcP/E/3cw2SLIqLJEcA9Ntu?=
 =?us-ascii?Q?3Avx9Q52dH7X9x30036qxpUFnRD8t5wZ1IR/C7jrL2UkWb2KDNHFS3Bmpam+?=
 =?us-ascii?Q?kDUrWnRO8WHeaDQoyzlPP5FusudJBngIeER06GNFO2a+rsPwKXmMv4D8c6DZ?=
 =?us-ascii?Q?w0u2njFOLz6MzwhwG4mww/bOCRCOzXznhDYZtXR4XG7p4oEu2FGJHKQiqBzG?=
 =?us-ascii?Q?P8ej94nj/opW0onod30fS8TsYUYiGy27CyE5CWJxvUp5GRhMVEHi+TNUg36R?=
 =?us-ascii?Q?ApAtMlpW2cAFnP/x9MVDVmJajfOC5i5BuOkiCzsGHHS15cpIbeSL4109FvT7?=
 =?us-ascii?Q?hAbk6SHXv4PLFbZwCj/3git0ePRzb+KxsEl34kx9N+vIao4/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: emba.au
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY9PR01MB10852.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc71c81-2017-4489-b001-08dee30491bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 06:36:29.7032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +IrEzaEtD4wEOsoXbfADGaVII+ex2UjE/MTEYNhYfKmE14jAr1l5mlZNfpgdvtBR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME6PR01MB10645

On 7/16/2026 4:28 PM, Chaoyi Chen wrote:=0A=
> I did a quick test, and it seems to be working properly :)=0A=
=0A=
Thanks - that's a second die and a very different population (one=0A=
32GB UDIMM vs my two SODIMMs) decoding exactly, which is good signal=0A=
that the MAD_DIMM masks hold across the family. I've noted your=0A=
config in the repo README.=0A=
=0A=
The resource sanity check in your dmesg (the 64 KiB IMC window=0A=
spanning past your board's 32 KiB PNP0C02 region) looks harmless but=0A=
is worth carrying into review when this becomes an ie31200 patch.=0A=
=0A=
> Unfortunately, my motherboard doesn't seem to have an option to=0A=
> allow EINJ. After quickly reviewing Intel's manual, I have=0A=
> essentially the same questions as you.=0A=
=0A=
Same picture here, then - the open items stay with the maintainers:=0A=
the documented ERRSTS clear vs ie31200's MSR 0x791, and whether CMCI=0A=
delivery is contracted for this family's out-of-band ECC. Happy to=0A=
write the ie31200 patch with a dedicated cfg (no MSR, ERRSTS clear)=0A=
whenever there's a steer - with your Tested-by on 7d1a alongside=0A=
mine on 7d1c, if you're willing.=0A=
=0A=
Thanks.=0A=
