Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021084.outbound.protection.outlook.com [40.107.39.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E7336884;
	Tue, 18 Aug 2026 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089108; cv=fail; b=IjCYKpaFGHnnsLqc+wqqwpa26QdTMcdKVU+CR71Iz/iuO85ZKFRZeah/J/VlaFUt9fZoVwOsZCoK/0sbIrAxOEdsTc5fcl1JrReUaI0HkFN9pGK52cjUiS0itojAWcPiv2BqSEn4zWXYeF4I8wVAe0y9OyhHcUkhdpb1xW5t4qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089108; c=relaxed/simple;
	bh=snO605sa3tko/WtAq4MpjElTe4wb+AK387itEmDYlMs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AM+OYogdYJ55d3UeZfnI+erY2C6OPD7NLY7lr7vLDmOE34YvRx2WP09lHkB9ZRtTguqnRvZLSovnt94LTPCMAyf+wd0UAoxlyPDmr2/rquXWX77xRYy96Cb52DbpSWYPq0qn9txqk7fl1GmoT6SMIPhYRW2G1+eSb53nAHDhFYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=nXJ7v8eT; arc=fail smtp.client-ip=40.107.39.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="nXJ7v8eT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7kGtRktvOO7rOFFEiitMJs9NwR4YvOHtNcoVRTFm39sp3OkvpXMP3AehkQ/Hd1MMvudFrg3hEqe5Z8RibpM4s17sRgeIz0pfiJCyfEVt2UxhbXbqNNsKv27mapCBJF1OCWmnV79lfidtdgLE35VfDP8StySOJ8DXv6sExc9G7q+TkW6TD8fZUt/znixhXxKJpB/E4Ubg5C5ibYeSvNLUzAtjUYyC3E7ubaKsr6pKqJnqwmjVyD8He/ynZNEAZIIr1wXVCbeNkv5sM4tArdOly/3nb0j2goej7bEneLqIvWdLXqnlmn/0QYbvC18edul7e73l5h40vg5/8GB+jFY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEQb9Fc7RCkpJn02sawAPRJ37Jl6iaz7LdSgkJCJ8Fo=;
 b=TvTsx22hUUgsN7/wcjB5hI46HUqggRmG/4MRb66tKewD70x6Df3DAvqd5aTPTnVp6YxFIvTC5AwKWQKKhkXuYoKLgPD60TyTJtDq8QKlxgefNGnx34FPV64CjaR/Qc+iVYXDyN4UvzwH2nRFVympiAzMXijRyHe1uI2qaDb++vZ2OGZ3tL62ceZ2fCx+s0MzOTyJlWflFrGUR13vj/nV6jelDNIagBwEBRllTwOmTQiGAXyfxPj1eoATfzocKakdw4Q/yCkiyd6bkYQ8AkUPxFpBM2hBQiDoNOtWQIWD0lRe5Ryn1rR96wdcaEb4oLCjRRSxURoMhG5ttOri3x17+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEQb9Fc7RCkpJn02sawAPRJ37Jl6iaz7LdSgkJCJ8Fo=;
 b=nXJ7v8eTRDg4E76tlzr4/Hgjlgei7Rw84VJIU0ejgPvPKGtcmyP5qkmdBff0gdeUyqfmP6R1uJjkn8d0AvXUQcDYq65/ZUUxwvWDVDilGgLFavcBYnxqKzQsm7PTYVUviwsNEurtS1QKlr/6/G7KHvQXyylrLS9YZ3+CXWcJv53gDzcsrXmHlh9pEBYjUcndzKxfJg6p024Wa7sqgKyTjNXjCs6dvoqCVYA2Jb/nJihyvterkq/bIWa+nvP1+aTqNkU7HompYLbvKLX9vB9+I/SDk8L5qFS4iEXSJiHJ3aIMormdF/6u9ptVDEkVzXBWy+4gVycS9Cyq1tYIMamxxg==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by SYZPR01MB7788.ausprd01.prod.outlook.com (2603:10c6:10:16f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 21:38:21 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 21:38:21 +0000
From: Emba Consulting <hello@emba.au>
To: "jbaron@akamai.com" <jbaron@akamai.com>, "bp@alien8.de" <bp@alien8.de>,
	"tony.luck@intel.com" <tony.luck@intel.com>
CC: "qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "johan@bergstroem.nu"
	<johan@bergstroem.nu>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] EDAC/ie31200: Fix multi-controller error capture, add
 Arrow Lake-S
Thread-Topic: [PATCH 0/2] EDAC/ie31200: Fix multi-controller error capture,
 add Arrow Lake-S
Thread-Index: AQHdL1njH1nf6PzgUUS8pDrLpemupQ==
Date: Tue, 18 Aug 2026 21:38:21 +0000
Message-ID:
 <SY9PR01MB10852F08D61253038C22D895EA9A62@SY9PR01MB10852.ausprd01.prod.outlook.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|SYZPR01MB7788:EE_
x-ms-office365-filtering-correlation-id: a1285860-ab5c-41a3-63f9-08defd710654
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|1800799024|6133799003|7055299009|8126099003|10067099003|3023799007|56012099006|55112099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Wxf7dSoMuNp0379xVW2/TrLrpsGgeLXNORo7fCdbDO6ANuM+dEPDFpvChKkYOno2RffcqaEj8rtnemWt/5xnsWM3u6ML33qTpfVrKHzwObsU1u+gBHtx7rtvcn1pJot74RjVv3gDAmWhMMn5ifw1Cd0QcqwFbOE6nxQgFDwr4l+qYqAUPV261JQjqqyHH0JJaEeCt153asav133BbTwKjH5LTLj6euXJreU93QTQFeFIij+Ks9ZRwJbY9SY7O5gXJDX+q4iKdAvUekvw+H1jacQalJPNAf37eXx2TNGl3kKDCU5nOjrOZEmsWE/AGJ3x888pbNRavQOx0saNHvwq9tA1g8jnHE3ub1zX8+B3Jgl78S+kdAfOHMw31sqj1F2M6O9SiynutkXQmp4T8abE9/O8grsPLFmoPmh5HQruO5CQG0Z85TVj+EHNPd0X9+bromOUOIqKChx+Eo5Jrj8xIlsNsdMH3/mcko6nDTBY/ADednzJoADeXQ6EBseHE4fHMUDs5hNYN4JSpy6W53bEBITdjjje8UgTQKWOIZHK6B948UsoEWBYvDMz9KPtU2GBB5grs24by93mrjGJ+jB2aIBqSLAb+8295AwSEqWUG4HkQ1l3XHstDZmG57yw30b/3Tjv2d3zQKNwbhMXsIObWrAvUJHy5CU7lCX/MJRXIi6O15bU4XDbv4aUCDaqDVbEEnZV4UiXZblrVD9FzI6IZ3VUe99h4tDxhu1oru1hzTOigC2w/OuF+vtS4Aql6AMc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(1800799024)(6133799003)(7055299009)(8126099003)(10067099003)(3023799007)(56012099006)(55112099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cKxaNe26yqvW9NRWLa4sX4zTD/oai8AT3iYiZE+9CJRDIPdfCivC0+RgHM?=
 =?iso-8859-1?Q?FEMbxdNJa4Gj03Q7wA0nh/zsrS311q1oVHLnvVG00EfA/BKSlTwAQh/92C?=
 =?iso-8859-1?Q?VF3Ho+ox/CvIq50A4zvqc5GTMflxd6FtRhSA9BLMUub5dMRptZ1YR68ojz?=
 =?iso-8859-1?Q?2VXrVoJmRSJfYYB/7OQMzKBaMOWSbLnUyzZfYS/1kwp0GJFnQBmjnEjbT2?=
 =?iso-8859-1?Q?ksHlluUlZtCchmo0nRYjx/C7uhR+NrJVXPeIh3/3Braqg113BPa86q06Kl?=
 =?iso-8859-1?Q?pl5p1NYfmQNw3s5U35/88rkb1HR8yiwzhsav+/Rlr+f9kzHvGeiIVCPQEk?=
 =?iso-8859-1?Q?MNnMYBZA2Idn6jclUQEawQ2rwxyiVwnPcyqF1z4auFXQwWDldc7gnWJ9zY?=
 =?iso-8859-1?Q?ZX94/2gx2W8NsqjRfq3wNxiDVFg8Z2QNU2IZPhwJNVjtDXDC5vgB+DbPCn?=
 =?iso-8859-1?Q?ydpY/U7OyGAUbLdATUBu8V4qwpAmmiwxQQRfNRvbEU3wW8FiLzB44MAgba?=
 =?iso-8859-1?Q?9awfJ6wsWIyYa/InYUqPlvFFASykOOc5or4PgDMEPKNvvcoUmloasSkNXv?=
 =?iso-8859-1?Q?QkWw04I2qsc4UQYJbviqwD48UMeNjOilTYIu3OzPMycrSRhGLqN/Sjf/5O?=
 =?iso-8859-1?Q?J4uSxTq8DTSGxJEXSMeIVfwokS2/N7FOoN6MWYuHTTOldju3GdszV7JbX7?=
 =?iso-8859-1?Q?okDoegI1qw60BpJh4Q03VApqDlRtWjnSbZ0g0hOdaOOaaE59Riknt2Xiih?=
 =?iso-8859-1?Q?nueEsmhpO/3+odAjaQHFfirgeD4IUcgJyKqjzOgm88X5I8deT5NnJyOf+V?=
 =?iso-8859-1?Q?Pt9/Mxn7Kob2zUlI0rAAyz7OcF9PrACOMs9Fza6b7bwCutz5LZ9IU1on5Z?=
 =?iso-8859-1?Q?IcfyBRfKaZqeeUaVjbXUDTH0jZzXaxWyVzHZ3SusjeNDgalD2a2kmz6kR5?=
 =?iso-8859-1?Q?Ksn/ZLMyq2BBkuv68DYKaG3X4/kdUrTBA/4+H25iu4G2OSMBdEBJSCu6+R?=
 =?iso-8859-1?Q?ZCVq4Y8z/pgK7JGmC1Wnubi4infMuYALi5JuBZk9DQROziDRNshP42FCm8?=
 =?iso-8859-1?Q?RmEQrKXp118hvoDr2FfO/Q9SzZUNoqtsudOybfnDKudrwqugTkqw7AoCS3?=
 =?iso-8859-1?Q?6Q3eBewkJYvxKRaekY8f4P280/ux258WIl3PSecPBgjXWiE8ACyBt4vnUu?=
 =?iso-8859-1?Q?Jeidv+zHadnhwqZLSD7iyJb/dMWcFIEW/KUPSH/VuFqcjuOH04kpG/1SEA?=
 =?iso-8859-1?Q?lMSyhXCxXP55ia8XiS5uck8MMQNmSxU0al7Xo1+BM32OLdPAIG2ie/dsRY?=
 =?iso-8859-1?Q?EIS4mnEf/PqmIeLrEZ67J+/3RhzEFWEu482iHoDKNAvG0tMl4O6ewM2Hh+?=
 =?iso-8859-1?Q?HcGyOMDd6k+BHQkGNruUNIQGEpidkJFq8r9humPE0bkv7iDHaRPMpw7CZy?=
 =?iso-8859-1?Q?wGEsQVQtKIX7zRLCmXnO1VJE2PbxpyCjK7asdj7MU4Us/6GsgN3l1HuJW3?=
 =?iso-8859-1?Q?O0WE+qDHEVpnmgw8RjD5dSWu7KW8Q4eEDaxTOrK14SycR0JlKsxbxV/LmF?=
 =?iso-8859-1?Q?c5JV7MVf7xzfgSOXaYIPxMoLm4rCpkCrOgoiuBbFgPP8N2BG0Q+z+R/mb5?=
 =?iso-8859-1?Q?7PfyE+dn+2eYc99zsG8d7Og+0OXwFIAZRiqwb9ZLk50UlDkrReK3I4LpCp?=
 =?iso-8859-1?Q?UMM5y5Jqcc5LsfjvDmyB25d3DW5hWHHh4cYXBxTV9gDdupnzCWn1s8DVCj?=
 =?iso-8859-1?Q?9HEgQbkinybTLpM1+R/EwtZppcY7bEJ6otqDSvg7v0082Q?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a1285860-ab5c-41a3-63f9-08defd710654
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 21:38:21.2249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRzWMFrFivCcpB78NXB/DYL/3hM40SwCsDh4dU5pqQNp+1eMWX0eDfs2FmIIaIkA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYZPR01MB7788

The ie31200 driver has handled two integrated memory controllers since=0A=
Raptor Lake-S, but it still reads and clears error state one controller at=
=0A=
a time. ERRSTS lives in the shared host bridge and clearing it drops the=0A=
logs of every controller, so servicing mc0 can discard an error mc1 has=0A=
latched and not yet reported. The MSR clear path has the same problem.=0A=
=0A=
Patch 1 fixes that: snapshot every configured controller and channel=0A=
first, clear once, then dispatch each log to the controller that owns it.=
=0A=
Patch 2 is Johan's Arrow Lake-S enablement on top. It needs patch 1=0A=
because Arrow Lake-S is the first configuration to combine two=0A=
controllers with CMCI disabled, which is what puts the polling path on=0A=
this code.=0A=
=0A=
Tooling disclosure: the ordering bug was found by tool-assisted source=0A=
analysis and the patch 1 diff as posted is that tool's output unchanged.=0A=
I rewrote its changelog by hand, reviewed the diff line by line and take=0A=
responsibility for it; patch 1 carries the matching Assisted-by tags.=0A=
Patch 2 is Johan's own work.=0A=
=0A=
Testing:=0A=
=0A=
Johan ran the pair on an ASRock W880M WS with a Core Ultra 5 245K (host=0A=
bridge 7d2a). Both controllers register and are reported as polled, the=0A=
DIMM geometry decodes correctly against his 2x16 GiB DDR5 population, idle=
=0A=
counters stayed flat across several poll intervals, and an unload/reload=0A=
cycle reproduced the same topology. He has no corrected-error injection=0A=
method on that board, so the capture-and-dispatch path is not validated=0A=
against a real CE yet. That is the gap I would most like a second pair of=
=0A=
eyes on.=0A=
=0A=
His hardware run was on 7.1.7 with patch 2 context-adapted for that tree.=
=0A=
The Arrow Lake-S configuration and PCI IDs are identical to patch 2 here;=
=0A=
only the surrounding table formatting differs, which is why his Tested-by=
=0A=
is on patch 1.=0A=
=0A=
Here I have source-side coverage only: strict checkpatch, GCC W=3D1, Sparse=
=0A=
C=3D2 and an allmodconfig-derived build on this base, plus a W=3D1 build of=
=0A=
patch 1 on 7.1.7. I have not loaded the module on my own machines and I=0A=
have injected no errors.=0A=
=0A=
Patch 1 carries a Fixes: tag. What is reachable today is the MSR path: the=
=0A=
Raptor Lake-S config is bound to 20 host bridge IDs (RPL-S, RPL-HX, ADL-S,=
=0A=
BTL-S) with two controllers and CMCI enabled, so mce_check() walks both of=
=0A=
them and the package-wide MSR clear done for mc0 discards anything mc1 had=
=0A=
latched. The shared-ERRSTS variant only becomes reachable with patch 2,=0A=
which adds the first two-controller config with CMCI disabled. I have not=
=0A=
added a stable Cc because patch 2 does not apply to older trees unchanged;=
=0A=
backport scope for patch 1 alone is your call.=0A=
=0A=
One unrelated thing Johan hit while testing: rmmod warns "Device '(null)'=
=0A=
does not have a release() function" once per registered controller, and=0A=
taints. ie31200_register_mci() calls device_initialize() on priv->dev but=
=0A=
never sets a release callback, so the put_device() in=0A=
ie31200_unregister_mcis() lands in device_release() with no release=0A=
method. Since both calls are unconditional this affects single-controller=
=0A=
parts too, not just the two-controller configs. It predates this series=0A=
and a separate patch will follow.=0A=
=0A=
Emba (1):=0A=
  EDAC/ie31200: Capture all memory controllers before clearing errors=0A=
=0A=
Johan Bergstr=F6m (1):=0A=
  EDAC/ie31200: Add Intel Arrow Lake-S (Core Ultra 200S) support=0A=
=0A=
 drivers/edac/ie31200_edac.c | 207 +++++++++++++++++++++++++++---------=0A=
 1 file changed, 158 insertions(+), 49 deletions(-)=0A=
=0A=
-- =0A=
2.47.3=0A=
=0A=
