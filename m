Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B628373;
	Mon, 22 Jun 2026 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148052; cv=fail; b=qWs+zKPLQK5ftEY1mffLghP2k4Hn1D/ubhIOMk/yzmZJPiDDBoFDrbN/dczxgnvocKF8b8ZHKeXaq97W93xzCKum7Ac1+3tD5ItjJFbmXBUrS30lXDlBfJPntOwpKjOS74XfgkqLnLmcrPQmKbHG+GEI5ZrFqzSb2sH4cQB3yZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148052; c=relaxed/simple;
	bh=8nF1q9fxXdRrtYIjyKmFqz4H1+s5wKXUmZr1GNtNdYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LmSBTaGdpkr2eXo3kuqagaKQST9a/ufdrYOn8E62QGoDwJlg8SC6BdnhtKIDw+DzzwKszsGr04kX3dzoO+wM28gks7o2tZuHQ1YyN5LHvAEqk2TuX9qcXJwyy26quCGOD3vjy2JfmdRK/q/0oFBzVtp7Vp4SyqZo2jzXrWwkU7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nOkaenBF; arc=fail smtp.client-ip=40.93.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nOkaenBF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgjnZ4sIUfB4a8W7IDTqigONz5M7kVIRCDQF1JWm/YXRpXtYmKSlqIWKn68sHOtn/HKfqRxuhAy/KO0P1dkS14YXjljxd04itsdqdCf2mWgMZjkVRPrTkORtxuh8ucfF8t636tDlG+XBYCOgLXEE4w5RV9eO1xitZ7e4R8kb1msm5TbhiXLsyptyhNZIXyVcu1gLkcvxQMzCQaT8L55q/gIG72OBGDREJGnH2RDEKhp8YquSgNh0dbKVBFOf3L3kiTkWuvg2CiNvo+WzEfUMuvxL99Nr7gOwFl8/jRkph/Q2Kuf7sB1PsewC/bgk1MF9udzrsrzuMe3A7zhrYhQsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8XGiaZO5Q0nw86NPCT3OUiLY5DFtN0bTgU4JrrJ1tg=;
 b=ZBMKV61vjA8rYsww0PTsTfaYVl1m8xHhyqctuZ0JFAq2jh5Y5l2M+EWoZAyHfrNX0rw2bN0Lihit9NsbIR4zaGYtxpgxH4iNSM3xHNL7JzvpCc+YZjLg8qpbyGhq9AH3iy9t4MbUMWVz6B88P6YoJj7rCsmgHvbnnp8XKBlpHdWigkTht0V5egTxq3sWLmllQbSrO3B3k0ZcTUr4V03SY7xYcl0yhfMQPRVJStBBiJhRBl2kJspWBBQWDAQvrl3s3kHM8mRUsyuMsedmTfbuZFh866EMjI2Uely+DNAl05bJxPTWcySP2qIb06qWh0oKbryJ/vjKCsAJ8cQ3TnB+vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8XGiaZO5Q0nw86NPCT3OUiLY5DFtN0bTgU4JrrJ1tg=;
 b=nOkaenBF6yjrgyMOuPLBGt1sn9H/NTRPCWbehgmB6sdx7kj66VAXLtOJqfw2yv48kBGWW4ekVku8K8yvlorB/P/6agFc270cfysRAQC8afwST+oWgNz4+YiJShV3TjW2TOXtmE1sH0iau2DQ0OIdq/MlmNHzokesE3Yufex3NcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) by
 IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.19; Mon, 22 Jun 2026 17:07:26 +0000
