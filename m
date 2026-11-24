Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795486810;
	b=FqIpihse7BwX/+qHoGEvhKB+YYCUTS1Xn/+7rxCIMiPB0CCNo9aDY+w0wuebT1dp04Fc
	 /KktvjzLW9n92b6Sn/ElF+QvvQIeSJ5nen6EGPn3equJmOm4rCWKcNMCX87CoiaKwBnec
	 vgfcUYjBPoI4infJjuvqf8Y/1QTFu+yzIgpx+1yz0wS4hPDPzLMHsUNxjTmH2i+6XUSlb
	 LnTrcVxJUW33wU97hIvBkyn35EAj+zCZpbfcnrelK8jtxcQhtOYFBHa3qVLNBFJvix/vg
	 EvN0hg8PpJruPBFGZ72h9RQ+VYvuMuunqVtqQGD2ZIrYrkAKOlKhVpqtL5Qw9cu5QMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486810;
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
	bh=0Y5bdZ9unX7BGxdSn2O/2REY3HjHBhD4kmi/RdTGvYo=;
	b=5p087Iq/K0Ie7lOXXjfdLyo3B7H8BJiwPhUZHdbEnRIzVEADjhqx1dRfGcLHVoXXIZ4z
	 B12LieoHTx6UN2ppPez6/DVeUsMm1icWxo0r+ovEE7t37AwaYql9bH0qC6q70RkT7jovb
	 j6bb8/0U3do7FkzBe9yLwemgoXT/+N+gBvopv/PgYIw2I1GNkigWfpqudG9qz833EjV/X
	 v935ktnUS2tT0q/C9jmcDdnmLYHDU9XuypYfVqyu+5ueabST2CfW94/ZS3U97zrT6dd6G
	 pgH9oGn0G58QkyTOPPJ/zqf678twNRlK+8Vw6CWc47mb6eTCIy9kGiQN31zS5aw8HKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PDAbGT3+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.3
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3624E606A321;
	Tue, 24 Nov 2026 02:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3624E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PDAbGT3+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hNv8ieqEgIkwCzpw4vyQZJ/+ThlKk/EIuTDCuu7f7Ci2WnqPzrfvIAtwl1eCB28+ztsYWQUNZ5J2tZczntyKdlD/HxH/kX5TVruuh6HG5se0r6ReprYni05JHidbaBwB91jS/jJJA3ZJkWRx3XMvImE0AfSeX97XgD5vwveG7ylkltaOlTBBsJ71wwej6W1aBo2p64JhaNvYx1HhlxxdXYCTHXoEohSQp10SYpbce27HSqKSF0BGoKxf0S5DLCdNugFwWYU4HG+XcV14fYQ717lOCb26XNeOqzB4gA1RdrsI22abMc/V8sIyXUgohgwSeglMXC9JBpwxevOCLSh9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Y5bdZ9unX7BGxdSn2O/2REY3HjHBhD4kmi/RdTGvYo=;
 b=Vd4XUHty8NtTk4y96AkNn8cUBJbSnbmhu2QKEm6UW6n+2yzCtXBvCEAyenE4iOXS5wSE44cGCNlqspgf2HyobBhf7xGOGEfOmwVN+U26js59BWID0s1k9QxI/Z7W8uhSpXlcYxBNQ7wQXHEBYuKdYK3HZQHc1U/9aC70Xld6iJdpdTSziGFqkc+/Ox71timjWWBSbv5Ee2Z7VyJVnPBy0/rwsHCs4+A82hx6Xu2KR+S8V7J6Q8p0V6Xdn5AT69Srpu3S/eMytdl1gmwuNur1M/rJ6ZtVeA2K53S6ekG2nc1dRHRdfgxZXZS6QMVJ5hZHCX+aoYxCtpm3RbNoV25erg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y5bdZ9unX7BGxdSn2O/2REY3HjHBhD4kmi/RdTGvYo=;
 b=PDAbGT3+IR7+ncrKhX8ZgL24l3FalNCqlg5trEdxCapl46GfDjJnNP/euwpNpmI57hCeZUehoZSgEEOyJvwKiNwVUL2hl3AtUf0OXWJKViHoP31h2DcsGitGznGs1jizQAiyW36hRRa/DSg1PTWnHIavAviQCCrxeDXRLryJ98pYlP/ey1dNU71oDQHQ28+J0UOdnAixE3VDoQCNBbzZX4S7RJSNYluloHnICD5GWibkIBpszZA6DHuuVpj4+fIs6px57EerpH2M2dKQ1B5qg0Uoh3/qYLxT2mxT6PiDoMn5HmaanT+2rS+Mr66lzFPFBg0QIOhcmnNN/2crCQA/jg==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 02:20:06 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 02:20:06 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: RE: [PATCH v2 1/3] x86/mce/amd: Fix bank lookup in
 amd_mce_usable_address()
