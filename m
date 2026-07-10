Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF3C351C27;
	Fri, 10 Jul 2026 13:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689146; cv=fail; b=WSWw/z83XIqKM0uqbRMIINlzG0k7DLeeXXudgc9GbviYPXi3WgldSEUojCY6u3OrsTW/4wN+Rp4k9EeZToRk87e02uvPfH9nAiG99g6qLKEQhSkuDZzbC2IhVNFjVvRf4VhqZaRtCwDhYKQ6/NoEN2yKNTxHjBEVz7COWajcsq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689146; c=relaxed/simple;
	bh=byz37HXDi1qnMaAjDI447DkMj87eR1q2k/EUAZuU5w0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GbHXBQ4Zfm6Y5QUQZ3kDH8vPQ2iIucieiJ98ducH6aN/dsdtPwl5GsEbtbxlLOu0FDGVvXHJWesC2tUzZ4Bc0g9/yrGYKQZLucCyT/nXcLZBpIzNZdqnf4rCw11t7I3elA/ty3TbBMexxK5DOTEGdzOjCTe/aDEXLV6V6eyLGi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oMZxV78m; arc=fail smtp.client-ip=40.93.195.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oMZxV78m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnR0ZxbKrNnri6c9JJ2qwXNiaO3r8N8kJTy+z+BNA9ovH3xpuaBkmGhaQ4TqQIfIc1whJdKojsDiZTQTRH+kCN4t9dyatktWeHKqMH8siTpt3sfIJtbjMWGRjmjgESEeMYwHpxzIsrmlP3Br60dBKkPr1sther93njUL0Z3zqkQuJ2UuiOv3sKSH/NAD81bf0eWZivd/vF9SEL7EZqNM/OIP2uyL2pkeCu6cdlNirt8k4/UTXHOV2ceVZNp8WKwa8lEdu18Lsf1u/Lq26zGvGFG+K9XVgPINOz3JSCXpcdOAvTkEEP8aFTOBwVpM4mT6BJyT9YFgqrg5aqja4F+ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byz37HXDi1qnMaAjDI447DkMj87eR1q2k/EUAZuU5w0=;
 b=or6mDU4Y4LLCHA6UW1qArT7gJZr0iBVfpZolD+o8Wybq6CUG7mBOHJNYAJ5NjFSSAOUYIr6+lu7h9WNmmUCyjY3Usjvl0MfnltUOlodRl4MsnPE9MAwnpAkBSabRRFwvHkqZDBvgVHuH/PWwooiOOV2CEsDCAwJXJGHKI5hJ0xv/rFnS+Aann+arK5HKZvtZIpuuHubaBZBWjcJ5zY/ArrarrE0OH3QXbm82EksM7HaSDZIgKzEAZ/GRNa79bQED1KV8uc08XVhORLPMSG6y/BCs2DU5XjssMmVfokpWSjlYv0XwVC0X8es/dbgU78ixt7NO7sqiedhCBWmVJwjj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byz37HXDi1qnMaAjDI447DkMj87eR1q2k/EUAZuU5w0=;
 b=oMZxV78mDI/obN6LbH4ZWaV43ZQPEDIBG1zua8UTQqoypcy8JymyWlxWHMX3Qlcw5YufUi38Jpuxa2mRw6olBsy77YehggXk60au1n0SXX9wK8t4inFYBQIUapAHmL1OLRar79A/iAk9aFjMcHW2eZUcdmlEKpSMSDe8E/qRbfM=