Received: from DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf]) by DM4PR12MB6374.namprd12.prod.outlook.com
 ([fe80::af35:a7a6:6ca:7fcf%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 17:07:26 +0000
Date: Mon, 22 Jun 2026 13:07:17 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Phineas Su <pohaosu@google.com>
Cc: bp@alien8.de, tony.luck@intel.com, muralidhara.mk@amd.com,
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/amd64: Only translate Node ID if GPU nodes are
 present
Message-ID: <20260622170717.GA1571@yaz-khff2.amd.com>
References: <CAHGR-A+kTAcFpBE0wH5WYraUUq3=st+hXMjnF6Zcj8OGqOBJwQ@mail.gmail.com>
 <20260614150618.696249-1-pohaosu@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614150618.696249-1-pohaosu@google.com>
X-ClientProxiedBy: CH2PR11CA0020.namprd11.prod.outlook.com
 (2603:10b6:610:54::30) To DM4PR12MB6374.namprd12.prod.outlook.com
 (2603:10b6:8:a3::18)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6374:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 83c8f79f-f8ea-4ba7-190b-08ded080bbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|4143699003|11063799006|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	5wqFGp+lAvnpbOEApu9Ohn5ptjq4+/CUK2G5q10A+E6H/cYX1hFLQkdZp2G2I/em3KbDAHbg3h+QyO8ZUwaAMrtux7AuC1pjOdbipk11aeReD0PUvpk80UKfhxcq1tkxBeM/lpaS5yBPZC23+HmKnPl0DCsc/VHquLhjn1LF+8EsW8zC34Qd8j2RvUk0SJn1ddVjEdjE2VOyx8f8u8XMd2TtTsWgjo6iPW1vrQmkjMRYcvjAjoZWiDLUo2uqzGVbUsMtMPBHm1GwoPrqjV2h2d0Qbog3RPySeERvPdhygLKpsnXq60yuwi3bS6Jf7rauYhPMQD/TFZ4101b+VEZnYQ55O+ZL9/LZh5HHAui83WMRGeTtPGqIpCA4+XPaz7K5P4TpTHlmLSyXG3ZT9cwrK6fbDZ+t5O4Nfg+7xlW/IxURDNg9ExtNaSd13M6wy9G0dLZfa6xn1YuQl2BXJfKOrw2QbdwECr0sc+me3OnXeDoW6QHlaYRoYR6z0MZdXriscBf2LoJOrCgJVbaqTjKftLGP1JfrOR618yWRhAuQQ7wkJY2YfL0IqXfDb12CukGKuVBfFWYxL19RWZ3z5w4aj7uQnb0rZx+qmGjb1SP9Ud+chhzj8RB74gbmpwztEslZuzK4NPSQChem2VJr1CIr2gUIxRqXqeEa3a4dWN3uZYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7HW1m7PpowgYP302yhY7HCAWGCHz76VwLgeIKMHBzJ/7zvqyHhzSxIQhj+k8?=
 =?us-ascii?Q?nhhAMKxqev2PyQMBaWJgQyIWQTtzR/w9ztUQQ1zo6KIe25UuRQOTlLV90b76?=
 =?us-ascii?Q?rg+KqQHO7ImQ90JjOs+fdmHTHV4o8ANhtk0zmbYWfULQw4xoCJ2Ttzxqo2PV?=
 =?us-ascii?Q?HXCCNLBQvloBCU8tQAgHGfnPZdkVhWbOx/wa4rfFZhDOkdbuZmPDsMv3JfYc?=
 =?us-ascii?Q?oC3iM42F1X3eovFQ4zNAII8ZIdUBO9XcUSLuMndwc9nAwo7g8SzG6Kbs8uX8?=
 =?us-ascii?Q?04e724IT1EZ3Xl+h2Oah+Q0o9zNraAyIWknA2WEl8JSMifB+fKXQu0KEEylA?=
 =?us-ascii?Q?n0xL2MGSyIbBQiQKXKSKdkeJDG+gyA93L7J9EWKP8QSQcpLQ/GnsXBVetNZD?=
 =?us-ascii?Q?otxDmmpbJYWc5khDtxpjNXWu+aP7xzq+tuSumxiR8hs6xNKffaoyWAH+GuGu?=
 =?us-ascii?Q?RiY+i2L06GfKzy8RoxSPZYKwb3FziRJz1w7Ap6GxtvyVEUOblRWRIJrvFP5n?=
 =?us-ascii?Q?UDmLD6g8myFWhBv3uU10CqHCxizjMgfVBdSkgoj7Do2dXi2OaNKQEBigl7ux?=
 =?us-ascii?Q?6NRwusufA9vn9ftqhlokZz40uKGCqAxW6b2r7sdpGQPd+nh0jiIHHtneJwnC?=
 =?us-ascii?Q?zbhlCQVFVihfAH4CCM8QshSV6EgdLWVA4WHm+w4IEAY2awwFCIrEvDYgKKCi?=
 =?us-ascii?Q?/8XTXewALy5rT+jrhLVvFNES8UeMEYb50lU/6BpqpCGsqkjerpdD3MmdEAyk?=
 =?us-ascii?Q?DkChb3bTOSo/364fjKlJH6BhYLQXNui3oF1ZFJwzghy9IcCX2kd7KhWum1gA?=
 =?us-ascii?Q?PmleXf7bLcQnwmSCz7rSI8qMA3vJvCXSwrFGlYdGc4OETlk7vmmXNRsrsb4s?=
 =?us-ascii?Q?qJyQgVHS14evX9kieCtI+I4nf0nRF4doKIFWxe6M76D4iHOPWVISLy/E34Ai?=
 =?us-ascii?Q?JuucbqGPu3nmK71yLzDD4Q9uB6HQ0r/+MWlxS+5grmoYHOMRT0VfzOvqlUbX?=
 =?us-ascii?Q?N0bz+AE65VYt6E9Mycg9dGR4cWAht2fIDQlIhA/B+fdaS0mSmRGMRIwtLGvn?=
 =?us-ascii?Q?PemrMbi4ou/0XUztFt9zcbJz6DmmzgFMRHF0MU+rUqWLsvczZ1bwvMuzxFVT?=
 =?us-ascii?Q?fZq+SLTvBJ0dCWYG8pywxurQD5Bu6V6zzIOf2a3NVavvRd0G8QJ6MzWDW34O?=
 =?us-ascii?Q?0YjEbNwZbdl02Ac1mULe4i7O1LyypIbuGDmjKyBTw1rhxZNkTSIqeG17zwd8?=
 =?us-ascii?Q?DBPihY6YCk+90C/k/3kHQz/n6sdOczsw+plEK6TAKzHWRMija+cNM/H/oZmQ?=
 =?us-ascii?Q?LurcN57KOeOUk4kTm5DHr/YON96/r5/nReMg/aRg7mSTzQ4A1kTaa1gxMIix?=
 =?us-ascii?Q?4SENhuW5Xyir8iRZ3sj++d1/9aiAr6Nar882I0KYHKC6P1K+WxDODfrWNwQF?=
 =?us-ascii?Q?78Pt8VYJlHJPUNoucE3tBOfyp4TxdLK2E1zvpOK7wvM/0qS9DlVB1ED1MmW+?=
 =?us-ascii?Q?vzHg04BVPNdPqv+aELDNfBwQ5Lh4XREuczEYiaIO2+0J4DwfI5+DqlwYg9hc?=
 =?us-ascii?Q?uemkupe31QVuam+AR0SlNcrzUlesl2P5O0wZ3vEijzS2thNOiraLbrBs/71w?=
 =?us-ascii?Q?9EtdY0CXr/MjnfbhVZdLfRAYI0EQEPgukvJjtN+ohDObvYD5wrlmx2fMcn8D?=
 =?us-ascii?Q?6zQZed59TbnmIBYaJ6iZicjgK+mSvqBPSOQ+lnpB8hD4PBqEsxmv8HLSKwGL?=
 =?us-ascii?Q?ljuEtSkRZw=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c8f79f-f8ea-4ba7-190b-08ded080bbb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 17:07:25.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DOy6RHCc1MWPr0y3AtK5wpWRXyN59rHyK8kpCj1NMlyRvZ1i3kM+4Lcrk191vARqzl03UJOZprvbNdU4YcwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079

On Sun, Jun 14, 2026 at 03:06:18PM +0000, Phineas Su wrote:
> The fixup_node_id() function adjusts the AMD Node ID for GPU memory
> controllers (which report as SMCA_UMC_V2) on heterogeneous systems.
> CPU memory controllers typically report as SMCA_UMC (v1) and do not
> require translation.
> 
> If a CPU memory controller on a CPU-only system were to report as
> SMCA_UMC_V2 (e.g. due to future hardware iterations, firmware reporting,
> or kernel enumeration differences), the code would attempt to apply the
> GPU translation. Since gpu_node_map is uninitialized on CPU-only systems,
> this would lead to an unintended translation being applied.
> 
> Harden the translation logic by checking that GPU nodes are actually
> present in the system (gpu_node_map.node_count > 0) before applying the
> translation. This ensures CPU-only systems are always safely bypassed.
> 
> Signed-off-by: Phineas Su <pohaosu@google.com>
> ---
> v2:
>   - Reframed commit message to focus on robustness rather than a confirmed
>     bug, as Zen4 CPUs do not generally report UMC_V2. (Yazen)
> 
>  drivers/edac/amd64_edac.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index c6aa69dbd9fb..1e688123a50c 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -1047,6 +1047,10 @@ static int fixup_node_id(int node_id, struct mce *m)
>  	if (smca_get_bank_type(m->extcpu, m->bank) != SMCA_UMC_V2)
>  		return node_id;
>  
> +	/* If no GPU nodes are present, no fixup is needed. */
> +	if (!gpu_node_map.node_count)
> +		return node_id;
> +

Thanks Phineas for the patch.

I do agree, in principle, about hardening against possible new
configurations.

I think your patch could go a bit further.

I don't see any users of gpu_node_map.node_count. So rather than add a
user, we could remove it.

In fact, we don't even need the entire struct. We just need the
'gpu_base_node_id'.

>  	/* Nodes below the GPU base node are CPU nodes and don't need a fixup. */
>  	if (nid < gpu_node_map.base_node_id)
>  		return node_id;

You could add the "unintialized" check here. ^^^

	if (!gpu_base_node_id || nid < gpu_base_node_id)
	    	return node_id;

What do you think?

Thanks,
Yazen
