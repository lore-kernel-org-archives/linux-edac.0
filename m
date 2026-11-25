Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795639089;
	b=pK2v4gqKjlS9JwX90KuXrPYRIrY3rPenGq2wFeMVHwpIB/HkxLGR1GAEiN/ghB+8baAU
	 qTxf8cvDMdNbHuQmKUEdQFcoJ/tozS56hyaIgzrMXFhw7KodtsU9oFDX7ln/DnVMC3ivy
	 M0pnvMDJunNXVVXRwVkV1HBpt8GocopNhJOiGEnr0V7vdMsA26vMlgitbujs8ZQeqy7IN
	 Mxm9eikW62/mPcWWgrOxqbYLBaQMNQy9oj4UgMEPv+NOBuJoQh7cG9SGaDGqRtdDwxkR0
	 wV5R/Dw/ysEVoqwjUGCWpeaH7RtMusKpXGrsaFVWLx3i9Xk7qMPXPhNH6us7MCyDkPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639089;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OXM0xmF053JBIe+pKIijdOHViHc7F9gCcF4a6xyeHP4=;
	b=iHiPrFWFlgIl5bmfvPA/qn8+e0IWxFamhySP3kRA4HweWjHwSeC6R+yIP9tQQDst48A3
	 Hb0ETzvaN9ufBhXzNvtnAGog9SRhOmuRwuulSCn//zgy4aLuZn+dbexXCdQtiauWp8tkh
	 0lXsxZACErp7sFaB4sr8UBvGRlcs9GSTeTPf02pc7ldLB6hYk0mWZ6lzPK5DnnHGtUuwl
	 wrdKGlsLSufZKaH0VqsXTu3pk+LvIpkS25T56strD7i3WXuRCpNEJUlDmqxAA7kvCeSx2
	 KDHtUEMQ1F+DFbDN7rZPp4or+9q31jtB9ohTSyoOPqq+PG7M267GkBfra3d1iWLIVeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hObNGfBj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.51
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01836606A31E;
	Wed, 25 Nov 2026 20:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01836606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hObNGfBj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gn0O8sw+HMwKFnpEh9WyCBElYr+F1j28SRNTXzblBUbOCl424kiln1Vpm9FX3TUWfF8jZt2yihrukCnMBUt1yBfm1zVIwsaxETIW4mpNZB2wH86e/mfqzBzgY0BzQzNmZPJ9xmuKme8tenVY+bcxPlrg3m03Et3NUR8/zFcSZlsN7xTREUkYyWJUx4st94zNmZ8IJ4G86U0fdfs4UEyP30FPAreDo2qDfHTMswhi0LNtZkwPBc5/w/Cg0QVFQm7ldIQ1aiLleQzV7P+xwFIBn78IfhvC6WRZ7sdG8gxORDuUyDQyud4MOy340Lp+o6xVfH97yzZxNcWOmnGAkfATog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXM0xmF053JBIe+pKIijdOHViHc7F9gCcF4a6xyeHP4=;
 b=SZOmedHp4HSQCFlvaHc72Dk0aC3pSofk58LR5EoB8WDmbU2CU2eHVPEscoaHePdRB4DuXh0dMrilaD/+j6dYgYt1UFmT2ZEZCC1KYuXyw/AzsL+fVla6rrXaXG9Ha2RZ+/DlVaVpkeV0shgBLC6kzZ245cRkW0DdNC8DOtQoD1aKlhFBmyqGdKT0gNrXiHoZcJYf0JbLFngYuTC0qQY/V1u9FFGO3lVkW/dKb2SNy48ZQu6IISn5HIGpxkUmvPvZuuawrH4RK08Ayp+rkPA9n8ld3no6SepNwTJL9a92u+2WgiBDGVfRTDyFGX+XnW9zUzCOaW1ZikE/tT0S0oKKXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXM0xmF053JBIe+pKIijdOHViHc7F9gCcF4a6xyeHP4=;
 b=hObNGfBjjSGsenwSvZsSxDbwmDewCHnEayxX1fki9SA8j2xSeBWkMq61s5q5v6lFVbtP5V/y+BL6q58yrlUNZD0sStZFkwNxm0W+ioWbtJu2M7MbT/CCHsiHjXUmqlY44AjrvmL1U6aQ/HgAD06o+OUS222Xc8qWIFiBNhsshfA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 (2603:10b6:303:2fd::15) by BL1PR12MB5708.namprd12.prod.outlook.com
 (2603:10b6:208:387::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Wed, 25 Nov
 2026 20:38:02 +0000
Received: from EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167]) by EAYPR12MB923140.namprd12.prod.outlook.com
 ([fe80::b986:8b81:beda:c167%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 20:38:02 +0000
Date: Wed, 25 Nov 2026 15:37:53 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: bp@alien8.de, tony.luck@intel.com, rounakdas2025@gmail.com,
	niravkumar.l.rabara@altera.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv4 1/4] EDAC/altera: use flag to differentiate 64-bit
 platforms
Message-ID: <20261125203753.GP2156781@yaz-khff2.amd.com>
References: <20261116202854.3087673-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116202854.3087673-1-dinguyen@kernel.org>
X-ClientProxiedBy: BN9PR03CA0884.namprd03.prod.outlook.com
 (2603:10b6:408:13c::19) To EAYPR12MB923140.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: EAYPR12MB923140:EE_|BL1PR12MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: fe099c62-d1a5-407a-d564-08df4b34004e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|261022105027099003|56012099006|261009223027099003|261028144727099003|261021121427099003|261021135927099003|261026140227099003|5023799004|261102123227099003|261021123027099003|261022075727099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	8YgAaTlLUeYG9s8l8lbjuv/sMp41gWAYSjyIo4RjEIs/ZoQ5K4R9KMZOipf5HxW7YO+vaCUe4vJyrtFQnzZdiwIP+y6FrQTxtAXgvbyWqa0dCWWAsc9hcrwRv1QFBUjS55YBaZ0N20a9iSYt4XXoEEWTI/Gx5PnEWzSI2hnktrlySV9kjdud9tkOLhzkAcm5+U+glLu8tok3aymkLR6zX+GJQSBKnIgLVsuNThmuUpwkE0viGknCK9hdFx6A0GkXk/m8ILBYoPpIm/4of1os9Wkvu7wRRXcEbKu9NQAfiPSVf2WBUySePgaZLJavGfFivsEt/G15TpME8780HqrCkdunLQGYO4WG8upjKIX/pjixUfE3OzZi+quha6qlpb2L0zgAp6jZDXdC/lK+66+yWRvOSniUIRvFTrtgms3k0jfGRt/+ww6Bed7XleEgsFynyMHeYv6CA3O8NiaHH446DApvzov6LsEa9aupYNcLwD6gAgAJZExr+KGv1W9D1YuHcz8Wv0paTuQ8i9kiNCDnyWAcfgqn//yLOSTNAF68GwqLyLZT3tLQGQWUKttb/mf7aWTq4/3SDII3VOXt4QYufc+3Xshcc3t2osqRqBatRLF9LP3hNigV0eWbYX0v7pd3HTv49vW1IAadzuFV0olWrUvcLoaP6YdBMn4NQNW7xME=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:EAYPR12MB923140.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(261022105027099003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021135927099003)(261026140227099003)(5023799004)(261102123227099003)(261021123027099003)(261022075727099003)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dpozUOP+3AQnMP15gRObUONtsYtWO93DBF3kkV02gzzzCZXf08rrmAoDshrJ?=
 =?us-ascii?Q?A31o86Gv3SxbQ8tBdCl7VaZ9Gtfb7yWvzLlghBtzXX8xjp0+pYggWik/KTSo?=
 =?us-ascii?Q?RF8a2l+b9I7m1vX2rJ3YCDsfTRxizvch9RawPca91L8VFK47uWOmzgaZsgcP?=
 =?us-ascii?Q?tg2inwvAyrJJweEvpY6zDCSOigIUDEsBwFPJqtimG2LFYQ10Ftul8eh+eL3N?=
 =?us-ascii?Q?aDnVRn31bLv5fhW9MZ69I4iGnsTHeJjNKmAxF1kzFHe7Peddjv5V6gv/MxwV?=
 =?us-ascii?Q?f5v4E/bFmtNSM0pNlXLVtCh2oaf3BEM/2CosfdFt0/j02UafapyO8wVse3Mw?=
 =?us-ascii?Q?UOcU4ykbpvhazhkEsNbQHZX6p+wrafNXV+/eBmb89Ge5pqw5apsungBCqFWK?=
 =?us-ascii?Q?Az/n6yh/369jbmq7z2mreruXkDxqxyW8umPkCRtWGQ0CpzcpWyoVZG/wmpOj?=
 =?us-ascii?Q?S8/m96dxJK2FQfzw5d5rxLhYuHVV1NRsHG5pJ9dFBjBpK5OCHczyKjgk8rvR?=
 =?us-ascii?Q?Glgjhs3cuazDGkkU4WIviG1EGUBCsR46KF51oQInzIeJBepxMQTVLnFPoY7O?=
 =?us-ascii?Q?GJP0qSl1HJy8UK65drMykIOB+v6l6+qSoWFCb/UFidRwRRHTvmbAIkG1Au7e?=
 =?us-ascii?Q?8Sf8mJhYswz5z4Tb0vxmpnCUz75npoAkfa5lYslmY+hVuNoZgysowz8aN3Va?=
 =?us-ascii?Q?FsmXfvTjX1gdfIRtumvGRvHLdrzFqjrQTGFR0SoHJ205OTAjZ6Uj7qvvPRzC?=
 =?us-ascii?Q?NkVb8Hr9NAjOTZ/Jw+StIAOuWbG6Fqk5EmYIKbPbl6fjbNSYkUvS7v7sOVCa?=
 =?us-ascii?Q?LoGCP3083XWa3vVtJZEEaf9sALu74z3RYbyxkqhaKqa7xGI5yzw/kWX4xx+z?=
 =?us-ascii?Q?PxXRg1wlBCD+QgLY9SpB8EeEY/yCaDk01h9oi+OSYRyqwususFGr2HZeZavZ?=
 =?us-ascii?Q?GXC8JsocTfJydPbww5T848CXpPZpTBIVZLLf83lNs4xjIpJhzq/ckUpqqbLq?=
 =?us-ascii?Q?uDm09h4c9HbHwLbQILlvavsXXXw4kJZZqIBJPS9RdKr2jDZyg4FmhyCQk2AJ?=
 =?us-ascii?Q?AAaB1709EdcNwU3SomvNnV/vHEFgUXcTukyQBqGjVW7wFtD7V7jx2NMTxbWt?=
 =?us-ascii?Q?w9i+j/cvX4jQztmEKN20PZbNV3ZNKSKOwENfxuJCrqcqQ7kQWznhXgP0g3Lf?=
 =?us-ascii?Q?moc9N6Raxr6EWEsrAx0oQFzcwNSpxT2QbLVEKgiJdcJ2OrRjCed5+Vcvj03F?=
 =?us-ascii?Q?xaQR9p3Ws84DTgaQk6Jw2VlDG4wqfol/3zIbg/fz3qFJEq24MIkVSPXooUst?=
 =?us-ascii?Q?wErHWPs5ACcLGCo9beoljmmMliFrpPumdKXRbwOg49b8k5Grlg+6QOMlVf7Q?=
 =?us-ascii?Q?39usR2ZL23DCr6JqFK5UFd/Ev4MVqSXGpRDipxYXFgBtNfcDakdSYPzNJynL?=
 =?us-ascii?Q?KDNi0WmPHsN+GlvWUwHdojaDh7Idh+z51rztp2gQAUm94z9GA6uNp528H0pZ?=
 =?us-ascii?Q?OJVxUu9Hhu1LWQzH7pnjRe2GZMENTlBIbEbCQTbJQySkoncYzW1BP9od8Mof?=
 =?us-ascii?Q?jRmYZAWv4sM0+gMdr5r2aQdzxIXdLQ78KAkF6hRgGy68gBNZ1NcZ5MxGMK1l?=
 =?us-ascii?Q?Y5I+8wwKfqwTBLwOGWoHXYzQUFwqbtdlIGHAgf5Oe10mEocTsx9Q4LNI7cPm?=
 =?us-ascii?Q?sNM7DdaQ1eU76Gjz0OocqfPaywzmg8b176VaApvdr00rwMIf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe099c62-d1a5-407a-d564-08df4b34004e
X-MS-Exchange-CrossTenant-AuthSource: EAYPR12MB923140.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 20:38:02.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrrXDi5F9mXW8Sil2xqjbKjuXWQCZM1V3JB/6bekiG691OPgeg4LQeIQ2KFCOhlhlwdyEoz9D2uBS465I6CW4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5708

On Mon, Nov 16, 2026 at 02:28:51PM -0600, Dinh Nguyen wrote:
> In commit (d4486fc3098e "EDAC/altera: Use ECC manager compatible to select
> A10/S10 IRQ layout"), it added a way to only differentiate Stratix10 from
> a 32-bit platform. In preparation to add support for Agilex5, it needs a
> way to make a further differentiation.
> 
> Make use of the driver match data to hold a flag for different platforms,
> specifically Stratix10 and Agilex5.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: no changes
> v3: no changes
> v2: use enum for altr_platform_idx
>     use SOCFPGA_A10 for A10 platforms

The first revision had a cover letter but the follow ups don't. Is this
intentional?

> ---
>  drivers/edac/altera_edac.c | 20 +++++++++++---------
>  drivers/edac/altera_edac.h |  8 +++++++-
>  2 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> index bb95dab847b3c..78f4a1b0fc64a 100644
> --- a/drivers/edac/altera_edac.c
> +++ b/drivers/edac/altera_edac.c
> @@ -1489,7 +1489,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>  	int edac_idx, rc;
>  	struct device_node *np;
>  	const struct edac_device_prv_data *prv = &a10_sdmmceccb_data;
> -	bool is_s10 = device->edac->is_s10;
> +	unsigned long flag = (unsigned long)device->edac->flag;

Why is the cast needed? 'device->edac->flag' is already unsigned long.

>  
>  	rc = altr_check_ecc_deps(device);
>  	if (rc)
> @@ -1538,7 +1538,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>  	 */
>  
>  	/* Using compatibles to determine the IRQ Index */
> -	if (is_s10)
> +	if (flag == SOCFPGA_S10)
>  		altdev->sb_irq = irq_of_parse_and_map(np, 1);
>  	else
>  		altdev->sb_irq = irq_of_parse_and_map(np, 2);
> @@ -1556,7 +1556,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
>  		goto err_release_group_1;
>  	}
>  
> -	if (is_s10) {
> +	if (flag == SOCFPGA_S10) {
>  		/* Use IRQ to determine SError origin instead of assigning IRQ */
>  		rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
>  		if (rc) {
> @@ -1967,7 +1967,7 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
>  		goto err_release_group1;
>  	}
>  
> -	if (edac->is_s10) {
> +	if (edac->flag == SOCFPGA_S10) {
>  		/* Use IRQ to determine SError origin instead of assigning IRQ */
>  		rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
>  		if (rc) {
> @@ -2121,7 +2121,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, edac);
>  	INIT_LIST_HEAD(&edac->a10_ecc_devices);
>  
> -	edac->is_s10 = !!device_get_match_data(&pdev->dev);
> +	edac->flag = (unsigned long)device_get_match_data(&pdev->dev);
>  
>  	edac->ecc_mgr_map =
>  		altr_sysmgr_regmap_lookup_by_phandle(pdev->dev.of_node,
> @@ -2154,8 +2154,8 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>  	irq_set_chained_handler_and_data(edac->sb_irq,
>  					 altr_edac_a10_irq_handler,
>  					 edac);
> -	if (edac->is_s10)
> -	{
> +
> +	if (edac->flag == SOCFPGA_S10) {
>  		int dberror, err_addr;
>  
>  		edac->panic_notifier.notifier_call = s10_edac_dberr_handler;
> @@ -2205,8 +2205,10 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id altr_edac_a10_of_match[] = {
> -	{ .compatible = "altr,socfpga-a10-ecc-manager" },
> -	{ .compatible = "altr,socfpga-s10-ecc-manager", .data = (void *)1 },
> +	{ .compatible = "altr,socfpga-a10-ecc-manager",
> +	  .data = (void *)SOCFPGA_A10 },
> +	{ .compatible = "altr,socfpga-s10-ecc-manager",
> +	  .data = (void *)SOCFPGA_S10 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, altr_edac_a10_of_match);
> diff --git a/drivers/edac/altera_edac.h b/drivers/edac/altera_edac.h
> index 9387056fd65e3..4a9da28fa96ba 100644
> --- a/drivers/edac/altera_edac.h
> +++ b/drivers/edac/altera_edac.h
> @@ -351,6 +351,12 @@ struct altr_sdram_mc_data {
>  #define ECC_READ_EOVR                     0x2
>  #define ECC_READ_EDOVR                    0x3
>  
> +enum altr_platform_idx {
> +	SOCFPGA_A10,
> +	SOCFPGA_S10,
> +	SOCFPGA_AGILEX5

AGILEX5 isn't used yet, so it could be added in the patch that first
uses it.

Also, consider having a comma (,) for the last entry, so that new
entries can be added without changing multiple lines.

> +};
> +
>  struct altr_edac_device_dev;
>  
>  struct edac_device_prv_data {
> @@ -394,7 +400,7 @@ struct altr_arria10_edac {
>  	struct irq_chip		irq_chip;
>  	struct list_head	a10_ecc_devices;
>  	struct notifier_block	panic_notifier;
> -	bool is_s10;
> +	unsigned long		flag;

So it looks like this 'flag' is used to store the 'enum
altr_platform_idx' values, correct?

It does not contain flags.

Consider using a more explicit name and defining the field with the enum
type. Something like 'enum altr_platform_idx platform'.

Also, '_idx' reads as 'index', but these aren't used that way. So you
could remove '_idx' from the enum definition above.

Thanks,
Yazen
