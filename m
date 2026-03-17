Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E65F31B131;
	Tue, 17 Mar 2026 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773784585; cv=fail; b=jM+7aqM+3ZJtmxmjNgzrBz8Om2ubpgc/iPEYZjdOEQKonDt2Avkd+jSOOmo18Kc+/esMq0sip1Jo3GGFd0aZcdOSpdiOL0owQN71XLl/FufcZtxOPT9JzrMfPmtXKlgy/wc4XLyplu7WMbPhzD+72nuLtesfuSvMMEUznn/rO58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773784585; c=relaxed/simple;
	bh=oDHWVkvEycOErA0rPyjJGB51ALXKriSsiRMREgmGyJk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ijBOoG7bQGWji9iaDm/jCOJVdwQXc+cGCFhXUPNw4lMvuyZFnkne5rdHdShA26n5kEA6DnOjW1xM8b6xzYRvx/UrfBnSh4UmhO+eXS/tyyZRprfK9hwNpK/mjzJovbOtTNpfOIwaFAbvl0bdw+lwL87QqfS1ww/9bNuu3SgKhsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KGBEviDt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vkpfr8D0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KGBEviDt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vkpfr8D0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIuAfr316510;
	Tue, 17 Mar 2026 21:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=sgBsG15a1ltBsSzxsHu439lOPapSieu1WuzmKpbF2q8=; b=
	KGBEviDt+7Br9L3lSlTSeDM4BPNisrYfQc1iYdpHULC/+ZWysx3wRLE+8LMzVWb/
	BkcnDTRp/IjQcyLSW9I27LtMdWbYhFfdrO/ERD/mo2BvdzBtWqWuScd9s6olLPE3
	010M6rY6T7bCQw8TGL60WBPmUuW0kXoMrNOJepJGwQQIURNqTKAxYdZFNHm+7Zlb
	0e5zCgOXeM68PSM24kJB6BXautad4dbHEwsufDQhOjpgXyxmJPm8owN9RFo0fGhl
	8yVM1NxHCO+AnIiLdlifi+GQoUrG03qfuq2g+7Jvj1sRziF1aNdWGrvUXOuWC3/l
	7EXigto6slp0I0Ne3sXfZg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvx8x53rr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 21:56:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62HJmkWk017796;
	Tue, 17 Mar 2026 21:56:05 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4nabq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 21:56:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpFeQgwBWquzmAd8HBFRVMlpVcVzskTVuuSPQJeqgG300wYJfyBJFKoOO6/J2UqypWnZTTyBVxPiP2PJqkeQbglZ5l+0g26yLSEbZxzS5mprWcK5s7xuqz3jdomNtrpIbIxf7hOdAIKiXtjuO+V/yfMZAUDWBOmLNcW8It3TOST7MRswZgII/V2iek8ScMA/fEoen4R6warrrSYDEFTmsx97SRjHJXz6ls0QRWz6pj+jIc3VmwLkM9EvOTpUQH9ezBVaRaDUfCjDuYuWHQwy0+lIqaEa43ouhJ5F0W3qRy1Lm4EDgfDaLgERBQbzt4ySP2tT2JIfLWC3I+Zc2x6fkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgBsG15a1ltBsSzxsHu439lOPapSieu1WuzmKpbF2q8=;
 b=oZwTqd7QQB4dTs2/++2/rKAP2G27G1+eJc1ExrngmQMiK+UoxBHc2wd0/+mAxtyoVxQoq+7xGL66izo0ynVXi4rYhwAgN0JJRnrT+fa++CREZKL0G+jacLF5NicCwoYVn7+WFif/kFtE/qNskNSl0c21TVgiZUU3uj5umN1+DAQ/Hvzla66mXUN3T8htWXI6b670L9v1s+2sRK02+45lRwHRW23wc9w9up0ZdsAw2D6APkLDxj2Ou87w0U3YsVCjS1nJqwIGNKVsxYg2/VQEu8wlxCW2HfQfbTwWc9oJdtG7heG64A5hLsW1wgm1tnxjX0PDisx0NZP4Pod6+/SpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgBsG15a1ltBsSzxsHu439lOPapSieu1WuzmKpbF2q8=;
 b=vkpfr8D0mWu8kp66gqb9eNiC1ap8OdKpi1J5CtwiMe6HJs6dRuQGODFkIB+up9auDDOUj4hG9QUWqaWmyOlWX58vRH9tDgibFfAkrMoPm36g1kEcxsnXcSXZlhE9izSKGuwQrkyJygXeWdfybu3ttt/0/JFcrGUXDfdk+tV3ybE=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DS3PR10MB997751.namprd10.prod.outlook.com (2603:10b6:8:344::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 21:52:55 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 21:52:55 +0000
Message-ID: <34ffc43b-bb11-49a7-8c64-3f4abc0d4bb3@oracle.com>
Date: Tue, 17 Mar 2026 22:52:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] x86/mce/amd: Guard SMCA DESTAT access on non-SMCA
 machines
