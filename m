Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795403661;
	b=suxk1sPwb/ArWhaVy/2UP6vx18Oc9YzcguYUml/PBcS51vqVBaIFUUxfF0RYSB76cgO6
	 dVrsG07auE2vbidvgaWrWg11WrpQGaN/oNCo5bwaQD/l14ojEgbsBdGR9rQMsKeVL79r6
	 Or6BnNM8Bjgc7cQWytpBdkNIA8BpsdcOHpTCrkClHzTvaWTxqGiZZ6mf3vCqGqcN3RIOT
	 tj6DfrVH/0VZ7uYsr1XGIdeBHecC9LJXF6Aahr+aLIyNIK543XdBXqTp+SgDDyxBPkZ4+
	 wte3Mygeze+MZAmFaE0T4lWoTM6dVoGBvhjNjRR4SYsWSyiNYN71rvMJsIRJEOIRl1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403661;
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
	bh=NMWCaBGWRHzNMvPJcQgFeB8sMc/Q3fX+yNxO8rYRQ6E=;
	b=ELvqFn+lr+F43vu8EXqk+sEzAbP1w1aEIuYdd5Eg2vedCVy/sGEXQDPkV2N6/faT/mfe
	 Qgad4GF/MThubc6kNGmzCnYby4G0tGXHyYJGuclJdiJJ16wpWketdr7KUNl8IcXauJSUW
	 Q65nd6o8GaP7qDCZcsZGrDWYN78NzP3uNFlg3b0+q2PnZYtSIrt8Fld7XS111dQCHRl6y
	 eOAjgau25aWwHoPiC9ojVPB+DIF4K0YvkNF2DnjoObuPstRrNRXNzPZ8u5O0mEakbb0ya
	 pvfFV25NbXOxxjbOfvwy+WQc53Kw4JWgST+Ztm9x2XiQMvkdrMd/9WAe5DM0VKV/naw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="pm9AM/1m";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.39
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013039.outbound.protection.outlook.com [40.93.201.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9026A606A31A;
	Mon, 23 Nov 2026 03:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9026A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pm9AM/1m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDJ0Ri9aSUAvZFYo1rAwQOYypxN7Re/ou8pYQBTzkFqiEG+GHz8iTDpAFSCakj/3WLlY/LTSVAvUUPe/UJSAP7SFfmZCaXXKgLFCzOJ4KpSj1SXhloAeN6KFoFCNAX9VAmI8hzT+NIF+fhKYx5XVSK0YZzsiQ8G6IfWdPyjBCS8jX8Ow8Jcm8gQLc2RlBUS95uwn77i640kvURsy5H5yiB5cV3XpZ8SbVvSO/yXamxI8EEf7sDsRx0XSOgzOKFQLt0tp2MQLACKTtIu93EKdxFWafO7A7GxdlXDoWBe30/T3gxEwrgJ24TL9RKZu9lGvLFL8f7DAQ1Qhn78E81548A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMWCaBGWRHzNMvPJcQgFeB8sMc/Q3fX+yNxO8rYRQ6E=;
 b=lNYl8Zp6djLkBdiTfQM7oqLKI5UncwZJqg0ky8uCTizehbFEOXg/sSj24gvdVRnbnpk9xkUX/858wTAd8gHm8biyY3KU7TtyVOdWIFJJmYSQh4rOlhleS/Zj0jMwN614lCV1TBl6icWaMbiIQQoEd24gzvQWepSRgZjfi/eAQRfUldeAbFbI7e8kxfnUdxLs1Wuj0PsXOjy44pXuOoRn7guGj3flATEfCOSTkVyufXqFyay9HcsumEGpmu3fVDvWnrE9hBPaybiTcslfhcQLwUjzx1S3jyTGHANbRA/BWBh+4rowScutA3WZ0UKk8FX7/90HOAZpjBP2WMm9PvxoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMWCaBGWRHzNMvPJcQgFeB8sMc/Q3fX+yNxO8rYRQ6E=;
 b=pm9AM/1m+SQNbA5uGKfntgjEnQvP9fFcSZd4CUxlBNvR7e08uS/1noucZ/+47NW6MarD6MSQ76TRqXrlw3l8rKwgg7tRi57R1kzxz+r6eh7RrrINRw+a+bcTeqKUlwBNKXkZLTdZUxBYoUODekng3Q8+0nSF2iuQIlRssNHL05HAJpBiAMRnEh5hY40ixhyDlp0LQkMrn3Mi6MDQQdEoOrwIXP5+8y9CpsRGO9hUwEsJA1kPB+uFADszV7lyx8dqDMyd8o9gMXGMUq/LJqSPO4DIR3f1aJrow9RrkS8cFJs5A8ALS7hLrZv3zOcToZ5QYUlEBdc3VD6COkAUic+91g==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by DM4PR12MB6111.namprd12.prod.outlook.com (2603:10b6:8:ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 03:14:14 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 03:14:14 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: "me@ahmedabdelfattah.dev" <me@ahmedabdelfattah.dev>, Borislav Petkov
	<bp@alien8.de>, Tony Luck <tony.luck@intel.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/mc: Convert the poll period to jiffies when it is
 changed
Thread-Topic: [PATCH] EDAC/mc: Convert the poll period to jiffies when it is
 changed
Thread-Index: AQHdeFLpZC4+PYNbtUC5l9IOPw78wrc6/5KQ
Date: Mon, 23 Nov 2026 03:14:14 +0000
Message-ID:
 <CY8PR12MB72906F22843B8CC496FFB5A9D1452@CY8PR12MB7290.namprd12.prod.outlook.com>
References:
 <20261119-edac-mc-poll-msec-jiffies-v1-1-fe329938fa09@ahmedabdelfattah.dev>
In-Reply-To:
 <20261119-edac-mc-poll-msec-jiffies-v1-1-fe329938fa09@ahmedabdelfattah.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|DM4PR12MB6111:EE_
x-ms-office365-filtering-correlation-id: 4305f354-c7cb-4012-71de-08df490fda4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|22082099003|11063799006|56012099006|261026121527099003|261102123227099003|261021123027099003|261021121427099003|261009223027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 t9NvyN53N66RkyRj0urjrlJjvPPFtpJwbwF7aB8qAw15uTTyuv7gUbVGvm+iNvcoY/nF9lXoc+DP76KcDRoBedQb33hLgkt4+9rXkQ6WXSwiE5W0d/pYqsbCKLV0LkAOSqKcBLeQ1COZGWVnvvi1AxfjllDGuydBWSGJtO1+s4ubF3b0VbNgMLsZipRxwtruGeEyClOuhS94iwYYn3g3w26d+EQnlLixoDlnOFyC5mvc/mzNweXSjiOizozFWo7wi5b7HxRFc8iD4bn7S/rVWlHJ3UQrbvyi8QhOlrWgxibTt/uG/YVzSPezMUuKUmTS/qxLWEzY2geVfCFO+klxjDac2kWNGQsnnMOT1brp1IWO0bUnUAfTWnBG2Nq0C/8mVYubohsW0+nWPfoc6k1vGALa9QsBLe4EfilJ62hD2wd9YHLWhpkUOFh9+Wmsg81w1XGyN+tHOlNyMVqPxnjBWa65mNjMVvuhUshKapBNxT6WsCvUzkSSaAT7JB4EkvhkFDQQW5XyyZmYO1qS4jWsuXOcmm3ABl/N8igShjkn0B51RYt7OoM90wbs2GnVmKL7klQqrHmAx9OsGF0v8R8hOM0RGiV5296KHlPiZyuQn8c5ra/ML8uubNy93PGu7ODI1iP2hEkVyyTG11xHmlO32xfDWZ1zAfPJun0JDYVw8aTcFu2WxTlNFevf09I2Sm6DdUMBKmvEfXRddt4l9QtoKQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261009223027099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2ZJeE0vWlN1a2p3Tm16dFpqNXNwcHMzd0NwbnljaGVWNE14T3hRNVFSVXor?=
 =?utf-8?B?VVlhdjRBRENaNFcwMi9OTXJQZzZ4WmJPcWV4cmVJMGQyUU5WUVZkZ3Q2T2h2?=
 =?utf-8?B?TDJwUlNOdy84VFhZRTRtL1JmcnRZNW1NaDd4bENHNHNZaEJSOERYdmRGdTh0?=
 =?utf-8?B?S3RXYWZ1T3ZJaU5JMU1OYUhXVHlZTjhjaGpxb3JEOG5vanpUQUR6MXh1OElL?=
 =?utf-8?B?dTB5L0N2Y2dYOXpMUjYvbGowS1MyUTBVaitXcHNRbDVIUGI2QWUrdG53WTVG?=
 =?utf-8?B?dDhNTkVOVjJ5SlR2VGN2enkwMjQ3ZUcxajhRSmdFU2RMTXBtdXlZSElYL3d0?=
 =?utf-8?B?clBIdjRlZkRBZmFzc0lsMGNsK1RsVVZVZGxTeFBaR1VtT3kzZ1d4ZjM5MVVu?=
 =?utf-8?B?dWo5eUh6aUdyOEsrRWhUVjYrNk1OVHdkRU5EMXkvbkZ5czEzd0pCWFg5Ly84?=
 =?utf-8?B?RlBtdFJ5WDg5V1ppbGUwUjBJWVFyMWdnQzVSWDMvWXp5NU1VOC9SMmQ3aFVX?=
 =?utf-8?B?eGtGNmk0UmtmL3BrSE43RUVBdnA4UW5RUEd0eTkxSWs4bGkxaDZ1QUV4YUdG?=
 =?utf-8?B?ZDBGMjB5d0JpeE9pUDRrNG4ySmc5TFJXQXI1M2dXK3R1aitWc3Nvc2xzNTBM?=
 =?utf-8?B?QkdTSHE5U2RRMFpzNzR2SkVyZjdaS1hxRkdNeCs0VmorYzhRSXV0SHljNzBV?=
 =?utf-8?B?YyswNWVYbzNBTFYwc3AxL3JqbFVvRkRqZk53UWo4eDhRUmVZeFRjQW1mcUh4?=
 =?utf-8?B?VUFSM2ZXaEUrRVkxckJUVlB0UGN0c0JsZk9Gcjk0Q0JaNStWNnVhZDlSYU9P?=
 =?utf-8?B?K0ZHMmpRQW9TS3RQYyt4TkxuOVJiMENxaUZPTXdRUzExMXlqV0YrL3NheERV?=
 =?utf-8?B?c0dxWXNmbUk3bHVUYllaMWx5aXVxdisvWEMxeDVMRWxTZWxmQ2Z2QkFoaUpW?=
 =?utf-8?B?RW1hL0dGRzlMWlRhbnFnTC9ZcTBveFlYa0dUemxHRUdybEUrQnA3RklyV0Jr?=
 =?utf-8?B?M1l1ZWxUMWRScnFCQWNWK0tzdm4xak9sVGhzeXVkd2M5UklNUzBvMDB3SDhn?=
 =?utf-8?B?WDFjL0g4YjRGWks3dVNtWFV5VWFWUXFpWE5Mc0l2cU82Vklhak1MQUtDTlBH?=
 =?utf-8?B?Y3A4NGZnMWxxL3o1VTZRbVY4Uy9lbzU3YjVkWjVnbzZOVlpLcmgzd2lqaEIz?=
 =?utf-8?B?L0dGYWhQclg5SjNGOS85NmFGNjFBaG9mSCtJemFad1Vxbm4rbjBYNEIvWGhM?=
 =?utf-8?B?czdtODZNQUtoWmx6M2ViV2hTTzJTVkl4eW91d0t6cXZ0NE9iaEM0WVVIeVFW?=
 =?utf-8?B?TW5ndmVndXdLdDIzYU9uS1FLd1JLSzEwSVlQT0NPbUpBb3ZFVEJWUWNyQWtN?=
 =?utf-8?B?RjJNc3dxNEp6RklMU1VUTjRMMHZ5RjlPc3cxZ293N2JNMzBVR29EMjZTTmhF?=
 =?utf-8?B?ejVRQTdNcEJDL01rUXRNdXhKcWNLbnBvbDhzT2ROeS81SDR4MS9idTRVVUxO?=
 =?utf-8?B?dlEybGdvRDJtRndWMWhQZjF6K1daK3pEaWZ1TzdkbWpNRzg1d0FyUHJIWU5Z?=
 =?utf-8?B?MCs0UjJUOHBiNzRzck1rckxRd1hmeUpUYk9GRS9uYlVQT280SU5TNWJGYWhM?=
 =?utf-8?B?V0N2U0h4a1RqMGZuUllkbEMyN0pKM0FZaFNpSDZxZTlXL00wcTQxSFNkNXJk?=
 =?utf-8?B?aWhWc05oZDNyci9RRFk3QzRPTUZzeFMwU2pOSG5NNHpnMTdYaU5KeXdTckF0?=
 =?utf-8?B?a2RoZHFXYW53RDVsWHA1U0VtTDdtRVY0NjFwTkY3QXBsczRNaFJwMytDaXRl?=
 =?utf-8?B?a2F5dVk1eFdzaFVpVmdUSE5EVlNFNGVpaUtxT2RsamJESlJMUWM0MlB5V2Q4?=
 =?utf-8?B?QnMwZWZRRGlpYWpjbEIveWwxcE5QSklQbVdUT2tPWFl0ZDcvdmU2Nk5lZld2?=
 =?utf-8?B?TjRaZ04rN0N5N0JDVm9rWURUbFA4SHNYd2FUWks1LzVGVVBGVXUzUmhHK1gz?=
 =?utf-8?B?Rlp4NDgvQWtWZ2wwN0tYYmdNNXpyVmhVZG16dE9vNUtMbk5DeTcyL20wMVh3?=
 =?utf-8?B?Ky9lQnpJMXdGdHJPQzI2V1VxRVBVT2NxT3ZvZ1lOZkpTSDA3elRWRUk5eEF5?=
 =?utf-8?B?ZXhQZVhWTUV3MkY5RnA5TEYvNFVUQmRBeHJkUGtoNE1MOGU4bE9WN0VwSFZB?=
 =?utf-8?B?SlcvSTlWQzVjT1g5b29JTDJBd0FwUmtqNENvTUMvbWdWMXAzV2t5THlJWkxr?=
 =?utf-8?B?VXh2eHl5NXV1d3JpUWlPNk5HUnhTZ2t6NGloNVJRcklTQzNyZVBMR2llcXBE?=
 =?utf-8?Q?zYZDlzVkzUtagRBZBR?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4305f354-c7cb-4012-71de-08df490fda4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 03:14:14.5710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixyhIEf2WMmkusiCV4cSvleeYIDsLTsbsyodwBpvvhTCb6mLGzZlwWuZf+rNBohxVkkjDhqQ6qBJ2xqS9U03nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6111

PiBGcm9tOiBBaG1lZCBBYmRlbGZhdHRhaCB2aWEgQjQgUmVsYXkNCj4gPGRldm51bGwrbWUuYWht
ZWRhYmRlbGZhdHRhaC5kZXZAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAy
MCwgMjAyNiAyOjIyIEFNDQo+IFRvOiBCb3Jpc2xhdiBQZXRrb3YgPGJwQGFsaWVuOC5kZT47IFRv
bnkgTHVjayA8dG9ueS5sdWNrQGludGVsLmNvbT4NCj4gQ2M6IGxpbnV4LWVkYWNAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBaG1lZCBBYmRlbGZhdHRhaA0K
PiA8bWVAYWhtZWRhYmRlbGZhdHRhaC5kZXY+DQo+IFN1YmplY3Q6IFtQQVRDSF0gRURBQy9tYzog
Q29udmVydCB0aGUgcG9sbCBwZXJpb2QgdG8gamlmZmllcyB3aGVuIGl0IGlzIGNoYW5nZWQNCj4g
DQo+IEZyb206IEFobWVkIEFiZGVsZmF0dGFoIDxtZUBhaG1lZGFiZGVsZmF0dGFoLmRldj4NCj4g
DQo+IFdyaXRpbmcgZWRhY19tY19wb2xsX21zZWMgYXQgcnVuIHRpbWUgcmUtYXJtcyBldmVyeSBw
b2xsZWQgbWVtb3J5IGNvbnRyb2xsZXINCj4gdGhyb3VnaCBlZGFjX21jX3Jlc2V0X2RlbGF5X3Bl
cmlvZCgpLCB3aGljaCBwYXNzZXMgdGhlIG5ldyB2YWx1ZSB0bw0KPiBlZGFjX21vZF93b3JrKCkg
YXMgaXQgaXMuIG1vZF9kZWxheWVkX3dvcmsoKSB0YWtlcyBqaWZmaWVzLCBzbyB0aGUgZmlyc3Qg
cG9sbCBhZnRlcg0KPiB0aGUgd3JpdGUgY29tZXMgInZhbHVlIiBqaWZmaWVzIGxhdGVyIHJhdGhl
ciB0aGFuICJ2YWx1ZSIgbWlsbGlzZWNvbmRzOiBhdCBIWj0zMDAsDQo+IHdyaXRpbmcgMjAwMCBw
dXRzIHRoZSBuZXh0IHBvbGwgNi43IHMgb3V0LiBlZGFjX21jX3dvcmtxX2Z1bmN0aW9uKCkgcmUt
YXJtcyB3aXRoDQo+IG1zZWNzX3RvX2ppZmZpZXMoKSwgc28gb25seSB0aGF0IGZpcnN0IHBvbGwg
aXMgb2ZmLg0KPiANCj4gQmVmb3JlIGNvbW1pdCBjNGNmM2I0NTRlY2EgKCJFREFDOiBSZXdvcmsg
d29ya3F1ZXVlIGhhbmRsaW5nIikgdGhpcyBwYXRoDQo+IGNvbnZlcnRlZCB0aGUgdmFsdWUgdGhy
b3VnaCBlZGFjX21jX3dvcmtxX3NldHVwKCksIGFuZA0KPiBlZGFjX2RldmljZV9yZXNldF9kZWxh
eV9wZXJpb2QoKSBzdGlsbCBkb2VzLiBDb252ZXJ0IGl0IGhlcmUgYXMgd2VsbC4NCj4gDQo+IEZp
eGVzOiBjNGNmM2I0NTRlY2EgKCJFREFDOiBSZXdvcmsgd29ya3F1ZXVlIGhhbmRsaW5nIikNCj4g
U2lnbmVkLW9mZi1ieTogQWhtZWQgQWJkZWxmYXR0YWggPG1lQGFobWVkYWJkZWxmYXR0YWguZGV2
Pg0KDQpMR1RNLiBUaGFua3MuDQoNCiAgUmV2aWV3ZWQtYnk6IFFpdXh1IFpodW8gPHF6aHVvQG52
aWRpYS5jb20+DQo=
