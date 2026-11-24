Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795485802;
	b=xMcsz2gkenSl8LeKl88np/zQGO/0o1tliO24CI4ypJHtJmtZ+90nqa3RUXRnNXNbmuzo
	 F7oMYYneAN+GheC1be9w53FFpbNVgCqaIAZyT3152KsVAM62kYxuL2ZfH9icnJPwQpMv5
	 ++OYYMjEuZ6nGZITsUwV+De/3efAeHWUu2yMriSiuYXM1H6FJQNKVIqQaapAnGu7oXTN/
	 vQUpdbCumoAqCazoTm9/zWoHc5zgdSCiLR+jZNt+jwbCA8j5Vjkik1qofr4FrTVswDN6z
	 F3eJQPCw25M3TLpXNvN3TEq5JW319Jtw2GzlgmPIAimXZSmeHSOj2UtzoKl1AyMMNJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485802;
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
	bh=2HyluhvkcatqV5swHlCK5YWYhYERmSh1DPhOpnM7o9A=;
	b=LgkoCZigQh92NUX4p9l4ZAmyhbzezwv7pxU+jmK7/6ZFsckb9TFCV/K3jAiXgc3ccTmB
	 bMdVna41yfX0RTr41gmDlGVh3NW+/GK8GFBJ36VYEKM6D55DemzLndV3N0chSGvSiV8pn
	 lSFZk/SQp8JnXwdguAIF5VBmPk3eOImhuQt55MA0WVynpsCEwYb/SX9YOyDKc24X8QfgM
	 W0bUsoGRc1GUzcDGlOOb8Ll8iOXaVOSqbPrE3EFuMeu1Ko6VS2vfiH0n0np30l9XQT2t/
	 1y1HwM8m8RXFQlc0QaQPT6ekqpy8LElMJXBiQBhW6TRYc8RxSO5R5uhU1uQXMiTiaHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="G+LbLZq/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.55
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E36606A31E;
	Tue, 24 Nov 2026 02:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83E36606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=G+LbLZq/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXza60Lnc/hfSBb7ir28XsC5eayvYg9fMzFOM6dDF0z3gMGcW1N+3JsAGUS/OpTxhQgytmnBFLHLRoOaWBNL15kMuI5JZlGKLTaSxKXj//zHLppEvPj6TxiLgWfs4P9Z1aKCBvGNvIiDcRhESu1qDVh3sZ1vl/6/3owWJGlGA0yU4PMwC8ncTtRQjqC+Nv551+JdS/EFNDtEw6YiSKfetnLqMpbIEaPVmcfnmsP9JCLT2zpYu5qAu5i8rHofrqehtccLOK2ONqXqGyxU1ZYsfoyDiC32I/0xmlZ+wj5yXoAwPQv16QIto9ZrzToGdAgPjt5LG4/hKjp6gcCJX1uuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HyluhvkcatqV5swHlCK5YWYhYERmSh1DPhOpnM7o9A=;
 b=aQn06G+ZbcOGBNmkGbJqevIjDRrUL3ug4hVX8eTFuNaelDvrApNFGY6c2MAVNy5XRvF3CNl5zpivjTL+ZG/M263sRgiQFaPl3W/VNpCpAimdps9KfCZxMOZd7m0FhLGk2KeMLgqeoExVEJj/J9spUdwSA1ReHGuFK72AVDszLsqiTOAHp1pcbWVfIPutpCBi9wjihtzg/TF2xUU1QX/BuoaI5ialA4nD/etT3ss+YL9X+DzFb9yyHQ5vJMAYZv6+iHKfgNXPcbYvf2Bb0VkqZmWCNBhlPZ80A5ICUAk9KLG8dB2kFjWLQtFqiIqvAMKMAqOlISRwmmizMjkjLU5Tvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HyluhvkcatqV5swHlCK5YWYhYERmSh1DPhOpnM7o9A=;
 b=G+LbLZq/f/zyd1maT3rgAxt/13f0t3gG2Ui/8Zov2QXPOkM2E+5U4edbf9j2bFt7lpqYaUB1k8LzLPxv17HAXDsxfNt2pSQQZjvy8GhXllyGsuOwih3MefdU6kv/u0OV/9gMID4dNL2XXLkkA+3p9xDFjoZQav6JTT0j5b5bgpED0Tin5/+EFw0WMUkb9Wl9mx6l10Z53ikTWjzLSKp0dh7WFKtyR8IMDC1fbhgonUBjCc2sJc3medRhhusDcWwNP0LTF6oKVjyqMdC+JGmn2uvpFPnL20UybJAoXuh1yN+lvnlRdHyuZEz9KlNq6tXll0ickt6o9IdNBDXIRC3HBA==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 02:02:47 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 02:02:46 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: "me@ahmedabdelfattah.dev" <me@ahmedabdelfattah.dev>, Borislav Petkov
	<bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] EDAC/mc: Convert the poll period to jiffies when it is
 changed
