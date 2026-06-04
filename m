Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2B2F7EED;
	Thu,  4 Jun 2026 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588149; cv=fail; b=KKOldeBIi8m2GkSCqnelPUst82VLnfaXyH89xoj+D3QCHhfqBAVZ/K476rDZ06UlsO7suEHmA0OHAsQeaWl641AaJ0gKY1hy8tu3t+UgHgHY12o/0uBCKAh7mc6wYdACGdL59jTKmoNdxX37sajG3XxhulIAHoFjMR4xptBnQEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588149; c=relaxed/simple;
	bh=IrM1ZFU2WKYPHfi1Vbk+hnxgdaZfdbzr31Q8zlVRpEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YaRxqpa9asd9erfd7wQzNgsZI2SIWSL5Lk7roPGzqPTUAcShTyLZ0QqkuYXcpS8FOa54o65r9me1gpYK66yCuwCyaTznybLTNssdZbiCAGA+8KjdF+DWuNo2vwAadtZdgwRWLQVQdxs+RLkcDb+56v5MBNer3lWzos0/6SQTxR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TL58A95A; arc=fail smtp.client-ip=52.101.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TL58A95A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sFP6LRutLmpQxx+z5jYXI+0oarsGCXU62ruyejBpgfZqZnmZBNcLGOmXKuHo6zv2qrjoNACtqpCWksjJxiT7OMrPBYEseQKrnHuhMM2DgXFIUTXdNdz8SeaAYC9S0OzU+wtBXpV2a+eHeN43k+DPOyuJmqh2JzqRw1y8frsz1qn2Eosey6RBl7oI2gG8S3/NIISFPz9xK5X0FiEVTWRGNXIqXWSTFaH7GWsVfmPqFdR2MMd4Dlj8AL4EZSGhvnKef2vZO9wiTJa/9khyjXAGbRQ+nxzm/xTqK7iVT5D80EmaAA/IdTYZ0O7xTFlf7165G1maRBVkAyH2vUBKu5uJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCcWcJhElb2bIW0tyDrf3x/sVFapllQEUI0EEnW1dIA=;
 b=TybzUxqisPpq6ytV5rlImATTtdedbwefgVLfxTbJFYVvO1F0pNJHqHpH9D0uevdwXIdQW7YmcI7Qv6FdV9FOeadz3piTjfkqBS7T5p3zNwtkcg6cBnhUs9z1PJRLQ0sxOZMKl4dQCUnk1EM4sBsO//cpqpMuzvqWd1rvLE7FSLBg/bllzFFxPfKiQyTMmLUWZk0tpOYQEzFBymZLkWFYc47CUtI0u5YNasdBLmkuPY4GyI9bGPWs38dXk0NKOJHvsAm+7dknbiZGqKLgoGvvjHQczKI/o5t7r8QVFkoNAdCWIz/v7EgX9BznKGKqQ8JD3sfcl6pZ1i+VIvy8dvOyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCcWcJhElb2bIW0tyDrf3x/sVFapllQEUI0EEnW1dIA=;
 b=TL58A95AXLldALS2e7pmdbUnKTYeWXmDyUg8w19n9PUgPi8yEKjWHjgEGINeDnjESUezfaiqKM4/ScXDCsdLkUsXVi3lpQ1hNzflVC4eSJWJBbXUut4c21u7fvEDDccH6rU58MftsfsKSmcuW++nI4eZ2RbCZSbGuxU4dN2rQBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 SN7PR12MB6765.namprd12.prod.outlook.com (2603:10b6:806:26b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 15:49:04 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 15:49:04 +0000
Date: Thu, 4 Jun 2026 11:48:56 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260604154856.GA1625873@yaz-khff2.amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
 <20260601184100.GA4547@yaz-khff2.amd.com>
 <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601210535.GFah30HwoSEavRkLXu@fat_crate.local>
X-ClientProxiedBy: CH0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:610:b0::34) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|SN7PR12MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a96c33-98c6-41e7-87d5-08dec250cdca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	+c6UrPVXlTm/T4IyHtaQR/Og/9jmKXwfxdpeCMm28B2zebpD/OMxj2OodPZs1UHCLvOmuCNKuSFohjinu1Ni3kvT2Dn+kfkSo0sdsWwYy2ltmZCyP+dj5JS+w6SInjDFDLUT6GDuONLC6eC5naqDYonKJcYjuS67lfa63mIXqMcbb+9zGofgyMpW+ilLsgZnpoFyi+TzzIPvwV1BuYlieq6FnN93VRSj2YrGYOLxs9gfjjrXEL/L4UKm1foLG2w6/7qnBnpFNTAT+2FtPjgbFoU5ef4zTL43GLMeyYdsiJcF7FlnwqmKWJfWRb477bkTo/yadYrqdwSB+dWsLxQ9e1/hVGGH/Dolxbfa7VUba9VvzyhQk7lHdqs4UDj2O/tcdfX9fg19+M8ufCGkBmsOY73ji/Cgih/HYraUzmJpvcCMfRYry1wMKpc1sXmDoNGVgbEfLHV+5wt7Z1LmwhcZ0usXQ5JM/IXVP59U2obBInj548W9fFdcLTrANUr6/N31X6QzQOdHrBajBvCilFk51ifM1MqY9j9PacLCrSh1KM/HBK0HtI8RDYU6unUZZhPzjz57oVhO+FrAV9J1pXTIZ8EVZpVudWOJXWb54ZzzB8gQJjt97pWHuEyZhZmMvCCJn26x+Z/i+ta7UXsNDg0Z1lPht+lqpTDaB6lMEW6Fv7YXQridWPNz8lKS4T0nytfO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tg8SEJLrRzg/K+NLXCeuhAD3MAGTNhjWb8BmSTDf9/SIRbVmmHHJm5tqiBzc?=
 =?us-ascii?Q?LeadzHFqVHOxGSjNMrMV4p/JywhC78dVrSlyot/CER8LQzrXFpFzIjvbOWL3?=
 =?us-ascii?Q?KibL0rMUejRDxuRXV4tLjcwMicq+VocmggCUFcmUOrbHxP/mev0ZHcQA/uta?=
 =?us-ascii?Q?sg0W/9KRBAbcL0D4fV8guzWa/XzGpRAd8wYtaDbK3uEeH4tTuYIMZSU2Q23v?=
 =?us-ascii?Q?GfVN20LuVG0ymkVgEo2gATvrZwwZvj4aJUkbwwCC0V0CCBhUaZsuYTZWhiGs?=
 =?us-ascii?Q?usgtZBC8AUcySgCpY7502N5v2axImZHf/+bj8+h1JjfSah7akAMz7+CG9AC9?=
 =?us-ascii?Q?+y04vUBvI/cU/d7NI+DVo57LexdOT+wTXiik13I3vIccDppA8kALw3d6Qyim?=
 =?us-ascii?Q?XO96JWT5rdA3pY+oiq0xlrRmFGggRIP2DekBN66wWeBe4xBoAN/a+8opI8VR?=
 =?us-ascii?Q?rbYG+ypNEwuAbBfAkjOAXuCMBab6apwnQT6dYQW1woi9htLrESAMslG5ihKv?=
 =?us-ascii?Q?Us9N6ZzUYmBF4lEnK2xoSqr2JOgXGAHAA07fIAOEHJzQs7HD7A/RvMUzrwhn?=
 =?us-ascii?Q?oCFnkRFHg1G0O99X3FRUN/c7TBFn3BCE+SPPY5dFqhUhauckg66jUxVobRlR?=
 =?us-ascii?Q?yB5rZ1Prg5h7qrAzzdk87kMbZSNXfEoxXdGXF5oDAqygeXwZL9D7B7voEado?=
 =?us-ascii?Q?hQXfhRvsPrPwTVq0ur4gtQmN5c9WAGgySwLQZ7IueDmwZSKUHaVRpDjpH0Cn?=
 =?us-ascii?Q?OGDTAdRcLWgu8rGIAq19lAgNp8AylGis6XO88Vl/Bc5vEpO2xECydRKuVOTV?=
 =?us-ascii?Q?PXHzBsQcQEphzVU1ftc6HmUjWVWw3MTrhq8QjksS/ot806yA/1zNK4Mc3lPD?=
 =?us-ascii?Q?E6jNSlt4IOKOnFXo5jpwGim9XnrN19aOD7w1WJqOl8FbYQdlIZf5B56MGXZe?=
 =?us-ascii?Q?wu+e+WALOw028K+xujl8pEH9Y7oq8t1KOK94r1Fc5Cd0ryPEQ3KmUs6k5KeB?=
 =?us-ascii?Q?4Ch4ovVhX7mgj/qCHoYO2OMU81thfHZNpxnhuuN6zzf1SbUa5xjnizduzAYC?=
 =?us-ascii?Q?fh+tnbwIBdWTrvl1G1kiPeQUywegIJL2+2MWuoPz/NEplbWedKVBJCsPyXC1?=
 =?us-ascii?Q?Wjc7yUEm0lpCcZtWKQpzw7jvpNPq7j9aFNhh/TQwJUJCGZ6yaXuX+e2WHutd?=
 =?us-ascii?Q?/3Lf9wik6rrn/Bgg0kn2TvTZJXPogksPlAU1VkOfo78XGn+I9rBduiWX+7dd?=
 =?us-ascii?Q?hH4z2gjCnI8yB3duFO65uwLn3/mxl3M8NWI03Efmctd9Rn2oWFh7JWTCyWoh?=
 =?us-ascii?Q?Q0YPAkJ4hBQqkc3UT0hkfVZ/nclz/p7cY0S95BkE2kOlLz5rc3Z93lb8Ip6d?=
 =?us-ascii?Q?2hur2YfgR5L4igILV3iMN35c9wA9VXelEg+hK49p/3k6s8ufJeGwLM+AqCp8?=
 =?us-ascii?Q?X9HeAX2s9GliaLlMsqX9aiVVjoytgejZAWEXGamMCQZkN5qr/KtISyVEZ8AI?=
 =?us-ascii?Q?x37BwM7LmBcWd21DrbKSp5qPq29A3UEWKWseQpYWQRSZZqmVtYQ26XTiwx5Z?=
 =?us-ascii?Q?5NgoK0H+aIma1CbvwGgINd1bQj5/SAc5YqEWI+K7KEfPfHsQrmWqi9hp1p26?=
 =?us-ascii?Q?H+SXS6qY7NyU212J3ZN9V1W6lcvR1YEAdwCNNY1XXKfmNXTQkBoQrvK6zCH8?=
 =?us-ascii?Q?2ZXGRWCze6pGoudGgw2cQZIMjhqstOl5UhHV7YyaZDEPlak7G1hvp8Lz59zP?=
 =?us-ascii?Q?aKp6juRCKw=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a96c33-98c6-41e7-87d5-08dec250cdca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 15:49:04.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YgV2a3dReOsnFfcdKf1ZV6y3C7ewJGkDlY12VOqpvPa7u27tss4BTvPwNn7pMMHxZj1cPIsZJ8L+L3yBqt0A2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6765

