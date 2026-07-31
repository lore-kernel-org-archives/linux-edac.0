Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BA44C641;
	Fri, 31 Jul 2026 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523628; cv=fail; b=ie/mfyVO8UFAV24c91AwJoGy3XJFKVWoryDKjrllDmSA8iFiyKfsCfQJPcCBc30iKqmcGt2c2fDM/oGKMaG0U73xKbkFRETO3Z7KpZyZLZO9Y+szJrzD8YvT9Fr6DgnRudJRy2sPGt1qZ/+U+9BEA/qKqz527Oh91ZJXX36eh18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523628; c=relaxed/simple;
	bh=i+lao2W6HvczZJgmtUQ740feGPXsYt3XHZUg8YkeDAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=j6hK/GTONdU4EkmlFGHlswm0Hug0DUNOPi+eyd+qU+qQqsWonb0CrQnvXMVo9fGXw31LFC2rDMRxJrOR4Xowv0Yrl+OWOlfI7ii9rw6A8U37BbzBGKRSXy7gHm0V5EWtOj+93pBctgDvDvvd9Qr/PYoKkWp9EQ5JTs98EInYRJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O83Gfn+l; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O83Gfn+l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iddjhm/uGPTCpOH0p0hxGSpwoEEKxOrb6LCDlhWct7eni6KUFjy9ZnaCZCBAo+ezVozn5WvLnEerALfjOD9blM+i45o6l6HzcCcmU0c5tomvrn0Vdv6NsXq050d/XirFkqjqMnD1+aPP4QVMMmXI8jCrRJWrShkw+9T3mEtq73bptgBmh/zvq2aArN9hdzODUyIx5tEb5pZaElWGXTlICvit0r+baFUq7u1Dh7oMZe5urJvssdSh8vllAwWgI6SMD0EheJGjxmOt02egeZqL3vA8++jyNLxzGaHZ70AcLfR0GLf2dpVBxUHm8mT5z22YEPcdcl4naiNM82PTQAhC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nJoW/Xi1tpPgNSMDTzf6C7zkv9rq9+gV8MIZevrf2M=;
 b=ra6QKUZZNAZOKxPMQRABrglQOFo84GZ375q/f+XWx4st0TsOgPzldX3CgR1aeHxvPrvHtUNmy/WhPiXoA/iPFJILNUGhInUGE//phgkNoOjnNSDJCZrj0GThnOcLglqFoVLaZMRiR8axVSZps9tkBD7aokPej4ig3I1s05AL/P5HFIDBL3V3khxqEU0OF/nzhSigQUOTuFRdabBofGWB1VlgaSlvoYH9eUnUHgH9XZZ9DKS8lv1Gti5N0Zl9pMX+5CYnTMZ1rpezKmV+xtbxe2Igb7azLqbO+/JOFkRUmFr/CLL2bGnb6pVJvk62oONBU87AUmN7bgVV6fUoqGZhcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nJoW/Xi1tpPgNSMDTzf6C7zkv9rq9+gV8MIZevrf2M=;
 b=O83Gfn+lbaBhBvUTlVpboBgaFgRKia9C70zwP3r2E1wBh3taNuJlFTVuVx0FD62ybvvllLGsKEUTYTbpi/NecVg/LhuDdoSVp4tVWubdUzFzby271WYo7J1FKQyQP4i0XGoKZNidC4pXEI3YtTkfgTlHKJFlaXwiB5KGLHkmn6popNUAvu68gkKKMtSdTKLIWK4/EqnVvvph97E2kYxTZecsy6bBkcToRjSpqjIUYJqcKDIeVPZ7cqTMrRO4t/hIBTePDAKrd/js1vxN3BOmXTCTsR6P/8pwpZGTNSFmr8hd2fxJdBqEjT5RlV/aWjMiI2RAf3Q4VEocyyFh/l7XFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 18:46:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 18:46:57 +0000
Date: Fri, 31 Jul 2026 13:46:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Message-ID: <amztmJ8Lj9aUoPhH@SMW015318>
References: <20260729012320.616174-1-rosenp@gmail.com>
 <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
 <amy2z-H4Kc9LNPdP@SMW015318>
 <CAKxU2N-mnt1PRWXWbmQ58Z373CAMBU-0ixKAeEAuqiojq-2HxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N-mnt1PRWXWbmQ58Z373CAMBU-0ixKAeEAuqiojq-2HxQ@mail.gmail.com>
