Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB8536C9D5;
	Mon, 27 Apr 2026 06:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271263; cv=fail; b=B1qHKGJeziWtBYL1RUEvgKu6xskWY1aa6wy50IK/gGFePVTE6JG5K+6ndaJwyJLSHceA5x2bAcywNiOvSLElP+0AG1ltAyh30u1J9vWPaDBEeVsz7DudJODNOPsVjGdrEMLOauqQ4qlIPE9hf3WbcXV2xPhbwhh34ISabjTpN2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271263; c=relaxed/simple;
	bh=zOASimRPrs/yi+NOWyeX23L0tpFXgPT+nRSwDmEZJBw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SLbBmRiwusbmuXFBvlgwmHuVBjDU1A93pgHVFZOT/4rE/gADI0YGQ6ajC8gJstDNazT24Rq3HKe9+jEtNXraq3pm+Q0fNoQfAYzCuVU0oRkOrfVdn9ubMlvYaxvW2P92ckYDNz0Bu6MphWr6uxulKf+bqK9qHiHweAorBftBLU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M6Ea00sT; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M6Ea00sT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVNS+dkH74urltAP7QBzH5do4CDBIpV9tuZUGjiEzQjrSVH1xfQU1wPuPltQwrCHUDooyp1glKVi47yp7NtTn3xMh94QqYd6/pu/UQdK1xCd6ARD37oir6mSDF6pHRNlKooBaXydDh8c9gXVaQ412eUilxCim0by0aZ2QXnMRkqF2OC4Uul/KXj1h36agqML3B5JquAUTiGe96LEKsTfS0T2CLOs/Fx1Ul+N6TJ8E3vtBcQBFOLuLn1QVpNk1ZDLBl/XN21wTWUuGDIkZP/NAVZKfJ5s77/2J2tyUsWJjF6hGCrAc6/svpB7xpRSsl5fh1fjjcWUMUnMQ57KKQpIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz/L02ib7J9IlN2tiff2LQA+go9GN8g5DEz31nVWLis=;
 b=EtpJiACTorhD4QrnZOTDH5foYbJw/Qq0wwRGFozImmFv9aM7yEC1dUcg78Dv+C+HnWPyZed53l8iRICL32/04asFczwQIS1g3xlUqgfKcneoqFiBhdftL+UXQu3guHFuzZ4N+5NzGLRR8bK5+1pXvkZ2RyO1TNQQkO9u2dhIqkEmRBTtMrdIcJZIecSmueWOz0LYwtzSnPjy24PUITYIxVRImaYAeAiS4uNJO/hK5foeuDoDk5S2F8S+/6DsnvpF2ypz606j0TnLHvsHDsNZe3Lc+Ue8HmMMxpWwwP5n4dVZ/D5bChZAk8P1dfesSNxiNPh4ZkROPxjFa124EzKfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz/L02ib7J9IlN2tiff2LQA+go9GN8g5DEz31nVWLis=;
 b=M6Ea00sTeI8Um789wm7xelu3BcYRZeXzMljNumIl8hBVfDimIAmbx/guDr3fkqLRKi7NzUVFAjkL4hUhpyoqP0MzhSS9TBvEkQiba32OiD0yC0//NiXM7iO3oYRcHUBJpEkncdklsvMY/tP16S0bcV2+CVO99FwFrpwjLOgH9Xk=