On Mon, Jun 01, 2026 at 02:05:43PM -0700, Borislav Petkov wrote:
> On Mon, Jun 01, 2026 at 02:41:00PM -0400, Yazen Ghannam wrote:
> > The fake_inject thing looks like it could happen with all EDAC modules.
> > 
> > But it seems unlikely because CONFIG_EDAC_DEBUG needs to be enabled to
> > enable fake_inject. Plus a user would need to use it at the same time as
> > a real DRAM ECC error occurs.
> > 
> > We could add a mutex to the mci struct and hold it during
> > edac_mc_handle_error().
> > 
> > What do you think?
> 
> TBH, I'm wondering if this thing is even used and whether we should simply
> kill it...
> 
> Meh:
> 
> 452a6bf955ee ("edac: Add debufs nodes to allow doing fake error inject")
> 
> it probably is useful.
> 
> How about instead of passing silly ptrs around, we copy the string to a buffer
> local to edac_mc_handle_error() and avoid stupid locking? In a pre-patch
> perhaps...

I think the issue is having concurrent updates to mci->error_desc. EDAC
assumes a single owner for the MCIs. The fake_inject interface basically
acts as a second module/owner.

> 
> This whole thing is itching me to axe it off but meh...
> 

Right, I don't think it's a big deal in practice. IMO, this is a
non-issue.

Thanks,
Yazen
