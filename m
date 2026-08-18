Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021113.outbound.protection.outlook.com [40.107.39.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FEC37B413;
	Tue, 18 Aug 2026 21:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089115; cv=fail; b=Ed6YydD7EgU8es18ffgAK2XNq78CMRq5LfXZx8r08bhj4iPrRsuGZhntdzK+23x7frb23YecmVgQXg6Dsi8FdXSYhxY/+8lgAkrlEljaM9GKuGnSqSp2AjwKnAAR2MtlLcxh+MX298EyhGQuJI8f945iNSO9MeGeuDcqmTQMj7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089115; c=relaxed/simple;
	bh=xn+iNN6ik3NLvx9KPmzLEfOKb7etMEcVTLQGkAnlBZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OnM99kGF46Y+1wik1/szGC4s0x9Tp3ioDGxRKZo4EVaD20AhucYTvgVgM4qiaaTLOnBpi+zTBq+TSx39rhDaUd4sYOqzNPSYwsZwAOVug+uLcZuM0qhfmyXU0mM8oaiqcerUFk/DtwENnHq8hsjkK+9cd1am5W2fifMAVH1Uwvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=UjaVV17X; arc=fail smtp.client-ip=40.107.39.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="UjaVV17X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM9xkEKbUf3YdK728clkNVt8x5qVwWMJ5gMYDgYEVnASR2ulYyC4NM+KIlRksU1ajTY86cdQG7EZdnU4mwDM8iO5EKA7OBSob/YH+kll0d5or8Qmdem1Bo8lLxK+Px+eQVBiEJsJkB8Oh3t9x7gjgDHwkwXeC3H8Ts4fhCeOeDKbT+czFPZZeJ/oP+H0klKhEdKyxmcAD4ly/SRSwGhQwes/4EZDasU38Ys7kAF3e9uCcogPzggFM5ZviC0mqJZ6WiZmkQHDfKlnpG5o/Em/xZjs4fatbACfgQrxh4PpMKmbW8yonXzlxh8sa7bgvWKCy8WKlJCuDPTUwd/mYUTP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gm+NbyNW+osfOhUMvVga03pNxlOfhI1+BqFIgYE4npQ=;
 b=UmNQiuci6k98RET7j02aQ6NsudrZiFimoOargxfq9mCdJ7LXvsvpYhtlK/zyF8JBVnABfE8qyulddyW7fRHnxKzghs5D4y+hLN2Ie1cwmymynuV7BpZwmhyBZfQLXYNw6LQRk7CGRI9gNHV0OznnTKciMSXe+hjwOnT2xvk4eN949tsjgFN+7S2s1wEoWVJcW/3+7j1wP7LidkAqoI5f9KesUo5+giFFj4PBluW11yC0qiKSxkrPtnWZIrO2S+S8S9m9PdXkSFOJVYm7CFk1bEtL7w8CwQz0mLwhFx43ZQXGERIMIH4RzvMO1qDOjkzj4sCqCVOf+QT09c4wVo+pkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm+NbyNW+osfOhUMvVga03pNxlOfhI1+BqFIgYE4npQ=;
 b=UjaVV17XYVa5krcQT170ldxd3KJzG17otE931aGRY74WvHPy1YujzLL4J/3YObwyBL6qjD2wpLuACGluc7sKkBSkb7aKC4ZX4ptXdkVoInw6+SQJFOBERS7IMjiko7Pk6nsDSR+RpemYmtTqAAkGEtO2M7LF3FWxm0mqtjBlYn7PxO50eDKplvqoBtMCjvsuW+YExU0aoSyXVXrwJeGg6fPXxNZazbi8V5aofZVy/7XbjWins+KD9w6OENjU6T8oL1W/9L+SG54Byo+7H4TkyfcS6Poo9rjODVEQKHxfJFJVkQRjkwwI4+uInGqLhaCSv1sjKpbqWP6o9ErseKT5Lg==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by SYZPR01MB7788.ausprd01.prod.outlook.com (2603:10c6:10:16f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 21:38:30 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 21:38:30 +0000
From: Emba Consulting <hello@emba.au>
To: "jbaron@akamai.com" <jbaron@akamai.com>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "johan@bergstroem.nu"
	<johan@bergstroem.nu>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] EDAC/ie31200: Add Intel Arrow Lake-S (Core Ultra 200S)
 support
Thread-Topic: [PATCH 2/2] EDAC/ie31200: Add Intel Arrow Lake-S (Core Ultra
 200S) support
Thread-Index: AQHdL1npEyBQbA0pckSw2r/4RlBqaw==
Date: Tue, 18 Aug 2026 21:38:30 +0000
Message-ID:
 <SY9PR01MB108523E34784369A75E9986AEA9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
References:
 <SY9PR01MB10852F08D61253038C22D895EA9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
In-Reply-To:
 <SY9PR01MB10852F08D61253038C22D895EA9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|SYZPR01MB7788:EE_
x-ms-office365-filtering-correlation-id: acc507c1-1dd6-4fbf-680e-08defd710c1b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|6133799003|7055299009|10067099003|56012099006|55112099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 6Bg/BVidH0EN4/V0kGSxhK+1rFBUJnCAAyXTYWODTEdB2/G3f9nRW07rDKAH8g6dmltZYIQh9HE37nDJZsUIprks9JItPjHaF+6rqHwJf91w1gPSpqzqc7bvIRXiI8R9+xuTy7XtJK/ANN2GCudNnmeoHzmTtu473xIg7u3NcROT6MnVUU5+Qagp3crh7jPt9iZJDtzUAWU13AoNJdUIhS6BEnw/JvcX+pW7OtVKR8ewiYUwbzXfm8ZeW2XfoR3VHCpr4giPLw+kpj6IAToxTjsZWuthHTuyqp3RUFThWIKGAHKPR45u74vFSdTfLt3aOBEfr9HonJW1RChWu0T3KgZGWgZWIj22CH6IegpxpiYGSXzamUVRUJviTiW2yFmiSt1tuw5rLLp+7YF7iuWzlNeAlkrfDY2+hPqR+HWJKfRLScmoZ+WpqjbaYItHtj/bCjAPR6x0yvftEx3bNV7PmzXi5ynwI0wkpdr6boh55fT98Syv9VJi5/dmR61gdEu3UANAp+YOx4c/VpGmINR+QYdTcMDjRfpg8cwFI5cvo4ptMnl1LKuZymOzWRDKQ0MdyZEsJfbIPlSqrgNLJJfygiG3GZYVxMgwZKuEeMdwrq/RM6SqtiySmBB2ORIE/iljgNR/akp/kjNJdZ8VqIGNpJAY/MNYe+ckgDb/lO5/QFqoXEqE7y+WLUf1ZgJS5prO8w/UK5WSSDYWm0/fHXU7cmhBz7RSmeCHhGRtqcRd3pewBL2bZaixY2gUu8PnB6Ae
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(6133799003)(7055299009)(10067099003)(56012099006)(55112099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?c/pZRJPi/bEfOHc3gvSOulexU7J5IGgGn2gcYxVfhQ6qmRCxUATDtr5pvm?=
 =?iso-8859-1?Q?y2xVZ4UJOoRvywVr6j18ysuro/DZcYiKeNN/bVZRYU4Dt1B9UDcnCM1fmc?=
 =?iso-8859-1?Q?ylKfbiy8SkFItxyW6RcNzgtlRYxQMAluknvAEPJpDq/eZqC0KJazsivpHS?=
 =?iso-8859-1?Q?ltxIUvOvKfECYitsJTL3VgX7WumbbSxSlJAaeA6pGzoKhIDFqK6Husnjmx?=
 =?iso-8859-1?Q?j1abHJptgIfmp6wWUmexlOTNt1YLWqV97Be81uEnKHGk2dxmgDuM9NKuwO?=
 =?iso-8859-1?Q?Q3SAkcPgVMpHehOhrMbJQfcMYBjPrl2a63dGOMjyH8IUvcRDcppo+/69TV?=
 =?iso-8859-1?Q?QyuC97l/mW0zXiL0sh3n9Gj0M4CVZKKrvfn0aVfUyzH5gYO/8/3mLj/rND?=
 =?iso-8859-1?Q?EsaqZjlNmRVIyAnejdPbzlNYArpOKoZiUdhW1Da9BTdg4ZmJ4j3WZwfHwE?=
 =?iso-8859-1?Q?9xm1TMnvlCOkwDI7bWQEwKGzMxkemXAnteJ1F3Vm55zZqIp4JtBmTAARF8?=
 =?iso-8859-1?Q?88j3nrnDQmb1k9Xbgj7dIygeF2HNasvqEG+5bvwA1+o7DZ+1kDJ8g8szaH?=
 =?iso-8859-1?Q?Hym0fGI4B4jOc87XKaPgxnOiHZIQjCgdr9HkBNl2U5mbTbFp4kwoDPEG3/?=
 =?iso-8859-1?Q?5zxXrg8xnY+v4tub9EmhvAIG4nJImJIhMz2qYpbrlewRmcL1Ib5pQUZN0M?=
 =?iso-8859-1?Q?trgfiQFz+2g0q7UcB4Tu5fy5xBj7/jTZCgpe851d85cRzVndwtAXA4l8J2?=
 =?iso-8859-1?Q?4v5W2BIjKfrLbH9MbS0isyauazOGDTTKB/DW1v2tvmFD06FIG3bQp4SQaq?=
 =?iso-8859-1?Q?DPi/ySGsXQY4kYya7uj7TezsCezpC5jN6rUh5jU3zkkPrURUocjGyHuVp6?=
 =?iso-8859-1?Q?VhCUcbmiKG5PoO5Nr+d4d29n6sHQ0YJjcUdQEVdPDABfaFhL8Vopovggvl?=
 =?iso-8859-1?Q?WONrEjxlPCkXcxBbeMSRSBaR9Pvi55J2miyhRX/c1KSgkodsGorAD0WN1O?=
 =?iso-8859-1?Q?bUqEYjPJZW4qADRTj4PmUI+6CfdZyeIOvHBGR8WsEWOKOZ/6R32lpobtN3?=
 =?iso-8859-1?Q?J0AIDdpqdmsfQkXZp9dx5aeAhsrqEnJjD8h9MHLADGMSn5brEXbX6U5Zer?=
 =?iso-8859-1?Q?I4mRQvyKApjWaX8T1kthyfs510edjHEgaa5D+jhu4xkOFykvPmaYXkaxf2?=
 =?iso-8859-1?Q?ZLii65UPSYLAKHqsgBtgZGGD0eW+/aauhGFdK4KpZxpF08AaZsKa8yRSm0?=
 =?iso-8859-1?Q?igYZ3vY/jMS86LRX0zE7V1desu9h+9tyXEO/UC7dYhlDbICgKt8zLb/NxW?=
 =?iso-8859-1?Q?YurKpDXOP5aCKW3bh54zkg7MMTt57llF43Aye4gPjXuMqhyE/gGgdZT98h?=
 =?iso-8859-1?Q?IR1ZjuAMEv7w4kYF+HJIedT5e4geAonxJBRBkGmbOOqX4M3OHMpUsWTJe4?=
 =?iso-8859-1?Q?o/FGuLQU+yNH1Qjkc1cyc1zxITnUoYO7NrWFflTRzNDTsfKDb+JfM1D7vJ?=
 =?iso-8859-1?Q?K0uTtjhS4ZlpHrb6/mwbbM3rMm7bBuk6GgwVucbR2xNAaW+4jyEBP1OcYQ?=
 =?iso-8859-1?Q?wH2cOXc3Kt8W0gDO8axpJ68yh1Emd0HHLJTXxG4559X/v/DzIB8jyBDQp5?=
 =?iso-8859-1?Q?1W6gw6HNyRg7d1UdNi4CzxggUSFlp/x2aEpqNzdKeV7KPMZZfsVE9+5uYF?=
 =?iso-8859-1?Q?EkD9TbI9k6q8InrlNhjNxqL9mZrc92pqpvO1TXdwVyVX+ZFaQUOzWWu+M9?=
 =?iso-8859-1?Q?uqWaFVwqplu5gJvXZLCCx0FiFnGLGkRBL5t1mxVcMNP6lc?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: acc507c1-1dd6-4fbf-680e-08defd710c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 21:38:30.9273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r90vufWYvvtejNWClfqfHBe01k23niVYDnrIyoCX+cHgdBQauS2q9+Tpe4RqR1o8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYZPR01MB7788

From: Johan Bergstr=F6m <johan@bergstroem.nu>=0A=
=0A=
Arrow Lake-S desktop (Core Ultra 200S, LGA1851) exposes ECC on the=0A=
W880 chipset, but ie31200_edac does not recognize its integrated memory=0A=
controller. The host bridge IDs are absent from the match table, so the=0A=
driver does not bind even when the hardware logs memory errors.=0A=
=0A=
Add the five desktop host bridge IDs and an arl_s_cfg describing the=0A=
ECCERRLOG and MAD_DIMM layout from Intel document 835538. The MC1 copy=0A=
is at MCHBAR + 0x10000, 0xe048 and 0xe848 are the channel log-pair=0A=
starts, and MAD_DIMM is at 0xd80c and 0xd810 with sizes in 0.5 GiB=0A=
units.=0A=
=0A=
Leave CMCI disabled. The ARL-S documentation defines ECCERRLOG status=0A=
clearing through the legacy PCI ERRSTS path, while it does not establish=0A=
that the RPL-S MSR 0x791 clear exists on this generation.=0A=
=0A=
The IDs cover these desktop tiers:=0A=
=0A=
  7d1a  8P+16E=0A=
  7d1b  8P+12E=0A=
  7d29  6P+12E (200S-Plus)=0A=
  7d2a  6P+8E=0A=
  7d35  6P+4E=0A=
=0A=
The 7d2a enablement was verified on an ASRock W880M WS with a Core=0A=
Ultra 5 245K: mc0 and mc1 registered and the DIMM geometry decoded=0A=
correctly against a 2x16 GiB DDR5 population. No corrected-error=0A=
injection result is claimed. The other IDs come from document 835538=0A=
and remain untested.=0A=
=0A=
[ emba: drop an unsupported register cross-check from the changelog ]=0A=
=0A=
Signed-off-by: Johan Bergstr=F6m <johan@bergstroem.nu>=0A=
Signed-off-by: Emba <hello@emba.au>=0A=
---=0A=
 drivers/edac/ie31200_edac.c | 42 +++++++++++++++++++++++++++++++++++++=0A=
 1 file changed, 42 insertions(+)=0A=
=0A=
diff --git a/drivers/edac/ie31200_edac.c b/drivers/edac/ie31200_edac.c=0A=
index e928ec49d..1c4e997d2 100644=0A=
--- a/drivers/edac/ie31200_edac.c=0A=
+++ b/drivers/edac/ie31200_edac.c=0A=
@@ -116,6 +116,13 @@=0A=
 #define PCI_DEVICE_ID_INTEL_IE31200_BTL_S_9	0xa744=0A=
 #define PCI_DEVICE_ID_INTEL_IE31200_BTL_S_10	0xa745=0A=
 =0A=
+/* Arrow Lake-S (Core Ultra 200S desktop) */=0A=
+#define PCI_DEVICE_ID_INTEL_IE31200_ARL_S_1	0x7d1a /* 8P+16E */=0A=
+#define PCI_DEVICE_ID_INTEL_IE31200_ARL_S_2	0x7d1b /* 8P+12E */=0A=
+#define PCI_DEVICE_ID_INTEL_IE31200_ARL_S_3	0x7d29 /* 6P+12E */=0A=
+#define PCI_DEVICE_ID_INTEL_IE31200_ARL_S_4	0x7d2a /* 6P+8E */=0A=
+#define PCI_DEVICE_ID_INTEL_IE31200_ARL_S_5	0x7d35 /* 6P+4E */=0A=
+=0A=
 #define IE31200_RANKS_PER_CHANNEL	8=0A=
 #define IE31200_DIMMS_PER_CHANNEL	2=0A=
 #define IE31200_CHANNELS		2=0A=
@@ -799,6 +806,31 @@ static struct res_config rpl_s_cfg =3D {=0A=
 	.reg_mad_dimm_width_mask[1]	=3D GENMASK(25, 24),=0A=
 };=0A=
 =0A=
+static struct res_config arl_s_cfg =3D {=0A=
+	.mtype				=3D MEM_DDR5,=0A=
+	.cmci				=3D false,=0A=
+	.imc_num			=3D 2,=0A=
+	.reg_mchbar_mask		=3D GENMASK_ULL(41, 17),=0A=
+	.reg_mchbar_window_size		=3D BIT_ULL(16),=0A=
+	.reg_eccerrlog_offset[0]	=3D 0xe048,=0A=
+	.reg_eccerrlog_offset[1]	=3D 0xe848,=0A=
+	.reg_eccerrlog_ce_mask		=3D BIT_ULL(0),=0A=
+	.reg_eccerrlog_ce_ovfl_mask	=3D BIT_ULL(1),=0A=
+	.reg_eccerrlog_ue_mask		=3D BIT_ULL(2),=0A=
+	.reg_eccerrlog_ue_ovfl_mask	=3D BIT_ULL(3),=0A=
+	.reg_eccerrlog_rank_mask	=3D GENMASK_ULL(28, 27),=0A=
+	.reg_eccerrlog_syndrome_mask	=3D GENMASK_ULL(23, 16),=0A=
+	.reg_mad_dimm_offset[0]		=3D 0xd80c,=0A=
+	.reg_mad_dimm_offset[1]		=3D 0xd810,=0A=
+	.reg_mad_dimm_size_granularity	=3D BIT_ULL(29),=0A=
+	.reg_mad_dimm_size_mask[0]	=3D GENMASK(6, 0),=0A=
+	.reg_mad_dimm_size_mask[1]	=3D GENMASK(22, 16),=0A=
+	.reg_mad_dimm_rank_mask[0]	=3D BIT(9),=0A=
+	.reg_mad_dimm_rank_mask[1]	=3D BIT(26),=0A=
+	.reg_mad_dimm_width_mask[0]	=3D BIT(7),=0A=
+	.reg_mad_dimm_width_mask[1]	=3D BIT(24),=0A=
+};=0A=
+=0A=
 static const struct pci_device_id ie31200_pci_tbl[] =3D {=0A=
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_1), .driver_data =3D =
(kernel_ulong_t)&snb_cfg },=0A=
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_HB_2), .driver_data =3D =
(kernel_ulong_t)&snb_cfg },=0A=
@@ -842,6 +874,16 @@ static const struct pci_device_id ie31200_pci_tbl[] =
=3D {=0A=
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_8), .driver_data =
=3D (kernel_ulong_t)&rpl_s_cfg },=0A=
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_9), .driver_data =
=3D (kernel_ulong_t)&rpl_s_cfg },=0A=
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_BTL_S_10), .driver_data =
=3D (kernel_ulong_t)&rpl_s_cfg },=0A=
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ARL_S_1),=0A=
+	  .driver_data =3D (kernel_ulong_t)&arl_s_cfg },=0A=
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ARL_S_2),=0A=
+	  .driver_data =3D (kernel_ulong_t)&arl_s_cfg },=0A=
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ARL_S_3),=0A=
+	  .driver_data =3D (kernel_ulong_t)&arl_s_cfg },=0A=
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ARL_S_4),=0A=
+	  .driver_data =3D (kernel_ulong_t)&arl_s_cfg },=0A=
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IE31200_ARL_S_5),=0A=
+	  .driver_data =3D (kernel_ulong_t)&arl_s_cfg },=0A=
 	{ } /* 0 terminated list. */=0A=
 };=0A=
 MODULE_DEVICE_TABLE(pci, ie31200_pci_tbl);=0A=
-- =0A=
2.47.3=0A=
=0A=