To: Borislav Petkov <bp@alien8.de>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, tglx@kernel.org,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, John.Allen@amd.com, jane.chu@oracle.com
References: <20260317103810.2492661-1-william.roche@oracle.com>
 <20260317103810.2492661-2-william.roche@oracle.com>
 <20260317133247.GAablX_1ECCF-CKgjJ@fat_crate.local>
 <1c7f33c5-b1f2-4af3-ae82-37723a89cc96@oracle.com>
 <20260317181731.GDabmau8-FycDqbzZ4@fat_crate.local>
 <6b62becb-f323-47d9-97d1-b1f8c7da41f4@oracle.com>
 <20260317202414.GGabm4bu6rDjVcspDH@fat_crate.local>
Content-Language: en-US
From: William Roche <william.roche@oracle.com>
In-Reply-To: <20260317202414.GGabm4bu6rDjVcspDH@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::15) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-edac@vger.kernel.org
List-Id: <linux-edac.vger.kernel.org>
List-Subscribe: <mailto:linux-edac+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-edac+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DS3PR10MB997751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0289e7-bc6d-4f7b-6604-08de846f8b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 MWDl+kHG1StdBfFE0IWRqmiU0wjI+ymWlU0A//IYtCEzBpENuAsUmUen0Gm11DlVmI/6rwnn6SNtgUsb8FlG39/wI4jgjoneA1YPUB+9DKYI93yEpt0X/10pX0WHIRRTc2gOHYtEx0nC0n6p4bDumOwBOz3i7PTzCDfZHu/1/wcfAJ4Qse5kTaGhV4/UIIv9SVU7tM4/wKHluvFLIC2lVh4Sjg2PGI+eGcA1j3Z3HVWrhGech24U4g8CCT8ErMXa/JV7m6L70ddlPJFVhaM+3zmuizFJHJ/dYIohK0x/96WKdsy2LUQ8lXJUZ4gBj0Xkk+xBZxvWM8Ml2ynouedR1tMmBFkAdUVaRRlCULLRus+vUWQzb7QZ7pjDNsRVyR80WaK9CQI5Z2bZgXNRP/CSU9AcVsor5y80hfXueXsRDxUnftSR085pmhzp7hVmEAgtul4DSeW4vSV0mNEV1Z+0vFUs7E+DlBujO/PYTl2IWRL+xdL8DaBxLzRoYWW7aOV4YK/qhMRnnOS7lSxWR8Se6CUlx7xSK2s9OkIWCNu/R11IZ1u0kfqmRDd0a0o5Q+cK8cUzXmCXdWFVyV7FcsKKbItQcsE54sim7GGDddEVvaHG5o+rLiPetO1ccvnCxsQnj7AZrCEeRXoysHkcQErODEUOkqmPAiHgzNipdMPYVLMCKsUEFJvH8NPZRikBeZo68zOKO8tQ/ZXo8yOynz92Dlv9MeFHidYNiCF33Z4QscM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Z2lKSjIxbk1KcExINlkwbm9FeHpJMS9iTXkwZDZaaDJ4emFxZUdUT2hFMVRR?=
 =?utf-8?B?NnRUUi9UZm9OeVArNXc5SUcxL1ZKdThaSE12ZkduNVNqaE5LVVJvVnFKQmx0?=
 =?utf-8?B?ZXhnT1Fid0NnNUlXc0ZZM09YL01YVUkyMmZSZnZEdFNWcmFMYmV3TlZzZ3ho?=
 =?utf-8?B?OEZMdmE5dFhqZ1I3RU5KTXNBTldYMFhvM0lJZ3Y5R0phT0pFNkNrYUVWQzBH?=
 =?utf-8?B?dGQ3WllBcmFOMmZpZ3JTZkRXb2pBR1ZvNmRYa0V5aDJqVUVmdGtTNnhxeWI0?=
 =?utf-8?B?SHBsUWxlc1B4RWlxMkUrVVVDMURZNDh3OWFWRC82dWRDZVRMMnI2em1UeFMz?=
 =?utf-8?B?OWU2MDBGQm84SE83cEZwQjJzYitGczZMdFg4MUI1OGtHTUNubDhlaU1GNCtS?=
 =?utf-8?B?NVV3bi9vNHNOdTArS0xwbnhJWFRhYUsvNWdCZnJZK3B5ZHMwVmpWUHArQVJi?=
 =?utf-8?B?U0tXQllINUpZdm01UlNLL1VEWHdNOU45eG5velZ0T3RQZ0tONkV0VTBLYmYx?=
 =?utf-8?B?OXNGclovWTVRQS94S3FiZWhrZzBJNklrQzUvZk1EbWE5eXFVQmo5aDZWMzV6?=
 =?utf-8?B?T2tMbVpEUzNURnAxelorUWF0WWp3RWFzeHZ5cnFIV3c0ZzBGTmkvbDluSmxm?=
 =?utf-8?B?MnZzSy90bWtXUU1yYXMwQnhEdnJhS3lpWFpJbFhzWFpNRHJRZzRHL3Y2U25C?=
 =?utf-8?B?K24vekE3VlIvL3A5MDN0UWFzWnNQb0dHZzY5KzNJb2g3OS9yemZ6cHdhdzV5?=
 =?utf-8?B?VXJIYXpOTWVKN3grRWhid0dxTVVqd2V2dEdIU0tSUml5R3Y1YWZFc0MrSnlS?=
 =?utf-8?B?eVZTaW5UejVvTW5FdzJqaTRSZ0RUZU1rYmJCTmhqUGYxeEc3SnF3OVp2ZmxS?=
 =?utf-8?B?TTcwUmMvL1p0WnBzL1FDcXpYS0QrVjZTQ1MrdjJGeXczYVdzY3ZFM1RrRURw?=
 =?utf-8?B?amh3OFRvZVFNT2s3RXZMeCtZNnpqVjFFSUg1L1psRFRyRm5hd3FYcmhGaDgx?=
 =?utf-8?B?TzZLbG9uendCZk4yeXlFcFFJUExMcFFoNzlQTEpyZzViU3VEQTlJRjVyZE5J?=
 =?utf-8?B?TEFtOHF1aUJ4M0VZdXZ2YnRYWXFFakRZcjBPY1NnclhUMS81ekowdTg1MkdR?=
 =?utf-8?B?T2w0eGhBRXZ5U1d0N1g5ejRrTXJnMmgvdVR1Y1MwcjNOcjEyK04zMEpqemtj?=
 =?utf-8?B?RmFyZStsbGdadFJXNnlPdnZyVU9rMURYREVtZkJVRGVTUVBjTVgvem1YZUhz?=
 =?utf-8?B?T3lsdFhPTHlRLzBxQ2tQSDY0c1lLZ2dsT2V0RUdEb3hCUjRDMlVyRGlsRjcv?=
 =?utf-8?B?TS9TNnhrM2VGRGltYUw4VDRNTFFTbWNFZFJicHpSekNmMTE0TFdoVjcza01M?=
 =?utf-8?B?WTlKMHdkaUUraytDaEw2NkxFVlRRd2FRSDJWaWtmNlp4SkR0djE2RzhIVmpI?=
 =?utf-8?B?OCs0MUR4VUt1R2ZIYmpZMGJVd2lOUjBrWGFKVVZkMjNUSFh6QVJIRVFZY1Mv?=
 =?utf-8?B?TlRTUEY5NmZ0YXh3TGJMQjRVSlRTTnRKTWJobkdsekRaMXgrY0drcFQvdm9Y?=
 =?utf-8?B?SHFjSGppZDc5eGhNWFFpT2ZPeWhoaUhhT3hRcUtZcVFHZGVjMkp0YzRIZnJu?=
 =?utf-8?B?MFdHUWtidTZGc2U3SS9uSC9Ed2d3dzRhRDJmRlZ2RFV2NDZyNllCM2t6RXZT?=
 =?utf-8?B?KzM1U1hTQ1YvUTdKTWgvRFNrWjl0R0plL1lFZllhK3kyeEw5Q2VoNFg4QVM2?=
 =?utf-8?B?dXZGRTFOVThuZmpaSi9xRk82akFJQXNHVkIxbldHT2FHc0dJaUNINzJjOWtl?=
 =?utf-8?B?YXI0dlBjQTNLOWlGWkppb3RsSXFTb0FrNEloSHlhdXVHd256UkQwN1FiQkta?=
 =?utf-8?B?Y2hsTStJeWorU3RYazR0cWxPTGdlMHBjWmdCeGFObEV3TTMySVpzNFQ5Z1Zx?=
 =?utf-8?B?ZGY2dkV6eUFKOUxicGVrbjZ4UlA4aGh1bUp6OWp4Z3FsUVBpSXhRdElOK0xF?=
 =?utf-8?B?dk1LUlJyUENiSlgxdDNvR0JrSW8raTB4WVdQbk1VVGduRU56Zi91SXZUSE9Q?=
 =?utf-8?B?UGFLS3BTUmgwdHNSMURGSHFLVUFPTXVNZk1HY2V2VCtpWVAzUEFINTRMYU9U?=
 =?utf-8?B?MmRTYTBtYUZqcUZacWhSVVFRSU50S25LQ2c0OGNtci9vYzE5cWJENzJmSURk?=
 =?utf-8?B?K1VpLy9QQm50bmRXK0grMTFsVUJ3TDdEOERabE1sVEoySXZVb0ljNDNuQ0Zp?=
 =?utf-8?B?MGNNYmpWVzM5V0FPQjNPd2JMcm12RkJ0MnAxKzN3Q1hTNU9zK1Y0UVJSM0E4?=
 =?utf-8?B?SktZVG43L3R2M2JOVzNxK252dEVZbUVqdDllVTNhKzZkeGlOdjRWZUduSmNE?=
 =?utf-8?Q?SuD93Ufif0ftrl84=3D?=
