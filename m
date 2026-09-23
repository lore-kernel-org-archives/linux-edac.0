Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013048.outbound.protection.outlook.com [40.93.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC424EDCD3
	for <linux-edac@vger.kernel.org>; Wed, 23 Sep 2026 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168694; cv=fail; b=Vjohcit5+N3Ex39+4tPi7B9DQQuPoYyIK7I/9J87t9Fqb4gFL13XIfWfmFYFHeC2IPdYKax97CpmEMzHZYvSOCE6j9C9Hizf8PI+pr/m+/4noeuyOrpr/J9pa9kykAOAvkNOChxvh+fK+J3tbln6c2dziqIet2XmeRSN0WFSP0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168694; c=relaxed/simple;
	bh=wnyKNBKmwD13haKM8A/+tMhe10zCvPFyPj2tfvix4U8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZpH6OqV9pmyzX+wuTDkREDuKSEdKOTWt2AkxHtQcma6CCqSa8PW3Bvb5UCy2HIS4gfLngF/3i3WSW+Ur3KJrmBtoPtgzM5p9+VG/x9Oe0v1pZ3ue17PIlZniPUEEVFhK17bTGmlVtEuGvi/ipa6chlq2exNdbVxjaqGIEcrsuPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xPyNQsDy; arc=fail smtp.client-ip=40.93.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xPyNQsDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opu3xN2ruxmmgLi7arj2QvZHX1mSenq8BVbj7TiEgeR1T8r6YifkoI+cYmydKnD0K0MH0Imlr/NlROmj1KhHNLyNEqrhQH9WVmZpBA+r7Vvuu21Vu16GVGZ7+BphaqrfdP1QwYjogFzJqRE0PABoesU6CFq1qUGrJ7aH58gwrV34w8Ut8BPc66MuDou9eHkyByG6wGy8soNU/8cyya/UItwTNwt19rMRfUUBHPpghoxHAaEc0IMA7F1yQtj8/ekXXvz6Ta/bP5mq1dC2Zs4RMAUvhZVO94pF6RADHYrcoWgk3wFO3orI6bvaxLv6mBvAHeTOKlyL0r5GKWHTFXxkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMOxjG//qsGJBacZcP/+0Lc0NPbFM/NLIBGMeoFOLfk=;
 b=G06AAzt/IAREXqbM4gq/z0HvjX/UHNB2jn9ToPcMTDf71uvjhyPVAwwYmnJ8e8+WxYigUT+jOuiO1V94+IV2Pl1imW9opJsjkxxbHWN6U5PEmWIvWazVSf5670TNNjAdftMcYVFX4ffywARXO5fhCAILZeFU10hb56jeDfGyeh2iAeN5X1hK6j1SUj//PUQnupu1dTG4i1RvQ1Xq34q9tlGbJG+Wkxo3fpwJ5eRGOv3H9BzkwqD2fNgiulzgfCyQvUqY4kmscWtanLa7jZh2P71W5K8RguurKDjCi5q7jmpptEguanoBVAPodHRNttBkuXTX7MmqrbxF3EMQEhcuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMOxjG//qsGJBacZcP/+0Lc0NPbFM/NLIBGMeoFOLfk=;
 b=xPyNQsDyXS1tRPlRGCpALn0yqj4AEXGUrF/FBxUyGRbn2O8Y6239WR3ktL+5JUhG39mQ7Kw97iZVbgy7a8LsauT7D9AL//UVGfuWHa5LebHIr3TvHET97VJ/gdwhNEalT0mNDNSb5tQIYSEiuFL0b8/nHNp7Je/5up15v7eKNCg=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by CYYPR12MB8703.namprd12.prod.outlook.com (2603:10b6:930:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 13:04:46 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 13:04:46 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: Dan Carpenter <error27@gmail.com>
CC: "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
Subject: RE: [bug report] EDAC/versalnet: Refactor memory controller
 initialization and cleanup
Thread-Topic: [bug report] EDAC/versalnet: Refactor memory controller
 initialization and cleanup
Thread-Index: AQHdQodaH6kixX8Gq0aoC40QD6GmR7bcMlXg
Date: Wed, 23 Sep 2026 13:04:46 +0000
Message-ID:
 <LV5PR12MB9828B27452E365BB34F90B9581822@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <aqT9d8BzRhPuqggH@stanley.mountain>
In-Reply-To: <aqT9d8BzRhPuqggH@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-09-23T13:01:49.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|CYYPR12MB8703:EE_
x-ms-office365-filtering-correlation-id: 4277e673-5fea-4e14-41fe-08df19733e56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 t3r6aJ1+TXDbvBeocojE7uFkGw9y6ugq0Q/PzDHBGmrAwfjJ0NddUI/lpgYedlwvUBjFHLfFEcejubvH0kl1eyEcp6SHKz9Z5KlhxI3ZNz+pVWFNqDh0RXPTBjhMHbYKfajfuxEGUhRS5rYQ15CT2qH18C52mb2i4PDivDCuUQhOu9794Io4ZRKOkP2me0QRkFwi4az1SL8hX6i3Tv1lJvXobrLcSWWXdOxxKLXavMrLC0CtALnabNJja6eeKi5bGr9sgxbA2++wjImb02s1u7kQsoPWLbUu3AzBHU+uo6KcE9QT0xZJuYLEPQR4XpfeW0en8heqvGx5Cs9jqEq+9h1PbyDsVUVX4Z0YJ4k4HC19b7cSX68k6EQzPmeB2QE603IIK3QdaqFKRw/GqiXdmf8+m6/EZ3uKmzdZg2HA7U1WiWI/7cQkJv0CnKzhtdbW1cpNPkQIQ3/suaaM81SXjoY0DPFNs/FjchEvVWXSPmrxAWHIUKZyPEL9Vi8q9Bmys/w67E7lh97KJ8gqUbnQRvDNcQFunWjFupTP8v1pM2jWMePOD3CllP2qcKfmMlHvjQMbcAspdrjmvz44vxoCKM/Pw3b/FB4MnmF61w+0njI0h8lW/D8YiKOsyWym1BrQEDM6Am9hJXxMPTBtOZDqVz0AgRuLcH6SK9EX67Bxt/iSjZnqOnQQnaGBTGx5nMb1JSKESYBDWsgIV97xsQ7QVZBgj8JUDcwrA2xyytavWzw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dPykLHfdt5U7twaFvCq6vOr8zxSj5SmEHfZ1fZhb9t2s9YUZG8ID2y1O7aWl?=
 =?us-ascii?Q?jUWvZKCc59qV43TI0Wc8gzOApji4uJcyUpuJshw+X3C/rLcv0dxha9PWHZMK?=
 =?us-ascii?Q?6VT3q5QPs0z2tVhY24vDW3JOKyJK4isPZX1bsNtwn4I4oMuR1W50DyewneEV?=
 =?us-ascii?Q?YOHTem00bjfr7LA58JwpNwhzi5LUDCZqqEYb10sChgDmVpc1o19mcmquP0N4?=
 =?us-ascii?Q?aUDh8KGLy4KMGy+hsOANtVKMvIMCP/h2Rd58Uu+LpFtvr7L8eFMgSKt+2KYi?=
 =?us-ascii?Q?XbsVsKa2ZiSF70lo0ZdFONTA68B+gYIF3utmqfVUXhXcmJbyTW7yG9xiq0o0?=
 =?us-ascii?Q?9YpK5hwsYO+xU+TWmG4nXU5BH0r02Up/zwVYahoCXSJQN2+XpCf5Hiz89Qpa?=
 =?us-ascii?Q?nJc3CAQloyS7sflegU6uEztse/aPNoEoKRWpItq96EkIEv+/9VD8f7qWzA1f?=
 =?us-ascii?Q?t7xbE1Ex3hcwMvKS69LTOaIA2AV4XPW+RtH9gW7OM8I1BjjPOPgviZgGhWOV?=
 =?us-ascii?Q?PZahHfqWNXlXCnY04YbP/l7Rtee8sBojv9/a6pBdXEnad8yuelrgWjN6CVoN?=
 =?us-ascii?Q?wqf6E4qh4FLx0uEzXFl4beOrkG3+PWhnhqugswZTBo5x2tLfaTd7Jkh4Sty6?=
 =?us-ascii?Q?rbDKiupmyBajTi7KdWWSthqHEZbQyV1xf86uGvkMXXz63Va8nI9SM9gRlzGf?=
 =?us-ascii?Q?Ait2TLS58SAyllN3FuvKa/GEgtJDi/ez5W713LxkK23yEJLTrWlOrDZUG9gY?=
 =?us-ascii?Q?An7s/Sqk1UybfyqoZkQCwd3WlDx/M/nMIrY9PQWIh7LeFCiL3sic+QWxco50?=
 =?us-ascii?Q?7YluVSmmzAF50BWAzIZ0ukk9EeqJWGLPT0tKol2jAB4Y83oqWtwqbAtORNVx?=
 =?us-ascii?Q?ObpyDmEktUzOtc0ACMu8Hu5FIXMTnfQ3ijeSJHkZSRQnm7q6tDSMwMqT1BQl?=
 =?us-ascii?Q?dnNThCUMawvhyZuQ26J66RCABhbdn8MQRmNyB903Eb0rvgmCY8b8dTJKE0dI?=
 =?us-ascii?Q?S/oDXCrTiaY3Ycc2dFg27NtM2DEDNDZlkX49uDTapkFG0Gkfo9wsRkJ9S9qy?=
 =?us-ascii?Q?zw6+djvTifVGAos2714q3d7gexTF7mv76SC4gFvzmARRLv/a2zmRrQ+6iHmd?=
 =?us-ascii?Q?z1+dbkK/a1Pi4ifbJcGGM5o/+3aMeJ1phcbnpYv8KeUMpfkm7exVnvsI7FtW?=
 =?us-ascii?Q?L8XOpMDJUGaWKFkD8fUgjaIZhEsFLUPJ4eEt4V41g6DmjeNB63dnxwG1Rr3l?=
 =?us-ascii?Q?45Qwb+faozdJu+X9TL3JOVfxXmatwMPObwFC/64hSjpGbwXYpN9EnvT3iwk+?=
 =?us-ascii?Q?t15HO9XryRfKioCkxZgXZzlCAqs5sJaTCWq87FQvsROEefR5k3yckM7B2wHu?=
 =?us-ascii?Q?2z9N8aBxVjOvliW69XNS8sQ9QST/gPQpQ3IxvaL+COdXvMUH9MhZv0urZXXB?=
 =?us-ascii?Q?mScGZvRxRYZhdLDnps9+j0q+3BvtzoB5THr1YQLj6lVb0ORLtSYJTys7EwUu?=
 =?us-ascii?Q?wvGDoGx8J/Bb1AtNWp/bqq9K7c1gnQ3NAfrxqWsYbRHBYmC+ie/8Rv8oe2pn?=
 =?us-ascii?Q?PupfvJ0aZXTLH2h7FXuqQiYFxXjrAW1BBYIv91pcBbrcTeIxdZZPf0reJrFx?=
 =?us-ascii?Q?nfhuYyipsRu5FnwWUjoIwPHoXaUsj5Ns7+0pdoH7rKxDgLo4lU+AkZPMhmNt?=
 =?us-ascii?Q?FVvN6ZgMsK4ZgfblFKovK20sbTbLC5ws1DxdBM+/MUlHwfuj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4277e673-5fea-4e14-41fe-08df19733e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 13:04:46.7657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6r5o3k5oF8wVpFSqTyy3P31SrTLl8S93Hi8wKUiRmX/YcjV70MM+md2w88ckLjhbnjkcatxZ+Ha+7HiSFxuxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8703

AMD General

> -----Original Message-----
> From: Dan Carpenter <error27@gmail.com>
> Sent: Saturday, September 12, 2026 12:51 PM
> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> Cc: linux-edac@vger.kernel.org
> Subject: [bug report] EDAC/versalnet: Refactor memory controller initiali=
zation
> and cleanup
>
> [You don't often get email from error27@gmail.com. Learn why this is impo=
rtant
> at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> Hello Shubhrajyoti Datta,
>
> Commit 62a9fc50e8d9 ("EDAC/versalnet: Refactor memory controller
> initialization and cleanup") from Nov 4, 2025 (linux-next), leads to the =
following
> Smatch static checker warning:
>
>         drivers/edac/versalnet_edac.c:856 init_one_mc()
>         error: kfree after device_register(): 'dev'

Thanks for the report.

This issue is already addressed by the fix discussed in the following threa=
d: Lore discussion
https://lore.kernel.org/all/e135050d-8965-4e13-a021-ed4674f4856c@amd.com/

The patch resolves the reported problem. I'll send a v2 shortly with the fi=
x included.

>
> drivers/edac/versalnet_edac.c
>     775 static int init_one_mc(struct mc_priv *priv, struct platform_devi=
ce *pdev,
> int i)
>     776 {
>     777         u32 num_chans, rank, dwidth, config;
>     778         struct edac_mc_layer layers[2];
>     779         struct mem_ctl_info *mci;
>     780         char name[MC_NAME_LEN];
>     781         struct device *dev;
>     782         enum dev_type dt;
>     783         int rc;
>     784
>     785         config =3D priv->adec[CONF + i * ADEC_NUM];
>     786         num_chans =3D FIELD_GET(MC5_NUM_CHANS_MASK, config);
>     787         rank =3D 1 << FIELD_GET(MC5_RANK_MASK, config);
>     788         dwidth =3D FIELD_GET(MC5_BUS_WIDTH_MASK, config);
>     789
>     790         switch (dwidth) {
>     791         case XDDR5_BUS_WIDTH_16:
>     792                 dt =3D DEV_X16;
>     793                 break;
>     794         case XDDR5_BUS_WIDTH_32:
>     795                 dt =3D DEV_X32;
>     796                 break;
>     797         case XDDR5_BUS_WIDTH_64:
>     798                 dt =3D DEV_X64;
>     799                 break;
>     800         default:
>     801                 dt =3D DEV_UNKNOWN;
>     802         }
>     803
>     804         if (dt =3D=3D DEV_UNKNOWN)
>     805                 return 0;
>     806
>     807         /* Find the first enabled device and register that one. *=
/
>     808         layers[0].type =3D EDAC_MC_LAYER_CHIP_SELECT;
>     809         layers[0].size =3D rank;
>     810         layers[0].is_virt_csrow =3D true;
>     811         layers[1].type =3D EDAC_MC_LAYER_CHANNEL;
>     812         layers[1].size =3D num_chans;
>     813         layers[1].is_virt_csrow =3D false;
>     814
>     815         rc =3D -ENOMEM;
>     816         dev =3D kzalloc_obj(*dev);
>     817         if (!dev)
>     818                 return rc;
>     819
>     820         mci =3D edac_mc_alloc(i, ARRAY_SIZE(layers), layers, size=
of(struct
> mc_priv));
>     821         if (!mci) {
>     822                 edac_printk(KERN_ERR, EDAC_MC, "Failed memory all=
ocation for
> MC%d\n", i);
>     823                 goto err_dev_free;
>     824         }
>     825
>     826         sprintf(name, "versal-net-ddrmc5-edac-%d", i);
>     827
>     828         dev->init_name =3D name;
>     829         dev->release =3D versal_edac_release;
>     830
>     831         rc =3D device_register(dev);
>     832         if (rc)
>     833                 goto err_mc_free;
>     834
>     835         mci->pdev =3D dev;
>     836         mc_init(mci, dev);
>     837
>     838         rc =3D edac_mc_add_mc(mci);
>     839         if (rc) {
>     840                 edac_printk(KERN_ERR, EDAC_MC, "Failed to registe=
r MC%d with
> EDAC core\n", i);
>     841                 goto err_unreg;
>     842         }
>     843
>     844         priv->mci[i] =3D mci;
>     845         priv->dwidth =3D dt;
>     846
>     847         platform_set_drvdata(pdev, priv);
>     848
>     849         return 0;
>     850
>     851 err_unreg:
>     852         device_unregister(mci->pdev);
>     853 err_mc_free:
>     854         edac_mc_free(mci);
>
> edac_mc_free() frees dev
>
>     855 err_dev_free:
> --> 856         kfree(dev);
>
> so this is a double free.
>
>     857
>     858         return rc;
>     859 }
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter
