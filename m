Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795085501;
	b=rV/v1HREFZJgNV4ELwj1Ftxg2MU2W4HtbOPOZ/PK2wnhJtJysndatq5I+/QiRWyXcMEC
	 pRsORocAaigzsZmRK/J9X/Z7F5krVq5ua+nOBNP0MSQ6qjfB7Y5/ksaaASHwDt5DJLLkw
	 9ah2hUSjfszN0Z2vgtpBEWj/6TnfsH0mxkSj7y0tmHNJJ3VhpjZCbTOBfq+mzs48YUvQE
	 1Fl3zNmZveII9w93wMYhXPKYLeuBmbSN5uHXQSGVIFVl87vHWrlWfd+sZAMTlB0HQsx1t
	 LTE34Vd31cXCzKvjyQloFWZZoZZww86OkHrkOqZ5me8y7pp4sbh1+RqCe26mpbvyNyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085501;
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
	bh=4rUCiPfu0VCVuftFA8VoOvkT/SL5OEBUX+UzZq4Z++0=;
	b=unOfH7tUq1kCcq1JurVRfGZBa02yEoVU0mpZLYvspMZHxDYnB62a7MiiQbYlSutn5FdK
	 Ou93lUfYF9leOUajsioGhnQ4AvTnGvMyfF5al9FBdo0TW+ZEz52w5iIuq1YEr2IeZNvJE
	 xhTz2ZOIHsoKFXLHjcD1OOeuBK/uCd7WZWUaiuBTtYo+cSWztcEfEMXY042MfVmCGHYDz
	 Y10MNnOGL/890Qkto0GPmRZgMcgGl/nTrvvmtlWRa1lpTRJBvLljSgXNxJoph5JekGYWe
	 07WuEO/JtHucZtQtc+wZkufLoqrJR3xhvNx+T7KfCmdRZ7MAvDGiXf98eEGQCYtNdDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="ZtzUv/UH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.5
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE5606A324
	for <linux-edac@vger.kernel.org>; Thu, 19 Nov 2026 10:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AE5606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZtzUv/UH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSrAQC7TmbcaHzuzJ3FWDdyxCBZw6nJsHxXy0ct3HFQxzRUc36Dg8DNL46MoN+e01ZHBl50WQXCqqu7QNWBgzGt7IHfajrQIe3xet821MgEujVRjPwceyp/dOJfJGAJyOmQ+44j8c2JXB9pIPqEYAVefBUTfO6/5Xi8rsKmbmlDxEallK+IVxI+tyfIt4hyjJ0bCu6fk1NAyNGZ2HlK0DgFQt9t8JdVcrsI4k90qNjk8rG30y7et0+O178MTBa2gkxPOwTvMUJVD6Q8ROAT+cZvIaqrWOy3m9WnwCg4T6v+L1dLZXj9iYSDVaPgjV3n9y1NUHE9jTA+YJgEzRd0GLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rUCiPfu0VCVuftFA8VoOvkT/SL5OEBUX+UzZq4Z++0=;
 b=bSUpeb2H52eaF9i8v1476ZMYWeMJql1o77NC96/o+N1al0Z3EmQzngXSx463I33MtZa9CuqeqtWEpP5vpQrVXVAq55Sx9ysJCxSEUFVKnKpbGQRlN3xMzmzwfCSeq10bPZteyNJh+GYzC9mtSVbWhFOVI+TR5s1S0pbMb66ESVlOpoNXW5ApQzcPyUj/5dUQxvBFUV1GJOP3/Y0m/7NDL37l7KPWqUAYaAHo8zIOri381EQiKejIvxxFEd/XCY5c69Wv5cKX4m913V+zYb1yBrh0AdleYdz0jRaGIBxdejJM4G8AoFjLQYnKC7ViL5qXFj6mM9Y0Px4T89aKDeUSAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rUCiPfu0VCVuftFA8VoOvkT/SL5OEBUX+UzZq4Z++0=;
 b=ZtzUv/UHOPl9NQLnTHa5aOz/W6sJKstvHtsRuLVRSL7xiC2dueu61LWa9Lc9tLkjNoMKZRZIPPL7igJTRxdOdJhMyS4hiVG0qKo+06Y8wEqgDkRW5MdbYSYd+Tfo7s8swHKrYDpkV9KM9MHc0RMVQHeUM9f8rhV+ToQ/noktpKMhjjVS95hDSH6qNkV+7UX0niSBokqDzpJljkaOe6LAvQyyZx6L++g6ZJ46uSNPzkVF6/XyTzKBTF6SfNECorfcWz6I7mfuMyay0xLNX7yLMlwWfBur89u8i6X2dvJtTyyOLhHd99xtVUdnBhh8j99VczV/PD9XBzrYJeEtHOlySg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by DS0PR12MB8365.namprd12.prod.outlook.com (2603:10b6:8:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 10:49:06 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 10:49:06 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: RE: [PATCH v2] EDAC/igen6: Fix error handler teardown on probe
 failure
Thread-Topic: [PATCH v2] EDAC/igen6: Fix error handler teardown on probe
 failure
Thread-Index: AQHdeAqFn4/ewyOszkeiiICKvMpBHbc1NOUQ
Date: Thu, 19 Nov 2026 10:49:06 +0000
Message-ID:
 <CY8PR12MB729088E96BA01CF453BC4C90D1792@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261119094334.3011176-1-haoxiang_li2024@163.com>
In-Reply-To: <20261119094334.3011176-1-haoxiang_li2024@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|DS0PR12MB8365:EE_
x-ms-office365-filtering-correlation-id: aac642b9-d668-44f8-2ed1-08df462abbbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|261022105027099003|38070700021|261021121427099003|261026121527099003|11063799006|10067099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 HgFrxkTklCEW274nzb5vrO0po5dIUSQbYDP4m9Wv7MURjOtXReB0wCICyJbCJ6RDVCIKnSHVmyQUo5QOiXwClk/WxyUph0v7tWPrp1dWRDaE2bNRGn/PWqGEy4uspM9RMe+Non7g2U8a4A0AdlSTfGzuc8rUAfkBCmxA7QY4x/r7hRgR7VIrFEkTjVpjqXWI3dkVuWT+5h+N8Phc83U04NsrHHSNE208+ehXvKVzO1xsNab3JX9jSRadHJmL7wuVetB9AlwZgoEAbOhozyteuapUH7eyH7plT1OytTV+/j8zh5YNsifwFzchNE98bd2bwHgto1iX9tbD6iCb/3IwUQLe0lR2cTupQOL3bew8ZiJPxO1MauqdU0HAnP3qAJjqLRblBMuh9f/Djya/2HYd+ErNo6h5wgngZiF7jLy5FaS0MxUJHMDVBVB9Gt9acUkrxbwnneUwz+O4HUi+a3/2T5a8znUyFDJ6G5AoGRFCOXmDIn+8BI1360b2shwEYBpcMxPRWBDv6FyHZ6HZ+fns9icSXiGHm7ppSQUzBKPeyt3Bs7bw56arHWUpmCymbfPIafBaN8dP5pwyezZ++w8qRojV4/zddRr840Uw8STqRfoGjjwU5cOHcSPm0Zmq0v2F+HEau3BzkgQCZq7ConXpdo2LeBVFpzD2BehekObzjAz1kE/6U5chNy8IbpX5RDjbfYz1esCFdi8toQnsi5o2A34uoNuZLJT0YX/FMuEavEA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(261022105027099003)(38070700021)(261021121427099003)(261026121527099003)(11063799006)(10067099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CH1x/fv4B43Z/IN10M3oLPzXxiQXuPstMjHJ5zoGN3EwA/iZHE79PVbIa9Rl?=
 =?us-ascii?Q?ff1M3IQ8OQEhK/C83kiiA9qixHEgvC90L+z6fsOSk4LdR6P4X123ikonucqo?=
 =?us-ascii?Q?lqg4NDyPP5Mtj7yOET2EdOoTuoIBRGRG3ihiCgFs+ROWTwvTyMxO8I+WPCkx?=
 =?us-ascii?Q?dzdLPltLKXS5r4yH/ChXebKewvxr0/oXnaQe1j9DwFRY3LYSd2cYNdHuyubt?=
 =?us-ascii?Q?CJPZCTjodYbvdirNeZ/oxWpd93MZzgtEqTXP3ZfL3Ss+pMirl0HZibpK0Gti?=
 =?us-ascii?Q?4IuvH5i2yjSj6pqTfc8JNVTerbqqPMAg30SlzpGBTGcJHzWMMUfTe71XaTWm?=
 =?us-ascii?Q?8iE90hxwibkRFqBw+XSvgnWdT9cH/ZFtqyq4SU1GkAZYa6IvPNHMcj1qrilE?=
 =?us-ascii?Q?i6qsxNVRoSLwU36kq5mZv+Hu+lVldba7kzEeXYNMOIvsTg4qYKMfDNuPFLv9?=
 =?us-ascii?Q?Gz1p6sMWcQoifiMmBVYeB3lwN5tNYUOvDGlkT10zKG6E0N6OZOjE7SPujxqW?=
 =?us-ascii?Q?Je3eYRWq9aCagiUxX+AAzcpujVoZv73+3+1FS251lCNyjLgN2bpGidp5RXkC?=
 =?us-ascii?Q?6zwPb+mNd7pY/PUIHu/nMTI5hE5OUuFbQfTFfDH2Si9+Tc0OIjiWF6E8V/6G?=
 =?us-ascii?Q?6Y6bcHSFXw6n0/3fygHU3YX12BCDPR5uMm+FED7/WML1TV1Qyf7usQ/+fuW1?=
 =?us-ascii?Q?F90409vezLgtlnO+Dnpofokaard0zeOBDnACgR1jiMrkby/THQxkdIrQ/7tc?=
 =?us-ascii?Q?/W+RhdorqcBO4vfYQitYTOnjbLoFHHMcgfsaqnkAF5fYqvxwTOgHEM9osoRp?=
 =?us-ascii?Q?NqVWvhAGJeFzjsKVnA30RiUudj6kFwJJ1jRv18s6Mu1iba+kRdkllmot/jmP?=
 =?us-ascii?Q?7MMr22PkPN6eAPFYH6kURsKGIEVa9/tBIPCPFIYdFRA9vdWFShk/5O9t33dO?=
 =?us-ascii?Q?RLcPoq3d10JOXkMt6exoZXisY1yMBsOzgE8PdAqkLHQP3DNR1XlEFxK7FDm8?=
 =?us-ascii?Q?nodQhxBdiuEOxNWVwuB0bSlOMHFAbnh7Q2ZLczJ/v2nyKKQHginkl3S2fWmC?=
 =?us-ascii?Q?fgE/qNYo2IuCbir0gfbS0O/gBXEMpx2FXb6ivyICuB6BxWzVUQTgeVzFAuDS?=
 =?us-ascii?Q?YXIoheD/vQc4GTCHIywSEhFlA9lETVHUov0znhMXsOs8++PAeGjrjTzx5U0R?=
 =?us-ascii?Q?CG/sJ6+cb9/Dzj2xtG73ehDMCDsP50VqUWjoyNz/JQfC09I7foIcOCoXsusP?=
 =?us-ascii?Q?3ul3+niXEpaNET4TJn8nH41ANlMq27h6ZQOTX2f0q8v+vkUnsiiBWvqW4cEn?=
 =?us-ascii?Q?PTeoN8iXg42ZtnMT1QxMr9OOQcLUrN4+D58Rb9sP2J80RwXoC1n4rTb67tjj?=
 =?us-ascii?Q?KAgvPacZextjDaD0YZoeqcOdXHDT/MbulRoHa47Jjjr3m6GtNq095QbC3AoQ?=
 =?us-ascii?Q?Z+UTerLz0JYARn05520giBpisz6YVFyi3rjsDWaLJRMa1AqfGC7l3qHV9Nbm?=
 =?us-ascii?Q?0aWQZ50UzAhxEhOxmlbvGvblO+lyG6xiZr33+LdAx0JF6hSmN4KmpmEBH9+7?=
 =?us-ascii?Q?FBV/Nyaw7ZSQdQPHzK3f+/PGC/lgcm8fnMWBcCE61TL+6bStk6U5qTFnff+2?=
 =?us-ascii?Q?E5+PX0ovimbQEDQWOXJ0mxQ9vBvfi2wn3hUAY5WgHnY/549iFdceQ/IY0+9g?=
 =?us-ascii?Q?ghXzFBBjhiGp17BB5FMOeZfY6StEbc5ZsOPq2slCZ4KVDs2o?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aac642b9-d668-44f8-2ed1-08df462abbbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 10:49:06.2097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/FbZaTVYUdu3rNa8d4gKt45dkgx1Fiz+ClbOm8kicHRx79bqg7UJGM/bj233W1XG1iU3wh69mSm0I18Q3hhhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8365

> From: Haoxiang Li <haoxiang_li2024@163.com>
> Sent: Thursday, November 19, 2026 5:44 PM
> To: tony.luck@intel.com; Qiuxu (Leo) Zhuo <qzhuo@nvidia.com>; bp@alien8.d=
e
> Cc: linux-edac@vger.kernel.org; Haoxiang Li <haoxiang_li2024@163.com>
> Subject: [PATCH v2] EDAC/igen6: Fix error handler teardown on probe failu=
re
>=20
>=20
> register_err_handler() registers either an NMI handler or an MCE notifier
> depending on res_cfg->machine_check. If enabling error reporting fails,
> igen6_probe() always unregisters the NMI handler, leaving the MCE notifie=
r
> registered while the driver resources are released.
>=20
> The handler may also have queued ecclog_irq_work or ecclog_work before er=
ror
> reporting setup fails. Unregistering the handler does not drain these tas=
ks, which
> can still access driver resources and allocated error-log nodes.
>=20
> Use unregister_err_handler() to match the registration method, then synch=
ronize
> ecclog_irq_work and flush ecclog_work before destroying the memory pool, =
as
> already done in igen6_remove().
>=20
> Fixes: 0b7338b27e82 ("EDAC/igen6: Add Intel Tiger Lake SoC support")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

LGTM, Thanks.

  Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