X-Exchange-RoutingPolicyChecked:
 gEYfT9LdcM5fvxx27fH7Usb3118mEd0VEKRn/K1f6RkWyNR1fBQPPBd1ckb9V5OWT0jHdU5A+PXiZXpR1whemOEUytsIIEGLettkUPUDAiE1Bofwtqs0O7EL9IPHG1NmWpuQyaIuU0YvHVM2QGLaIvBqguu/uHD+Odvv4YgXma7AUs4+6uM2kByEVUsSIvjwCjNTqx5X3B/8WqgAqhjqweEZ62EInbQ31rJPYNqYdh1yBuBQk920CRZp8kk/IB4qJ5BwH66OpryInP4UKfNKXHnqcK10g1Ouk9b+rVEqgTMCZgeh81sKU9zxwg3sCw5ckP6SyMoGTywudroR+79b8A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 bDa2pi5kIhd1jFIQByevNPGncBCOTk7yFNOQY23XHq+OqQY/GAcMv6pBitCgUawcvhdyZ78CCK75UOk8sX266JTYm+QdQwRwG/hcJH9g4VslxZy92V1052ft9naD0r2ARHy7mO9fF7sJAQXovc/ifpQ4eUJgLhAdXlwsfyZy0QHaxp26gakWexHJIySVy5iND87uN61C6d6lY1UKQ1OwzL5RqNoIbmxI08XeUpmHvA+NPRn/JZTmgEa09J6WfYn3UjzUrkhqzabRyKfnywFej3Ilp8E/Llmf/RYCq0bcX2CrvTiyD0ip46oiQwjTj7OyRs0trkBz+3+AB/xPV3hh38B/I1cvHFmoGtZ4mfO63gbw3jbVg8zNJxWd6Y8mb3+YuJDN8qGkwRLaGIbWiIrz/XBy3x29SnAyD9Z9f2Z0l4RZrhIuBRoBSK2/oLg/cJq8EJeiy2WJ/QvsT+UF0XEqwCRaU3CUhtiXMLcQFvgS/P7iLO7b3ZXzSAUO9ObgrY0WNkk6Lxoxrg9OfrspA8yOnhiPdrmreC2ThF1cTylcFc5HDB/GwXgpA4ynIa7LW2yrkuvU/kIgNQSCK3+iVZ6nfXjr9+eSbxL/es9EFSbqW0U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0289e7-bc6d-4f7b-6604-08de846f8b86
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 21:52:55.3881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThU57ga1/FiYBC08jtefEvaSk34zhR10snnTldx6p/O8ESn9TpHbe4NN26mXMObbZUWOISSpInb7xGYOrDFRq+6N3lwMjZveau+j/+dqZk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR10MB997751
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603170193
X-Proofpoint-GUID: LKCWt0ZHT7eETakZMlc_165Q4CQbAKUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE5MyBTYWx0ZWRfX3Vd3kiPn6mOw
 lWEQFQgGARYzFKedn0kB7E/m6v8eRSRSOL2zS5Iae2RdQMwQqSUrPUN1Z72T16HGNne4DNBR5CN
 BiiP1Ju8gZpUmvUTX3gSoY+49CFTzsPjalxxe1VTVBv1kjlJK0S/zr+m/YRfCXjvn/QW4p8Y+jC
 B9ufO/rEKIfP0YxxgU60NClBGp2X8Zpn1rjJabganFQszJzlnkkKels77mUCqNakFaFP0MnRcAI
 qehUnt4iMSYLcf2s9ZS9isDgWyq8DYJ1BnIGtGCWE4l4bbkjw55lQQ2xAJHPqEifE4zd7OLkDfx
 iteLNVY4V6vOphMv5r8+s2qfNpFnnP/95eWVCfJKsKUTIPV7LMzYJYOgc9b1NKdGyr3H+InLFJJ
 9H4wJPd9fC4h1hfKX7+SjIbrNrftLJOL9+4KE+neR/6sgZxpmniXnHw+WeV00TPSi8pPCr+7fSc
 VlPBoS/de2YSOsu5gnUiM6BaUT3zvLjIgGnh7fBY=
