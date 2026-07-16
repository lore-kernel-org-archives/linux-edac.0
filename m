Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022131.outbound.protection.outlook.com [40.107.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03426738C
	for <linux-edac@vger.kernel.org>; Thu, 16 Jul 2026 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.40.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784181309; cv=fail; b=jWeRR50v15P06azhQe8RMpCL5ZRF80O8cCtD4Prr537oNRP7HJewW1/kiRQSnmQWAlSa9jBtdQZI9iBUtZ2d/IgX9y4QVkfWp1dNFuO329wVk9oQ4ajBwNnEwnP1VjprG24eo4js4m4jooemu20r9ZPxgUdjKxJ7/RoKKTn/b+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784181309; c=relaxed/simple;
	bh=Oxcb98iIU+SldqlwdBmjAmSZSPrUuDh7Rx8U4a1xDQA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u3fc2ejBDZnNRDzucDeOB/rzs+QnXcsm9jImrG0p/b9vmkKOA2rdXq4TBoljV8+EHNJDosM8nho01zoUGiSiABDjKSvACND5iDlyuggIEiYQiUjcr2mtkZluDjulAj78YiFfrkKGbN8L2jjZkwrQ0qXoM9+JT9JSh1z3yfrKz2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au; spf=pass smtp.mailfrom=emba.au; dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b=JFNjwkH7; arc=fail smtp.client-ip=40.107.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=emba.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emba.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emba.au header.i=@emba.au header.b="JFNjwkH7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITi9YB6wbq/7Vp9+XxYorS4KMn1vaRnSHpRdG+d9287Mb8/5r6ytiBAh746Pihiw7nS3aj5epNHqtfIMxqx4uAYSXbcGfdyKfn0GY+v07yAy+Ka+we/uoTDMWy8CG44GiUPb0b6fR/6oYJ5E9WddX5ARPd02BV9Rf3rxtJb/FYGnPDJslMBm6O5g0UqepwhNMIwdXq74wbAsDwYBlMiignP+V24Suk2iuOKHMtf4KnA3VNAtFt9gAa9iHNtSDvVCwhGTvMzpmiiQklsgXlLipQUFThKWg0rClaDkMw6hYvCxfmPQAIBX1ZY764vXMJcPfJRPEwA2FqSsGh5ZJ14DFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYMCROGjVaR6TuRedKSWM4Z6V93SCa7lP5UKAyRiatc=;
 b=CDNVqDSG/a7R087A1ja4y3x39Un2xm+QHy9rEwNUazjZEktLBhdDogCZKCYyNky/BEUF0pxEVamL5ck7D8IAOthM3WD2/vhc7C1dhRaY0/lVACTSn9v2KR4ey83dMmY4ma5rv2FL2cRsjJMtHQUf2i08Ir+SKqZK7KAE9Xk/Gg+JuIqPgVstmfQFnGdkVeoNuqD23TVLqHjxAtl0T7esJxsr5iH8QyEH02yJ/q20w2r5xqAKGzjHZV8z12dKHxX6eMG1Wke8zoSSL7eGW6xsaWHgK3txUf5dhWnJfPbBVTyuA0vEeGi69TM1Ki7I2uLS1K6GitHGEV1CTpM2fNbd0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emba.au; dmarc=pass action=none header.from=emba.au; dkim=pass
 header.d=emba.au; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emba.au; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYMCROGjVaR6TuRedKSWM4Z6V93SCa7lP5UKAyRiatc=;
 b=JFNjwkH7xH+YXrQhHqK9GrMrQCCeLv8mrctC7ogL382LcFR1T293I6yqya0sW4UhusEiiXW4lyLnJSPgiIGaxXXqSP8MuVbLSjny7uNDM7v3hu9Y6n3hA072plyMntnuSF/zNccFq9Ff9giQi+Ws7+X8TnN9t+iB0jVdTaDKht0k4mq+dbsFgr4yY7wDV8o+HG2cRUsweeKV1lfDtsbBTAjP0gxzL7otlrzUjddpFSQgfzm1zCI2FFXL4lv4YceqYHOGOshQv20idklGtSdNb+kjt9WTMVExc5GE+YTK7p51IBt5ri/DVPh3r4Z1InAVOItbcc70SfSL7xJjqEobxg==
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com (2603:10c6:10:320::13)
 by SYBPR01MB6716.ausprd01.prod.outlook.com (2603:10c6:10:12f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 05:55:02 +0000
Received: from SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d]) by SY9PR01MB10852.ausprd01.prod.outlook.com
 ([fe80::1512:d1f9:6ca5:9d4d%6]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 05:55:02 +0000
From: Emba Consulting <hello@emba.au>
To: Chaoyi Chen <kernel@airkyi.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"qiuxu.zhuo@intel.com" <qiuxu.zhuo@intel.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>
Subject: Re: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Topic: EDAC support for Arrow Lake-HX (8086:7d1c) - working out-of-tree
 driver, test hardware available
Thread-Index: AQHdEDl8giR33UKdQUiabq1WYsVwEg==
Date: Thu, 16 Jul 2026 05:55:02 +0000
Message-ID:
 <SY9PR01MB108529ED20B30732B9070D40AA9C72@SY9PR01MB10852.ausprd01.prod.outlook.com>
References:
 <SY9PR01MB108527BA385DE411FE1B69FB0A9FD2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <SY9PR01MB10852E9F6484A7DDBF3E8D898A9FA2@SY9PR01MB10852.ausprd01.prod.outlook.com>
 <0C9D891E25801298+57a8987c-8158-42dd-93d3-22d8985cce99@airkyi.com>
In-Reply-To:
 <0C9D891E25801298+57a8987c-8158-42dd-93d3-22d8985cce99@airkyi.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=emba.au;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY9PR01MB10852:EE_|SYBPR01MB6716:EE_
x-ms-office365-filtering-correlation-id: 97012d1e-758e-4cbd-3602-08dee2fec76c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|7055299009|56012099006|4143699003|6133799003|18002099003|55112099003|3023799007|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 h9s3b7FT+000HxsJoYtYE8/n8YlgzusWeboP7Py/nWjK8WCGZA0hv/mLXGHdfEg/a4IaG8JBFF8ncEWo3zIRWCq7pyo1cuN+HYrCNSExHUooUl/D5dyZ1iG/3wpYxjZ6PW7UjqtLHwgXa5wQMf8pOa2GkrVVnrHzDALUsaOKWgLvemqgOxxCRpRotuabVcvDfxdcL5SH0BxDuBwA3W5aNLSUTjJjQHummGk5m0rIjn0D8LmfpCs1fwexqMvGitOmSoNW9E51JjXTpAyASw5JVVPLX4UvfWSa69RLSwYfXbiDEVS9aYc8dCWXuZVVjWDlaqxUKzR8bQjF3YI1NQCQWCF/jcw2qmlTX5CTpBuNxXrYjbTjkR5hIw+cUsSvtsIkn4epmmdhruS3xkOzv5dyuXngh8Kd9YlX39Qy9/iFgPE36CFQ37ApSC6mpCo0WC7vaSma1ll0mRaHhyytRq71Aqrif8DkNe/fwZaM4WA6t+txZBvXWzbZNtpEOjwT/KYq0ZOmZCMHDDT++IPXK/wnFHsjWKPHwNpunigzTNgwnx+B3MXujFqGgHK6UiOmr8YeQexD3ZoIAMJ8oe4VFhAGFfpjkLI733tQPZE05dBdUW2rXRRV8LLSOKdgN7gK39x7/m6kWb/7QTeqcamaHcBBi5EHsHseFFiqZEZib0QX7YGuMBOETDrMT45Yikp5VCm5WONeqDMKBJ6Fan00Ipvcptpxr/6uuNofjaeTs4eThp50Ye+v+jz8JvaMd8Afd/Ir
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY9PR01MB10852.ausprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(7055299009)(56012099006)(4143699003)(6133799003)(18002099003)(55112099003)(3023799007)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LYvlv0DSqqZ3FHQ1/E0mwk8XsbbmIeQ9ee2BUAoPEE1Ue/lp30wIvTXBtCKo?=
 =?us-ascii?Q?2/jR3thdRRUvWSHG08xFzwOVvrcZJyI0jrm37EsA+0s3jh1b9KbuQuBJC7Wj?=
 =?us-ascii?Q?ay4pWJ1QCeADzm2soSzaagl00KJIKuR3sKutT390k4STbjHEwQxhKuyDmOpm?=
 =?us-ascii?Q?GOoQT3830lB6PBI+UZ4RylsX7AhJEd3BPcLr/8DycIRJPmisdn8mvBFKRtyb?=
 =?us-ascii?Q?rzBLUf6xhWhC/rTv0TskFIkXIu76n1bkDRhXFRPhfW9sP7ptB1K3Vr+53W6R?=
 =?us-ascii?Q?yzAS9WawRdUrZcw2/hHklYEVQcCL61eyN9MZEW5e9X+Qw06bxyvu8uWqHqB1?=
 =?us-ascii?Q?FSpUVbjGWJ6ekynqLTdLq2kE1qrcUdz/oFEakmzA4Ek09qC8Au3I/Dh6WkZU?=
 =?us-ascii?Q?UoEQZLPMKRRSgF4q+KiKc3lCiTSvqYo9kWAYKYoGGeHHs1wHWhWs/JmnOOob?=
 =?us-ascii?Q?iw4j8EuOnV4wE6oZzMa16lF9/CSu0APYa3U6TKD8HNbsll/5Mc48d0WKb11A?=
 =?us-ascii?Q?MTZx8F2rYVaghQogivqUAC0LW7uW+r2q2TFG99Le879HCjcjOHo4wWmlJDyz?=
 =?us-ascii?Q?2glaE/gVESHmtZYfeGqg5k+dW2KFaD64CdScm3uoRbA+Q8DHroanDSB6i2TY?=
 =?us-ascii?Q?8FqQHv4Gu0JLEog/oUWIfJoLqE1fzVVvBOf0kocG1FzOxfRSiv5L+DISikHJ?=
 =?us-ascii?Q?z9U+QdVvKYLugNHtonozWwOS5z594axOJ3CQt/x0CqDOWxsnMwOTL/fV3gxZ?=
 =?us-ascii?Q?e+5gWK2uvRVf/3GA2Z/wGvIOUV34PGYu0TwhZRRNnrBpMxlZ/cMjl//fcy9f?=
 =?us-ascii?Q?6xyQs/W/Z/QYhNZtLI6CEu6CAst0227B2X85E7sl/VrnLNIVpUEr49FDCSzD?=
 =?us-ascii?Q?N80Xo11e9x3eRQWcluBAi2asstvnB0uzmpN/aKCvF5nAlBW0SbZ9yJoxbZz2?=
 =?us-ascii?Q?JwDcOdJXziavQGW3nFqy4CB6s+iSF8Q/IHhr0wTHMzBk/790rLvuGYOxOksc?=
 =?us-ascii?Q?2oHt+WBjJmwt4FxVr1TL/LQeHIeGd3MYo0Yn0JuIIxCYwlBcALIE7KrC1LcW?=
 =?us-ascii?Q?4ETpKxdUDPDcZaz4htvZbYod5y3+58s4ITdoWFHHZgsxjDAsFT2vu/oMajtD?=
 =?us-ascii?Q?a/gk/kM0agEOz37aMSp9JbQnBrNLhfP3n3PloavdNQoe+/tOHm6HfAx7jc1k?=
 =?us-ascii?Q?KwSyaxCfBQDPnmIxGyyH9qxY5ENWIXL6qfp7augqMJTJ2rsL0VGxCLrKoQwD?=
 =?us-ascii?Q?Jx9oBWHYX+6pjQSvhagdv5Dtt1tqIBuFUfjpb8Tyuhb7D71pQwpClBMDmp6l?=
 =?us-ascii?Q?4meHppVo2zv2T7qgL+U8wei3g/GoFTIbGEdzh5rN+I98ozB0KeSld1KEg6Ln?=
 =?us-ascii?Q?HylD0ZdZbmo1tzBQxHxDY9+m/8c9eEfC9HWwGFOfwgk9flE93UCAhmwneTHY?=
 =?us-ascii?Q?vt0Xu7ylfSUCsARzI9Fp2gB21XFvnoqbi+HC9Uztq5Nzt86c6WrVrsj8G38+?=
 =?us-ascii?Q?51ed9fF9su/uvS0YeYVzhsYtHYjZSxlbOyVfdOxZd6dLoIAsII4QNZH0SG8E?=
 =?us-ascii?Q?1Ol3X/xVfgRoZ1swvD6a+bl72Mds+30kI/Gs5iGVTGVW0EgUitQNN1Yi0/kI?=
 =?us-ascii?Q?gbzEI7sRoOcZXbHuuZM5h8Y66LNl/MwWUD5eTWlmuOhFmXPf99DVJpqmkYRh?=
 =?us-ascii?Q?ypIKxRSWHxpgwITCozLCK/zkG9Ibh/oxPDt5R80gEjlfbqEf96tJFr3oUJkl?=
 =?us-ascii?Q?s/WTpjNanw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 97012d1e-758e-4cbd-3602-08dee2fec76c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 05:55:02.7436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 101dbf38-5458-40f7-9513-7e6108b82c03
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqkRjA3IiDnCPeUdGXEWu3eq3B5ZKkgt//wN8xK1Pu6rfT7/EKa5n7dWIb5X4MKF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB6716

On 7/16/2026 2:39 PM, Chaoyi Chen wrote:=0A=
> I have an Intel Core Ultra 7 270K Plus (Arrow Lake-S Refresh), and it=0A=
> appears to be 8086:7d1a. I'll test your driver, thanks!=0A=
=0A=
Good to hear. Two heads-ups before you build:=0A=
=0A=
- The module's ID table previously matched only 7d1c; I've pushed a=0A=
  commit adding 7d1a (reusing the ARL-HX register map unchanged), so=0A=
  pull https://github.com/zs311521/edac-arl-hx first or it won't bind.=0A=
- mchbar-probe.py assumed my board's MCHBAR base; it now reads it=0A=
  from PCI 00:00.0 config the way the driver does, so pull that too.=0A=
=0A=
Suggested order on your machine:=0A=
=0A=
1. mchbar-probe.py (read-only, /dev/mem): it decodes MAD_DIMM and=0A=
   ECCERRLOG from userspace. If the topology it prints doesn't match=0A=
   your physical DIMM population, the ARL-S Refresh layout differs=0A=
   from ARL-HX and the module's counts shouldn't be trusted - the=0A=
   probe output is useful either way.=0A=
=0A=
2. modprobe/insmod. The defaults never write to hardware (polling=0A=
   only, no MSR 0x791, no ERRSTS clear), so a load is safe even if=0A=
   the die differs. It refuses with "No ECC support" if CAPID0 says=0A=
   ECC is disabled.=0A=
=0A=
Output worth sharing: lspci -nn -s 00:00.0,=0A=
dmidecode -t 16 -t 17, the probe script output, and dmesg after load.=0A=
And if your board exposes an ACPI EINJ table, injecting a corrected=0A=
error would exercise the decode end to end - my BIOS has none, so=0A=
that is the one path I have not been able to validate.=0A=
=0A=
Thanks.=0A=
