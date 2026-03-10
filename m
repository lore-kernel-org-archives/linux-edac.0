Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80533CEB8C;
	Tue, 10 Mar 2026 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146825; cv=fail; b=aAhbZSouDAS1DcFmsBLRAdTmCOft1Lk5JcnHKj2Iq6Ygc4THsyUEIOFbmaXG+2pqaGUoO9q+qmzcXGM5WlHD8TYHsguyp5OuLOG8qoM2X4XZXOmwEkhWvQ1LNIJRMLk4GumaLvIOOTWGXUPmRAVdzfTc1G7qdrvSCw2yqsXxU7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146825; c=relaxed/simple;
	bh=NSFtL7CqMiBs1y4jjU6foJa+3J0HTT8Uir0KWTWJ+RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lz/L9ej00cP35kojiKNDJtmL23A79CL67LsBQNIVOmuYbmEYBWLTioSHHyL/GiQl8Wx31ub6KbGmhFEWQvi6PhKF+t5w4jgu9s72qTSipgygPUnza7Ov4I7MgKqveYFw4kgECjO/vNuabPza8wX16aYf+R4SmPYSI6NuGoqC27Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ITr7EYL7; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ITr7EYL7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H08xDNrHJHQMZA/M9Kk0Zirx8Zau0flXiM/oH/Y0es80DJ8LSTIUIG9VMpxlgzc8tkO0ndyVtsPxE1bdOKioRUmZW8CoSGWlXS5yA52Y+WuBchwswMcMe6dr9WGzBtfSrJS9MNTHcSLXPK3At5PA/+RjP2XyMCZKSEUxVD0VuTK6XQ1FfpS7n2BnL2eo0y7kETs6DcwF1gtz+PKcfsin8xid/ejPH9KsOiHiBO1RXyzEu3/Hnu+g6NUjjqzYYG1HU+F+cYP/I4emcVShaDzR1eEc4qw9KtrVQ65ZuytEZZb/O/kmMrZ/RZiWDkT3wExlYCq8UwTwOmoafXL5w40g2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGZpRpAgGDg4B+lfEeVZl60U4/J6d6Hdk98FHwUy53w=;
 b=zKUjj22Ye71t7jIuWYjPNhSYRGKcosrghKe6IoGlSAkVU8wc04QPxarWLJk1zgtMmZEzeS87Xi94U1wgKYPAhhuboiZUy1ctgI79cYs607IxXh0GNm6TsiBrn0+m+9xr/JIaVR7878Z00yYu9eZOQjFUl5Yfu8lLj+3AxeI1ekV9bz987zHbbPsSvkbpSt30jHBSvvQChXVC+BckRJrK9fgwxP2c+XJmHCir3WU9p0ppw/sNH3D0MGzF90pxy/vRh0CqiimnCitEdCxuOsqCHjHo8peYEvkXjfW1URJ7L01xmy0kuQFOXEwpguZGstkc32Pua1Ocow154KRrkgtqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGZpRpAgGDg4B+lfEeVZl60U4/J6d6Hdk98FHwUy53w=;
 b=ITr7EYL7soQITz0DblOkh5Y4gkMMJOE4s6McNtzBOTmPEFDiT4DjXE27kc3Au0pFBY8IbxC9N9GRmWL3LL3CSFubOEeWEKTZ8ViKZRcxAxDdDpix2SFizBLqdU0XuitaPA6JFvzUsktAo33TM26nc8QigKSYveHy+5zXFkzVhhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 12:47:00 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 12:46:59 +0000
Date: Tue, 10 Mar 2026 08:46:49 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
	tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v2 1/3] x86/mce, EDAC/mce_amd: Reorder SMCA bank type
 enums
