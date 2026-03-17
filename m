Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C489D32936C;
	Tue, 17 Mar 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743937; cv=fail; b=lxjDWH1UcOzYfvE1YeBEt0b701P5uuKOS8bw238krvYDeu1NfgBwNzslHYYyOPU0r9dcDsMYfpH0lHoY00JbPgt6kUHv4oJHI1HmsRetnZhpGUqQN2Drtn0HrO74OO4mSIvNAwieGsM1LkpKakmoRPsCTgkvyhNmd+KJ8edb6Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743937; c=relaxed/simple;
	bh=WS92W5oCVqQ1CQyneRF6CRROl+ueg0NllDsIFIRnYsY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Q6PYn252QZCqdQYL57X/TAwXNMvE6FvgKFHmvnUQqoc3R7TZoV1m5bgrRLQQdzLD6ndWGXEsQYR0XxNkRaI6ZaY7pvpQ1TI9W72p/J1DubcggBnFQSY6TOEB2vMvevaLzTOgeuPVvczEmp272iYy/ClHzHdyDyWlSCf0BCJ8280=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mmi1D1m8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rBZs/2FB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mmi1D1m8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rBZs/2FB"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GNQrGN1788343;
	Tue, 17 Mar 2026 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=cM5KiAx+l4mjdraf
	YdkdjuzZ5jj/NFf7nj5VsPPRLAk=; b=mmi1D1m8NBV+WBvKNbd6WcNQvCLNTHDT
	t/JnzZ9CIXzlJFWSwX5QXf/2/2xP4XmRiVBqkNb5e+vwmLQmGoT52aUmb15CWDWm
	JqX48mHnwsKoP0CHrMlwemGSrv18UX63icjW7ZLwNpJI3Mc/biYyzeUB6ZiJUNcJ
	Efrnu4pFDPJvFuak2UzXaU8XmVmYLBNHyQf45TABGEX/sH7EJImDj3x5bCNGsSMI
	3WZsx7GH0pV8Pnw5TFATPLpOkAfgZV/MyfseVwlyzfSrPbXTA3zscmDXax2Ubyk/
	ReT8nZXiTzH5TTrV4TUSCecYowHx5q4dd9OvUXwHi15i9dEfKj80pg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxf43unn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 10:38:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62H9JEei021886;
	Tue, 17 Mar 2026 10:38:40 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011000.outbound.protection.outlook.com [52.101.62.0])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4n5uj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 10:38:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlVT/9AgF7heAZ2LiQa+eELKzC77lbTcuYmx6UOX8Q/5kFy0KzHn0iIpyjQ9+SW3WoeVUTMyau/YqwFZe9097cZvd8PA7kxfxGM+zLlLc1N/R+v2UtrdnHkfqOD93fjj3rfCccre7aG09QNcsKnRn+Zyq07lm4Bi85GUZUgOFiFcnEYLuWygJ8ZvWOBrpOcW8/GS4XAQl2oYDa8yaPGNHFFBCwh3bdLjgYbQvIuC61VEMQPRDEOJ1txDRdgIzEWAH67/UXSZs/kyTHZTDDXI574fvBrcFKBo7Vma/X8+8xfx6U0n8kORK7xEV22RjCf9ZQeTj5zD0pF4QOzfEf++SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cM5KiAx+l4mjdrafYdkdjuzZ5jj/NFf7nj5VsPPRLAk=;
 b=b7RdaXrvzz1SVLXZqAYM1mTDZNHi3ADZ6BJHU4Muy3S3DhyO4Sfr7bvU6b/BT7ierzhAqQsx0OdRXfKsDvNTIJuI2bK2+AokBCJ5wOzbJlWNuQVsxt8bEjBXGORchUlQ3mPlL+3eyDms+bb/9N9XRdRJRvD5K1pzCnNrHxkd/ybTzVdl2kSO/TUWpqjh/fM6WgyjdUUfO77dX0xTcb33mOew78obe4vEbu7FIRHX8bQnpW4jpQHZZKQ4VQMItEnlQe7ZnBT34HDS7WNlYFK2eeMyro4yi9ygjm9VRWGs6ttAPg3EIgd/jxdO/vXzr90GyPtS3yxOkbwNtqzzTmt3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cM5KiAx+l4mjdrafYdkdjuzZ5jj/NFf7nj5VsPPRLAk=;
 b=rBZs/2FBw2Ni1JV8iy+JNuV2FgAhYuQAm2iWvotB8INW3vpSiiExDo1/UpneXSS84JJeNPljX3xGW0S4vEfeoCI87ipQXKvAmMN0UYTQ1nkArtMp+hBQLcG8GtEuXD5pUZ3LtxPlyEj4QFekO6O8piNrkvWNTUOUsrxjd1QyyLY=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH0PR10MB4955.namprd10.prod.outlook.com (2603:10b6:610:c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 10:38:12 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 10:38:12 +0000
From: =?UTF-8?q?=E2=80=9CWilliam=20Roche?= <william.roche@oracle.com>
To: bp@alien8.de, yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: John.Allen@amd.com, jane.chu@oracle.com, william.roche@oracle.com
Subject: [PATCH v3 0/1] AMD VM crashing on deferred memory error injection
Date: Tue, 17 Mar 2026 10:38:09 +0000
Message-ID: <20260317103810.2492661-1-william.roche@oracle.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0008.namprd15.prod.outlook.com
 (2603:10b6:930:14::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH0PR10MB4955:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7e044d-9b1a-462f-b473-08de841149ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZiI4zjCVOCS278nlX1Pf6bNmWfb2TCxOWYLgMIWpXW92fuQE/tsNeC4Q+ARiP7yT6hGc9QooY/uO0kfLBxC6sHpaqx0YsnDzBDGKzzehWSV1z5L62YTiFXBSfWLqZCuBAEyN+7p5e+WVO8RFu052qOQA0wRkjaOvS8ikXhxD76d+i3gYGODIC10/2yIqT7iRR7LR0Fau+tPq0LhItAlN6r2imHJFJqvUCh27UBPRkYH7hQ2LFSPax1CuPacMvZ6F9fAsaNxEXNTFvICjKH3tRLso/7Jk1/yIs29FG1lYLWyF3HS8ho4VNEPmkylFHdEIdHLBJ+CSseXT/5JzN1tV1S7dkDNuAZLpYY0JY0dx1S8NdyWwVKQ0eCs9KqSMPwlMe0wxYp9RDyqFRTfLhj4KB7l5Mx1bZYHmCiC4H8jFstzuG0F9fzFwtPRC81F4jpcfSVUM8JnKrpCaCSnLNsach+YrqluuOgnwfr0jY/pk8Izscx9hQcNtW94v/Tf686+ecrx1TnUj9R9e0sfNf/dHHh5A+s8m2fT7Y3jImqI6VliubiTJqTScNLkio70YJJsQb7llri1ye3nIbCsDXfH4D31YX56GTpAsyLGm4dU5xpAxafN6W4uKb98dkwVJPecpHcW89VDJCu1CgZJ1SJUR23X/Sf+glTcURE63MZY4PIjy+fOfaq/cOncsOXIAfOjJQEQX1zFFFoX9GZkD8oTSP00MgGmps1BJDA9m5U7EvnVZlE37eFeGwhzX3SyhUdrZ5OuArUfLSD1bB2sjihQRvaUngDs/9wCCcqi2AOZXHJQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GEXw4WYgLoxGq5B7p9UQSk6VWvzZPkHTy2yERUiESBQTs4WiEoUhJ7l9VUEp?=
 =?us-ascii?Q?rez7EqnUuL8sBEKEhKZtrfDTWbZcs1RLllunXm1QAWX/vXs0HdJ5hnRg6gDp?=
 =?us-ascii?Q?CYlvBh5QH4J4dqUEdz+ofNKyGd6d5hw26MIPPrBVlK12za8isWkNYSJH01z7?=
 =?us-ascii?Q?x3ZZA9tScva3/QkLYkOhgfNEnrVxxIkiH/p8/TFCBUxbGAXRvFcKvY8CCyHd?=
 =?us-ascii?Q?momvMs/5yvDjJYb4BgiBsEwIObYRGErFb+Io7skZGIb9lR/TTOzXUW5pB+TP?=
 =?us-ascii?Q?BcTQpwo8oLshaA2GIBnJRFSmvCDQ33JM17w78G4/qZTPi6LHysajYq/zY34q?=
 =?us-ascii?Q?ubuLkMZJvp+oSzCsaXmxkGcUZIBbp4VdfZnKOLDOXDyOt1hjvUjwLWkYtlFX?=
 =?us-ascii?Q?yWNc58BWE97W94lilKQ9u37MGJ+U/qSDGsDWZvI374KgRv8nih4DaF72/5O+?=
 =?us-ascii?Q?cCpz32qJVE7rSSggM+iy76PtEmhXBjLarjLcj+FjtGruoS8stiJEfIaCT15K?=
 =?us-ascii?Q?n5/eUzcn23Hc7w+z1ni86ZfQAxAa+b3EdzGX/i4NfS89Zq/VbIWGNUwwYPIt?=
 =?us-ascii?Q?Ep8X0fTOc7JJAUq8OzxpQeDiB1H9vAS+HrCll8bcWc+zji2hlQQicpEkQUYU?=
 =?us-ascii?Q?YbdaVjaG+qPWeD9Xnpg5lPSWRq+q7OuGXWsRX/Wtdozog7UCIpO3OQAjy3+R?=
 =?us-ascii?Q?9ZTiD2aH1rxYEk6yQysBvXCzI/oVJKR0SzwA7Qzuc6q5h0eZY8oIf7/aEgDL?=
 =?us-ascii?Q?l59YqB2QHvfLvHzFFf0LRAwF+eXVM8HSsMEOdKsVhHajRpdpZjONKIuHkMwT?=
 =?us-ascii?Q?M3sTCCqM1OLjNGj4nTP5b+bB/lsh+V6PCzJO5AiCn8QM2XoTTHB9WNhCkuLb?=
 =?us-ascii?Q?rZIOeonFuY2yPj0mPYJuLTJIbWFZZz2v/JrGmGNZrcOvcVki6IB8V5FJydVi?=
 =?us-ascii?Q?FY/KH2n4vFMQ4mkXVkNyfxGb6Y/mp76sygq18kbAmqgCEfuKk/4UAoi5HXqB?=
 =?us-ascii?Q?KsynFtijQQVKRd+bJ4cLVH1hK781pP8ohcI/VIMToG7Vmqr+zT81wxHu6Yn/?=
 =?us-ascii?Q?pIGnCLo+pizKF8xcDTn3ZRob52dw+ZbEPJIBNVL+AsDfRwb5RqmJ/4w1mb57?=
 =?us-ascii?Q?b3UmO9wNOUbNHGcptuc/LgCs9jvqNwcRm5yJg63AOCD92odC7hhv0TFZuHLB?=
 =?us-ascii?Q?OQH84xubK3Sb4G/GgbvtiubeNuFFBJ4ACvwikEgyEq9SspQkFPLs2orjLudL?=
 =?us-ascii?Q?RJwQ6o9JWxgdHc//wGldmAemsTouWM7Ioag/Z3YMDPkBEez9IchB+OR49m+Z?=
 =?us-ascii?Q?MJNhKaO2S/S8XIz6DKM3dFCmybveFRsAU3Gc6tku9bZuobwbAe5uf7zxp6ck?=
 =?us-ascii?Q?olNhxWQNILH5e/Nxww3tyovbw8/rJvaVeiL5t7IA4Rnyc1PcljrkaMFUo/Dl?=
 =?us-ascii?Q?jJr4knXuTiA6C5eY3Dujbv4u3d7YpBwXzLk1enlYB/5ehw5KmiTw745ljxEl?=
 =?us-ascii?Q?u1c7UFtWlYI49aHdLz0p+jZngiYdB+bmGF3PMBf0n37hEHRb/k7Vwdvlw6C4?=
 =?us-ascii?Q?b105dq3comUED5htakdJIsQtR7gHgtFFcF+2OzRQ2+/ZLvp5qdY/iqSwNagP?=
 =?us-ascii?Q?k/9HyKS7nEVwe4yInsrdKYv++bVFBIXtLEru52ESROJaRBkq3+J938osdxbN?=
 =?us-ascii?Q?TcCU2I+O/jqzijPdkh/DgJfMT8NYVnCB5oQvwk/Xw8tb7UOu9VBdr3pUUR0N?=
 =?us-ascii?Q?WcDBY/ioesyFfvjqSoGL2hPo4fC9z4I=3D?=
X-Exchange-RoutingPolicyChecked:
	R8V75SxD4CZrezn7nuCQRSwbE3HJ9VTrsAaPVORxHTceAxkSb6fkVUq9Jr+Mn/BNWwyanYp7ayTed8iVrYhlggazsAjPgEq0kPR8kY0jLRItg5POqJkOqXwNC2Iti9nhS4AjipWqcOkXi9YkVvsKSs7YJ+I7M0Wm2g5LrxqWOsf1LiWtHzzGIcgLctZvt63t1TuOJ+hrr/P+jvbWrLb5/85Tq65jhPDg7SY69F5wlFpyJMu6LEenH7Na/zTLAARVphWplRncM17E1ILAe0gRohQlQvOXVwSGi0nv5JP6wFGicSCfWcjU6P03phKem4v+D75/sgTJLsJq4Z/5FoA+Jw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Bm1mG/krkrYnGUMbw/ygsufs8EfMar5XSXnKIGa9AXmke791VkEqvnfSSVy82ZZZx+fguBMhrGnx/B/rzSr4oDmN4bm9KYWDOfpuk79MDlaod8dxGTboELaLMvWrRHrGZOUMnQ2wQYIiT8wTHHc6NRKxuoRs0916A7drWE8QXF6c0JxNosUWDqhvMsCJ+iq8/WMW0gCQQ+ZggRDAF9FAtoKA36r0twE6zlZzIyeW5tQNyGGAPwzL8c129eqifcUuQYeSOqu2e+6GMu8Yg0ITlHbHbgecYap7Lh5Hosd/21fR8VBRKwdB1DCl4Ud9x3H4vlgcaLODcYCjRUD830yR3Av0pBiBHy2nngRCw47wEJhZ7vH+cTTf7RxwHjaiRUPlA/iQZZaphMhzjKQf0rWY5MZxfpHp4RMGbx8un+qdj8204OiAgnRknT+1PuUcSb4JR8Rx5QPSne9I9JPgEcXTxJa2vwRWYgFJ6utvA5XCIiwDMY5Sxp+o0S8JP4qf4HLRUl4OPB81fHJaaMFdb5PN/7bl0x/O+VzlZbuzy9fyZOvdYxqcbTpLvyy38NUZrow730FExBvh2RTFj+hnTMlgFFOs/fuVIYOLt2ULbg8slc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7e044d-9b1a-462f-b473-08de841149ac
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:38:12.1195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G56ZHWkq1FuuepohK2WdqnRkOxWY8qGnoPt9yU60J+BNV92lL7EL18jbLtQjDt28cP5mwlm5ga2u9RDU3SzTivfTHSos/qj3VewxaSBz2qM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=591 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603170094
X-Authority-Analysis: v=2.4 cv=ftrRpV4f c=1 sm=1 tr=0 ts=69b92f31 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=M51BFTxLslgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=aRKDeX36W-2QJ5zYG78A:9 cc=ntf awl=host:13824
X-Proofpoint-GUID: ZRL1vCr0h69R01RUKftbZqu-hVoKVLcw
X-Proofpoint-ORIG-GUID: ZRL1vCr0h69R01RUKftbZqu-hVoKVLcw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5NCBTYWx0ZWRfXzcOdbm+e5mh+
 oSdOHXj8emLKPvMtZzCt8qkqDoOpTpVAflgqJteQZb/R/F3rbxuB4PqBrK1dzaBJRq+WPg8PF9e
 TiSOYCCzRx3zxANt/W96kN2rLcAVBV0KgewON6RfkajpdKigkRkh0HhVB04FFHnh9EhqGd0Dvhl
 jekCT+EaaAaYZzhtIe2X8ATmMHqdSaZdG3Oy3x7GI9nVgqXT2Wx7CfJRCwSGOkBRqp7ZrjJFr3o
 lwjOfc7UtN89xdo2zS8I897jW5vqyZiYJFsM7XaMx5NIV67gS0v8cXInqGi7pPzOO8JOnb3KpG5
 GFnlEf5oy1LdjJ2QNZxD3GodsATNkzglyG/fIhmr4Si1URXMzsRwFrozUjktNRhZqjT8tG82IYg
 I0jFIBY4fGZX/wg1wKs7hv33BWA5kKLYINuBsS4Q/fhaSTyWh7UAa7r7VaWczDepu6k5YE7t+Hn
 7mkzyDOWDVEdnpp1bBb0EN43JhUXXEjjD0PWCEfY=

From: William Roche <william.roche@oracle.com>

v3 changes:
- Commit title and message changed to put the emphasis on SMCA access
  correctness - Borislav Petkov feedback.

v2 changes:
- Commit title changed to:
  x86/mce/amd: Fix VM crash during deferred error handling
- Commit message with capitalized QEMU and KVM as well as the imperative
  statement suggested by Yazen
- "CC stable" tag placed after "Signed-off-by"
  (The documentation asks for "the sign-off area" without more details)
- blank line added to separate SMCA code block and the update of
  MCA_STATUS.

 --

After the integration of the following commit:
	7cb735d7c0cb x86/mce: Unify AMD DFR handler with MCA Polling

A problem was found with AMD Qemu VM - it started to crash when dealing
with deferred memory error injection with a stack trace like:

mce: MSR access error: WRMSR to 0xc0002098 (tried to write 0x0000000000000000)
at rIP: 0xffffffff8229894d (mce_wrmsrq+0x1d/0x60)

  amd_clear_bank+0x6e/0x70
  machine_check_poll+0x228/0x2e0
  ? __pfx_mce_timer_fn+0x10/0x10
  mce_timer_fn+0xb1/0x130
  ? __pfx_mce_timer_fn+0x10/0x10
  call_timer_fn+0x26/0x120
  __run_timers+0x202/0x290
  run_timer_softirq+0x49/0x100
  handle_softirqs+0xeb/0x2c0
  __irq_exit_rcu+0xda/0x100
  sysvec_apic_timer_interrupt+0x71/0x90
[...]
 Kernel panic - not syncing: MCA architectural violation!

See the discussion at:
https://lore.kernel.org/all/48d8e1c8-1eb9-49cc-8de8-78077f29c203@oracle.com/

We identified a problem with SMCA specific registers access from
non-SMCA platforms like a QEMU/KVM machine.

This patch is checkpatch.pl clean.
Unit test of memory error injection works fine with it.


William Roche (1):
  x86/mce/amd: Guard SMCA DESTAT access on non-SMCA machines

 arch/x86/kernel/cpu/mce/amd.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.47.3