X-Authority-Analysis: v=2.4 cv=dJmrWeZb c=1 sm=1 tr=0 ts=69b9cdf6 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=Qk927tvJiWUFPpYgdN0A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12273
X-Proofpoint-ORIG-GUID: LKCWt0ZHT7eETakZMlc_165Q4CQbAKUF

On 3/17/26 21:24, Borislav Petkov wrote:
> On Tue, Mar 17, 2026 at 09:06:54PM +0100, William Roche wrote:
>> Relaying the error to the guest doesn't only have a value to target a VM
>> process but also deal with free memory or clean file cache memory impacted
>> etc... Cases where a memory error may not crash the kernel can benefit to
>> the VM too
> 
> I don't understand - what do you mean with "free memory or clean file cache
> memory"?

The physical address of an uncorrected memory error (if/when it can be 
identified) can give a chance to a kernel reaction depending on the 
state (and type) of the impacted memory -- as implemented in 
mm/memory-failure.c with error_states[], me_pagecache_clean() or 
try_memory_failure()...

The Kernel can try to "deal" with the error. The process case (with its 
SIGBUS) is probably the most common one, but a few kernel memory pages 
impacted by a memory error could be isolated (poisoned) without 
requiring a kernel crash. Free memory pages or clean page cache pages 
could be an example of that, they are poisoned and should not be used by 
the system after that. The kernel can also return EIO error on poisoned 
page cache failed access attempt, etc...

These mechanisms are implemented for the bare-metal running kernel, but 
what is really interesting when relaying the error to a VM is that its 
kernel can, in some cases, also benefit from these mechanisms. And 
having a chance (even small) to avoid a VM crash is a significant gain 
for virtualized workload.

Just giving my point of view on why we care about VM relayed memory 
errors :)

William.