Message-ID: <20260310124649.GA890303@yaz-khff2.amd.com>
References: <20260307163316.345923-1-yazen.ghannam@amd.com>
 <20260307163316.345923-2-yazen.ghannam@amd.com>
 <20260308102046.GNaa1NfuoXza1-cB8z@fat_crate.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308102046.GNaa1NfuoXza1-cB8z@fat_crate.local>
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: 916f46cd-b5df-4d96-b802-08de7ea31e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099002;
X-Microsoft-Antispam-Message-Info:
	7cjdGPCFRm4wpSf5JFXMVdnaUkJK+dYm1M9/aWmQtlm8SmuM6wxazmzSNRyMqWt7BM9vIHWsbHTwOm051QdVOTQPfoAP7g+8kRPsmO52YxqEu9ql2ZF9dfUcwzJ1csMpPbOjgYODXGS91+jm1sw2cQs2GQgI9h/Y6caRk4S3e70YyFWKbTLWJE5wCpS4lOzl7ESwA+aCNN/rI/KW3nmtoX8q5jPYUIbS+aiqCsuQi6lFPAaWRdgy0JTygbN8s3mUtu1VQINVxkGtUvjgomxxkr08X9wZfHhTO52LYPdO8buCU99l9Q1XM7OTqM6T5VLqMxyDGQyEpHKy5uUYflTFwuCOGT3saPZ1FtLaPH0CLVn9fQXEVGrAxvnx+GJEyrvuF4W2ZrahcpPpoxtidNuQ5Lj9xaAZeey1CI5VcQid/ZGAFinEYqmwdMLt4JgV6AtD49Il/6KfFOuluRp/zxzWVXwNBz4wmEIhdqo2PDgdIzZvAhr97XLrvMnRuhl8RZEw3i5KAWB0io9nWBfWggSU+PQzUhDx7o7HmcdfWWum4zSuYR3CfRn+q0NAm7SHgWNXcp991QySm3IGynXV1s9Smc7x9pXbdSFzieRZEUQ76keP+mjTFYtKnxplUqkyEvsK6sg5Y78HnEl4Ee7dgsbiNHN6dDE7pl57UxxtKcFHyu0Rw2Nqi+o7FxiddoBwL5EO9rCk/I1YN/c6ygH0/Uy/wkV75Coi100dhlAN2jJIfvk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UyvEQU3yeQmzbnve7NdjviBfaCKe1Qrtz06nJA2EwitZhEkM5L8q6prOApID?=
 =?us-ascii?Q?BCAhlf1THhUVgSR/+dkAy7XqWXr+HwRQmWRq7DA9hldpmqbH2+D7bbkl2PXu?=
 =?us-ascii?Q?EbSN+rokF7gCxxfg+Fs3P1/SXEZs6M4mruC/f2b8AVCGVsBF9mj/YE+SZFXB?=
 =?us-ascii?Q?xA6OIoizd5cjM6u5Wc4xYaDR3R++kjwzsFc+k/D728ABCvsurQK7giFpPdgC?=
 =?us-ascii?Q?y1n/veI1cv94BAFkzWFRSLlPL4s4cg9Z4QTVwtNEZ+3XAB6NNqPIln4I8oOB?=
 =?us-ascii?Q?4LZ1p/YvMinZ0YtG2BwSCmdNX9Vc7BhfXQ7Q44Dx/A4+QRq0ilRuqoXMt3YG?=
 =?us-ascii?Q?wL8RSOJKAi5EEbq/gDZr4XzT9pe+GGnh+GI3hE7kH6XtD9TJHPBRLlQIEjmb?=
 =?us-ascii?Q?AcPpLhWJo7DwKm9jtMRPLw33cbz7DUSWz1+07LDCYHsCNUwsN9SLfMkCSMXU?=
 =?us-ascii?Q?J03APh240U9c7XjZbOqqj2KGJ83ekXjk3G0BaXFNQLBL/SanyntPT+ixFZ7k?=
 =?us-ascii?Q?lolTfI3kOfpvjpKmSn6K6uaF6twcczCGoiE/K3rzPBxMc8GNvPjLXFGDWjGl?=
 =?us-ascii?Q?U2hDrZ0/yZBmoJpOyDaKKt316FyF6d0SpiWFAthbEx7+FAcZHG4i9BthW/o9?=
 =?us-ascii?Q?q0dUDujzOlaae8phwTyc9ZnsmN1Ib/nK9Sx3vyD7hfCpx9s+d3EXDYbNxBXC?=
 =?us-ascii?Q?QJjPe8bWYZB++bsvmLe8jR+TvxjEBUxB9qBw1NH3LdyuNKX2c9V/GGgfpub4?=
 =?us-ascii?Q?udWuMOq0VSectzaVwhFKl9iiEss/KkqGwzE4WQLDFaJyQai2GDpjeqtYKI/S?=
 =?us-ascii?Q?dWGZUI/HMnlvHF9oKwY/0Q68lgaaNZGQNRGS61hUP9DaIo+WEOROfULGJIC6?=
 =?us-ascii?Q?Ooyn0PV/q4sJVfrs70TvlJuzxsE7T5O8+Tk83OLdQnK3C1xQDi+WuFSt8rGo?=
 =?us-ascii?Q?MVhNQaZCnWc18seGvDbt0Z50TLMjFHKoYy4Jul9NwbaIw7G1EV1+zIvtte/e?=
 =?us-ascii?Q?fnwMP5ZNDyvecKU55C/wOdtT5HC+sYo6/CAfFL9jVrclA9ZE6KTPrDjCIE7/?=
 =?us-ascii?Q?gWF0O7CQUv4etldcQGhfW1Hd/vTdRvoEB2QyuWYWu/bHP9E0PpGSM6UpLPJv?=
 =?us-ascii?Q?IbHP1OB+9PMwrrj3Vjdpbuls12O+q84Jx4qDX2JKrn7k+hOAOuD+2PQ3j1f4?=
 =?us-ascii?Q?KiT+wtQahb4kxpAM0tcZwr7mqK9Mt3ZwuWpDfYEQgliwRIoCQObhUDAq+Hx0?=
 =?us-ascii?Q?YMky4gkdRb3mupiQ9U4eqNxQWq6pa2ZlP+3skoPIQOesCdHZiY+GuJapz6Jb?=
 =?us-ascii?Q?rcVBmnv7JkAHgc3t7ViuMETvMWb4LmhjBEsE/Eftc56BgHXm7PUjmztBob6J?=
 =?us-ascii?Q?u4eNTUBKJv/ArOainvRNl3fP7gDxRE6fhEHt9uyCJrSTpgH5FdqKrWxJZQ2v?=
 =?us-ascii?Q?6zOgAszYM7QCvtLKYZOkuUxuPB7K4Wil1OZNo6VdoE+CbNJPc7HrOiTIPbUE?=
 =?us-ascii?Q?sJFrnJlwuM+vKAY2CVbqUZ3UMcecDkkHEhULT/8RZhy3FqG277yRhq0FbXha?=
 =?us-ascii?Q?GVFZxK0DyQCxuGegbrMP8eJCu8AAHeaU+MFXpdwz+THahSnfZ1usHr7KUzgA?=
 =?us-ascii?Q?ty/6WcPnAC8Hpkm6mBSOWkmI+JLlJsxBfFqvHFnJTW4PdjRShizU7iEfq+l2?=
 =?us-ascii?Q?ad3bRgfdLNXYoWbVGBncq1NCi4sscAl3OwibWBlu1sfzvy/A8+qjIJY0OrF3?=
 =?us-ascii?Q?gVwlk/+p0g=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916f46cd-b5df-4d96-b802-08de7ea31e4c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 12:46:58.9662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/ME4SYfI69/omyuDmj71R1oHfOW5fL99TgwAyVenGPUzmiEKJwFdf/5bKJzlNuZf3RESh0QupXdCZ1xUQXSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764