X-ClientProxiedBy: SA1PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB11513:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d273f7-0916-449f-a96d-08deef34192f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|11063799006|10067099003|4143699003|6133799003|56012099006|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z/nL837X+e5u+4vCOgHbnfn5iJNlnxKk23//gFFZzrKCKhQu8sQXLdIaqt2MvrdVSUyK4u8SOaCrM8GIyjyr7OQaRa9lfZa/XtEBmaNoxAjz8lRvPV1iBkgSExik1POd1dLwKkhGlXVMuVKeqFZtIKCligWzktSWrF9kHjoUF3krHEds5/3jYHv0rn6JslyI3gtPViSCS7m1rKJafCxZ0rKNP2KqMQhgogxZvSy4tDiwtsalcvJEU/AMLGJnQo8INhLjJDYGa5OTGBTp59fwG82t2jaB180QQ/zmOozNYZ3Es37xjyrVPVIF9bSi+SrmU6CB5VJU5VoWZNlWEYPmex2sMbJ0IV3BUMs5s2wcNZ8dxOMHyPJCsCpYjTu3BDx4j3L+CdjBynoFm/XTNqblAFIurL0wLd+qbC60WY2yPV4Gv+SNW1PnodGQkb7t1nBqEl2S4FpcnLG0m+jO8A2pBwIqFULocra4TwI2Y/bzo0GdtWEAYO9etD5BfUz1OB/TVCplMgkKl7/feCRr+TAA9ZpjShDlMljuA2eH4HgFVLV0hyfWk76wcTCOXyu8QazHPhzUWYiXwSzt95wx3Zv3uDQlLinVaEG9Oan4nh/wK57DUHj7ezjNkmAGqd0aHxFNgQ2uB4nwjeXMuCWaClEo98Yf5s1SOX70e4kA6L+OQWI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(11063799006)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWd0aEFzbENacVY5akliaUlzV3R2cDdhWDg1V3E3Y2FWV2N1OHNGWkQzNDZl?=
 =?utf-8?B?ckp1RzkwTHdjT3ZWM2drQkVVU05SNkVUQWVzNGt6Qjg2dlhBZjVZM3I0aGFS?=
 =?utf-8?B?RGNZQTQwM1FTWE9pKzFjS2t1RXJrbG9RNmd4ZVR3UEgwTjErbEFwTE92N3lt?=
 =?utf-8?B?NTRlQ2FVWmRXMnNRUjZ2SnRJM0ZseEk2T29jOEhPOVJIVnpqL0FwdGd5N1Ix?=
 =?utf-8?B?YlhrQ0UrOW0rMXAxU0kzWStreUx2anQrb215QmVaYml5MkNJV2tiQjFyRXBo?=
 =?utf-8?B?MUEzNWhoSi9Kd1hLK0ZzTCtzcThQcGZHZ2pFdzlzeDlMZ3gyR3lmNlV3Qlh6?=
 =?utf-8?B?ZW5ETEp2dVU1dmxyUG8zUWxTRityejk3MTVYT0FaNFNwMUJLMDRKQUxiKzU0?=
 =?utf-8?B?Z2tPTitBbmxVeWd6NUhzK0hoMUt0a1JPN0tRK2Z2bUVqWGZIZnhnQ25jaS84?=
 =?utf-8?B?Q0hRUzVZSWJ3WjZ1YTRIRGc5b09oNXFkSHN4bGhMZ09va3FoQVZrNnpDSnlk?=
 =?utf-8?B?b2IyS1dsUEExcXVxSVlYb2x1bFVkWjJ5M21PZHhiSEphZm5UbXJLckJiOTlB?=
 =?utf-8?B?bHF5YnRkZ1ZtRUVXN1VRakRVSnl3eEhSYllsYjlJRmlDeHAybUxTNFZvUE9Z?=
 =?utf-8?B?SzEyZFIxemg1ZGxDeU1wTEVsSVI4UUZ6MXExbXJqVEJUb1J2cmZpTDFkMm5J?=
 =?utf-8?B?MVY2VUF5SVZGKzNYc3pSVy9uK1VaSTM2TmxzZFEyMXVUUHhZTGxQU2lvang3?=
 =?utf-8?B?RUJlMnBiVHRDTE1QREdIc2QycW94WEJ5bDJ3UDRYVVVhNmsrNXJSZTNWRE5T?=
 =?utf-8?B?ZWFjQUJCL2N3SjVYeHdIb21WSzgyMG5JcDNNb1k2V1pXbGxtbDNTR2I5U0pF?=
 =?utf-8?B?OFpMd2xOUWVyMXVJazN0S3V5eFh0RFJpK1BlZXJGQ3FsZFRBNGZYWVdJcy8y?=
 =?utf-8?B?S3NnVE5JMnN3N0JRUXY5TEUxaWw1SjR5QU0rSm0ydXgrZFgvNko0TWtwbm9W?=
 =?utf-8?B?TFRhaTF0MzBaQWFZa2UzbFFaZnRiUHo3S2wrSm5hNUNUaVNFRXRIWUxYRU9K?=
 =?utf-8?B?Z2R6WWxWM3hSNEd2dWp6TzBNcDhKazNhaFBYS0M3SFR5aDlVU24vNUhQQldo?=
 =?utf-8?B?UWp4VWljTmsrTmFwYnphWkc0ODRVa1Q4K09CSVUydXdROENOeEFLd0ZuSzJ4?=
 =?utf-8?B?R05zSXNtV0JpZitDQk5ZSUxISVd3RDFjRExuYUpTMWZVMXFBbFlGdGlWcWVm?=
 =?utf-8?B?Z0Y1emtPUVBLQzV2QWxPZzlBVEMvUVZQMUsxNUdVWW5sZ3NKVjcvc0Q1YkpQ?=
 =?utf-8?B?RTBNVGZoZ1BNelB3UDkzZDJTRUhGS3UycFM5SkRSQ2ltOG5qOGhHNlV4T1gx?=
 =?utf-8?B?TXlCdHVvMEo1RHZJUU1TUUhiS3Y2US9NZTNJMm10N2ZZRXl2cmtsektKUURl?=
 =?utf-8?B?SldidllrRFJJR0RTRjhKVngwb3VZWEw1enJZRTFMNTRxR2ttMmk0Yk9NcjZu?=
 =?utf-8?B?RkJmNS81NDZlcG5qNnMwaC9HTFVCSXM4OVR4RGZQV0JkcVRra1BNUjJNNnQ2?=
 =?utf-8?B?TSt1ZEZJM3FTSjhsOThkaFVZTzJGU3haeDRzbXJaUnRHM3d2SWNrNW5TZEJJ?=
 =?utf-8?B?M0huY3RjUkJlRytlTUhIYTJYd0xPZ3BJWHpORXk5MmR6NlBnM24zNjI2b0do?=
 =?utf-8?B?RjdKcG01Mkx1U0drcklDYzM3TEg1cWZGM2t1RkFOejN2a3ovWHZqalpIRVNM?=
 =?utf-8?B?a0czMVRlc1QvWnBxRTJ2NjlrcUVuanAzUGt2T2pRTU5tR0Y4Sm5KMHVqSUZC?=
 =?utf-8?B?ejArMCt2aDFzNWpVbEU2VHFzNnNkbTNyMHg5SHMwR0o2TFpzVVp6SDBHRHlq?=
 =?utf-8?B?L2FaaDRRVU5maE5kWHpBTmw4RWRqVldUWExxdWc5bVpUY1dEZFR5QUVML2Zn?=
 =?utf-8?B?WVovUmYwZ2ZBUmJoNWhVT1Z4b2dJRldNUE5vcFhsdzlHTHN5ZGlVdWMzbjk4?=
 =?utf-8?B?QWdVWkg1cURZOFF3TDY0SkQvTjFVYmZPRmpHcCt3SHVEOFB2RXg2R1QzdUs0?=
 =?utf-8?B?MTQ2Tmx2dElPNkUzbm1uRW9zMXNCL0dlakZTb05MalpLelUyYnZpcEtNc3o5?=
 =?utf-8?B?S3JMTHVkSU5PUHo0SjhDbWxsUGNOSU1CbWtXNU5OY1RETlRmTlpTcW95TVlM?=
 =?utf-8?B?UEFwMTZIMnByQndNdzkzV3BGNUYvMmlEc3h1RWREazN6STJJRDdsOHJGMDZn?=
 =?utf-8?B?ZWlUY3hCT3dVZUpHaEJFdHIyK3c0MkJTTTFQUGpBeEx5TDQyMlMwTEprUzlC?=
 =?utf-8?B?TmZ2VFppeHRGR3Q5STVhQ3hyWXlMS05Va1pySldRV2JKUlJTNkVVWU5ZOHov?=
 =?utf-8?Q?WiQj2esJPv4W5cD3/nNA3KTdsq2udUIDIZbGB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d273f7-0916-449f-a96d-08deef34192f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:46:57.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUn02xZHL+5Z3EcVfxdS6bFhXMfjsYHHEgi6iJF9Kg+PkSJJzb1PuMqUpiBsc5FTwUTgeNNVKrofbd9TUKEoxqYlFWephh2RACqJKCR9GvcSjUI5vJTxz9lGN+qF9Cx8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11513

