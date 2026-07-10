Received: from MEUPR01CU001.outbound.protection.outlook.com (mail-australiasoutheastazon11020079.outbound.protection.outlook.com [52.101.152.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C53B2FED
	for <linux-edac@vger.kernel.org>; Fri, 10 Jul 2026 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.152.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783666717; cv=fail; b=B40rdm07zccdUrpQFxAW2Zauj1zfX/tvCuBICyMhTz/y0A3tt11dwGztOw2p9q7SvS9SK3tr+Vm4EvNavNhHA8VIQg3IUWk9XaTieoGz/jenfnM0CstEwcY1wF2/VlWNeXR+SciSPVDUrD+XubYIBS1LPM2xHY8YHP2kl2xg0/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783666717; c=relaxed/simple;
	bh=o55PphKJm/pEzyGu16F3OXAp/9OpB5tl9gEYJBQW7Bo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RoaxB3+xETPJoFTl7AFqwrogDLW1vAR8xklrd4Pah1aeVtZp3IhuRP1/QMEqMq7c8NmqaSR4Pfr8B0vlGMROApfXSFG+WNWmCUYkqn0oqHhuEyr0ewUSDaMADW4UIogBdH+afIbSmvNnbBSju3KY4uxA7WqKqt+xDB5UtRv8vjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=BAJGX+6F; arc=fail smtp.client-ip=52.101.152.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="BAJGX+6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1uXjLixjMuTORIYWEY9uJn0lJwfONp+v4HCcqOXhq359+Xdbb4MENDU/xyw7WfIFs+2QkRF/THKx85YOtI8IU9rm4xjFFHwG5G+QOhEr86emMhzUNvvDBnHHX8EIeZT+vTyuyLgZXxJ0YpAyI/o84JEgPUKr3z8YR3eR71+PrqUx891tNBbQMToNtS0AqgNyFDq6G9bkyZt11uM68s+2bzlf82sEunhoYm/GzA2Mi7a7wEeNUhQO86qYyuxajSfE4f/eM4Dwq1wiQ6yxSsDBsLW816kcv27wNeF/AS///oQu/2qffuvheUXpD7BnA6nUhHxv39JSJPVJyCyqHhQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ4gHCZgpWPXz42e15vggJadc8VTAGwRHiwAAa4cCWw=;
 b=roTj0Z8UvWmq2cz3fWI59BoosGmzPhGjOACOXo9+AMvPddKVcJN+b2dVu9aSmcQ4zgMrWXtOznBqpv/c3t/vOVJyD8kBDShq12SQihLwPn+RWXcrqeMd/ACigq4M0bGWEz/S5NSsNhmg31qr28i4vfhnTCzn8dVoJ6vrrLWJ5TtwAaoqE0ig8k+gf8ANIgGskhWLuxWUYEIhb6mN5Bl5U1LY7oLb/A7QRDrI0HVIfgLyeBK3tnIrRmVgaj5CDzhr6B3uJzx8YdZpjJvqjBkf65+hOamJxMPEKu+jKTvHhZnORpMPGAVT3EmV0Vj/DqM4oCwOu2DL5qUjVRUHtJM7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ4gHCZgpWPXz42e15vggJadc8VTAGwRHiwAAa4cCWw=;
 b=BAJGX+6F/aaMOHYwM+c0p7fpUsjL9uewrx3YDfSgM7oBWR/0mnharLQaOu6SEa46cpDLFhsxmnvEXjITGwJgAyQ6HkA8urLBEANGSRb+UawItqA6Kaf7X/Jaa6wfPJY7OwhCUmzEz6XpkRhFdbxYmGb9W+Ewts6fAv8GGjWLsAdHcUHBHnyai2hqpe3F0BBwr1mCPJ4h7GJsAZ2pQf5OlJB5SPjreL6pmLaxTXm2rq7m7/gXmVr7XxMKHPNTduwnORkQUdod0AHL5UaHacbre90UBRbHtrqFncySfFhRs7ePfJaBWnKjoFbAHGokRoVMy/4fFf6o+Zt3Vdqhubwqbw==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by SY8PR01MB9158.ausprd01.prod.outlook.com (2603:10c6:10:227::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 06:58:17 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 06:58:17 +0000
From: Emba Consulting <hello@emba.au>
To: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>
Subject: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Topic: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Index: AQHdEDl8giR33UKdQUiabq1WYsVwEg==
Date: Fri, 10 Jul 2026 06:58:17 +0000
Message-ID:
 <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|SY8PR01MB9158:EE_
x-ms-office365-filtering-correlation-id: a7655b3f-db8c-4335-0b9e-08dede509ea0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|38070700021|18002099003|56012099006|7055299009|6133799003|55112099003;
x-microsoft-antispam-message-info:
 bacYwHim0EBQkYP87Fj07Plarces/JIW43hdxKjwP3aZh8/2qZtCq0hnQ07WILDTuuf2SCTcF1OXp5qk1xH4EcqQtX46uG/VmoknMDQUGlClS0f7pVc2wsxDVNtQnSM1Uxyq44O7PxVsQbUtf1G4cWRjp28zs8yEcdnpi5dDybA5aK+hswRZ3F8MGSTu46woMj+f0Hgjsj0Ckzgqeo64xelOYcqn0jEnw119cqPu1asQX0qXmFO3QnrqEf0L2eeOftz4KZUVh9jdj2Cl5dqCCcT7Ayp8d7qQDu6isq6mLDXcKuln2AgDdgAZ5aeu720sq2SPcD3N3PvAbTlS7p1q+uQ4NxhDoCASp5o16iPUncpsiZ7xIsnTbtzzTIg4s3Hy27455zDXYpoq13/xjiSDtQN+uMvP9UC33jKy72ZyCuCusUNiUeSWi8v0BZj8e45qqhmFlb84Luauj5h8eqQW7WwYh6kHa2dm8ZL7d3M1S2ar8fjtnHcA9tXFPbdgL31zxZIYd7mAkedMKrjCBrEwKZe7dcuRAqIfFU77CXHQa4T1eV+d/XNpVf7FDzUEibKWOk60nG9L81l7ExEDZ5RU6AnpKf43CKRE2K+w6BHS5SJO3JCbAl/PC057dZ5JEYqxGgj9oxNb/r1Msj0TrVSEhUl/va2CYsrbLPwcm2zlyl68sNG2pg56tyCxvwOpmGBJlut0JxAr4dcPwGhDnKsSaP2vgM+gs7qOUDfgepFJdtXlZtz1rnFrmjcbjeixNQjW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(38070700021)(18002099003)(56012099006)(7055299009)(6133799003)(55112099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pxaehuDuR1m0zBfQDkSVClYRLGEFiNwQ0yWSm76xA6XOaTAfI4H6ON/we6Zg?=
 =?us-ascii?Q?K3PLJj3mScMK2xwOgRSmrTmT5cKWqoReQKCLQi7EgQZgMFcaoD0G0ds2pd3O?=
 =?us-ascii?Q?h0cfdkDB4cSJsABCcniEy1/b5wiPzYgT7ewaQZvcqX4dBt090Zag2FUz8NY4?=
 =?us-ascii?Q?SV6o6hoCZaS32Xbx0t51Ndh64zYm6mgCaDYAhr8q8bFqmJ2IXhKjK7HG8Mj9?=
 =?us-ascii?Q?mvJXxq6TOY9/kglJK9xR0hZVj+CuRj0ab4I2zxh9RxhWQkLxZA2pvSLw0YNq?=
 =?us-ascii?Q?uDi7NcD5werQRzgOu5PxNGKgo6+lIR9Q81CWLLoMoIdcitxTMAw1lGgALqRv?=
 =?us-ascii?Q?Q6DLTqt3Gkx0sD6ER/B2Uy4UX93JnU+Oc9MmxNTn4Zx0WAHit4UOelTvQkO1?=
 =?us-ascii?Q?04rJeATqyRfENbho3gpYfuCC8rig05RqX255Q/15QCcJqB2/Ed+gpjUFZ1K3?=
 =?us-ascii?Q?sf+FMXjRKcln97w2+JXCfcpJzqaw9HgW11vfJEeOy70hJcS+TtQ+gvJB/2Uu?=
 =?us-ascii?Q?KCoekZole1Lk1krAzg6T62YpS+NJJpHtmNtf7syl5DLDfIKI6Y1YpiZ3quSe?=
 =?us-ascii?Q?Lj7MjKyo4ofLh7/TWThVkO0+oHIW0ZXoqQ17HfEVfemsBcI2br2W5qY3epnj?=
 =?us-ascii?Q?svH2wLCXyjffaMjevLHk4G/eWJO4PxLO1Bf4xiSkMzt/08IMx36n9j4Z4KUl?=
 =?us-ascii?Q?IYrE/hAnJmOkgL7jmxQR/qXCpj02Y9h+Uf52QJjlNLMWulxRXWHEErV4WLkv?=
 =?us-ascii?Q?mF5Y1iC9GPH6Q9PjvrNXxwC00wd7SKmtsaaug+Oxu0iR7VRt8Ijc0WdhMi/T?=
 =?us-ascii?Q?6ZYIYnhd2cglyeTpfIlBb7zswXw6BmqQg3LVv1xHsNDPKD8SxClGIQd8pJ10?=
 =?us-ascii?Q?ldfKF9KQ9pa+w5k4l2zupHVsC2HHNbFUSaDTLQ6OFRDkRCEQJEDkNhDkSyJk?=
 =?us-ascii?Q?ZODVXHoWV+wqARbKvoTtuCVBtbpuE3Z8DpEIdaLG2UsPJF5G0BMauauv16HD?=
 =?us-ascii?Q?w/mIRo7bjdzqes0i0CUK3oLaJ8M7e8MYuBIQQpZsINr67jPi91Oix+hzoVnB?=
 =?us-ascii?Q?lpXstaHbPlQpKObdVvfb2svXZemmgBMljNRGnSyl2S9rpRL76sA/fnMncQtk?=
 =?us-ascii?Q?NubWuY+3DGU0VGfJGjCjvJr+JQ+wIH/5C4I0ZYIVYkIapHtHTZh1RnnRviJ+?=
 =?us-ascii?Q?MyKPKGc3pZFO0u0HIeibhk4r6K+av/gYqpAX5MG4HZ3PoSMCHbXivIY9JCNs?=
 =?us-ascii?Q?ssl/vmMkbVVZA3kcSQM/TyajI5q2ReulrVQrXM4iFrAlQQbLPrh00ySHQ77g?=
 =?us-ascii?Q?V1cV2WTn1v0DvduwPAm4yFpEnz7XXmKjMM4Y3laoq8emPk6PC6G5ju0OEBrN?=
 =?us-ascii?Q?I/Fs8c7bN1AcFxQZL0rIxpf8cnZTPDSleZ6ABV9oa00yRjb2H7Tbmle6qDeg?=
 =?us-ascii?Q?xSeACWxQjrvgcVvOE1AftzIIhNj5ewbX0mmnip+YjhP5Po97oBG7gVa12og3?=
 =?us-ascii?Q?f8qxcumlL7/4Uh6EFnhZEnA8+GB1/jIDNEDb81uMCFPfu+97Ja04Wk111eXi?=
 =?us-ascii?Q?tSr4WWxrbUfbNRJwp4W9z0R/7e5mPWkXxLkY6eYsRMa2Mf6pIEvt4qjWZ7VK?=
 =?us-ascii?Q?TGiuvN4iNNzeqZr5K3vrFSVWGeTCdPAPG30GaUG/mvY5/YBbm/8O9c/iVM/p?=
 =?us-ascii?Q?GTVP8cMy/JS1RLuDtyu8qlh1jSZk7OfmXli8Ey0UnzxgjVtU?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a7655b3f-db8c-4335-0b9e-08dede509ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 06:58:17.2848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xs+mkvfzd7EsQKpOZrSKEqg4CBF4+t0/fmS8D6QDa0i+/D+00NMvm6q+mAsUhYkk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8PR01MB9158

Hi,

I have Arrow Lake-HX hardware running sideband (80-bit) DDR5 ECC SODIMMs
and wanted EDAC error reporting for it. As of current mainline no driver
matches this die: igen6_edac covers the in-band-ECC Arrow Lake-U/H compute
dies (0x7d06/0x7d20/0x7d30), and ie31200_edac (which gained Raptor Lake-S,
Raptor Lake-HX and Bartlett Lake-S support recently) has no 7dxx IDs.

I wrote an out-of-tree driver derived from ie31200_edac and it works on my
machine - both IMCs register, DIMM topology decodes exactly, counters are
live, clean load/unload:

  https://github.com/zs311521/edac-arl-hx

Hardware:
- Intel Core Ultra 9 285HX (Arrow Lake-HX), stepping 2, microcode 0x11b,
  host bridge 00:00.0 =3D 8086:7d1c rev 01 (Minisforum MS-02)
- 2x SK hynix HMCG88AGBAA095N 32GB DDR5-5600 ECC SODIMM (2Rx8, one per IMC)
- BIOS reports Single-bit ECC active; MCHBAR =3D 0xfedc0000

Findings, in case they are useful:
- The register layout matches rpl_s_cfg for topology and error-log offsets.
  I validated from userspace before loading anything: MAD_DIMM at
  MCHBAR+0xd80c/+0xd810 decodes the physical population exactly (16 GiB,
  2 ranks, x8 per subchannel), ECCERRLOG at +0xe048/+0xe848, two IMC
  windows at BIT(16) stride.
- I deliberately did NOT reuse the MSR 0x791 error-log clear: the public
  EDC documentation for this family (doc 835538) describes clearing via
  PCI ERRSTS instead, and I could not verify the MSR's semantics on this
  die, so my module defaults to a no-write polling mode with
  report-on-change latching.
- Channel count is derived from MAD_DIMM population rather than CAPID0.
- My BIOS exposes no ACPI EINJ table, so I have not been able to exercise
  a real corrected error end to end.

Questions, so this can become a proper mainline patch (which I am happy to
write and submit as a dedicated cfg in ie31200_edac if you can confirm):

1. Is MSR 0x791 valid with the same semantics on ARL-HX, or should the
   error-log clear go through ERRSTS (or something else) on this die?
2. Is corrected-error CMCI delivery confirmed for ARL-HX out-of-band ECC,
   i.e. is .cmci =3D true correct here?
3. Should ARL-HX reuse rpl_s_cfg or get a dedicated cfg? The rank/width
   field widths in the ARL documentation look narrower than rpl_s_cfg's
   masks.

I can test patches on this machine and provide Tested-by.

Thanks,
Zura
