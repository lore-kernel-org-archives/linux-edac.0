Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011049.outbound.protection.outlook.com [52.101.62.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0C735B62D;
	Thu, 19 Mar 2026 14:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930433; cv=fail; b=gFukxScDbHMl653+1MwS+E9S01nlPUr4cgtgUvf5R61LgtrEllYPD1/qHmM+mpHetNF5EkZ1VbHU7DM94HqnsAyVRQBEqDaqiwS96GfdkFzAi4yExeppI4u4DcecEiG01rij8N81kavhffP2BuSPIj0Icuc5y39NNtakGWgxhIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930433; c=relaxed/simple;
	bh=PW3QANQL4i0FLaHwnC4SAXeRn8iqDhIlE9g7Tn00M5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nQB3O/w4mvLIXx/4fp11DvJDgFc7K+Z5bjytqo/c5Y+YjYO401YQU4pxDGmUuk8VbEaFsbbSZ2B9aRWU34/i5BzjxoPw+Cfav6Kr6VjNp3xafpA5d9vXy+wYa6CHl+9+tjyvHfR673w/DoSpqHeHQIk2I9rGMmejWzR8uISlWAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XGrgbfRS; arc=fail smtp.client-ip=52.101.62.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XGrgbfRS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkdfsjC+Df3TaKKkF1sdvSe45x/Ox1453NZ2qjzJq5sWdrfXgZPCUvQ613010qloJWiwGoiVFiJO5S4iFzaNxLME7Q0NR/HDX3NokKX7jDCrbV5svHl7bMIjFRKjmJYdwI83+Y96XH9srmAH2y6mK+TjJlF3tIFbBYJsv3ri76DVLDwnxqtAns1d6AfOTJNPED+B8Wy4bCED61eNtkowlRFjNIdAYdIj1QXvHudLAdIGtQ3MrpxReV3jYAzS7dnHSS2tkMmZ/7qY5SvnPJjZr/LEVJkYWN5HSl7eapw0tulZj0tZgPkqipQUY3zXRcIpNlNik6Ty9VV37MUgLyMgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpWdrGnknkq0st11RIuIkpScnX0jEXEhdBIz6TOhF8A=;
 b=SwScXBtBFY9Q6ipEpmSpes2pGIs8jRV8Rn+iTIt3H/aVF4HkkSaBj6yvqfRBSA3VLKXj3pNCTifitIlYNMlhyq1/7HMpm5GpuCLm0l/iJAn14UgG8pBkt7DqpPF2CHZt/4kHU7OEW7UMGI4Zk+IplAdYwbh/jkmHvvHL3yP10TW8VbkNm5TIe+LogiNCHUaZDgLMaGLOjQ/bMhfHtpppsPRpdPM3sFA+BxVgJ6xt7KzoqrLhTfHumLsFYsM1vyX+NYwsOj/4BOMhJ5I90TAAoM62PzdHWwpVVLMGlZpiKMQVf5j3BFTWrlIvcJBW0l66yLSVQ1/3LHjHXWan0Cjuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xpWdrGnknkq0st11RIuIkpScnX0jEXEhdBIz6TOhF8A=;
 b=XGrgbfRSOdHMA8tW+4DIew5J6yobk493+OVedjfIrxsPvL/d75W3qyK53oOC54o1jtzRnTP/2lEyulMDrWphFh0cWKVEKRWCrUIdMInJyW08DfyKT3YlpLg4wB9wLnhT7L/+0HLsaUu+8kqGsJWtS9jzAJy4xkyLcEmJbsp2KyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 14:25:56 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 14:25:55 +0000
Date: Thu, 19 Mar 2026 10:25:46 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: William Roche <william.roche@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>, tony.luck@intel.com, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, John.Allen@amd.com,
	jane.chu@oracle.com
Subject: Re: [PATCH v2 1/1] x86/mce/amd: Fix VM crash during deferred error
 handling
Message-ID: <20260319142546.GA1639900@yaz-khff2.amd.com>
References: <20260218163025.1316501-1-william.roche@oracle.com>
 <20260218163025.1316501-2-william.roche@oracle.com>
 <20260312144203.GCabLQuwFySHkkCyBO@fat_crate.local>
 <8e35298b-7511-4f7f-8f13-9b03738b286c@oracle.com>
 <20260312160453.GDabLkJfhslCLXZntv@fat_crate.local>
 <ff7008cd-db47-4a0a-a74f-dcf3e6ab1891@oracle.com>
 <20260313202618.GA221731@yaz-khff2.amd.com>
 <1221e4c3-31f9-49ca-b50f-e79d37448d4e@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1221e4c3-31f9-49ca-b50f-e79d37448d4e@oracle.com>
X-ClientProxiedBy: CH0P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11c::13) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d7d0fe-a462-48d4-25e6-08de85c36e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	38n49pQtqk0mEB7cRqzkf1Tq2YbkFVr+LnT3Qg4G1EYG+kQbNyK8Ws6IiRPQCVYEl9weEsGnUn7nlMbcS/D6wnj/mZ13O/tkL5FWEcuCFSXoEE3Zu+NKwRDXwtzk2zK+nyuIZDl99cf3fKOuPZpLgGLjUnfdKIZxuZUDXJqF88n90uokb7gP9inyGshClo0UAA0O+FBWfyZF54w2pvfct+/tQ8+sjhPtCkhH7KcabX1QkNkg9Ya6rPeZGkaIdDKPGLxWD2cCiaQnPCsQhMsLxzFFZZNe03dXtvUxBd22vOSDmaVOmgBfIyeFA+/Y93OAEjQiZzEROi8KtRJkQmTwF2Aryy4jrDkhi91u7jVq0HuT7bQB5rpOyGNiVhp5XGoEOchwBCcTxyR5/uHoVjwlgixWoz/NCtKzGej38Z8ycVjX+aJpjJp0lNop+J5gBKNx2P35rCTu7vyIoE0FPu6sa7v9jymmjZ9GLlsNsX1wTzvy0gEqE3i/vc4fqRhp1UuRKGFcHyn96xQEeAX4LsH5+WFKjKZ8FTy/qO9UFnjnZ8NZHQmNQAhEtzrdsOe1moKCqZ8LVKx8xK/G4NpBT7x5eqoE4XMXFOGJJ1lyJsCL152HacTnRQOoVn03zzjPjIfHmzpivfQbMfoB7KdD8GzV+mknRnUYvZ1LDccdkZKJ6mUcdJc1+6BzlVYH7wGW8GaSdSWkP/idM5zoJzqJ1Ax7f2/s5Xh45nZ64rYn4sQBcP0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kZvM+6qJo9dntex0akneUCgRXbJ2U4YCSQQ0dcHGqG8XFLAy9GP2sALePo9h?=
 =?us-ascii?Q?4i/AHg229qd0KQYljFOFvEyfNyv7Zltc4zBtSPcEGxfBMq/rVVS8PLPSa2XS?=
 =?us-ascii?Q?yD6at2tdscSVjPYE5lFNuG/UvfGVfdTCckethfSZYtuPPmZ5xiOBsrWkF4G7?=
 =?us-ascii?Q?izCk9d2AFmV39xbguMGvVNADy6gUT2GsTJS2ApiWWCXW3yoTZoJ0jzLLn20G?=
 =?us-ascii?Q?FrDmCJAOz/v2lx9kLC0GY4VRfgxc6UnwhT7YGHeLtQAWDmkG0Xy+UIm4PtAz?=
 =?us-ascii?Q?GkTDpd1qsC0dcYBvaVoaVleLlg+PKJGtFHsLz50nRUoErDw7o3DJV4RMUXw+?=
 =?us-ascii?Q?/Sz0SJHAhX2BoPsTHJAxwRlfWZ07bo6hS6kjAxm2eC3Gtv97FuIauJeUUu/S?=
 =?us-ascii?Q?HZe2gnBxsAQtcboaPHD9ZLEhz7A0Ods3BJq1fRo/jmEqtj+JLaiNvX7RLe7m?=
 =?us-ascii?Q?lsSzW9LQKBjGH03or3L0+SRzMvl75pUJO2Id9rnut7azrHRdOPNfTtG6HQVJ?=
 =?us-ascii?Q?e7DxJXP+YX5KsJ43ciCHloZoAE0bavWxysRGPDQ8fDqGL6h/3QYQ24pvy83s?=
 =?us-ascii?Q?PFEvf7fVGqyh8BzFKdvLl4beY91DtS8Z4PBe3yd7+AGqqouOQDd3mDlmjJmf?=
 =?us-ascii?Q?+Wec4yS/75fSTCnlKmdAa7HCDInxolqbwdg8i0MD5KDeo2E/cYTQOrss2wxu?=
 =?us-ascii?Q?xqbMrJme/LlEwvB94qmFw1sEGRQU1oeRnpSPPbapZAOJ7I3eNNKz/dbhzX2A?=
 =?us-ascii?Q?y8oy+xKpDGne54iG90KOFPZVMEoDS7cbuYEpHU03wofv4YskdJr0NVu9XUdY?=
 =?us-ascii?Q?4xI5FNQBPkzH29rvWiLmYqMScRmLRSvFcrHD4rim3m3jwhirZ9lUt9XNa1WS?=
 =?us-ascii?Q?5ZoCShIjeL7YBwjPADgkM2JIRkXtEOLq9cECA+UfvwcIeaWaDrevbwuffN5y?=
 =?us-ascii?Q?o3ecE5wWI91MGhDQGZQqMF65iZ33J1UEPsSZIww8mmnckqBSNUHRbzp6Ko3W?=
 =?us-ascii?Q?wsoJhdbo+so33ghpyhiEo9pox0jMXKajbPskbiUMauhWjLgojBpbungcq+/S?=
 =?us-ascii?Q?5bij9Em/FFEGqdWPdZB0M+FWmF6QRUAt1ta/5vroLXbC/OjP8bTwgJrtv2ir?=
 =?us-ascii?Q?DDhEQ/8zCqLEl2gyv5XCuTZ5OVPJnJiJfGd/2B5HJ65p2D3whs6p+C5TUp78?=
 =?us-ascii?Q?6vyBtbdUGo3JkLE9vVyZ1BPees0J0T+4lIdWqY6etR6lwaZzrh0mc1HA7rdt?=
 =?us-ascii?Q?XEuRndcglxGI+i0j7zL2T0meKHQ1zaPtW7OLvv72sqEQPBqE2axyHlRO1InB?=
 =?us-ascii?Q?9iBsklwAyUAXsgt3/Wp8qxHtZH1Ib2xpARIyAVot0yhm2+27EkmppoYqK1Er?=
 =?us-ascii?Q?FUOm7OGUd8wRXJoUKnxpjbnuY29TorHmZ2uKuZQL6YDmsi2QSXp72Gnsa9zX?=
 =?us-ascii?Q?VnGcAEoXFbSEeKXqqKbTNfk1daRS7h7GZ4HUaMt1+uqNxTlxymTrle0VNryh?=
 =?us-ascii?Q?K4C/ma3ON/aBs25NrF2/LEikCBIvT4Z5muYZBhFZaddoWO4y40NI/uuJAyVi?=
 =?us-ascii?Q?jZXUOuzUrpmqRFZeiKmxWWlrDqyfbYwJjLQAf6gAnQlK2A7fXzF+Ii4d8Bje?=
 =?us-ascii?Q?7qptINzHLBKa57iE2zMJiFExbiqBDI0zevEf27cyD2dJPZelVzPFCN3wV+lc?=
 =?us-ascii?Q?M7Z8gBuMzRi50uynunUQZYpuOVIjxb7TMYMIr3YwofMDIWVR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d7d0fe-a462-48d4-25e6-08de85c36e71
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:25:55.4175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOEkmIfvvZYeg+1S7xI3VmU1GBZrm1zBxEWGvdt+5Bjv0ORLhyvvX6c4gjRfDe+uI/m5rQID+Lx6vtBMkMvgqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132

On Mon, Mar 16, 2026 at 04:26:11PM +0100, William Roche wrote:
[...]
> 
> With the suggested fix, we should cover this new exposed failure case.
> 
> Now if we have a better way to deal with AO error handling on AMD VMs, it
> could be the subject of a separate thread (probably a Qemu thread).
> Our current suggested kernel fix would still be valid, even if it the code
> may not be exercised in the bare-metal case.
> 

Yes, that's right. Enhancing the AO handling flow is separate
discussion.

Thanks,
Yazen