Received: from DS2PR12MB9821.namprd12.prod.outlook.com (2603:10b6:8:270::13)
 by CYYPR12MB8938.namprd12.prod.outlook.com (2603:10b6:930:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 06:27:37 +0000
Received: from DS2PR12MB9821.namprd12.prod.outlook.com
 ([fe80::f91c:af1b:9bf9:7396]) by DS2PR12MB9821.namprd12.prod.outlook.com
 ([fe80::f91c:af1b:9bf9:7396%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 06:27:36 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "git (AMD-Xilinx)"
	<git@amd.com>, "ptsm@linux.microsoft.com" <ptsm@linux.microsoft.com>,
	"shubhrajyoti.datta@gmail.com" <shubhrajyoti.datta@gmail.com>, Borislav
 Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Subject: RE: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
Thread-Topic: [PATCH] EDAC/versal: Report PFN and page offset for DDR errors
Thread-Index: AQHczJ2QoP+Gu2sW0kq3LKNNihUhZLXqfN2AgAful2A=
Date: Mon, 27 Apr 2026 06:27:36 +0000
Message-ID:
 <DS2PR12MB9821117564B73D6C805727BB81362@DS2PR12MB9821.namprd12.prod.outlook.com>
References: <20260415060239.733200-1-shubhrajyoti.datta@amd.com>
 <aehFVdYNiGMh1rry@csail.mit.edu>
In-Reply-To: <aehFVdYNiGMh1rry@csail.mit.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Enabled=True;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_SetDate=2026-04-27T06:21:35.0000000Z;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Name=AMD
 Public
 v26;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_ContentBits=3;MSIP_Label_2d0b1989-8fc8-4a69-bcac-d46889461ba5_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS2PR12MB9821:EE_|CYYPR12MB8938:EE_
x-ms-office365-filtering-correlation-id: 23de8d44-df9e-4cc9-df72-08dea4261312
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 w9fEX7OKs5uu0PLRmjYfFrWI2UCJ4I+81rVVRYq0v2j08S2yMG6z4PyyaL9xEhaGl36fua6fbq9ZOYwi/pymGmUyo2qT13tyvZFLCYbRpABIMLZJe4+3S8dJS35gV1GAizeTN38eE+elXMptWjxW5Q7UhLFP6xdknW6Nu519LnLm51+GyzFuf0mm5slyUlgAAO802DmMW95cwNf5kiOfwEQdIUykJAkSYkpttdQVY5pPSxB9pyPWo5cbBUQF6s1oizdwMyUZTpnF0jZRX9gb6fkSwdm4/3ItfmR4wFWN1NbhoMUi+gMrM3AfIVnGOgL1zx4cSlc2lyGTLTSUif9T8JlzK754BI7/bxa7vFZuiY+5W4XYSMeDI/xReC22MKko2L9o7AGcqrSWSjnB1aw0aXFfCiT/Ze0t4T8zeFonk1aC98i0Zr2t1cr6WYPNq3mj0CrirkbUxLiLP9GMSN2uXk1VeN57WqhjQLyPNd+L7yV/ripm/511spy3pd720Wha8wJn7WgEl0/qEArfujPQOnGYUbiLEhXI5LG5+bRCX4MIiuZqKnlM/ilpLhFeOQCic+XmxZ0cLl1DgYPsMNwIu2ZnWDoy1Hj1l26cXMgJGnK7bKtRl7aYvDX2FGvta9fB3QsoTb5t57DjYxSGLIGOFh/jaWf7MAuNFuLDdViHANdrZ4+beamsUEYSx5jmsJ0xOGlJP7Vy09DJVBqBnJOLBZ0p4O8591KfvnxjiMYUj7rVmX0Io5GoqPu4JlGdkSyP7Mp+dTA77ud2MAHW+lgh2nXfHWVYC5LP38Pgv5gJBqo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9821.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NnRB4diNXW5HPf4g7v0xyhJkiTH4TMjJOYhA7yhIsHw7rr1bj0P3VEMkANwq?=
 =?us-ascii?Q?cyip00ykQ1hvIUVAwxjkEAVJiRwhTba6wikJjlN6V26dZC85HcU838o8Gzcv?=
 =?us-ascii?Q?krtXoNoLF/iCBrOP9XqkojT+0xeJGRO9tu32imooHkKHOo8h9/8FpGAn98vy?=
 =?us-ascii?Q?W4DwYhYA/nn/mGBzsihZq6qljhzJ2F7Lv0FDfzKf5tQYHvXoM8a1j8vuG/v8?=
 =?us-ascii?Q?3vprW8MT7P5YrhcHVpMAHY22V8KhuNiR8TzplSL6dIcwBt7S5qGARR00kBSN?=
 =?us-ascii?Q?WhV5Kasl0IZ3xBvx9XK/b5av145z77ZvYO2/JqigtNLkmIetO+s+BBUU7UmQ?=
 =?us-ascii?Q?oZfd5xf9iBTj1PUD4CHQSvEtFzxRib5KxwHK72G6d3d1SNbFKVnh6S7JgUhN?=
 =?us-ascii?Q?W6nb5R3YLnVv9oW9f3RIsgGhWHnSpcgd6fY//TRLSvFb9Z50AvlwoxgXGlqz?=
 =?us-ascii?Q?Mf5zNLAySPpVdgOsXd/5yExyCx06cKnT8l8pJBYAg7L5153xZXD1wsDNaEop?=
 =?us-ascii?Q?1zquBoJIz2B/ts5GILB1+6BHIyy9sQ4tyC+O6Jx5w0mC5KXt/ahp2Xejjhyk?=
 =?us-ascii?Q?1qMwZpdNy3ZuiprQFT2AC69sLgyW+DqagQ5M3lQj18C9imSfY6QolddEikJ+?=
 =?us-ascii?Q?ybJ0RRMD+DHmPqdczT/w4+C7I1Dw6lTwOjEbikfNY/1QNHeb8lvv+MfmamlJ?=
 =?us-ascii?Q?WO6OMMe/RY/yqNDIZmMct/atthLzQP7DEFiEZhFGeAzxpc2OiqldUsklKVWj?=
 =?us-ascii?Q?Kmz1Qi5hikb6q48MY280sgGz3dspV4v0WQwbxqbQBYW56qpZDOOPRFCzjUJe?=
 =?us-ascii?Q?0nvIGhy1wyTbfhLwjjo1uSegQb1iRJLWaX09UpdspMogeuML1wZBc4w2pnvD?=
 =?us-ascii?Q?0bnLwFzRbLWHgVoHjRaBb/EOU5TiMr3E/V6dJ7hrh0YNOjCT+G7EuNTxwOuw?=
 =?us-ascii?Q?os4BTLaOD26NE3dmhUrg/73K66vEyNprhs/F3ZBLRRyCXNOM6cgUM9bYULv8?=
 =?us-ascii?Q?H2a6ejn3DUJDPvDBQyPGApfwBEoqZU2liAsBI/WQT1IVejFIQSCBsA1zglnX?=
 =?us-ascii?Q?+1b3DAPSsK0hMu4HmEsOeOywDK8L2lvWAa7tyJkBOxZ98Uiq+anFdb+WXtw+?=
 =?us-ascii?Q?J7xz7fO/8RHgVHUCadcRGxm7B342qVSVmKelxzeGmY5O5KP2Y8hrNKlE37p+?=
 =?us-ascii?Q?x87v0AGpJPcD2cRZz1jdt2Kz+LvOViqpvq/4Uj4EUPWs/Bki8emxVXFb0Slp?=
 =?us-ascii?Q?kTR+QfEuzmYOzPpZuxGi/zs8h5w4YScgf6WrNkH54FUQuaLJgXQlb4Edl2yC?=
 =?us-ascii?Q?5RGp5oviV+xcYXU3he9D/AnxNyJFqNfmkWEMBe05ioBQEJe86mAmIGbWAG/d?=
 =?us-ascii?Q?yHK9IC0NeQdiKF5yvkLGz4NHgLGJRRe8Ro+XF521wmvgskgXbbtlwsJZJ8ns?=
 =?us-ascii?Q?88aBaESQBYx8gXEAtPwDdLNm7AXa8hutLy7ezlZFIrnCfpNaV+Ah3tEEhqFh?=
 =?us-ascii?Q?xw4v8Is0xDQZBmaHTcYbzd7O7fll14RZp9dwj7k8HvnxznONo0w6VFLFFcel?=
 =?us-ascii?Q?wYrVPcesZdLO1WV+yo381Le8WhZysnggp55alzTcbNHh6CRb4qfR9Nr04J4L?=
 =?us-ascii?Q?FAgt9vSQJMhLFgt6rqH/UbDnqaQ8U7UrU4AIwLJhMh6sxr380ud9auNQOMAt?=
 =?us-ascii?Q?yo6WUBcL+Js7PV4Cs6/x2QA79vYp0rtF3JpU388yc0rJZKst?=
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
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9821.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23de8d44-df9e-4cc9-df72-08dea4261312
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 06:27:36.8305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPZeGr/OVgVl4ECx65yPfEUqmZCIH68RzZI1vWaQ5C0r00Al28Y27Hc/iVtjSKvBVgIoTffa4SIr3ZtW7AOXkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8938

Public

> -----Original Message-----
> From: Srivatsa S. Bhat <srivatsa@csail.mit.edu>
> Sent: Wednesday, April 22, 2026 9:20 AM
> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> Cc: linux-kernel@vger.kernel.org; linux-edac@vger.kernel.org; git (AMD-Xi=
linx)
> <git@amd.com>; ptsm@linux.microsoft.com; shubhrajyoti.datta@gmail.com;
> Borislav Petkov <bp@alien8.de>; Tony Luck <tony.luck@intel.com>
> Subject: Re: [PATCH] EDAC/versal: Report PFN and page offset for DDR erro=
rs
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Wed, Apr 15, 2026 at 11:32:39AM +0530, Shubhrajyoti Datta wrote:
> > Currently, DDRMC correctable and uncorrectable error events are
> > reported to EDAC with page frame number (pfn) and offset set to zero.
> > This information is not useful to locate the address for memory errors.
> >
> > Compute the physical address from the error information and extract
> > the page frame number and offset before calling edac_mc_handle_error().
> > This provides the actual memory location information to the userspace.
> >
> > Fixes: 6f15b178cd63 ("EDAC/versal: Add a Xilinx Versal memory
> > controller driver")
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> > ---
> >
> >  drivers/edac/versal_edac.c | 36 +++++++++++++++++-------------------
> >  1 file changed, 17 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
> > index 5a43b5d43ca2..18045f96610e 100644
> > --- a/drivers/edac/versal_edac.c
> > +++ b/drivers/edac/versal_edac.c
> > @@ -414,34 +414,32 @@ static unsigned long convert_to_physical(struct
> > edac_priv *priv, union ecc_error  static void handle_error(struct
> > mem_ctl_info *mci, struct ecc_status *stat)  {
>
> [...]
>
> >       if (stat->error_type =3D=3D XDDR_ERR_TYPE_CE) {
>
> [...]
>
> > +     } else if (stat->error_type =3D=3D XDDR_ERR_TYPE_UE) {
>
> [...]
> > +     } else {
> > +             return;
>
> I like the cleanup contributed by this patch (in terms of reducing code
> duplication) in addition to the actual fix. However, this patch also intr=
oduces a
> subtle behavior change - the existing code calls
> memset() to clear out the ecc_status struct unconditionally, but this pat=
ch
> doesn't call memset if the error type is not CE or UE (i.e., in the early=
 return
> path).
>
> Was this change intentional? Wouldn't it potentially cause stale data to =
be left
> over in the ecc_status struct, affecting future reuse?

Hi Srivatsa,
Thanks for the review.

The early return in handle_error is intentionally safe. get_error_info is a=
lways called before handle_error:

  if (get_error_info(priv))
          return;
  handle_error(mci, &priv->stat);

  get_error_info already guards against non-CE/UE events:

  if (!eccr0_ceval && !eccr1_ceval && !eccr0_ueval && !eccr1_ueval)
          return 1;

  So handle_error is only ever reached when at least one CE or UE error is =
present, making the else { return; } branch unreachable in practice. The re=
moved memset in that path was overprotective dead code.

  For future events, get_error_info always reloads the data fresh before ha=
ndle_error runs, so there is no risk of stale data.

  I can add a comment above handle_error noting this precondition if that w=
ould help future readers.

  Regards,
  Shubhrajyoti


>
> [...]
>
> > +
> >       memset(stat, 0, sizeof(*stat));
> >  }
> >
>
> If the expectation is to actually clear it out unconditionally, it would =
be great to
> document it in the comments (if not done already).
>
> Thank you!
>
> Regards,
> Srivatsa
> Microsoft Linux Systems Group
