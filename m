Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013025.outbound.protection.outlook.com [40.107.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15D311977;
	Mon,  1 Jun 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339275; cv=fail; b=OWitYjEd4pCS6gWRIxFCuv3EmxKLBrfFTpsR5Rx3rsCW6Iw9lmYoqOjWL572ab5AURbDtDGCRp4V7+6p9HfYY2t09bLPP+j7dVyF3HZqsjVZXj64KqzcnV+zRP0VJzxAGU0lh55Qp7m8jo4YDU3Xmh2lOiAb160Kp6Y1lkXhZTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339275; c=relaxed/simple;
	bh=FUY+4HCZj5196GBfW2JmbKXrJyJcZkRzMSJJGUocHK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KZFG8Alajc68YXxyPXT+1T9E7PSrpgh7pbKvgHgnifL8+1GWsoYrbx4mEvBpRr0nSeGzTQRz5Pd554XIqpkXYc/g76tsv+nb2l5WeJuklRjM9J2Zt4RIgJS0iyC+yPJXqC6Rm+r5Vmp2tuelkgcc5GEX7fKQwJbmG0Iqthi78Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LjEtuV5v; arc=fail smtp.client-ip=40.107.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LjEtuV5v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4xJoDCD18TVIekj2UmZa273ppoHBZ7uHCwDoR7PDn5gKtqiRyKUDnNeYjtvnY9WUr1YYDWquMvkB346am777ifQIh+u62nW01RnIyNsHWT+oypqrshI15/4TrvOIqz0NCGzWFA0cEvOv1z0HJa1bpMXV4qYgHS/c7EQTnyy4WlXqfk2YeJxDPvjuCZjKmgK+9+V5oJQ+f4HwweZtrjyCYr+wT4STFnSv4Ygb/WeHVfzmSincRkhcIMBV84EYME4lLavHT9m40OZwsWqctfonvVyWf0u1H8sdcK4464Yz6mCgZbudicZO9DxICEpdLjG2PQZQ5QfWetSn9qY25Nd4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkEmx+S3WPZPSDqRU2hKqkxBW9u+N4MqROwPGVjtg8E=;
 b=r0WZgWrSCyOkYHmvg2yTL7zgX5yxaRwjruQgR1tlDBPsKW8qL74SjI/2jCmOMcjDyKX0KW4A/z53uFN/GCfTMTVL5yaYM6SQrnlfYkkw6ZoZLC581rjpChNWuORvwDc3LL+OiYRvQ6/bNpyLUloW5zHajJgQ8tbxqFXAaTVPSZTQPc4BNy1p7TPha1wX2yVzPh/ub7gbx24uAYxpOiOkrr7l/782Bzkfv/P48HHrKthWz69J50MIT90RdVkqWpVSKCx09vNFsQH76lK2AdiMYHTxEpaVCmlMM0qTptZKVSgytqNGWGKaGpuS1V+aSo3RmgIcG+wRx228K0vqvE2Itg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkEmx+S3WPZPSDqRU2hKqkxBW9u+N4MqROwPGVjtg8E=;
 b=LjEtuV5vZQXOiPgk1opDjYlzsamVL4c3+zy1i+kFYw7z2xzp9+WW8kk4EzZj7ymS0ynr3dbIBwFZojv99AFBsry6D1flhb3IG9Hx1DB/Zabn0BUyG0NiCBlEOdPFhBJWiqSlDi7HdFcF6KpZbSfCnEuDX87knJlBiD3nfo3jJ0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 DS5PPF5E0E7945E.namprd12.prod.outlook.com (2603:10b6:f:fc00::650) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 18:41:09 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 18:41:09 +0000
Date: Mon, 1 Jun 2026 14:41:00 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v5 0/2] Incorporate DRAM address in EDAC messages
Message-ID: <20260601184100.GA4547@yaz-khff2.amd.com>
References: <20260518160716.171578-1-yazen.ghannam@amd.com>
 <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521005740.GAag5YhDa_oarHPZdJ@fat_crate.local>
