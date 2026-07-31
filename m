Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011052.outbound.protection.outlook.com [52.101.65.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550673D9026;
	Fri, 31 Jul 2026 14:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509595; cv=fail; b=WjhguQvOa6iXHqpgpQGhj1XIGAn78Tb6Xcj1ZAaHPH/fgdxxZ5cub2xOFASwzJkbYUyLHY6bvXVja9OiynsDwSauqy0V/4JMB4Uq/A/roU4b4SyeriY46Dx1XD67EZ0KghWjXX+DShtTrsgkYsF6O1Kjiq03aNlc67DcWAfnlBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509595; c=relaxed/simple;
	bh=x+Vfmhy5SUTLW+74Y2EDD5hv/DA3LYVRatkHv5IiV/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tRCKT3bFluG0OOI5On4paa4BcTEB7A8AkyIj8LD+9bWI9un/xsQxL85ulBkkXeLrvESDvxSFQUD3imIGuyzHAlvHrsFnEOQSn7SPckV90aatu+9cqPQfcMGpW6h+IP6vLbsQaX2rPZoxYdgLl+TR6vC31o7pcGa7jrBfnZ65bSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=APcOY+Cl; arc=fail smtp.client-ip=52.101.65.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="APcOY+Cl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkXufpPJBndhZsqzkDjy+yXv7Q4r/bogoOsFYojXBKupuiZuFNLuDShad+TIpsaRLesVE7CVgOHz+C4tgMJ+2YJUvtqACW1uk7lsYvJWfGW36KTbt8i24Ap/jUt0IWTK0/erxyecbIYhe0JY3RTcZYLunG8xDMioj3ZephG3x3UtWYP4ZT9QSPrm2FL2IxYqD03FFV4gsX9tjl8IWruSEySbM35TDEXwVmdtyl464S/merxlET/cLzg+MgsdBe7pd7NJViTrS88n4pNwZBulDW9l4/cL72Y8eMf3Iyg7gJmcuD95Nmye2dc9eLqmDLhGJSNMh449fW4Fe4lUJ9oujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sc4hpxSfY29SpjNiczN/dWn0r8t5FJ0y7nRiFQhD6Jk=;
 b=GLT60RACAGd7wWpSS+2HOd4DnmJdXhtpuKnn6rxXyDpi3ohQ6YB6rXr81Tx2wSoM2SDiyrz9BLukU2EM0VSd7BvNMKHfne5OLevO05pU1kCEm6IOeMxtgLZAGeHgu7pBcsvqQohPpNvlY1VDU4q/2CxasiaHSJjiTZeh6D9XFvsoRugfnmYnUY4ZOlvM71DnOhoBZaIOuNDtz2lQd+VocyL84HSm4noy6But9Rh6M/owt9fdXK+Ko56NikDXPZBfhyBBaKv1aNwWLN12c+AHeoum3BbDDTPmJdjuXs4ZY1XWo/S/fpDOdQen9jyktqT3zn+h0pp7Cs1mpZhyuXLtuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sc4hpxSfY29SpjNiczN/dWn0r8t5FJ0y7nRiFQhD6Jk=;
 b=APcOY+Clx+FAtWqPxuCyfZ/Ah5XBn7zdxgZ3n/5kw3LyMcnYfj4tzVs7OSDt3ZgQWwi1E7sSM4BBCF54LldTIqMhd6SoP59y930DSMu+3GKQB+1GvsWY8XvxkjsHcKvvl6VeBOLzun4RO+cFauBjqJPQEKG187CwTXt7NIHCm7L0k2Po7eNNOrb4we9W/mFSxURb0qPUBpZTw8AHhK1pxCnflVIfA73UxxZQVTBFzz54xiN8Sph0JETRnGeABG4v9292A5xwJk6xvsCbRToXTFeZ+x3Nfx98B80Z3kxbZCbrLri1ljJfjiLrhFdGC3dmQAst7ZePTdosO77E7ojupg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12069.eurprd04.prod.outlook.com (2603:10a6:501:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 14:53:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:53:11 +0000
Date: Fri, 31 Jul 2026 09:53:03 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-edac@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Message-ID: <amy2z-H4Kc9LNPdP@SMW015318>
References: <20260729012320.616174-1-rosenp@gmail.com>
 <amucohB5GoaocIC4@SMW015318>
 <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N9_wJt3qQ4rmGX89dmSpMKa-7zOuzDwrnxYbXrBNZ1nQg@mail.gmail.com>
X-ClientProxiedBy: SN7PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:806:126::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12069:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7392e5-aa40-4189-5529-08deef1370ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|10067099003|4143699003|11063799006|6133799003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oXh6y9JRs9vDd+FU6lOPZkLrYINojvlSOwefsmsp/feCItcMw59s6TMVda6AjSmrUaRx0rWbUOpUGRDkXiCy6PpboNyL0TJL2tuBzpojvLOXWqKoGG2ti3EpUufdNrEfAFpEeBeK1/8ZNP5ijGWADVjKdOutBZoU46w1aNHLGjoJpnDrXH5R+LQdfJLQnD7myM0wbtN5dqWbY63DjS2sqF2DF+jI4LUjnKS3HiZ8uCnPYL0KWsz02ceZsxUbeIbsj4paLaeDsko6Qfq8hsDwg2CJbHSgaHlgr0k5JX0c5FSqL069Wo5jm7j8JSnelP5R1yQVZo4HWPYGCjq1N++qq9ehwBZZe0tob8WQQ1KRclcXNAYBZPWwCAEdNm4l1kRmdvzYYkXwXPZX8L+Np1613cmMwygX4YDMN4en+L9/oOdkvOve9k0DZgw1nEinrBdassb8JpY88OMBFVado1aWFPjaJ/47f7sQr6giBYJl7+kGWhZIcrKco7PsPD6YtdOE9xufcZ+12PXRYLwTFSGyy5ke69Ew51Eeq6U4HRSCQy7Vj7bEILfJ+KfeG6T2k8tHB5pVmZYLmwVTT466GTfDWVFTjbFBauhVog1FZYlNhqe6nOdr9bUKa6ToVS0xDw6Crsk9DwnjthEd2KvMsD4q1x74dhYv+bWYDWE1Ogl4YGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(10067099003)(4143699003)(11063799006)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXgwd1Jzb2tQVmV5WnhFTkoyNzFKVmlZMkJBSW4xOCtSSmxSYVoyTm5Sb01N?=
 =?utf-8?B?ZkZhOWlCN0J2RVltQWNsRXIvNXZYUEJuWWFtNW1vS1IxK0UzZGYxMVE4cFJv?=
 =?utf-8?B?R2xPY1BZRWIrS04vVGlNUk5mbWFqMTR5QVVsRzBqY3Z0V24xcGhxZ1doN25w?=
 =?utf-8?B?M1VwbU05dFVHQm9iN3AwU1dUbUFucWkwaUxLalpwYkhId2xZV0ZTejBxbVBU?=
 =?utf-8?B?RGxEQXFIb3NOR1N4WlV1MHRFMVUwcTJYK1JmMlljZkY3VTBrSHQxSCtkeDZT?=
 =?utf-8?B?Y0Y4a1k1L2RjNVBVWEU4MnlaYUFyV3VGS0dMKzR6OFZNNDNRbVVaUGF0Y0cv?=
 =?utf-8?B?Y05hS2xhRlhSeHdiNUt4eGkvTHNsWXJPOGpTM1VIRG16TS9rclJzU2lsM21x?=
 =?utf-8?B?VVNpNUdFcTFxazRNUnVMTlRiWGl3OVRHZlAwd2tQZHQxbnpzZHpndFpNdUVv?=
 =?utf-8?B?dXc2Z01qbXRiNGlxT21MWS8xKzBwZUYxaTNSSGVwd0QwSzlTZi80K2tLcjBw?=
 =?utf-8?B?Z3lCc0hWMlZkRXlVd0t4OHlTT1g3U1YxUHErNUZLOXpFMS9RVEJFdHJtSm9n?=
 =?utf-8?B?ZGV2QlErVGxxaWdzQlZIZWVmMFdxSXhSMDlvNmNIVmtiNEdNS0FLZEl0MVRB?=
 =?utf-8?B?QWhRd0x1eGZoVzg5Y3dGZk5LYW01STRxMWtiQ3ltZEtzMkF0YzJrRkk1UEZW?=
 =?utf-8?B?c0hXZkhLTGxOM2JXY1JGUGdqU2FJYmJYOGJuc0ZLYjVadk1FS05uc3lCVjQr?=
 =?utf-8?B?Z0lQcUV1OVpzdmpBVkxWK2puaDF4dE8zYlIwWXhCbm5kempXSFgvWmtFV0oz?=
 =?utf-8?B?ZHFBWFlVczQ3d0QyNk0rVDYvOExDTGQrK1Y4ZmU5aFBuYW5hdFczTEdOTDdo?=
 =?utf-8?B?Y1p5Z1VsY3hqa25HSXhUaDlPa0RqOWxMeGUwd3NLK1o3NFNOKzlPT0VuUFlt?=
 =?utf-8?B?NXRtQVVpYW1URFk0WHFWUm15KzMwbHV4b3FVUEo3OVdvUzJhYklteVFmclVt?=
 =?utf-8?B?bmREVXVWRHlNSEdnNmE5VURkRmJTRE1QT1RnaS8zcm9GR2lEazhhVVdwRC80?=
 =?utf-8?B?b0VLdmZ2enJOa2VzQjBTWVVxbkUySloyb3d1OFlVb2N6RTBTQkhTUWxhNjFC?=
 =?utf-8?B?dzVRc0c0WGFiSDd3Z3R0RWwxQjNNN3pqbGZFRXg0OTRQS3pCaDR0ZThyNzB2?=
 =?utf-8?B?ZHp3ZGE2Y0lEc3o3S3g2U0hDRnY1QUdHRmg2eVBReXF6eXpRZVc0a2Z6WDZq?=
 =?utf-8?B?QlVNWC9VZUF0WDByazE2cWl0WDZtRVN2R04xZ0FQTERKcEJRTHpqMENFK0My?=
 =?utf-8?B?ekJ3RHlWQjMwMkw4MzZWejFDL282VG94aWRVVTZaeUN6MjRRZDlJckpZWmJR?=
 =?utf-8?B?aG00cHJoRE44T0VHVmMzeUU4NTVPaGozckY3U2RLUHJPTFIvbm9NZEZGS0VB?=
 =?utf-8?B?WVAwRzFxR01lNVdGeE1lU1p0cnlZUjAvZmd4c2w3c0ZiVTl0ZnpVb0RIYnZP?=
 =?utf-8?B?QVBTUXgxZ3dKalRReVRvYlp5Tzh5dkJYTTZndGwrYmpmYUhDcmVWQWswVXpM?=
 =?utf-8?B?ZDd3UjJVRElPMDVwOXNpMTNtL2lnVTBnMmFRYWNzeTFwbldQNjQ2QUtzejFL?=
 =?utf-8?B?dG4rNjM4cjMvWWI2bVZJMUkwS2ttSlVvWlNvL3VuSTdtUk8rU0lUQmM0UmE3?=
 =?utf-8?B?MFllWGhUYTE2M2wyL1hlTDhWUGl2ZU1IQkxldUxQWHphL3ZBaWZ0NnpLazBp?=
 =?utf-8?B?SmFTUURYWXZpa1FJeTRneXBCSEtwdGxKY2JrWDJ1d21iazVEaHV1RHhYbFhp?=
 =?utf-8?B?S3JxMERZL0hrOEhJVVZ3cWFldkdtaHl4MWF1ZTBQNnVKWUkrZXpPT0xSMXJ0?=
 =?utf-8?B?K2hwVFdPdmFhbkhaQlZDNHRodlZqZS83ZDQyb1g5ZmNmcmF4cm11RDFPRm43?=
 =?utf-8?B?b3hWVUphTWl1Nys4U2lZVDRUSG1DNkY4anRTNHhodHE2M3hKTGlTZmxNby9M?=
 =?utf-8?B?QlNSTm5mc01hZGtEbHBTMzNXYXVNdjdCczlqSlVTUFlGV0hUa1NzdzVGbG1k?=
 =?utf-8?B?VHAvdTV1UUlLUHdjb3BsREdVbVRQTWk1OEdOK2Y5WEpBRElQYnR2KzFsRmIr?=
 =?utf-8?B?dkhVUnFKaDF4a29yYk00VGUwMUVseEhxMWZpMGcyK2tqUlZrL1psaVozRENR?=
 =?utf-8?B?NnpTVUxHTy9pMXNhUFJWLzVzaFZmOXJ0MlcxUnBIbW1lWWMrdHBOS1QwL0xB?=
 =?utf-8?B?RENTakY2M2RvSHY2b3F2b3ZJTFZuMU5RVGNGckg5T2ZHQUNSTC9jTzBFdmQy?=
 =?utf-8?B?TlFGU3pIR2tRV2tYbTJaUFI2OXZ3ZjE1a1NBa3owczh2VVlWWTRLQkxUZDRs?=
 =?utf-8?Q?Mgc4WHnziExZbiGejNKmSEBGYW9iLGOqv/xpe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7392e5-aa40-4189-5529-08deef1370ce
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:53:11.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glQGcq7dSs7spJDw1x3We6+8i44jgjJmv6BwE/fyn9lqJTCtnrMDtjaMQ0nZh98yCmOyUuFRVeojhzO5yJ/joN1h28wGnvMKrFd1lJy8tM9xKX6WqKAojvKkLVopDhjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12069

On Thu, Jul 30, 2026 at 05:16:11PM -0700, Rosen Penev wrote:
> On Thu, Jul 30, 2026 at 11:49 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Jul 28, 2026 at 06:23:20PM -0700, Rosen Penev wrote:
> > > We need to tear down the irq before edac_mc_free() to avoid a use after
> > > free on teardown as request_irq uses mci as dev_id.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/edac/fsl_ddr_edac.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> > > index f4cc89b26954..f1ddd1f47f2a 100644
> > > --- a/drivers/edac/fsl_ddr_edac.c
> > > +++ b/drivers/edac/fsl_ddr_edac.c
> > > @@ -601,7 +601,7 @@ int fsl_mc_err_probe(struct platform_device *op)
> > >
> > >               /* register interrupts */
> > >               pdata->irq = platform_get_irq(op, 0);
> > > -             res = devm_request_irq(&op->dev, pdata->irq,
> > > +             res = request_irq(pdata->irq,
> > >                                      fsl_mc_isr,
> > >                                      IRQF_SHARED,
> > >                                      "[EDAC] MC err", mci);
> > > @@ -639,6 +639,7 @@ void fsl_mc_err_remove(struct platform_device *op)
> > >
> > >       if (edac_op_state == EDAC_OPSTATE_INT) {
> > >               ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
> > > +             free_irq(pdata->irq, mci);
> >
> > here already disable hardware irq. Just call
> > synchronize_irq() to make sure pending irq handled.
> AI disagrees with this suggestion:
>
> The reviewer's suggestion to just call synchronize_irq() instead of
> free_irq() is problematic for two reasons:
> 1. Shared IRQ: The handler is registered with IRQF_SHARED. Disabling
> the DDR controller's local IRQ output (ddr_out32(..., 0)) prevents
> this device from asserting the IRQ line, but other devices sharing the
> same IRQ line can still trigger it. Without free_irq, the handler
> remains in the shared action list and can be called with a dangling
> mci pointer after edac_mc_free() — the very UAF this patch aims to
> fix.
> 2. free_irq already synchronizes: free_irq() internally calls
> synchronize_irq() after removing the action from the descriptor. An
> explicit synchronize_irq() before free_irq() would be redundant.

You post too quick, I have not seen this mail yet.

devm_free_irq() here. and add comment why need explicit call it.

Frank

> >
> > Frank
> >
> > >       }
> > >
> > >       ddr_out32(pdata, FSL_MC_ERR_DISABLE,
> > > --
> > > 2.55.0
> > >
> > >
