Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795001589;
	b=fAl7+HwL7WrL2vERM0BtJ3crm0fWFaPqYCiu4Ea7IU/n+P8jqCS5OU1BTI8tWpcRSFH7
	 G5YfksqaDvUj1ZsHYTclRNIBU6Aprf+zN7N+dTmelzwlXPvaosBDklgELMBrJ6NVMCFzp
	 xWYKs0YIfmet9gviPIFBE1oPct/0H1nQ8XkAss/PObuD9eDBQH5BLVeFkUW3iNB3rof80
	 XWQa5nf1ElijJ6VhGTVXDMqwC+cmcKHLAgbRgAVLNfsKlyoBnrgxauWWn9cMmWlMDbXeJ
	 fd/K9tDNc/EfBDZrJCufxZNzbIpXI8fz99tIZg5okWsblR+lkeQTnn7+R9VVafLNezg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001589;
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
	bh=uf7b0JGHZ/liBywz40urUO13fejLwaspYmQMwUhvEWk=;
	b=KzyuIMBnhFO7+OzeLMtoxf/WJIRU0GyTX03oHrmL2o4WFtjvkfx5NYXQ0i9DwpGofzqa
	 kaa+5FjCVJX78RKvB3BRtzVBAOkQ2Q0uvapg3svNCcrNL1N0ZMy1F3pA5SZx1ULiM3NrA
	 Mu8pprkR2ugihQZ6nNufrMwukdmOkcVplLpF6u1NsLA6FQL4ph/JUUGWXWSkUt/a2yDuP
	 fKQ9qqMZyDsvwVelXPxTej3Ya4iBZF2FxpDb/Y4UagT94czQeRTl1o8BKv23pv/CFR1Vb
	 hHAZZTHZ48/o7NZVHf3O8S/fNV9kwYf3nAlTIsOqzIBGyfewLvMHlJlPmDhmVoMqdmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=icOkyqoj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.18
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51B606A32C;
	Wed, 18 Nov 2026 11:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D51B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=icOkyqoj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR9PgZta8Jx8HM57b0WBFmkcL+AXJNJm0qTd54dYFHZ+JnIkP3r0rq7tc9fDNA2q8vjsUJaENirpGQohV6LGCdNieyIMicluaTenehVMxk61cq4bz4EK01TywOwtocnWrVNusyEMCzanceVtIWjfJLP6+i3dNg+17dahVL7BBMyKLdL2u/OUz4jz1VqP3KHSyz2frDUfbTgowqpnMPFx63hONKCniEcYLHprCGAFgNcX8PMRurCvvBoS+c0BefYNvX722Wty5tOxeiVUjuVsp+BRnLYIV1VvgpXZw16hdyJ2J3X+x96HsWYTNc6eenJCGm9BLDeXw/Ol6DkZkMf7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf7b0JGHZ/liBywz40urUO13fejLwaspYmQMwUhvEWk=;
 b=XTK4Sbma2Olp0X4r6VEEiFxWLsouwdzVe8IsYWvNbuTCGy83PKJApbVxoOFQZnY/pJO6lHlDJN+8p6QU98/pyl+6hT7oAFfmNJZTpXQ+oCuB0COXR/dILvBWJhIeKbkkzUhA7KPmfMx5jV4SY98TlZntFXvKM94Dixp9loAw/ZNRuAip6tqf7/xDukD5lJyge/5p/fe0hPOdKFTYaxRH5Qb787V9rrD54j9koRgcc2LL9fRNxUr8+WblAzmfrTgw4Lzs0/X4CY82we3dFA4MLwQ1BV1lpoJerXhfVxwd7l+ECHesJoRrmEkIdhfxee96vlJDeWU1JP75MFd4E+Um6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uf7b0JGHZ/liBywz40urUO13fejLwaspYmQMwUhvEWk=;
 b=icOkyqoj5szGiplVbyuHKzZLFBvn6vl/LL3N8bF+NE7yiAxXCC3CNyOAwXEDAXJ/M7dhbyQTo3NdxJIzSeK2EOZ9lJeUYMlacitFYf+LTdPN+w1OFeNmxeWxODZ1pN58llO7TDk+sZrer9QYCHypPsikSjSptnxcAs2tRHgBzYPMMOOim1GQI8ZRsLq7KIS6rEb/Jx2Ap1xyPyYOfNWnLOwWJBVT1RRLRel5kqg7nA+FlsW42YoBx22ttrM9b6wsyUfl6F+TgZz1Ba0woUM02ebkvJMDj3w104Mmkxe7neyxDznx5zsN0vWMLrSLzNjPn54dPc0xkOzx079AnumxkA==