Received: from DS2PR12MB9821.namprd12.prod.outlook.com (2603:10b6:8:270::13)
 by SJ2PR12MB8805.namprd12.prod.outlook.com (2603:10b6:a03:4d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 13:12:18 +0000
Received: from DS2PR12MB9821.namprd12.prod.outlook.com
 ([fe80::f91c:af1b:9bf9:7396]) by DS2PR12MB9821.namprd12.prod.outlook.com
 ([fe80::f91c:af1b:9bf9:7396%4]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 13:12:18 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "git (AMD-Xilinx)"
	<git@amd.com>, "shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>,
	Tony Luck <tony.luck@intel.com>, "Potthuri, Sai Krishna"
	<sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v3] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Thread-Topic: [PATCH v3] EDAC/versalnet: Report PFN and page offset for DDR
 errors
Thread-Index: AQHc4TH75qdjMJMT7UKxG3Ipk7O8hLZZQ3WA
Date: Fri, 10 Jul 2026 13:12:17 +0000
Message-ID:
 <DS2PR12MB98216A090070FB54A63BAD3781FD2@DS2PR12MB9821.namprd12.prod.outlook.com>
References: <20260511103529.1853270-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260511103529.1853270-1-shubhrajyoti.datta@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-07-10T13:09:12.0000000Z;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD
 Public
 v26;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
user-agent: Mozilla Thunderbird
x-ms-exchange-imapappendstamp: LV5PR12MB9828.namprd12.prod.outlook.com
 (15.21.0181.008)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS2PR12MB9821:EE_|SJ2PR12MB8805:EE_
x-ms-office365-filtering-correlation-id: 239150c4-8eaf-41ea-964d-08dede84de43
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 4HJAoNGXv+Mcj4ABBgrDuUsx2YcwnnW6yMzufgSz7ptr7ZaY6oMEqQqP7kE956v47jh6oz0VHBeWklzoTOFrCRJ3ULS8MJ5wH+udXh3BLh3N8F1pLIMW0bFwtM9e3jHWGQ85LaJ+W9780uWWamUTMaYByGCfVw+9zpzzgWG3z1PBNp0NXaSZJJYT8ke1EDXxyVvqIPBvTQCa28ZeWsrVYIPQ0bPcxMjW7DqwOI+Lze1eGUSEmGIGWgVwDkhCm8Od0pF8Yhd7Vhl1tZFecwret3/g4a0i/MSgceMSpRFdbzJMyG2mvMg1An/1n2eFtGpAnN0i9mVSgBVqI7rlv60dGnd0IDOYz2avfNci2fKCplWxwqigYzZIryXl42EdJoj4aF18j8J7fVr5krZpBTnGuyK6kgNj4ZxQCghfTDO4Ez3p6X0u4xXEZUSzLMfoPPvvphhAETBK7vAZNQ/qYSSXIIAAfwpkhl9CMWfGO7IRl19MZlvPo6f2sjbnGc1Ih9kCBy+39Ha85S5aS5DvYUz6S2gJvuIxYV5LGcH18Lh2as3liXJ0Suj4Piv7PqHCiXyySq5V5oMR7D5egpz7ifThpLylhj5MMhqQ6G1mpMp8F3M3NUx53bv6dL1Lo+oUWbITAIpLxbmn4Y+jhqPWwW4L9drDPYnG3iv0/FtH/zQKBR8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9821.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(18002099003)(22082099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SGVRR0tFUUdFTDJhQXIrNjc1dEMvUlQyb0NCenV2bHlteUgrb0ducnFWQmZP?=
 =?utf-8?B?RGJ5cks2NXBtaWdmUHRXdy81YThVWkwyRFRXVEU5bU5LMTRGanJINVBDdGpk?=
 =?utf-8?B?anRwakJtNGdJQjYvZ3E3WkprejZSaGdLT01ERkZUT2VFbjlIanFQSUhWeHBX?=
 =?utf-8?B?OVY5L3JyTnpQamxjajVIRmE4RGZQZ0tsSkZqSG8zRng5ampmeXFrMUROQnlB?=
 =?utf-8?B?NVA1Vk82NDVVc2tXdzVhSWNLVW1DVlliTDQ2Ry9IMVJ6T3Jxd2R0eEdKcnVR?=
 =?utf-8?B?VWxBaVUyNitWSFRhc1BFb09rQkcwd3ptWWdYWmxOM3o1VGkwRUFVVFlrak1E?=
 =?utf-8?B?WFl4aTlhNXh4ZGdrdnFpOTRXa0xmcVowNUZ0SzJoenZGZklPMTZyV0ZTMDFh?=
 =?utf-8?B?MGNsOFVvZGRiN05VUllML0liVmVoVk5KREtVUStSbUlKaFpKV29FRUI5TGhJ?=
 =?utf-8?B?OFowRnNGQVVYRlJ3U1ZjTzE0K1NBaTNkc2tVNlFCVFk4ZitTakFXSDU1dThm?=
 =?utf-8?B?ZnlLeDQ4NHRhNVh4TXdOYjRydjlERHdFVWdUeGNUWVlZeDdRZXFtOE8xN2w1?=
 =?utf-8?B?TG40QjlNUzMxcktTN2NjNGF0eXowT0FKRlpheUd2Wnd0RmdWdlBtazdvSFFq?=
 =?utf-8?B?L1lBOFhsZExUTTRjdU9GYmFRelFDL3YxWDZDV0ZoY3N6WlNySTJrS0xyL2FX?=
 =?utf-8?B?U2JZbGxUZVVrUDd6T1dFalZOdDg4MUh6OStGZklHRHloWExpVm1yU2NQNzg0?=
 =?utf-8?B?ZUFtdXdENHhiVFc5U3FjZTB5WjdGQ0xqeUtRWndwTkMzYzd6aFd6eHlxVk5T?=
 =?utf-8?B?bmI0VlRaL2ZWZndGR0xpb0xmMDdLaXgvSG5iYmpPcndnRjczUEZSN0ZxZ3V5?=
 =?utf-8?B?ZmhzaTlESW5IUDVaaUoyRWVYeHZGbVhFZU83YUdlM3RCT3dMNGRIeGp6Sm9L?=
 =?utf-8?B?NzEvTTFHUHpuUGw1MGVsd2FhQlpqUHpyOE9HS1VlNWV0MXc5ZXJrT1hHMWZm?=
 =?utf-8?B?Yjl0bU9HdVJPVGsrZ2s3T2xpWFpoT1ZwNFRCYUc5RHkrUUNyRWNlbDcyZjNS?=
 =?utf-8?B?VS9EalVVWXV0OWNrMHQvbWVpZkVJWjl3cXRoOGYvTlg5bmRUUU15N1ZuY3JT?=
 =?utf-8?B?S01IQWNldE1kRDVtZGtoUW5Cbjdua0JlL1pCeHp6M2ZhaGJUTE8wU1FKbkg5?=
 =?utf-8?B?cVZTNUdYajRiTGc0VGQ1RWZ1N09PUDBRT3IrcHpmMzhsUWV0bFJBemlJRFc2?=
 =?utf-8?B?RkNzb3lhcExVRW4rRkhqMlQ5Z2RFNFBpTTQ1a2dNS1k1Y3NjVXQ0MlNjaEUw?=
 =?utf-8?B?Uk11aTJFd3RuMk1VbHNZa1RoQW9wcUFhZGNVMTNETlByakI3VFhDYmRPNXRH?=
 =?utf-8?B?VVIwdEYvaDZsOUxOVkY2S2x4RndZaUo4OGJGdUJkWkQ5M2NwQ08zMDU2bW5z?=
 =?utf-8?B?bGxibldxWm1VRVZOS0k2SStpZzdFdTd5cCtCWnJuUkhKQ3hKSFQ2WU1JNzNa?=
 =?utf-8?B?TGYwM0FVeTNoNXR4RGM0NmN1d3phd2lxaG9VVFRuSTRBdHBva3Q5WDh2MjAy?=
 =?utf-8?B?emdrM2pFMVYyakpwRFltekJORTZGeG9ETkR6cXRZblhXUUFocmNiOENENkV6?=
 =?utf-8?B?SFk5U2xGWTRwb0hnaWUvam9SMVZOVFdmNTVvZTljYlR2cVZRM0Q0TktkK2Fz?=
 =?utf-8?B?ZXczaGhDNW5FUXJEYlRMQTJyanVSaHM4cmtLTS9GcTVtQ2kzV2dpVnJTcWYy?=
 =?utf-8?B?QnQyR1M0RXExWVZEVFlCdEV2M0J4WS9JdStzZ3lpdzJ3OWpQZHJMYkpBQTBz?=
 =?utf-8?B?S2dlNWhJeUxTMVlRSXlrWEtPaGRKQnZPTVR3QjNGV1lSUXZENmZidGNYd2JL?=
 =?utf-8?B?Zmt3U1daSUlUVzdxa1dzVEljVlg5UGVndFRLcDVyZlNHRktmWlhNYmZreW5k?=
 =?utf-8?B?ZUgwa2ZGQThiamJUSzJNWUVqRFdJN2ErSVF4YkxvYnVnN211TExzWjkzd0I3?=
 =?utf-8?B?VlVtVUZkSWJ4QlErMXZzazhCaDVWc0syWkFtY2twSWRtb3RBdHlUNGtxWC8w?=
 =?utf-8?B?ZGVGS0t6ZXBVaGtTOTBKTjVFS201eEEvK1JMQTFXai9xVTBOVWRFcE8zelFE?=
 =?utf-8?B?WWZhMm5sWHBoUi9PN2Z1ZXIxNmlMMXZiWHJGRjB2Smp0OTlGVlpCZGsyaG5P?=
 =?utf-8?B?VFdFbWRhZjdnNlFlSWJwS0JNVVBVMnpoUGcvaG4wR3BpZmdGY2ZYZVB2b2lB?=
 =?utf-8?B?NENTZDg2aExia2J1YUtCUHZyMS9yQnVHN0pkOUlObGhCdng2VDgxd3pLNEpX?=
 =?utf-8?Q?DjLuN2UR1u32JWYXHg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A27878FA1790E24DBC1A42E22592B792@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9821.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239150c4-8eaf-41ea-964d-08dede84de43
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 13:12:17.8975
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Coc/8by/AqD9p9gw8uLtEeWoMe8vgSpE1L63mGySGWPQOvZR5Nhyo9IOowmV42Djp9gKM0sRBzdpG346cxR9TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8805

UHVibGljDQoNCiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQogPiBGcm9tOiBCb3Jpc2xh
diBQZXRrb3YgPGJwQGFsaWVuOC5kZT4NCiA+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMTQsIDIwMjYg
NTowNSBQTQ0KID4gVG86IERhdHRhLCBTaHViaHJhanlvdGkgPHNodWJocmFqeW90aS5kYXR0YUBh
bWQuY29tPg0KID4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWVkYWNA
dmdlci5rZXJuZWwub3JnOyBnaXQNCihBTUQtWGlsaW54KQ0KID4gPGdpdEBhbWQuY29tPjsgc2h1
YmhyYWp5b3RpLmRhdHRhQGdtYWlsLmNvbTsgVG9ueSBMdWNrDQogPiA8dG9ueS5sdWNrQGludGVs
LmNvbT47IFBvdHRodXJpLCBTYWkgS3Jpc2huYQ0KPHNhaS5rcmlzaG5hLnBvdHRodXJpQGFtZC5j
b20+DQogPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzXSBFREFDL3ZlcnNhbG5ldDogUmVwb3J0IFBG
TiBhbmQgcGFnZSBvZmZzZXQNCmZvciBERFINCi4uLg0KID4NCiA+IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDUxMTEwMzUyOS4xODUzMjcwLTEtDQogPiBzaHViaHJhanlvdGku
ZGF0dGElNDBhbWQuY29tDQogPg0KSGkgQm9yaXMsDQpJIGhhdmUgcmV2aWV3ZWQgYWxsIHRoZSBT
YXNoaWtvIGNvbW1lbnRzIGFuZCBpZGVudGlmaWVkIHRoZSB2YWxpZCBvbmVzDQooZGV0YWlscyBi
ZWxvdykuDQoNCkZpbmRpbmcgMTogTWlzc2luZyBudWxsIGNoZWNrIGZvcg0KDQpDb21tZW50IGlz
IGFjY2VwdGVkIHdpbGwgc2VuZCBhIHBhdGNoLg0KRmluZGluZyAyOiBVbmluaXRpYWxpemVkIHVl
aW5mbyB3aGVuIENFIGFuZCBVRSBmbGFncyBzZXQgc2ltdWx0YW5lb3VzbHkgLS0gTW9zdGx5IGEg
ZmFsc2UgcG9zaXRpdmUNCg0KTG9va2luZyBhdCBycG1zZ19jYiwgQ0UgKGVycm9yX2lkIDE4KSBh
bmQgVUUgKGVycm9yX2lkIDE5KSBhcnJpdmUgYXMgc2VwYXJhdGUgcnBtc2cgbWVzc2FnZXMgd2l0
aCBkaXN0aW5jdCBlcnJvcl9pZCB2YWx1ZXMuDQpUaGUgbWVtc2V0KHAsIDAsIC4uLikgYXQgdGhl
IHRvcCBvZiBlYWNoIGNhc2UgY2xlYXJzIHRoZSBlbnRpcmUgZWNjX3N0YXR1cw0KICBzdHJ1Y3Qs
IGFuZCBwLT5lcnJvcl90eXBlIGlzIHNldCB0byBleGFjdGx5IG9uZSBvZiBNQzVfRVJSX1RZUEVf
Q0Ugb3IgTUM1X0VSUl9UWVBFX1VFLg0KVGhlIGdldF9kZHJfaW5mbygpIGZ1bmN0aW9uIHRoZW4g
dXNlcyBpZi9lbHNlIGlmIG9uIElTUiBiaXRzLCBidXQgdGhlIElTUiBjb21lcyBmcm9tIHRoZSBm
aXJtd2FyZSBtZXNzYWdlIGZvcg0KICB0aGF0IHNwZWNpZmljIGVycm9yX2lkLCBzbyBvbmx5IG9u
ZSB0eXBlIHNob3VsZCBiZSBwb3B1bGF0ZWQgcGVyIGludm9jYXRpb24uDQoNCiAgRmluZGluZyAz
OiBtZW1vcnlfZmFpbHVyZSgpIHdpdGggTUZfQUNUSU9OX1JFUVVJUkVEIGZyb20gYXN5bmMgY29u
dGV4dA0KDQoNClNlbnQgYmVsb3cgcGF0Y2guDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNjA3MDEwOTUwNDAuNDEzOTY3NS0xLXNodWJocmFqeW90aS5kYXR0YUBhbWQuY29tLw0KDQpS
ZWdhcmRpbmcgdGhlIGNvbnRleHQ6IHJwbXNnX2NiIGlzIGEgdmlydGlvIHJwbXNnIGNhbGxiYWNr
LiBMb29raW5nIGF0IHRoZSB2aXJ0aW8gcnBtc2cgdHJhbnNwb3J0LCB0aGVzZSBjYWxsYmFja3Mg
cnVuIGZyb20NCmEgd29ya3F1ZXVlICh2aXJ0aW9fcnBtc2dfYnVzLmMgdXNlcyBycG1zZ19yZWN2
X3NpbmdsZSgpIGZyb20NCiAgcnBtc2dfcmVjdl9kb25lKCkgd2hpY2ggaXMgYSB2aXJ0cXVldWUg
Y2FsbGJhY2sgdHlwaWNhbGx5IGRpc3BhdGNoZWQgdmlhIGEgd29ya3F1ZXVlKSwNCnNvIGl0J3Mg
bm90IGhhcmRpcnEgY29udGV4dC4gbWVtb3J5X2ZhaWx1cmUoKSBkb2VzIHRha2UgbWZfbXV0ZXgg
d2hpY2ggY2FuIHNsZWVwLCBhbmQgdGhpcyBzaG91bGQgYmUgZmluZSBmcm9tIGENCiAgd29ya3F1
ZXVlLg0KDQpBbHNvIHRoZSBjZHggY29kZSBob2xkcyBhIG11dGV4DQpodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9k
cml2ZXJzL2NkeC9jb250cm9sbGVyL2NkeF9ycG1zZy5jP2g9djcuMi1yYzEjbjEwNg0KDQpjZHhf
cnBtc2dfY2IgLT4gY2R4X21jZGlfcHJvY2Vzc19jbWQgLT4gaG9sZHMgbXV0ZXgNCg0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXgu
Z2l0L3RyZWUvZHJpdmVycy9jZHgvY29udHJvbGxlci9tY2RpLmM/aD12Ny4yLXJjMSNuNjExDQoN
ClRoaXMgbG9va3MgbGlrZSBhICBhIGZhbHNlIHBvc2l0aXZlLg0KDQoNCiA+IC0tDQogPiBSZWdh
cmRzL0dydXNzLA0KID4gICAgIEJvcmlzLg0KID4NCiA+IGh0dHBzOi8vcGVvcGxlLmtlcm5lbC5v
cmcvdGdseC9ub3Rlcy1hYm91dC1uZXRpcXVldHRlDQo=