Thread-Topic: [PATCH v2 1/3] x86/mce/amd: Fix bank lookup in
 amd_mce_usable_address()
Thread-Index: AQHde6Iwc+xip720f0662gkk6sFyerc8fQmQ
Date: Tue, 24 Nov 2026 02:20:06 +0000
Message-ID:
 <CY8PR12MB72905A0161A544DD5E1F39CED1442@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261123232701.1923094-1-yazen.ghannam@amd.com>
 <20261123232701.1923094-2-yazen.ghannam@amd.com>
In-Reply-To: <20261123232701.1923094-2-yazen.ghannam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|IA1PR12MB7517:EE_
x-ms-office365-filtering-correlation-id: 8829b8dc-1cb2-4317-6a44-08df49d174a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|11063799006|261022105027099003|4143699003|56012099006|261026140227099003|261009223027099003|261026121527099003|261028144727099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 q+xv6v9xykBmFWEEE24x/b+KgM2B6d7Y4Mfl0ELKyqtNPuazQulcxyO7OJP1JdbRUTSRUGsRBG0+gtWbDbjqjvVMhgOnJ2LzUW0kmbji5XlMr5nfGSCq2kEgudK5XcToUPpqmWKgbFQ8o21aNk0VScBm8eO46HyTCeJU9TxKmY/7e8NtF+Ms1YoWVGH1OiCt0DxSGP2WsutL61DR/FbzTTmfrEbErKv7Si97SBcEv5GxpVh2wq4pKEaxIWywwOy/FtyXW18Z4C6/bt+XaqkbAcsmfDgWHtnd/cWNm9fvc5LvZ7NtJwPY8mtMYFrvTJ8fUloP1idwMjF0qNsncZDgrKpHosA1bIOuTplZa6q2bmDlN8G0ZPaG2z6z5qVaeuNgJg2DtORuwShLb+DOSs7mvhzUrDdnZyVEtgc73r85Z9Ypl5Lb70n6OzRSVMLXfPds9BaUTyr56AFEpcxaX2PmR4bZ/sgBbQcQdrBqTzkHqNmRiAfRGwKkGDu1bLoCc/WYeYyYvrByO97VxXfC4uakkC4+BDga8iiAM1POzayYzufuJBP7VzLZFPVxe70fiMZocbwmIGQAKQ+QnPR6/7T6UhO+HkqbXx2n1B03KQFJ9OWy5gpsNm7nhUqZOmtBx8hGDc6m4eI+Xa4XV06u7IQqP2NyCn6gAMZ65UAGvqcc/oC0oTWueS/dHY6BIV2X1Pol1keJ0ieSYbDlTNFCbRXTKZiQGzM1JVjn4V27gIX46w0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(11063799006)(261022105027099003)(4143699003)(56012099006)(261026140227099003)(261009223027099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zbeAoQMjs9Im+PldWTD9kaN2nvInsRDHok9aTWU5ljfhH768WSxoNPoP8KEX?=
 =?us-ascii?Q?mpE/BEOZ6pBLie8QqgVCue5vkfUSdngM3QXLhQfHBLgPgT+GE4gO3PYMsdww?=
 =?us-ascii?Q?+hIL3UocJPvAlqf/xO2FrlDe+YcE7hiHiVMR+wZiu36KxtN0NuIrfanGNN4F?=
 =?us-ascii?Q?mR7kotHtBnM5F1nxD7Sx9aPXB4Q31/6RYpYgiJgFsDZOCSM3TFPbBCjpSriR?=
 =?us-ascii?Q?CqHSrgPe9rfmHQhYIwsv/KoQl5LsSFLJKfvAguvLmgA2AoyJui8gvbkyUSoY?=
 =?us-ascii?Q?r+jsoHeLpynGGSKXMeUGu1N5s1x7aCUmWapWbzvKpAhjroHjdqkpOiyDCxBB?=
 =?us-ascii?Q?czMg10XUCRfKNl1Y8QBg8xtSKhBrnxVw4E/IRNLjIlp8+JMVJgkHlzP1dAVY?=
 =?us-ascii?Q?APOsF/8WxV9I6C3CKX6ygwzfz2BrHLNeJ8TrxIc4ZN4/sQ2id7jHSzi+wpWh?=
 =?us-ascii?Q?naOXexHfQ6zcGZHF6ZkIPExPJN/DtNOL7PJKaBp5tYnEWQH92RbCJn5YtBQM?=
 =?us-ascii?Q?qZonCpLpYLJimSv3XjA9jLw2CC4YCEfpVcwX2tsIhTcmnoxUqXcU2p1U3aWi?=
 =?us-ascii?Q?09DQXFyI8ftpM0i9TKgmeCkK2ovlSaGmabc6SkhEd6qgL6jogKTJmXd4BF+/?=
 =?us-ascii?Q?/dhMIllaXwabBqATXJXxjx61QsyPuD6osAsq8hczyhA8yMDZXdfbwVXgzkjZ?=
 =?us-ascii?Q?y5r1nE32RsplNrciAeqmokUpHnrA/3y3H0A4bbbMDCB5p0l3iULYAd6ixcIG?=
 =?us-ascii?Q?6HGf4CK7jHZZf3Fcy1gbwHnKlaXLASti9LS98PyU0+QIfwmA0XCd9A0jtcp1?=
 =?us-ascii?Q?1MLw6EnazAC5g+/FeNfJj1FXRezubeY77lGIkY88cpxcj2Tf+aIeB7s7wOlm?=
 =?us-ascii?Q?eLL4QWwNym8deGv762z0zy1Jk+kl7h14FZ6kdtecDKgvA3nr+/MCmj7V0xMs?=
 =?us-ascii?Q?qDuhZpCtgzEYpaAyg7fHOXpWOaaUURFpAbrGButdRRISzmnyvqakIR3Sl268?=
 =?us-ascii?Q?d0CqUJEjFlziR3YLdITTzSGFxn8KQKkDTI7pv/1n247gJDO3phZF/2/lBhGb?=
 =?us-ascii?Q?nfsxkBVHuQIe46zgzgw0+sxd2H3zkg+b1rcy5WFYMnkLx7AMRaX8n2DX8aKt?=
 =?us-ascii?Q?jl+ONSoTiIF/wPJxvAIOR20Au2DyuWsFC9RbLIurvDYUBZFy9lWwdD6tOAGC?=
 =?us-ascii?Q?9P5am+vzdMYwpUZMsjY5hks/25W4J32NOrWYz51142IAuSTsFbqCSeAkYB6c?=
 =?us-ascii?Q?6/P+txLwDzyQbuq9Tg0aBYmRJq7IYMDrZi2sQHh5G4yurm/9y3MLdt8Qmmqr?=
 =?us-ascii?Q?++2M8/jypHG4zfDT011XyG6hT5obuBd58NZ45qUQHyIDScaybYC27TRp6Gtv?=
 =?us-ascii?Q?5YRvemrMVtZmHfmo4WGwq76+QPeimHUPT8oN5a8M8ZPxXcQSijp9zYvuDjzy?=
 =?us-ascii?Q?rB6UeV2fCmvRCeO7cskD0mUX+62Z3/W0hIgYZJO4pWOHtnjh8DxKdERxln9H?=
 =?us-ascii?Q?KyxgYbZcXP+hqfAp1+pUw5hP6OiTx7NA6MN++R4pvU8pQoUy++wNznwhl2MG?=
 =?us-ascii?Q?C8YPWQUcmJmGGTh8eRKdeauCVx7kIkXyEiYIDwRLKnQIAkqIqfDDNxSrum4V?=
 =?us-ascii?Q?Qa9OKZ0hOXwRFf5gRtSljvciSpoVjMws5WiLUYw5X+rv9kML00eBXMJcF8uK?=
 =?us-ascii?Q?Wg0THfBR6uS3YEiuLguBGmVM4ydQjb24jtQN1GJvbElMK5Ea?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8829b8dc-1cb2-4317-6a44-08df49d174a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:20:06.3446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKivjSv1lHWVPZ0CfSct/A4S9zg7eH/EYe5zSl+nykZpR+owrxmuukWyTfM/KFxNb6cr8zjFZNdaxtS/XVYebA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517

> From: Yazen Ghannam <yazen.ghannam@amd.com>
> Sent: Tuesday, November 24, 2026 7:27 AM
> To: linux-edac@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; tony.luck@intel.com; x86@kernel.org; Ya=
zen
> Ghannam <yazen.ghannam@amd.com>
> Subject: [PATCH v2 1/3] x86/mce/amd: Fix bank lookup in
> amd_mce_usable_address()
>=20
>=20
> amd_mce_usable_address() reads the per-CPU smca_banks array at index
> m->bank on the running CPU. The index is not checked, and the bank
> belongs to m->extcpu, not to whichever CPU is decoding.
>=20
> m->bank is unbounded here. apei_mce_report_mem_error() sets it to -1,
> which is 255 in the u8 field, and apei_smca_report_x86_error() takes it f=
rom a
> firmware CPER record (BERT or GHES). Both reach this function through the
> decoder chain, which runs from a workqueue on any CPU. Bank counts can di=
ffer
> per CPU on SMCA systems. So the read can land past the end of the array, =
or on a
> CPU where that bank means something else.
>=20
> Use m->extcpu for both the bound and the lookup. A bank number outside th=
at
> CPU's range makes the record inconsistent. Don't act on such a
> record: report its address as not usable.
>=20
> Fixes: 821f5fe4dbcb ("x86/mce: Add support for physical address valid bit=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>

LGTM. Thanks.

  Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
