Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA3C29BDB4;
	Thu, 19 Mar 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932651; cv=fail; b=tyHRBJRa6pmTivnTFac5fH7bWOTD7DVQiYFgKX/MyEsv8BtLTGd9zgXlEUJjyStj5sKj1SNRLQdPFoWkJiPcLZ/4cr1FSTFiR6e5W6JMF0//La3r70bAHcvoS4t0OJnql1CarFMy5096hEpDtJkEvAnyGUf34HhQQswYbp0lt0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932651; c=relaxed/simple;
	bh=nPBFOflIvo8dzQkyAIGtQodReD+wohW7aOOfuN9jTD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i2zSAgzjxdRXkA5siCPHkHuRCl6ozKkJm8ZOqJPohx93l6T9l7OFNJkOCf6ECr7ImauuYzAph4CX1ViSU9CLv5ldihUbiyWRllmTCNAamcxu868F5DKclHrqhL3FsyOBgpAJvDy8wJa9WKvPs+dZbSmgv+qpwIHV9bLaFNt8YKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1e4TDpm1; arc=fail smtp.client-ip=52.101.61.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1e4TDpm1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFXLla6Gnn2iVJAfmX6ccPxqq+bsJMhkbhv8DEB6c/DIk6K4uAfm46/1b1uiC6y/QtedNkT+ZPVFEtOX0lok6KXAUuGKJih+ChEaG9kVf1AWnYm2YPO+Yw3MV5swZw8pYnJPFI4TW7fQexYlNiHD3VAqZlM8euxwSO7IqYZ+Nz/t4V+BnBF2byvn41uXWW1GdeTm6RQ6Z86lQI5A8bXQoO8mX3M0S9vXsPg8SDPZvuI4OXT/Dhhtm/6Nd4IcPaDJ0ha/VVCtxMs5aS7qLkA+4QNP7FxKXBSAP327Faq1QS3vYz5Jkt2KIq7WPz8QG3RmiWUTK2w4znkwdX2eAOuavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqh7Ip+0h059FsamDpiwIRRN90wlxgJbcsFNS65L47k=;
 b=V3rQlvkkeA2mhh2kfp5DbEihD6HbgM/hiNwO6hFcxpu9sX359Od4feZcIZs2ju8E4xUhtUdWKaTWaNRsQMoDF8WoPEzKwwCA1zf1YPhi1XzfMrP9sSRKsisx37QONuqaxQBaGg560TsC8+1tEU+BsEIBpqBTbjvKMaTbOGSh3IFYMJXuihEoWQjrW23iK7XxZWcALUsZ+Z3dlVEBNDlsR+ep1n6LwYuvaft4FsRKGv7tJO/IwiByTt+p1QbTzXNr5/WegVPAbCIGpqjGGO4SrNJ8gIddLDP82k3nJYRAtSyQFsIc3u47kaRuNQfVOujXCq5FU2pguOrzgZHpjAW2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nqh7Ip+0h059FsamDpiwIRRN90wlxgJbcsFNS65L47k=;
 b=1e4TDpm1HLaXdh+SbQgd/xdJ4WvIyk8blww964dXXW0aIUCJCz5KH127OgVbAY4/oLtqXxKzN4ck4Pfag9S3fah0ALlzpdR4Oj/mFC5YqqgtUCV4oiHJrY4X/+JvtUw3unVjaCbUuM63luHJF5qUZc3WssyiWhPjmsdT9tXIg6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) by
 DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Thu, 19 Mar 2026 15:04:06 +0000
