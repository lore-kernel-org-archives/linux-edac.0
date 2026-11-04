Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801175;
	b=X0HRsC+0mYyme1pv4IeHa/qpYOOUNOC3PIeaVgfwQLAdWBN+NRrmohyYPaIaxUGJ6iA7
	 ymMVnL2dxABVqNhtayWRUh/TQvZIYuxq4FCzlBsxpyZt5OjJbOxVKj1MjCxJDuKqNkjmV
	 NBWHxCXFv5Qze7SaWY5WXVdIzpzCvn5cjlUAvUEzvz63sIyxUxUIB0znZDn6ZVo0teS6F
	 OX49xo4d1bSWKgVWdubJcqxdsH0+eWW1cS01HmhjCIXrCCSxTE10NEGMVJvElNDFELO+U
	 ngzqbZYYh/VKt4A4eD3tYQsxnjJ2Rj1M985lbClt0hKsu3PJwV/Z/YvZSOHMbKHF2Aw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801175;
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
	bh=YxhvHOe+iv8a9e+Konqy0hPPp/4Xsay3LSrcs/D5XTo=;
	b=xWmjpQ2ufPyGpTceh08MbgnwiHqeHWN5c8fiSvBlhT+6OG1LmgvrB+bMupE2bPE2q3Cl
	 HCG04m1CgJQqhwoo2tNDxAodQ0ey8WGsaPqkXFmxN9DyT2ZP78v4fq/j1sQ1ZMYELYaQT
	 suG01TmnIPuhP88hPGRegVW2Q0lzG9aOqQs+5Id+h6JjX6lFrrOEiRYF+hy6xnpCx9xVs
	 XhGmSVyjbF/3K9IvJhFjjTDjbP8ERBiaMWM/yfXdM8VOLNPaLzcqTl0vxPBo3zwNB1A6A
	 djhPKYW3kCb98pZkhZENq3lXOjCAx5HDFBoKVG5Qv+nGNF60rifE7Z+K7dF2jVL0G1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OodcyLn4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.54
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD76606A32C
	for <linux-edac@vger.kernel.org>; Wed,  4 Nov 2026 14:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD76606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OodcyLn4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sz8QQECPNczrv2KmJw28E8hCZfKnSjRxuUDRK67fyUztRTay5h04+p2VNKAeyuO416hWphAfYeE/R3cm0E1CMCTZr93EjFR1VUwuw4LAymB1jEl/FTBG78v7968+H78v6128eowml6mhFtSa9qjlclFB1NmSbpR0rZWZA37IpCNHvshLkVIaI3fAtyZNeQ0tydWANNIpA92nHLGshph9JyZqo/YsAlPCxaxblaTDGSdm+W//IuqY6hyD5NKoXTJq9N4OB5fLVin7U1j4p1xONkM3INUi5/Ev4HWoWDxZP+mMIdx/AAJKm1gq0MPkwyXsNQSbTDi+g8MfJznjcFsytg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxhvHOe+iv8a9e+Konqy0hPPp/4Xsay3LSrcs/D5XTo=;
 b=UGl9eRkVbvRnwWYraS5w45g1Sop540Z2JhoMmnAVreNrGOZkRZ8k7Mo9XjP97nGhhEuhYxR2w1kc5MAczBidUOmR0Ykoz6caYr5kSqjI1CxB8d8dpiE1BPSOewA8e0jKH3+f/38PU4NDh0o2qikZSSQcP7DAO3VuLpHPp0XpHZbiBkaA2f5Mlfutpg2gSJly9sDlzdJRD2lwE/nFxbwycXhxgd2LT6W81NtU+d7+SzwLYc1XxiGZDXivdH9/+Q3JPHRdAOHtMTlM435C1yISieo5jyxpytVEpvNH6kTO6SuRHQgXIgTSMQlSBFHWLCtCLfSDXhDdkHdnyx22UXduzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxhvHOe+iv8a9e+Konqy0hPPp/4Xsay3LSrcs/D5XTo=;
 b=OodcyLn4fnTe2oOTV45+NjGzZaN+PxpE0gIVxVa1qlepafYUxKG6clGSDGOjek4+rq4wCACdDAT3w5Hqt2wvuZgzMQHejatTiR9jes3OCxLueCKddOLYHaC+0WCdHqhO7eyRIejqaOBX3PjDlkHC9qniz5TJ+DMSzX/P1PWVMpe7+PTA+afmRY1Ybb7JBPmN+DvTMGrzq9kQAxbc9V3oyTdpm4uJJ6A1VQ2+Pv90VjNddSTZGbAP+LIUwjOJWKuk3yAeEezG53RzFjfD2aeRc0syZ5A5YlygyCidR/2DTBdPyjclIlXrIYLZJaX1+wy7Nho/xoC/sh+6BZnucpzaog==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by SA3PR12MB995558.namprd12.prod.outlook.com (2603:10b6:806:511::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 14:06:13 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 14:06:13 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Wentao Liang <vulab@iscas.ac.cn>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: linux-edac <linux-edac@vger.kernel.org>
Subject: RE: [PATCH] EDAC/sb_edac: release the VTD PCI device on teardown
Thread-Topic: [PATCH] EDAC/sb_edac: release the VTD PCI device on teardown
Thread-Index: AQHdbA32c8e5Y3E+ikmZw3UhGSRcm7cd8PWg
Date: Wed, 4 Nov 2026 14:06:13 +0000
Message-ID:
 <CY8PR12MB72908FC963E5F22F95D9851FD1682@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261104033834.1567009-1-vulab@iscas.ac.cn>
In-Reply-To: <20261104033834.1567009-1-vulab@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|SA3PR12MB995558:EE_
x-ms-office365-filtering-correlation-id: f09fbc6f-55c3-4831-86c3-08df3a7cc8f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026140227099003|261022105027099003|261021121427099003|261009223027099003|11063799006|5023799004|261026121527099003|38070700021|261028144727099003|22082099003|261102123227099003|56012099006|18002099003|10067099003;
x-microsoft-antispam-message-info:
 URzAX5NHFkcslcPyBAfKGOf7aEsIY+p31fWlfzLVli+cLW3JcE75Sry3a/IZhipYKKuBTXHxJDjHJOBzOfZWWyJPSmmWJwHLpcQT1bxz/VWWOqKn3jHew78iM2fD96AiavatZYn8sktMNkkpuhz1Or5IUYSmzS68i72ZaeOhJSHsRI0wlYQNV+p+1pqT7Zt6NgBCURAQ8qqpalzoItM4sSILJ8b2Qfnz6n+Ey4qJARmr5tHV722YeEhRzhpfwJp/fDnY/pEE/399wBeb4TESTXKQEy/FeiJYMo9bX1JoDWNEbAQTZziaYEXCUAZmXGD3EABUc7voK79dmmGoTT6a65Jf2bTFv0AtEVpYKVp3hCGswFdJ2pekKSgLjvP9M4+zzdtyY5GKHuTa/zneroTFm7lGWRXiaKy4uTHbJnUBtIX6enRdtHfMr6PAgMGC1tNiEsKNl12hM+pBNs317p9tH0Yxm5BI2EzXcxxn538UxoKpkrOm9JSzSOMxKqfhGcSr2pij2Ws/Jp8NMzf9Yh7b9/Ms2PuqcT1HgMPgrSkCX003OrvEH1VoQBcKSXK1POiRwEvC2Fz4fJAhGiVCQSS0BFhlnVHqV4cCykre0XsHp4bIKw8siI3QqtIcdK8XPnewDsA4Qe3SmscN48enU9M5GJ1ZuhfAOYT1XK6lTZZr9K7crbEtf0vVrcqWRIoxsVurUMPWY9iRALmN5o7zEPiAA4CBzRv6upCLQJYReQyNj/M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(11063799006)(5023799004)(261026121527099003)(38070700021)(261028144727099003)(22082099003)(261102123227099003)(56012099006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p/IBVrQ31fVTtZPVmzpeckyZJh/2ogA1esw4iOPgDZe3wN4U5RTc5v3WLeAb?=
 =?us-ascii?Q?l39MaUVK3vb8QxD+c6DtmjRXCn0dMZMXaQZZLYsnlifV+BclzkOiY5rDLnMn?=
 =?us-ascii?Q?RqH1126oVVkA2LEO0NBvQMgP+j0Dow8WrEDxwZt+O6yYwg1PLISC3KO8UlDA?=
 =?us-ascii?Q?11AAYTfuWgqiFd2glUa3f3JyeNgMrgKbiJhDQVClVG1wtnnbBMMPInyLKl1x?=
 =?us-ascii?Q?IBQ7IiU1nCoKFwMG0pxbPGkohZ8WXeTxpq+ORUbinj0shD/4HPUV0WNmB58R?=
 =?us-ascii?Q?YpGqXK/jK3Jv6ODWulg+DSHClt/L5FavE5PbnXrg585MPuUW2xe062xr8k18?=
 =?us-ascii?Q?I0+3BKQFJE2AU/BmSqHBbxZzSY5bmcsNKKxirLfx2tLdTf6TpG78O6NBGWG7?=
 =?us-ascii?Q?rYP3xuOoCF3i9YDEiBQfjT+mKjCWfy41BYgs0bgACIvWNjS22jr4JxwosIc9?=
 =?us-ascii?Q?nXa/t1dizQCOfn78A1BtC4iZDlyiX0XH6PN56mfoZdJAAlXJ/nfP0gPvsRD1?=
 =?us-ascii?Q?DNMneW7mQEEmqSHUIL7kw1mdcspg9sZAYy47mAu/apfie8rHYuFGtMc/5W0k?=
 =?us-ascii?Q?/L+VZaXp4nLyEfZQ7gKBlefKnwlstqipaQFJihiM+RUR2j0a10yTDaJOmfYt?=
 =?us-ascii?Q?KogGgyhYQpgUmLh73mBDtJrP/DSzsFY5lunJKh8MEi0BIRaWz7d8SH16jHe5?=
 =?us-ascii?Q?HTrn6A2HP48d0SeYGpSIL9yo/Z9MZ/MiGTOePqCfwel/02YFWcixyBzfzSSk?=
 =?us-ascii?Q?+Bh5x3rA7v0DLoQjnEmXA+ZmK1NFQl/boI2mrfKhv2oSnAeXrB7eDlDlcjaJ?=
 =?us-ascii?Q?++Bfhpt9x2lF8f+rRg4AbphdIpeOLM6ln+tPAVa/G7BtAC+M2Ne5oxHe7m6q?=
 =?us-ascii?Q?y+23hGPxaeKeNHCPOZCXS7xvmq4a3yvEohXJfeRNKqq9uLvFrkKjPAGvbVN5?=
 =?us-ascii?Q?9VIWDw3W/LnPhmm4TaNwhyXXJo1Jcg12eVbh01bdOgocTqbYPvtYUebi4nOE?=
 =?us-ascii?Q?MYIaumIHrIjrqPrewTLxxRsaP6syVPY79CniOtNshNswpBx5lTAHTZYy2ahX?=
 =?us-ascii?Q?AO6WHccTva+fG9fR6JVrKTUNz0XlFyC8Zo6U4bj5X2OZcAgblidL80xDF/kF?=
 =?us-ascii?Q?KLKCbZJZdZa4lEwwyZVEkIGKQc+MbXJibY3SeXgDGBxtxqRt7UQnLcADV+Ut?=
 =?us-ascii?Q?u1kGyvoLt3DM5xyy7QqE5KOZT5whmVhUFo7G4JbS6aLnDKzecdfwQatnWyzz?=
 =?us-ascii?Q?gY+ri2vvN7ZrFLmzpjQCbXMr5gS7Ufr5TooURdsGxTGUkSXf7o+o8mGQAmL2?=
 =?us-ascii?Q?VSCjXdexf5hTR6MF+09fxOcHBqorztqn6hsYBQJ0tIT6ekHHg7LnsmSWWebo?=
 =?us-ascii?Q?QO3Fw82FSOwSlacrVq60MVcP6JSqqs+lI9+BG69IOAPDwmHHIY+Ld0FjpLGp?=
 =?us-ascii?Q?v/6Ok5uwdU/olI9etHd/QynkLInJznqVZNYtdCmZdqiIEAa2wHcLiuXvd3yl?=
 =?us-ascii?Q?MFZNwh9Llx7uGbU812wJ67vh6Kc3RJQoSH+TvciKM28IPWaaKd/XDlEzBDnT?=
 =?us-ascii?Q?HOhrMTzbbEB5+f5PWuUvTxjmPEYJFRwc70NuzcH5Tq4/yKVYqdteqQbwNpBi?=
 =?us-ascii?Q?DLYaf8D/L7hIIGi5bnogHNMJTWKk45ScMZaPkvbHASP+EvFFTDWsGoSoR9HD?=
 =?us-ascii?Q?oB/59UQQFQJ8LEtKx9eQYsBfoRVfGhDPWweJaevlv+njl2yD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f09fbc6f-55c3-4831-86c3-08df3a7cc8f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 14:06:13.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bUHeY0eA8CH7wSVRp44PwLByRdWzpkjovjD7SyPiduCtFgHirgYc31f/hd0x/4qp7XZ1jbmnnG7Bg9u/2u6iBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB995558

> From: Wentao Liang <vulab@iscas.ac.cn>
> Sent: Wednesday, November 4, 2026 11:39 AM
> To: tony.luck@intel.com; Qiuxu (Leo) Zhuo <qzhuo@nvidia.com>; bp@alien8.d=
e
> Subject: [PATCH] EDAC/sb_edac: release the VTD PCI device on teardown
>=20
> haswell_mci_bind_devs() and broadwell_mci_bind_devs() call
> pci_get_device() for the VTD miscellaneous device and store the result in=
 pvt-
> >info.pci_vtd.  Nothing ever calls pci_dev_put() on that pointer:
> sbridge_unregister_mci() only frees the EDAC controller, and
> sbridge_put_devices() only walks the sbridge_dev->pdev[] array, which doe=
s not
> contain the VTD device.  The reference therefore leaks both when registra=
tion
> succeeds and when the bind fails.
>=20
> Drop the reference in sbridge_unregister_mci() and on the error path of
> sbridge_register_mci().  pvt->info.pci_vtd is NULL on platforms that do n=
ot look the
> device up, which pci_dev_put() accepts.
>=20
> Fixes: 50d1bb93672f ("sb_edac: add support for Haswell based systems")
> Fixes: 1f39581a9a7a ("sb_edac: Add support for Broadwell-DE processor")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> [...]

Please CC the linux-edac mailing list linux-edac@vger.kernel.org

This implemented the fix I suggested in my earlier review:=20
https://lore.kernel.org/all/CY8PR12MB72909C59B4374AB917E1D99DD1B92@CY8PR12M=
B7290.namprd12.prod.outlook.com/

Reviewed-by: Qiuxu Zhuo <qzhuo@nvidia.com>
