Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011046.outbound.protection.outlook.com [40.93.194.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5083F65EA;
	Fri, 26 Jun 2026 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484630; cv=fail; b=OKoLIWCvNLd0Uk4D4jgZQCtYicdi/CCz/6YoyABXj6rBTxv7hXt5HL1x1wLjtnMoEiy4fv6VDlGZlizVBejlkcfrWtw4Jt1PVi5+xKLz3Qy65LR4EC5Wv6owuDqPJ6RxhS6RpfKR4c+z7ckEFMWNyqyYP8lvGnJfA50b40g/yY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484630; c=relaxed/simple;
	bh=WP//Ib+ELweiVn790JgQhVuCJA3Qwk7wF1yEWovmoVY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j+SbVi8NpE71+fFbOnxEL/o7mnW04wyrnrMWFiy8xACcM6D9dhk1bEs49PH8l87W/NouG+oqJfCPk2cSQ27igVtiI3/vzQCRBtYyJ0gGLg3wncqgc02g96tKamy0TNahCHPfwOofWOO8mjjwutFKDpUrMbqKneT9v/bAzB/ohrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Us7exFG+; arc=fail smtp.client-ip=40.93.194.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Us7exFG+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naaJLfmxo3B14b3ARjZankGneLIagIDC1hm3MEElMQ+f7qvWWCaFCT/2ECnmi976U1E2VajvAcd9tReLYhOxAWMrf9zjsfSjgxGsiz1hY6M6PagdkCnbCML5qAB+aIeBki0ftUYMEL6xfpC8Wccn9eGPADDBTmF1Un5ImEk1ngB5IJOU/eZYyRYR2xNCUcU/drFUb6TycEZ6Fh8h3qEhbVtz0Rjv0/D7gf5LkHnTq+bgTpAQ+uV4ycjOdIrzGYrzkVYeGo1QUQD13vPa98U9sqKGNEhTO5eV0aHP+pexfvykeB5DrMpd+rgKq9mbr3MeRMjkiJKP95MC0SG4SmPb/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8BT8QzKiWvFB2WJHudWAoWOI2OooNSQqXDsZZe19mc=;
 b=jUPHemG5THrnvtsuDam0H7pQ8AVP0qFBqaJIs73RC5Zea6ZoQSRC5asX8Dqd+LtkltiM2tiTKj+g89znt220kXvg/rDHzclh5QSw9vvUx+mSoEYOBt7GmnouWKE8sFiqGotsfksPVqPJ0L93woxSjLOJeE6y1MMyPAZ4b5nvpLDU0C55s8GSJwtqy/78GNS3A7ukbnf7/WDkaCvokARWjuvffD+YKmXcWsyOqUEMpHj7ss4n2WQCyC9lms3u5Vj4moMP3prGHUqWCRVQMAJqFp+pNgdgFcc0JO+JISigVu6AHdZP3DWvrXO2vX/HI/InT3/pPntt1NXISn4WNVOd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8BT8QzKiWvFB2WJHudWAoWOI2OooNSQqXDsZZe19mc=;
 b=Us7exFG+x4ZuxVcrp3fMMJfYEfYAmWEdqQg9iOcccdszAlqSvHlAbAJ6wXAi8hR8xn2qqvALYkVXXTY8LZUJ2MyBYzYXw35WN7RtLtWTuf2BdvCRZH45Smxx54J7XH6MCfxoTsY3hVrp9Rl4xEUWziJqlxr4nUrvNqN8awEoxT0=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by LV3PR12MB9234.namprd12.prod.outlook.com (2603:10b6:408:1a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Fri, 26 Jun
 2026 14:37:04 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.21.0159.018; Fri, 26 Jun 2026
 14:37:04 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: David Laight <david.laight.linux@gmail.com>, Borislav Petkov
	<bp@alien8.de>
CC: Andrei Purdea <andrei@purdea.ro>, Geraldo Nascimento
	<geraldogabriel@gmail.com>, "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Tony Luck <tony.luck@intel.com>, Kees Cook <kees@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Li
	<nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: RE: [PATCH] Fix possible strscpy() buffer overflows
Thread-Topic: [PATCH] Fix possible strscpy() buffer overflows
Thread-Index:
 AQHc4MmbZE64i1dm8kyGmdJqF2TDZLYICeIAgABYcYCAAEDTAIAAFooAgAAOi4CAAGtkgIBH+9cA
Date: Fri, 26 Jun 2026 14:37:04 +0000
Message-ID:
 <LV5PR12MB982875DA2891146C9F7B40E781EB2@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
	<20260510230853.154050a2@pumpkin>	<agExLK2GR0w0Z_N2@geday>
	<CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
	<20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
	<CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
	<20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
 <20260511201559.2a9fc8e8@pumpkin>
In-Reply-To: <20260511201559.2a9fc8e8@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_ActionId=d300fc11-13be-4fa4-ac96-c03ccdf5f6f4;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_ContentBits=0;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Enabled=true;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Method=Privileged;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Name=Non-Business
 v26;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_SetDate=2026-06-26T14:34:27Z;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f39aa4b3-b62d-42bf-8097-75e2c573ddfa_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|LV3PR12MB9234:EE_
x-ms-office365-filtering-correlation-id: 1bb96a80-e23a-49cb-fcce-08ded3906431
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|38070700021|22082099003|4143699003|11063799006|56012099006|18002099003;
x-microsoft-antispam-message-info:
 XIjEcakipPeP+7DP6bIkQwUEKQip5v2AO5ZxP8w5AgjjMA5POe5RX4XrZefcczl2o1IQIG10u1vh5ymHtrPeT1rLPe0RXoN+v9MZoYHdGxo9uTzXcyyen7EWTEP7xxxL7zYCUAXiSk+dsgv7ACht1sCP4PQguJ9p9YewwclzFpgnGCLRGBVsZ17j7KL4OGn68IzZ0Zr1MIuklntY34zH5R3QVRNvJtuiDfvg7wS+xH5o+CEWVctYzZfXiQDXHOgxJ41PF/MyyjIUCColchwDSQluwyFVI3knEYWUMvTp0iAP58aYRJoAQJUWfNsG4ZRLLn3/k+xxFaFcSSf6bItdW7HcrM13AF0zYU/fA2WIKzZqnC31a9LFkFSGbIVZsNU0r3tbFoxAV376D+XKf/byW2fmoywAxXzxq7p+jy+5dtkKUnB7AaJ7gXnS/ai4mrFq6rqWZcO4nDzJf2J1ej+RIZat6nuIJ5DYEO3mfq2VcWnEVjxheboTrXxv3SmJIxJHRsEHrkm4eQzt2YhkgMrINQ29AeOaZen+mi7nxy9lC16nlBn3gEPFLem5cuYFaQK5IZvTXLxmdelQclMTHVI+yRuXIgMqHe/OLcVZSTLBxpU6Go3Rye/ATy44+rf5tQw4wcpjQPZLj0OQiS8WostNXG94/mdp8ttRHCfPavDeqK4hjZbd6HhvfxNIv5QpJ6rHr9QCn6QwNtMezuoju0F9zTCfn9D9vJYUe52wkCYYOmA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(38070700021)(22082099003)(4143699003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lUmEDRyv5TJNMyredBw8wdldDEJYIZUAgyj1fj42SeeJCEqf0U2zq654ZNSa?=
 =?us-ascii?Q?PeB7E3XNT9luvwLFIxAogxwWfmvp5UL8GK6O6weJJjqYp2V6BM1GZB+9ue/t?=
 =?us-ascii?Q?EbFdeG26yM8JNRWG2amQBf0T/QyuNNeT5ahDpwXeS4X1EBWUl4bHZz8tPqre?=
 =?us-ascii?Q?GqY1Usj9FwCyPuJ3Tk64J+99Mz89UxWBhHa2dancrcH/q4zZUHKDYkw3vRMg?=
 =?us-ascii?Q?C5Y0C3MoiIs/WFf/xExPE3I//XiDELNB8bh0mAiUKI50ZSdkW0goIcOA1nHH?=
 =?us-ascii?Q?GSlHStLfHx23/YCGAwDxiaqz+wgfIVe5UvmR7Vi4OHYcELUmd/laQiN2f+VT?=
 =?us-ascii?Q?aThIOfxCaX5IleYuAq00I4d4lUGOKOeoAmNHEBvaQt/wH8yXmqM1g3Aatk3d?=
 =?us-ascii?Q?jqpkjJy6AH7dNd+I7Bpnl3dRviAr4B6PplHi/XRvezhCfbu6gxD2NpQI6DKN?=
 =?us-ascii?Q?xPt4BqwLb7ME8jutW+zQAAuHGWOUWBQzttLS5RAk29cekdzCmqcjPHTdDXZF?=
 =?us-ascii?Q?xf8by42fbdrMKeMqvoD1d7A1rKkFb/WYFIn8HJhVlGatTk8fpdPbOo4bGTeg?=
 =?us-ascii?Q?trN18aGNMUPGnjuDGMiyeMoG+K6NawNPO7/Uok5/c1ApcogyoJpOrhn+usTY?=
 =?us-ascii?Q?Uq0q73FpvyLqB+q1uGYuCnSi2ZGHarPVhSKK73OWAIuXjhMLIeq3b4B1kk/2?=
 =?us-ascii?Q?9oQw/1UUqW1/FB+xdGxO0fa8FonN3zVnNdbBN6mifDIzd8OuDHA59IacdAeK?=
 =?us-ascii?Q?aMmrfZJMbS2JRYP2zSHBg7CJS0f9QlDC081FloFn898npo+hSGa0Lq7AC3Fy?=
 =?us-ascii?Q?XpztlADLjeWE8YJCZR1atb/urP0G8YvaoKbtfpDLIzhUafeX34zeh7N3ODCP?=
 =?us-ascii?Q?3DtklNUS3bDSRguKkPu9xkuNFskTC2r6of3UDfO1by2lSaw8DDwo0p8MyINn?=
 =?us-ascii?Q?yg7+n7xgcRv6AMGZll1vobWixIaHtk3qEbBBONTiBi1yeAzOdGJjqiYYGG8i?=
 =?us-ascii?Q?lRCp3ZAkaXX3ZwXdkpacZzrNjvqpPOBykfAgTaV/xV0TDx1jZcgl84Yxp1I7?=
 =?us-ascii?Q?oxc122XjPOQ1QZ0cyzRXfrLfBA0CbS/XPhRTmmCtD5seOgsZnBVMoHMAX9BO?=
 =?us-ascii?Q?h1SZ81jW7Y2yX95Nlc8Ys3j6yPXD8GEGhGWqIiYznPk73A3LxjFouO6LmDA8?=
 =?us-ascii?Q?F05o0rd11jH6VRisohESA0otsSZyRZa/dBcQLklk2Iz+Owj4lxDw/ApvqU3R?=
 =?us-ascii?Q?Jn0sCQE73ANg4jJdIcruxofz0YviFr5zlVhZ/CA1Lgc90v4Mz3Upr2I2uqcJ?=
 =?us-ascii?Q?Th9e2iOiG7NF6DiEF74KpPYtxN6t25KF6RSzaqsCXX+WLXMYrQPvmRmks6XN?=
 =?us-ascii?Q?N5fOE2xrATkabSwdPEXbxjaRyj3kaKMyMsRqCk/Hyrl/UyQaX6/JAZr/hLKU?=
 =?us-ascii?Q?M3UMEmVGjiM8MvE8mm0S/lsgtyvVfqJ0UL2YxKdQ7JfLqZl4whbeBs2p072o?=
 =?us-ascii?Q?1K6w5ynV2s8MQwCmlmK6alCqFX5kP5G0wOkI47eE9cKm21zphmElZCSY2L8k?=
 =?us-ascii?Q?ztXZkdPthDtRVtAjATysFeFAi8/v+8KIspG/+YR+Fcg6FBDYAcEB+agngdCp?=
 =?us-ascii?Q?i6EG6Y1mNqPfnKX5N3WVbOs4r728CHl89Z8nBHTt4C09rILIqnL5QVQd4Yq2?=
 =?us-ascii?Q?s2zLIJhbkxV9twkh5+gFADAoMzGrQ6eujwRcBzNNA1C7Uj4l?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb96a80-e23a-49cb-fcce-08ded3906431
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 14:37:04.2564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnPv51RDOVNzWYOw40QCZLABpgWa93bkZMH6QQsN8QPnQ0IwO9y6465JTzHeu+nycWT0UsDAkLX0cWUWH2egGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9234



> -----Original Message-----
> From: David Laight <david.laight.linux@gmail.com>
> Sent: Tuesday, May 12, 2026 12:46 AM
> To: Borislav Petkov <bp@alien8.de>
> Cc: Andrei Purdea <andrei@purdea.ro>; Datta, Shubhrajyoti
> <shubhrajyoti.datta@amd.com>; Geraldo Nascimento
> <geraldogabriel@gmail.com>; Alexander A. Klimov
> <grandmaster@al2klimov.de>; Tony Luck <tony.luck@intel.com>; Kees Cook
> <kees@kernel.org>; Arnd Bergmann <arnd@arndb.de>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; Nick Li <nick.li@foursemi.com>; Liam
> Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
> Jaroslav Kysela <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; linux-
> edac@vger.kernel.org; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; linux-sound@vger.kernel.org
> Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
>=20

...
>=20
> It would be better if amd_rpmsg_id_table[] were 'const' - in that case th=
e
> strscpy() call should 'degenerate' into a memcpy().

Here the channel is error_ipc=20
So instead of copying we can initialize the name.

diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
index 18284c76651c..161bde2b14ba 100644
--- a/drivers/edac/versalnet_edac.c
+++ b/drivers/edac/versalnet_edac.c
@@ -720,14 +720,14 @@ MODULE_DEVICE_TABLE(rpmsg, amd_rpmsg_id_table);

 static int rpmsg_probe(struct rpmsg_device *rpdev)
 {
-       struct rpmsg_channel_info chinfo;
        struct mc_priv *pg;
+       struct rpmsg_channel_info chinfo =3D {
+               .src =3D RPMSG_ADDR_ANY,
+               .dst =3D rpdev->dst,
+               .name =3D "error_ipc",
+       };

        pg =3D (struct mc_priv *)amd_rpmsg_id_table[0].driver_data;
-       chinfo.src =3D RPMSG_ADDR_ANY;
-       chinfo.dst =3D rpdev->dst;
-       strscpy(chinfo.name, amd_rpmsg_id_table[0].name,
-               strlen(amd_rpmsg_id_table[0].name));

        pg->ept =3D rpmsg_create_ept(rpdev, rpmsg_cb, NULL, chinfo);
        if (!pg->ept)
>=20
> -- David
>=20
>=20
> >
> > In case someone goes and changes that amd_rpmsg_id_table[0].name in
> > the future.
> >