Thread-Topic: [PATCH v3] EDAC/mc: Convert the poll period to jiffies when it
 is changed
Thread-Index: AQHde7IrkyqhYS7KDE+ST7IPL6aWELc8doXw
Date: Tue, 24 Nov 2026 02:02:46 +0000
Message-ID:
 <CY8PR12MB729072D1314C6AAAA367C82BD1442@CY8PR12MB7290.namprd12.prod.outlook.com>
References:
 <20261124-edac-mc-poll-msec-jiffies-v3-1-a377fda35aed@ahmedabdelfattah.dev>
In-Reply-To:
 <20261124-edac-mc-poll-msec-jiffies-v3-1-a377fda35aed@ahmedabdelfattah.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|DS0PR12MB9424:EE_
x-ms-office365-filtering-correlation-id: 192c2491-9328-4211-c9f9-08df49cf090e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|22082099003|18002099003|11063799006|261026121527099003|56012099006|261102123227099003|261021121427099003|261021123027099003|261009223027099003|261022075727099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 BwnwL1CxVc1mO7WXC9cbuLxbeLeHOHx5+KYedtcSd/XOWN02DjLhEu24zZHmjIGbOkQyQP55eAFzCXWXqolsN3fvzjfa3I7tT3V1Ov6bmBf5Pck479cpxfxrUdreIrLPdlvH3GoGr5H9VeBLhy9owqrKuTCbbAvfDhXn5f+Yybm9NSu1/5UDRWiPe4IOo+hVZyx3GKoNe+V5NYUP5KM7bR4Yq29Jo3MYHe++Pf+tOWuaKoxacOQrNRb9Say1QW6jEIaqwd4eEca+VtWA5AS3NGo3SN/AI5Nid2YOGMoz3tGhAdiWpXkPTwH0OfBIqcWHrm4iYDmixkPZdavPyWk09XHxxfx/qs3OzPyvEp5Gxgqithzt3HUR7MwjcivB6LpM3hyBfBVTgbMF+4aXL/sBAE8JwnTRj8h7NAqv9J/wGXdzMAZwRWSXShwWCResUnrmg/RQzxgYyLs/pSYkGWoSxyxfG1GOxb3Fh27uzYgeMjjDtZZE/HA8qKyZTAI5oG24a+O2CTkKhT9joY224voWw1/jMaDe8T5qB2iVBmXoBQgMIfoYDRYzTz/UgdhQ97ERUpapCY3J+V++QGUXGPPBgqeegWYhBI354vYSVAWC5+L3WUA22ZwHCq+cFt/kJ66vVw5psZXvsE0khE4/Gby2YcsVCpTtRSZr0fcjuM3Mx6bljESRnJ9z8wv//zTlcw6NbLh4aXZ94my9f7jTMK0vGP0Oep1MPnLLN0rzpC2zgb8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(261026121527099003)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261022075727099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SVVLdWcwMTFPa093MUY5YTFUdTUrZ05DWm91S1doU0pieHl0K2ltQUF5QnZH?=
 =?utf-8?B?cThWc0pWRklDTFBuekZJWFFMaTNEdzBkZXMxTThLaC9Jb045WFVDQmFPVmNa?=
 =?utf-8?B?d09sN0c5ejFrUmd5c0FObmY3WVhTNXJjMTN6YnFGSVMzYnlDNmxwWGdyN0Ny?=
 =?utf-8?B?M2lLdlRySVVNcnBXL0Iyc0V1U3B6bGNGdCtMUyt5K0NrbXdLT2Z0T1dWSytO?=
 =?utf-8?B?YUdpVThBaUFMR0JHaVVNSmYwbW5ramg0M1pNU2pReE9hUGxkVEU4MTV0ZTB3?=
 =?utf-8?B?bGswUzljUktoM0VZbHRBcjBwUk9yN3N5TEViR3VJWnJ4RHUxTFB3TWxpS2xH?=
 =?utf-8?B?RXdvdUFsRjhoWXN5RExiUzdJaGxjT1Z6Uk9zSUxIMVp1aXYzUGp0K0RiRmpS?=
 =?utf-8?B?bCtHVGo0S2NPeldJdTBkL3ljWElMN0xaMVJ6bTlOck4yemtXQjE0V0tFb0J2?=
 =?utf-8?B?WWhQUzlIZ0Rwd3dYbVQza0pGVG5rZlIvaHJZOG4yRmwzYUhuWSszb3czNVhk?=
 =?utf-8?B?QllkdHBsdWdRbXZUWGxxVWwvUm9iZEV0T0NMOTFtTFpFYTdUWXUwa2JOd1JF?=
 =?utf-8?B?YXI0NTJwMUlkVFFVVEhFc0t3TWZoMDErUU1sQmx0WDFMN0hrTFlGUFVuQ0N4?=
 =?utf-8?B?ajlsN1g5WThFVm5UR2NMZHFDemEvUkhpcGRvSTl6bkNuWU01dkhYbjJCTjVZ?=
 =?utf-8?B?akZCTVpFbFh4dWxjMTZEMFlQSEdZS0ZpdVlMazc4c1phUEpTMHFpbTRwNkxX?=
 =?utf-8?B?U2xEZnpGT2orcXhtVlE5ZE1sZEJxNXM0RGlRLzFZOXhuZmhJN0ZWNVA0UjJ0?=
 =?utf-8?B?K2I4NFhVd0xjQ0VXWiszK3I3c2RXc3kzaUFEdFg2UUQ2WFZaK0V2Z1F6cFJB?=
 =?utf-8?B?OG9PbkZaaFpOeXJXdzVnWlkxZE5UT1VPV3c3bXJNRlluQ2hpU3greUJGbXFK?=
 =?utf-8?B?NkRxc3hnNkM5OXkxTDB2RXg2eWxVRTdhNWhMM3QxZ09Lc1UwWUt1NTlTcnZL?=
 =?utf-8?B?anpiMDJaWXN0ek0zYnV3S05IVUFGWWoxS1Z1bVdZNGs5Y2IyejJYOTdac0l1?=
 =?utf-8?B?UzJuVklINWFMd256M3c2SU03ekZITzB1WWJrQTNxSjNtVVdoMVhRYjRGQXJI?=
 =?utf-8?B?MnVvR3BFQlA5S3p3dUZSc1ZtZ2VkRG5VWXI5enBDTnUwU2xlOVorYk9pMDdV?=
 =?utf-8?B?dVdPa1hjR1A4a3lSNUloS3QyditORDQwKytFM1R2L2NpUEJVN0pteDY2bWI4?=
 =?utf-8?B?d1Q2T3dPS1JUeUhkL2w2RHVMSFkwS1dDNklOd0FWNm5IMXM4ODhKK3VWZlg2?=
 =?utf-8?B?UGVRVG40dE8zU1FGYm01aUtNSjNhYnZUMk5ocXlCY2gra0FZN0Q4UGhGOTlN?=
 =?utf-8?B?aUlqSVNVWHcrbHdKNEJDR1U0K0gwSjV1M3J6ZFpoNmFDbmZPMUZhQVVZOW1B?=
 =?utf-8?B?Y2pxcUxnS2JuUjJGb3hTY0pqYXFRYVJnL1o4V3dtbXJFTFhvVnFwbUpWZGt6?=
 =?utf-8?B?bGsvU2hqOVZQYWdMalM2WUxneXlyNTdCN1hoNUlMU1hzR3ZXaWpRSnNMRStm?=
 =?utf-8?B?TENFR2pQTHJYVHptOW10cXdoV01zeUN6NGxoQXJCcE90RVhQbU5paXViYmVs?=
 =?utf-8?B?Q3ByTnpmeXBNTFU1bldsajg2TWJQMUFsSnBFUE53REtra284dXR0cDI2RGlN?=
 =?utf-8?B?dnVFUHdKY3c2QUpPY1JwQU1tN1YwbGRZb2JKcnp4MWVxWWt2WFFiSTZGNGRn?=
 =?utf-8?B?N1U5dzdYUlBWWFd2d0EvTlhuMm9zMTZPUmcwN0ttMTFOMUxkZkhGU2dFV2pV?=
 =?utf-8?B?L09RU2F3U2FCRTUwSkRqamJROGdXWCtHck9PVHYxVHZIR3U2L2s5eHVtMnlu?=
 =?utf-8?B?L0NLWlYycUlhK0ZzQXdIanczYnV5Rm9kcUgrbFRId1pBMlNndTVoS0N1NU1a?=
 =?utf-8?B?T0txcjhHL1lZbnVYSFZOdTA0amlYWC9RdTRYQkprcmYzNFJJVW5PV3NlT1p2?=
 =?utf-8?B?bjZJNmp6cXBnMGw0MmFOKzJDNnBhSERFUkl5ZDR3VFhJM0lvMFpqQk1Qb0FZ?=
 =?utf-8?B?ZXpyNDJCVTRpQzE4ZWt5c3lyajNsQWl3aUdralUwSmdFNTE1T3dQREovaGVE?=
 =?utf-8?B?Y0Q2cC9oTGpSejFuOTZXTlBVUFF2dDFnTkJaY3gzeFNHaXd0Z2F3VjRGd1Jn?=
 =?utf-8?B?MC9xQXFZTGdVdTJKdElGOTQrWFFpRk1FcE5lV1plcXM0NGlwU1g2d29JV0Vr?=
 =?utf-8?B?QTk3U3luaGxPcmhZdDNKWU9ISEF5Sm9STkF4cnovTWdGMk1JcFdmOGh5ZFll?=
 =?utf-8?Q?1CFI8RBSF3BPlJB4r0?=
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
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 192c2491-9328-4211-c9f9-08df49cf090e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:02:46.8212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HzERTh7I10lA69jYlxIR0Dzs5DtiSfRJ7zHdt9WEkXA3iZFmBRqBzqh2eI0H2yIrm8+mqdsY+bQSqgGwZwgmBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424

PiBGcm9tOiBBaG1lZCBBYmRlbGZhdHRhaCB2aWEgQjQgUmVsYXkNCj4gWy4uLl0NCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZWRhYy9lZGFjX21vZHVsZS5oIGIvZHJpdmVycy9lZGFjL2VkYWNfbW9k
dWxlLmggaW5kZXgNCj4gZWNlZWY1NTM5MTg2Li43NjJhMzMxYTU3MDggMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZWRhYy9lZGFjX21vZHVsZS5oDQo+ICsrKyBiL2RyaXZlcnMvZWRhYy9lZGFjX21v
ZHVsZS5oDQo+IEBAIC00OCwxMiArNDgsMTIgQEAgZXh0ZXJuIHZvaWQgZWRhY19kZXZpY2VfcmVt
b3ZlX3N5c2ZzKHN0cnVjdA0KPiBlZGFjX2RldmljZV9jdGxfaW5mbyAqZWRhY19kZXYpOw0KPiAg
LyogZWRhYyBjb3JlIHdvcmtxdWV1ZTogc2luZ2xlIENQVSBtb2RlICovICBpbnQgZWRhY193b3Jr
cXVldWVfc2V0dXAodm9pZCk7DQo+IHZvaWQgZWRhY193b3JrcXVldWVfdGVhcmRvd24odm9pZCk7
IC1ib29sIGVkYWNfcXVldWVfd29yayhzdHJ1Y3QNCj4gZGVsYXllZF93b3JrICp3b3JrLCB1bnNp
Z25lZCBsb25nIGRlbGF5KTsNCj4gK2Jvb2wgZWRhY19xdWV1ZV93b3JrKHN0cnVjdCBkZWxheWVk
X3dvcmsgKndvcmssIHVuc2lnbmVkIGxvbmcgamlmZmllcyk7DQoNCkhvdyBhYm91dCB1c2luZyBk
ZWxheV9qaWZmaWVzIGluc3RlYWQgb2YgamlmZmllcz8gDQpUaGlzIHdvdWxkIGF2b2lkIHNoYWRv
d2luZyB0aGUgZ2xvYmFsICdqaWZmaWVzJyBhbmQgdGhlIGFzc29jaWF0ZWQgVz0yIHdhcm5pbmcu
DQoNClRoZSBzYW1lIGFwcGxpZXMgdG8gYm90aCB0aGUgZGVjbGFyYXRpb25zIGFuZCBkZWZpbml0
aW9ucy4NCg0KT3RoZXJ3aXNlLCB0aGlzIGxvb2tzIGdvb2QgdG8gbWUuDQoNClJldmlld2VkLWJ5
OiBRaXV4dSBaaHVvIDxxemh1b0BudmlkaWEuY29tPg0K