X-ClientProxiedBy: SN7PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:806:121::20) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|DS5PPF5E0E7945E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6f158f-4f48-4faf-1450-08dec00d5897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	xXKjBr+rqCsEuCu+79YxOHaitXQ25NDwGB5WTW1Eyrgl/Egx7DBB4wYoLzyqPXqaW7AkcYvncJqA5bSpxcw4dk8yUVCsCeVikVt35uwBxWZr8sgrjZNZBHX2aSEsQytajbs6l4DJV8SwE7xZZSupYo3aIPsJRo7l1qGoW1dpXIqKfUVagD7QF+Zu5FFuxc0HGWdoeh3a6qglwiQg7ijzd6gDGP1ENvkIMFdsTdjCc/vISoHmXNC/tRI+qNQ/huCR0WsVwDeoHBxiPAxuR0m6cn5R/oxmypDwmiJhWdJHjtun6plJgwZ0B7gsPXLuAT58lsWBGmJudi5Kliqt6RDS7iVzloUK1eumXcwHBQYaLlhrOv5rsFFGWZ/jtrOCeEEezLUja3+U4XzPn0CYXsDQWCkTet0fgiK22ZJ7ZdrlCb7HI8sxZEhR2liD+fI2E0y+ZQaka0KgTk2VGVvSVSfUT3ZXZ02wSIlvkNha6455rEcJk8I96stxGDH+ByZkQFo6IGiqyyigFjVQjd+tEARRk8G/lChbhxMY9aRo9zcy1nxuGx/IQ5FixXOv62yfovb33w6WjnQMRwsYC2u3r05u2he1Dfzf4i/T1Lp9l5SsKsKS21FsZyRPdhPbySEpZnI130PwwF4pXcfS/ITrC3DDBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F7/ritwvvg+Uqm/9JU+fNKKH+XeAjeD4+68W1CKH4LeN3Kq/XADu4LOpa+v2?=
 =?us-ascii?Q?L/3gjv2KKc3+kIlqH0fOwunGxX+Q8ZKRRfc2S+opBwOOFuZJO6E+sMQ16h+1?=
 =?us-ascii?Q?MluONb/tt5hCd2mC4yyPzS7AEuyGpKhShuTsUVaBLkjb3fL7d8u97PbY3bf1?=
 =?us-ascii?Q?18K9F+NdRzbdWndk3IUBLWHkInTWNi7Uv5Yo2+PTmpvoFW7+hxGZgGW9qC/f?=
 =?us-ascii?Q?rsd3OAXTSRkJyGrcwGWCKMywHNdLiHhftmgzCt5kZ0mEegc/htlEbb8dxV46?=
 =?us-ascii?Q?stNE2ASXhoPA3Ulle7Y3zsJNttj7FxBR615B4ToQHz4gtzgm5N22oNJ2/cvX?=
 =?us-ascii?Q?kuqtcEgmMwUVKEo7Mx4bzOgonzHiEvHLe6bF/HB76eWjG8fl7MmDrF8cIbD9?=
 =?us-ascii?Q?HHLDl/ULKGqLaCu0NN5+APZpPCo0uVwkqdST9alVYuXdC1IclK2SQFcuagzt?=
 =?us-ascii?Q?TMv/lPrlefJiC/whx3r9jr0TA0G1SLuB6SMUjKwMPoYI+jGryZ6t6jDHtKT1?=
 =?us-ascii?Q?+khbr3ferRpBG+JvlnbNRxrybJ18TgtkG/OJ1JC/DsDwfLboA2bflountC40?=
 =?us-ascii?Q?KztLQauXDGYS2IiONlEnDcki+gCy8Gi29akfKzy/O6jAsO6m3KjAbOFqOdhz?=
 =?us-ascii?Q?S/Ho32llvmZwdkkw3hVho1MHn8leV5cKBTo4QfUFooKSvOuk26ZjMcthFXy0?=
 =?us-ascii?Q?tzhHwvmL19WzWjuCv7SH0okeZGdphIEMm+5uu/u5zzYM2nPS7HA+RcUBPyP5?=
 =?us-ascii?Q?BpwuBgFCRJWEUnHgmjzpveKXH2f+qh86P9i0pppCTvBDg+33FmadXxpAaTrn?=
 =?us-ascii?Q?RSxm6odfda8/GGeVYKCzNDjY+atTkZP73j4imgEW4IpN2S27B0sVAJJ/Kpcv?=
 =?us-ascii?Q?2rIVSga4uDtb4sIi1kXOf/sL/FvzmVs3gMGK3BywwyDuJvmGgrDrCIaZKvg0?=
 =?us-ascii?Q?VU062NmLiWCi1K0kkqMayQt7ozT/4Waz7Kt7OkoWO4bkHNKmMQdy5Gb/ARE0?=
 =?us-ascii?Q?N0LnmlRpI2MshZEiHRbD2n9hw5EaYb8qCFTfL77JuQkZ6OUMJkbaRCOMlG7D?=
 =?us-ascii?Q?/MhrLk0eZJtQbZL3EduDaTuJCCzcehz4NRi8VkAkJsp5vL+kG4qtBr301mGW?=
 =?us-ascii?Q?5GxXxnikgTk2tlj0yi1oDsstSZnTlZJb/R7R+gbZRvn0iFXp0maPnreOHUQd?=
 =?us-ascii?Q?nHv1mX/PK69yvkgekaNkR77ep0iK7W/Kxbl9rXrgfax4b6YH/Ad7e67UaKJx?=
 =?us-ascii?Q?YRwyOExxwmZBiIAMOAVlXmhSIdDVLOxFRXrXdS44FOTrNxfJCwjpQhSb0usY?=
 =?us-ascii?Q?bWZnPohniQYgpJtMUjtKODmgN979ALUWY+6WokazUqUoc7mLnr0BNaRdUdPJ?=
 =?us-ascii?Q?UZKnwOpnGvK3M9U0RgbXewXrBwqq2UpGmq4pe1ZTsij+tVhbSWGjSPpXgOxk?=
 =?us-ascii?Q?BPgmX+8BehJB+MuaeUxCfR328dLQg56lRY5dDjXHrQ1M1kMxW0AmdZrkyyvK?=
 =?us-ascii?Q?D6SYzL0escMj39zj5zzxP+plLebmDct/Ghn2lW5VxLPfDLsW4ssOjW7Xvx1j?=
 =?us-ascii?Q?30x55e60avIRZviIEru9o40hwB3Fw+8vGhjRgho8ZJQ1SNLI/k00URCwCg8o?=
 =?us-ascii?Q?Y4oYrTJDVwspTe1qrgwLYtakcHjM9Gx72IR+2WQrEPrOOB8nFBjnGid/ULLU?=
 =?us-ascii?Q?m/r/SBDHst0dOVn/3By/tsAQKaRqrwcDU3kVGdpXd32LnYNHH3FrF/wI8nkG?=
 =?us-ascii?Q?3J73/DmCdg=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6f158f-4f48-4faf-1450-08dec00d5897
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:41:08.9226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdienjfYMZjvC5T+4W/tSxGK9NLjNKz0By+qGfvxeWfpQu5+72HVCjI5RamDiv+TLsT4oEghkH3tLNCxdtPISg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5E0E7945E

On Wed, May 20, 2026 at 05:57:40PM -0700, Borislav Petkov wrote:
> On Mon, May 18, 2026 at 12:07:14PM -0400, Yazen Ghannam wrote:
> > Hi all,
> > 
> > This revision addresses a comment from Sashiko in patch 2. The decision
> > to print the DRAM address will be independent of other decoding results.
> 
> https://sashiko.dev/#/patchset/20260518160716.171578-1-yazen.ghannam%40amd.com
> 
> Meh, gemini still finds stuff. Some of it is meh, the fake_inject thing
> probably needs fixing tho as I can see the concurrent f*ckup happening...
> 

The fake_inject thing looks like it could happen with all EDAC modules.

But it seems unlikely because CONFIG_EDAC_DEBUG needs to be enabled to
enable fake_inject. Plus a user would need to use it at the same time as
a real DRAM ECC error occurs.

We could add a mutex to the mci struct and hold it during
edac_mc_handle_error().

What do you think?

Thanks,
Yazen