On Fri, Jul 31, 2026 at 10:38:53AM -0700, Rosen Penev wrote:
> On Fri, Jul 31, 2026 at 7:53 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> > > On Thu, Jul 30, 2026 at 11:49 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> > > >
> > > > On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > > > > We need to tear down the irq before edac_mc_free() to avoid a use after
> > > > > free on teardown as request_irq uses mci as dev_id.
> > > > >
> > > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > > ---
> > > > >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> > > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > > > > index f4cc89b26954..f1ddd1f47f2a 100644
> > > > > --- a/drivers/edac/fsl_ddr_edac.c
> > > > > +++ b/drivers/edac/fsl_ddr_edac.c
> > > > > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
> > > > >
> > > > >               /* register interrupts */
> > > > >               pdata->irq = platform_get_irq(op, 0);
> > > > > -             res = devm_request_irq(&op->dev, pdata->irq,
> > > > > +             res = request_irq(pdata->irq,
> > > > >                                      fsl_mc_isr,
> > > > >                                      IRQF_SHARED,
> > > > >                                      "[EDAC] MC err", mci);
> > > > > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
> > > > >
> > > > >       if (edac_op_state == EDAC_OPSTATE_INT) {
> > > > >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > > > > +             free_irq(pdata->irq, mci);
> > > >
> > > > here already disable hardware irq. Just call
> > > > synchronize_irq() to make sure pending irq handled.
> > > AI disagrees with this suggestion:
> > >
> > > The reviewer's suggestion to just call synchronize_irq() instead of
> > > free_irq() is problematic for two reasons:
> > > 1. Shared IRQ: The handler is registered with IRQF_SHARED. Disabling
> > > the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
> > > this device from asserting the IRQ line, but other devices sharing the
> > > same IRQ line can still trigger it. Without free_irq, the handler
> > > remains in the shared action list and can be called with a dangling
> > > mci pointer after edac_mc_free() — the very UAF this patch aims to
> > > fix.
> > > 2. free_irq already synchronizes: free_irq() internally calls
> > > synchronize_irq() after removing the action from the descriptor. An
> > > explicit synchronize_irq() before free_irq() would be redundant.
> >
> > You post too quick, I have not seen this mail yet.
> >
> > devm_free_irq() here. and add comment why need explicit call it.
> Needing to explicitly call devm_free_irq kind of defeats the purpose of devm.
>
> Explicit ordering in this case makes more sense to me, especially with
> the ddr_out32 calls.
>
> There's actually a second benefit to the non devm version. The devm
> version prints an error message on failure. The normal one does not.
> The significance is that the driver prints its own message.

It may need goto if add logic after request_irq(), I want to make probe
code clean enough.

Error message doesn't mattter, we can remove it.

I suggest use other method, let use devm add action to make free irq before
free mci.

Frank

> >
> > Frank
> >
> > > >
> > > > Frank
> > > >
> > > > >       }
> > > > >
> > > > >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > > > > --
> > > > > 2.55.0
> > > > >
> > > > >
