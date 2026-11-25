Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795621723;
	b=r5VhJM04i9y2QHEOd2ttlH44UYeI4ahwyxXVNwpJmPKlLotBX2PLrvL3hzWZS1vK3XzM
	 ylHS2KaKy4i5+5OyIueuisHLHa4NrqGKReRLUQOFKhh9HqTgn6JDS/L/cZb2BfRvrZXUa
	 JTNdise3dvW9mrAzOVAu5qmKYG4dS8WIlgFJZebrSDDzZ0f1Ij394VA8IzgHwvxyuAViR
	 /7/0rOcAVZiDldyPwC1JWT0QV6c4Hub16XDJYjrQ7W0Y9u9Wsk1LcIILbwIoikU7aeUR6
	 lJsf9EMlN4xywMHbXxRGV0SlDiq1Dy9LNq9b+lNzx97Kl+AhWpDK4msmAd38zI0sePg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621723;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OJNxAMr4Y/zsJLxKDmg1N8BZjxSfEnn/fk2wM2tbOGM=;
	b=erk9PiM8FU12+7Nr0NLJCwmNQSie8aO0+g9rwe7kvnkpnT3E8SAersXLvfjBRaA74J+a
	 OPr7yo0aop/GrxsnJNjcLVmjlIqr+SKaUZ1wwyKth+hOU6v/X8kmibdbsF2Ms3zVEB5Ts
	 2+iZvYd4veNL9WRd1l+g7tlc+xrj9c+vmB8XUpUW9Pcuenir0WolI8QjoqdDo6dEeritD
	 KBOv/Ucxl4Vm9YjTIPiuXwh1PPerQtpAHUchZDi00t2srr3yIhmuXAAiBv9kk73BlZv4L
	 F3xwW+C5txu5zOVUmbLxnFKYDuYEmTJNNw2QcpU124s9auGW87k8W88oeprQyeERHtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5DTR6LHY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.59
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012059.outbound.protection.outlook.com [52.101.48.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22823606A326;
	Wed, 25 Nov 2026 15:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22823606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5DTR6LHY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUlRJQ6A5pPiATxj74Pkz5w9U0C0ePWxl6+oK11nl4RA25g6iuTk5lX8tpwp1M4ftT862KUVP/qS6xUEKe7Y9g4Og6t+2b29mjIjPdt7pJqYhYNrb/H1ZGKHPTSD6rWvNRt92w3AMhpliAI3UVOIy5TE/rIvQI80HLMyOjiDSDoZDUNipcgJYSPHxYHjE5zme8Z/oYUUmofbeq9gFHZMWa1Pkh3b3M16TMI2OsYGjTqqUmvmGTwSITCqBrSAbV3MrHgCOKQ0IEgB6Z655MXv6AenWusD/p1075qkC/EDMtq0dKUDHwqUAeGlvsIX98n6SQByLENqBZ00U7oZRnbtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJNxAMr4Y/zsJLxKDmg1N8BZjxSfEnn/fk2wM2tbOGM=;
 b=T4qcjLj9OIenpcmF+OlPEcPnB2idVA/ccfKEsFehp3gR+ISP6RVAHIHz+BEvGGoV8790DdtyIateUwapcmXPf5p4d1Wmj5D6EQdm4mEscPlIxXnQS/m+cM7nvdcw2YKLEhiSDkWJFBDZDrczb+FCQvN3s8fHpXrSnz884/9vVnYU/lJ3KKFZc8V2WyIswX75WkNysGDjQF2OIGibw74zk7oTHQXnhKgnD3AuA2JgianAgOY41Ilq2bEzSlxrvoodfAGs47PmxWIPsaJXt3qCOQzZDxw44r2IoUf7Biu1d3GDcX0DJQqVzIYfboaNYEEgRNO5ju8sdaEUKB2fZQcP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJNxAMr4Y/zsJLxKDmg1N8BZjxSfEnn/fk2wM2tbOGM=;
 b=5DTR6LHYyyfpGoiM7+KoRsLgGABhnKXp8mV52qJFJCaaiilm4GAauczgZ6XKOiCx4+sUUuwvAJ5uOIaaERNMDB6ujcb8D1OYnS3WOIEJTXGMLJSZsB1aBcMp/msVE20dagbrQWDkJAmNfFAE1fyWLnhzgyc9Ye0psGFkeYEn1fw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by EAYPR12MB756173.namprd12.prod.outlook.com
 (2603:10b6:303:2f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 15:48:39 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 15:48:39 +0000
Date: Wed, 25 Nov 2026 10:48:28 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Rama devi Veggalam <rama.devi.veggalam@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org, james.morse@arm.com, mchehab@kernel.org,
	rric@kernel.org, git@amd.com
Subject: Re: [PATCH v5 0/3] EDAC: Add Xilinx XilSEM error monitoring driver
Message-ID: <20261125154828.GG2156781@yaz-khff2.amd.com>
References: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1795313124-2138932-1-git-send-email-rama.devi.veggalam@amd.com>
X-ClientProxiedBy: BN0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:408:e6::19) To EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15)
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Post: <mailto:linux-edac@vger.kernel.org>
List-Help: <mailto:linux-edac+help@vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-edac+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|EAYPR12MB756173:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c5a6c5-cecd-4ad6-e838-08df4b0b931a
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|261022113327099003|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261021121427099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5FadRa7ik82yAa/6GiXCxvjvA1/iuyvIZcEj6zmJcfYPbebRsfYB35scRpxMhce8XWgr07g9lcsf8G/Mqocc0BA8VuBsKa0IJW5KGzxFl1qRqCUFWWHEk64yySN+LGwgkO1+Fl8BOn5HpFivvreGmZX+711W8HqwFZFNmYpviCe+U5HA4fzHOO+rRecuFNkqim9p1EzR23xumE2bvHOyxfnv0mGtrhjFDdpLbVeUkycKQbsnDP3RE4RhtOxSagP5xVw7wlN6bF2UTSysSUtZ5t5SYydA3kYrc98dyFfkaLv+AsCddh9rUNOswAhasIo/xNhLSmBne9xHDDb1e414UCNaEeXEV1qp5Qk3b8Cq4onE4USNhYWnT8/nV238dHsGKnMOxGL1txoTIHWgVc64L5np1ursp2jbZahUvAfiiRUxduLFPP3uxzJvyvg6FwgX9ZueK8ExvMs9Fszh+PLZc/JtVlaIUizaa3kO0GJzJ9pcaaKaMjjY3QPLYPf/MR+aJ9UTzYPxgdQUTi/PGxSTJXvppoBKuvosR7dmxCWdpwypQGICygB7bLmpqsZ5sKqocbbzgi3xROTV0sXk+Ec6hOVopVGyjHsNIYKEOylRIiBpJ29yn6W6KOLvWC91q+tNZeKM9f1hl2zIRB5Yq+GLBIyOmt669+Rpbs/T0j9lDrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(261022113327099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021121427099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hQosBIEdTEsqQI3TwSX3ja/OOefQh6LpVMi348dnVUQ8FW12lId05KU80qr5?=
 =?us-ascii?Q?0xB1AFAB7l5TZhAoMb1OkOAJI8qKbGcc1QyHGDdzKHkUdNm2tPtnyraSed+m?=
 =?us-ascii?Q?jKPvxESLAm9mP9PA0h/+bSDJNCLSHNSWmDBsfXhQI2pkIIcfDkrOayFLBJqU?=
 =?us-ascii?Q?W64szCEop5yCF+jp+VS2r6P9mDh3+HoZhv8qeptFY29Ylk3Vtwj6Yi6jgk1H?=
 =?us-ascii?Q?Mmt9sxISic4yFRuiTnQpl3lc+Mt7JSA3+vrdqgUKOwMNprrGQWL1CZ7ZUoP/?=
 =?us-ascii?Q?gQPfoP8M5WQkXbNEq25eF9KCzQxW/kV9+NiCggvY6VrTHJO0biJvqhGBshWX?=
 =?us-ascii?Q?lvPo2s43/tumZ9rooM5aBWU3ANkran11pH/ZBPRxO7e8AaYCPZZdWYzktJhG?=
 =?us-ascii?Q?tLnlZ679NRsDNhq++/RzD7yBPwGaX2eNZ1y/lQ0ErXY1vtj1YwXjWYR2Bv3K?=
 =?us-ascii?Q?q7vbSTwJy8bthvvuTdRcG859wdqnpeVY2ycV7B61HbkFg+6Q0ULMA31Z2/W2?=
 =?us-ascii?Q?Q1YT5QSSK2CoCdALCuseEvhRZuMSKAxq8dYc44gexV5sPHYjJxIcdmy3JyiH?=
 =?us-ascii?Q?PMdQCgL2x1pub8quxGrUrzCZ32FgKP1BLzy8h29E7LfMRWFT5ONYOBRXxxcX?=
 =?us-ascii?Q?i63mwc44q/EKEIgPkMEAObLLutAhXrAcXOyozbMZgmIbgeGlfe0e2JB56aeB?=
 =?us-ascii?Q?zm3rma+2DSPzmOKOrcs+37fYIjzKvV7/rJ1O93Dn2A3vBbLw4k8LmzPl//39?=
 =?us-ascii?Q?B+ggv9xcTFtePafpaLIHe6t8m6oWz6gXXL/itJnEFgZJx/cxx+z7kUQlB1At?=
 =?us-ascii?Q?NwmGmfgs3GWnZXbuaU2stdfaiy9dA3JI9MRyO6ezfQIGZX66tD79ZG6rcACR?=
 =?us-ascii?Q?e6tDFPMMzdp0+xxowRxZDrt/9icskFflcbcX8BwmwL/ReVrbCSJo2vhM67jW?=
 =?us-ascii?Q?n4mdaMYJ4S1w0XXrAqdayAIsjlO0gpnnDJ+Wt+qZ9l7gqB2nDvNFKWnYZlZO?=
 =?us-ascii?Q?88HGWHfQd0ESrOOOdEvlmU0kOfar0jxPwW+6ABDH+vEA+4NQduwFRnGNaY34?=
 =?us-ascii?Q?U1MmXOeb43Z/WgB2zsnEznMpF+7mgSYjSl8rFc5M7zmB43yUn6gglFXGM6cA?=
 =?us-ascii?Q?uI3RhazMHR4jMGHO0KFwJJdbyT/dNBa6Z0GJkX9oF2PxS2BvWys9e7K3n0Rp?=
 =?us-ascii?Q?ZajaCkaMp7CQGjZWLFMkw07FjJT+Bgmh6/jw0DywpqjexpCQM9b1Z8p8Lzfb?=
 =?us-ascii?Q?9N7+IcRrnv4QhMr3fx6knTLNAlhRxkGyuDd8wwuPDxTqwmDFbLughUA382QU?=
 =?us-ascii?Q?DWGX7/zPtY6fjvPOsL40JQJy55blMVCuhnYjAyGzQ9P+0dFa0mG9eJbpCoPi?=
 =?us-ascii?Q?ux+axnVi5uPBv2vXr9b2K50SL/0l+n/y2vIr1RYUOfMdS/afxae/HIrtvGL0?=
 =?us-ascii?Q?pveYt+xQJwqulB+lRrgVM7xpdx8liJGcACh0o+ykI1BPaDHfllWAWfbqZI7p?=
 =?us-ascii?Q?+xa81ESpxT/PW9VLK/SZWIhozd4oDqZOfB+GR+YYzbqXB0wRQSbrE3dpO7Kw?=
 =?us-ascii?Q?OWgbsp9KTUaAVunnuybk6zBcw8jv4pegrIqAnwdP6A2MJZiBSRTiG7uuBihS?=
 =?us-ascii?Q?XhC7hnR9cMgXWy4E0wkvVdrZhShUI7BnBZ1N0m6x0K/GJ+L4CH/ytNzR9Klh?=
 =?us-ascii?Q?34CM5JRzO1eD1OA/hGqvJqjl9FN46b+XussCd/93RHP5K1Z4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c5a6c5-cecd-4ad6-e838-08df4b0b931a
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 15:48:39.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vN0mlKOY0wVq+fj/Pw9RVWq+dU6o4HJLMc28T6rovaJrDjmV70bbAXiN0GJMuCtCtGIsjXzvgGMUZ/M3cKUmCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB756173

On Sun, Nov 22, 2026 at 07:35:21AM +0530, Rama devi Veggalam wrote:
> Add a driver for XilSEM (Xilinx Soft Error Mitigation) on Versal and
> Versal NET devices. XilSEM runs as part of the Platform Loader and
> Manager (PLM) on the PMC and monitors Configuration RAM (CRAM) and the
> NoC Programming Interface (NPI) for correctable and uncorrectable
> errors. The driver reports these errors to the EDAC core and provides
> sysfs attributes to control scans, inject CRAM errors and read status.
> It is a separate driver, matched through a single "xlnx,xilsem"
> compatible, because XilSEM is common to Versal and Versal NET. Only
> monolithic devices are supported.
> 
> Note on CE reporting after a bitstream reload:
> The PLM clears the XilSEM RTCA, including the CE count, when a new
> bitstream is loaded. The driver reads the CE count to find the CEs that
> are new since its last report, and takes a count below the saved one as
> a reload. A reload is not detected if the count has already reached or
> passed the saved value when the callback runs, so the CEs up to the
> saved value are not reported, and the EDAC CE count is too low by that
> number. No CE is reported that did not happen. The RTCA does not
> indicate that a reload happened. A complete fix needs a reload counter
> in the RTCA, added in the XilSEM and PLM source, which the driver can
> compare. This driver is not changed for it.
> 
> Note on xlnx_unregister_event():
> xsem_edac_remove() unregisters the event and then frees its state, which
> is the normal sequence for an event manager client. It is only safe if
> xlnx_unregister_event() does not return while a callback is still
> running on another CPU, and the event manager does not guarantee that
> today: it walks its callback list from the SGI handler without RCU or a
> lock. The missing wait belongs in the event manager, where one fix
> covers every client, so this driver is not changed. A fix in the event
> manager is planned. Until it lands, unbinding the driver while error
> events are being raised is not safe. The probe path is not affected,
> because the event is registered as the last step of probe.
> 
> This series contains:
> - A new devicetree binding for the "xlnx,xilsem" compatible.
> - The firmware (EEMI) interface and the XilSEM error event node IDs
>   and masks.
> - The EDAC driver, with its sysfs ABI documentation in the same patch.
> 
> Changes in v5:
> - Moved the XilSEM binding out of the Versal DDRMC EDAC yaml into its
>   own xilsem yaml, with a single "xlnx,xilsem" compatible.
> - Moved the driver out of versal_edac.c into a separate xilsem_edac
>   driver.
> - Limited support to monolithic devices and documented it in the binding
>   and ABI.
> - Added the xlnx_unregister_event() and CE reload notes above.
> - Added the L: linux-edac entry to MAINTAINERS.
> 
> Rama devi Veggalam (3):
>   dt-bindings: edac: Add Xilinx XilSEM
>   firmware: xilinx: Add XilSEM firmware interface
>   edac: Add Xilinx XilSEM error monitoring driver
> 

Hi Rama,

Did you look into the "platform driver" idea?

If so, how did it compare to this DT solution?

Thanks,
Yazen
