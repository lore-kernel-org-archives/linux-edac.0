Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119393D5668
	for <linux-edac@vger.kernel.org>; Thu, 19 Mar 2026 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931009; cv=fail; b=Gp+VjL7SjBIvqXKId49i4ddDu18xW4FgIckGGL0dPTdCqsSDAPdEa4vlXObptuLAms13+ctQIe1D67qRWNQvC8hFatsxl+Bq24RT0MtiIr1LXXj07VdxlyVBsl9ib4yz/BdnD/FKrNzJEf/5YbAgrPHjX+KtkeUJc4qagVkVIEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931009; c=relaxed/simple;
	bh=QX1Jl6zdbFIW/16Kmc78zawkssOd8+ad4Q53QrtIyEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ckr0RXul3lf/kzz0RmEwSnzaaZe5WyMf+LbZvO64t4e6ErxinougxhpWI0qEX9cbBoft3KOKNW1QObJPH9boeN/GpAp7owvDGTjGEaO/XwRk4CecyfdnNh2mQ9OWXfBy/Y/5dRtM97nVC35bv/HCM85a1WUkwc6/tRUxrF1mEl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cvR+59Vh; arc=fail smtp.client-ip=52.101.48.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cvR+59Vh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxCtUHvK+EDIgjQ1ivtH084KXgiEM6l2slEfDMnrUtzetYUV8SLbqAL9mS9hWtGIsAfnUqyXKcnckfXYpjIhl6k5D/YmCvIyB8R0T30cUhMvU9PLFzD9Dhpvn9g/yje//E8vJ51K0A61wcEQllK6pTI/pWumMSyNtrddi1ErKjh2CeNp5aKbB6ceIGMzEyxXUu6oX/1ErvWW95HjXgwpxkGKn39dcY460ZXFpTewP4URJHPgUlyBujD0yP1gbY9SmwRW1jQ+8wr5wqUCBchdK/n1olKBfUdgbBU0vWCf7zqBRU3N29RnSHfbZllAqwc7Dz/3xmcTd1BqRSPbgINUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzXI00ProgA3va/QewWpuY3oM9ujrqUqe/FkMVU1kL0=;
 b=nbyoLG7gg3EMjNTIzAACN3E0lLOMRlhuyzBLgwsqDaEmrrJbyDS+lCY1bEW9EliuB5+T0jq4DsOyNvfRJLmrqt2TrAZJSVLEHKn0zKU4EBoAGpgyfJ57MxicTI1tU4+DQDEf067mqqHYf6LlwHq2whOXSGZiZGdSJFggXzZGq5JYEzy0rL4YzIwgsj6wkvm/qhp6440HPKB0LYpgQ828vajCmEHA9uxvL/VAxpjZqCE+LKSsWi0FGW6JUddjmuQqoUbGcC3Sf+uU5c16KtGAObVp4EAbfwnm6RJV8NseFGroRTEurVf9gV+fbRm5oE6lAMMQ32QcrbfoyQvSU5j00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzXI00ProgA3va/QewWpuY3oM9ujrqUqe/FkMVU1kL0=;
 b=cvR+59VhRd260eWC/c3aszdsCHU0QZug52Jm+FGolrXT6xV3DnDH403LrZtetSMiQi3O2TFybicoOzDY2BuBxU6SD2hhKz0ekAsVZsSFvN09z7A4btMop0gQBujIuK4JYvhk9E+XJ4ZARj4Dd9NUm+FQIQnaJv83xCAcRKtXnks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Thu, 19 Mar 2026 14:36:41 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 14:36:41 +0000
