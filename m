Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021096.outbound.protection.outlook.com [40.107.39.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348D22FE0F
	for <linux-edac@vger.kernel.org>; Mon, 13 Jul 2026 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914734; cv=fail; b=QDFeb9JVihlN8Wgu8pAM1tCPQq0tyhoMQG8pxYGsigxHR1a0NKi80tgz54cu27erBDw+apGTmOfUk/uHq9F9SeY9E3A5EDT96ApQ8eeHSBXKN7YHY4yTwyofsZkEAEbHceuER6aq2zFQQFhQGANbJoBdvbwG9UuF/2suIAI82H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914734; c=relaxed/simple;
	bh=Sgp18N3MczlWdQThrdbpmBjGtod3D9Pn3iRqQw+45wU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N38ikgwxgBph8a0hV+sHS4aZmg9NonW9BTHvHVrx03IxolsjrLnIUy5oXTyvcxLzmVWh1iHD1iQb8EB5k+nC9afshsqKln9E/pGp90IZVA/bCfCtDJO9ME6yhyMO3DHSxfYZvom2/KaznP/HR5uEp8WcjLbV971yMnGUAlFSfAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=BHeWxY1S; arc=fail smtp.client-ip=40.107.39.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="BHeWxY1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5eLFdVzVL0FtCn7Pbya0EHvd1ofslsaniWPz3LRZBwAMsH0L95LvF4Pts0/T2VHDB6/ruqrT9+9HnpcbwiVehHQDH2eMe0OOG2N9tL2J5tEeSSJdH1TYtqsg2QHqIXvy5u4Q1K/5Iko5E2Uyi5aZyAIi4zdN/2sH0x8FHK0bkWfnuDlkSY8T4Bm5BKqczWNYmHiqnONrrG/Ane+UmcsOtMvVDk8v7ViZXjOwl5hGjkZgwQ5kVg1RR+9OvRh3gYjKl6//ryT/qUqQuM7EiSePig9+GJI/iHzGeSyPD9Ojm97+AU+TjVVS6F7L4dL2UhkzVJb0xVB28xyIU/I9odrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9O3jSSRF79uXlzPQp73KuSH4vOtU59jxaV6exRGHKg=;
 b=pm0KoFQrOaJe+hGYaD9ccKbgTJ12uTnAeFkjSDuD72Cpy/tNyWw+BeY0CWoJ7XJTdgVoBwDAjj8tz6ovCxvYjBbUuQf3z1Iyugr126z3AbCAYrxv3dvgoE3FuE7LpXxb8vMyhQmxvIeuhKQbatJR4aluPwz5X0dMNahoAeWFL6xLRwK7m6p7M33/aSLyybReXFcVf2S6v+RHid5smKdGIM6d1omszm4/a5bfy1QT51wH+8PcKyDFocwcdxG6A2iLrJ6KqSkiHm8fu4ve1E/NaJvw3SvH46UsMT+lPhKGUNnGbiiLrJEubn+AcRcmCtVXWzgH66tyfAUF0HQfXuf3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9O3jSSRF79uXlzPQp73KuSH4vOtU59jxaV6exRGHKg=;
 b=BHeWxY1S6ovQ1FB1TwVMSFNRfxWI2bqklNYRXSsFKrR9ZShI0RMYwd8sj7zMRaCHtGtTk0Ps0+h5v4hBmRCuZMH7MUPZLx7ipWbzjV6SPtGywA1/8/RuB2/O5pny2/Y7M4S4thrL9KhoayisZBLLyLFhj1MjwRSkgFUTR0E8OGR4x9OcB0SZ9nEaeSj5WA77iAM4vHSB2k9aa8i1bBd1DRoCkT889/GYtsgWslg9jZml4lmev1NcP61/Nrdykh/7E1lFG7OTdeW4ljW0RVVwg7umEUadzHynzAug+Y92BL1JQGbihMRWSrdc6KW7ciYxVsBJAFUfsL6Dshcqg2cVYQ==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by MEYPR01MB7038.ausprd01.prod.outlook.com (2603:10c6:220:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 03:52:08 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 03:52:08 +0000
From: Emba Consulting <hello@emba.au>
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>
Subject: RE: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Topic: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Index: AQHdEDl8giR33UKdQUiabq1WYsVwErZqvfxwgAAWqTQ=
Date: Mon, 13 Jul 2026 03:52:08 +0000
Message-ID:
 <SY9PR01MB10852E9F6484A7DDBF3E8D898A9FA2@SY9PR01MB10852.ausprd01.prod.outlook.com>
References:
 <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <CY8PR11MB71345DC82A8AFE8146DFCE2D89FA2@CY8PR11MB7134.namprd11.prod.outlook.com>
In-Reply-To:
 <CY8PR11MB71345DC82A8AFE8146DFCE2D89FA2@CY8PR11MB7134.namprd11.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|MEYPR01MB7038:EE_
x-ms-office365-filtering-correlation-id: ef0590af-1e18-4240-d0a8-08dee0921ccb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|38070700021|18002099003|22082099003|55112099003|56012099006|4143699003|5023799004|7055299009;
x-microsoft-antispam-message-info:
 BST7+AqHgFHGqrECDm6eh3aTtLGUFfV55p3bwQU+gmBaMLuSwwVBc639mUr6ZCHJHvmyw2nv3mpIPO6bY1jzuVG1pLVEqpOfhRwSe3M+dcYfaattlVRTnIGTJZdumzAc0WtFEbj/Ks7FvMikArCma+eWs2oYf1bcx+hTEy545WD7Kblgeh4qqNhIZCAirUOtatMY/MlNFK2neFDDUiTzz3GC0/SdpnJiVDkgfHcvrq3StL5uJsTCx8z037PLV0bQWf3SDBvUYRtqpyX1In0RohGRc9DPy1z9dFHKMBnxTaokg0K9mPeZHU91L+EGwJzMDZ6F34v3zi3V24kBH5fEAQzUr6eKdx0Y4Ftr3wCME+xg5kPZpOxO8y5HhC58hGNi/iGp7VZ/owvdHIsqb/Thcl1CAODgBGlE1sFlQpf4FGf5VcLMa0LrenVq2HcA0iK1GB4KFbn8J9LppG75r/bthwKoYEbAO2hmA93cIyMAudehOQzcE49mwASK36YmRJtUP5B7AHmgSbw4hYHQsdiMg9IDEdecXJZIVxdCWHwecP0v0uXAtX+Jygl94mfgMq0KtX1H07wlJmbsBOEuTJjvFTIZPpMLI3FE7iqKghGS13qxdrx27RoPvpLsvL3xgWkOFgOIf7RzHDfwmQ27g+Sx4YLOpV55d0F6l1uH+A4vVa/Eey6CBmIMKel8FRoJVKRK5pe4XB28JvGzW5DIWK+TrEOt40N01xNsWQM4uA52/3hIGRI43gt6RsVqdwS/rytQ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(38070700021)(18002099003)(22082099003)(55112099003)(56012099006)(4143699003)(5023799004)(7055299009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RxsbVhG272EFHxASYZP1Z3J7AdRrNl2/J0xI86s1gYu1ASnoFhIHqwKlMCR1?=
 =?us-ascii?Q?GGYWo4Eo1hZRnTy7XMDaxwu3+lUZ19+23EcRE8wAszrIkskWx+V+2Kza/VXP?=
 =?us-ascii?Q?saPm2CMEd8vR7xaFDdPoH/0bNx3fp2XC0H5CBSKzp9DZa8HKJLnnwPpxUOmQ?=
 =?us-ascii?Q?cD9uymO9+yhhPeAXdM7cAPSCuqS+Of5D7TphDm1DXEASStXLwndWuenK4urp?=
 =?us-ascii?Q?qMH4LvP3mv5XBLzyhGL/VSwruElhy4QymoH7D5VuRg9oVxEWhQIa5Vjtp1tE?=
 =?us-ascii?Q?J43EIRwaFojAp4On2/wOQ3UcGybTTQd5dPXOVir0cXn99mBLpZGFgHyv1xzK?=
 =?us-ascii?Q?UsX1V/MCMflnxxptV1n8tLmj9iACoqNOnm6Q4wDVFc1oJx5FpxGeMNNn9/I+?=
 =?us-ascii?Q?YBoreQWTPjMyElgOmtct4x/Xm0nELtsRkytkea3htSzJRMsLBCPPPEInFCrC?=
 =?us-ascii?Q?J5X5/mMtnwvcg2RbYSd4S9IOibXNpn3C75PvHtlwX3Mt6/yjG3xnW/kWPDcn?=
 =?us-ascii?Q?wip4S2TSDEe3qo8XziHzWajri2OjTvtq32GCKlpahCzHwBvi+s6WSvrdQj3b?=
 =?us-ascii?Q?f+PZxPXfWXDVzE+2G4wwaH2yJLlrpLvnljyrkFZjh3l0QRZySJEb/x6ja9UQ?=
 =?us-ascii?Q?h0QM1xu7pis0jIEOmPipQJu5H6+ejic4/EM0nDehPMbvVtw2X1GVxCBDXLJ2?=
 =?us-ascii?Q?OmJVW7I56hKMV6racv5W9FhgXJPlYinKM8szKEB1K22gQfrFISFyldsQ/jFh?=
 =?us-ascii?Q?inMh27OP3VnJmDyL16/24iw887/nWkQyBUAsuqA7kRCOx0wNHth5adIqG8im?=
 =?us-ascii?Q?1PLL93do8H+RGGjiypRFjVYmGJqAACEH+aMtWeyzbXIwy4SMBcQsF4Tv0Tmb?=
 =?us-ascii?Q?tepsJNHIrhq+mGKtWZUe3MuAvqSJZzmsF4eRiBKEk6dyQr+WDt+TSMstyqt7?=
 =?us-ascii?Q?hIoMpWcojWtsY3JpLYsDuhzt46xS7/RIQo2heWcEbXUpEa7IxYAEFjFtSnWF?=
 =?us-ascii?Q?flrUP307JcuD2u/Bz/qvQhB5BYCzwZg4kcsckwpn7J0QXTUOLtUiJiJ9mZOJ?=
 =?us-ascii?Q?ScjyB07n9/Jx8AxVeo4OMNFRYP6kZ6hMtbTkE4lzkBf/UxLFSyIp2/LHZddv?=
 =?us-ascii?Q?vvzI2+hzP8UAInPzIoY9N6rEwgnEfqmyT5Vng+of5zrHXdRN8jRssZ+06z9W?=
 =?us-ascii?Q?OBGYoNlhLDXvgKUwEWJeUYmIpuUjuJcrIjrB30TKCst+tluZlGg/FBugR+LL?=
 =?us-ascii?Q?+yHvytpAr4q5IjnaQnExoouXgNF+9qCMaA83UDfg5TAPpmgQUYrzJP2GMwee?=
 =?us-ascii?Q?oSwkNoRJizvPps6whGOavUb8Xh5YWvMRKhulQIOS3ejHP37wm3olglUUHMcb?=
 =?us-ascii?Q?nKMd9Uzs30AEH/fmuk5HIip037QfxyoUiL2g7qjkpKJFKZ7IeMRgmMc3vzK9?=
 =?us-ascii?Q?pimDI4wUlQelJGyiNKVnPUhVPSPzUn0ud9KVAtXOnyct+JC0ZWfUh9lBWx9l?=
 =?us-ascii?Q?AXoT8QB9XK5jmY6pLF128gXbthZJqAyZ/K1ZWphdjixn2pWMweUxqMAhz2pM?=
 =?us-ascii?Q?4d2nrE0js7m4SnSYx8cv6oZRaNYMz6O/RVFcYi2cw1eV1hWF8Ar7UTlgLxzp?=
 =?us-ascii?Q?qjlpEY9QroKduREYumClQ0g9ex2R/DP7SnKKlnkSQ7Fsx6Wm9Y7HECGJBwM7?=
 =?us-ascii?Q?JwI2EndXiVUxC6D1yflYnhJyY8GA9X/tU0bpIQoJw7cm9+WB?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0590af-1e18-4240-d0a8-08dee0921ccb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 03:52:08.5129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nx7QWc06K/JuxDYh7n7/wivC9tD3jwX1xMEsViT1t3ifNaJJVVzA6Sfbcpgr9B0+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MEYPR01MB7038

> What does your BIOS tell you about the ECC type: In-Band ECC or=0A=
> Out-of-Band ECC?=0A=
=0A=
Out-of-Band. The populated DIMMs are physical 80-bit modules and the=0A=
BIOS reports ECC present (SMBIOS; consistent with out-of-band):=0A=
=0A=
  dmidecode type 16: Error Correction Type: Single-bit ECC=0A=
  dmidecode type 17: Total Width: 80 bits / Data Width: 64 bits=0A=
                     (both DIMMs: SK hynix HMCG88AGBAA095N,=0A=
                      32 GiB DDR5-5600 ECC SODIMM, 2Rx8)=0A=
=0A=
Register-level behaviour is consistent with the out-of-band /=0A=
ie31200-style design: on this die the rpl_s_cfg-family registers are=0A=
implemented and decode correctly against the physical population -=0A=
ECCERRLOG0/1 at MCHBAR+0xE048/0xE848 read as zero (no CE/UE observed=0A=
yet), MAD_DIMM_CH0/CH1 at 0xD80C/0xD810 decode to 16 GiB / 2-rank per=0A=
DDR5 subchannel (one 32 GiB 2Rx8 DIMM per controller), and the CAPID0=0A=
ECC bit reads ECC-capable. igen6_edac (in-band) has no 7d1c ID and=0A=
correctly never binds on this system.=0A=
=0A=
Given that, would you take a patch adding 7d1c to ie31200_edac? The=0A=
open question from my first mail is whether rpl_s_cfg can be reused=0A=
as-is: its error-status clear is wrmsr_safe(0x791), while the public=0A=
EDC register documentation for this family (doc 835538) describes=0A=
clearing via PCI ERRSTS - if 0x791 isn't valid on this die it would=0A=
need a dedicated cfg. Happy to build and test either variant on this=0A=
machine and report back.=0A=
=0A=
Thanks.=0A=
