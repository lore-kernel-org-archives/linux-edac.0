Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E15D3A63EC;
	Thu, 14 May 2026 19:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788299; cv=fail; b=G5INX9xVdEPez7Exhylj9aYdReGEoXDhct4C65wiu925RM+4ojfwBRUSAkIzZUhZaE8NUMRynusktwMYCaUp/rDPdNdZyELkxyVNustJrxo2sz17d3B6jKtZM+SFjA/ov69Lyk3FI47NxqmwVHQxH55WSMvrfqub2jOOpVDHHFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788299; c=relaxed/simple;
	bh=HaU1y17naJarQfPtWntdvRZETYsm3yF8hDh9+rhsPZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o6kzGR2UNc57FGgbL+4PWzPHWZG06uK0Kkj/N6BmzhorMiuGhT7bo8JqfiI6MK9oD47tFfsTH96I+dZ8foBCfJYaPximErFbN0rFVsO9Gjtj6OFkiTiwtinOiz+uaP7bfrVIGybY8lfFdDaNL1NshVVMa2+WRUqccn/1gxWFkyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oVkpC/Eq; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oVkpC/Eq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmB/N5DE1SoeZNnyLYBJcs5iJ/ko/2PAuEAAO8XjofwHl6SVtFYoCOCMWW4JU/4r0abovHv2QkyYpCil47DFHGvK/IsCYMckdWW/8RRq1OR8uIlLFZVA2b8ckoi54gvL/VtSr2wdKe9VIGUvM8vV0BCYmC0MHGGOys2NWwDdyq0SaxDQbu0ZGIPeMNgq72+8EhEpPVCCn5eYJ7exWXPHVwvjxjDvG2Wv3CMn1wj4iTRkVTFhTlmx0YyuNzneHzk/eDsfrCJXRN1ZpijVUik/c/DJz9JIZdkHM1NUH2EyEMqsuTMn59ZLoKy52ttxpZQzO/4Ujbn2ViJmcWnuDTk1jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eHGTZcD/ZiMa0Y4vfiSRMZOTjhEYhYrUJ6l57zaq/U=;
 b=RGZ6kzxSHEuTNKPCiaqB6vpAae3vpDh1EiNUYRCVWtmWefT22hwjwJbOnMeJZlMC+mKp2QwSfnwSqb8d97rnb1OHyEi6bT0sT/TvH1Lyub8Hu8/jXm7QI2R1Wg4qsvnmcDr2Q1EJJtkfqxFQIDVwZ3COB8OmBLDURLnkY+Murxtk42KTCUBkZlBoeHp1zywcKTFs0iz67HIab39i3uMpim01/D1CMNVCLu7q2K+XyzL7qZPQlgkerLv4jYsVXzADHxcs5TCG50E5+eCXUEzJlTaXteo6oK9OTBvW9Iw3S2LLQGYEtWiB+Y8NUZurUcTqBNZhj/vPsCe/m5g7/6u1MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eHGTZcD/ZiMa0Y4vfiSRMZOTjhEYhYrUJ6l57zaq/U=;
 b=oVkpC/EqnnyJrUxa5uvpTHZc+U7wAgN5ovGdGPoR+eMlat5Wif97ZNqtLE89PxAJHX9zyV4pPcZu/MFG9QTzY+IZEbDCHOQPI+vGjDjZ/pbSd0usYPC1VbOET5IA1xCwQKMbGWIr4pzJmAwZtwecfjil/q+xa8fCn22/igfVHm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 CYYPR12MB8656.namprd12.prod.outlook.com (2603:10b6:930:c3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.18; Thu, 14 May 2026 19:51:35 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%5]) with mapi id 15.21.0025.012; Thu, 14 May 2026
 19:51:35 +0000
Date: Thu, 14 May 2026 15:51:31 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	Avadhut Naik <avanaik92@gmail.com>
Subject: Re: [PATCH v4 2/2] EDAC/amd64: Include DRAM address in output
Message-ID: <20260514194904.GA11459@yaz-khff2.amd.com>
References: <20260316125324.396889-1-yazen.ghannam@amd.com>
 <20260316125324.396889-3-yazen.ghannam@amd.com>
 <20260514113147.GCagWyowfypCcZ0fUo@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514113147.GCagWyowfypCcZ0fUo@fat_crate.local>