Received: from CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 18 Nov
 2026 11:33:06 +0000
Received: from CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc]) by CY8PR12MB7290.namprd12.prod.outlook.com
 ([fe80::a8ce:7b9b:3e72:d1cc%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:33:05 +0000
From: "Qiuxu (Leo) Zhuo" <qzhuo@nvidia.com>
To: Haoxiang Li <haoxiang_li2024@163.com>, "tony.luck@intel.com"
	<tony.luck@intel.com>, "bp@alien8.de" <bp@alien8.de>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] EDAC/igen6: Unregister the correct error handler on probe
 failure
Thread-Topic: [PATCH] EDAC/igen6: Unregister the correct error handler on
 probe failure
Thread-Index: AQHddzi89ihX6e8rVEOvGpQ3h69Oz7czsbOg
Date: Wed, 18 Nov 2026 11:33:05 +0000
Message-ID:
 <CY8PR12MB7290DE2C04CBD623FB3CA72CD17A2@CY8PR12MB7290.namprd12.prod.outlook.com>
References: <20261118084200.2184184-1-haoxiang_li2024@163.com>
In-Reply-To: <20261118084200.2184184-1-haoxiang_li2024@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7290:EE_|CH2PR12MB4277:EE_
x-ms-office365-filtering-correlation-id: 59087d74-9c54-4f4e-e660-08df4567b6a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|38070700021|261026140227099003|56012099006|11063799006|261102123227099003|261026121527099003|261009223027099003|261021121427099003|261022105027099003|10067099003|261028144727099003|261021123027099003;
x-microsoft-antispam-message-info:
 0nBJolV0CEVfp1lUT4W+2kV4MiPHreGkXicFo9iDOs4Q1CLOB9GUqBtM9OFg/WnZnUhqFfmBc/HA37Bw6NzubWe1EPifYNWwWTCG05J8JK9mFiGu863dMuTbAbaS/7TTb7nBK8ONKiW0sfNm+ZPU1c+M4cvB6+K1uCQQFEaK+Tosx91cWHI0NQ7zf+197lT4UOjOH9CjVGzR9qCVnOvCAVx/d8DvwxXqljd4JcC5jnZaINYyadFgL9CeeGB1tFr4EnR9cIhBIL53RvJaGnsBe3SCqcDW5EJGYjdoTtpX0U7291hjCX47FFlmPd9V5pcAyYKfEJRuwzbDpkfeFngHMq/pIB7kAKV3yf/0HYeAppAQRVOGCrzB43QiI7i2C7jjbY0akW88G+NlakCAlsfIvKCnw5BwKUVsxY2JGgdSKA7tdZ4YgwIm9438M4piopAdg2OyENHICx7qdByuciT7FfJb6RlC85M08MuPUxTUhy3tIGJiJxByQIk1vAO1LKEFQbwu5VCkVZzoLhgde9UbkiM49674Oz9eYNh4wBN/PRHXaG7IFwEZbp5mRARkMH1rHguu4veBDVkCECmSLFwvwJO5salXHnb4yd3RxwAbTyf3KG1PQ/AzF+dPUYSCK4YiqpinUFPaxHc8l0NJwfo9lu0ZGVZQP3/IRdRmS4B0A8gWCHSCnDr0mJ2GQxdVPE3gYLdK9IxCACi8UHW5ruHQ/dagttr01XUlebRG7woGU/U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7290.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(38070700021)(261026140227099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261009223027099003)(261021121427099003)(261022105027099003)(10067099003)(261028144727099003)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aO4s5Hnp/1U1Y/bplZDN+vRQ6pymFBejtNpWg1r1GYXD6SF4uqq913oiQtN7?=
 =?us-ascii?Q?gJsIGzzLeNmoDHrFQ/3rYcFaSloKOJm0kyFShoKN8/G4wNiyq0T0Zwm5wJzx?=
 =?us-ascii?Q?wt7RVCnqXjdKmUiPmem5xmwn7zYRvvmmkbF2VUB0e6JaZjiTSmKxRQf7FG0x?=
 =?us-ascii?Q?aqzQN0S+0h1CaOtqJtQEvpX0qqZZ49VCKYiRIKO5tLaV65U3gkp8K9rsdnno?=
 =?us-ascii?Q?VQDpg6ATD4nnDOKxj6SFcwP6N/4+SOcZH66cTNJtKQ8lI3t3dLcfGskS/PqR?=
 =?us-ascii?Q?HaS4ACBk/B28GYregvAgeuk+s40/7PsQ+Rbl2CRqjtnKxBRP2qXC8K7TDW6q?=
 =?us-ascii?Q?UbU/UoQOOCcKR5yoYl5TzMFGyvCJOBJJzdneZeURz49IvaFrIAHhCO97KGo/?=
 =?us-ascii?Q?qe5Z6PbjY5JWTqJdLvxnG8ZB4LFjQP4ULnbpH5XOep5PDCxrg0wji69WTc1j?=
 =?us-ascii?Q?mBpJ/OM7HqiBY3qs1oySC7+tW3nQpjAT8nWRyeYU/vSR3m53UVrOQpOSlyeB?=
 =?us-ascii?Q?gvmPhRTXZCDBpVytUx5vNqE73lfURtF9KPUWIZ9GOltuIn0WLwKa7fORq7bK?=
 =?us-ascii?Q?yGBem0aUpZ9IKJQXXka+rmQfI/ZeVlIJJycZVCmynOuuyumtug/OxI3XFfk2?=
 =?us-ascii?Q?IYhZ0v2xAmx2e1DZwcSHjcwE0YxjhkdEfbbsIMzGci353AsxYDTMCiLe710S?=
 =?us-ascii?Q?BokPO1PZh52XjgrNi/yvq4d9EikBYqTWm3AinhTjPv+vq9/N9xuM8bAEhKwF?=
 =?us-ascii?Q?0/Ytgys0e0+7iH6Wjg71BejhYDrfzIfWgJzL289qbstJNvqpe9qxX8iwIExf?=
 =?us-ascii?Q?DGfz5X4JdR+KwLqol38T0jKjQw7gQQmQILUZ0+VNEVrQGho3jQjktEe1GW4S?=
 =?us-ascii?Q?pcEkw3NbH7fgTGtir9/9zmu3/fPdh4N2Km0iKVqqUb/WCwzMxPa/DzFIZ1w+?=
 =?us-ascii?Q?E7BN9W6R50gyjt47ZpTLmCoRVpHaPB2V833+3slUN02qYvY2ua0z55RowrNZ?=
 =?us-ascii?Q?Ov+5u5lWvmkfzJQd/u50g54gap4JSEGnz8AMRvsbNRqm3oFj61HBWPvPV6CT?=
 =?us-ascii?Q?DGMtSIXvI0dTherUIH8GODuqmpOEzz2tXodMompl2QTzLU426Z+HHaZGQPgZ?=
 =?us-ascii?Q?ztSbSaX6kEBBwismFVWf2PCZND1HqQgUdu33wm9+b2HsagtvxRv9MwPk3XYL?=
 =?us-ascii?Q?0VRjxkmmlqciNT74DdQLEqZtWQaIr1twNWhZ5z57Yd3eaCjK3Frk8cvEubg+?=
 =?us-ascii?Q?xBYmE4sf3M9/3D0WkS8NT1ZkFYGMQhk9fUinotqFRWvbnrzZ5H5YpCtuPoLM?=
 =?us-ascii?Q?Hfw/L/kIdzPkz4QrNmLFKUIb3KIbOP/YhKeSqgYTBcYmjRp/1iBEXqIWIx8I?=
 =?us-ascii?Q?8Gu1MlwS6tmpfIOsWjXLIIih6HyGFAEnkrvaXXNf6ubusjKwe25wzrwVTO5G?=
 =?us-ascii?Q?cEoFcbfVd/8V6Wdw98y5DDHZt+ExubzJO7gkh7jGoT+6g+XDcI8MVFGaTd/S?=
 =?us-ascii?Q?PjSTV6I+rOd/cOfNuPMw1hHa3kIjAbPoIKpb9Qvsg2o7b8zTOnJBA6jfEZ59?=
 =?us-ascii?Q?gGTTHUaOSY2dKUEGLttzNoVS6FXmK4ZrL2RkAUBPAM8tW8moQS2X6j0/IIkh?=
 =?us-ascii?Q?0UWA+JVACBugOY5yQSQtz06QKJ+7xbb8bfyPcvVWMTcSRxRxjs9blBSB3HAZ?=
 =?us-ascii?Q?3DG17r3Sog5pSOqeZhlvpyDCb7LGnMHIL3nn9mqd9n+MeFpV?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59087d74-9c54-4f4e-e660-08df4567b6a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 11:33:05.8018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Svh1MoEbhSAI/0qGokdueM7Ms1OFksfOfKsLLiTVgTWTbbKHZueXJDnZFzJss8eHlYVu6tR7LZIGQ6yHKa34TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

> From: Haoxiang Li <haoxiang_li2024@163.com>
> Sent: Wednesday, November 18, 2026 4:42 PM
> To: tony.luck@intel.com; Qiuxu (Leo) Zhuo <qzhuo@nvidia.com>; bp@alien8.d=
e
> Cc: linux-edac@vger.kernel.org; linux-kernel@vger.kernel.org; Haoxiang Li
> <haoxiang_li2024@163.com>
> Subject: [PATCH] EDAC/igen6: Unregister the correct error handler on prob=
e failure
>=20
>=20
> register_err_handler() registers either an NMI handler or an MCE notifier
> depending on res_cfg->machine_check. If enabling error reporting fails,
> igen6_probe() always unregisters the NMI handler, leaving the MCE notifie=
r
> registered while the driver resources are released.
>=20
> Use unregister_err_handler() in the probe error path to match the registr=
ation
> method, as already done in igen6_remove().
>=20
> Fixes: 0b7338b27e82 ("EDAC/igen6: Add Intel Tiger Lake SoC support")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/edac/igen6_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/edac/igen6_edac.c b/drivers/edac/igen6_edac.c index
> 776c5db2f598..a2207337f251 100644
> --- a/drivers/edac/igen6_edac.c
> +++ b/drivers/edac/igen6_edac.c
> @@ -1948,7 +1948,7 @@ static int igen6_probe(struct pci_dev *pdev, const =
struct
> pci_device_id *ent)
>         igen6_debug_setup();
>         return 0;
>  fail4:
> -       unregister_nmi_handler(NMI_SERR, IGEN6_NMI_NAME);
> +       unregister_err_handler();

Thanks for the patch.=20
Could you also drain ecclog_irq_work and ecclog_work before destroying the =
pool by gen_pool_destroy(),=20
as igen6_remove() already does:

  +irq_work_sync(&ecclog_irq_work);
  +flush_work(&ecclog_work);

>  fail3:
>         gen_pool_destroy(ecclog_pool);
>  fail2:
> --
> 2.25.1

