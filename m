Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A2382F05
	for <linux-edac@vger.kernel.org>; Tue, 10 Mar 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161563; cv=fail; b=ehS4l3BfIrNwinpIqJvP+NHtiNK4JflZNu1k1jXOfYIzCHTQjBQnxTf2yTopoolV1pkbdJmUlgjWxsAUUDSileFkQGdJCD+YpY4XMfblFOCzLEA2ZuV+H5VLK2Xfz8HESF50sXXYlGHuqa+BL0YfoUib2dteiDMDN7gN+GLfo28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161563; c=relaxed/simple;
	bh=ftEPQdHH5dQfFxzlvRlv3ze32rG6xcU90XPu0xzKsp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=idjkpRIZX1a7EMzqr/PgQKVhFt7U9fvsIHYKgSH0zhY06hq+HRVKHhsNC0FVLKe3CvoB64PBx4VNHVHUTsYskYKGxBZxzX4kvdkcyR1li5COucie4k6PgF6qYLwsLyXpgek90orzKGSDhVFu+j6i4aWOO8F59rN7xwMoic2W8nU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2KVERx+I; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2KVERx+I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mie+Hsx7jT/AcQ7RMopVFEJ0IjuW7kQhvh84JtWSibXQfuMhVRDQByPQkbswsj2wI2dKaScFZ/2HVEvdf3OEEutJVtKAZEdcGwr3TysESO1yyk2I803dqfkWlzNFxjDUXcZhryQY+8Einp55HfYWpH/UtgGUNc/8W0GGDEJOZcOOwvS5OEoKh52mypzjY+9Yiv7Plm1FS8sClgVoBOEGxB7M/nDSyivGrsHFz/58LH0TtAsOYE0Z15K4yCsvNLrs4PZzTSOQnWqJs4W1xh/0zLQEdTSFpVYELwlA38cIR0JEgJuUD82k/ICccP7CpYxnX2IYjJHteciks0Kdks2irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yjUU3nZVHFfGrvDcMisBGsfb8kNX7qLU0KgKaeS9yU=;
 b=si2X0BGCgUH0tlJUZCMK0kg4jULb25OYZT1AA84uEnIhrUMYTx3zQlXVAYi/lVfbUr35lEMbZRVLRF0qA1SXxGPb/hzrujmGwjaK3mavvMhH9OV4Jqisvz4DqoIX2lYr2cUZKk3GC5beJ6al0GrV1swr5gG8d7I/vl0A4YTvopMiUIsaQByCBsFb7NMJbQ3JhtsirPFx2XKo9iuul/b7Rmw63l8EhvXim3cYc4nO/r4V3bcFfo70KYj9DAhv7+3qj+r3EjLX3emiOdajM87L9X1WbbuMLVkdppIq3ik0nL3mPL10CGtvc1Tagn0GEiKBVodRvUlcJjvjrDeYYF2Ahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yjUU3nZVHFfGrvDcMisBGsfb8kNX7qLU0KgKaeS9yU=;
 b=2KVERx+Ijc/sfymaUgo11AwVkX7CQzw92yqpIFCB79/sWGpBN1vPI67lNPyFShv+ZbpeQuHzAeuO+umbXiJxm6F0o4HwoTarLrDnKXZZ2gXFJR0fPbsFQPbWo4hcV8cOY0FDJmX7TPR9pb0d8sCdqOI5iPrK2Rk/myFKXqxW6B0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Tue, 10 Mar
 2026 16:52:34 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 16:52:34 +0000
Date: Tue, 10 Mar 2026 12:52:25 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	superm1@kernel.org, linux-edac@vger.kernel.org
Subject: Re: [PATCH] RAS/AMD/ATL: Decrease message about unknown DF revision
 to debug