On Sun, Mar 08, 2026 at 11:20:46AM +0100, Borislav Petkov wrote:
> On Sat, Mar 07, 2026 at 11:33:14AM -0500, Yazen Ghannam wrote:
> > +/* Order by HWID then McaType with newline between HWID groups. */
> 
> So I would argue that keeping them *all* sorted the same makes reading and
> touching that code the simplest. Because you will have to modify the same
> spots when you add new ones and the hwid number doesn't really matter for
> humans.
> 
> IOW, this:
> 
> /*
>  * Format:
>  * { bank_type, hwid_mcatype }
>  *
>  * alphanumerically sorted by bank type.
>  */
> static const struct smca_hwid smca_hwid_mcatypes[] = {
>         { SMCA_CS,       HWID_MCATYPE(0x2E, 0x0)        },
>         { SMCA_CS_V2,    HWID_MCATYPE(0x2E, 0x2)        },
>         { SMCA_DE,       HWID_MCATYPE(0xB0, 0x3)        },
>         { SMCA_EX,       HWID_MCATYPE(0xB0, 0x5)        },
>         { SMCA_FP,       HWID_MCATYPE(0xB0, 0x6)        },
>         { SMCA_GMI_PCS,  HWID_MCATYPE(0x241, 0x0)       },
>         { SMCA_GMI_PHY,  HWID_MCATYPE(0x269, 0x0)       },
>         { SMCA_IF,       HWID_MCATYPE(0xB0, 0x1)        },
>         { SMCA_L2_CACHE, HWID_MCATYPE(0xB0, 0x2)        },
>         { SMCA_L3_CACHE, HWID_MCATYPE(0xB0, 0x7)        },
>         { SMCA_LS,       HWID_MCATYPE(0xB0, 0x0)        },
>         { SMCA_LS_V2,    HWID_MCATYPE(0xB0, 0x10)       },
>         { SMCA_MA_LLC,   HWID_MCATYPE(0x2E, 0x4)        },
>         { SMCA_MP5,      HWID_MCATYPE(0x01, 0x2)        },
>         { SMCA_MPDMA,    HWID_MCATYPE(0x01, 0x3)        },
>         { SMCA_NBIF,     HWID_MCATYPE(0x6C, 0x0)        },
>         { SMCA_NBIO,     HWID_MCATYPE(0x18, 0x0)        },
>         { SMCA_PB,       HWID_MCATYPE(0x05, 0x0)        },
>         { SMCA_PCIE,     HWID_MCATYPE(0x46, 0x0)        },
>         { SMCA_PCIE_V2,  HWID_MCATYPE(0x46, 0x1)        },
>         { SMCA_PIE,      HWID_MCATYPE(0x2E, 0x1)        },
>         { SMCA_PSP,      HWID_MCATYPE(0xFF, 0x0)        },
>         { SMCA_PSP_V2,   HWID_MCATYPE(0xFF, 0x1)        },
>         { SMCA_RESERVED, HWID_MCATYPE(0x00, 0x0)        },
>         { SMCA_SATA,     HWID_MCATYPE(0xA8, 0x0)        },
>         { SMCA_SHUB,     HWID_MCATYPE(0x80, 0x0)        },
>         { SMCA_SMU,      HWID_MCATYPE(0x01, 0x0)        },
>         { SMCA_SMU_V2,   HWID_MCATYPE(0x01, 0x1)        },
>         { SMCA_UMC,      HWID_MCATYPE(0x96, 0x0)        },
>         { SMCA_UMC_V2,   HWID_MCATYPE(0x96, 0x1)        },
>         { SMCA_USB,      HWID_MCATYPE(0xAA, 0x0)        },
>         { SMCA_USR_CP,   HWID_MCATYPE(0x180, 0x0)       },
>         { SMCA_USR_DP,   HWID_MCATYPE(0x170, 0x0)       },
>         { SMCA_WAFL_PHY, HWID_MCATYPE(0x267, 0x0)       },
>         { SMCA_XGMI_PCS, HWID_MCATYPE(0x50, 0x0)        },
>         { SMCA_XGMI_PHY, HWID_MCATYPE(0x259, 0x0)       },
> };
> 

Yeah, I see your point. This didn't sit right with me at first, but it
feels better after looking at it longer.

Want me to send another revision?

Thanks,
Yazen
