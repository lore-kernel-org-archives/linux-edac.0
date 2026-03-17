Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2E367F28;
	Tue, 17 Mar 2026 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773743935; cv=fail; b=Mh4rvc2zdsRH8VenThzr8zDIokMDd4J/mtrzC5QvD01w+OgAOXEN0lDzp+yWCKse75VaI0eIiKZyTA2cfxmqEHN6EvjkyhuQWT9UsDrWDp7DQRuF4Kb1OgicSmKdwCYELnGkX1sebptTSSyxj4AVDSuQCQaRCXirWmqPNAR9+D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773743935; c=relaxed/simple;
	bh=WLSadxzFd4ZtdsSe7ok1kyCdV58oAA4gx5l4GPb8pmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fp30NS6ciU09HQq7HdjVUVCddBzPk97r5oceFbQ8wfWAHoaXJ9eDdwkb1wwN6bHOYpCdNAPjlokjVBg9AudVMSUvwQmIyy06B9Sqzz+VwMI/NauV2DJsEnXdH7aCZse4zlT5/K8ih7eeqlpzYOtvHfzSo9sgaUomHl/7Ku5DEME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mfqTiJEg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JtTX3YJS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mfqTiJEg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JtTX3YJS"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GNhOKe1732662;
	Tue, 17 Mar 2026 10:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=gY7x4+syMhjPGgXzM1jkbIAi1YWYwncNu+r1ZZdIqsA=; b=
	mfqTiJEgGnwg10Z3L3dbhf86X2TCAeb+Krjhg4rI5FnfUB00uRFA0pwNcdsP9Itw
	+CpPyBRTcOEJ8iW53riSOxu8w2fMBDkI8KZfCNGwWI7ygrjWJMw97rqyi29khNFp
	seWn3KIrvtTs+HJbG68/kMazlNqpEx9m2PVQIZFJm7hFwcH8kZpnOWs1G3KD3Onf
	GnDT5+lak076fiCa+CeL0rpgYNUq/fTLSuPG+FWcmqzcNrpBFED2l4x+nHz3f7qt
	2Z8YJEM71KWoAudrrFQrZ+yHCk9uxjesikt6uv7NKcG20JlPipxV7AQicBoZbtRr
	qJGh5l5wim/91LCBR/mGlg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxf43ung-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 10:38:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62H92u4C002789;
	Tue, 17 Mar 2026 10:38:34 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4m4ptd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 10:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t61YVmPoW2TfMrDW8IJMSMhPcYD+8OvKga2fQdRY3w2aZ/wYKS6dXPYnQLhQWHX8Ynhfc2ssqp0Rw9V11QaQ0oBbtTc3OpQwPDH1N4DWZEx9hHRfmmI+b0yft0WtEmR+g2cW2Fyri27q1sDmGVGdqM27YI9dNJXcKVF7HxmnTI6Z5oPHXce2ppX1qPRSPCnpwBLPyg9X+Ik972zoWP1hjsZej1TM3cw5qdQXQwYbBdMrBdvA+LNVHCz5eGBM+ZfL6MPvgaEsQoAHPG4Q9BsrSaNM8Dxxy8fXeHWsUJCHo4pm6AM9qSXGowKdFwrBv4lOCJlCTY9otM2xW7/I9KdIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY7x4+syMhjPGgXzM1jkbIAi1YWYwncNu+r1ZZdIqsA=;
 b=vxPGj/4NgTPfcSn6HpJqAMgiehc6KnPctPZccWVKOBdMRENJxeJNazhmcCCWrQQ9azi4Hz+a5X8NA9TscrciD0LCZW3Fzqb82gqf4wp+QLmMdYHcbREB13uIegO4yvZFG+YmYEtaWRgBDTgzyJImk+GqPdMxXxYjTNvSkwpLMN5PyCP6Yqivsd/NowlpWFFKN+rkidl+F1prTe24hECkI484QK2fedVt0nqe4o0OEZK3nGWA7RoZK81OR8ohR4IL12bjBgH1MwZ5VaV+Hso40hxao6UfCcPHkKPiKNTNsdZXc+iTbCzJ2mWiePrbVNK9BNPed5xzxdP6qbyLi+vTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY7x4+syMhjPGgXzM1jkbIAi1YWYwncNu+r1ZZdIqsA=;
 b=JtTX3YJS6HnWMtpEvQKXrJoz5P0WzECkcwaEwtXHdVZoytOJlylRGax0SjavnlkxQbFrI3LAflB0RrTa/zJDVNlh5Aag52yaiTGWEsbBVUq14tBe78VLPtjbzVZez51TlgcBm1Hu62AQe/IHit0r3k4LcaPkARJ3Szn9ClZdkuU=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH3PPF8C8C3D129.namprd10.prod.outlook.com (2603:10b6:518:1::7b6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 10:38:14 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 10:38:14 +0000
From: =?UTF-8?q?=E2=80=9CWilliam=20Roche?= <william.roche@oracle.com>
To: bp@alien8.de, yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: John.Allen@amd.com, jane.chu@oracle.com, william.roche@oracle.com
Subject: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA machines
Date: Tue, 17 Mar 2026 10:38:10 +0000
Message-ID: <20260317103810.2492661-2-william.roche@oracle.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317103810.2492661-1-william.roche@oracle.com>
References: <20260317103810.2492661-1-william.roche@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0065.namprd22.prod.outlook.com
 (2603:10b6:930:80::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH3PPF8C8C3D129:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d50e6bb-74ed-4743-c0f5-08de84114ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9MVMpiSsfM9f+zWdxxVwxJllEs51p8o5Ruuuvd8XikIhZlerDeqf3LbKnT/lqJXhQRGz/ES0sEaV9ma5gZPJbnWOSdqVjZuoY5lt7oOaFpPXGx5QsRKWm0pzxXUdZNpf011LfNPRwq9/pYMsIYtppZ3NnGFbIgbrOvgGX+a8foagW02nG0Zs0z69ULvVCaxafqvd56eTGO/VfrxS/By5Q2GfjsEfDz3BxIxhq0q1tePumqvR67BC57pFdT6klUOu+Bkd+Oah13pL47Fs28e76n3E5MHQXNGiwZL+Vev77pMSmpOteK2eWFenzZLrxB6M9nxnPQqo29wZ6ArLl47/mmveIliWDzCyz8rm6F/9EO4ScGKN3duDZ2paJoiHEbcN4KHygRANS2JAh5i26A+h+i2jyI/++SPcYTs1XLJCpMnyBnlryBtNJYkf9yLV3BZbBOPNJg0x3RdMdxLACVopp5iunwqn+pZejrgxROfPDvQ2b2vVaLA6ejFPDnJSLc5VVCZxiFPNTAYKLTR13c0NV88X3OW0gOcGiqQ680bioeED46ZY6uRh3EAqHWCHxcOWBYd78KEFwam1AZIOOfzELTAyhuDQwzEz1fz5l2gNtirCliFjKHkNMkGtGEWGTFAKUbRiOUIMvKB7ddWCOaLTvLnQFybSJOJlCBHLdcFisC36Wryc8v9ze6G9TYNkS3olzCCvWD87AlGsrTLFlGR2+/fM2VV3aPafjyHFQ2XJGcFBF43jHt4vIZYlPycVZJ5MVkPDC2qTS2D9L/TEGUYd1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yJnb/lPIs0CaoNSWEVw5FNylDcC3+PTgM/wFnHdUWmR1zpbkvzO+rVcl9a6p?=
 =?us-ascii?Q?BCJn7dR1uF6Jj2RDB8p0Q4nhJnZWxT6QzxLDDfvuvEF1DTPm4/ljOM0Xm/Km?=
 =?us-ascii?Q?erRzh1zRCScdn9+n6NJgtAcaNVSFt/OZSEHPfiWU1jg/TMWYts3jEVAa/Vr4?=
 =?us-ascii?Q?Q/ebALthSWP7ujMJN685hYoWVst8d1FguqA2sHojRJOeYrPkpud39xZEtmIm?=
 =?us-ascii?Q?eBmOzMfqi7gR/TKoFuTwKoDZD+naL2az0U3YgP2q+MiUPECOVXUqfTo0Ixwj?=
 =?us-ascii?Q?g7oPPILrDjgEG1urKF6ocK0XMOwBN2a68PqOfJWbdyJBf7oDH/F6VAKVUlmh?=
 =?us-ascii?Q?ZFuJeciniIRLty2QCrPgb5Ehh/JEfJ9FjjAyV2k31K520LZJdAh9/rGqJv6W?=
 =?us-ascii?Q?PVlh59iyugMZTPUQhp3XqIxX0ek62zAqL9K3rpsr8RJI8N5Dotm/584bs3H3?=
 =?us-ascii?Q?VIXqGzqKn3JQ8nIRiv3xDGnQKKGcl3Hxn8FfGbrE+J4WPdQrzwoHmc9l8mKI?=
 =?us-ascii?Q?/aBOUxLA0Lq2Czi719hXZ0/hGbZ8F7Kuhei/bp69aiCIP2tfnxOC7E0fQnKN?=
 =?us-ascii?Q?jDOhiJf/Sqt/+v+SWmWa5PGDY5nxiCdELg3M71vwDDfCPy/D1Mwzw39Elvlf?=
 =?us-ascii?Q?wVM4R3JlvuoFhJOxKSPbp4bv8iNpb+s+UgMBoxdGCjEqrCLkZ6qJ0ZvkchFK?=
 =?us-ascii?Q?2phEJUV5HV58mi9AGUIQhWfepqOzzRxJ6cKgjxdsbB82Qs9VeDoXREZKX25s?=
 =?us-ascii?Q?LVx6juYibnNc8bm0/XmE+CUSakifXfVj/UVDq1F2bvPNb00RxfN9NzIowA4Q?=
 =?us-ascii?Q?8t/UX7aG3HblHkDlcWy5AhUr6I7mqe9HCKicLKHdMd3EzIywqWPoz3fd63wM?=
 =?us-ascii?Q?N43+oXpkExyNzJ6Thi8ObxUfjVL4kR4XCCykEkuRjtnJ4yA/YcP0CPe/JieM?=
 =?us-ascii?Q?gjSGL7W5zhr7NdgGugm4euY5bc2cert7ewKGtB2R5ZjwBoYm/QaTlg6yGbyZ?=
 =?us-ascii?Q?bZiur05eShFYuvnPQ0DVuIIp6c89WTn/W+giNWJfKAtM/4ykAu1H+IN/iQKH?=
 =?us-ascii?Q?bFsb2d2dZJw4eeY7DXmPVjw8TSirkvQW+n6K9neN2ic2CqluYl/xgD8SNDQ/?=
 =?us-ascii?Q?kkmfNnPlKq3LhJtVvehc1K227vu/avfC9oxUYZypY3y5vWcqBin7PealgH+N?=
 =?us-ascii?Q?3Oz79wWFFJ3TOME0QWEozzLIGSB5mtKt5ouyxrEEh8pKS6hiMpzSagJMWvr1?=
 =?us-ascii?Q?XcKb+Kkmjo6jYTtlptYnqHpIcX7TCLY/6eYGVXBs0GSV8Gx/t4Qgp7dVBBqB?=
 =?us-ascii?Q?HsR++Rg10CHltdHP+ucnjMJlPbxOS4mqu2gGZJs+E420ErsOmw7MUXI9Wl8N?=
 =?us-ascii?Q?tINInR+5MuAu+cVBR+hXWqAJPed81OT6ietoNjUBY2Lz+kwpdiLBvB6w91qv?=
 =?us-ascii?Q?OM8wgQselnaV6oqiYSZvzvEpU/pJbJ/cq6HIQrLqpQtV2bKyhcrftkii6Ahm?=
 =?us-ascii?Q?ZjQiv90bnz5UfdtnEfXrH3n3imbSDRDDT8LBo8keoS2Ytw777b+l1RMQV9Ke?=
 =?us-ascii?Q?dCuSq+mfwB0meEP3XIe7VdiOwyAzdeVer6BVMvYIpVE0sxH9JJke9EXHGoPm?=
 =?us-ascii?Q?0gIauNOH40E5HXwcj4wX285VZfdXMhR7pAT/SENpZEIrzfarh6tzAQDCzxYB?=
 =?us-ascii?Q?t4aWQQbn6oCoPIvnWnUXRh8GfHCBqFN/H48P05hkvD4hkBlZgL++st3bHd7k?=
 =?us-ascii?Q?oQuhqGmqYaygEHCksSlthPDQ+mPz2+U=3D?=
X-Exchange-RoutingPolicyChecked:
	kBWyyBf9G32oGKQopXPOtsfnWiDySsr0TnQX58NW9X0Sn8XIj0U0hig0Pb5b+UD7JaNrc3/biBWwHV6takL9pLqXEZjJHfk7bZX5poy5OZlts7gaNrfU0sfJiTs8QCEGaoX3PPM3ZScm0WF/hI8pd3YrXQMLnT15++khGbtk1zW1lnBjGFHKQs2B4O6oDjkbsaPaLAbrsCECyCkvn5+15xzX3N1tM/++HL3egJBA25WzbtuvTs0tcqbpR497lWbwUNglBU6I4px+7tHxvXwHZLCulBu2/42zEdYR10b0keiT+bSYK60BSHx37OlUbaxd3U2TsisF/44n1Sm3feV0mQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OPwl3UskQPgx1mIlDwe79KcWyJZJjyiCzb51+HkWddSxba91co25YLvpNlkoQ4yVIS2otFZcUFnmVEWL9gJAlaCxZ8h2SQblemopjHaTiDGGINrLeW29ObQqQrX/p9OcGpTVchFhdmc2czcfsvW62IGDeyXTZDSz/7wxdpGERB7Gk3Tyji/f6MFlUK/4f1O/PNoIY/HxiFwzQUp6nG9AP/08nBySiUjGIzubE259DJ2IdYgEtrA/FSBCxTw0uPsDXzwMO/7Ke24HDuytgG3Nk1ysulB9NR+k5xKtAP9Gx2dAKePPUsV9nP2aD/jW3V9Ez8U+cB7/1QXHM0J5InjWFLwzz2J9HqjBuQnMRwUmdwIfOAlIrjDJzz/hi0YZRek8+MroyYw4v9wllVDvedhOTNzWCUdicy9ebdPS0gRPl27wUrBA16OAifg0B4CtcEFgJ9qTffP3deFtAg3ltXmIJcuN8s6SZxROaLhfquGsFj0Xj1SjS9JTAfCThqxfE3fXgP/AFzk5mz56JdWSybZd3OFDKYVu+mR7KBHQm1KDPVtATDC8lBOocAm+Rmr0KCef+KoxVKSZPADiPpa1SK0lDKPeZdIDOWHcQo857GjaonY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d50e6bb-74ed-4743-c0f5-08de84114ad0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:38:13.9777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg0XjEZVEfEg+0dxDoBfSVV+cfemxNx3onxiGIe4qaw8vwLuSIH2t2J954E+71qkUANcpLTV4XjwrslhpdF0DnH3OIZLtJnQRVawQhuD2W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8C8C3D129
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603170094
X-Authority-Analysis: v=2.4 cv=ftrRpV4f c=1 sm=1 tr=0 ts=69b92f2b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=M51BFTxLslgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=zd2uoN0lAAAA:8 a=VwQbUJbxAAAA:8 a=iTMFhNADrNtSWR6WIKEA:9 cc=ntf
 awl=host:12272
X-Proofpoint-GUID: hAxAS_jne5p8AC-Cs7EjFlhW26uZtACK
X-Proofpoint-ORIG-GUID: hAxAS_jne5p8AC-Cs7EjFlhW26uZtACK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA5NCBTYWx0ZWRfXwAGuvr4+ljxU
 FtYODV6YKzEEULiwWjx6vGh8uJVtMh2odzj2IU+IOzhaUnz70D2S4u1YMGMZFSMqjfUCQQaxqJE
 d3XS9X6oPECZUNjBWI/gN3844oUFZG83pML3NvHvcTV5+Xsp01GLoRLMaZMQMTaDnJ+1zDjLvDj
 KA1s/8R0L1zJjGWroSmLey29SqdGiVVxsUhMtGw8ssMw7MTOikGuXKplLT65yxd0qp7cJMIk5Bv
 RGXFfAXFf46PNZItTIQeGowbAFsDNBr9CH2bSqOzTtWxYE5EGTUDAbYb+kRgLyD8rBHYyzarGWO
 hKfFTaoaCvyjj0hUHiQl2J41n9ypGPZHzHvu5NY8mRfcSXyyjKvH1iyBYJX7NcOOt0B4g7ly05N
 Mf0Vye4wa6SpzcFdE1SmtQmcQoKZfi3RJOe68DzacBx3e46lgnkGvoHgm+AsRUsFL0PV3SLXiy7
 SKoE4Qk4f8soALpapOphzztCT8umwv0VqOsiq3sw=

From: William Roche <william.roche@oracle.com>

Access to SMCA specific registers like MCA_DESTAT should only be done
after having checked the smca bit. Avoiding a non-SMCA machine (like
AMD QEMU/KVM VMs) crash during deferred error handling.

Fixes: 7cb735d7c0cb ("x86/mce: Unify AMD DFR handler with MCA Polling")
Signed-off-by: William Roche <william.roche@oracle.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: stable@vger.kernel.org
---
 arch/x86/kernel/cpu/mce/amd.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/amd.c b/arch/x86/kernel/cpu/mce/amd.c
index da13c1e37f87..a030ee4cecc2 100644
--- a/arch/x86/kernel/cpu/mce/amd.c
+++ b/arch/x86/kernel/cpu/mce/amd.c
@@ -875,13 +875,18 @@ void amd_clear_bank(struct mce *m)
 {
 	amd_reset_thr_limit(m->bank);
 
-	/* Clear MCA_DESTAT for all deferred errors even those logged in MCA_STATUS. */
-	if (m->status & MCI_STATUS_DEFERRED)
-		mce_wrmsrq(MSR_AMD64_SMCA_MCx_DESTAT(m->bank), 0);
+	if (mce_flags.smca) {
+		/*
+		 * Clear MCA_DESTAT for all deferred errors even those
+		 * logged in MCA_STATUS.
+		 */
+		if (m->status & MCI_STATUS_DEFERRED)
+			mce_wrmsrq(MSR_AMD64_SMCA_MCx_DESTAT(m->bank), 0);
 
-	/* Don't clear MCA_STATUS if MCA_DESTAT was used exclusively. */
-	if (m->kflags & MCE_CHECK_DFR_REGS)
-		return;
+		/* Don't clear MCA_STATUS if MCA_DESTAT was used exclusively. */
+		if (m->kflags & MCE_CHECK_DFR_REGS)
+			return;
+	}
 
 	mce_wrmsrq(mca_msr_reg(m->bank, MCA_STATUS), 0);
 }
-- 
2.47.3