Message-ID: <20260310165225.GA1166706@yaz-khff2.amd.com>
References: <20260305154528.1171999-1-mario.limonciello@amd.com>
 <20260306145003.GDaarpm6p8A-pFBCCf@fat_crate.local>
 <a9a4aeb8-a044-476d-845d-0368f90624f2@amd.com>
 <20260306153223.GFaarzhwApsh3Jdqdy@fat_crate.local>
 <47075497-6bb8-4da3-b8b3-63901d9f3b05@amd.com>
 <20260306154947.GGaar3mxJ1JkcC0OgV@fat_crate.local>
 <20260307144910.GA113343@yaz-khff2.amd.com>
 <20260307151231.GAaaxAX3gT1AKv04I4@fat_crate.local>
 <20260310125422.GB890303@yaz-khff2.amd.com>
 <e6fa4686-5bff-43f2-acdf-b4442452d4dd@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6fa4686-5bff-43f2-acdf-b4442452d4dd@amd.com>
X-ClientProxiedBy: SA0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:806:130::28) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 9426d536-5673-490c-5ae8-08de7ec56d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T9ODdhZaMxYzf6ztVsG9snsCpddPjp08fcQjwbWLLXdYSW6FWiYmzCN62TC823kKbiy22xfj/deM5d36jY0iZ8M4k9Va9aqOUUrOo8dSfMDSwMVz8qa9ZA0LXBwh8Za1avNXwfc32Yewh0JtPreKCYrDXMkQsUrfARa7Y26gnRwp/yjs/HKpRmX65P7uZ9chxhgbqQkhMsLojnUHZC0iyZzIPrgnNurvqj5hfReJzE2cuWPKKH5p0ThSBOMGGlYVSSYK5NDZCAYE9/eydqipa5AXnYRjHr1r9dNyepIenPxk0mUsltrb5aZCMUcuw+BOdLralfcf6hMzWbmpVSGToM4by7Ub+0g1J50pi3YXA80sIePH1cTY2aFIEXYzdCg3C/lqh1XB6b+xjcRI8xz84QeuzaTUaJq3ai+ILsSwdgIpR6jt7sbVCBa4PI/xWMoiclRqqb9WVtYXUseO2c3mH/4w+HcE0hUTncCBO5bjJViMpbtRLgpAkbn5bW0+4EMykbiefOLAFlZItlaOCM8RacxGRvJlhoZJnP8DhI5Gwb3mmUtsqgLD3opIzJ2QuceSzsT3lgUQjl9bhr5qQflZcAdcYUrfmW161ULy6Xx9DQDp5vmOrv6QTB3q6fYDArxt4HzCwCKgI5McC/UbTVhi7JUpsFzEgYL/c8eaFCxCtT+FauN9BpyTPPiJiqrYaAtuT0vKGDLWoUOwBMDo/seEe/jh/xiBTXGg2oBi+K0uVEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5w1gKwki6IuszQbVoR9B4mb4w8GPQA/bR6dRa3oEo4XDyIUnjD4UtCMUZQWf?=
 =?us-ascii?Q?wUGnVduBlvXsIsHhZRFIR3vNLuW8nzR8kEGFbaiqPTh5syMH8HiMoa4Yznep?=
 =?us-ascii?Q?siRPBcMr+xIzLYVfYBoD33rzyzjgJULztcuCJfjm6ntfpWSciWETSpR38AQb?=
 =?us-ascii?Q?YqxGdZ9Kq8AYSZdvzL8GfsJFzEQ3nsyjvLWYx9gqGzmkryyotDddQEMXKQK3?=
 =?us-ascii?Q?SMnduOUbdDHIH+nm0YT9hhiYHnxKLGryGvsgdLbmidAYzwox/9lF9PZ0zm8X?=
 =?us-ascii?Q?Wa3WzzekoW5bSF6VrEzA51xVKD33NGVOqTQ4BTCzeKq7smr9lk74tEPQ7ujX?=
 =?us-ascii?Q?Vk/y+7WZ51r+nVo1ALQu3MMNV7esAnyUHxm+tuMkgiBPTZZh74064lvkoED3?=
 =?us-ascii?Q?GKC7seZrB8V7zjouA3pooJOZYtHEU1II/fGJE0eZY55NXi8/2VxkGm3vBI9y?=
 =?us-ascii?Q?iN2X1NmjJhWnaDVLAk0TMJCRZEnjaJ6nZU355rmHURIp571WTB5jqyyXMY9R?=
 =?us-ascii?Q?FDjEbxuVZC+UjX2bBhNm27AxbStgBOPVmRaQGFZ5TlkPcapBYvE88Uzqd1Qd?=
 =?us-ascii?Q?Eb9fDwAtvj0KrRFHKvJx+44R0m0899LZ6CnzAEtYy43o8ddRGF3LPWWYaqy4?=
 =?us-ascii?Q?I/Znjv9m6irY85FXX0GUHEAd4mXXKe/58dfrgFSLCws+koI3cYXkyeCZllSF?=
 =?us-ascii?Q?RsjHvTfnjQHbju8hCYVSNNzWHA1MJRkBcfIBdT1P9VgxHk8WvKLBVm0YAUne?=
 =?us-ascii?Q?n4bVdboQeS/aHGCJ22DzPiCZwrAJgU6japAO9P/xlXCBhTJV7bv1ZA9GTwxH?=
 =?us-ascii?Q?sKG3X0Q4vtImVcPcsh9/LyTW4oI2vadlU0fB4mhhvvjIZTqWvoCwSxErJmOb?=
 =?us-ascii?Q?7vjXPHlLupfhlicHm8C/nl/dZkeSUot++Drdr2Fx8+S985w4EJP0ms0T7L2h?=
 =?us-ascii?Q?xi8xaM05DP713H5qgnVt+uKxOQTTVx3UvksPmoafiFebnlFftnr3XCoJX9N/?=
 =?us-ascii?Q?Z9A5ixGqBpbP12im5bjVLwot2i7Gvr5NESj920k2Efh5eeLHA/74pK3pjqzb?=
 =?us-ascii?Q?g95l5scPtzQWBG58xcNEYIw+Nj5QKJ632qXIuLaSkaB4CbUPA8uCw7V3Ir1F?=
 =?us-ascii?Q?i2Cgzwt2zqUVB89y5pABKYfLURyZmTCcCelZEr7oiCAn6Fp1R/NMs7xrYlEH?=
 =?us-ascii?Q?zN88PCrwn5yGpFSyXAPgSmqzIdU2olYWWaaX6iCMcVaml6Ewv4Am68hdR1eF?=
 =?us-ascii?Q?6c/65AceHcQmrikrxYZ5tLJzblXWXgXzmReV4ueWegf0Ba1TS4x25gUnz17M?=
 =?us-ascii?Q?PGBYLBiV9sWTleQ/df1z9dUomDbgzqXiOaURx2G4VTmnRRerh2YHY4dZK47c?=
 =?us-ascii?Q?lNB55RpD52f/yKFN4md1Ep3/ruY7+XabcVh65RKwI3DStcYDCWDiExbjXdVN?=
 =?us-ascii?Q?QULca3E+ynWF7jYET8gRv24lxG13X93CkPIvOSwlHCkE25uVp0Tk4sgbINst?=
 =?us-ascii?Q?r4p0ffhKWsWOzlKHdM9LWsldrlQ/DYSz2borpp7H+Z+sOnaDJZAn9vpVsOwh?=
 =?us-ascii?Q?cyckwR6if1zgcIIWnhHKxs407BOQLRNYfcGuXlywY8uzijOrf7bFbRrgieZv?=
 =?us-ascii?Q?k4Jo/sP2uvxUj6Y4xvNbduUKw+idXsWB37ZReRu2mDuewnlHEVfhd2TjNJlb?=
 =?us-ascii?Q?AJq+1kn0m6RgafcrhnodmWUd3qH6KoHa9rJ9GcaHnIP1GOcCWPOec80zcMne?=
 =?us-ascii?Q?/cqgt7k6sQ=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9426d536-5673-490c-5ae8-08de7ec56d4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:52:34.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GUm+0JTRzVPbADbWJLynlRXupYhmy6RVniEwWZ2LzOQvZcMgAKyrLgIJQKe1/G0VElDHIKfDoEIKcH1ifo+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