Received: from DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf]) by DM4PR12MB6373.namprd12.prod.outlook.com
 ([fe80::7da:cc3:cf2e:8ebf%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 15:04:05 +0000
Date: Thu, 19 Mar 2026 11:03:58 -0400
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: Devang Vyas <devangnayanbhai.vyas@amd.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ramesh Garidapuri <ramesh.garidapuri@amd.com>
Subject: Re: [PATCH v4] EDAC/amd64: Add support for family 19h, models 40h-4fh
Message-ID: <20260319150358.GA1666212@yaz-khff2.amd.com>
References: <20260317183453.3556588-1-devangnayanbhai.vyas@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317183453.3556588-1-devangnayanbhai.vyas@amd.com>
X-ClientProxiedBy: CH0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:610:cd::19) To DM4PR12MB6373.namprd12.prod.outlook.com
 (2603:10b6:8:a4::7)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6373:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2ef59f-3673-47bc-c12b-08de85c8c3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0LEW8RfUX0UypHIg5iKXNjULIia3kqN6SMFd8qYhlKioshfSeo+fC6r3h2C4fZmpbNxv2ljk59yYtdFkADNoi/m958B4BhPG5mTB+YktH4Um9lDyz4M0dVGKXgPFU68Um5jQO46csCcX6x82vXBiXpWvdTnUoY0zj5dOpm3xOY+MDs6AAUQFgQ5UZJ5RaQWlRSf50Q8YR3zYc0KWnDeaqUIso9uV4i87oGpEfE4iueAPwAR1EeYirpgDsf1qJa4LTdJBTx5p/TrPXtoZWm/SW4+9XSDtdgFqqirYrfDizC/nLujDa16ajEHrmXIGAi3O4a+/x3F9KfXkxJdDu0xJaWNxT6CPhPyF5T6VQO4IDA1cyAauNfkgJ8rC0D9DAEMYYdt7TRswV22rofb3vIplP1kAR950CrTeqk3+u0SMv5H56KgHfz5znFH5TEZ1VbHyau0JpnVRgT97KF9HpWCZPXJ4vM8Lqbtavu0lIXAYpSR4fkk4WYQzuvokVaEbEnUPh3+Ct5olGxZn2tMRKk5ttgCGBi/DBrrcz7u1LJtxIwgDGDlt/Cz4itzZzgmSGSAhI7wA3JSnAPOrznINaIS1Ve5WhaKbDrryB2/Nm7zQXwD8pDdDb+WqxxnNewJj1XaF0Ygbc+F4GFTq8NlMvt5KRgt6LUsE69Olw8z+GzFtv8R3AnYWlqD6htuG0zIBObTltWUEeBam7+VGEk16rXlS9V+QzK6cyl7ShEWSJCBZErA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6373.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c/h9JDtdTPG8AHfVhF8ngPR+ZDCau2y0PLTgDh6+3CuXHO3nvAX4qWwan1a7?=
 =?us-ascii?Q?QGIQm2viRJ5LLiKrj3bc7Y+diemEoc4Fh1KxL4Y+mp9wXopHUeiy3alJMKK6?=
 =?us-ascii?Q?57+HPpYzTTN0kNm0uGGUntJMjYuBhCAcA7dF8KWprWANnVpoRZ788vGIRkOh?=
 =?us-ascii?Q?9Bonj5GD3sBD9LEoxAozpyr//EntWHOnLmTlE1TFP1dp63Pvy2v6dSOrNNcB?=
 =?us-ascii?Q?qSxLaM2Rmw/oQRe2p8nHoI7BH5nQFWREnk1TXF/sh5+j8IhuGE7a1q03PrJi?=
 =?us-ascii?Q?Mg0pvAvFbJrx3bU4GGdWBOW2ySadwUXizMhwXkzK6T61bOim11TKqIXzQlcv?=
 =?us-ascii?Q?CF0YIJ/L4PhsW2e4vN0GqU/bH8unJhfNCB1S1ndUwKi9JTXJdEXTVwWJhhUV?=
 =?us-ascii?Q?4sncCxDymCg4HBkiRVOKRuK2Gf17RE7P9zRBD51wzFOhqVEbHqbZOfzVrHex?=
 =?us-ascii?Q?83H97KO1t2/8lZg5lTkKgEBUBcoPrbGmY66qUga4tzpGZFfwxqZxznezutEu?=
 =?us-ascii?Q?CXBtrbwDCSgyj6Yjyrgg8G4TCCWkJE1eZH27dQ/kVpj98vcf9sbvkU5CwZtX?=
 =?us-ascii?Q?agVgUoZBRXuTcEUG4G/0uxNEZ20gyKP8n+alK0Jh14RsEA2DcyJ4RVxmkfVO?=
 =?us-ascii?Q?kyZEXIY6J4rdP0t8GX+Vq4dzGrYvtvWA7HnFjxVHeQwJIBJclyoUoCJlwz0J?=
 =?us-ascii?Q?f9i4Bs3WGFEaQdJRb/c0AK8JgviOtxylPoLOwbQ7miNGidrWAsCkCC7pIsnc?=
 =?us-ascii?Q?9fXxXVHrXpUmN7ZXPJ/vFV3uLAEVmUq+ya8jtj68Kc0Bi58OlV4zuDCjT2CM?=
 =?us-ascii?Q?ysm2dwIFNmjZ8Uo+qbkrWyRf08YajFdXQftAlgNcAlWaOQD7WEvGJUmqfsbo?=
 =?us-ascii?Q?6gXfY5H+lsoGJq0H+eG2XZ2rQqYuc8HP7/desuW2JA2fT8nLyF3xExgQhyPq?=
 =?us-ascii?Q?MApN0dA5vM4OAXjkr68BVexnhYziK293uYVxmT/+O3WreBaKWhGuhOOzrIdE?=
 =?us-ascii?Q?d2OUvVor3AN+P+mMAVksUTdHAMAWGyPho279OObLcn1EfVt/QaJiXUM+4/1m?=
 =?us-ascii?Q?NLH+TKr2hBhjS6l7DMfRqYH29noOAwkorr9TPIih1uHbYuO0J5qyLYyoZ8kz?=
 =?us-ascii?Q?3JvhbPQSzkHOPrNKUJzv1XivwK88qrfKgdLkq7DBu/Y95rMZ7iwdJfnqTASt?=
 =?us-ascii?Q?/RUC+4Bj0XxbElGmMjQrgHj/qftIJc55/XmBgPsWgV4VoSOCAZ522tB/SlaU?=
 =?us-ascii?Q?5HLulglbubuprWv/ePW0UKD0dWdxnOqYVkIW6TLsN5kU8Q/wZ4vKINpj5u1v?=
 =?us-ascii?Q?8wxWvTnUSb70+kz34/8a0no4kYFye5L5+E5N+A7TGdiWSHlP7W+YpNzp/81s?=
 =?us-ascii?Q?3VyXnYGwQflv0dEbgRoqLlrP/hrDRoYaBxRSTvDn4Jf6B/KvgpEI65yD+PLG?=
 =?us-ascii?Q?1czhgCm6DPzL+OhtwqzTYlW6/XQCUyvwpnWRPfnAeKFzlDKTsecOMQUitgt3?=
 =?us-ascii?Q?rF/1ZehO23/ggti5oaTCyRQjThzbb4IKO6S7w9+6q29Rp58nbgUPbDJEkWkO?=
 =?us-ascii?Q?YrYgaRoachJWsBqwixbLkoHYIgGoDTxTkWG1AR7rbLrSn9Z2KhaQWSby9wKk?=
 =?us-ascii?Q?JV8fUBVXGjXl1YU2esu7yKjjSxfVGI+ni74yzxtrS3VbFgcKNvZyihg7uk52?=
 =?us-ascii?Q?4DsD4a/JKVvaUkoAVyunyAFLjvMxanny6LzuVSkzUh6G8ZX2EN+9j4PNiXgX?=
 =?us-ascii?Q?nkL3Xvrl5Q=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2ef59f-3673-47bc-c12b-08de85c8c3a8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6373.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 15:04:05.8843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXwWctXo9zC6+uJZCFLUWGLt9KWBJeWfp7kR3IX/IBJtWsvF5i7b7F09hNT51RTTal9qj1SENikbrprLlqd5FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286

On Wed, Mar 18, 2026 at 12:04:53AM +0530, Devang Vyas wrote:
> Add support for Ryzen 6000 Zen3-based CPUs in the V3000
> AMD Embedded SoC platform which uses ECC memory and would
> need RAS handling of hardware errors.
> 
> Co-developed-by: Ramesh Garidapuri <ramesh.garidapuri@amd.com>
> Signed-off-by: Ramesh Garidapuri <ramesh.garidapuri@amd.com>
> Signed-off-by: Devang Vyas <devangnayanbhai.vyas@amd.com>
> ---

Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>

Thanks,
Yazen