X-ClientProxiedBy: CH5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::14) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|CYYPR12MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: ef199fff-b7d5-4539-54ed-08deb1f23462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|11063799003|4143699003|3023799003;
X-Microsoft-Antispam-Message-Info:
	W7NKSCo/I2ZnGdkFwGcASZrgr2JAgOUKpCqavBrz2l1WlmDxa8djmyPC5gwIRPcI/m+7N3O1Z4/97nXz4J1KZ5EdgE71p0mMapX9Gkpo+5xzBSTLQ6Kc6rd2WlITT8Hh+cJE4jICixIfFv/Um2a3gO9LUsxUMvYD1P39fE4815bLUbuYrZ9hwyc778ZuNZsDOKy+OzAWFSoQJZyf9/Cr/k+V1MFJxXZNYYTcmslmkl16WuhL67PQP3fl+99xxfIgYbd2+b32FtDsZ/KcK3wOtruVFns2lQP/ZRd0PQzPozOEu5j/ycJiWt9aw5jfk4nMvW9eCzAMOo6+enXZ3GV5h5dXA91QRECVWlOPjNjTJeRKZN68zOm0rcsJvhDRf3qvNEB5dNiXwd9ZNZ00xpQmiVtX6a43GwJz3yYhOUWJQrXocrl1gxJ8r8qMyH/JJulwWAMn1+9dTXjJnb5mRIGtksuf3Xcq/K3Od31wU48TORySUzcwEPHnKiT19puXnFxhRQP24G5Mzjp5aiFvIVLqBqOIDVQPq6oZTD3PDlkx+6rF+2P9XrRScdXFF0ypTPggEE3sBiRfjEylTGWWejkTO/HxGQDLpjVIzFmsUk9kAQ67yemUvS7xFtjcfoWJtAZrt61xP9mXKjeVMLEAFSdV6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003)(4143699003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WTNjqV8qFSPrRCszO8Jomi7xU0jyLgCcR69KGPM1O/I5tCQGDEMrwvyVp4iB?=
 =?us-ascii?Q?DlDZpxmd6+aL/ct1VV1gzqRklsKjZXwsl7/N3ACJbtkzqYYwSllahRwqgIlV?=
 =?us-ascii?Q?m/6XRcqLa7NUWqKYVb31HYj1orS2+MaV+4vvgxsE37ggpTqy/GyXqOgJkuTT?=
 =?us-ascii?Q?uCHw+aULl+wJB/tKekD4IOUB4KuCbLZP/llSL3LruiF2kBFHgAWDOqjSF6fP?=
 =?us-ascii?Q?bWk4xo/X7xd/y7+S0HcCC0nfu+ui/00sb6X96sPI0maP2+4b7jY4TDPj4yly?=
 =?us-ascii?Q?dF/fwFbqXS9LrKjDz9vQK7BP1DKrJBh9W/JYbYNZujlpoH7YJrpBWa4STF8A?=
 =?us-ascii?Q?gZjZs4DoLNgeP7dxeJ/jR8Vhcq+U9Mgo+lxeM7mKk1qCJ9RxwQ4jXEQK0LJL?=
 =?us-ascii?Q?GMSLeudbuxuoIp2tKOy3lpfX7cOQEHyjD4kjN/FdVf1pFsdXIq5CvGBjS6xQ?=
 =?us-ascii?Q?QATHEZ472FYMsevQ9X93Xgj6wRSHlBJAchhrAsrNf4T80yOa+hATFWu4nUlX?=
 =?us-ascii?Q?Wn3SbSq74JMHzXj2/SdssZnWi+0lNyVfsb3hCb8p7T70AtIM0E8I+6quM/+7?=
 =?us-ascii?Q?4oSNao7LAG1BCmjSOuhwuDEcFpNTk24SWomyHg7JDFblHklXDK7uWAQC+ulg?=
 =?us-ascii?Q?grGLbaOKRDVe/Ov9UbCCL5xR/xZEIyrJXU5lGmA6o6WpiC6RmbGRFJVLbKIM?=
 =?us-ascii?Q?AM5QMv3YXzxUPqDu+jwnOjCfo4W+ON1+1A+goVM4dsTr+6JFljkg/SjHj/pA?=
 =?us-ascii?Q?AG2LDk7P4z/l3EP7HGhG39Y8N02i1IUWm3Se+eKLo8jb5yLOT6gVfDJDMKsE?=
 =?us-ascii?Q?lQ+otM/kZt86VHnaROhhpmsmoqc86VR/5kLPmrOWczcXRJaNBw2uNQBXcpg+?=
 =?us-ascii?Q?lXyoIg1jy2iU1zRY1BVO34B6SAyKAgfWDpJdPytVx5G6QIlBQmb6tF2SJXV7?=
 =?us-ascii?Q?0LELl3Txs8t4VQAzzCQWk2ttBsS2WMMdcXgI5u1eNfWhrIcQ7J2pwaldf7De?=
 =?us-ascii?Q?sakQ1YT+t2ppvT9me61nIHnj0sqCGwZFCeVLn7tyjhLWow5Y4YRgVzJhSpuj?=
 =?us-ascii?Q?2MY6w09kTuLOtocTglAlyOgL6TQi1+Hy1V/DwX4LO6JCkn7tsob+oSq/5KRv?=
 =?us-ascii?Q?YZ8MBzOk/SM36Km1Azjxi6jP7rxPRNZVv97f6fgmrbCAzKquEieFs4Vr+vZZ?=
 =?us-ascii?Q?h19m4UFxHUtDJHoRUs13XW5Dcb+0uzIS1i6Cht4Y/ZKJ2Qm/y086caR4Gt24?=
 =?us-ascii?Q?JNcpyfkYSGgC2Yp8GT53ruIP6XqnPhwFL6arkSJuWav4W5q0XqIV7dzrWtA5?=
 =?us-ascii?Q?b/qA5cvZcmwb9BFu5WjXZS8Pn4Uo5S2IZC4Wa6fO0TU/4riKmiRSmxsw8aEt?=
 =?us-ascii?Q?I9IeVaN9Qo/aseUKbulEOm+48JrmHw42K//5EHbKl4w5ABHzR251cNzpVhf+?=
 =?us-ascii?Q?s0ZSrmuqnyMqAbwJQdLpU1ckN3CHk407FrkuLN0/Yp8nIe/b2MiVorl3DHvI?=
 =?us-ascii?Q?u1Xfw90fFqYnnBzfCDkHTSxa59O6SHuUOMV0Dj92/bRXvDgNX95gK3kbnEnm?=
 =?us-ascii?Q?0oXnVShIB1mntQXuRYLNlyVAy8YuOxUJjRQN/VxsMjZVeDRy3n6jh1l03aO1?=
 =?us-ascii?Q?q/fu0792KVZlFep+JM5Yr4/s2eBU1/kifmkIFnFm2Tbeqb3bFbk6FADUoYmu?=
 =?us-ascii?Q?alXQUPuskXNv2Pc2R1zK8ljUNRidKKX4kSYXE9pDJpfzeo8R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef199fff-b7d5-4539-54ed-08deb1f23462
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 19:51:35.4642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dthIKsZTFAu4TJ7qkKnqFJmyGZMjlS96LRRi4A2w9iChxno8VRsh/f/nBXOO8WdqeQ3ttcFfWtM8O6r23pjxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8656

On Thu, May 14, 2026 at 01:31:47PM +0200, Borislav Petkov wrote:
> On Mon, Mar 16, 2026 at 08:53:24AM -0400, Yazen Ghannam wrote:
> > From: Avadhut Naik <avadhut.naik@amd.com>
> > 
> > The DRAM address of an error is used by tooling to find failure
> > patterns. This information can be used for general analysis off system.
> > And it can be used on system to take action like offline a page affected
> > by a bad row.
> > 
> > Other EDAC modules (GHES and SKX) provide this information in their
> > output. The AMD64 EDAC module was not able to provide this information,
> > because system-specific translation is needed.
> > 
> > Recent AMD systems provide a PRM handler for DRAM address translation.
> > 
> > Use this PRM handler to get the DRAM address of an error. Include this
> > in the EDAC "other_detail" field.
> > 
> > [Yazen: Reword commit message and reformat other_detail string]
> > 
> > Signed-off-by: Avadhut Naik <avadhut.naik@amd.com>
> > Co-developed-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
> > ---
> >  drivers/edac/amd64_edac.c | 27 ++++++++++++++++++++++++++-
> >  drivers/edac/amd64_edac.h |  1 +
> >  2 files changed, 27 insertions(+), 1 deletion(-)
> 
> https://sashiko.dev/#/patchset/20260316125324.396889-1-yazen.ghannam%40amd.com
> 
> Please sanity check.
> 

This is a reasonable suggestion. Shall I send another revision?

Thanks,
Yazen