Date: Thu, 19 Mar 2026 10:36:34 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	superm1@kernel.org, linux-edac@vger.kernel.org,
	Shrirang Deskhmukh <Shrirang.Deskhmukh@amd.com>
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
Message-ID: <20260319143634.GB1639900@yaz-khff2.amd.com>
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <b7c232c0-51b7-4ebe-9c9f-20537628fd38@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7c232c0-51b7-4ebe-9c9f-20537628fd38@amd.com>
X-ClientProxiedBy: SN7PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:806:f3::26) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: bab50cb1-3a4e-4794-c341-08de85c4ef57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PQK9p/Whc1lTNeQHFFC5R4zE8ElvWLE+8bv5cxaBHZ3uVlWjgaT151SH4krg6QAZmaKVsbsM+c2aBprTMGMFPWtxW3xbw2qukmxnoQLbgW+3sjHI/UMGJLBPZR/AfN8C0rrob9DC4eiPEQHWm7KHH0qKtIcgGep0+1vtDKA5UUML78V09jdD0irmULrDXm7T57ZE+sdetMONVWjVnktm0R88QKpKtf5JH55G85Gy0t4MGgeLW78IvaleyzjJ3ORd2ijnlFPGe6hSD33oNSgcJFHt2G/X9qBOSsB404R8VF7OWMDmiUAXhFAbMlfPC0caZhNcsJ91zw+vPVPCKoJWumjGbv6Q3dvChAUYLO3szKj6QAGKh9BipwZHjjt+MWx0qQQrUR3hKVIisoAYonajhtRhAnyMEIocSo70lGk+Z/wYRcUEZk9fVTJOPX+3kTwYf4Rq1ZuPhg4ZvdclMe6G/zfCeJAmtgqNHZ6UjG7GbBV3yZINv/njgGXOt33Ouivb+CBfzWZSGMl6+zZeJ0k1nAw+xETn8P0TZfnsdO6RczGSHsI2is6vw7vbSRKlUqxFvokxnnW6fEvH9JSv2tR3FKLVidYckgHLKqAoU9LK2dfnsSkvojtzzN3urCixiPWOoQjTxMZglJY4k/v3ioccAXd9TpjuMK96rL88JmLNYLTkUDLHYAS1jn2ZFXEMN/4Phvjs6G72DMhOWSf4k72NKSiPMPMlwiKFH6ZTfZ8iWCc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OfB0pGqwFSa68VKQDfkHeIuVhh2gg1My/+1fs5fV6ga+1010OIX+GUMjivNm?=
 =?us-ascii?Q?B/Z0mt9omeCMEf6NNhS+pGl4Ii7BPoyp6FS1lFtDueiTapJEP1aKPMLWDNr2?=
 =?us-ascii?Q?XdCV8vciPgjuWiid01KCTtqIQEt8qeYBEuuiTiXDDvfIp9uw9v8+UqwGbz7A?=
 =?us-ascii?Q?SgqP4Nr82ty5ZpN7GKDanBCn5W9juqRGxdpjkr4twz/4IMZWpXZUTCkKYqB7?=
 =?us-ascii?Q?42i4NhKbXKs55bVeg1vzpg8ftfLyb14w47v6mdND/PjCOi3SaPFVqwwrAjpo?=
 =?us-ascii?Q?79Yg3EKqHRAFuhYhMWTgZiPb+esW36BWw3pt86EFYf3RZkEG2RxPBNpEaY29?=
 =?us-ascii?Q?XD9IsHU0jPyqDE2iN1n4dynVROPw4BqvKmA7CSbessi/BE/eHEBYBh8nyYoF?=
 =?us-ascii?Q?LPTkqPuS7to31BhXlIf9VF+zkf5PER3gLPtof+cqYA897tqczgtRbrMtICKx?=
 =?us-ascii?Q?u8NeI0wLSGEKtQMboWGQWysfnuzrmrRwZstr4VThvfwZqKcN9AcBaNweFgfs?=
 =?us-ascii?Q?JzV2OoBe3c1PXA90Kq4DeNOoCyH944UiBWLa/LSWQX1ov5HC7AYOkYCqkAxc?=
 =?us-ascii?Q?WCvDxVcMMnfgL7vXvaxyWW9jg0Cu+SzIqyeB3D+d5SizAgHmxEXpZt0lhIGY?=
 =?us-ascii?Q?aJuLXbZkNtUeymyM85JLN3p1NaBVQbIpdr8O/xZloDBcvtT6bXmPrKbAwm8f?=
 =?us-ascii?Q?0vT9hJBTTHG1TWl2wZG7f/ixxOAec2KOSt1HqXO1fm1KCp8PdUKExvVz1x9K?=
 =?us-ascii?Q?LrwwiBHL7pdXWt8ArKOfxfTD8waMcQOzM3Z9pPJH+2cikWPVUENsxvBlO4D1?=
 =?us-ascii?Q?2UEJ7zyiE3yW7JEJbCjNO2CZ7xdnGdyaEg9dXLF5JuyuasklKmyp1o8D1iSK?=
 =?us-ascii?Q?azcl2FSP1Jb1ug6E3PZPyINJfgCOiAeivLoCuHjmalvXvn4EWlr/mJ0V7JTG?=
 =?us-ascii?Q?5dnT0gVz+Xu/OWw6UbIP3B4y4LWlM4EITOAPOPbo8RuIlTRVvOTlEaoNF5MF?=
 =?us-ascii?Q?2ti2i73XvHaQINtmrCAZ8mH7ef9SG57+Fu0Ws7b4HvCdMIf2kp4tqXiRMzS/?=
 =?us-ascii?Q?6xIzake9KShI7Hxm01TsaRfT+mKb0mCNq98bxyV2yAYS8hrPqfmnjuZv50o6?=
 =?us-ascii?Q?0xkAu1u8Tzkd6HyJeVW2DEvSPS5sdhzKDeawPKDeqWurOkdfUMXrIZ/68p1n?=
 =?us-ascii?Q?vlTkMuk6NBoAbWsznSFi2lOOb5iTMUPKfHaSaq4rmO0F1pvGtsk38eSe/wge?=
 =?us-ascii?Q?dCl0eRVKdEbLRh75uwqM7ZOnqSuT4hF600oMgC4x1Ecvh1551LSfGRDLDduK?=
 =?us-ascii?Q?cloQ8vrqM/O2ab4sKnzDIBm6gi6xHkYkCT8LtEcbJy0h1w4qyzkHywV/Fl5v?=
 =?us-ascii?Q?UiRHDoyCU2o7Y7znKkqgH5D0482vSLEWnM1Z1HhMaCz+XSpqqWIHJcwamLXv?=
 =?us-ascii?Q?F46XvaB9nLDWEgXa9DAmG6CqK+shHLqzdS+iLk+g1HsZ7mQLiB8BgGQuXmtN?=
 =?us-ascii?Q?UJO00SFtYCNfI4BTDkQ6FLP9RYI9+7mL7/NaYfZnCOo4vG7IJik/mYgEXvXT?=
 =?us-ascii?Q?Eaptvp9NO/F3W7pPzezukkZkRsgNDKzzvYgjIiYYHF8sGpbbp2nhG6XQwyLy?=
 =?us-ascii?Q?OX7TJ3vkp/9rzCcoXujLGk9IvwseyPYYLCNnLwSgtJqu947CqHToYHDpHvF5?=
 =?us-ascii?Q?vBOC8Xm32UWzyTS20jxLiyWmYAz9WSyvpNuvIMhuBt9m5b1vP/nYosiNUWW1?=
 =?us-ascii?Q?SZhWU9SMdw=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab50cb1-3a4e-4794-c341-08de85c4ef57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:36:41.0831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjJWoF/x9NU74VHzvXOIxhV9nyK54/2nN5ZRAXvUfbvjI03PimhWumBkrH7mduwXUBzVy7IVTf7zyHxsdFUvtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734

On Wed, Mar 18, 2026 at 10:43:04AM -0500, Mario Limonciello wrote:

[...]

> > diff --git a/drivers/ras/amd/atl/core.c b/drivers/ras/amd/atl/core.c
> > index 0f7cd6dab0b0..d77dacdd4f56 100644
> > --- a/drivers/ras/amd/atl/core.c
> > +++ b/drivers/ras/amd/atl/core.c
> > @@ -190,7 +190,6 @@ static const struct x86_cpu_id amd_atl_cpuids[] = {
> >   	X86_MATCH_FEATURE(X86_FEATURE_ZEN, NULL),
> >   	{ }
> >   };
> > -MODULE_DEVICE_TABLE(x86cpu, amd_atl_cpuids);
> 
> Pretty sure this means you can drop amd_atl_cpuids as well.

Yeah, maybe.

The request_module() in EDAC is unconditional. We use the same EDAC
module for multiple generations of CPUs.

The amd_atl_cpuids check will keep the amd_atl module off the legacy
systems.

We could redo the flow. But there needs to be a feature check somewhere.
The proposed patch is the smallest diff I thought of at the time.

Thanks,
Yazen