On Tue, Mar 10, 2026 at 09:58:18AM -0500, Mario Limonciello wrote:
> On 3/10/26 7:54 AM, Yazen Ghannam wrote:
> > On Sat, Mar 07, 2026 at 04:12:31PM +0100, Borislav Petkov wrote:
> > > On Sat, Mar 07, 2026 at 09:49:10AM -0500, Yazen Ghannam wrote:
> > > > On Fri, Mar 06, 2026 at 04:49:47PM +0100, Borislav Petkov wrote:
> > > > > On Fri, Mar 06, 2026 at 09:40:06AM -0600, Mario Limonciello wrote:
> > > > > > But don't you need to use UMC to discover that?  Chicken and egg type of
> > > > > > issue.
> > > > > 
> > > > > Probably...
> > > > > 
> > > > > And we already do that in amd64_edac. So perhaps we could export an API or so.
> > > > > Yazen might have an idea...
> > > > > 
> > > > 
> > > > How about having EDAC load ATL when ready?
> > > 
> > > The thing is, AMD_ATL can also be built-in so then request_module doesn't make
> > > sense.
> > > 
> > > Which means, if we have to "tie" it to amd64_edac detection, we'd have to make
> > > it synchronize its Kconfig setting to the CONFIG_EDAC_AMD64 setting.
> > > 
> > > Or we could simply say that AMD_ATL is a module only because if anything needs
> > > it, then anything should request it. And that makes sense because the address
> > > translation should be present only when something else loads which is at all
> > > capable of presenting addresses which can be translated.
> > > 
> > > IOW, AMD_ATL should not be builtin at all because, well, it doesn't make any
> > > sense for it to be. IOW, its existence alone on the system makes a little
> > > sense if there's no address producer like amd64_edac or whatever else calls
> > > amd_convert_umc_mca_addr_to_sys_addr()...
> > > 
> > > Hmmm.
> > > 
> > > It sure sounds weird...
> > > 
> > 
> > So AMD_ATL *can* be built-in, but it is default 'N'. CONFIG_EDAC_AMD64
> > has 'imply AMD_ATL', so CONFIG_AMD_ATL=CONFIG_EDAC_AMD64.
> > 
> > If CONFIG_EDAC_AMD64=m, then CONFIG_AMD_ATL=m. I think this would be the
> > default for most users. EDAC will fail to load on systems without DRAM
> > ECC, so AMD_ATL won't load either.
> > 
> > If CONFIG_EDAC_AMD64=y, then CONFIG_AMD_ATL=y. I expect that a user that
> > wants EDAC built-in knows their system will use it.
> > 
> > Thanks,
> > Yazen
> 
> Are there "going" to be other consumers of AMD_ATL planned?  I wonder if it
> should just be structured as part of amd64_edac and only registered once we
> know there is ECC support.
>

Yes, actually address translation was once part of amd64_edac. But there
is so much code that it was nice to move it to a separate library.
Another example of this decoupling is with ACPI_ADXL that Intel uses.

There is another user of AMD_ATL: RAS_FMPM.

Also, I do have it in mind that AMD_ATL can be used by other places or
independently. I have some old WIP where we use it with MCE to do
preemptive page offlining.

EDAC for x86 is mostly counting and decoding. You could leverage address
translation without wanting to use EDAC. And you can use EDAC without
address translation.

Thanks,
Yazen
