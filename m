Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AE3B0AD3;
	Fri, 15 May 2026 05:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821645; cv=fail; b=UnhZz6OzqVaiwyk8tc3RPyka5VODCWjjwG8eZc/98wfvG5rzPxTrirzj8T4/xOJjJ20R6LJ+eeWL0bAohJUYu35gbWRG3/zdXDPTXfVEwali0o0S98o/MBHVF9xhrAyTZysv30YLqxiXXggMKm1JGGRIdp6eCc8NzQavknTWzR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821645; c=relaxed/simple;
	bh=Pt2OJMxSCdx7FfDV8CFW+Nxnh6k0doj7IJAH+//KWmE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V0ilyf0lyXxwYt+Z01x/qOkzmLV0Xb5EwDcN2edxHil+2IVNIf0oXWl48OxmeLauL+qn8hnilPjH8lTzBMFSgD2Uj/R+rR+33JMIga/awhJwM+ezCrDkJ83c5cxUgtkXniHihdADn/ncvCgYpRNBkvGWmK8j2dsonCp6ljI/G+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=k2tupvDo; arc=fail smtp.client-ip=52.101.62.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="k2tupvDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQW2Luls9iwORGo4InrdHlPsu8uOhl6NTALBez+I1u5XhhXkKu+CaDOanfGePx7KdYRUA4wihzbeWnSSp5R7HwbWdNKE8N+tiV/4Fkvk+nCgmE9W2MJ5SMqqrxx2kQPLBhVgNNzf7gS/0zvYz4yxg0uKHfS1CYNePjiB8w3ZeDlZv+NbeN5LY7RVdo+YqGcPAkb4P95M3CFbvWrdBhU3crMH7OE4UOs/3ejVbKTrr7EpOvgQ94OK5bszXqs9OTwRO9ZKfK25X7nu94BpqrV5B7akAEs7EcIbw2UhAUVdhsZHIki5GgGk6J7pRSrKuQnkERZyvophKEYlyR1kSzl/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt2OJMxSCdx7FfDV8CFW+Nxnh6k0doj7IJAH+//KWmE=;
 b=giw+YSmfS1OKoQWVOiwr56IBuCWVU/HRoDlSmHfAn7SW552hcqmsT5qcgmQVoh4SuUd4xOXYRLuaMNZRxCKEmRnOktQHCNh+oL6aiUlJz7BdKuU8MIgoXiy0Kykg8ADQCfL3y2ZeZFeykYlW+eLhYSraRNVeyghp4I6lGvQAIs87PG9nECS0XgKm8orZyehcW/BkpXaeG6IRyqxMNuH2ulUsfUWqDt87cTJLPnyGlrBzMiX+W/BspM9Aa8JjOksAWkHm3r3r6uy1VyYDTnQJsBgDbIA9vJNKkSTzxZAhKlvNI/cUms3UOkH4CbYHm941dDlv6ym74qgEdAi9J2sF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt2OJMxSCdx7FfDV8CFW+Nxnh6k0doj7IJAH+//KWmE=;
 b=k2tupvDo/pzYjlkmupIO8hf/DjFQ089U4m/2uOLWkbJR8PO945pn7e/PFoCsgqe03tje+GS+ypJABKeS3cfUJW4BqLUK/ZRpKyfs4UbLyClPgmiLM/dX70tKeIT/Vrel27ZTRUbpQubOP5QIeyV8lhP1L6TKl7X6NQgBnT85P/sbk+iUTFjlKFDouLOpDfGIbXoaSj7QP9uerv462YrjhyLGCsXI3D95NTDVk4Bd8mXlXkA6DlCY6HJXMXMB2M0uy8qP9RdCZPGhY3QoqHrmyH+fEBmo+D932yHe2b19nkgEhNaujF2sUZ5174n3DlFkOEwNIE+GQrlDLg2fu9Ahog==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CH4PR03MB7700.namprd03.prod.outlook.com (2603:10b6:610:236::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 05:07:22 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:07:21 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Topic: [PATCH v2] drivers: altera_edac: Guard SDRAM irq2 retrieval for
 Arria10 only
Thread-Index: AQHc41NcpAoBmAXoX0mFuOxhs2EIlbYNxfyAgADEyIA=
Date: Fri, 15 May 2026 05:07:21 +0000
Message-ID: <3b83d71e-7f1a-4d88-bc10-6628f8a9a57d@altera.com>
References:
 <20260514034007.11541-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <055c980a-0282-422d-b224-4d65482c2155@kernel.org>
In-Reply-To: <055c980a-0282-422d-b224-4d65482c2155@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|CH4PR03MB7700:EE_
x-ms-office365-filtering-correlation-id: 82d14aa8-5629-4174-ddf1-08deb23fd889
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|55112099003|22082099003|56012099003|18002099003|4143699003|11063799003;
x-microsoft-antispam-message-info:
 nb9fn7wK6iwrMqGKzWtp04rdqAbiC54p+GtT/GNFRU52s/XA/UZBMYtJqWAOWJ3LnxWRIuZA4+s9Tj9RAaI/j/xi6sI9oKS0nDBg1l7L74JdXOd/wwmcf/pkN7E1orw8zW8dMxxIFpKsEVjK7NS10oUDnRITo+zRjUTXpgifX8ByU9AVbQgph9R5bPiPPXlCfAIrz+45x+Lm5y/LqG74749l/4DiQq1o06ySMFeA9zxX2LE7x0SRthviMn6xgxdYLwI9xRhYgAOrwf09HcN7wyLoaA4IdBTM051P5H3JYlrkD1ja1wBA/S1IowOyeZSW5MShjiq17nAX1Aoclx0+Y5t2IBzUH/KmrgWajDPTcwAu8fT8KHAvGagzbZOtjimI3/NdE7UHqCwwTWnNCZ/GEJOgUE1jPi9buBCO3SINkS7oo5DswRec85yCn5Q2/tUvoAY2v1vG9wjS7BESEEf7kdPM0uwup7l7r8TtX93pT7ZtbYExsUGPms5SaVZi+vwPk+t2AasVCHzBbfKTv5ZRPgzEMtjHEr5/ebYFT1v8xmKWyhbskc+VX+tBP8rfZ64ByqVi6LG3ZHeH0h/UC+N2Rngrkx/Pfv78ZZYYPHrzG7B8DiUZ6RSzxnsDIACX9XZU9501ZCsJ4X5DrOXBuFucL5pL2flQbIETrbN+3xoMMzvIuD2y7/SyWw62mZh314IR3HjWvLJydoVXKx3ZHsCvu6ZsplMpQEXZtbncThPiJRNq2vWua7E+jbQ4A+adBmkJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(55112099003)(22082099003)(56012099003)(18002099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWpLYVlvNzBOb3podXRKR0svSFV4UEttUmhYeFhvZjZMenlDR2sveGZFL3l1?=
 =?utf-8?B?YXRMWVg0dEs3b2FqV1NDd3htbVYydkQwWDE4em5uM3hjeVJyRmZpRXYxOS9t?=
 =?utf-8?B?YUxpTW00aVg1MlEzVkV5SWdseURhRTgxN0J2UHAxWU5YNkhsbzJqTnFhU0Q1?=
 =?utf-8?B?RGJ6Zy91VTc1c1BsWWd0eUdsNTl1Z2REeStVTitUell0OVBQM2NZVjgydVRt?=
 =?utf-8?B?ZUk2a2EyYzhmSGpvYS9aeGpYZ0p1OFg3bUNjT1IvODBsOFY0bEd2QlllN0RW?=
 =?utf-8?B?N3BFS2dIZ2QrZS8raStDTC9UQnBZT0hLNzNBSFptTW1BdTNmMzdmbFNwN29D?=
 =?utf-8?B?SjFWVERPcmd4VHA5RzlNalJjUzNoeTMwRHRDeXVzcDhnOFZDN003bzZUdk9r?=
 =?utf-8?B?WUlFT0pmUDA5SkpPODY2MDk0UiswbmIwRTBoQXE3cUxBZTdjNjlaMC8xZWVM?=
 =?utf-8?B?VHhOem5aR0VSRUhoUmx0QW9KaWtBaGVJTTV2aG5VWlF1ajg1c1hlZmVoN09s?=
 =?utf-8?B?UXlYRzIyaEtGQnhrWFE1emZsSC9wNjU2WHBPRm4rMmxVNWJHVDJPRWZWTSs0?=
 =?utf-8?B?NURRZDlzU2wyWi8vZ3ljT1lPWjk2NkttRzdCSGFsNjRjTnVjS05GUDZsUkY2?=
 =?utf-8?B?MGJ0UVhqWk9XZlRMNm1MOVY2cGRZUHczYTBwMk82eXJDZE9EZlJLa2dWa3VH?=
 =?utf-8?B?QkRhb1pxSlBEa0t3bm5WbXdHU0w1TFVlSWFEKzB5YkZJZUJKUXZPdTNFMTVv?=
 =?utf-8?B?aEZwUHFnTkVtY2hhSk52UUxhZkhwMDJlanRVK3FLWmpPbUFFT09kTUpYbE5v?=
 =?utf-8?B?U3VyQVErVXZYK2tuT3JtNW5PQ3owbURKQkswRVJMcitMWmlDVjhldFdqVGlB?=
 =?utf-8?B?ZTRRS3NJNU9hQWM5TThuYkNydmJPNSt1WmJBVVcydXYxMEF3VjlqSWpzNE1v?=
 =?utf-8?B?WkN0Wk9LdHp3K1ZDNjh6YlkvdG1qNXZQRU5XeHJkb2wrRU8vbEtMaUdQZlpH?=
 =?utf-8?B?cVBvY1l4QkVoRjV1aHRxSHlyU3o3ZHZtMEpLeUs1ZFpycUtLNDJRTVhMWWV1?=
 =?utf-8?B?Z3JqVnpQek96TFZrQWlnWkI3SjlONThZSWJRQStTUUY5MmVoUzFFZCtrSFZu?=
 =?utf-8?B?bStlbkh4MGtsQ1NKM0pHbnpna1E1SEUxZWhLQUthWHpOY3AwVFFPczI0U01C?=
 =?utf-8?B?Y2NoQ2xRczFya2EzcTZWaWZyRmVNTFgraUhQSEI4cHlnMTBIMERId2NHdGR5?=
 =?utf-8?B?TloxRmk1MGZNbW5qY0xYUEs0dHlkL0lkZFNHY0lHMUNzcTVKc3BJSmxZR0hO?=
 =?utf-8?B?QjM1L3V4dElRVXZRa3pEQytkUUQvY2JqUDdBWVAxekdjWmNNQXJBOXBsZlpq?=
 =?utf-8?B?Tk9zTEpGbElYU3dJN00ycmdNTDhhMm5mcFJXMjFzMGdUYVVMdWxmSHNsQi9J?=
 =?utf-8?B?aHFHYlVnQ1BHbmxBQjZDN1k2ZTlTR25pWW92N3JJcjRJQnA0Rm9sWGw2b2hG?=
 =?utf-8?B?VFQyalNDK0d1K010R2c5THQ4NTRHLzFkbFZjVXVLU0Y2UW9ub2E5ZmdPKzgx?=
 =?utf-8?B?a3QyZFBzdkkrZWk4dVd5MkNLa1RMSGdmaHNCb001NVEwWnQ4ZGpvU0pNREJ6?=
 =?utf-8?B?aWFZWFlJOGdpZVNJUkFuYXBKQW5uTG9zdG1rZDJ5ckIyRUlzOGdCYkdrZmRx?=
 =?utf-8?B?TU11ZWovNWdGdk9IbFU4Ynl0Q2pmc0swVnRwSHhGYVRWY2hmLysxSkZoWUxH?=
 =?utf-8?B?UEQwZXU3LzFyTjV5WC93bFVKaG1MMUs3Y2w2UklsQlp1SlZOWnR5TjRvY0pT?=
 =?utf-8?B?Q1ZDTW5zd0JJODRFczAwa0hIU2RqVHE3NGt6SG42N3pHM28rMDhwSXY0YUkz?=
 =?utf-8?B?VTVVQ1VDTGRSb2dUQjhRRWpvNmRBZHlCM2l4MmVwRjY2VTRnZUVRdnlKWnE2?=
 =?utf-8?B?b24rUndHT0o2TXJDTzRQajZPUjd5V2EzRzQ1amVicWtWTFVtSnN5dkh5WTZT?=
 =?utf-8?B?cHdydjZDM0RvSkJqZkZKYUtQanpSRXFWWjlsajZ3NWdQQVdoSG9EOGE5RzNR?=
 =?utf-8?B?VUNNS09Nc1gzaFlEL0VRU3pKTXFCV0RRcSt1bXpSMHQ2UzdVUFJYNDYxT0I3?=
 =?utf-8?B?eEIzc2xzV1BMbFdQallwUFdJWHZkR3l3cENLL0oyMTZwcFU3WjNFTU9nZklT?=
 =?utf-8?B?MmNIdTQ0aVlGYk8vckpXMUt6NDRBVkRRNHBXREc1ZnNpaEZNbkhuQjNzZWg5?=
 =?utf-8?B?dVVwUFBueTI0M1EzWTVHS2FkdVFpVDJJcnRBQzBGTGtibzIvUUxMckRLeTV4?=
 =?utf-8?B?VnJsb1J1ZHNBcEExTTNFUUJhdUNHWDVxUDl6K3JKQTdOMGdHYkg5ODFwQTAy?=
 =?utf-8?Q?GzfWvOXJfxU3u9LhesE7qNS6aHYVpRIbOXb1qZi448iWZ?=
x-ms-exchange-antispam-messagedata-1: D3tctVrcWKQAZw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <2086AD7746C2944DB0B0B8D4BE090C2C@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 82d14aa8-5629-4174-ddf1-08deb23fd889
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 05:07:21.8361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQ0OsK942m88YDVb8WFRoeF6HtfnP5Xp07OFM0Hcy4Q+AQDiTluEYqj+NKw6JmV3x2DcDZNa/O75GqSFXadlJxy4E0fGO6Sqa+3nC6zyLWJPv8cEptf35CKVuU5tgY6ahgDV3zNW5F5Cs3LDFP+HeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7700

T24gMTUvNS8yMDI2IDE6MjMgYW0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiBQbGVhc2UgZ2V0IGlu
dG8gdGhlIGhhYml0IG9mIGxvb2tpbmcgYXQgcHJldmlvdXMgY29tbW1pdHMgYW5kIHRoZWlyIA0K
PiBmb3JtYXR0aW5nLg0KPiANCj4gVGhpcyBjb21taXQgaGVhZGVyIHNob3VsZCBiZToNCj4gDQo+
IEVEQUMvYWx0ZXJhOiBHdWFyZCBTRFJBTSBpcnEyIHJldHJpZXZhbCBmb3IgQXJyaWExMCBvbmx5
DQo+IA0KPiBEaW5oDQpXaWxsIGJlIG1vcmUgYXdhcmUgbmV4dCB0aW1lLCB1cGRhdGVkIHRoaXMg
b24gdjMNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDUxNTA1MDQ0NC4xMDM4MC0x
LW11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbS8NCg==
